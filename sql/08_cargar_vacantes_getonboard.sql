USE cert_roi_latam;
GO

EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\data_analyst_2026-10-28.json', @rol_normalizado = 'data_analyst';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\business_analyst_2026-10-28.json', @rol_normalizado = 'business_analyst';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\reporting_analyst_2026-10-28.json', @rol_normalizado = 'reporting_analyst';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\data_engineer_2026-10-28.json', @rol_normalizado = 'data_engineer';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\data_scientist_2026-10-28.json', @rol_normalizado = 'data_scientist';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\soporte_ti_2026-10-28.json', @rol_normalizado = 'soporte_ti';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\help_desk_2026-10-28.json', @rol_normalizado = 'help_desk';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\devops_2026-10-28.json', @rol_normalizado = 'devops';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\cloud_engineer_2026-10-28.json', @rol_normalizado = 'cloud_engineer';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\seguridad_2026-10-28.json', @rol_normalizado = 'seguridad';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\project_manager_2026-10-28.json', @rol_normalizado = 'project_manager';
EXEC dbo.sp_cargar_json_getonboard @path = 'C:\Users\menes\PROYECTOS\cert-roi-latam\data\raw\getonboard\scrum_master_2026-10-28.json', @rol_normalizado = 'scrum_master';
GO