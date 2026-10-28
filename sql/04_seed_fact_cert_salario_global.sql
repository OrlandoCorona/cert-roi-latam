USE cert_roi_latam;
GO

DELETE FROM dbo.fact_cert_salario_global;
DBCC CHECKIDENT ('dbo.fact_cert_salario_global', RESEED, 0);

INSERT INTO dbo.fact_cert_salario_global
    (cert_id, fuente_id, pais_referencia, anio, salario_promedio_usd, salario_mediano_usd, muestra_n, notas)
SELECT
    c.cert_id,
    f.fuente_id,
    v.pais,
    v.anio,
    v.sal_prom,
    v.sal_med,
    v.muestra,
    v.notas
FROM (VALUES
    ('EduBracket', 'AWS_SAA',      'US', 2026, NULL,   125000, NULL, 'Salario mediano Solutions Architect BLS 2024'),
    ('EduBracket', 'AWS_DVA',      'US', 2026, NULL,   110000, NULL, 'Salario mediano Software Developer BLS 2024'),
    ('EduBracket', 'AWS_CLF',      'US', 2026, NULL,    95000, NULL, 'Entry level cloud roles BLS 2024'),
    ('EduBracket', 'AZ_900',       'US', 2026, NULL,    95000, NULL, 'Entry level cloud roles BLS 2024'),
    ('EduBracket', 'AZ_104',       'US', 2026, NULL,   115000, NULL, 'Systems Administrator BLS 2024'),
    ('EduBracket', 'AZ_DP203',     'US', 2026, NULL,   130000, NULL, 'Data Engineer BLS 2024'),
    ('EduBracket', 'GCP_ACE',      'US', 2026, NULL,   118000, NULL, 'Cloud Engineer BLS 2024'),
    ('EduBracket', 'GCP_PCA',      'US', 2026, NULL,   160000, NULL, 'Cloud Architect senior BLS 2024'),
    ('EduBracket', 'GCP_PDE',      'US', 2026, NULL,   140000, NULL, 'Data Engineer senior BLS 2024'),
    ('EduBracket', 'MS_PL300',     'US', 2026, NULL,    85000, NULL, 'Data Analyst BLS 2024'),
    ('EduBracket', 'COURSERA_GDA', 'US', 2026, NULL,    75000, NULL, 'Jr Data Analyst BLS 2024'),
    ('EduBracket', 'TAB_SPEC',     'US', 2026, NULL,    82000, NULL, 'Data Analyst con Tableau BLS 2024'),
    ('EduBracket', 'COMPTIA_SEC',  'US', 2026, NULL,    95000, NULL, 'Information Security Analyst entry BLS 2024'),
    ('EduBracket', 'CCNA',         'US', 2026, NULL,    90000, NULL, 'Network Administrator BLS 2024'),
    ('EduBracket', 'PMP',          'US', 2026, NULL,   120000, NULL, 'Project Manager BLS 2024'),
    ('EduBracket', 'CISSP',        'US', 2026, NULL,   140000, NULL, 'Senior Security Analyst BLS 2024'),

    ('Skillsoft',  'GCP_PCA',      'Global', 2025, 200960, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'PMP',          'Global', 2025, 176116, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'AWS_SAA',      'Global', 2025, 174137, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'CISSP',        'Global', 2025, 171055, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'AZ_104',       'Global', 2025, 142700, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'CCNA',         'Global', 2025, 128000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'COMPTIA_SEC',  'Global', 2025, 119000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'COMPTIA_NET',  'Global', 2025,  85000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'COMPTIA_APLUS','Global', 2025,  70000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'MS_PL300',     'Global', 2025,  95000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'TAB_CDA',      'Global', 2025,  98000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'CEH',          'Global', 2025, 115000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'OSCP',         'Global', 2025, 135000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'PSM1',         'Global', 2025, 115000, NULL, 1900, 'Encuesta Skillsoft top paying 2025'),
    ('Skillsoft',  'CSM',          'Global', 2025, 118000, NULL, 1900, 'Encuesta Skillsoft top paying 2025')
) AS v(fuente_nombre, cert_codigo, pais, anio, sal_prom, sal_med, muestra, notas)
JOIN dbo.dim_certificacion c ON c.codigo = v.cert_codigo
JOIN dbo.dim_fuente f        ON f.nombre = v.fuente_nombre;

SELECT
    f.nombre AS fuente,
    COUNT(*) AS registros,
    MIN(COALESCE(fcsg.salario_promedio_usd, fcsg.salario_mediano_usd)) AS sal_min_usd,
    MAX(COALESCE(fcsg.salario_promedio_usd, fcsg.salario_mediano_usd)) AS sal_max_usd,
    AVG(COALESCE(fcsg.salario_promedio_usd, fcsg.salario_mediano_usd)) AS sal_prom_usd
FROM dbo.fact_cert_salario_global fcsg
JOIN dbo.dim_fuente f ON f.fuente_id = fcsg.fuente_id
GROUP BY f.nombre
ORDER BY f.nombre;

SELECT
    c.codigo,
    c.nombre_oficial,
    COUNT(*) AS fuentes_disponibles,
    MIN(COALESCE(fcsg.salario_promedio_usd, fcsg.salario_mediano_usd)) AS sal_min_usd,
    MAX(COALESCE(fcsg.salario_promedio_usd, fcsg.salario_mediano_usd)) AS sal_max_usd
FROM dbo.fact_cert_salario_global fcsg
JOIN dbo.dim_certificacion c ON c.cert_id = fcsg.cert_id
GROUP BY c.codigo, c.nombre_oficial
ORDER BY sal_max_usd DESC;

SELECT COUNT(*) AS total_salarios_globales FROM dbo.fact_cert_salario_global;
GO