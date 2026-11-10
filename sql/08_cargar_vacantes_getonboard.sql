USE cert_roi_latam;
GO

DECLARE @ruta_base NVARCHAR(400) = N'C:\PROYECTOS\cert-roi-latam\data\raw\getonboard\';
DECLARE @ruta NVARCHAR(500);

SET @ruta = @ruta_base + N'data_analyst_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'data_analyst';
SET @ruta = @ruta_base + N'business_analyst_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'business_analyst';
SET @ruta = @ruta_base + N'reporting_analyst_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'reporting_analyst';
SET @ruta = @ruta_base + N'data_engineer_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'data_engineer';
SET @ruta = @ruta_base + N'data_scientist_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'data_scientist';
SET @ruta = @ruta_base + N'soporte_ti_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'soporte_ti';
SET @ruta = @ruta_base + N'help_desk_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'help_desk';
SET @ruta = @ruta_base + N'devops_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'devops';
SET @ruta = @ruta_base + N'cloud_engineer_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'cloud_engineer';
SET @ruta = @ruta_base + N'seguridad_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'seguridad';
SET @ruta = @ruta_base + N'project_manager_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'project_manager';
SET @ruta = @ruta_base + N'scrum_master_2026-10-28.json';
EXEC dbo.sp_cargar_json_getonboard @path = @ruta, @rol_normalizado = 'scrum_master';
GO
