USE cert_roi_latam;
GO

IF OBJECT_ID('dbo.vw_cert_roi', 'V') IS NOT NULL DROP VIEW dbo.vw_cert_roi;
GO

CREATE VIEW dbo.vw_cert_roi AS
WITH
    stats_cert AS (
        SELECT 
            vc.cert_id,
            COUNT(DISTINCT vc.vacante_id) AS vacantes_con_cert,
            COUNT(DISTINCT vc.vacante_id) * 1.0 / NULLIF((SELECT COUNT(*) FROM dbo.fact_vacantes), 0) AS porcentaje_mercado
        FROM dbo.fact_vacante_cert vc
        GROUP BY vc.cert_id
    ),
    salario_global AS (
        SELECT 
            cert_id,
            AVG(COALESCE(salario_promedio_usd, salario_mediano_usd)) AS sal_prom_usd
        FROM dbo.fact_cert_salario_global
        GROUP BY cert_id
    ),
    salario_latam AS (
        SELECT 
            vc.cert_id,
            AVG(v.salario_medio_mxn) AS sal_latam_mxn
        FROM dbo.fact_vacante_cert vc
        JOIN dbo.fact_vacantes v ON v.vacante_id = vc.vacante_id
        WHERE v.salario_medio_mxn IS NOT NULL
        GROUP BY vc.cert_id
    )
SELECT 
    c.cert_id,
    c.codigo,
    c.nombre_oficial,
    c.proveedor,
    c.categoria,
    c.nivel,
    c.costo_examen_usd,
    c.costo_examen_mxn,
    c.horas_estudio,
    c.costo_examen_mxn + ISNULL(c.horas_estudio, 0) * 100.0 AS inversion_total_mxn,
    ISNULL(s.vacantes_con_cert, 0) AS vacantes_con_cert,
    ISNULL(s.porcentaje_mercado, 0) * 100 AS porcentaje_mercado,
    sg.sal_prom_usd AS salario_promedio_global_usd,
    sg.sal_prom_usd * 20 AS salario_promedio_global_mxn,
    sl.sal_latam_mxn AS salario_promedio_latam_mxn,
    CASE 
        WHEN sg.sal_prom_usd IS NOT NULL
        THEN (sg.sal_prom_usd * 20 / 12) * 36 / NULLIF(c.costo_examen_mxn + ISNULL(c.horas_estudio, 0) * 100.0, 0)
        ELSE NULL
    END AS roi_3_anios_estimado,
    CASE 
        WHEN sg.sal_prom_usd IS NOT NULL
             AND (sg.sal_prom_usd * 20 / 12) > 0
        THEN CEILING((c.costo_examen_mxn + ISNULL(c.horas_estudio, 0) * 100.0) / (sg.sal_prom_usd * 20 / 12 / 30))
        ELSE NULL
    END AS dias_para_recuperar_inversion,
    CASE 
        WHEN ISNULL(s.vacantes_con_cert, 0) < 3 THEN 'muestra_insuficiente'
        WHEN ISNULL(s.vacantes_con_cert, 0) < 10 THEN 'muestra_pequena'
        ELSE 'muestra_valida'
    END AS calidad_muestra
FROM dbo.dim_certificacion c
LEFT JOIN stats_cert s ON s.cert_id = c.cert_id
LEFT JOIN salario_global sg ON sg.cert_id = c.cert_id
LEFT JOIN salario_latam sl ON sl.cert_id = c.cert_id;
GO