USE cert_roi_latam;
SET XACT_ABORT ON;
DECLARE @probados INT, @correctos INT;
BEGIN TRANSACTION;
UPDATE dbo.roi_parametros_v2 SET incremento_mensual_mxn=1000,horizonte_meses=36 WHERE id=1;
SELECT @probados=COUNT(*), @correctos=SUM(CASE WHEN ABS(roi_fraccion-(36000.0-inversion_total_mxn)/NULLIF(inversion_total_mxn,0))<0.000001 AND ABS(recuperacion_meses-inversion_total_mxn/1000.0)<0.000001 THEN 1 ELSE 0 END) FROM dbo.vw_pbi_roi_escenario_v2;
ROLLBACK;
SELECT 'escenarios_probados' AS prueba,@probados AS resultado
UNION ALL SELECT 'escenarios_correctos',@correctos
UNION ALL SELECT 'incremento_restaurado',CAST(incremento_mensual_mxn AS INT) FROM dbo.roi_parametros_v2
UNION ALL SELECT 'roi_antiguo_no_sustentado',COUNT(*) FROM dbo.vw_cert_roi WHERE roi_3_anios_estimado IS NOT NULL;
