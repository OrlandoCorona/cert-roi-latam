USE cert_roi_latam;
GO

DELETE FROM dbo.puente_rol_cert;

INSERT INTO dbo.puente_rol_cert (rol_id, cert_id, relevancia)
SELECT r.rol_id, c.cert_id, v.relevancia
FROM (VALUES
    ('data_analyst',       'MS_PL300',         'recomendada'),
    ('data_analyst',       'COURSERA_GDA',     'recomendada'),
    ('data_analyst',       'COURSERA_IBM_DA',  'recomendada'),
    ('data_analyst',       'TAB_SPEC',         'recomendada'),
    ('data_analyst',       'TAB_CDA',          'recomendada'),
    ('data_analyst',       'DL_MLS',           'opcional'),
    ('data_analyst',       'AZ_900',           'opcional'),
    ('data_analyst',       'AWS_CLF',          'opcional'),

    ('business_analyst',   'MS_PL300',         'recomendada'),
    ('business_analyst',   'COURSERA_GDA',     'recomendada'),
    ('business_analyst',   'TAB_SPEC',         'recomendada'),
    ('business_analyst',   'PSM1',             'estandar'),
    ('business_analyst',   'CSM',              'estandar'),
    ('business_analyst',   'COURSERA_GPM',     'opcional'),

    ('reporting_analyst',  'MS_PL300',         'recomendada'),
    ('reporting_analyst',  'TAB_SPEC',         'recomendada'),
    ('reporting_analyst',  'TAB_CDA',          'recomendada'),
    ('reporting_analyst',  'COURSERA_GDA',     'estandar'),
    ('reporting_analyst',  'COURSERA_IBM_DA',  'estandar'),

    ('data_engineer',      'AZ_DP203',         'recomendada'),
    ('data_engineer',      'GCP_PDE',          'recomendada'),
    ('data_engineer',      'DB_LHF',           'recomendada'),
    ('data_engineer',      'AWS_SAA',          'estandar'),
    ('data_engineer',      'AWS_DVA',          'estandar'),
    ('data_engineer',      'MS_PL300',         'opcional'),

    ('data_scientist',     'DL_MLS',           'recomendada'),
    ('data_scientist',     'GCP_PDE',          'estandar'),
    ('data_scientist',     'AZ_DP203',         'estandar'),
    ('data_scientist',     'DB_LHF',           'estandar'),
    ('data_scientist',     'COURSERA_IBM_DA',  'opcional'),

    ('soporte_ti',         'COMPTIA_APLUS',    'recomendada'),
    ('soporte_ti',         'COMPTIA_NET',      'recomendada'),
    ('soporte_ti',         'CCNA',             'estandar'),
    ('soporte_ti',         'COMPTIA_SEC',      'estandar'),
    ('soporte_ti',         'AZ_900',           'opcional'),
    ('soporte_ti',         'LPIC1',            'opcional'),

    ('help_desk',          'COMPTIA_APLUS',    'recomendada'),
    ('help_desk',          'COMPTIA_NET',      'estandar'),
    ('help_desk',          'AZ_900',           'opcional'),
    ('help_desk',          'AWS_CLF',          'opcional'),

    ('devops',             'AWS_SAA',          'recomendada'),
    ('devops',             'AZ_104',           'recomendada'),
    ('devops',             'GCP_ACE',          'recomendada'),
    ('devops',             'LPIC1',            'estandar'),
    ('devops',             'COMPTIA_SEC',      'estandar'),
    ('devops',             'AWS_DVA',          'estandar'),

    ('cloud_engineer',     'AWS_SAA',          'recomendada'),
    ('cloud_engineer',     'AZ_104',           'recomendada'),
    ('cloud_engineer',     'GCP_ACE',          'recomendada'),
    ('cloud_engineer',     'GCP_PCA',          'recomendada'),
    ('cloud_engineer',     'AWS_CLF',          'estandar'),
    ('cloud_engineer',     'AZ_900',           'estandar'),
    ('cloud_engineer',     'LPIC1',            'opcional'),

    ('seguridad',          'COMPTIA_SEC',      'recomendada'),
    ('seguridad',          'CEH',              'recomendada'),
    ('seguridad',          'CISSP',            'recomendada'),
    ('seguridad',          'OSCP',             'recomendada'),
    ('seguridad',          'COMPTIA_NET',      'estandar'),
    ('seguridad',          'CCNA',             'estandar'),

    ('project_manager',    'PMP',              'recomendada'),
    ('project_manager',    'COURSERA_GPM',     'recomendada'),
    ('project_manager',    'PSM1',             'estandar'),
    ('project_manager',    'CSM',              'estandar'),

    ('scrum_master',       'PSM1',             'recomendada'),
    ('scrum_master',       'CSM',              'recomendada'),
    ('scrum_master',       'PMP',              'opcional'),
    ('scrum_master',       'COURSERA_GPM',     'opcional')
) AS v(rol_nombre, cert_codigo, relevancia)
JOIN dbo.dim_rol r          ON r.nombre_normalizado = v.rol_nombre
JOIN dbo.dim_certificacion c ON c.codigo = v.cert_codigo;

SELECT
    r.nombre_display AS rol,
    COUNT(*) AS total_certs,
    SUM(CASE WHEN prc.relevancia = 'recomendada' THEN 1 ELSE 0 END) AS recomendadas,
    SUM(CASE WHEN prc.relevancia = 'estandar'    THEN 1 ELSE 0 END) AS estandar,
    SUM(CASE WHEN prc.relevancia = 'opcional'    THEN 1 ELSE 0 END) AS opcionales
FROM dbo.puente_rol_cert prc
JOIN dbo.dim_rol r ON r.rol_id = prc.rol_id
GROUP BY r.nombre_display, r.rol_id
ORDER BY r.rol_id;

SELECT COUNT(*) AS total_relaciones FROM dbo.puente_rol_cert;
GO