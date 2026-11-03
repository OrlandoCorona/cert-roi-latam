-- Compatibilidad: ejecutar primero 11, 13, 14 y 15. ROI observado pendiente de validacion.
USE cert_roi_latam;
GO
CREATE OR ALTER VIEW dbo.vw_cert_roi AS
SELECT c.cert_id,c.codigo,c.nombre_oficial,c.proveedor,c.categoria,c.nivel,
 c.costo_examen_usd,c.costo_examen_usd*p.tc_usd_mxn AS costo_examen_mxn,c.horas_estudio,
 r.inversion_total_mxn,d.vacantes_con_cert,d.porcentaje_muestra AS porcentaje_mercado,
 CAST(NULL AS DECIMAL(18,2)) AS salario_promedio_global_usd,
 CAST(NULL AS DECIMAL(18,2)) AS salario_promedio_global_mxn,
 CAST(NULL AS DECIMAL(18,2)) AS salario_promedio_latam_mxn,
 CAST(NULL AS DECIMAL(18,4)) AS roi_3_anios_estimado,
 CAST(NULL AS INT) AS dias_para_recuperar_inversion,
 CAST('pendiente_validacion' AS VARCHAR(30)) AS calidad_muestra
FROM dbo.dim_certificacion c JOIN dbo.vw_pbi_demanda_v2 d ON d.cert_id=c.cert_id
JOIN dbo.vw_pbi_roi_escenario_v2 r ON r.cert_id=c.cert_id CROSS JOIN dbo.roi_parametros_v2 p;
GO
