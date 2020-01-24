-- 1.4.4 Consultas sobre una tabla
--       1. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008.
--          Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
--          Utilizando la funcion YEAR de MySQL
SELECT DISTINCT c.codigo_cliente FROM cliente c JOIN pago p ON c.codigo_cliente = p.codigo_cliente WHERE EXTRACT(YEAR FROM p.fecha_pago) = 2008;

--          Utilizando la función DATE_FORMAT de MySQL
SELECT DISTINCT c.codigo_cliente FROM cliente c JOIN pago p ON c.codigo_cliente = p.codigo_cliente WHERE DATE_PART('year', p.fecha_pago) = 2008;

--          Sin utilizar ninguna de las funciones anteriores
SELECT DISTINCT c.codigo_cliente FROM cliente c JOIN pago p ON c.codigo_cliente = p.codigo_cliente WHERE p.fecha_pago >= '20080101' AND p.fecha_pago < '20090101';

-- 1.4.5 Consultas multitabla (Composición interna)
--       7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la
--          que pertenece el representante.
SELECT c.nombre_cliente AS "Nombre Cliente", e.nombre AS "Nombre Representante", o.ciudad AS "Ciudad Representante" FROM cliente c
  INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina ORDER BY c.nombre_cliente;

--       10. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT c.nombre_cliente AS "Nombre Cliente", gp.descripcion_texto AS "Descripción gama" FROM cliente c
  INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
      INNER JOIN producto p1 ON dp.codigo_producto = p1.codigo_producto
        INNER JOIN gama_producto gp ON p1.gama = gp.gama GROUP BY c.nombre_cliente, gp.descripcion_texto ORDER BY c.nombre_cliente, gp.descripcion_texto;

-- 1.4.6 Consultas multitabla (Composición externa)
--       2. Devuelve un listado de los productos que nunca han aparecido en un pedido
SELECT * FROM producto p LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto WHERE dp.codigo_pedido IS NULL;

--       3. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya
--          realizado la compra de algún producto de la gama Frutales.
