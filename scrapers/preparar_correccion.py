"""Genera una migracion revisable desde los JSON, sin conectarse a SQL Server."""
import json
from pathlib import Path
from scrapers.detector import detectar

ROOT = Path(__file__).resolve().parents[1]


def literal(value):
    return "N'" + str(value).replace("'", "''") + "'"


def main():
    jobs = {}
    for path in sorted((ROOT / 'data/raw/getonboard').glob('*.json')):
        for job in json.loads(path.read_text(encoding='utf-8'))['vacantes']:
            url = job.get('links', {}).get('public_url')
            if url:
                jobs.setdefault(url, job)
    sql = ["""USE cert_roi_latam;
SET XACT_ABORT ON;
BEGIN TRANSACTION;
-- Copia persistente del texto previo; no se sobreescribe al repetir.
IF OBJECT_ID('dbo.respaldo_texto_v1','U') IS NULL
 SELECT vacante_id,titulo,descripcion INTO dbo.respaldo_texto_v1 FROM dbo.fact_vacantes;
IF OBJECT_ID('dbo.cert_evidencia_v2','U') IS NULL
 CREATE TABLE dbo.cert_evidencia_v2 (
 vacante_id BIGINT NOT NULL, codigo VARCHAR(50) NOT NULL,
 alias NVARCHAR(200) NOT NULL, estado VARCHAR(30) NOT NULL,
 precision VARCHAR(30) NOT NULL, evidencia NVARCHAR(MAX) NOT NULL);
-- Se conserva fact_vacante_cert como resultado historico para comparar.
"""]
    total = 0
    for url, job in jobs.items():
        a = job['attributes']
        html = ''.join('<h3>' + label + '</h3>' + (a.get(key) or '') for key, label in
                       [('description', a.get('description_headline') or 'Perfil'),
                        ('functions', 'Funciones'), ('desirable', 'Deseable'), ('benefits', 'Beneficios')])
        # Desirable se clasifica por campo fuente, incluso si hay HTML intermedio.
        hits = []
        for key in ('description', 'functions', 'desirable', 'benefits'):
            fragment = a.get(key) or ''
            if key == 'description':
                fragment = '<h3>' + (a.get('description_headline') or 'Perfil') + '</h3>' + fragment
            for hit in detectar(fragment):
                if key == 'desirable' and hit['estado'] != 'alternativa':
                    hit['estado'] = 'deseable'
                hits.append(hit)
        where = 'url_vacante=' + literal(url) + " AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')"
        sql.append('UPDATE dbo.fact_vacantes SET titulo=' + literal(a['title']) + ', descripcion=' + literal(html) + ' WHERE ' + where + ';')
        sql.append('DELETE e FROM dbo.cert_evidencia_v2 e JOIN dbo.fact_vacantes v ON v.vacante_id=e.vacante_id WHERE ' + where + ';')
        for h in hits:
            sql.append('INSERT dbo.cert_evidencia_v2 SELECT vacante_id,' + ','.join(literal(h[k]) for k in ('codigo','alias','estado','precision','evidencia')) + ' FROM dbo.fact_vacantes WHERE ' + where + ';')
        total += len(hits)
    sql.append("""COMMIT;
GO
CREATE OR ALTER VIEW dbo.vw_vacante_cert_v2 AS
SELECT e.vacante_id, c.cert_id, e.codigo,
 CASE WHEN COUNT(DISTINCT e.estado)=1 THEN MIN(e.estado) ELSE 'revisar' END AS estado,
 COUNT(*) AS menciones
FROM dbo.cert_evidencia_v2 e
JOIN dbo.dim_certificacion c ON c.codigo=e.codigo
WHERE e.precision='exacta'
GROUP BY e.vacante_id,c.cert_id,e.codigo;
GO
SELECT COUNT(DISTINCT vacante_id) AS vacantes_v2,COUNT(*) AS relaciones_v2 FROM dbo.vw_vacante_cert_v2;
SELECT precision,estado,COUNT(*) AS evidencias FROM dbo.cert_evidencia_v2 GROUP BY precision,estado;
""")
    destino = ROOT / 'sql/11_reprocesar_detector_v2.sql'
    destino.write_text('\n'.join(sql), encoding='utf-8-sig')
    print(f'{len(jobs)} URLs; {total} evidencias. Generado: {destino.name}')


if __name__ == '__main__':
    main()
