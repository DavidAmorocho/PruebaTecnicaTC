/*Para este punto se utilizo la ayuda de Copilot IA
ya que no se tenia el conocimiento completo para realizar este punto*/

-- 1. Habilitar procedimientos de automatización (OLE Automation)
EXEC sp_configure 'show advanced options', 1; RECONFIGURE;
EXEC sp_configure 'Ole Automation Procedures', 1; RECONFIGURE;
GO

-- 2. Crear tabla temporal
CREATE TABLE #UsuariosAPI (
    id INT,
    name VARCHAR(100),
    username VARCHAR(50),
    email VARCHAR(100)
);

-- 3. Consumir la API
DECLARE @URL NVARCHAR(MAX) = 'https://jsonplaceholder.typicode.com/users';
DECLARE @Object INT;
DECLARE @HResult INT;
DECLARE @json TABLE (texto NVARCHAR(MAX)); -- Tabla para evitar truncamiento del JSON
DECLARE @ResponseText NVARCHAR(MAX);

EXEC @HResult = sp_OACreate 'WinHttp.WinHttpRequest.5.1', @Object OUT;
EXEC @HResult = sp_OAMethod @Object, 'Open', NULL, 'GET', @URL, 'false';
EXEC @HResult = sp_OAMethod @Object, 'Send';

-- Guardamos el resultado en la variable de tabla y luego lo pasamos a nuestra variable de texto
INSERT INTO @json EXEC sp_OAMethod @Object, 'ResponseText';
SET @ResponseText = (SELECT TOP 1 texto FROM @json);
EXEC sp_OADestroy @Object;

-- 4. Parsear el JSON e insertar en la tabla temporal (Requiere SQL Server 2016 o superior)
INSERT INTO #UsuariosAPI (id, name, username, email)
SELECT id, name, username, email
FROM OPENJSON(@ResponseText)
WITH (
    id INT '$.id',
    name VARCHAR(100) '$.name',
    username VARCHAR(50) '$.username',
    email VARCHAR(100) '$.email'
);

-- 5. Mostrar listado comparando correos (Coincidencias)
SELECT 
    api.name AS Nombre_En_API, 
    api.email AS Email_Coincidente, 
    emp.Nombre AS Nombre_En_DB, 
    emp.Apellido AS Apellido_En_DB
FROM #UsuariosAPI api
INNER JOIN Empleados emp ON api.email = emp.Email;

-- 6. Limpieza
DROP TABLE #UsuariosAPI;
GO 