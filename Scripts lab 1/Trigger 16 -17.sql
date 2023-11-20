--Tabla para almacenar los reportes
CREATE TABLE reporte (
    id SERIAL PRIMARY KEY,
    user_id TEXT,
    operation_type TEXT,
    table_name TEXT,
    timestamp TIMESTAMP
);


--Trigger que inserta el registro en la tabla reporte
CREATE OR REPLACE FUNCTION registro_global_query() RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO reporte (user_id, operation_type, table_name, timestamp)
    VALUES (current_user, TG_OP, TG_TABLE_NAME, NOW());

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


--Tablas de los triggers
-- Tabla coordinador
CREATE TRIGGER after_coordinador_insert
AFTER INSERT ON coordinador
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_coordinador_update
AFTER UPDATE ON coordinador
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_coordinador_delete
AFTER DELETE ON coordinador
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla eme_habilidad
CREATE TRIGGER after_eme_habilidad_insert
AFTER INSERT ON eme_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_eme_habilidad_update
AFTER UPDATE ON eme_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_eme_habilidad_delete
AFTER DELETE ON eme_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla emergencia
CREATE TRIGGER after_emergencia_insert
AFTER INSERT ON emergencia
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_emergencia_update
AFTER UPDATE ON emergencia
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_emergencia_delete
AFTER DELETE ON emergencia
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla estado_tarea
CREATE TRIGGER after_estado_tarea_insert
AFTER INSERT ON estado_tarea
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_estado_tarea_update
AFTER UPDATE ON estado_tarea
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_estado_tarea_delete
AFTER DELETE ON estado_tarea
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla habilidad
CREATE TRIGGER after_habilidad_insert
AFTER INSERT ON habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_habilidad_update
AFTER UPDATE ON habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_habilidad_delete
AFTER DELETE ON habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla institucion
CREATE TRIGGER after_institucion_insert
AFTER INSERT ON institucion
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_institucion_update
AFTER UPDATE ON institucion
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_institucion_delete
AFTER DELETE ON institucion
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla ranking
CREATE TRIGGER after_ranking_insert
AFTER INSERT ON ranking
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_ranking_update
AFTER UPDATE ON ranking
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_ranking_delete
AFTER DELETE ON ranking
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla tarea
CREATE TRIGGER after_tarea_insert
AFTER INSERT ON tarea
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_tarea_update
AFTER UPDATE ON tarea
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_tarea_delete
AFTER DELETE ON tarea
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla tarea_habilidad
CREATE TRIGGER after_tarea_habilidad_insert
AFTER INSERT ON tarea_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_tarea_habilidad_update
AFTER UPDATE ON tarea_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_tarea_habilidad_delete
AFTER DELETE ON tarea_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla tarea_x_voluntario
CREATE TRIGGER after_tarea_x_voluntario_insert
AFTER INSERT ON tarea_x_voluntario
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_tarea_x_voluntario_update
AFTER UPDATE ON tarea_x_voluntario
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_tarea_x_voluntario_delete
AFTER DELETE ON tarea_x_voluntario
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla vol_habilidad
CREATE TRIGGER after_vol_habilidad_insert
AFTER INSERT ON vol_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_vol_habilidad_update
AFTER UPDATE ON vol_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_vol_habilidad_delete
AFTER DELETE ON vol_habilidad
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Tabla voluntario
CREATE TRIGGER after_voluntario_insert
AFTER INSERT ON voluntario
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_voluntario_update
AFTER UPDATE ON voluntario
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

CREATE TRIGGER after_voluntario_delete
AFTER DELETE ON voluntario
FOR EACH ROW
EXECUTE FUNCTION registro_global_query();

-- Función que genera el reporte de usuarios más activos
CREATE OR REPLACE FUNCTION obtener_usuarios_mas_activos()
RETURNS TABLE (usuario_id TEXT, insert_total BIGINT, update_total BIGINT, delete_total BIGINT) AS $$
BEGIN
    RETURN QUERY
    SELECT
        user_id,
        COUNT(*) FILTER (WHERE operation_type = 'INSERT') AS insert_total,
        COUNT(*) FILTER (WHERE operation_type = 'UPDATE') AS update_total,
        COUNT(*) FILTER (WHERE operation_type = 'DELETE') AS delete_total
    FROM reporte
    GROUP BY user_id
    ORDER BY user_id;
END;
$$ LANGUAGE plpgsql;