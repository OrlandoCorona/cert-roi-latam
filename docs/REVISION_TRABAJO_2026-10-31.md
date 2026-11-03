# Revision del trabajo y continuidad
Fecha: 31 de octubre de 2026.

## Dictamen
Las correcciones de calidad del detector, texto y formula ROI estaban justificadas. El seguimiento y la integracion con Power BI fueron incompletos: se trato parte del trabajo previo como pendiente y se anadieron vistas v2 sin terminar de adaptar el modelo existente. No se debe reiniciar el proyecto ni publicar las conclusiones antiguas.

## Evidencia revisada
- Historial Proyectos de datos SQL y Power BI(1).md: 10,674 lineas; se revisaron el inicio y el tramo final de Power BI (lineas 10,200-10,674), junto con el resumen aportado por el usuario. No se afirma haber auditado cada linea del historial.
- Git diff de 05, 07 y 09; generadores y detector Python; SQL 11-17 y pruebas del detector.
- Inspeccion de solo lectura del ZIP ROI.pbix en OneDrive/Documentos: cuatro objetos cardVisual, pagina 1920x1080, referencias de medidas en vw_pbi_cert_roi; diagrama con las cuatro vistas originales. No se modifico el archivo.
- Resultados SQL observados durante la sesion anterior. En esta revision no se repitieron migraciones ni se volvieron a cargar vacantes.

## Que conservar y que actualizar

| Elemento | Ya existia | Accion correcta |
|---|---|---|
| SQL Server y conexion VS Code | Si | Reutilizar ORLANDOCORONA/cert_roi_latam_local |
| 656 vacantes y catalogo de 28 | Si | Conservar; auditar sin recargar todo |
| 4 vistas originales y relaciones | Si | Migrar referencias de forma coordinada |
| 7 medidas DAX | Confirmadas por historial | Editar las existentes, no duplicarlas |
| 4 tarjetas KPI | Confirmadas en PBIX | Conservar objetos y diseno; actualizar sus fuentes |
| Detector v2 | Correccion nueva | Conservar version anterior para comparar y revisar falsos positivos |
| Salarios de origen y escenario ROI | Correccion nueva | Conservar; completar evidencia y consumo en Power BI |

## Medidas: plan de migracion sobre objetos existentes
Aplicar solo despues de verificar los nombres de tablas cargadas en el modelo abierto. Mantener las medidas en su tabla original evita perder las referencias de las cuatro tarjetas; no borrar esa tabla antes de mover sus medidas de forma controlada.

```dax
Total Certs = COUNTROWS(vw_pbi_demanda_v2)
Vacantes Analizadas = MAX(vw_pbi_kpis_v2[total_vacantes])
Vacantes con Cert = MAX(vw_pbi_kpis_v2[vacantes_con_cert])
% Mercado con Cert = DIVIDE([Vacantes con Cert], [Vacantes Analizadas])
ROI Promedio = AVERAGE(vw_pbi_roi_escenario_v2[roi_fraccion])
Mejor ROI = MAX(vw_pbi_roi_escenario_v2[roi_fraccion])
Inversión Promedio MXN = AVERAGE(vw_pbi_roi_escenario_v2[inversion_total_mxn])
```

Los dos indicadores ROI se deben rotular como escenarios; formatear su fraccion como porcentaje, sin multiplicar otra vez por 100. No interpretar promedio o maximo del escenario como certificacion con mayor retorno real.

Relacion de demanda[cert_id] (1) a detalle[cert_id] (*), filtro unico. KPIs globales desconectados. Verificar la estrategia de filtros para ROI y salarios antes de agregar relaciones; evitar rutas ambiguas. No sumar vacantes de distintas certificaciones para estimar empleos unicos.

## Cambios que deben mantenerse
- Deseable no equivale a requerida: la muestra aportada contenia contradicciones explicitas.
- AWS Solutions Architect Professional no identifica AWS Associate; las menciones genericas requieren etiqueta ambigua.
- La moneda no se deduce del pais de la empresa. Se preservaron importes y respaldo; no hay salarios mensuales validados todavia.
- El sueldo completo no es beneficio incremental de una certificacion. ROI neto = (aumento mensual * horizonte - inversion) / inversion.
- El 5.8% corregido corresponde a 38/656 y al catalogo analizado; no es una estimacion representativa de LATAM ni de Mexico.

## Limites y pendientes de la correccion
- Version antigua y nueva coexisten: vw_pbi_kpis y vw_pbi_vacantes_cert siguen basadas en fact_vacante_cert; vw_cert_roi ahora usa demanda v2. Mezclarlas produce cifras inconsistentes. Migrar todo el consumo, no solo cargar mas tablas.
- Los escenarios no validan los costos del catalogo ni sus fuentes. El incremento 0 es un valor inicial, no una prediccion.
- Las siete pruebas del detector cubren ejemplos; falta un conjunto etiquetado manualmente y evaluar precision/recobrado.
- 07 ya no se puede ejecutar antes de sus dependencias v2; falta documentar un flujo limpio de instalacion y migraciones.
- El generador de salarios inserta ausentes y conserva existentes; no actualiza cambios de importes ni esta integrado automaticamente al importador.
- El rol de primera carga no resuelve las multiples busquedas/roles de una misma vacante.

## Entregas y publicaciones
- LinkedIn e Indeed: lectura autenticada confirmada en el navegador integrado. No se confirmo guardado del proyecto en LinkedIn; Indeed no se modifico.
- Cuatro CV localizados y descargados para trabajo. No se han editado ni reemplazado; mantener formato, estructura y dos paginas al incorporar el proyecto.
- Dashboard publico, capturas finales y push del codigo corregido: pendientes de verificacion y finalizacion.

## Siguiente paso concreto
Retomar ROI.pbix existente y reconciliar sus cambios abiertos con la copia guardada. Actualizar sus medidas y relaciones; validar 656/38/5.8%/28. Luego terminar visuales y continuar CV y perfiles con las mismas cifras y limitaciones. No usar el titular anterior de PMP como unica cert con demanda real ni su ROI 301x.
