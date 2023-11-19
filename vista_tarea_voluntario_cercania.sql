CREATE OR REPLACE VIEW VistaTareaVoluntarioCercania2 AS
SELECT
    t.id AS tarea_id,
    t.id_emergencia,
    t.nombre,
    t.descripcion,
    ST_X(t.geom) AS longitud,
    ST_Y(t.geom) AS latitud,
    ST_Distance(t.geom::geography, :ubicacion::geography) AS distancia
FROM Tarea t
ORDER BY distancia ASC
LIMIT :limite;