-- =========================================================
-- Proyecto: Tracker de ROI de Certificaciones Tech LATAM
-- Base: cert_roi_latam
-- Modelo: Esquema estrella
-- =========================================================

USE cert_roi_latam;
GO

IF OBJECT_ID('dbo.fact_vacante_cert', 'U') IS NOT NULL DROP TABLE dbo.fact_vacante_cert;
IF OBJECT_ID('dbo.fact_cert_salario_global', 'U') IS NOT NULL DROP TABLE dbo.fact_cert_salario_global;
IF OBJECT_ID('dbo.fact_vacantes', 'U') IS NOT NULL DROP TABLE dbo.fact_vacantes;
IF OBJECT_ID('dbo.puente_rol_cert', 'U') IS NOT NULL DROP TABLE dbo.puente_rol_cert;
IF OBJECT_ID('dbo.dim_certificacion', 'U') IS NOT NULL DROP TABLE dbo.dim_certificacion;
IF OBJECT_ID('dbo.dim_rol', 'U') IS NOT NULL DROP TABLE dbo.dim_rol;
IF OBJECT_ID('dbo.dim_empresa', 'U') IS NOT NULL DROP TABLE dbo.dim_empresa;
IF OBJECT_ID('dbo.dim_ubicacion', 'U') IS NOT NULL DROP TABLE dbo.dim_ubicacion;
IF OBJECT_ID('dbo.dim_fuente', 'U') IS NOT NULL DROP TABLE dbo.dim_fuente;
IF OBJECT_ID('dbo.dim_fecha', 'U') IS NOT NULL DROP TABLE dbo.dim_fecha;
GO

-- =========================================================
-- DIMENSIONES
-- =========================================================

-- Dim Fecha
CREATE TABLE dbo.dim_fecha (
    fecha_id       INT NOT NULL PRIMARY KEY,            -- YYYYMMDD
    fecha          DATE NOT NULL,
    anio           INT NOT NULL,
    mes            INT NOT NULL,
    nombre_mes     VARCHAR(20) NOT NULL,
    trimestre      INT NOT NULL,
    dia            INT NOT NULL,
    dia_semana     INT NOT NULL,
    nombre_dia     VARCHAR(20) NOT NULL,
    semana_anio    INT NOT NULL,
    es_fin_semana  BIT NOT NULL
);
GO

