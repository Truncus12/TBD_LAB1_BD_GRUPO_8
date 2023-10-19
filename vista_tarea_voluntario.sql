CREATE OR REPLACE VIEW VistaTareaVoluntario
AS
SELECT
	Tarea.id,
	Tarea_X_Voluntario.id_voluntario,
	Tarea.nombre,
	Tarea.descripcion,
	'ASD' AS emergencia_asociada,
	'Santiago, RM' AS ubicacion,
	Estado_Tarea.descripcion AS estado
FROM Tarea
INNER JOIN Tarea_X_Voluntario
    ON Tarea_X_Voluntario.id_tarea = Tarea.id
INNER JOIN Estado_Tarea
    ON Estado_Tarea.id = Tarea_X_Voluntario.estado