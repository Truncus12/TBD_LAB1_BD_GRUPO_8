CREATE OR REPLACE VIEW VistaEmergenciaCoordinador
AS
SELECT
    Emergencia.id,
    Emergencia.nombre,
    Emergencia.descripcion,
    'Iniciada' AS estado
FROM Emergencia