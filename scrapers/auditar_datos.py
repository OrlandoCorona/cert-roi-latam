"""Auditoria local y de solo lectura: python -m scrapers.auditar_datos."""
import json
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def auditar(root=ROOT):
    ids = Counter()
    resumen = []
    problemas = Counter()
    campos_salario = Counter()
    for archivo in sorted((root / 'data/raw/getonboard').glob('*.json')):
        datos = json.loads(archivo.read_text(encoding='utf-8'))
        vacantes = datos['vacantes']
        resumen.append({'archivo': archivo.name, 'registros': len(vacantes)})
        if datos.get('total_vacantes') != len(vacantes):
            problemas['total_declarado_incorrecto'] += 1
        for vacante in vacantes:
            if vacante.get('id'):
                ids[vacante['id']] += 1
            else:
                problemas['sin_id'] += 1
            attrs = vacante.get('attributes', {})
            if not attrs.get('title'):
                problemas['sin_titulo'] += 1
            if not vacante.get('links', {}).get('public_url'):
                problemas['sin_url'] += 1
            if not attrs.get('_enriched', {}).get('company_name'):
                problemas['sin_empresa_enriquecida'] += 1
            if attrs.get('min_salary') is not None or attrs.get('max_salary') is not None:
                problemas['registros_con_salario'] += 1
                for clave in attrs:
                    if any(x in clave.lower() for x in ('salary', 'currency', 'period')):
                        campos_salario[clave] += 1
    return {
        'archivos': resumen,
        'registros': sum(x['registros'] for x in resumen),
        'vacantes_unicas_por_id': len(ids),
        'apariciones_repetidas': sum(ids.values()) - len(ids),
        'observaciones': dict(problemas),
        'campos_salario_presentes': dict(campos_salario),
        'nota': 'Los conteos son del snapshot local; no acreditan carga en SQL Server. Repeticiones entre roles requieren conservar la relacion N:N.',
    }


if __name__ == '__main__':
    print(json.dumps(auditar(), ensure_ascii=True, indent=2))
