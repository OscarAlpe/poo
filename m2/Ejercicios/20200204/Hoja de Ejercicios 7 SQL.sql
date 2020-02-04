-- Crear una vista que permita ver los productos cuyo precio es mayor que 100. 
-- Mostrar los campos codigo articulo, seccion y precio.
CREATE VIEW CONSULTA1b AS SELECT codigo_articulo, seccion, precio FROM productos WHERE precio > 100;

CREATE VIEW CONSULTA2b AS SELECT * FROM consulta1b WHERE seccion = 'DEPORTES';

INSERT INTO CONSULTA1b (codigo_articulo, seccion, precio) VALUES ('AR90', 'Novedades', 5);