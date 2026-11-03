USE cert_roi_latam;
SELECT COUNT(*) AS total_vacantes,
 SUM(CASE WHEN descripcion LIKE N'%Ã%' OR descripcion LIKE N'%Â%' THEN 1 ELSE 0 END) AS revisar_codificacion
FROM dbo.fact_vacantes;
SELECT COUNT(DISTINCT vacante_id) AS vacantes_v2, COUNT(*) AS relaciones_v2
FROM dbo.vw_vacante_cert_v2;
SELECT estado,COUNT(*) AS relaciones FROM dbo.vw_vacante_cert_v2 GROUP BY estado;
SELECT e.codigo,e.estado,e.precision,e.evidencia
FROM dbo.cert_evidencia_v2 e JOIN dbo.fact_vacantes v ON v.vacante_id=e.vacante_id
WHERE v.titulo LIKE '%Technical Account Manager%' OR e.precision <> 'exacta';
