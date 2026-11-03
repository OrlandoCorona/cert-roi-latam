# Power BI: salarios y ROI v2

Conservar las vistas v2 de demanda, detalle y KPIs ya cargadas.

1. Agregar desde SQL Server ORLANDOCORONA, base cert_roi_latam: dbo.vw_pbi_salarios_v2 y dbo.vw_pbi_roi_escenario_v2. Cerrar y aplicar; actualizar.
2. Salarios: mostrar minimo_usd y maximo_usd como USD brutos, junto a periodo y calidad_salario. No etiquetarlos como mensuales: el JSON no acredita el periodo. salario_medio_mensual_usd queda vacio hasta verificarlo. Hay 230 vacantes con importes y 426 sin salario. Relacionar salarios[vacante_id] (uno) con detalle[vacante_id] (muchos), filtro unidireccional. No promediar sobre detalle, que repite empleos por certificacion.
3. ROI: usar inversion_total_mxn, beneficio_neto_mxn, roi_fraccion y recuperacion_meses. Formatear roi_fraccion como porcentaje SIN multiplicar por 100. Titular la pagina Escenario de ROI y mostrar parametros y nota. Combinar ROI con demanda por cert_id en Power Query, o mantener una tabla independiente usando sus propios campos de certificacion.
4. Parametros en dbo.roi_parametros_v2 (id=1): TC 20 MXN/USD, 100 MXN/hora, incremento mensual 0, horizonte 36 meses, extras 0. Son supuestos editables, no cotizaciones ni aumentos observados. Cambiar SQL requiere actualizar Power BI: no son segmentadores interactivos. Costos y horas del catalogo no se han contrastado con precios vigentes.
5. ROI = (incremento mensual * meses - inversion) / inversion. Recuperacion = inversion / incremento mensual, solo con ambos positivos. Con incremento 0 e inversion positiva, ROI=-100% y recuperacion vacia. Inversion cero o desconocida deja ROI vacio.

Migracion: sql/16_aplicar_salarios_roi.sql incluye 05, 14 y 15. Respaldo de importes previos en dbo.respaldo_salarios_v1. Las conversiones MXN por pais quedaron vacias. La vista antigua vw_cert_roi deja salarios y ROI no sustentados vacios; las fuentes globales se conservan.

Para nuevos snapshots ejecutar scrapers/preparar_salarios.py y aplicar 14. El importador conserva texto USD pero no alimenta por si solo salario_origen_v2. El generador preserva registros existentes y no sobreescribe validaciones de periodo.

Control: 656 vacantes, 38 con certificaciones exactas, 49 relaciones y 28 certificaciones. Usar DISTINCTCOUNT(vacante_id), no contar relaciones como empleos. Pendiente verificar periodo salarial, costos vigentes y visuales del PBIX. La demanda observada no demuestra un aumento salarial causado por certificarse.
