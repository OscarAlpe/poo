-- 1.- Realizar un procedimiento almacenado que reciba un texto y un carácter.
--     Debe indicarte si ese carácter está en el texto.
--     Debéis realizarlo con: Locate, Position
CREATE OR REPLACE FUNCTION caracter_en_texto(texto varchar, caracter char)
RETURNS VARCHAR AS
$BODY$
BEGIN
	IF POSITION(caracter IN texto) > 0 THEN
		RETURN 'Está en el texto';
	ELSE
		RETURN 'NO está en el texto';
	END IF;
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT caracter_en_texto('España', 'ñ');

-- 2.- Realizar un procedimiento almacenado que reciba un texto y un carácter.
--     Te debe indicar todo el texto que haya antes de la primera vez que aparece ese carácter.
CREATE OR REPLACE FUNCTION texto_antes_caracter(texto varchar, caracter char)
RETURNS VARCHAR AS
$BODY$
DECLARE
	POS INTEGER;
BEGIN
	POS = POSITION(caracter IN texto);
	RETURN SUBSTRING(texto, 0, POS);
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT texto_antes_caracter('Esto es una prueba', 'a');

-- 3.- Realizar un procedimiento almacenado que reciba tres números y dos argumentos de tipo salida donde devuelva el
--     número más grande y el número más pequeño de los tres números pasados.
CREATE OR REPLACE FUNCTION devuelve_mayor_menor2(n1 INT, n2 INT, n3 INT)
RETURNS TABLE(mayor INT, menor INT) AS
$BODY$
BEGIN
	RETURN query(SELECT GREATEST (n1, n2, n3), LEAST(n1, n2, n3));
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT * FROM devuelve_mayor_menor2(1, 3, 5);

-- 4.- Realizar un procedimiento almacenado que muestre cuantos numeros1 y numeros2 son mayores que 50
CREATE OR REPLACE FUNCTION devuelve_mayores_50(numero1 INT, numero2 INT)
RETURNS TABLE(mayores50 BIGINT) AS
$BODY$
BEGIN
	RETURN query(SELECT COUNT(*) FROM (SELECT 1 WHERE numero1 > 50 UNION SELECT 2 WHERE numero2 > 50) as consulta);
END;
$BODY$
LANGUAGE 'plpgsql';

SELECT * FROM devuelve_mayores_50(211, 51);