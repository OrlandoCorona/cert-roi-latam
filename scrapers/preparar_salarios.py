"""Recupera importes originales, sin inferir periodo ni moneda por pais."""
import json
from pathlib import Path
from decimal import Decimal

ROOT = Path(__file__).resolve().parents[1]


def numero(value):
    if value is None:
        return 'NULL'
    n = Decimal(str(value))
    if not n.is_finite() or n < 0:
        raise ValueError('Salario invalido')
    return str(n)


def main():
    jobs = {}
    for p in sorted((ROOT / 'data/raw/getonboard').glob('*.json')):
        for j in json.loads(p.read_text(encoding='utf-8'))['vacantes']:
            url = j.get('links', {}).get('public_url')
            if url:
                jobs.setdefault(url, j['attributes'])
    sql = ["""USE cert_roi_latam;
SET XACT_ABORT ON;
BEGIN TRANSACTION;
IF OBJECT_ID('dbo.respaldo_salarios_v1','U') IS NULL
 SELECT vacante_id,salario_min_mxn,salario_max_mxn,salario_medio_mxn,salario_raw
 INTO dbo.respaldo_salarios_v1 FROM dbo.fact_vacantes;
IF OBJECT_ID('dbo.salario_origen_v2','U') IS NULL
 CREATE TABLE dbo.salario_origen_v2(vacante_id BIGINT PRIMARY KEY,
 minimo_usd DECIMAL(14,2),maximo_usd DECIMAL(14,2),
 periodo VARCHAR(30) NOT NULL DEFAULT 'por_verificar',
 fuente NVARCHAR(500) NOT NULL);
"""]
    for url, a in jobs.items():
        lo, hi = numero(a.get('min_salary')), numero(a.get('max_salary'))
        if lo != 'NULL' and hi != 'NULL' and Decimal(lo) > Decimal(hi):
            raise ValueError('Rango invertido: ' + url)
        where = "url_vacante=N'" + url.replace("'", "''") + "' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')"
        sql.append(f"""INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,{lo},{hi},N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE {where}
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',{lo},N'; max=',{hi}) WHERE {where};""")
    sql.append('COMMIT;\nGO\n')
    (ROOT / 'sql/14_salarios_origen_v2.sql').write_text('\n'.join(sql), encoding='utf-8-sig')
    print(f'{len(jobs)} vacantes preparadas')


if __name__ == '__main__':
    main()
