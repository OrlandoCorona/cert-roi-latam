USE cert_roi_latam;
GO

CREATE OR ALTER PROCEDURE dbo.sp_cargar_json_getonboard
    @path NVARCHAR(500),
    @rol_normalizado NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @sql NVARCHAR(MAX);
    DECLARE @json NVARCHAR(MAX);

    SET @sql = N'SELECT @j = BulkColumn FROM OPENROWSET(BULK ''' + @path + ''', SINGLE_CLOB) AS t;';
    EXEC sp_executesql @sql, N'@j NVARCHAR(MAX) OUTPUT', @j = @json OUTPUT;

    DECLARE @fuente_id INT = (SELECT fuente_id FROM dbo.dim_fuente WHERE nombre = 'GetOnBoard');
    DECLARE @rol_id INT = (SELECT rol_id FROM dbo.dim_rol WHERE nombre_normalizado = @rol_normalizado);

    IF OBJECT_ID('tempdb..#vac') IS NOT NULL DROP TABLE #vac;

    SELECT DISTINCT
        v.id AS job_id,
        v.title AS titulo,
        LTRIM(RTRIM(CONCAT(ISNULL(v.description,''),' ',ISNULL(v.functions,''),' ',ISNULL(v.desirable,''),' ',ISNULL(v.benefits,'')))) AS descripcion_raw,
        v.remote_modality,
        TRY_CAST(v.min_salary AS DECIMAL(14,2)) AS min_sal,
        TRY_CAST(v.max_salary AS DECIMAL(14,2)) AS max_sal,
        TRY_CAST(v.published_at AS BIGINT) AS published_at,
        ISNULL(v.pais_raw, 'Remote') AS pais_raw,
        v.company_name,
        v.company_country,
        v.public_url
    INTO #vac
    FROM OPENJSON(@json, '$.vacantes')
    WITH (
        id NVARCHAR(300) '$.id',
        title NVARCHAR(300) '$.attributes.title',
        description NVARCHAR(MAX) '$.attributes.description',
        functions NVARCHAR(MAX) '$.attributes.functions',
        desirable NVARCHAR(MAX) '$.attributes.desirable',
        benefits NVARCHAR(MAX) '$.attributes.benefits',
        remote_modality NVARCHAR(50) '$.attributes.remote_modality',
        min_salary NVARCHAR(50) '$.attributes.min_salary',
        max_salary NVARCHAR(50) '$.attributes.max_salary',
        published_at NVARCHAR(50) '$.attributes.published_at',
        pais_raw NVARCHAR(100) '$.attributes.countries[0]',
        company_name NVARCHAR(200) '$.attributes._enriched.company_name',
        company_country NVARCHAR(50) '$.attributes._enriched.company_country',
        public_url NVARCHAR(500) '$.links.public_url'
    ) v;

    INSERT INTO dbo.dim_empresa (nombre, pais_hq)
    SELECT nombre, MAX(pais_hq)
    FROM (
        SELECT DISTINCT
            ISNULL(t.company_name, 'Desconocida') AS nombre,
            CASE t.company_country
                WHEN 'CL' THEN 'Chile' WHEN 'AR' THEN 'Argentina' WHEN 'PE' THEN 'Peru'
                WHEN 'CO' THEN 'Colombia' WHEN 'MX' THEN 'Mexico' WHEN 'UY' THEN 'Uruguay'
                WHEN 'BR' THEN 'Brasil' WHEN 'US' THEN 'Estados Unidos' WHEN 'ES' THEN 'Espana'
                WHEN 'EC' THEN 'Ecuador' WHEN 'VE' THEN 'Venezuela' WHEN 'BO' THEN 'Bolivia'
                WHEN 'PY' THEN 'Paraguay'
                ELSE t.company_country
            END AS pais_hq
        FROM #vac t
        WHERE t.company_name IS NOT NULL
    ) x
    WHERE NOT EXISTS (SELECT 1 FROM dbo.dim_empresa e WHERE e.nombre = x.nombre)
    GROUP BY nombre;

    INSERT INTO dbo.dim_ubicacion (pais, region, ubicacion_raw)
    SELECT DISTINCT
        CASE t.pais_raw
            WHEN 'Chile' THEN 'Chile' WHEN 'Argentina' THEN 'Argentina' WHEN 'Peru' THEN 'Peru'
            WHEN 'Colombia' THEN 'Colombia' WHEN 'Mexico' THEN 'Mexico' WHEN 'Uruguay' THEN 'Uruguay'
            WHEN 'Brasil' THEN 'Brasil' WHEN 'Brazil' THEN 'Brasil'
            WHEN 'Ecuador' THEN 'Ecuador' WHEN 'Venezuela' THEN 'Venezuela'
            WHEN 'Bolivia' THEN 'Bolivia' WHEN 'Paraguay' THEN 'Paraguay'
            WHEN 'Estados Unidos' THEN 'Estados Unidos' WHEN 'Espana' THEN 'Espana'
            WHEN 'España' THEN 'Espana'
            ELSE t.pais_raw
        END AS pais,
        CASE t.pais_raw
            WHEN 'Chile' THEN 'latam_sur' WHEN 'Argentina' THEN 'latam_sur'
            WHEN 'Uruguay' THEN 'latam_sur' WHEN 'Paraguay' THEN 'latam_sur'
            WHEN 'Bolivia' THEN 'latam_sur' WHEN 'Brasil' THEN 'latam_sur' WHEN 'Brazil' THEN 'latam_sur'
            WHEN 'Peru' THEN 'latam_norte' WHEN 'Colombia' THEN 'latam_norte'
            WHEN 'Mexico' THEN 'latam_norte' WHEN 'Ecuador' THEN 'latam_norte'
            WHEN 'Venezuela' THEN 'latam_norte'
            WHEN 'Estados Unidos' THEN 'norteamerica'
            WHEN 'Espana' THEN 'europa' WHEN 'España' THEN 'europa'
            ELSE 'remoto_global'
        END AS region,
        t.pais_raw AS ubicacion_raw
    FROM #vac t
    WHERE NOT EXISTS (SELECT 1 FROM dbo.dim_ubicacion u WHERE u.ubicacion_raw = t.pais_raw);

    INSERT INTO dbo.fact_vacantes
        (fecha_id, rol_id, empresa_id, ubicacion_id, fuente_id, titulo,
         salario_min_mxn, salario_max_mxn, salario_medio_mxn, salario_raw,
         modalidad, descripcion, url_vacante, fecha_publicacion)
    SELECT
        CAST(FORMAT(
            CASE WHEN t.published_at IS NOT NULL
                 THEN DATEADD(SECOND, t.published_at, '1970-01-01')
                 ELSE SYSUTCDATETIME() END, 'yyyyMMdd') AS INT),
        @rol_id,
        e.empresa_id,
        u.ubicacion_id,
        @fuente_id,
        LEFT(t.titulo, 300),
        CASE WHEN t.company_country = 'CL' THEN t.min_sal * 0.021
             WHEN t.company_country = 'AR' THEN t.min_sal * 0.013
             WHEN t.company_country = 'CO' THEN t.min_sal * 0.0048
             WHEN t.company_country = 'PE' THEN t.min_sal * 5.3
             WHEN t.company_country = 'UY' THEN t.min_sal * 0.47
             WHEN t.company_country = 'BR' THEN t.min_sal * 3.5
             ELSE t.min_sal * 20.0 END,
        CASE WHEN t.company_country = 'CL' THEN t.max_sal * 0.021
             WHEN t.company_country = 'AR' THEN t.max_sal * 0.013
             WHEN t.company_country = 'CO' THEN t.max_sal * 0.0048
             WHEN t.company_country = 'PE' THEN t.max_sal * 5.3
             WHEN t.company_country = 'UY' THEN t.max_sal * 0.47
             WHEN t.company_country = 'BR' THEN t.max_sal * 3.5
             ELSE t.max_sal * 20.0 END,
        CASE WHEN t.min_sal IS NOT NULL AND t.max_sal IS NOT NULL
             THEN ((t.min_sal + t.max_sal) / 2) *
                CASE t.company_country
                    WHEN 'CL' THEN 0.021 WHEN 'AR' THEN 0.013 WHEN 'CO' THEN 0.0048
                    WHEN 'PE' THEN 5.3 WHEN 'UY' THEN 0.47 WHEN 'BR' THEN 3.5
                    ELSE 20.0 END
             ELSE NULL END,
        CASE WHEN t.min_sal IS NOT NULL OR t.max_sal IS NOT NULL
             THEN CONCAT(ISNULL(CAST(t.min_sal AS NVARCHAR(50)),''),'-',ISNULL(CAST(t.max_sal AS NVARCHAR(50)),''),' ',ISNULL(t.company_country,''))
             ELSE NULL END,
        CASE t.remote_modality
            WHEN 'fully_remote' THEN 'remoto'
            WHEN 'hybrid' THEN 'hibrido'
            WHEN 'office' THEN 'presencial'
            ELSE NULL END,
        LEFT(t.descripcion_raw, 8000),
        LEFT(t.public_url, 500),
        CASE WHEN t.published_at IS NOT NULL
             THEN CAST(DATEADD(SECOND, t.published_at, '1970-01-01') AS DATE)
             ELSE NULL END
    FROM #vac t
    INNER JOIN dbo.dim_empresa e ON e.nombre = ISNULL(t.company_name, 'Desconocida')
    INNER JOIN dbo.dim_ubicacion u ON u.ubicacion_raw = t.pais_raw
    WHERE t.public_url IS NOT NULL
      AND t.titulo IS NOT NULL
      AND NOT EXISTS (SELECT 1 FROM dbo.fact_vacantes v WHERE v.url_vacante = t.public_url AND v.fuente_id = @fuente_id);

    DROP TABLE #vac;
END;
GO