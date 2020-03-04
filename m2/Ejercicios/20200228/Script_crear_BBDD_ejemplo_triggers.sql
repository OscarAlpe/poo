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

CREATE TRIGGER productosAD BEFORE DELETE ON productos
FOR EACH ROW
/** Crear un disparador para la tabla productos que si eliminas un producto te elimine
    todos los productos del mismo código en la tabla ventas **/
	EXECUTE PROCEDURE borra_producto();
DROP TRIGGER productosAD;CREATE DATABASE ejemplo_triggers

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

CREATE TRIGGER productosAD BEFORE DELETE ON productos
FOR EACH ROW
/** Crear un disparador para la tabla productos que si eliminas un producto te elimine
    todos los productos del mismo código en la tabla ventas **/
	EXECUTE PROCEDURE borra_producto();

DROP TRIGGER productosAD ON productos;

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

CREATE OR REPLACE FUNCTION actualiza_productos()
RETURNS TRIGGER AS
$$
BEGIN
	UPDATE productos SET cantidad = cantidad - OLD.total
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

CREATE OR REPLACE FUNCTION suma_total_productos()
RETURNS TRIGGER AS
$$
BEGIN
	UPDATE productos SET cantidad = cantidad - NEW.total
		WHERE producto = NEW.producto;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ventasAI AFTER INSERT ON ventas
FOR EACH ROW
/** Crear un disparador para la tabla ventas para que cuando inserte un registro me sume
	el total a la tabla productos (en el campo cantidad). **/
	EXECUTE PROCEDURE suma_total_productos();

DROP TRIGGER ventasAI ON ventas;

CREATE OR REPLACE FUNCTION actualiza_total_productos()
RETURNS TRIGGER AS
$$
BEGIN
	UPDATE productos SET cantidad = cantidad + (NEW.total - OLD.total)
		WHERE producto = NEW.producto;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ventasAU AFTER UPDATE ON ventas
FOR EACH ROW
/** Crear un disparador para la tabla ventas para que cuando actualice un registro me sume
	el total a la tabla productos (en el campo cantidad). **/
	EXECUTE PROCEDURE actualiza_total_productos();

DROP TRIGGER ventasAU ON ventas;

CREATE OR REPLACE FUNCTION calcula_total_ventas()
RETURNS TRIGGER AS
$$
BEGIN
	NEW.total := NEW.unidades * NEW.precio;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ventasBI BEFORE INSERT ON ventas
FOR EACH ROW
  -- Cuando metas un registro
  -- nuevo te calcule el total automáticamente
	EXECUTE PROCEDURE calcula_total_ventas();

DROP TRIGGER ventasBI ON ventas;

CREATE OR REPLACE FUNCTION calcula_total_ventas_actualizar()
RETURNS TRIGGER AS
$$
BEGIN
	NEW.total := NEW.unidades * NEW.precio;
	UPDATE productos SET cantidad  = cantidad +(NEW.total - OLD.total)
		WHERE producto = NEW.producto;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER ventasBU BEFORE UPDATE ON ventas
FOR EACH ROW
/** Crear un disparador para la tabla ventas para que cuando actualices un registro nuevo te calcule el total
automáticamente **/
	EXECUTE PROCEDURE calcula_total_ventas_actualizar();

DROP TRIGGER ventasBU ON ventas;
