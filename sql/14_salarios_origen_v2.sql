USE cert_roi_latam;
SET XACT_ABORT ON;
BEGIN TRANSACTION;
IF OBJECT_ID('dbo.respaldo_salarios_v1','U') IS NULL
 SELECT vacante_id,salario_min_mxn,salario_max_mxn,salario_medio_mxn,salario_raw
 INTO dbo.respaldo_salarios_v1 FROM dbo.fact_vacantes;
IF OBJECT_ID('dbo.salario_origen_v2','U') IS NULL
 CREATE TABLE dbo.salario_origen_v2(vacante_id BIGINT PRIMARY KEY,
 minimo_usd DECIMAL(14,2),maximo_usd DECIMAL(14,2),
 periodo VARCHAR(30) NOT NULL DEFAULT 'por_verificar',
 fuente NVARCHAR(500) NOT NULL);

INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/revenue-operations-manager-bnamericas-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/revenue-operations-manager-bnamericas-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-ecommerce-digital-witi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-ecommerce-digital-witi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/snowflake-data-engineer-crest-it-resources-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/snowflake-data-engineer-crest-it-resources-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-sr-portugues-agile-witi-montevideo-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-sr-portugues-agile-witi-montevideo-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/power-bi-developer-ssis-hyqoo-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/power-bi-developer-ssis-hyqoo-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4500,6000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/founding-gtm-engineer-hostop-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4500,N'; max=',6000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/founding-gtm-engineer-hostop-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2750,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/is-it-security-engineer-economic-impact-catalyst-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2750,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/is-it-security-engineer-economic-impact-catalyst-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-product-manager-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-product-manager-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1200,1800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-ssr-banca-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1200,N'; max=',1800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-ssr-banca-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ux-researcher-audience-and-product-experience-research-epoch-times-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ux-researcher-audience-and-product-experience-research-epoch-times-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-c4c-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-c4c-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-continuidad-de-negocio-y-riesgos-tecnologicos-dynamic-devs-santiago-2098' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-continuidad-de-negocio-y-riesgos-tecnologicos-dynamic-devs-santiago-2098' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-marketing-manager-real-id-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-marketing-manager-real-id-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-qa-automation-engineer-kaseya-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-qa-automation-engineer-kaseya-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,1800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-negocios-junior-retail-e-inteligencia-artifici-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',1800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-negocios-junior-retail-e-inteligencia-artifici-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/finance-systems-operations-lead-force-of-nature-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/finance-systems-operations-lead-force-of-nature-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2400,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/outsystems-consultant-pm-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2400,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/outsystems-consultant-pm-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-po-bc-tecnologia-santiago-bd4d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-po-bc-tecnologia-santiago-bd4d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-aplicaciones-y-soluciones-sap-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-aplicaciones-y-soluciones-sap-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-operaciones-ti-geovictoria-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-operaciones-ti-geovictoria-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,6500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-software-engineer-zaelot-remote-fbc2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',6500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-software-engineer-zaelot-remote-fbc2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1000,1500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/aba-case-coordinator-crewbloom-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1000,N'; max=',1500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/aba-case-coordinator-crewbloom-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-a-sap-business-one-finanzas-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-a-sap-business-one-finanzas-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-funcional-senior-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-funcional-senior-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analytics-salesforce-crm-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analytics-salesforce-crm-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/kam-control-de-gestion-bnp-paribas-cardif-santiago-e9dd' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/kam-control-de-gestion-bnp-paribas-cardif-santiago-e9dd' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-mi-local-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-mi-local-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1800,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-autored-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1800,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-autored-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1700,2400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/local-seo-specialist-local-seo-partners-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1700,N'; max=',2400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/local-seo-specialist-local-seo-partners-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-process-analyst-flow-engineering-integratz-vina-del-mar' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-process-analyst-flow-engineering-integratz-vina-del-mar' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-junior-analista-de-procesos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-junior-analista-de-procesos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-launch-lead-bomi-lab-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-launch-lead-bomi-lab-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-consultant-payroll-rankmi-lima-0777' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-consultant-payroll-rankmi-lima-0777' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1700,2300,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-development-representative-great-lakes-transport-solutions-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1700,N'; max=',2300) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-development-representative-great-lakes-transport-solutions-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-data-science-dsac-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-data-science-dsac-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/middle-net-developer-improving-south-america-ciudad-de-mexico-guadalajara-monterrey-aguascalientes-queretaro' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/middle-net-developer-improving-south-america-ciudad-de-mexico-guadalajara-monterrey-aguascalientes-queretaro' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-microsoft-fabric-power-bi-and-purvie-integratz-vina-del-mar' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-microsoft-fabric-power-bi-and-purvie-integratz-vina-del-mar' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-architect-microsoft-fabric-integratz-vina-del-mar-8c2e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-architect-microsoft-fabric-integratz-vina-del-mar-8c2e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4500,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-adobe-analytics-implementation-developer-we-built-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4500,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-adobe-analytics-implementation-developer-we-built-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-business-analyst-bice-vida-santiago-5706' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-business-analyst-bice-vida-santiago-5706' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,1900,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-grupo-lagos-santiago-b8d8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',1900) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-grupo-lagos-santiago-b8d8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3200,3700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-technical-project-manager-integratz-vina-del-mar' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3200,N'; max=',3700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-technical-project-manager-integratz-vina-del-mar' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,800,1100,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cientifico-de-datos-atentus-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',800,N'; max=',1100) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cientifico-de-datos-atentus-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-decision-point-latam-ciudad-de-mexico-santiago-8d7c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-decision-point-latam-ciudad-de-mexico-santiago-8d7c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-business-analyst-decision-point-latam-ciudad-de-mexico-santiago-069a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-business-analyst-decision-point-latam-ciudad-de-mexico-santiago-069a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-decision-point-latam-ciudad-de-mexico-santiago-b624' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-decision-point-latam-ciudad-de-mexico-santiago-b624' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-neuralworks-santiago-3486' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-neuralworks-santiago-3486' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-deployed-ai-engineer-anthropic-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-deployed-ai-engineer-anthropic-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-deployed-ai-engineer-openai-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-deployed-ai-engineer-openai-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-forward-deployed-ai-engineer-gemini-enterprise-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-forward-deployed-ai-engineer-gemini-enterprise-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-agentic-engineer-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-agentic-engineer-artefact-us-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-chile-uruguay-bc-tecnologia-santiago-montevideo' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-chile-uruguay-bc-tecnologia-santiago-montevideo' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2600,3800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/accounting-operations-assistant-commerce-theory-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2600,N'; max=',3800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/accounting-operations-assistant-commerce-theory-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-senior-enviame-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-senior-enviame-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-po-tech-management-banca-transaccional-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-po-tech-management-banca-transaccional-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-bi-microsoft-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-bi-microsoft-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/practica-analista-de-negocio-ti-ing-lnformatica-o-afin-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/practica-analista-de-negocio-ti-ing-lnformatica-o-afin-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-mobile-montevideo-bc-tecnologia-montevideo' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-mobile-montevideo-bc-tecnologia-montevideo' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-ecommerce-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-ecommerce-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-bc-tecnologia-santiago-7de2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-bc-tecnologia-santiago-7de2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-senior-enviame-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-senior-enviame-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-retail-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-senior-retail-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-usercode-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-usercode-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-digital-analytics-bc-tecnologia-santiago-6212' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-digital-analytics-bc-tecnologia-santiago-6212' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-po-agile-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-po-agile-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,1700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',1700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1900,2200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1900,N'; max=',2200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-backlog-y-requerimientos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-backlog-y-requerimientos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,1700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-proyecto-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',1700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-proyecto-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-consultant-artefact-artefact-latam-lima-bogota-santiago-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-consultant-artefact-artefact-latam-lima-bogota-santiago-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-bc-tecnologia-santiago-c237' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-analyst-bc-tecnologia-santiago-c237' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5000,5800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-manager-artefact-latam-ciudad-de-mexico-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5000,N'; max=',5800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-manager-artefact-latam-ciudad-de-mexico-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analytics-engineer-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analytics-engineer-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-lead-fieldbeat-santiago-bbef' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-lead-fieldbeat-santiago-bbef' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-procesos-codeable-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-procesos-codeable-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-middleware-semi-senior-oracle-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-middleware-semi-senior-oracle-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/scrum-master-product-owner-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/scrum-master-product-owner-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-web-mobile-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-web-mobile-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-funcional-lisit-santiago-79f5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-funcional-lisit-santiago-79f5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-metadatos-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-metadatos-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-funcional-isu-dm-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-funcional-isu-dm-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-transformacion-digital-peru-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-transformacion-digital-peru-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-accesos-e-identidades-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-accesos-e-identidades-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-bi-data-analyst-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-bi-data-analyst-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-junior-funcional-y-automatizacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-junior-funcional-y-automatizacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-devsecops-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-devsecops-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-funcional-junior-ecommerce-y-medios-de-pago-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-funcional-junior-ecommerce-y-medios-de-pago-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-de-automatizacion-amp-catalogo-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-de-automatizacion-amp-catalogo-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2400,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-datos-arquitectura-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2400,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-datos-arquitectura-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-backend-java-spring-boot-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-backend-java-spring-boot-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-designer-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-designer-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-continuidad-de-negocio-y-riesgos-tecnologicos-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-continuidad-de-negocio-y-riesgos-tecnologicos-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-aseguramiento-de-calidad-de-software-usercode-spa-remote-eb1a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-aseguramiento-de-calidad-de-software-usercode-spa-remote-eb1a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/go-engineer-microservices-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/go-engineer-microservices-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,6000,6000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-engineer-vetclaims-ai-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',6000,N'; max=',6000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-engineer-vetclaims-ai-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3400,4400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-engineer-world-wildlife-fund-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3400,N'; max=',4400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-engineer-world-wildlife-fund-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1400,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/junior-backend-engineer-santiago-krunchbox-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1400,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/junior-backend-engineer-santiago-krunchbox-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-php-engineer-laravel-aws-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-php-engineer-laravel-aws-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-engineer-serverless-workflow-hyqoo-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-engineer-serverless-workflow-hyqoo-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5500,6500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/founding-ios-engineer-swift-hostop-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5500,N'; max=',6500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/founding-ios-engineer-swift-hostop-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,6000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-native-full-stack-software-engineer-justinsurance-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',6000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-native-full-stack-software-engineer-justinsurance-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-bigquery-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-bigquery-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-mlops-y-machine-learning-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-mlops-y-machine-learning-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1900,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1900,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2100,2900,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-ssr-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2100,N'; max=',2900) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-ssr-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analytics-engineer-ia-datos-witi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analytics-engineer-ia-datos-witi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-networking-sre-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-networking-sre-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-agentic-ai-consultant-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-agentic-ai-consultant-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-data-scientist-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-data-scientist-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-machine-learning-engineer-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-machine-learning-engineer-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3600,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-bigdata-engineer-snowflake-dbt-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3600,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-bigdata-engineer-snowflake-dbt-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-networking-sre-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-networking-sre-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-data-engineer-azure-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-data-engineer-azure-softserve-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-dynamic-devs-santiago-bc22' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-dynamic-devs-santiago-bc22' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-a-de-soluciones-ti-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-a-de-soluciones-ti-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2800,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-product-engineer-chipax-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2800,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-product-engineer-chipax-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-niuro-remote-b1c5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-niuro-remote-b1c5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-neuralworks-santiago-8081' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-neuralworks-santiago-8081' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-engineer-ssr-nestjs-hexagonal-aws-witi-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-engineer-ssr-nestjs-hexagonal-aws-witi-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-governance-gcp-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-governance-gcp-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-cloud-native-ii-sede-alameda-jornada-diurna-duoc-uc-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-cloud-native-ii-sede-alameda-jornada-diurna-duoc-uc-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/msp-senior-system-engineer-pacific-cloud-cyber-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/msp-senior-system-engineer-pacific-cloud-cyber-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-ml-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-ml-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-neuralworks-santiago-219c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-neuralworks-santiago-219c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-senior-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-senior-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-gcp-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-gcp-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-codeable-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-codeable-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-genai-python-llms-sector-bancario-devsu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-genai-python-llms-sector-bancario-devsu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-ai-engineer-devsu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-ai-engineer-devsu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-databricks-on-azure-devsu-remote-7b55' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-databricks-on-azure-devsu-remote-7b55' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-trainee-aprendiz-de-inteligencia-artificial-factor-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-trainee-aprendiz-de-inteligencia-artificial-factor-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-sr-data-ai-grupo-mariposa-remote-48e8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-sr-data-ai-grupo-mariposa-remote-48e8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/aws-infrastructure-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/aws-infrastructure-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-semi-senior-factor-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gcp-semi-senior-factor-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-semi-senior-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-semi-senior-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-infrastructure-platform-engineer-niuro-remote-e893' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-infrastructure-platform-engineer-niuro-remote-e893' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-marketing-lead-autoraptor-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-marketing-lead-autoraptor-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-cloud-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-cloud-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cybersecurity-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cybersecurity-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/engineering-manager-senior-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/engineering-manager-senior-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-yom-yom-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-yom-yom-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-senior-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-senior-dsac-chile-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-azure-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-azure-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sr-java-platform-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sr-java-platform-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-back-end-engineer-java-google-cloud-platform-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-back-end-engineer-java-google-cloud-platform-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-product-engineering-it-trusted-partner-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-product-engineering-it-trusted-partner-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-senior-grupo-mariposa-remote-a1d5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-senior-grupo-mariposa-remote-a1d5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/practicante-agentes-ia-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/practicante-agentes-ia-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ssenior-data-engineer-amazon-redshift-expert-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ssenior-data-engineer-amazon-redshift-expert-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-neuralworks-santiago-b50f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-neuralworks-santiago-b50f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-software-engineer-witi-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-software-engineer-witi-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-platform-engineering-lead-dynamic-devs-santiago-f1e1' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-platform-engineering-lead-dynamic-devs-santiago-f1e1' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-llms-rag-ai-agents-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-llms-rag-ai-agents-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-database-engineer-ai-agentic-automation-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-database-engineer-ai-agentic-automation-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/platform-engineer-dynamic-devs-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/platform-engineer-dynamic-devs-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-dynamic-devs-santiago-0ac3' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-dynamic-devs-santiago-0ac3' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/seo-ai-search-manager-influencers-club-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/seo-ai-search-manager-influencers-club-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-data-engineer-java-factor-it-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-data-engineer-java-factor-it-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,850,1100,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/estimating-operations-associate-training-track-renaissance-restoration-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',850,N'; max=',1100) WHERE url_vacante=N'https://www.getonbrd.com/jobs/estimating-operations-associate-training-track-renaissance-restoration-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2800,2900,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-node-js-react-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2800,N'; max=',2900) WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-node-js-react-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-node-js-nestjs-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-node-js-nestjs-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-niuro-remote-803e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-niuro-remote-803e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-semi-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-semi-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-full-stack-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-full-stack-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,7100,9600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/principal-engineer-cocoon-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',7100,N'; max=',9600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/principal-engineer-cocoon-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5000,8000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-engineer-the-configurations-lab-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5000,N'; max=',8000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-engineer-the-configurations-lab-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-guinea-mobile-sac-cuy-movil-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-guinea-mobile-sac-cuy-movil-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3800,4100,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-devops-engineer-checkr-santiago-4551' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3800,N'; max=',4100) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-devops-engineer-checkr-santiago-4551' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5500,8000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/staff-backend-engineer-dugu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5500,N'; max=',8000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/staff-backend-engineer-dugu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1900,2900,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-sales-engineer-factor-it-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1900,N'; max=',2900) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-sales-engineer-factor-it-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/platform-engineering-lead-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/platform-engineering-lead-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-senior-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-senior-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-engineer-diverse-programmers-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-engineer-diverse-programmers-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-semi-senior-aws-data-governance-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-semi-senior-aws-data-governance-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3400,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-ii-dugu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3400,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/software-engineer-ii-dugu-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-gcp-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-gcp-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-wordpress-maintenance-deployment-engineer-creativeworks-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-wordpress-maintenance-deployment-engineer-creativeworks-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-factor-it-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-factor-it-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-account-manager-factor-it-bogota-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-account-manager-factor-it-bogota-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-vequity-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-vequity-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gobierno-y-seguridad-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-gobierno-y-seguridad-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-engineer-mid-sr-alegra-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-engineer-mid-sr-alegra-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3200,3700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-databricks-integratz-remote-c63f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3200,N'; max=',3700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-databricks-integratz-remote-c63f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1200,1600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-ops-and-customer-communications-stealth-seller-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1200,N'; max=',1600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-ops-and-customer-communications-stealth-seller-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sr-devops-infrastructure-consultant-inflect-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sr-devops-infrastructure-consultant-inflect-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-decision-point-latam-ciudad-de-mexico-santiago-3614' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-decision-point-latam-ciudad-de-mexico-santiago-3614' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-research-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-research-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,6000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-bavardio-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',6000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-bavardio-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-bc-tecnologia-santiago-8826' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-bc-tecnologia-santiago-8826' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5500,7000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-software-developer-one-click-technology-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5500,N'; max=',7000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-software-developer-one-click-technology-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-account-manager-tam-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-account-manager-tam-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1900,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-etl-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1900,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-etl-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-automation-molten-cloud-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-automation-molten-cloud-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ia-engineer-rag-generative-ai-improving-south-america-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ia-engineer-rag-generative-ai-improving-south-america-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-data-engineering-niuro-remote-ca91' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-data-engineering-niuro-remote-ca91' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,4400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-grafton-latam-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',4400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-grafton-latam-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/editor-of-customer-experience-product-narrative-strategy-force-of-nature-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/editor-of-customer-experience-product-narrative-strategy-force-of-nature-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2200,3300,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-scientist-us-office-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2200,N'; max=',3300) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-scientist-us-office-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-scientist-genai-rag-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-scientist-genai-rag-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-gcp-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-gcp-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/site-reliability-engineer-sre-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/site-reliability-engineer-sre-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-aws-datalake-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-aws-datalake-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-engineer-node-python-aws-improving-south-america-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-engineer-node-python-aws-improving-south-america-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-platform-engineer-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-platform-engineer-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-platform-engineer-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-cloud-platform-engineer-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1800,2200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sre-devops-engineer-junior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1800,N'; max=',2200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sre-devops-engineer-junior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,800,1200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-engineer-guinea-mobile-sac-cuy-movil-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',800,N'; max=',1200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-engineer-guinea-mobile-sac-cuy-movil-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-risk-ops-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-risk-ops-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-cloud-engineer-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-cloud-engineer-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-senior-bci-santiago-3e19' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-senior-bci-santiago-3e19' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-diseno-de-arquitecturas-sede-melipilla-j-diurna-duoc-uc-melipilla' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-diseno-de-arquitecturas-sede-melipilla-j-diurna-duoc-uc-melipilla' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-introduccion-a-herramientas-devops-sede-alameda-duoc-uc-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-introduccion-a-herramientas-devops-sede-alameda-duoc-uc-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-infraestructura-it-ot-onpremise-cloud-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-infraestructura-it-ot-onpremise-cloud-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-ml-engineer-llm-development-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-ml-engineer-llm-development-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-devops-semi-senior-bc-tecnologia-santiago-36a8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-devops-semi-senior-bc-tecnologia-santiago-36a8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-product-manager-tcit-santiago-7796' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-product-manager-tcit-santiago-7796' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-product-manager-tech-lead-digital-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-product-manager-tech-lead-digital-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-sales-outsystems-con-ingles-y-espanol-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-sales-outsystems-con-ingles-y-espanol-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-senior-bci-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-senior-bci-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-desarrollo-ia-y-plataforma-penta-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-desarrollo-ia-y-plataforma-penta-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2300,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-cloud-aws-promarketing-remote-274d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2300) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-cloud-aws-promarketing-remote-274d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-devops-cloud-gcp-aws-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-devops-cloud-gcp-aws-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1300,1900,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-infraestructura-y-soporte-ti-apex-group-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1300,N'; max=',1900) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-infraestructura-y-soporte-ti-apex-group-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,1800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-devops-junior-transvip-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',1800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-devops-junior-transvip-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2300,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-cloud-riskamerica-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2300,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-cloud-riskamerica-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-big-data-cloud-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-big-data-cloud-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-infraestructura-cloud-azure-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-infraestructura-cloud-azure-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-developer-net-python-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-developer-net-python-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-bice-vida-santiago-b551' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-bice-vida-santiago-b551' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-desarrollo-moviles-sede-alameda-duoc-uc-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-desarrollo-moviles-sede-alameda-duoc-uc-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-en-control-y-cierre-operacional-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-en-control-y-cierre-operacional-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/semi-senior-java-developer-etl-23people-remote-ebb4' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/semi-senior-java-developer-etl-23people-remote-ebb4' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,5500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/mobile-user-acquisition-manager-app-campaigns-idt-corporation-remote-bd33' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',5500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/mobile-user-acquisition-manager-app-campaigns-idt-corporation-remote-bd33' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-finanzas-42labs-santiago-valparaiso-vina-del-mar-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-finanzas-42labs-santiago-valparaiso-vina-del-mar-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-mobile-full-stack-engineer-net-maui-ios-java-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-mobile-full-stack-engineer-net-maui-ios-java-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-devsu-quito-b5df' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-devsu-quito-b5df' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-people-analytics-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-people-analytics-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-middle-bice-vida-santiago-247f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-middle-bice-vida-santiago-247f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-senior-bice-vida-santiago-cde7' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-senior-bice-vida-santiago-cde7' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-nivel-ii-unholster-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-nivel-ii-unholster-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1400,2300,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-unholster-santiago-2697' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1400,N'; max=',2300) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-unholster-santiago-2697' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-operational-engineer-timining-santiago-e34d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-operational-engineer-timining-santiago-e34d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/gerente-de-proyectos-gobierno-de-datos-factor-it-bogota-cba8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/gerente-de-proyectos-gobierno-de-datos-factor-it-bogota-cba8' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-storage-operations-specialist-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-storage-operations-specialist-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-net-etl-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-net-etl-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3400,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ssis-data-migration-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3400,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ssis-data-migration-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-governance-analyst-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-governance-analyst-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineering-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineering-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-gobierno-de-datos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-gobierno-de-datos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-activation-specialist-col-healthatom-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-activation-specialist-col-healthatom-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-artefact-latam-ciudad-de-mexico-lima-bogota-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-artefact-latam-ciudad-de-mexico-lima-bogota-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-a-de-integraciones-gcp-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-a-de-integraciones-gcp-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3100,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/big-data-engineer-databricks-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3100,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/big-data-engineer-databricks-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-engineer-client-success-operations-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-engineer-client-success-operations-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3200,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-software-engineer-sas-python-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3200,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-software-engineer-sas-python-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-postventa-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-postventa-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/actuario-senior-bnp-paribas-cardif-santiago-d762' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/actuario-senior-bnp-paribas-cardif-santiago-d762' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-java-developer-odbc-jdbc-bi-connectors-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-java-developer-odbc-jdbc-bi-connectors-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-trainee-tecnologias-y-datos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-trainee-tecnologias-y-datos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-datos-data-analyst-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-datos-data-analyst-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-databricks-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-databricks-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-neuralworks-santiago-5b70' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-neuralworks-santiago-5b70' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/applied-scientist-neuralworks-santiago-dc1e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/applied-scientist-neuralworks-santiago-dc1e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,100,100,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-semi-senior-senior-drimo-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',100,N'; max=',100) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-semi-senior-senior-drimo-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1700,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/amazon-growth-manager-elevate-growth-group-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1700,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/amazon-growth-manager-elevate-growth-group-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-amazon-redshift-expert-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-amazon-redshift-expert-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1600,1900,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-formacion-y-desarrollo-agrosuper-rancagua-adab' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1600,N'; max=',1900) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-formacion-y-desarrollo-agrosuper-rancagua-adab' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-redshift-expert-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-redshift-expert-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-trainee-industrial-agrosuper-rancagua-1685' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-trainee-industrial-agrosuper-rancagua-1685' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-data-analyst-42labs-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-data-analyst-42labs-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2800,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-analyst-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2800,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-analyst-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2200,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-mediastream-remote-f08c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2200,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-mediastream-remote-f08c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-operaciones-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-operaciones-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/actuario-senior-pricing-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/actuario-senior-pricing-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-control-siniestros-masivos-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-control-siniestros-masivos-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-estudios-actuariales-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-estudios-actuariales-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-control-de-gestion-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-control-de-gestion-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2300,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/email-marketing-analytics-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2300,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/email-marketing-analytics-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/practicante-area-pos-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/practicante-area-pos-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-aws-dsac-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-aws-dsac-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-aws-lakehouse-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-aws-lakehouse-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-calidad-de-datos-y-metricas-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-calidad-de-datos-y-metricas-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-data-management-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-data-management-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-experiencia-clientes-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-experiencia-clientes-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-sap-mm-lisit-santiago-6165' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-sap-mm-lisit-santiago-6165' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1000,1000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/performance-marketer-creative-strategist-mc-compound-digitial-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1000,N'; max=',1000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/performance-marketer-creative-strategist-mc-compound-digitial-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-timining-santiago-45d2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-timining-santiago-45d2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1100,1600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-proyecto-implementacion-ziyu-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1100,N'; max=',1600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-proyecto-implementacion-ziyu-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-de-customer-success-mx-comunidadfeliz-remote-1416' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-de-customer-success-mx-comunidadfeliz-remote-1416' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/account-manager-de-medios-codeable-lima-dd1d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/account-manager-de-medios-codeable-lima-dd1d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4500,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-layer-developer-we-built-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4500,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-layer-developer-we-built-it-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-procesos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-procesos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-seo-medical-accounts-tier3-media-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-seo-medical-accounts-tier3-media-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,6700,8000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/engineering-manager-data-acquisition-bulk-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',6700,N'; max=',8000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/engineering-manager-data-acquisition-bulk-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cientista-de-datos-coolebra-spa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cientista-de-datos-coolebra-spa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-desarrollador-cobol-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-desarrollador-cobol-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-manager-colectivo23-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-manager-colectivo23-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-datos-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,6000,9000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-revel-street-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',6000,N'; max=',9000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-revel-street-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/finance-intern-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/finance-intern-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/account-manager-enterprise-omnix-ai-corp-barcelona-madrid' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/account-manager-enterprise-omnix-ai-corp-barcelona-madrid' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-big-data-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-big-data-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-big-data-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-big-data-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-operacional-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-operacional-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-analyst-colectivo23-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-analyst-colectivo23-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-marketing-specialist-colectivo23-ciudad-de-mexico-942e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-marketing-specialist-colectivo23-ciudad-de-mexico-942e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1300,1600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-geti-santiago-f6ea' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1300,N'; max=',1600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-geti-santiago-f6ea' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,600,1000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/amazon-retail-account-manager-vendor-central-seller-cen-elevate33-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',600,N'; max=',1000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/amazon-retail-account-manager-vendor-central-seller-cen-elevate33-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-estudios-actuariales-bnp-paribas-cardif-santiago-4435' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-estudios-actuariales-bnp-paribas-cardif-santiago-4435' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-clientes-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-clientes-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-semi-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-semi-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-procesos-de-operaciones-michael-page-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-procesos-de-operaciones-michael-page-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/paid-media-manager-mission-disrupt-remote-5216' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/paid-media-manager-mission-disrupt-remote-5216' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/marketing-campaign-strategy-manager-promarketing-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/marketing-campaign-strategy-manager-promarketing-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-aws-big-data-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-aws-big-data-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-bc-tecnologia-remote-743c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-bc-tecnologia-remote-743c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/asistente-de-administracion-finanzas-colectivo23-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/asistente-de-administracion-finanzas-colectivo23-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-bc-tecnologia-santiago-758c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-bc-tecnologia-santiago-758c' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-bi-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-datos-bi-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-procesos-y-datos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-procesos-y-datos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-y-datos-bc-tecnologia-santiago-108e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-y-datos-bc-tecnologia-santiago-108e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,1700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-y-datos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',1700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-automatizacion-y-datos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-adoption-platform-specialist-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-adoption-platform-specialist-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-specialist-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-specialist-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-operaciones-y-gestion-de-proveedores-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-operaciones-y-gestion-de-proveedores-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-especialista-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-datos-especialista-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-consultant-artefact-latam-bogota-santiago-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-consultant-artefact-latam-bogota-santiago-ciudad-de-mexico' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-engineer-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-governance-consultant-artefact-latam-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-governance-consultant-artefact-latam-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-proyecto-hibrida-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-proyecto-hibrida-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/bi-power-bi-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/bi-power-bi-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-analyst-proyecto-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-analyst-proyecto-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3200,4100,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-scientist-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3200,N'; max=',4100) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-scientist-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-aws-bc-tecnologia-remote-d2a1' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-engineer-aws-bc-tecnologia-remote-d2a1' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-designer-semi-senior-bc-tecnologia-santiago-ddc3' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-designer-semi-senior-bc-tecnologia-santiago-ddc3' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-factoring-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-factoring-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,800,1000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-pagos-y-liquidacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',800,N'; max=',1000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-pagos-y-liquidacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-datos-business-intelligence-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-datos-business-intelligence-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-consultant-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-data-consultant-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-artefact-latam-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1200,1800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-calidad-de-datos-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1200,N'; max=',1800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-calidad-de-datos-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-facturacion-talana-santiago-250e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-facturacion-talana-santiago-250e' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1100,1200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-calidad-y-experiencia-del-servicio-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1100,N'; max=',1200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-calidad-y-experiencia-del-servicio-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-sap-basis-junior-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-sap-basis-junior-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-en-ciberseguridad-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-en-ciberseguridad-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-performance-digital-dsac-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-performance-digital-dsac-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-java-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-java-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-programador-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-programador-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-contable-financiero-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-contable-financiero-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-database-engineer-maria-db-postgresql-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-database-engineer-maria-db-postgresql-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-ai-engineer-databricks-contract-intelligence-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-ai-engineer-databricks-contract-intelligence-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-calidad-de-datos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-calidad-de-datos-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-ai-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lead-ai-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-backend-hubspot-integrations-migrations-wendt-partners-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-backend-hubspot-integrations-migrations-wendt-partners-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/gtm-engineer-niuro-remote-9639' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/gtm-engineer-niuro-remote-9639' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/web-designer-design-first-react-typescript-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/web-designer-design-first-react-typescript-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-frontend-software-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-frontend-software-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-seo-ux-copywriter-autoraptor-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-seo-ux-copywriter-autoraptor-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-zaelot-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-zaelot-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-engineer-senior-grupo-mariposa-remote-be51' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-engineer-senior-grupo-mariposa-remote-be51' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-engineer-niuro-remote-87ec' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-engineer-niuro-remote-87ec' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/web-app-full-stack-engineer-niuro-remote-4461' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/web-app-full-stack-engineer-niuro-remote-4461' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-niuro-remote-42c5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-ai-engineer-niuro-remote-42c5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/forward-deployed-engineer-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-ia-engineer-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/data-scientist-ia-engineer-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-modelado-y-diseno-de-datos-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-modelado-y-diseno-de-datos-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-jira-atlassian-engineer-niuro-remote-510f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-jira-atlassian-engineer-niuro-remote-510f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1800,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-support-product-testing-opencourt-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1800,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-support-product-testing-opencourt-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-marketing-specialist-organic-web-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-marketing-specialist-organic-web-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/real-time-ai-orchestration-engineer-sugarshan-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/real-time-ai-orchestration-engineer-sugarshan-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-tester-crm-dynamics-365-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-tester-crm-dynamics-365-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/dataops-engineer-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/dataops-engineer-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-dynamic-devs-remote-cc99' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-dynamic-devs-remote-cc99' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-php-developer-laravel-aws-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-php-developer-laravel-aws-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-web-foco-backend-witi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-web-foco-backend-witi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/dba-microsoft-sql-server-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/dba-microsoft-sql-server-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-machine-learning-semi-senior-robotia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-machine-learning-semi-senior-robotia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-sr-back-y-fontend-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-sr-back-y-fontend-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-senior-checkr-santiago-e09f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-senior-checkr-santiago-e09f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1800,2100,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-soporte-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1800,N'; max=',2100) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-soporte-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-terreno-ia-usercode-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-terreno-ia-usercode-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3700,4600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-senior-backend-checkr-santiago-c60a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3700,N'; max=',4600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-senior-backend-checkr-santiago-c60a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/kam-control-de-gestion-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/kam-control-de-gestion-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-qa-automatizador-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-qa-automatizador-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2600,3600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-mid-senior-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2600,N'; max=',3600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-mid-senior-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-integracion-y-seguridad-de-datos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-integracion-y-seguridad-de-datos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2400,3600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-capital-express-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2400,N'; max=',3600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-capital-express-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3600,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-software-senior-backend-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3600,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-software-senior-backend-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4700,5700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-engineer-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4700,N'; max=',5700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-engineer-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-angular-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-angular-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-backend-engineer-ruby-python-golang-java-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-backend-engineer-ruby-python-golang-java-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3800,4400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-senior-python-ruby-java-go-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3800,N'; max=',4400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-senior-python-ruby-java-go-checkr-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-implementacion-de-ia-e-hiperautomatizacion-usercode-spa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-implementacion-de-ia-e-hiperautomatizacion-usercode-spa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-full-stack-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-software-full-stack-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-infraestructura-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-infraestructura-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-ml-data-scientist-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-ml-data-scientist-lisit-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3300,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-java-developer-test-automation-ai-23people-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3300,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-java-developer-test-automation-ai-23people-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-qa-testing-funcional-agilesoft-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-qa-testing-funcional-agilesoft-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-senior-c-net-maui-ios-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-senior-c-net-maui-ios-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-cumplo-santiago-3dd2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-cumplo-santiago-3dd2' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-liferay-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-liferay-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-dynamic-devs-santiago-9933' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-lead-dynamic-devs-santiago-9933' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-semi-senior-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-semi-senior-tcit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-product-manager-dynamic-devs-santiago-d99a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-product-manager-dynamic-devs-santiago-d99a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/encargado-de-redes-e-infraestructura-ti-unholster-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/encargado-de-redes-e-infraestructura-ti-unholster-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-typescript-react-dynamic-devs-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-typescript-react-dynamic-devs-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-engineer-rag-intelligent-agents-dynamic-devs-santiago-61bd' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-engineer-rag-intelligent-agents-dynamic-devs-santiago-61bd' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-witi-santiago-ffa5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-witi-santiago-ffa5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-soluciones-aws-witi-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-soluciones-aws-witi-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2200,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnico-3it-santiago-179f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2200,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnico-3it-santiago-179f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/dba-oracle-middle-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/dba-oracle-middle-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-tester-grupo-mariposa-remote-8728' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-tester-grupo-mariposa-remote-8728' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-senior-estrategia-y-performance-continuum-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-senior-estrategia-y-performance-continuum-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sre-engineer-site-reliability-engineer-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sre-engineer-site-reliability-engineer-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1100,1400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-infraestructura-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1100,N'; max=',1400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-infraestructura-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-manual-y-automatizacion-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-manual-y-automatizacion-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-bc-tecnologia-santiago-f47a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-bc-tecnologia-santiago-f47a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-gcp-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-gcp-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2300,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-apex-group-chile-santiago-f267' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2300) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-apex-group-chile-santiago-f267' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-frontend-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-frontend-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-ai-infrastructure-engineer-crost-ai-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-ai-infrastructure-engineer-crost-ai-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-full-stack-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-full-stack-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-analyst-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-analyst-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-senior-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-senior-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-procesos-ti-bancario-alta-criticidad-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-procesos-ti-bancario-alta-criticidad-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-outsystems-con-ingles-y-espanol-latam-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-outsystems-con-ingles-y-espanol-latam-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-qa-automation-engineer-net-c-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-qa-automation-engineer-net-c-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/net-engineer-autoraptor-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/net-engineer-autoraptor-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sdet-software-development-engineer-in-test-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sdet-software-development-engineer-in-test-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/administrador-a-de-infraestructura-linux-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/administrador-a-de-infraestructura-linux-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-fullstack-bc-tecnologia-santiago-8935' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-fullstack-bc-tecnologia-santiago-8935' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/gerente-de-infraestructura-operaciones-linux-cdn-mediastream-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/gerente-de-infraestructura-operaciones-linux-cdn-mediastream-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4300,4900,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnico-full-stack-python-angular-azure-grupo-sud-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4300,N'; max=',4900) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnico-full-stack-python-angular-azure-grupo-sud-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2200,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-mobile-react-native-java-3it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2200,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-mobile-react-native-java-3it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-grupo-mariposa-remote-56da' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-grupo-mariposa-remote-56da' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnologico-con-ia-y-azure-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnologico-con-ia-y-azure-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-calidad-faenadora-san-vicente-agrosuper-san-vicente' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-calidad-faenadora-san-vicente-agrosuper-san-vicente' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-back-end-agilesoft-spa-remote-b90b' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-back-end-agilesoft-spa-remote-b90b' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/outsystems-qa-con-ingles-avanzado-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/outsystems-qa-con-ingles-avanzado-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/frontend-engineer-cumplo-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/frontend-engineer-cumplo-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-back-end-python-fastapi-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-back-end-python-fastapi-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-de-redes-y-telecomunicaciones-tarapaca-bc-tecnologia-iquique' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-de-redes-y-telecomunicaciones-tarapaca-bc-tecnologia-iquique' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-automatizador-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-automatizador-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-software-lider-tecnico-java-senior-bc-tecnologia-santiago-d401' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-software-lider-tecnico-java-senior-bc-tecnologia-santiago-d401' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-laravel-usercode-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-laravel-usercode-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/scrum-master-senior-bc-tecnologia-santiago-b2d7' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/scrum-master-senior-bc-tecnologia-santiago-b2d7' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-grupo-mariposa-remote-c340' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-grupo-mariposa-remote-c340' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-c-net-y-angular-mexico-bc-tecnologia-mexicali' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-c-net-y-angular-mexico-bc-tecnologia-mexicali' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-java-angular-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-java-angular-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,1600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-lisit-santiago-f0dd' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',1600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-full-stack-lisit-santiago-f0dd' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-senior-microsoft-dynamics-365-cs-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-senior-microsoft-dynamics-365-cs-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-senior-microsoft-dynamics-365-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-senior-microsoft-dynamics-365-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-senior-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-senior-factor-it-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2700,3700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/node-backend-engineer-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2700,N'; max=',3700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/node-backend-engineer-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/fullstack-developer-node-js-typescript-react-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/fullstack-developer-node-js-typescript-react-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-control-interno-y-cumplimiento-sox-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-control-interno-y-cumplimiento-sox-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-tester-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-funcional-tester-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/node-backend-engineer-semi-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/node-backend-engineer-semi-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-qa-senior-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-qa-senior-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-infraestructura-ti-usuarios-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-infraestructura-ti-usuarios-bice-vida-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2700,3700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2700,N'; max=',3700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-semi-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-engineer-semi-senior-prontopaga-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-devops-sonda-santiago-7856' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-devops-sonda-santiago-7856' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-semi-senior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-semi-senior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-asimov-consultores-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-asimov-consultores-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-product-manager-dynamic-devs-santiago-53f9' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/technical-product-manager-dynamic-devs-santiago-53f9' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-developer-python-nodejs-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-developer-python-nodejs-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-neuralworks-santiago-dc0f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-neuralworks-santiago-dc0f' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-a-de-producto-y-proyectos-vain-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-a-de-producto-y-proyectos-vain-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/fullstack-developer-java-angular-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/fullstack-developer-java-angular-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-a-de-software-cloud-aws-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-a-de-software-cloud-aws-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-mobile-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-mobile-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/devsecops-engineer-senior-zyght-hse-software-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/devsecops-engineer-senior-zyght-hse-software-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-observabilidad-y-operaciones-ti-riskamerica-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-observabilidad-y-operaciones-ti-riskamerica-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-fullstack-node-js-gcp-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-fullstack-node-js-gcp-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-procesos-ti-presencial-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-procesos-ti-presencial-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-de-portafolio-digital-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-de-portafolio-digital-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-sonda-santiago-333d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-sonda-santiago-333d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2800,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-full-stack-developer-informat-s-a-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2800,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/devops-engineer-full-stack-developer-informat-s-a-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/pmo-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/pmo-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/pmo-vmo-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/pmo-vmo-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1700,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-e-infraestructura-apex-group-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1700,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-e-infraestructura-apex-group-chile-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1800,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-developer-react-aws-serverless-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1800,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/full-stack-developer-react-aws-serverless-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-developer-improving-south-america-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-software-developer-improving-south-america-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1800,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/aws-backend-event-driven-engineer-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1800,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/aws-backend-event-driven-engineer-ryc-tech-group-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-qa-engineer-niuro-remote-f141' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-qa-engineer-niuro-remote-f141' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/pmo-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/pmo-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-nestjs-react-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-nestjs-react-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnico-devops-weblogic-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-tecnico-devops-weblogic-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/dba-oracle-senior-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/dba-oracle-senior-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-bc-tecnologia-santiago-75a5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-bc-tecnologia-santiago-75a5' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-plataformas-aws-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-plataformas-aws-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-full-stack-jr-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-full-stack-jr-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-gda-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-gda-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/administrador-senior-infraestructura-osb-odi-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/administrador-senior-infraestructura-osb-odi-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-mulesoft-semi-senior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-mulesoft-semi-senior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-developer-node-js-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-developer-node-js-aws-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-web-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-web-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-latam-remoto-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automation-engineer-latam-remoto-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-empresarial-digital-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-empresarial-digital-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-full-stack-engineer-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-qa-tester-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-qa-tester-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-manual-senior-bc-tecnologia-buenos-aires' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-manual-senior-bc-tecnologia-buenos-aires' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3500,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/fullstack-developer-senior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3500,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/fullstack-developer-senior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-funcional-canales-digitales-web-amp-app-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-funcional-canales-digitales-web-amp-app-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-proyectos-de-tecnologia-e-infraestructura-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-proyectos-de-tecnologia-e-infraestructura-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sre-devops-engineer-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sre-devops-engineer-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-java-jboss-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-java-jboss-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-a-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-a-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-qa-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-manual-sector-bancario-bc-tecnologia-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-manual-sector-bancario-bc-tecnologia-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-latam-remoto-proyecto-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-automatizador-latam-remoto-proyecto-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-qa-analyst-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/qa-engineer-qa-analyst-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-developer-senior-aws-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-developer-senior-aws-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-fullstack-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/developer-fullstack-latam-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-mesa-de-ayuda-lima-bsale-lima-9447' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-mesa-de-ayuda-lima-bsale-lima-9447' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sales-representative-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sales-representative-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/director-of-operations-exitpath-partners-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/director-of-operations-exitpath-partners-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1400,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/creative-account-manager-better-swag-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1400,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/creative-account-manager-better-swag-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1600,1700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-l1-l2-ti-helpdesk-lebox-concepcion' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1600,N'; max=',1700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-l1-l2-ti-helpdesk-lebox-concepcion' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-de-aplicaciones-n1-lisit-santiago-903a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-de-aplicaciones-n1-lisit-santiago-903a' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnologo-a-de-inventario-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnologo-a-de-inventario-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/coordinador-a-del-servicio-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/coordinador-a-del-servicio-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,800,800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-manager-key-accounts-un-dia-menos-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',800,N'; max=',800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/customer-success-manager-key-accounts-un-dia-menos-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-servicio-al-cliente-bsale-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-servicio-al-cliente-bsale-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-ti-tecnico-de-soporte-informatico-nivel-1-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-ti-tecnico-de-soporte-informatico-nivel-1-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-sales-specialist-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-sales-specialist-agendapro-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-ti-n1-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-ti-n1-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-ti-n1-mesa-de-ayuda-y-automatizacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-ti-n1-mesa-de-ayuda-y-automatizacion-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-procesos-hibrido-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-procesos-hibrido-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-implementacion-saas-hr-talento-do-cultura-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-implementacion-saas-hr-talento-do-cultura-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,5000,5400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-growth-performance-marketing-cashera-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',5000,N'; max=',5400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-growth-performance-marketing-cashera-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/amazon-brand-manager-the-shipping-store-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/amazon-brand-manager-the-shipping-store-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/marketing-coordinator-law-firm-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/marketing-coordinator-law-firm-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,2600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-ti-modernizacion-de-aplicaciones-legacy-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',2600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-ti-modernizacion-de-aplicaciones-legacy-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/regional-project-manager-geovictoria-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/regional-project-manager-geovictoria-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-marketing-coordinator-equity-medical-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-marketing-coordinator-equity-medical-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-account-manager-devsu-remote-1007' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-account-manager-devsu-remote-1007' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/editor-a-senior-de-ficcion-pronyr-tv-cute-digital-media-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/editor-a-senior-de-ficcion-pronyr-tv-cute-digital-media-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-implementacion-nomina-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-implementacion-nomina-rankmi-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-engineering-lead-agentic-development-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ai-engineering-lead-agentic-development-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1100,1500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/operational-automation-engineer-comunidadfeliz-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1100,N'; max=',1500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/operational-automation-engineer-comunidadfeliz-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/international-hrbp-lider-gestion-personas-internacional-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/international-hrbp-lider-gestion-personas-internacional-agrosuper-rancagua' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyecto-de-implementacion-geovictoria-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyecto-de-implementacion-geovictoria-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-analyst-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-analyst-xintec-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-outsystems-senior-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-outsystems-senior-i2b-technologies-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/gtm-operations-specialist-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/gtm-operations-specialist-niuro-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1700,2200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/pm-bogota-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1700,N'; max=',2200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/pm-bogota-factor-it-bogota' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-manager-stucco-champions-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-manager-stucco-champions-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/social-media-manager-omnicanal-iboost-social-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/social-media-manager-omnicanal-iboost-social-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-devaid-remote-0f88' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-devaid-remote-0f88' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3750,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-designer-marketing-wunderdogs-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3750) WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-designer-marketing-wunderdogs-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/executive-marketing-assistant-gro-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/executive-marketing-assistant-gro-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,4000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/chief-of-staff-babou-ai-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',4000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/chief-of-staff-babou-ai-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1200,1500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/wordpress-content-publishing-specialist-junior-front-end-d-josh-brown-consulting-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1200,N'; max=',1500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/wordpress-content-publishing-specialist-junior-front-end-d-josh-brown-consulting-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/shopify-developer-ongoing-part-time-casa-hidalgo-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/shopify-developer-ongoing-part-time-casa-hidalgo-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,500,600,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/content-writer-hma-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',500,N'; max=',600) WHERE url_vacante=N'https://www.getonbrd.com/jobs/content-writer-hma-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,5000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/wordpress-developer-ai-first-brand-bot-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',5000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/wordpress-developer-ai-first-brand-bot-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/video-editing-specialist-direct-response-ai-video-editor-trust-based-mobility-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/video-editing-specialist-direct-response-ai-video-editor-trust-based-mobility-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-execution-partner-force-of-nature-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-execution-partner-force-of-nature-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-ai-enthusiast-cleveland-holding-group-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/operations-ai-enthusiast-cleveland-holding-group-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/inside-sales-representative-stucco-champions-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/inside-sales-representative-stucco-champions-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1800,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-proyectos-y-procesos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1800,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-proyectos-y-procesos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-operations-signant-health-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/project-manager-operations-signant-health-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/gestor-de-proyectos-facilitador-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/gestor-de-proyectos-facilitador-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-seguridad-en-proyectos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-seguridad-en-proyectos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/program-manager-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/program-manager-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-de-telecomunicaciones-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyectos-de-telecomunicaciones-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/coordinador-a-de-proyectos-pmo-operativo-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/coordinador-a-de-proyectos-pmo-operativo-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyecto-ti-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/jefe-de-proyecto-ti-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,800,1000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/asistente-comercial-outsourcing-servicios-ti-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',800,N'; max=',1000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/asistente-comercial-outsourcing-servicios-ti-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sr-react-developer-ingles-intermedio-e-commerce-smith-remote-7b09' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sr-react-developer-ingles-intermedio-e-commerce-smith-remote-7b09' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-desarrollo-tecnologico-ecometric-concepcion-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-desarrollo-tecnologico-ecometric-concepcion-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/programador-fullstack-contabilidad-c-d-agromanagement-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/programador-fullstack-contabilidad-c-d-agromanagement-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,4000,4500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-analyst-paid-acquisition-to-repeat-revenue-real-id-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',4000,N'; max=',4500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-analyst-paid-acquisition-to-repeat-revenue-real-id-inc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-inversiones-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-inversiones-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-contable-ing-comercial-leytonmedia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-contable-ing-comercial-leytonmedia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-developer-pci-aws-hf-solutions-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/backend-developer-pci-aws-hf-solutions-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2800,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-continuidad-operacional-ti-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2800) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-continuidad-operacional-ti-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,300,300,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/practica-profesional-ingenieria-zerviz-technologies-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',300,N'; max=',300) WHERE url_vacante=N'https://www.getonbrd.com/jobs/practica-profesional-ingenieria-zerviz-technologies-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-introduccion-ciberseguridad-sede-melipilla-diurno-duoc-uc-melipilla' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/docente-introduccion-ciberseguridad-sede-melipilla-diurno-duoc-uc-melipilla' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-security-operations-analyst-interfell-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cloud-security-operations-analyst-interfell-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-seguridad-de-la-informacion-timining-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-seguridad-de-la-informacion-timining-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1300,2000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-development-specialist-zurge-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1300,N'; max=',2000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/business-development-specialist-zurge-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-ciberseguridad-bice-vida-santiago-d1f9' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/arquitecto-de-ciberseguridad-bice-vida-santiago-d1f9' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,3000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-de-seguridad-informatica-grupo-mariposa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',3000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-de-seguridad-informatica-grupo-mariposa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-operational-resilience-manager-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/digital-operational-resilience-manager-bnp-paribas-cardif-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-iam-iga-gestion-de-identidades-y-accesos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tech-lead-iam-iga-gestion-de-identidades-y-accesos-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/cybersecurity-lead-grupo-mariposa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/cybersecurity-lead-grupo-mariposa-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,100,100,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/administrador-de-ti-y-ciberseguridad-quinenco-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',100,N'; max=',100) WHERE url_vacante=N'https://www.getonbrd.com/jobs/administrador-de-ti-y-ciberseguridad-quinenco-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ethical-hacker-pentester-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ethical-hacker-pentester-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2500,2700,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-ciberseguridad-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2500,N'; max=',2700) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-de-ciberseguridad-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-seguridad-de-la-informacion-junior-bc-tecnologia-santiago-bb38' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-seguridad-de-la-informacion-junior-bc-tecnologia-santiago-bb38' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/auditor-it-senior-cyber-audit-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/auditor-it-senior-cyber-audit-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-seguridad-de-la-informacion-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-seguridad-de-la-informacion-junior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-cobol-mainframe-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-cobol-mainframe-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-operaciones-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-de-operaciones-sonda-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-informatico-antofagasta-bc-tecnologia-antofagasta' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-informatico-antofagasta-bc-tecnologia-antofagasta' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-con-enfoque-en-ia-generativa-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/machine-learning-engineer-con-enfoque-en-ia-generativa-improving-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,2000,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-de-soporte-y-gestion-de-aplicaciones-ti-it-trusted-partner-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',2000,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/lider-de-soporte-y-gestion-de-aplicaciones-ti-it-trusted-partner-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/telecommunications-network-support-technician-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/telecommunications-network-support-technician-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1500,2500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-sap-group-reporting-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1500,N'; max=',2500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-sap-group-reporting-lisit-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnico-a-de-inventario-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnico-a-de-inventario-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-de-mesa-de-servicios-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/agente-de-mesa-de-servicios-ti-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-on-site-support-technician-level-1-5-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-on-site-support-technician-level-1-5-factor-it-medellin' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-soporte-y-adopcion-ia-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-soporte-y-adopcion-ia-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3000,3500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-sap-fi-co-senior-argentina-bc-tecnologia-buenos-aires' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3000,N'; max=',3500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/consultor-sap-fi-co-senior-argentina-bc-tecnologia-buenos-aires' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnico-en-soporte-bice-vida-santiago-a424' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnico-en-soporte-bice-vida-santiago-a424' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-net-hibrido-agilesoft-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-net-hibrido-agilesoft-spa-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-mean-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-fullstack-mean-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-programador-mainframe-cobol-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-programador-mainframe-cobol-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-adopcion-de-ia-lima-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-adopcion-de-ia-lima-bc-tecnologia-lima' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-cobol-visual-studio-code-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-cobol-visual-studio-code-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,950,1300,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-integracion-de-hardware-tolveet-araucania' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',950,N'; max=',1300) WHERE url_vacante=N'https://www.getonbrd.com/jobs/especialista-en-integracion-de-hardware-tolveet-araucania' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-full-stack-node-js-flutter-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/desarrollador-a-full-stack-node-js-flutter-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-software-react-native-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-a-de-software-react-native-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/subgerente-de-inteligencia-artificial-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/subgerente-de-inteligencia-artificial-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-semi-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-owner-semi-senior-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-de-redes-networking-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-de-redes-networking-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-field-support-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-field-support-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,650,750,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-terreno-bc-tecnologia-santiago-a3d6' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',650,N'; max=',750) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-terreno-bc-tecnologia-santiago-a3d6' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-nivel-1-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-nivel-1-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-operativo-junior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-operativo-junior-bc-tecnologia-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnico-de-soporte-terreno-part-time-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/tecnico-de-soporte-terreno-part-time-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-terreno-las-condes-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-terreno-las-condes-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-soporte-en-redes-y-telecomunicaciones-tarapaca-bc-tecnologia-iquique' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ingeniero-soporte-en-redes-y-telecomunicaciones-tarapaca-bc-tecnologia-iquique' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,800,1000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/field-support-presencial-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',800,N'; max=',1000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/field-support-presencial-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-manager-portafolio-de-productos-digitales-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/product-manager-portafolio-de-productos-digitales-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1000,1500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-funcional-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1000,N'; max=',1500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-funcional-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-nivel-2-sellers-ingles-avanzado-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-nivel-2-sellers-ingles-avanzado-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1200,1500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-nivel-2-ecommerce-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1200,N'; max=',1500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/soporte-tecnico-nivel-2-ecommerce-marketplace-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-funcional-bilinguek-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/analista-de-soporte-funcional-bilinguek-bc-tecnologia-santiago' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/practica-profesional-ofimatica-y-redes-iconstruye-santiago-766d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/practica-profesional-ofimatica-y-redes-iconstruye-santiago-766d' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,500,500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/outbound-sales-development-specialist-calieluxe-cleaners-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',500,N'; max=',500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/outbound-sales-development-specialist-calieluxe-cleaners-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,700,1000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/virtual-assistant-quali-t-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',700,N'; max=',1000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/virtual-assistant-quali-t-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,950,1400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-specialist-google-ads-seo-jrr-marketing-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',950,N'; max=',1400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/growth-specialist-google-ads-seo-jrr-marketing-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-support-engineer-mediastream-bogota-2539' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/it-support-engineer-mediastream-bogota-2539' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1000,1500,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-business-development-representative-sbdr-crewbloom-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1000,N'; max=',1500) WHERE url_vacante=N'https://www.getonbrd.com/jobs/senior-business-development-representative-sbdr-crewbloom-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/sap-fico-consultant-crest-it-resources-llc-brasilia-sao-paulo' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/sap-fico-consultant-crest-it-resources-llc-brasilia-sao-paulo' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,1000,1400,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/bilingual-admissions-sales-representative-english-spanish-cococel-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',1000,N'; max=',1400) WHERE url_vacante=N'https://www.getonbrd.com/jobs/bilingual-admissions-sales-representative-english-spanish-cococel-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/ocm-consultant-crest-it-resources-llc-mexicali' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/ocm-consultant-crest-it-resources-llc-mexicali' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,800,1200,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/junior-it-support-technician-bitmax-technologies-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',800,N'; max=',1200) WHERE url_vacante=N'https://www.getonbrd.com/jobs/junior-it-support-technician-bitmax-technologies-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,NULL,NULL,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-engineering-with-cto-path-rapidseedbox-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',NULL,N'; max=',NULL) WHERE url_vacante=N'https://www.getonbrd.com/jobs/head-of-engineering-with-cto-path-rapidseedbox-llc-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
INSERT dbo.salario_origen_v2(vacante_id,minimo_usd,maximo_usd,fuente)
SELECT vacante_id,3800,6000,N'JSON GetOnBoard 2026-10-28; USD bruto; periodo no confirmado'
FROM dbo.fact_vacantes v WHERE url_vacante=N'https://www.getonbrd.com/jobs/founding-growth-marketing-customer-success-lead-verahire-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard')
AND NOT EXISTS(SELECT 1 FROM dbo.salario_origen_v2 s WHERE s.vacante_id=v.vacante_id);
UPDATE dbo.fact_vacantes SET salario_min_mxn=NULL,salario_max_mxn=NULL,salario_medio_mxn=NULL,
salario_raw=CONCAT(N'USD bruto; periodo por verificar; min=',3800,N'; max=',6000) WHERE url_vacante=N'https://www.getonbrd.com/jobs/founding-growth-marketing-customer-success-lead-verahire-remote' AND fuente_id IN (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre='GetOnBoard');
COMMIT;
GO
