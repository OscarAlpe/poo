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