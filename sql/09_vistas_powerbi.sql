-- =================================================================
-- 09_queries_powerbi.sql
-- Queries listas para importar como datasets en Power BI
-- =================================================================

-- Query 1: Dataset principal del dashboard (modelo denormalizado)
-- Carga como tabla "cert_roi" en Power BI
CREATE OR ALTER VIEW dbo.vw_pbi_cert_roi AS
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
    c.vigencia_anios,
    v.inversion_total_mxn,
    v.vacantes_con_cert,
    v.porcentaje_mercado,
    v.salario_promedio_global_usd,
    v.salario_promedio_global_mxn,
    v.salario_promedio_latam_mxn,
    v.roi_3_anios_estimado,
    v.dias_para_recuperar_inversion,
    v.calidad_muestra
FROM dbo.vw_cert_roi v
JOIN dbo.dim_certificacion c ON c.cert_id = v.cert_id;
GO

-- Query 2: Vacantes con cert (para análisis detallado)
-- Carga como tabla "vacantes_cert" en Power BI
CREATE OR ALTER VIEW dbo.vw_pbi_vacantes_cert AS
SELECT 
    v.vacante_id,
    v.titulo,
    v.modalidad,
    v.salario_medio_mxn,
    v.fecha_publicacion,
    r.nombre_display AS rol,
    r.categoria_rol,
    e.nombre AS empresa,
    e.pais_hq AS empresa_pais,
    u.pais AS vacante_pais,
    u.region,
    f.nombre AS fuente,
    c.codigo AS cert_codigo,
    c.nombre_oficial AS cert_nombre,
    c.categoria AS cert_categoria,
    c.proveedor,
    vc.es_requerida,
    vc.menciones
FROM dbo.fact_vacante_cert vc
JOIN dbo.fact_vacantes v ON v.vacante_id = vc.vacante_id
JOIN dbo.dim_certificacion c ON c.cert_id = vc.cert_id
LEFT JOIN dbo.dim_rol r ON r.rol_id = v.rol_id
LEFT JOIN dbo.dim_empresa e ON e.empresa_id = v.empresa_id
LEFT JOIN dbo.dim_ubicacion u ON u.ubicacion_id = v.ubicacion_id
LEFT JOIN dbo.dim_fuente f ON f.fuente_id = v.fuente_id;
GO

-- Query 3: Resumen general del mercado (KPIs)
CREATE OR ALTER VIEW dbo.vw_pbi_kpis AS
SELECT 
    (SELECT COUNT(*) FROM dbo.fact_vacantes) AS total_vacantes,
    (SELECT COUNT(DISTINCT empresa_id) FROM dbo.fact_vacantes) AS total_empresas,
    (SELECT COUNT(*) FROM dbo.dim_certificacion) AS total_certificaciones,
    (SELECT COUNT(DISTINCT vacante_id) FROM dbo.fact_vacante_cert) AS vacantes_con_cert,
    (SELECT COUNT(*) FROM dbo.fact_vacante_cert) AS total_menciones,
    CAST((SELECT COUNT(DISTINCT vacante_id) FROM dbo.fact_vacante_cert) AS FLOAT) 
      / NULLIF((SELECT COUNT(*) FROM dbo.fact_vacantes), 0) * 100 AS pct_vacantes_con_cert;
GO

-- Query 4: Top vacantes por rol (para dropdown)
CREATE OR ALTER VIEW dbo.vw_pbi_roles AS
SELECT 
    r.rol_id,
    r.nombre_display AS rol,
    r.categoria_rol,
    COUNT(v.vacante_id) AS total_vacantes,
    COUNT(DISTINCT vc.cert_id) AS certs_mencionadas_distintas
FROM dbo.dim_rol r
LEFT JOIN dbo.fact_vacantes v ON v.rol_id = r.rol_id
LEFT JOIN dbo.fact_vacante_cert vc ON vc.vacante_id = v.vacante_id
GROUP BY r.rol_id, r.nombre_display, r.categoria_rol;
GO

-- Verificación
SELECT 'vw_pbi_cert_roi' AS vista, COUNT(*) AS filas FROM dbo.vw_pbi_cert_roi
UNION ALL SELECT 'vw_pbi_vacantes_cert', COUNT(*) FROM dbo.vw_pbi_vacantes_cert
UNION ALL SELECT 'vw_pbi_kpis', COUNT(*) FROM dbo.vw_pbi_kpis
UNION ALL SELECT 'vw_pbi_roles', COUNT(*) FROM dbo.vw_pbi_roles;