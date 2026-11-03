USE cert_roi_latam;
GO
IF OBJECT_ID('dbo.roi_parametros_v2','U') IS NULL
BEGIN
 CREATE TABLE dbo.roi_parametros_v2(
 id INT PRIMARY KEY CHECK(id=1),
 tc_usd_mxn DECIMAL(12,4) NOT NULL CHECK(tc_usd_mxn>0),
 costo_hora_mxn DECIMAL(12,2) NOT NULL CHECK(costo_hora_mxn>=0),
 incremento_mensual_mxn DECIMAL(12,2) NOT NULL,
 horizonte_meses INT NOT NULL CHECK(horizonte_meses>0),
 costos_adicionales_mxn DECIMAL(12,2) NOT NULL CHECK(costos_adicionales_mxn>=0),
 nota NVARCHAR(300) NOT NULL);
 INSERT dbo.roi_parametros_v2 VALUES(1,20,100,0,36,0,
 N'Simulacion: TC 20 e importe por hora 100 son supuestos, no cotizaciones actuales. Incremento inicial 0; costos adicionales editables.');
END;
GO
CREATE OR ALTER VIEW dbo.vw_pbi_roi_escenario_v2 AS
SELECT c.cert_id,c.codigo,c.nombre_oficial,c.proveedor,c.categoria,c.nivel,
 c.costo_examen_usd,c.horas_estudio,p.tc_usd_mxn,p.costo_hora_mxn,
 p.incremento_mensual_mxn,p.horizonte_meses,p.costos_adicionales_mxn,p.nota,
 c.costo_examen_usd*p.tc_usd_mxn AS costo_examen_mxn_escenario,
 i.inversion_total_mxn,
 p.incremento_mensual_mxn*p.horizonte_meses AS beneficio_incremental_mxn,
 p.incremento_mensual_mxn*p.horizonte_meses-i.inversion_total_mxn AS beneficio_neto_mxn,
 (p.incremento_mensual_mxn*p.horizonte_meses-i.inversion_total_mxn)
 /NULLIF(i.inversion_total_mxn,0) AS roi_fraccion,
 CASE WHEN p.incremento_mensual_mxn>0 AND i.inversion_total_mxn>0
 THEN i.inversion_total_mxn/p.incremento_mensual_mxn END AS recuperacion_meses
FROM dbo.dim_certificacion c CROSS JOIN dbo.roi_parametros_v2 p
CROSS APPLY(SELECT c.costo_examen_usd*p.tc_usd_mxn
 +c.horas_estudio*p.costo_hora_mxn+p.costos_adicionales_mxn AS inversion_total_mxn) i;
GO
CREATE OR ALTER VIEW dbo.vw_pbi_salarios_v2 AS
SELECT s.vacante_id,v.titulo,s.minimo_usd,s.maximo_usd,s.periodo,s.fuente,
 CASE WHEN s.minimo_usd>0 AND s.maximo_usd>=s.minimo_usd AND s.periodo='mensual'
 THEN (s.minimo_usd+s.maximo_usd)/2 END AS salario_medio_mensual_usd,
 CASE WHEN s.minimo_usd IS NULL AND s.maximo_usd IS NULL THEN 'sin_salario'
 WHEN s.periodo='por_verificar' THEN 'periodo_por_verificar'
 ELSE 'revisar_evidencia_periodo' END AS calidad_salario
FROM dbo.salario_origen_v2 s JOIN dbo.fact_vacantes v ON v.vacante_id=s.vacante_id;
GO
-- Evitar que las vistas antiguas sigan publicando ROI atribuible al sueldo completo.
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
SELECT COUNT(*) AS filas_roi,MIN(roi_fraccion) AS roi_min,MAX(roi_fraccion) AS roi_max
FROM dbo.vw_pbi_roi_escenario_v2;
SELECT calidad_salario,COUNT(*) AS vacantes FROM dbo.vw_pbi_salarios_v2 GROUP BY calidad_salario;
