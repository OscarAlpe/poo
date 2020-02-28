-- Hacer una función que reciba 2 enteros y que devuelva la media de créditos de asignaturas comprendidas entre uno y otro id
CREATE OR REPLACE FUNCTION media_creditos(id1 int, id2 int)
RETURNS TABLE(media_de_creditos TEXT) AS
$BODY$
BEGIN
	RETURN query(SELECT TO_CHAR(AVG(creditos), '99D99') FROM asignatura WHERE id BETWEEN id1 AND id2);
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT media_creditos(44,76);