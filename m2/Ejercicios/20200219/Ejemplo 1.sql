-- 1.- Realizar un procedimiento almacenado que reciba dos números y te indique el mayor de ellos
--     (realizarle con intrucción if, con consulta de totales y con una función de PostgreSQL)
CREATE OR REPLACE FUNCTION mayor(n1 int, n2 int)
RETURNS INT AS
$BODY$
BEGIN
	IF n1 > n2 THEN
		RETURN n1;
	ELSIF n2 > n1 THEN
		RETURN n2;
	ELSE
		RETURN n1;
	END IF;
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT mayor(284, 84);

CREATE OR REPLACE FUNCTION mayor_funcion(n1 int, n2 int)
RETURNS SETOF INT AS
$BODY$
BEGIN
	RETURN query(SELECT GREATEST (n1, n2));
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT mayor_funcion(5, 42);

-- 2.- Realizar un procedimiento almacenado que reciba tres números y te indique el mayor de ellos
--     (realizarle con instrucción if, con consulta de totales y con una función de PostgreSQL)
CREATE OR REPLACE FUNCTION mayor3(n1 int, n2 int, n3 int)
RETURNS INT AS
$BODY$
BEGIN
	IF n1 > n2 THEN
		IF n1 > n3 THEN
			RETURN n1;
		ELSE
			RETURN n3;
		END IF;
	ELSIF n2 > n3 THEN
		RETURN n2;
	ELSE
		RETURN n3;
	END IF;
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT mayor3(20, 21, 21);

CREATE OR REPLACE FUNCTION mayor3_funcion(n1 int, n2 int, n3 int)
RETURNS SETOF INT AS
$BODY$
BEGIN
	RETURN query(SELECT GREATEST (n1, n2, n3));
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT mayor3_funcion(1, 30, 5);

-- 3.- Realizar un procedimiento almacenado que reciba tres números y dos argumentos de tipo salida donde devuelva el
--     numero más grande y el numero mas pequeño de los tres números pasados
CREATE OR REPLACE FUNCTION devuelve_mayor_menor(n1 int, n2 int, n3 int)
RETURNS TABLE(r1 INT, r2 INT) AS
$BODY$
BEGIN
	RETURN query(SELECT GREATEST (n1, n2, n3), LEAST(n1, n2, n3));
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT devuelve_mayor_menor(1, 3, 5);

-- 4.- Realizar un procedimiento almacenado que reciba dos fechas y te muestre el número de días de diferencia entre las dos fechas
CREATE OR REPLACE FUNCTION dias_diferencia(fecha_inicial date, fecha_final date)
RETURNS SETOF INTEGER AS
$BODY$
BEGIN
	RETURN query(SELECT fecha_final - fecha_inicial);
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT dias_diferencia('2001-11-01', '2002-11-02');

-- 5.- Realizar un procedimiento almacenado que reciba dos fechas y te muestre el número de meses de diferencia entre las dos fechas
CREATE OR REPLACE FUNCTION meses_diferencia(fecha_inicial date, fecha_final date)
RETURNS SETOF DOUBLE PRECISION AS
$BODY$
BEGIN
	RETURN query(SELECT extract(year FROM age(fecha_final, fecha_inicial)) * 12 +
				         extract(month FROM age(fecha_final, fecha_inicial)));
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT meses_diferencia('2001-11-01', '2002-12-02');

-- 6.- Realizar un procedimiento almacenado que reciba dos fechas y te devuelva en 3 argumentos de salida los días, meses y años entre las dos fechas
CREATE OR REPLACE FUNCTION dias_meses_anios_diferencia(fecha_inicial date, fecha_final date)
RETURNS SETOF INTERVAL AS
$BODY$
BEGIN
	RETURN query(SELECT age(fecha_final, fecha_inicial));
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT dias_meses_anios_diferencia('2001-11-01', '2002-12-02');

-- 7.- Realizar un procedimiento almacenado que reciba una frase y te muestre el número de caracteres
CREATE OR REPLACE FUNCTION numero_de_caracteres(frase varchar)
RETURNS SETOF INTEGER AS
$BODY$
BEGIN
	RETURN query(SELECT LENGTH(frase));
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT numero_de_caracteres('Esto es una prueba.');