-- Dim Certificacion
CREATE TABLE dbo.dim_certificacion (
    cert_id             INT IDENTITY(1,1) PRIMARY KEY,
    codigo              VARCHAR(50) NOT NULL UNIQUE,     
    nombre_oficial      NVARCHAR(200) NOT NULL,
    proveedor           NVARCHAR(100) NOT NULL,          -- AWS, Microsoft, Google, CompTIA, PMI, etc.
    categoria           NVARCHAR(50) NOT NULL,           -- Cloud, Datos y BI, Infraestructura, Gestion, Ciber
    nivel               NVARCHAR(30) NOT NULL,           -- Entry, Associate, Professional, Expert
    costo_examen_usd    DECIMAL(10,2) NULL,
    costo_examen_mxn    DECIMAL(10,2) NULL,
    horas_estudio       INT NULL,
    vigencia_anios      INT NULL,                        -- NULL = no expira
    requisitos_previos  NVARCHAR(500) NULL,
    url_oficial         NVARCHAR(500) NULL,
    activa              BIT NOT NULL DEFAULT 1,
    fecha_creacion      DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
GO

-- Dim Rol
CREATE TABLE dbo.dim_rol (
    rol_id              INT IDENTITY(1,1) PRIMARY KEY,
    nombre_normalizado  NVARCHAR(100) NOT NULL UNIQUE,   -- data_analyst, business_analyst, etc.
    nombre_display      NVARCHAR(100) NOT NULL,          -- Data Analyst, Business Analyst
    categoria_rol       NVARCHAR(50) NOT NULL            -- dev, data, devops, cloud, soporte, gestion, ciber
);
GO

-- Dim Empresa
CREATE TABLE dbo.dim_empresa (
    empresa_id      INT IDENTITY(1,1) PRIMARY KEY,
    nombre          NVARCHAR(200) NOT NULL,
    industria       NVARCHAR(100) NULL,
    tamanio         NVARCHAR(30) NULL,                   -- startup, mediana, corporativo
    pais_hq         NVARCHAR(50) NULL,
    url_sitio       NVARCHAR(300) NULL,
    fecha_creacion  DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME()
);
GO
CREATE INDEX ix_empresa_nombre ON dbo.dim_empresa(nombre);
GO

-- Dim Ubicacion
CREATE TABLE dbo.dim_ubicacion (
    ubicacion_id    INT IDENTITY(1,1) PRIMARY KEY,
    ciudad          NVARCHAR(100) NULL,
    estado          NVARCHAR(100) NULL,
    pais            NVARCHAR(50) NOT NULL,
    region          NVARCHAR(50) NOT NULL,               -- latam_norte, latam_sur, remoto_global, etc.
    ubicacion_raw   NVARCHAR(300) NULL                    -- string original scrapeado
);
GO
CREATE INDEX ix_ubicacion_pais ON dbo.dim_ubicacion(pais);
GO

-- Dim Fuente
CREATE TABLE dbo.dim_fuente (
    fuente_id   INT IDENTITY(1,1) PRIMARY KEY,
    nombre      NVARCHAR(50) NOT NULL UNIQUE,            -- LinkedIn, Indeed, Computrabajo, OCC, GetOnBoard, SO_Survey, EduBracket
    tipo        NVARCHAR(30) NOT NULL,                   -- portal_vacantes, encuesta, dataset_abierto
    url_base    NVARCHAR(200) NULL
);
GO

-- =========================================================
-- PUENTE N:N (rol <-> cert, catalogo del dataset Hugging Face)
-- =========================================================
CREATE TABLE dbo.puente_rol_cert (
    rol_id       INT NOT NULL,
    cert_id      INT NOT NULL,
    relevancia   NVARCHAR(20) NOT NULL DEFAULT 'estandar',   -- recomendada, estandar, opcional
    CONSTRAINT pk_puente_rol_cert PRIMARY KEY (rol_id, cert_id),
    CONSTRAINT fk_puente_rol      FOREIGN KEY (rol_id)  REFERENCES dbo.dim_rol(rol_id),
    CONSTRAINT fk_puente_cert     FOREIGN KEY (cert_id) REFERENCES dbo.dim_certificacion(cert_id)
);
GO

-- =========================================================
-- HECHOS
-- =========================================================

-- Fact: vacantes scrapeadas
CREATE TABLE dbo.fact_vacantes (
    vacante_id          BIGINT IDENTITY(1,1) PRIMARY KEY,
    fecha_id            INT NOT NULL,
    rol_id              INT NULL,
    empresa_id          INT NULL,
    ubicacion_id        INT NULL,
    fuente_id           INT NOT NULL,
    titulo              NVARCHAR(300) NOT NULL,
    salario_min_mxn     DECIMAL(12,2) NULL,
    salario_max_mxn     DECIMAL(12,2) NULL,
    salario_medio_mxn   DECIMAL(12,2) NULL,
    salario_raw         NVARCHAR(200) NULL,
    modalidad           NVARCHAR(20) NULL,                -- remoto, hibrido, presencial
    idioma_requerido    NVARCHAR(20) NULL,                -- es, en, es_en
    experiencia_anios   DECIMAL(4,1) NULL,
    descripcion         NVARCHAR(MAX) NULL,
    url_vacante         NVARCHAR(500) NULL,
    fecha_publicacion   DATE NULL,
    fecha_scrape        DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT fk_vac_fecha      FOREIGN KEY (fecha_id)     REFERENCES dbo.dim_fecha(fecha_id),
    CONSTRAINT fk_vac_rol        FOREIGN KEY (rol_id)       REFERENCES dbo.dim_rol(rol_id),
    CONSTRAINT fk_vac_empresa    FOREIGN KEY (empresa_id)   REFERENCES dbo.dim_empresa(empresa_id),
    CONSTRAINT fk_vac_ubicacion  FOREIGN KEY (ubicacion_id) REFERENCES dbo.dim_ubicacion(ubicacion_id),
    CONSTRAINT fk_vac_fuente     FOREIGN KEY (fuente_id)    REFERENCES dbo.dim_fuente(fuente_id)
);
GO
CREATE INDEX ix_vac_fecha  ON dbo.fact_vacantes(fecha_id);
CREATE INDEX ix_vac_rol    ON dbo.fact_vacantes(rol_id);
CREATE INDEX ix_vac_fuente ON dbo.fact_vacantes(fuente_id);
GO

-- Fact: cert <-> vacante (que certs aparecen en que vacantes)
CREATE TABLE dbo.fact_vacante_cert (
    vacante_cert_id BIGINT IDENTITY(1,1) PRIMARY KEY,
    vacante_id      BIGINT NOT NULL,
    cert_id         INT NOT NULL,
    es_requerida    BIT NOT NULL DEFAULT 0,              
    menciones       INT NOT NULL DEFAULT 1,              -- cuantas veces aparece en la descripcion
    CONSTRAINT fk_vc_vacante FOREIGN KEY (vacante_id) REFERENCES dbo.fact_vacantes(vacante_id) ON DELETE CASCADE,
    CONSTRAINT fk_vc_cert    FOREIGN KEY (cert_id)    REFERENCES dbo.dim_certificacion(cert_id),
    CONSTRAINT uq_vc UNIQUE (vacante_id, cert_id)
);
GO
CREATE INDEX ix_vc_cert ON dbo.fact_vacante_cert(cert_id);
GO

CREATE TABLE dbo.fact_cert_salario_global (
    salario_global_id   INT IDENTITY(1,1) PRIMARY KEY,
    cert_id             INT NOT NULL,
    fuente_id           INT NOT NULL,
    pais_referencia     NVARCHAR(50) NOT NULL,            -- US, Global, LATAM, etc.
    anio                INT NOT NULL,
    salario_promedio_usd DECIMAL(12,2) NULL,
    salario_mediano_usd  DECIMAL(12,2) NULL,
    muestra_n           INT NULL,
    notas               NVARCHAR(300) NULL,
    CONSTRAINT fk_sg_cert   FOREIGN KEY (cert_id)   REFERENCES dbo.dim_certificacion(cert_id),
    CONSTRAINT fk_sg_fuente FOREIGN KEY (fuente_id) REFERENCES dbo.dim_fuente(fuente_id)
);
GO

-- =========================================================
-- POBLAR dim_fecha 
-- =========================================================
DECLARE @d DATE = '2024-01-01';
DECLARE @fin DATE = '2026-12-31';

WHILE @d <= @fin
BEGIN
    INSERT INTO dbo.dim_fecha
        (fecha_id, fecha, anio, mes, nombre_mes, trimestre, dia, dia_semana, nombre_dia, semana_anio, es_fin_semana)
    VALUES
    (
        CONVERT(INT, FORMAT(@d, 'yyyyMMdd')),
        @d,
        YEAR(@d),
        MONTH(@d),
        DATENAME(MONTH, @d),
        DATEPART(QUARTER, @d),
        DAY(@d),
        DATEPART(WEEKDAY, @d),
        DATENAME(WEEKDAY, @d),
        DATEPART(ISO_WEEK, @d),
        CASE WHEN DATEPART(WEEKDAY, @d) IN (1,7) THEN 1 ELSE 0 END
    );
    SET @d = DATEADD(DAY, 1, @d);
END;
GO

-- =========================================================
-- SEED: dim_fuente
-- =========================================================
INSERT INTO dbo.dim_fuente (nombre, tipo, url_base) VALUES
    ('LinkedIn',       'portal_vacantes',  'https://www.linkedin.com/jobs'),
    ('Indeed MX',      'portal_vacantes',  'https://mx.indeed.com'),
    ('Computrabajo',   'portal_vacantes',  'https://www.computrabajo.com.mx'),
    ('OCC Mundial',    'portal_vacantes',  'https://www.occ.com.mx'),
    ('GetOnBoard',     'portal_vacantes',  'https://www.getonbrd.com'),
    ('SO Survey',      'encuesta',          'https://survey.stackoverflow.co'),
    ('EduBracket',     'dataset_abierto',  'https://edubracket.com/research/cert-roi-2026'),
    ('HF IT Roles',    'dataset_abierto',  'https://huggingface.co/datasets/NxtGenIntern/IT_Job_Roles_Skills_Certifications_Dataset'),
    ('Skillsoft',      'encuesta',          'https://www.skillsoft.com');
GO

-- =========================================================
-- SEED: dim_rol
-- =========================================================
INSERT INTO dbo.dim_rol (nombre_normalizado, nombre_display, categoria_rol) VALUES
    ('data_analyst',       'Data Analyst',          'data'),
    ('business_analyst',   'Business Analyst',      'data'),
    ('reporting_analyst',  'Reporting Analyst',     'data'),
    ('data_engineer',      'Data Engineer',         'data'),
    ('data_scientist',     'Data Scientist',        'data'),
    ('soporte_ti',         'Soporte TI',            'soporte'),
    ('help_desk',          'Help Desk',             'soporte'),
    ('devops',             'DevOps',                'devops'),
    ('cloud_engineer',     'Cloud Engineer',        'cloud'),
    ('seguridad',          'Analista de Seguridad', 'ciber'),
    ('project_manager',    'Project Manager',       'gestion'),
    ('scrum_master',       'Scrum Master',          'gestion');
GO

SELECT 'dim_fecha'         AS tabla, COUNT(*) AS filas FROM dbo.dim_fecha
UNION ALL SELECT 'dim_fuente',       COUNT(*) FROM dbo.dim_fuente
UNION ALL SELECT 'dim_rol',          COUNT(*) FROM dbo.dim_rol
UNION ALL SELECT 'dim_certificacion',COUNT(*) FROM dbo.dim_certificacion
UNION ALL SELECT 'dim_empresa',      COUNT(*) FROM dbo.dim_empresa
UNION ALL SELECT 'dim_ubicacion',    COUNT(*) FROM dbo.dim_ubicacion
UNION ALL SELECT 'puente_rol_cert',  COUNT(*) FROM dbo.puente_rol_cert
UNION ALL SELECT 'fact_vacantes',    COUNT(*) FROM dbo.fact_vacantes
UNION ALL SELECT 'fact_vacante_cert',COUNT(*) FROM dbo.fact_vacante_cert
UNION ALL SELECT 'fact_cert_salario_global', COUNT(*) FROM dbo.fact_cert_salario_global;
GO