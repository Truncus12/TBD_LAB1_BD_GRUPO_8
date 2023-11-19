CREATE OR REPLACE FUNCTION obtener_tareas_cercanas(ubicacion GEOMETRY, limite integer)
RETURNS TABLE (
    id integer,
	nombre VARCHAR(50),
    descripcion text,
    longitud double precision,
    latitud double precision,
    distancia double precision
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        t.id,
		t.nombre,
        t.descripcion,
        ST_X(t.geom) AS longitud,
        ST_Y(t.geom) AS latitud,
        ST_Distance(t.geom::GEOMETRY, ubicacion) AS distancia
    FROM Tarea t
    ORDER BY distancia ASC
    LIMIT limite;
END;
$$ LANGUAGE plpgsql;