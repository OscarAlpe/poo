-- 1- Crear una vista que permita ver los productos cuyo precio es mayor que 100. 
-- Mostrar los campos codigo articulo, seccion y precio.
CREATE VIEW CONSULTA1b AS SELECT codigo_articulo, seccion, precio FROM productos WHERE precio > 100;

-- 3- Crear una vista que use como tabla la consulta1b y que nos  muestre todos los productos cuya sección sea DEPORTES
CREATE VIEW CONSULTA2b AS SELECT * FROM consulta1b WHERE seccion = 'DEPORTES';

-- Hay que poner un valor por defecto en importado porque sino da error
ALTER TABLE PRODUCTOS alter importado set default 0;

-- 5- Insertar el siguiente registro en la tabla productos a través de la vista consulta1b
INSERT INTO CONSULTA1b (codigo_articulo, seccion, precio) VALUES ('AR90', 'Novedades', 5);

-- 6- Modificar la vista consulta1b y activar el check en la vista en modo local
-- 7- Insertar en consulta1b el siguiente registro:
INSERT INTO CONSULTA1b (codigo_articulo, seccion, precio) VALUES ('AR91', 'Novedades', 110);

-- 8- Insertar el siguiente registro en la tabla productos pero a través de la vista consulta2b
INSERT INTO CONSULTA2b (codigo_articulo, seccion, precio) VALUES ('AR92', 'Novedades', 5);

-- 9-  Modificar la vista consulta2b y activar el check en la vista en modo local
-- 10- Insertar el siguiente registro en la tabla productos pero a través de la vista consulta2
INSERT INTO CONSULTA2b (codigo_articulo, seccion, precio) VALUES ('AR93', 'DEPORTES', 5);

-- 11- Modificar la vista consulta2b y activar el check en la vista en modo CASCADA
-- 12- Insertar el siguiente registro en la tabla productos pero a través de la vista consulta2
INSERT INTO CONSULTA2b (codigo_articulo, seccion, precio) VALUES ('AR94', 'DEPORTES', 200);


