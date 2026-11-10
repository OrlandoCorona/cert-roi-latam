# App Streamlit

Dashboard web público del proyecto. Lee los CSVs exportados en `data/processed/` y los muestra en 4 secciones: resumen, demanda, vacantes con mención y catálogo.

## Ejecutar local

```powershell
cd app
pip install -r requirements.txt
streamlit run streamlit_app.py
```

## Generar los CSVs que lee el app

Desde la raíz del repo, con SQL Server local corriendo y la base `cert_roi_latam` poblada:

```powershell
python -m scripts.export_csv
```

Esto genera tres archivos en `data/processed/`:

- `kpis_v2.csv`
- `demanda_v2.csv`
- `detalle_v2.csv`

El catálogo `certificaciones_base.csv` ya está versionado en el repo.

## Deploy

Streamlit Community Cloud lee directo del repo de GitHub. El entry point es `app/streamlit_app.py` y las dependencias están en `app/requirements.txt`.
