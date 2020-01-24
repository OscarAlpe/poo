-- 1.1.4 Consultas multitabla (Composición interna)
--       1. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate sin utilizar el operador IN.
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

--       2. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate utilizando el operador IN.
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

--       3. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE RIGHT(f.nombre, 1) = 'e';
SELECT p.nombre, p.precio FROM producto p INNER JOIN (SELECT f.codigo FROM fabricante f WHERE f.nombre LIKE '%e') AS es ON es.codigo = p.codigo_fabricante;

--       4. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre contenga w.
SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';

--       5. Devuelve un listado con el nombre de producto, precio y el nombre de fabricante, de todos los productos que tengan un
--          precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar
--          por el nombre (en orden ascendente).
SELECT p.nombre, p.precio, f.nombre AS "Fabricante" FROM producto p INNER JOIN
  fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio > 180 ORDER BY p.precio ASC, p.nombre DESC;

-- 1.1.5 Consultas multitabla (Composición externa)
-- Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGTH JOIN.
--       1. Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos.
--          El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

--       2. Devuelve un listado dende sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

-- 1.1.6 Consultas resumen
--       1. Calcula el número total de productos que hay en la tabla productos.
SELECT COUNT(*) FROM producto p;

--       2. Calcula el número de valores distintos de código de fabricante aparecen en la tabla productos.
SELECT COUNT(DISTINCT p.codigo_fabricante) FROM producto p;

--       3. Calcula el precio más barato de todos los productos.
SELECT MIN(p.precio) FROM producto p;

--       4. Calcula el precio más caro de todos los productos.
SELECT MAX(p.precio) FROM producto p;

--       5. Lista el nombre y el precio del producto más caro.
SELECT p.nombre, p.precio FROM producto p INNER JOIN (SELECT MAX(p1.precio) AS precio FROM producto p1) AS mayor ON p.precio = mayor.precio;
SELECT p.nombre, p.precio FROM producto p WHERE p.precio = (SELECT MAX(p1.precio) FROM producto p1);

--       6. Calcula la suma de los precios de todos los productos.
SELECT SUM(p.precio) FROM producto p;

--       7. Calcula el precio más barato de todos los productos del fabricante Asus.
SELECT MIN(p.precio) FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus';

--       8. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que  tiene el fabricante Crucial.
SELECT MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*) FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Crucial';

--       9. Muestra el precio máximo, precio mínimo, precio medio de los productos de cada uno de los fabricantes. 
--          El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio) FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.nombre;

--       10. Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€.
--           No es necesario mostrar el nombre del fabricante, con el código del fabricante es suficiente.
SELECT p.codigo_fabricante, MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*) FROM producto p GROUP BY p.codigo_fabricante HAVING AVG(p.precio) > 200;

--       11. Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen
--           un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
SELECT f.nombre, MAX(p.precio), MIN(p.precio), AVG(p.precio), COUNT(*) FROM producto p INNER JOIN
   fabricante f ON p.codigo_fabricante = f.codigo GROUP BY f.nombre HAVING AVG(p.precio) > 200;

--       12. Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
SELECT p.codigo_fabricante, COUNT(p.codigo) AS "NProductos" FROM producto p WHERE p.precio >= 180 GROUP BY p.codigo_fabricante;

--       13. Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
SELECT f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo GROUP BY f.nombre HAVING AVG(p.precio) >= 150;

--       14. Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
SELECT f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo GROUP BY f.nombre HAVING COUNT(p.codigo) >= 2;

--       15. Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220€.
--           El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un valor superior o igual a 220€
--           deberá aparecer en el listado con un valor igual a 0 en el número de productos.
SELECT f.nombre, COUNT(may.codigo) FROM fabricante f LEFT JOIN
  (SELECT f2.nombre, f2.codigo AS fCodigo, p2.codigo FROM fabricante f2 LEFT JOIN
     producto p2 ON f2.codigo = p2.codigo_fabricante WHERE p2.precio >= 220) may ON f.codigo = may.fCodigo GROUP BY f.nombre;

--       16. Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000€.
SELECT f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.nombre HAVING SUM(p.precio) > 1000;

