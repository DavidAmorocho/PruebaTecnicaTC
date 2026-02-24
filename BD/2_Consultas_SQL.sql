--Listar todos los empleados con el nombre de su departamento.
SELECT e.Nombre, e.Apellido, d.Nombre AS Departamento
FROM Empleados e
INNER JOIN Departamentos d ON e.IdDepartamento = d.Id

--Mostrar los proyectos con su presupuesto y la cantidad de empleados asignados.
SELECT p.Nombre AS Proyecto, p.Presupuesto, COUNT(ep.IdEmpleado) AS CantidadEmpleados
FROM Proyectos p
LEFT JOIN EmpleadoProyecto ep ON p.Id = ep.IdProyecto
GROUP BY p.Id, p.Nombre, p.Presupuesto

--Obtener el top 3 de empleados con más proyectos asignados.
SELECT TOP 3 e.Nombre, e.Apellido, COUNT(ep.IdProyecto) AS TotalProyectos 
FROM Empleados e
INNER JOIN EmpleadoProyecto ep ON e.Id = ep.IdEmpleado
GROUP BY e.Id, e.Nombre, e.Apellido
ORDER BY TotalProyectos DESC

--Listar los departamentos que no tienen empleados.
SELECT d.Nombre AS DepartamentoSinEmpleados
FROM Departamentos d
LEFT JOIN Empleados e ON d.Id = e.IdDepartamento
WHERE e.Id IS NULL

--Consultar todos los empleados que participan en mas de un proyecto.
SELECT e.Nombre, e.Apellido, COUNT(ep.IdProyecto) AS TotalProyectos
FROM Empleados e
INNER JOIN EmpleadoProyecto ep ON e.Id = ep.IdEmpleado
GROUP BY e.Id, e.Nombre, e.Apellido
HAVING COUNT(ep.IdProyecto) > 1