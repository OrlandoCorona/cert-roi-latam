-- Solo lectura. Ejecutar en la base existente antes de actualizar Power BI.
USE cert_roi_latam;
GO
SELECT 'vacantes' AS entidad, COUNT_BIG(*) AS filas FROM dbo.fact_vacantes
UNION ALL SELECT 'certificaciones', COUNT_BIG(*) FROM dbo.dim_certificacion
UNION ALL SELECT 'relaciones_vacante_cert', COUNT_BIG(*) FROM dbo.fact_vacante_cert;

-- Debe devolver cero filas: identidad de vacantes duplicada.
SELECT fuente_id, url_vacante, COUNT(*) AS repeticiones
FROM dbo.fact_vacantes
WHERE url_vacante IS NOT NULL
GROUP BY fuente_id, url_vacante HAVING COUNT(*) > 1;

-- Cobertura y rangos invalidos; revisar antes de interpretar salarios.
SELECT COUNT(*) AS total,
    SUM(CASE WHEN salario_medio_mxn IS NOT NULL THEN 1 ELSE 0 END) AS con_salario,
    SUM(CASE WHEN salario_min_mxn > salario_max_mxn
                  OR salario_min_mxn < 0 OR salario_max_mxn < 0 THEN 1 ELSE 0 END) AS rangos_invalidos,
    SUM(CASE WHEN rol_id IS NULL THEN 1 ELSE 0 END) AS sin_rol,
    SUM(CASE WHEN modalidad IS NULL THEN 1 ELSE 0 END) AS sin_modalidad
FROM dbo.fact_vacantes;

-- Detectar certificaciones sin evidencia y revisar manualmente menciones.
SELECT codigo, vacantes_con_cert, calidad_muestra
FROM dbo.vw_cert_roi ORDER BY vacantes_con_cert DESC;
SELECT TOP (50) c.codigo, v.titulo, vc.es_requerida, v.descripcion
FROM dbo.fact_vacante_cert vc
JOIN dbo.fact_vacantes v ON v.vacante_id = vc.vacante_id
JOIN dbo.dim_certificacion c ON c.cert_id = vc.cert_id
ORDER BY c.codigo, v.vacante_id;