-- 1.1.7 Subconsultas (En la cláusula WHERE)
-- 1.1.7.1 Con operadores básicos de comparación
--       1. Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto p WHERE p.codigo_fabricante IN (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo');
SELECT * FROM producto p, fabricante f
  WHERE p.codigo_fabricante = f.codigo AND f.nombre = 'Lenovo';

--       2. Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
SELECT * FROM producto p WHERE p.precio = (SELECT MAX(p2.precio) FROM producto p2 WHERE p2.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE nombre = 'Lenovo'));

--       3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre FROM producto p WHERE p.precio = (SELECT MAX(p2.precio) FROM producto p2);

--       4. Lista el nombre del producto más barato del fabricante Hewlett-Packard.
SELECT p.nombre FROM producto p WHERE p.precio = (SELECT MIN(p2.precio) FROM producto p2 WHERE p2.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Hewlett-Packard'));

--       5. Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
SELECT * FROM producto p WHERE p.precio >= (SELECT MAX(p2.precio) FROM producto p2 WHERE p2.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));

--       6. Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos
SELECT * FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Asus')
  AND p.precio > (SELECT AVG(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Asus'));

-- 1.1.7.2 Subconsultas con ALL y ANY
--         1. Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto p WHERE p.precio >= ALL (SELECT p2.precio FROM producto p2);

--         2. Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY, ni LIMIT.
SELECT * FROM producto p WHERE p.precio <= ALL (SELECT p2.precio FROM producto p2);

--         3. Devuelve los nombres de los fabricantes que tienen productos asociados (utilizando ALL o ANY).
SELECT * FROM fabricante f WHERE f.codigo = ANY (SELECT p.codigo_fabricante FROM producto p);

--         4. Devuelve los nombres de los fabricantes que no tienen productos asociados (utilizando ALL o ANY).
SELECT * FROM fabricante f WHERE f.codigo <> ALL (SELECT p.codigo_fabricante FROM producto p);

-- 1.1.7.3 Subconsultas con IN y NOT IN
--         1. Devuelve los nombres de los fabricantes que tienen productos asociados (utilizando IN o NOT IN).
SELECT f.nombre FROM fabricante f WHERE f.codigo IN (SELECT p.codigo_fabricante FROM producto p);

-- 1.1.7.4 Subconsultas con EXISTS y NOT EXISTS
--         1. Devuelve los nombres de los fabricantes que tienen productos asociados (utilizando EXISTS o NOT EXISTS).
SELECT f.nombre FROM fabricante f WHERE EXISTS (SELECT 1 FROM producto p WHERE f.codigo = p.codigo_fabricante);

--         2. Devuelve los nombres de los fabricantes que no tienen productos asociados (utilizando EXISTS o NOT EXISTS).
SELECT f.nombre FROM fabricante f WHERE NOT EXISTS (SELECT 1 FROM producto p WHERE f.codigo = p.codigo_fabricante);

-- 1.1.7.5 Subconsultas correlacionadas
--         1. Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
SELECT f.nombre AS "Proveedor", (SELECT p.nombre FROM producto p WHERE p.codigo_fabricante = f.codigo AND p.precio = (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = f.codigo)) AS "Producto",
  (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = f.codigo) AS "Precio" FROM fabricante f ORDER BY "Precio";
SELECT f.nombre, c2.nombre, c2.preciomax FROM
    (SELECT preciomax, p,nombre, c1.codigo_fabricante FROM
      (SELECT MAX(precio) AS preciomax, codigo_fabricante FROM producto p
                       GROUP BY codigo_fabricante) c1
    JOIN producto p ON c1.codigo_fabricante = p.codigo_fabricante
      WHERE p.precio  = c1.preciomax) c2
    JOIN fabricante f ON f.codigo = c2.codigo_fabricante ORDER BY c2.preciomax;

--         2. Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
SELECT * FROM producto p WHERE p.precio >= (SELECT AVG(p2.precio) FROM producto p2 WHERE p.codigo_fabricante = p2.codigo_fabricante);

--         3. Lista el nombre del producto más caro del fabricante Lenovo.
SELECT p.nombre FROM producto p WHERE p.precio = (SELECT MAX(p2.precio) FROM producto p2 WHERE p2.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));
