-- Crear la base de datos
CREATE DATABASE EmpresaDB;
GO

USE EmpresaDB;

-- Crear tabla Departamentos
CREATE TABLE Departamentos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    FechaCreacion DATETIME NOT NULL,
    FechaModificacion DATETIME NOT NULL
);

-- Crear tabla Proyectos
CREATE TABLE Proyectos (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(18,2) NOT NULL,
    FechaInicioProyecto DATETIME NOT NULL,
    FechaFinProyecto DATETIME NOT NULL,
    FechaCreacion DATETIME NOT NULL,
    FechaModificacion DATETIME NOT NULL
);

-- Crear tabla Empleados
CREATE TABLE Empleados (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    UserName VARCHAR(50),
    FechaContratacion DATETIME,
    IdDepartamento INT NOT NULL,
    FechaCreacion DATETIME NOT NULL,
    FechaModificacion DATETIME NOT NULL,
    CONSTRAINT FK_Empleados_Departamentos FOREIGN KEY (IdDepartamento) 
        REFERENCES Departamentos(Id)
);

-- Crear tabla intermedia EmpleadoProyecto (Relación N:M)
CREATE TABLE EmpleadoProyecto (
    IdEmpleado INT NOT NULL,
    IdProyecto INT NOT NULL,
    CONSTRAINT PK_EmpleadoProyecto PRIMARY KEY (IdEmpleado, IdProyecto),
    CONSTRAINT FK_Empleado_Proyecto_Empleados FOREIGN KEY (IdEmpleado) 
        REFERENCES Empleados(Id),
    CONSTRAINT FK_Empleado_Proyecto_Proyectos FOREIGN KEY (IdProyecto) 
        REFERENCES Proyectos(Id)
);
GO

INSERT INTO Departamentos (Nombre, FechaCreacion, FechaModificacion) VALUES 
('Recursos Humanos', GETDATE(), GETDATE()),
('TI', GETDATE(), GETDATE()),
('Ventas', GETDATE(), GETDATE()),
('Marketing', GETDATE(), GETDATE()),
('Operaciones', GETDATE(), GETDATE());

INSERT INTO Proyectos (Nombre, Presupuesto, FechaInicioProyecto, FechaFinProyecto, FechaCreacion, FechaModificacion) VALUES 
('Davivienda', 50000000, CONVERT(DATETIME, '2026-01-01', 121), CONVERT(DATETIME, '2026-06-30', 121), GETDATE(),GETDATE()),
('Compensar', 45000000, CONVERT(DATETIME, '2026-01-01', 121),CONVERT(DATETIME, '2026-06-30', 121), GETDATE(),GETDATE()),
('Postobon', 100000000, CONVERT(DATETIME, '2026-01-01', 121),CONVERT(DATETIME, '2026-06-30', 121), GETDATE(),GETDATE()),
('CocaCola', 50000000, CONVERT(DATETIME, '2026-01-01', 121),CONVERT(DATETIME, '2026-06-30', 121), GETDATE(),GETDATE()),
('Bancolombia', 120000000, CONVERT(DATETIME, '2026-01-01', 121),CONVERT(DATETIME, '2026-06-30', 121), GETDATE(), GETDATE());

INSERT INTO Empleados (Nombre, Apellido, Email, UserName, FechaContratacion, IdDepartamento, FechaCreacion, FechaModificacion) VALUES
('Leanne', 'Graham', 'Sincere@april.biz', 'Bret', CONVERT(DATETIME, '2020-01-15', 121), 2, GETDATE(),GETDATE()),
('Ervin', 'Howell', 'Shanna@melissa.tv', 'Antonette', CONVERT(DATETIME, '2024-03-22', 121), 2, GETDATE(),GETDATE()),
('Carlos', 'Perez', 'carlos@empresa.com', 'Cperez', CONVERT(DATETIME, '2021-07-10', 121), 3, GETDATE(),GETDATE()),
('Ana', 'Gomez', 'ana@empresa.com', 'AGomez', CONVERT(DATETIME, '2022-11-01', 121), 1, GETDATE(),GETDATE()),
('Luis', 'Ramirez', 'luis@empresa.com', 'LRamirez', CONVERT(DATETIME, '2025-05-20', 121), 4, GETDATE(),GETDATE());

INSERT INTO EmpleadoProyecto (IdEmpleado, IdProyecto) VALUES
(1, 1), (1, 2), (1, 5),
(2, 2), (2, 5),        
(3, 3),                
(4, 4), (4, 1),        
(5, 3);