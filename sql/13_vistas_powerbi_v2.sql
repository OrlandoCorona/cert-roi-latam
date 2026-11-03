USE cert_roi_latam;
GO
CREATE OR ALTER VIEW dbo.vw_pbi_demanda_v2 AS
SELECT c.cert_id,c.codigo,c.nombre_oficial,c.proveedor,c.categoria,c.nivel,
 COUNT(vc.vacante_id) AS vacantes_con_cert,
 100.0 * COUNT(vc.vacante_id) / NULLIF((SELECT COUNT(*) FROM dbo.fact_vacantes),0) AS porcentaje_muestra
FROM dbo.dim_certificacion c
LEFT JOIN dbo.vw_vacante_cert_v2 vc ON vc.cert_id=c.cert_id
GROUP BY c.cert_id,c.codigo,c.nombre_oficial,c.proveedor,c.categoria,c.nivel;
GO
CREATE OR ALTER VIEW dbo.vw_pbi_detalle_v2 AS
SELECT vc.vacante_id,vc.cert_id,vc.codigo,vc.estado,vc.menciones,
 v.titulo,v.fecha_publicacion,v.url_vacante,e.nombre AS empresa
FROM dbo.vw_vacante_cert_v2 vc
JOIN dbo.fact_vacantes v ON v.vacante_id=vc.vacante_id
LEFT JOIN dbo.dim_empresa e ON e.empresa_id=v.empresa_id;
GO
CREATE OR ALTER VIEW dbo.vw_pbi_kpis_v2 AS
SELECT (SELECT COUNT(*) FROM dbo.fact_vacantes) AS total_vacantes,
 (SELECT COUNT(*) FROM dbo.dim_certificacion) AS total_certificaciones,
 COUNT(DISTINCT vacante_id) AS vacantes_con_cert,
 COUNT(*) AS relaciones,
 100.0*COUNT(DISTINCT vacante_id)/NULLIF((SELECT COUNT(*) FROM dbo.fact_vacantes),0) AS porcentaje_muestra
FROM dbo.vw_vacante_cert_v2;
GO
SELECT * FROM dbo.vw_pbi_kpis_v2;
