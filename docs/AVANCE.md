# Estado reconciliado - 31 de octubre de 2026

Este documento reemplaza el diagnostico preliminar que quedo desactualizado. No iniciar de nuevo la instalacion, la carga de 656 vacantes ni las cuatro tarjetas existentes.

## Trabajo previo confirmado

- Servidor ORLANDOCORONA, instancia predeterminada MSSQLSERVER, base cert_roi_latam; perfil de VS Code cert_roi_latam_local.
- Carga existente mediante SQL OPENROWSET + OPENJSON; Python apoya la extraccion y ahora la depuracion. No atribuir toda la carga a Python.
- Repositorio https://github.com/OrlandoCorona/cert-roi-latam.
- Power BI existente: %USERPROFILE%\OneDrive\Documentos\ROI.pbix. El archivo guardado inspeccionado tiene cuatro tarjetas en Pagina 1, con referencias a medidas de vw_pbi_cert_roi. Su diagrama contiene las cuatro vistas originales. Fecha de modificacion mostrada por el equipo: 29/10/2026 23:38:21. No representa necesariamente cambios abiertos sin guardar u otra copia.
- El historial exportado documenta siete medidas DAX y la relacion codigo -> cert_codigo. Las cuatro medidas usadas por tarjetas se confirmaron en las definiciones del PBIX; las formulas de las siete proceden del historial, no de una extraccion actual del modelo comprimido.

## Correcciones aplicadas y verificadas en la sesion anterior

- Se conservaron 656 vacantes y 28 certificaciones. La carga del universo no se repitio desde cero.
- Texto: respaldo_texto_v1; recuperacion desde JSON y correccion UTF-8 del importador, sin truncar la descripcion a 8000 caracteres.
- Detector v2: evidencia por contexto, limites de palabras y separacion de alias ambiguos. Resultado verificado en SQL: 38 vacantes, 49 relaciones (41 deseables, 6 alternativas, 2 sin especificar). Resultado anterior conservado en fact_vacante_cert: 44 vacantes y 58 relaciones.
- Salarios: respaldo_salarios_v1 con 656 filas; 230 vacantes con importes originales USD y 426 sin salario. Se retiraron conversiones MXN basadas en pais; periodo pendiente de acreditar.
- ROI: escenario de beneficio incremental neto / inversion. Parametros ilustrativos: TC 20, costo/hora 100, incremento mensual 0, horizonte 36 meses, extras 0. Con ese escenario inicial ROI=-100%; no es un resultado observado del mercado.
- Validacion: siete pruebas unitarias del detector. En SQL se verifico la formula de escenario sobre las 28 filas del catalogo con incremento 1000 y se revirtio a 0. Esto no equivale a 28 casos independientes ni valida precios, causalidad o precision estadistica.

## Rectificaciones del seguimiento

- Era incorrecto seguir listando conexion e instalacion como pendientes despues de validar SQL desde VS Code.
- No encontrar PBIX dentro del repositorio no significaba que no existiera. Se debio localizar la ruta conocida antes de proponer construir el dashboard.
- Las vistas v2 son una capa de correccion y trazabilidad; se agregaron sin terminar la migracion de medidas, relaciones y visuales existentes. No crear otra vez las siete medidas ni las cuatro tarjetas.
- El Markdown revisado contiene al final las medidas y tarjetas. No hay evidencia de exportacion incompleta de esa parte.
- 6.7% y 5.8% describen esta muestra y este catalogo, no todo el mercado LATAM/Mexico. V2 es mas conservador, pero no un etiquetado humano exhaustivo.
- 12 anuncios de PMP no establecen por si mismos una muestra estadisticamente valida ni que sea la unica certificacion con demanda real. El antiguo ROI 301x no es retorno atribuible demostrado.

## Pendientes reales, en orden

