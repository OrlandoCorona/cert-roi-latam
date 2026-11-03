# Aplicar correccion v2

El detector es heuristico: conserva evidencia y separa las menciones ambiguas. Los alias generales de AWS Solutions Architect y Azure Data Engineer ya no acreditan un nivel concreto. Los demas alias del catalogo aun requieren revision de precision.

1. Abrir en SSMS `sql/05_sp_cargar_json_getonboard.sql` y ejecutarlo para actualizar el procedimiento. Lee UTF-8 explicitamente y conserva la descripcion completa. No recarga registros existentes.
2. Abrir `sql/11_reprocesar_detector_v2.sql` con codificacion UTF-8 y ejecutarlo sobre cert_roi_latam. Restaura titulo y descripcion desde los JSON locales del 28 de octubre, vinculando por URL y fuente. Antes guarda el texto anterior en respaldo_texto_v1. El proceso de datos usa una transaccion; una repeticion sustituye solo la evidencia de las URLs incluidas.
3. Revisar los dos resultados finales y las filas de cert_evidencia_v2. Las categorias familia_sin_nivel y otro_nivel quedan fuera de vw_vacante_cert_v2. Si una vacante tiene estados contradictorios queda como revisar.
4. Para demanda usar vw_vacante_cert_v2 (una fila por vacante/certificacion), relacionada con fact_vacantes y dim_certificacion. El campo estado reemplaza la interpretacion binaria de es_requerida. Las vistas antiguas siguen basadas en fact_vacante_cert y NO se actualizan con estos resultados; no mezclar ambos modelos en Power BI.

Los resultados previos (44 vacantes, 58 relaciones) permanecen en fact_vacante_cert para comparacion. No ejecutar 06 para producir los resultados v2. Para nuevas extracciones regenerar con `python -m scrapers.preparar_correccion` y aplicar el SQL resultante. Los JSON locales deben representar la version que se desea cargar; no aplicar un snapshot viejo sobre datos mas recientes.

Pruebas: `python -m unittest discover -s tests -v`. Se cubren encabezados deseables, contaminacion entre secciones, nivel Professional, plus, alternativas, limites de siglas y alias solapados. No sustituyen una evaluacion manual de todos los resultados ni la validacion de ejecucion en SQL Server.

Los salarios y la formula de ROI son pendientes independientes; esta correccion no los valida.
