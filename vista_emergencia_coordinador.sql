CREATE OR REPLACE VIEW VistaEmergenciaCoordinador
AS
SELECT
    Emergencia.id,
    Emergencia.nombre,
    Emergencia.descripcion,
    IF(fecha_fin is NULL, 'Iniciada', 'Finalizada') AS estado
FROM Emergencia