1. Inspeccionar el Power BI abierto, localizar los cambios v2 sin guardar y conservar una copia antes de migrar. Actualizar las medidas existentes y sus relaciones al mismo conjunto v2. Ver docs/REVISION_TRABAJO_2026-10-31.md.
2. Verificar tarjetas 656, 38, 5.8%, 28; preservar sus objetos y continuar diseno, barras de demanda y detalle. ROI en pagina de escenarios con supuestos visibles.
3. Guardar PBIX actualizado y revisar filtros; no darlo por terminado o publicado mientras falten estas comprobaciones.
4. Completar reproducibilidad: 07 ahora depende de 11/13/14/15; no recomendar ejecutar todo en orden numerico. SQLQuery1.sql existe y es destructivo: no ejecutarlo sobre la base de trabajo. Automatizar la actualizacion de salario_origen_v2 y unificar catalogos de alias; el importador no alimenta esa tabla por si solo.
5. Verificar periodo salarial, costos y fuentes. Conservar la ambiguedad del detector y el problema de multiples roles por vacante como limitaciones.
6. Actualizar los cuatro CV sin redisenarlos; aun no se han entregado versiones editadas. Publicar solo afirmaciones verificadas. LinkedIn: formulario preparado previamente, guardado no confirmado. Indeed: sin cambios confirmados.
7. Acceso al navegador integrado comprobado en esta revision: LinkedIn e Indeed muestran sesiones iniciadas. Esto acredita lectura, no garantiza que una futura edicion no encuentre controles de seguridad.
8. Documentar metodologia y hallazgos, terminar README, revisar cambios antes de commit/push y publicar Power BI Service cuando el informe este validado. No hay publicacion ni push de estas correcciones confirmados.


## Integracion del informe: 31 octubre, segunda revision

- Respaldo de ROI.pbix creado en Temp/ROI_antes_integracion_v2_20261031.pbix (107476 bytes).
- La copia guardada abierta en Power BI muestra cuatro tablas originales y tarjetas 656 / 44 / 6.7% / 28. No se ha confirmado que las V2 esten guardadas en otro informe o ventana.
- Corregido el archivo sql/09_vistas_powerbi.sql para que KPIs, detalle y roles usen vw_vacante_cert_v2, conservando los nombres de tablas y columnas del modelo. La obligatoriedad desconocida queda NULL. El costo MXN procede del escenario, no de la conversion antigua del catalogo.
- Este ultimo cambio de 09 ESTA PREPARADO, NO EJECUTADO. sql/18_validar_integracion_powerbi.sql comprueba la equivalencia entre vistas originales migradas y V2 sin modificar datos.
- El control de interfaz no pudo restaurar VS Code minimizado; el dialogo Power Query rechazo la entrada automatizada al pertenecer al proceso WebView2. La conexion directa por memoria compartida tambien fallo. No se cambiaron configuraciones de seguridad ni servicios.
- ROI.pbix no se ha guardado ni actualizado durante esta revision. Falta aplicar 09, validar 18, refrescar el informe y editar las medidas de escenario.


## Ejecucion confirmada desde VS Code, 31 octubre

Se aplico 09_vistas_powerbi.sql usando cert_roi_latam_local en ORLANDOCORONA / cert_roi_latam. Resultado: cert_roi 28 filas, vacantes_cert 49, kpis 1, roles 12. Se ejecuto 18_validar_integracion_powerbi.sql: la primera comprobacion devuelve 656 vacantes, 38 con certificacion, 28 certificaciones, 49 relaciones, 5.7926829268292686 por ciento y coherencia_kpis OK. Las consultas EXCEPT mostradas no tienen filas visibles; queda pendiente inspeccionar los controles inferiores completos antes de afirmar que todos pasaron.

Esto reemplaza el estado anterior de 09 preparado pero no ejecutado. Las cuatro vistas originales ya consumen la demanda corregida; no es necesario recrear las cuatro tarjetas para actualizar los KPIs. El archivo 09 ahora especifica USE cert_roi_latam para evitar aplicar futuras ejecuciones en otra base.

Power BI: ambas ventanas ROI siguen sin ofrecer estado accesible a la herramienta. No se confirma actualizacion ni guardado del PBIX. Respetar la indicacion del usuario: usar Origenes recientes para reutilizar la conexion, no iniciar el asistente Obtener datos > SQL Server. El refresco de las cuatro vistas existentes debe mostrar 656 / 38 / 5.8% / 28. Las medidas ROI deben migrarse explicitamente al escenario V2; el ROI antiguo permanece vacio a proposito.


## LinkedIn: proyecto guardado y verificado

El 31 de octubre se guardo la entrada Certificaciones Tech en LATAM | SQL Server, Power BI y Python, marcada como proyecto en desarrollo. Se verifico su presencia y descripcion completa en https://www.linkedin.com/in/carlos-orlando-meneses-corona-da/details/projects/ . Incluye 656 vacantes, 28 certificaciones, 38 vacantes detectadas, 49 relaciones y 5.8% de la muestra; aclara que el informe sigue en actualizacion/publicacion y que ROI es un escenario. No se publico un post en el feed. Indeed: sesion autenticada y perfil accesible; actualizacion pendiente. CV y PBIX siguen pendientes de edicion/verificacion.
