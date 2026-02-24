CREATE OR ALTER PROCEDURE sp_buscar_empleado
    @NombreEmpleado VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT e.Nombre, e.Apellido, e.Email, e.UserName, e.FechaContratacion, d.Nombre AS Departamento
    FROM Empleados e
    INNER JOIN Departamentos d ON e.IdDepartamento = d.Id
    WHERE e.Nombre LIKE '%' + @NombreEmpleado + '%';
END;
GO

CREATE OR ALTER FUNCTION fn_total_proyectos (@IdEmpleado INT)
RETURNS INT
AS
BEGIN
    DECLARE @TotalProyectos INT;
    SELECT @TotalProyectos = COUNT(*)
    FROM EmpleadoProyecto
    WHERE IdEmpleado = @IdEmpleado;
    
    RETURN ISNULL(@TotalProyectos, 0);
END;
GO

/*
EXEC sp_buscar_empleado 'Carlos';
SELECT dbo.fn_total_proyectos(3) AS Proyectos;*/ 