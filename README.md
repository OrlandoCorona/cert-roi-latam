# Tracker de certificaciones tech en LATAM

Analicé 656 ofertas de empleo tech publicadas en GetOnBoard para ver cuáles certificaciones aparecen de verdad en la descripción de las vacantes, cuánto cuesta prepararlas y en cuánto tiempo se podría recuperar esa inversión bajo distintos escenarios de aumento salarial.

El proyecto combina SQL Server (modelo relacional y vistas), Python (scrapers y detector) y Power BI (dashboard interactivo de 5 páginas).

## Lo que encontré en la muestra

- **656 vacantes únicas** descargadas el 28 de octubre de 2026
- **28 certificaciones** en el catálogo propio (AWS, Azure, GCP, PMI, Cisco, CompTIA, Scrum, ISC2 y otras)
- **38 vacantes mencionan al menos una cert** (5.8% de la muestra)
- **49 relaciones vacante–cert** (algunas vacantes mencionan varias certificaciones)
- Las más mencionadas: **PMP (11)**, **CISSP (5)**, **GCP Professional Data Engineer (5)**, **CompTIA Security+ (4)**, **AZ-104 (3)**, **CCNA (3)**
- 10 certificaciones del catálogo no aparecen en ninguna vacante de la muestra (varias de Coursera y Tableau)
- 230 vacantes publican rango salarial en USD; en 426 el salario no está publicado o el periodo no es claro

**El 5.8% describe esta muestra, no todo el mercado tech de LATAM.** GetOnBoard tiene mucho más peso en Chile (331 vacantes) y en roles 100% remoto (270) que en otros países. Los conteos sirven para ordenar prioridades, no para tomarlos como estadística poblacional.

## El dashboard

El archivo `ROI_Diseno.pbip` (Power BI) tiene 5 páginas:

1. **Demanda de certificaciones** — ranking de certificaciones mencionadas en las vacantes
2. **Costos** — inversión total por certificación: costo del examen más tiempo de estudio valuado a 100 MXN/h
3. **Salarios publicados** — cobertura y rangos de salarios declarados por las ofertas
4. **Recuperación de inversión** — simulador: eliges un aumento mensual supuesto y el dashboard te dice en cuántos meses se recupera por cada cert
5. **Metodología** — fuente, reglas del detector, modelo de ROI y limitaciones del análisis

El modelo ROI es un **escenario parametrizado**, no un retorno observado. La fórmula es:

```
ROI = (aumento_mensual * horizonte - inversion_total) / inversion_total
Inversion = costo_examen_USD * TC + horas_estudio * costo_hora + extras
```

Parámetros editables en SQL (tabla `roi_parametros_v2`): tipo de cambio 20 MXN/USD, costo del tiempo de estudio 100 MXN/hora, horizonte 36 meses. Son supuestos, no cotizaciones.

## Stack

- **SQL Server 2025 Developer Edition** — base de datos `cert_roi_latam`, instancia local
- **Power BI Desktop** — modelo semántico sobre vistas SQL, 5 páginas
- **Python 3.12** — scrapers, detector v2 y utilidades (pyodbc, requests, beautifulsoup4, playwright)
- **VS Code** con la extensión mssql para ejecutar los `.sql`

## Estructura del repo

```
cert-roi-latam/
├── sql/                    # 18 scripts SQL numerados
├── scrapers/               # Scraper de GetOnBoard, detector v2 y utilidades Python
├── tests/                  # Pruebas unitarias del detector (7 casos)
├── powerbi/                # modelo_v2.bim (metadatos del modelo) y guías
├── docs/                   # Documentación de avance, decisiones y correcciones
├── data/                   # Carpetas raw/ y processed/ (JSONs locales)
├── notebooks/              # Reservado para análisis exploratorio
└── requirements.txt        # Dependencias Python
```

## Cómo reproducir

1. Crear la base `cert_roi_latam` en SQL Server local.
2. Instalar dependencias Python:
   ```powershell
   python -m venv venv
   .\venv\Scripts\pip install -r requirements.txt
   ```
3. Ejecutar los scripts SQL en orden desde VS Code (perfil mssql):
   - `02` a `04`: catálogo de certificaciones y datos semilla
   - `05`: procedimiento para cargar JSON de GetOnBoard
   - `06`: detector v1 (base original, se conserva para comparación)
   - `08`: cargar las 656 vacantes
   - `10`: validación de datos (solo lectura)
   - `11` a `18`: capa v2 (detector corregido, salarios de origen, escenario ROI, validaciones)
   - **No ejecutar `SQLQuery1.sql`** — es destructivo y queda como referencia
   - `07` y `09` dependen de las vistas v2, ejecutarlos después de `11-15`
4. Correr las pruebas del detector:
   ```powershell
   python -m unittest discover -s tests -v
   ```
5. Abrir `ROI_Diseno.pbip` en Power BI Desktop. El modelo apunta a la base local vía Direct Query sobre las vistas `vw_pbi_*`.

Más detalle en [docs/AVANCE.md](docs/AVANCE.md) y [powerbi/GUIA.md](powerbi/GUIA.md).

## Limitaciones

- Un portal (GetOnBoard) no es toda LATAM. La muestra tiene sesgo hacia Chile y vacantes 100% remoto.
- 11 vacantes que mencionan PMP no permiten inferir "la cert más demandada en LATAM". Son el ranking de esta muestra, nada más.
- El aumento mensual del simulador es supuesto, no un valor observado. En la realidad el incremento salarial atribuible a una certificación varía por rol, empresa, antigüedad y país.
- Los salarios publicados en GetOnBoard no siempre aclaran si son mensuales, por hora o anuales. El modelo los deja fuera del cálculo cuando el periodo no está verificado.
- El detector v2 es heurístico, con 7 pruebas unitarias. No reemplaza una revisión manual exhaustiva de precisión y cobertura.
- La inversión total no incluye impuestos, descuento financiero ni probabilidad de que el aumento ocurra.

## Autor

**Orlando Meneses Corona**
Analista de datos — Tlaxcala, México

- LinkedIn: [carlos-orlando-meneses-corona-da](https://www.linkedin.com/in/carlos-orlando-meneses-corona-da/)
- Email: menesescoronacarlosorlando@gmail.com
- GitHub: [@OrlandoCorona](https://github.com/OrlandoCorona)

## Licencia

MIT — ver [LICENSE](LICENSE).
