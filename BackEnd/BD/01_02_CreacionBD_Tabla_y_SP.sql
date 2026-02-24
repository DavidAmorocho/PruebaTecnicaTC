CREATE DATABASE DBClientes;
GO

USE DBClientes;
GO

CREATE TABLE Clientes (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Identificacion VARCHAR(20) UNIQUE NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    FechaNacimiento DATETIME,
    Telefono VARCHAR(100)

);
GO

-- Insertar un dato de prueba
INSERT INTO Clientes (Identificacion, Nombre, Apellido, Email, FechaNacimiento, Telefono) 
VALUES ('123456789', 'Juan', 'Pérez', 'juan.perez@email.com', '1995-01-01', '3219564738');
GO

-- 3. Crear el Procedimiento Almacenado
CREATE PROCEDURE sp_ObtenerClientePorIdentificacion
    @Identificacion VARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT Id, Identificacion, Nombre, Apellido, Email, FechaNacimiento, Telefono
    FROM Clientes 
    WHERE Identificacion = @Identificacion;
END;
GO