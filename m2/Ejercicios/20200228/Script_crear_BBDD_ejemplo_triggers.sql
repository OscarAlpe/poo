CREATE DATABASE ejemplo_triggers

CREATE TABLE productos (
	producto VARCHAR(5) NOT NULL,
	cantidad INT DEFAULT 0,
	PRIMARY KEY(producto)
);

CREATE TABLE ventas (
	id SERIAL NOT NULL,
	producto VARCHAR(5) DEFAULT NULL,
	precio INT NOT NULL,
	unidades INT NOT NULL,
	total INT NOT NULL,
	PRIMARY KEY(id)
);

CREATE OR REPLACE FUNCTION borra_producto()
RETURNS TRIGGER AS 
$$
BEGIN
	DELETE FROM ventas
		WHERE producto = OLD.producto;
	RETURN NULL;
END; -- Fin del procedimiento  
$$
LANGUAGE plpgsql;

CREATE TRIGGER productosAD AFTER DELETE ON productos
FOR EACH ROW
/** Crear un disparador para la tabla productos que si eliminas un producto te elimine
    todos los productos del mismo código en la tabla ventas **/
	EXECUTE PROCEDURE borra_producto();

CREATE OR REPLACE FUNCTION modifica_cantidad()
RETURNS TRIGGER AS
$$
BEGIN
	NEW.cantidad := (
		SELECT SUM(v.total) FROM ventas v
			WHERE v.producto = NEW.producto);
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER productosBU BEFORE UPDATE ON productos
FOR EACH ROW
/** Crear un disparador para la tabla productos que si cambia el código del producto
	te sume todos los totales de ese producto de la tabla ventas **/
	EXECUTE PROCEDURE modifica_cantidad();

DROP TRIGGER productosBU ON productos;

-- Este trigger crea una referencia circular y da error

CREATE OR REPLACE FUNCTION actualiza_productos()
RETURNS TRIGGER AS
$$
BEGIN
	UPDATE productos SET cantidad = cantidad - OLD.cantidad
	WHERE producto = OLD.producto;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ventasAD AFTER DELETE ON ventas
FOR EACH ROW
/** Crear un disparador para la tabla ventas que si eliminas un registro te reste el total del campo cantidad
	de la tabla productos (en el campo cantidad). **/
	EXECUTE PROCEDURE actualiza_productos();

DROP TRIGGER ventasAD ON ventas;