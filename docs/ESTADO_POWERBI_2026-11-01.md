# Power BI: validacion del modelo abierto, 1 noviembre 2026

## Aplicado en el modelo abierto

- Conexion directa al motor local del informe ROI, puerto descubierto desde su archivo msmdsrv.port.txt. No se modifico el binario PBIX.
- Cuatro consultas originales conservadas, con Sql.Database ORLANDOCORONA / cert_roi_latam y CreateNavigationProperties=false.
- Incorporadas vw_pbi_salarios_v2 (656 filas) y vw_pbi_roi_escenario_v2 (28 filas).
- Conservadas las siete medidas existentes. ROI Promedio y Mejor ROI apuntan a roi_fraccion del escenario y tienen formato porcentual; Inversion Promedio MXN usa la inversion del escenario.
- Relacion ROI_por_cert: escenario cert_id (muchos) -> catalogo cert_id (uno), unidireccional.
- Relacion Salario_por_vacante: detalle vacante_id (muchos) -> salarios vacante_id (uno), unidireccional. No se promedia salario sobre las relaciones de certificaciones.
- Refresco completo del modelo mediante TOM completado sin error.

## Evidencia DAX sobre el modelo vivo

Vacantes 656; con certificacion 38; fraccion 0.0579268292682927; certificaciones 28; detalle 49; salarios 656; con importes 230; escenarios 28; ROI Promedio -1 (-100%); recuperaciones vacias. Filtrar codigo AWS_CLF devuelve dos relaciones de vacantes y una fila de escenario.

La comprobacion del filtro se repitio con un lector de filas porque DataTable.Load produjo un error de restricciones del cliente; el lector devolvio 2 y 1. No fue un fallo de relacion del modelo.

## Respaldos

- Copia original sin modificar: %USERPROFILE%\AppData\Local\Temp\ROI_antes_refresco_20261101.pbix (107476 bytes).
- Metadatos del modelo anterior: %USERPROFILE%\AppData\Local\Temp\ROI_modelo_antes_20261101.json.
- Metadatos completos del modelo corregido: powerbi/modelo_v2.bim. No incluye las paginas/visuales ni sustituye el guardado del PBIX.

## Bloqueo pendiente: no afirmar que el PBIX esta guardado

El archivo %USERPROFILE%\OneDrive\Documentos\ROI.pbix sigue con fecha 29/10/2026 y 107476 bytes. La interfaz conserva un cuadro Cargar/Evaluando superpuesto a Consulta de base de datos nativa y muestra cambios de consultas pendientes. La consulta nativa pendiente es SELECT * FROM dbo.vw_pbi_cert_roi, introducida durante el diagnostico; no es necesaria para la version corregida de las fuentes del modelo. Las solicitudes automatizadas de cancelar/cerrar ese dialogo y guardar no han cambiado su estado visible. No terminar ni reiniciar Power BI mientras el modelo corregido solo este en memoria. No afirmar que las tarjetas visibles ya cambiaron: siguen mostrando 44 y 6.7% en la ultima captura.

Siguiente accion: resolver ese cuadro de interfaz, conservar el modelo corregido respaldado, verificar que Power Query no sobrescriba los cambios externos, guardar mediante Power BI y confirmar cambio de fecha y tarjetas 656/38/5.8%/28. Luego completar visuales de demanda/escenario y publicacion. El informe todavia tiene una pagina con cuatro tarjetas: no es un dashboard finalizado.

## Otros pendientes

Los cuatro CV actualizados existen en .cv-work/output; esta sesion no modifico esos PDF ni confirma su entrega previa. LinkedIn fue guardado segun el registro anterior, sin nueva verificacion en esta sesion. Indeed, OCC y Computrabajo siguen pendientes. La inspeccion del navegador integrado disponible aqui devuelve cero pestanas; no acredita acceso a esas sesiones.
