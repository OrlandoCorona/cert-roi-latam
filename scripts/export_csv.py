"""Exporta las vistas v2 a data/processed: python -m scripts.export_csv."""
from pathlib import Path

import pandas as pd

from scrapers.db import get_engine

DESTINO = Path(__file__).resolve().parents[1] / "data" / "processed"

VISTAS = {
    "kpis_v2.csv": "SELECT * FROM dbo.vw_pbi_kpis_v2",
    "demanda_v2.csv": "SELECT * FROM dbo.vw_pbi_demanda_v2 ORDER BY vacantes_con_cert DESC, codigo",
    "detalle_v2.csv": "SELECT * FROM dbo.vw_pbi_detalle_v2 ORDER BY codigo, vacante_id",
}


def main() -> None:
    DESTINO.mkdir(parents=True, exist_ok=True)
    engine = get_engine()
    for archivo, consulta in VISTAS.items():
        df = pd.read_sql(consulta, engine)
        df.to_csv(DESTINO / archivo, index=False, encoding="utf-8")
        print(f"{archivo}: {len(df)} filas")


if __name__ == "__main__":
    main()
