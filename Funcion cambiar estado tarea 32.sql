CREATE OR REPLACE FUNCTION actualizar_estado_tarea(id_tarea_in bigint)
RETURNS VOID AS $$
DECLARE
    total_voluntarios INT;
    voluntarios_terminados INT;
BEGIN
    -- Obtener el número total de voluntarios para la tarea
    SELECT COUNT(*) INTO total_voluntarios
    FROM Tarea_X_Voluntario
    WHERE id_tarea = id_tarea_in;

    -- Obtener el número de voluntarios que han marcado la tarea como terminada
    SELECT COUNT(*) INTO voluntarios_terminados
    FROM Tarea_X_Voluntario
    WHERE id_tarea = id_tarea_in AND estado = 2; -- Suponiendo que '2' representa el estado 'terminada'

    -- Si todos los voluntarios han marcado la tarea como terminada, actualizar el estado de la tarea
    IF total_voluntarios = voluntarios_terminados THEN
        UPDATE Tarea
        SET estado_actual = 'Finalizada'
        WHERE id = id_tarea_in;
    END IF;
END;
$$ LANGUAGE plpgsql;