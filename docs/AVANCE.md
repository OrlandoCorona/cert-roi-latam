# Evolución técnica del detector y del modelo

Registro de las correcciones de octubre de 2026. El alcance actual del dashboard se describe en el README principal.

## Datos y detector

- La carga conserva 656 vacantes de GetOnBoard y un catálogo de 28 certificaciones.
- La importación utiliza SQL OPENROWSET y OPENJSON; Python realiza extracción y depuración.
- El texto original se conserva en respaldo_texto_v1. La corrección UTF-8 evita truncar descripciones a 8000 caracteres.
- El detector v2 añade contexto, límites de palabras y separación de alias ambiguos: 38 vacantes y 49 relaciones, frente a 44 vacantes y 58 relaciones de v1.
- El 5.8% de la muestra de 656 vacantes de GetOnBoard menciona al menos una certificación. No es una estimación de todo el mercado LATAM.

## Salarios y escenarios

- respaldo_salarios_v1 conserva 656 filas: 230 con importes USD y 426 sin salario publicado.
- El periodo salarial no está acreditado; no se convierten monedas a partir del país ni se atribuyen aumentos a certificaciones.
- ROI expresa beneficio incremental neto dividido entre inversión. Los parámetros son supuestos editables, no resultados observados.

## Integración y validación

Las vistas originales de Power BI consumen la capa v2 mediante sql/09_vistas_powerbi.sql. sql/18_validar_integracion_powerbi.sql contiene controles de coherencia. El detector dispone de siete pruebas unitarias; falta una muestra etiquetada manualmente para evaluar precisión y cobertura.

La carga de salarios no actualiza automáticamente cambios de importes y requiere integración con el importador. Los alias y las vacantes con múltiples roles siguen siendo limitaciones del análisis.
