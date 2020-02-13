SELECT empleados.id_emp, empleados.nombre_emp, empleados.id_ofi, oficinas.direccion_ofi
	FROM empleados FULL OUTER JOIN oficinas
		ON empleados.id_ofi = oficinas.id_ofi;
		
SELECT * FROM oficinas CROSS JOIN empleados;

CREATE FUNCTION buscar_inm_tipo(character varying)
RETURNS SETOF "inmuebles" AS
'SELECT * FROM "inmuebles" WHERE tipo_inm = $1;'
LANGUAGE SQL;

SELECT buscar_inm_tipo('Conculor');

select tipo_inm, count(tipo_inm) from inmuebles group by tipo_inm ORDER BY count(tipo_inm) DESC;

CREATE OR REPLACE FUNCTION lista_inspecciones(int)
RETURNS SETOF "inspecciones"
AS $$
DECLARE
	inmueble ALIAS for $1;
BEGIN
	RETURN query(SELECT * FROM "inspecciones" WHERE id_inm=inmueble);
END;$$
LANGUAGE plpgsql;

SELECT id_inm, count(id_inm) FROM inspecciones GROUP BY id_inm ORDER BY count(id_inm) DESC;

SELECT lista_inspecciones(26);

CREATE OR REPLACE FUNCTION propietario_inmueble(int)
RETURNS SETOF "record" AS
$BODY$
DECLARE
	id_propietario ALIAS FOR $1;
BEGIN
	RETURN query(
		SELECT i.id_inm AS "inmuebles"
		, (CASE WHEN i.id_inm IN (SELECT id_inm FROM "contrato"
		   WHERE current_date >= fecha_inicio_con
		   AND current_date <= fecha_fin_con)
		   THEN '' ELSE 'x' END) AS "alquilado"
		   FROM "inmuebles" i
		   WHERE i.id_pro = id_propietario
	);
END;
$BODY$
LANGUAGE 'plpgsql' VOLATILE;

SELECT * FROM propietario_inmueble(1) AS ("inmuebles" character varying, "Alquilado" TEXT);