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

SELECT * FROM propietario_inmueble(10) AS ("inmuebles" int, "Alquilado" TEXT);

/* Función que reciba como parámetro el id de un cliente y devuelva su nombre, dirección y telefono */
CREATE OR REPLACE FUNCTION cliente_nombre_direccion_telefono(int) RETURNS TEXT AS '
DECLARE
	cliente ALIAS FOR $1;
	tablacli clientes%ROWTYPE;
BEGIN
	SELECT * INTO tablacli FROM clientes WHERE id_cli = cliente;
	RETURN tablacli.nombre_cli || tablacli.direccion_cli || tablacli.telefono_cli;
END;
' LANGUAGE 'plpgsql';

SELECT cliente_nombre_direccion_telefono(2);

/* Escriba una función almacenada que reciba como parámetro un código de propietario
   y devuelva el número de  inmuebles que tiene en nuestra inobiliaria */
CREATE OR REPLACE FUNCTION propietario_numero_inmuebles(propietario int)
RETURNS SETOF "record" AS
$BODY$
BEGIN
	RETURN query(SELECT COUNT(*) FROM inmuebles WHERE id_pro = propietario);
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT * FROM propietario_numero_inmuebles(1) AS ("Número de inmuebles" bigint);

/* 2ª manera */
CREATE OR REPLACE FUNCTION propietario_numero_inmuebles2(propietario int) RETURNS INTEGER AS
$BODY$
/* DECLARE
	num int; */
BEGIN
	RETURN (SELECT COUNT(*) FROM inmuebles WHERE id_pro = propietario);
	/* SELECT COUNT(*) INTO num FROM inmuebles WHERE id_pro = propietario; */
	/* RETURN num;*/
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT propietario_numero_inmuebles2(1) as "Número de inmuebles";

DROP FUNCTION propietario_numero_inmuebles;

/* Escriba un procedimiento almacenado que reciba como parámetro
   un código de cliente y devuelva el importe total de facturas
   asociadas a ese cliente */
CREATE OR REPLACE FUNCTION importe_total_facturas_cliente(cliente int) RETURNS TEXT AS
$BODY$
BEGIN
	RETURN (SELECT TO_CHAR(SUM(importe_fac), '999G999G999D99') FROM facturas WHERE id_cli = cliente);
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT importe_total_facturas_cliente(2);

DROP FUNCTION importe_total_facturas_cliente;

/* Escribir una función que reciba por parámetro dos códigos de propietario
   y devuelva el que tenga un número mayor de inmuebles junto con el
   número de estos */
CREATE OR REPLACE FUNCTION propietario_con_mayor_numero_inmuebles(propietario1 int, propietario2 int)
RETURNS SETOF "record" AS
$BODY$
DECLARE
	numInmuebles1 int;
	numInmuebles2 int;
BEGIN
	SELECT COUNT(*) INTO numInmuebles1 FROM inmuebles WHERE id_pro = propietario1;
	SELECT COUNT(*) INTO numInmuebles2 FROM inmuebles WHERE id_pro = propietario2;
	IF (numInmuebles1 = numInmuebles2) THEN
		RETURN query(SELECT numInmuebles2, CAST(propietario1 AS TEXT) || ' y ' || CAST(propietario2 AS TEXT));
	ELSIF (numInmuebles1 > numInmuebles2) THEN
		RETURN query(SELECT numInmuebles1, CAST(propietario1 AS TEXT));	
	ELSE 
		RETURN query(SELECT numInmuebles2, CAST(propietario2 AS TEXT));
	END IF;
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT * FROM propietario_con_mayor_numero_inmuebles(1, 10) AS ("Número de inmuebles" int, "Propietario(s)" text);

/* Por Rubén */
CREATE OR REPLACE FUNCTION propietario_mayor(idpro1 int, idpro2 int)
RETURNS SETOF RECORD AS '
DECLARE
	num1 integer;
	num2 integer;
BEGIN
	SELECT COUNT(*) INTO num1 FROM inmuebles WHERE id_pro = idpro1 group by id_pro;
	SELECT COUNT(*) INTO num2 FROM inmuebles WHERE id_pro = idpro2 group by id_pro;
	if (num1>num2) then return query(select idpro1, num1);
	  elsif (num1<num2) then return query(select idpro2, num2);
	  	else return query(select idpro1, num1
						  union
						  select idpro2, num2);
	end if;
END;
' LANGUAGE 'plpgsql';

SELECT * FROM propietario_mayor(1, 7) AS (idpro int, num int);

/* Pisos que se han anunciado y no se ha amortizado el coste del anuncio */
CREATE OR REPLACE FUNCTION pisos_coste_no_amortizado()
RETURNS SETOF RECORD AS '
BEGIN
	RETURN query(
			SELECT * FROM (SELECT p.id_inm, SUM(p.costo_pub) AS sumcostopub FROM publicidad p GROUP BY p.id_inm) s1
				LEFT JOIN
					(SELECT if.id_inm, SUM(f.importe_fac) AS sumimpfac FROM facturas f JOIN inmueble_factura if USING(id_fac) GROUP BY if.id_inm) s2
				ON s1.id_inm = s2.id_inm AND sumcostopub > sumimpfac
		   );
END;
' LANGUAGE 'plpgsql';

SELECT * FROM pisos_coste_no_amortizado() AS ("Inmueble publicidad" int, "Total Costo publicidad" bigint, "Inmueble factura" int , "Total factura" bigint)

/* Hacer una función que vuelque todos los datos de los propietarios de inmuebles que no tengan nombre.
   La nueva tabla se llamará Pro_SinNombre. Una vez hecho esto los eliminará de la tabla propietarios */
CREATE OR REPLACE FUNCTION volcar_datos_propietarios(_tabla varchar)
RETURNS VOID AS
$BODY$
BEGIN
	EXECUTE 'DROP TABLE IF EXISTS ' || QUOTE_IDENT(_tabla);
	EXECUTE 'CREATE TABLE ' || QUOTE_IDENT(_tabla) || ' AS TABLE propietario WITH NO DATA';
	EXECUTE 'WITH moved_rows AS (
			UPDATE propietario SET nombre_pro = ''John Doe''
		WHERE
			nombre_pro IS NULL
		RETURNING *
	)
	INSERT INTO ' || QUOTE_IDENT(_tabla) || '
	SELECT * FROM moved_rows';
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT * FROM volcar_datos_propietarios('oscar')
SELECT * FROM propietario WHERE nombre_pro IS NULL;
DELETE FROM Pro_SinNombre;
SELECT * FROM Pro_SinNombre;
DROP FUNCTION volcar_datos_propietarios;
UPDATE propietario SET nombre_pro = NULL WHERE nombre_pro = 'John Doe';