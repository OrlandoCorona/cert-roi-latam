# Validación del modelo — 1 de noviembre de 2026

Registro histórico del modelo semántico. No describe el estado actual de publicación del dashboard.

## Modelo

- Cuatro consultas originales con CreateNavigationProperties=false.
- vw_pbi_salarios_v2: 656 filas; vw_pbi_roi_escenario_v2: 28 filas.
- ROI Promedio y Mejor ROI consumen roi_fraccion y usan formato porcentual.
- Relación ROI_por_cert: escenario cert_id a catálogo cert_id, filtro unidireccional.
- Relación Salario_por_vacante: detalle vacante_id a salarios vacante_id, filtro unidireccional. El salario no se promedia sobre las relaciones de certificaciones.

## Comprobaciones registradas

656 vacantes, 38 con certificación, 28 certificaciones, 49 relaciones y 230 vacantes con importes salariales. El 5.8% de la muestra de 656 vacantes de GetOnBoard menciona al menos una certificación.

Con incremento salarial supuesto igual a cero, el escenario produce ROI -100% y recuperación vacía. El filtro AWS_CLF devuelve dos relaciones de vacantes y una fila de escenario.

Los metadatos están en powerbi/modelo_v2.bim; no incluyen páginas ni visuales.
