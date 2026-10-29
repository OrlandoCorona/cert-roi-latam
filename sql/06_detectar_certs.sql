USE cert_roi_latam;
GO

IF OBJECT_ID('dbo.dim_cert_alias', 'U') IS NOT NULL DROP TABLE dbo.dim_cert_alias;
GO

CREATE TABLE dbo.dim_cert_alias (
    alias_id INT IDENTITY(1,1) PRIMARY KEY,
    cert_id INT NOT NULL,
    alias NVARCHAR(200) NOT NULL,
    CONSTRAINT fk_alias_cert FOREIGN KEY (cert_id) REFERENCES dbo.dim_certificacion(cert_id)
);
CREATE INDEX ix_alias ON dbo.dim_cert_alias(alias);
GO

INSERT INTO dbo.dim_cert_alias (cert_id, alias)
SELECT c.cert_id, v.alias
FROM (VALUES
    ('AWS_CLF','AWS Certified Cloud Practitioner'),('AWS_CLF','AWS Cloud Practitioner'),('AWS_CLF','CLF-C02'),('AWS_CLF','CLF-C01'),('AWS_CLF','Cloud Practitioner AWS'),
    ('AWS_SAA','AWS Certified Solutions Architect Associate'),('AWS_SAA','AWS Solutions Architect Associate'),('AWS_SAA','AWS Solutions Architect'),('AWS_SAA','AWS SAA'),('AWS_SAA','SAA-C03'),('AWS_SAA','SAA-C02'),('AWS_SAA','Arquitecto de Soluciones AWS'),('AWS_SAA','Arquitecto AWS'),
    ('AWS_DVA','AWS Certified Developer Associate'),('AWS_DVA','AWS Developer Associate'),('AWS_DVA','AWS DVA'),('AWS_DVA','DVA-C02'),('AWS_DVA','DVA-C01'),('AWS_DVA','Desarrollador AWS'),
    ('AZ_900','AZ-900'),('AZ_900','Azure Fundamentals'),('AZ_900','Microsoft Azure Fundamentals'),('AZ_900','Fundamentos de Azure'),
    ('AZ_104','AZ-104'),('AZ_104','Azure Administrator'),('AZ_104','Azure Administrator Associate'),('AZ_104','Administrador de Azure'),
    ('AZ_DP203','DP-203'),('AZ_DP203','Azure Data Engineer'),('AZ_DP203','Azure Data Engineer Associate'),('AZ_DP203','Ingeniero de Datos Azure'),
    ('GCP_ACE','Associate Cloud Engineer'),('GCP_ACE','GCP Associate Cloud Engineer'),('GCP_ACE','Google Cloud Associate'),('GCP_ACE','Ingeniero Cloud Asociado GCP'),
    ('GCP_PCA','Professional Cloud Architect'),('GCP_PCA','GCP Professional Cloud Architect'),('GCP_PCA','Google Cloud Architect'),('GCP_PCA','Arquitecto Cloud GCP'),
    ('GCP_PDE','Professional Data Engineer'),('GCP_PDE','GCP Data Engineer'),('GCP_PDE','Google Cloud Data Engineer'),('GCP_PDE','Ingeniero de Datos GCP'),
    ('COURSERA_GDA','Google Data Analytics Certificate'),('COURSERA_GDA','Google Data Analytics Professional Certificate'),('COURSERA_GDA','Google Data Analytics'),
    ('COURSERA_IBM_DA','IBM Data Analyst Certificate'),('COURSERA_IBM_DA','IBM Data Analyst Professional Certificate'),('COURSERA_IBM_DA','IBM Data Analyst'),
    ('MS_PL300','PL-300'),('MS_PL300','Power BI Data Analyst Associate'),('MS_PL300','Microsoft Power BI Analyst'),('MS_PL300','Analista de Datos Power BI'),
    ('TAB_SPEC','Tableau Desktop Specialist'),('TAB_SPEC','Tableau Specialist'),
    ('TAB_CDA','Tableau Certified Data Analyst'),('TAB_CDA','Tableau Data Analyst'),
    ('DL_MLS','Machine Learning Specialization'),('DL_MLS','DeepLearning.AI Machine Learning'),('DL_MLS','Andrew Ng Machine Learning'),('DL_MLS','ML Specialization'),
    ('DB_LHF','Databricks Lakehouse Fundamentals'),('DB_LHF','Databricks Fundamentals'),('DB_LHF','Databricks Lakehouse'),
    ('COMPTIA_APLUS','CompTIA A+'),('COMPTIA_APLUS','A+ Certification'),('COMPTIA_APLUS','CompTIA Aplus'),
    ('COMPTIA_NET','CompTIA Network+'),('COMPTIA_NET','Network+'),('COMPTIA_NET','CompTIA Networkplus'),
    ('COMPTIA_SEC','CompTIA Security+'),('COMPTIA_SEC','Security+'),('COMPTIA_SEC','CompTIA Securityplus'),('COMPTIA_SEC','SY0-701'),('COMPTIA_SEC','SY0-601'),
    ('CCNA','CCNA'),('CCNA','Cisco Certified Network Associate'),('CCNA','200-301'),('CCNA','Cisco CCNA'),
    ('LPIC1','LPIC-1'),('LPIC1','LPIC 1'),('LPIC1','Linux Professional Institute Certification 1'),
    ('PMP','PMP'),('PMP','Project Management Professional'),('PMP','Certificación PMP'),
    ('PSM1','PSM I'),('PSM1','PSM 1'),('PSM1','Professional Scrum Master I'),('PSM1','Professional Scrum Master 1'),
    ('CSM','CSM'),('CSM','Certified ScrumMaster'),('CSM','Certified Scrum Master'),
    ('COURSERA_GPM','Google Project Management Certificate'),('COURSERA_GPM','Google Project Management Professional Certificate'),('COURSERA_GPM','Google Project Management'),
    ('CEH','CEH'),('CEH','Certified Ethical Hacker'),('CEH','Ethical Hacker'),
    ('CISSP','CISSP'),('CISSP','Certified Information Systems Security Professional'),
    ('OSCP','OSCP'),('OSCP','Offensive Security Certified Professional')
) AS v(codigo, alias)
JOIN dbo.dim_certificacion c ON c.codigo = v.codigo;
GO

DELETE FROM dbo.fact_vacante_cert;
DBCC CHECKIDENT ('dbo.fact_vacante_cert', RESEED, 0);

INSERT INTO dbo.fact_vacante_cert (vacante_id, cert_id, es_requerida, menciones)
SELECT 
    v.vacante_id,
    a.cert_id,
    MAX(CASE WHEN v.descripcion LIKE '%required%' + a.alias + '%' 
          OR v.descripcion LIKE '%requerido%' + a.alias + '%' 
          OR v.descripcion LIKE '%indispensable%' + a.alias + '%' 
          OR v.descripcion LIKE '%obligatorio%' + a.alias + '%' 
          THEN 1 ELSE 0 END) AS es_requerida,
    COUNT(DISTINCT a.alias_id) AS menciones
FROM dbo.fact_vacantes v
INNER JOIN dbo.dim_cert_alias a 
    ON (v.descripcion LIKE '%' + a.alias + '%' OR v.titulo LIKE '%' + a.alias + '%')
GROUP BY v.vacante_id, a.cert_id;
GO