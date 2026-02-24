CREATE NONCLUSTERED INDEX IX_Empleados_Apellido
ON Empleados (Apellido);
GO

/*Backup y Restore: 
- Para implementar un backup: BACKUP DATABASE EmpresaDB TO DISK = 'Ruta donde se quiere guardar el backup.bak'
- Para restaurar: RESTORE DATABASE EmpresaDB FROM DISK = 'Ruta donde se encuentra el backup.bak' WITH REPLACE
- O tambien se puede realizar por medio de la interfaz de el SQL SERVER (click derecho en la BD, dar click en task -> restore /backup -> elegir la ruta
*/ 