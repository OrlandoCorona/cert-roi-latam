-- Solo lectura. Ejecutar despues de 09_vistas_powerbi.sql migrado a V2.
USE cert_roi_latam;
GO
SELECT k.total_vacantes, k.vacantes_con_cert, k.total_certificaciones,
       k.total_menciones AS relaciones, k.pct_vacantes_con_cert,
       CASE WHEN k.total_vacantes = v.total_vacantes
                  AND k.vacantes_con_cert = v.vacantes_con_cert
                  AND k.total_menciones = v.relaciones
                  AND k.total_certificaciones = v.total_certificaciones
            THEN 'OK' ELSE 'REVISAR' END AS coherencia_kpis
FROM dbo.vw_pbi_kpis k CROSS JOIN dbo.vw_pbi_kpis_v2 v;

-- Ambas diferencias deben devolver cero filas.
SELECT vacante_id, cert_codigo FROM dbo.vw_pbi_vacantes_cert
EXCEPT SELECT vacante_id, codigo FROM dbo.vw_pbi_detalle_v2;
SELECT vacante_id, codigo FROM dbo.vw_pbi_detalle_v2
EXCEPT SELECT vacante_id, cert_codigo FROM dbo.vw_pbi_vacantes_cert;

SELECT vacante_id, cert_codigo, COUNT(*) AS repeticiones
FROM dbo.vw_pbi_vacantes_cert
GROUP BY vacante_id, cert_codigo HAVING COUNT(*) > 1;

-- El ROI observado y los salarios sin respaldo no deben reaparecer.
SELECT COUNT(*) AS filas_no_sustentadas
FROM dbo.vw_pbi_cert_roi
WHERE roi_3_anios_estimado IS NOT NULL
   OR salario_promedio_global_mxn IS NOT NULL
   OR salario_promedio_latam_mxn IS NOT NULL;
GO
