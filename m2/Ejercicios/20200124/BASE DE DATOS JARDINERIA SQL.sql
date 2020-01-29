-- 1.4.4 Consultas sobre una tabla
--       1. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008.
--          Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:
--          Utilizando la funcion YEAR de MySQL
SELECT DISTINCT codigo_cliente FROM pago WHERE EXTRACT(YEAR FROM fecha_pago) = 2008;

--          Utilizando la función DATE_FORMAT de MySQL
SELECT DISTINCT codigo_cliente FROM pago WHERE DATE_PART('year', fecha_pago) = 2008;

--          Sin utilizar ninguna de las funciones anteriores
SELECT DISTINCT codigo_cliente FROM pago WHERE fecha_pago >= '20080101' AND fecha_pago < '20090101';

-- 1.4.5 Consultas multitabla (Composición interna)
--       7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la
--          que pertenece el representante.
SELECT c.nombre_cliente AS "Nombre Cliente", e.nombre AS "Nombre Representante", o.ciudad AS "Ciudad Representante" FROM cliente c
  INNER JOIN empleado e ON c.codigo_empleado_rep_ventas = e.codigo_empleado
    INNER JOIN oficina o ON e.codigo_oficina = o.codigo_oficina ORDER BY c.nombre_cliente;

--       10. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT c.nombre_cliente AS "Nombre Cliente", p1.gama AS "Descripción gama" FROM cliente c
  INNER JOIN pedido p ON c.codigo_cliente = p.codigo_cliente
    INNER JOIN detalle_pedido dp ON p.codigo_pedido = dp.codigo_pedido
      INNER JOIN producto p1 ON dp.codigo_producto = p1.codigo_producto
        GROUP BY c.nombre_cliente, p1.gama ORDER BY c.nombre_cliente, p1.gama;

-- 1.4.6 Consultas multitabla (Composición externa)
--       2. Devuelve un listado de los productos que nunca han aparecido en un pedido
SELECT * FROM producto p LEFT JOIN detalle_pedido dp ON p.codigo_producto = dp.codigo_producto WHERE dp.codigo_pedido IS NULL;

--       3. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya
--          realizado la compra de algún producto de la gama Frutales.
SELECT DISTINCT codigo_oficina FROM oficina WHERE codigo_oficina <> ALL (SELECT DISTINCT codigo_oficina FROM cliente JOIN 
  empleado ON codigo_empleado_rep_ventas = codigo_empleado JOIN 
  pedido ON cliente.codigo_cliente = pedido.codigo_cliente JOIN
  detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido JOIN 
  producto ON detalle_pedido.codigo_producto = producto.codigo_producto JOIN
  gama_producto ON producto.gama = gama_producto.gama WHERE pedido.estado = 'Entregado' AND gama_producto.gama = 'Frutales');

--      10. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado
SELECT e.*, e2.nombre AS "Nombre jefe asociado" from empleado e JOIN empleado e2 ON e.codigo_jefe = e2.codigo_empleado WHERE e.codigo_empleado NOT IN (SELECT DISTINCT codigo_empleado_rep_ventas FROM cliente);

-- 1.4.7 Consultas resumen
--       9. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno.
--          El listado deberá estar ordenado por el número total de unidades vendidas.
SELECT detalle_pedido.codigo_producto, producto.nombre, SUM(cantidad) FROM pedido
   JOIN detalle_pedido ON pedido.codigo_pedido = detalle_pedido.codigo_pedido
     JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto WHERE estado = 'Entregado' GROUP BY detalle_pedido.codigo_producto, producto.nombre ORDER BY SUM(cantidad) DESC LIMIT 20;

--      15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado.
--          La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido.
--          El IVA es el 21% de la base imponible, y el total la suma de los dos campos anteriores.
SELECT to_char(ROUND(SUM(cantidad * precio_proveedor), 2), '999G999D00') AS "Base Imponible",
       to_char(ROUND((SUM(cantidad * precio_proveedor) * 0.21), 2), '999G999D00') AS "21% IVA",
       to_char(ROUND(SUM(cantidad * precio_proveedor) * 1.21, 2), '999G999D00') AS "Total" FROM detalle_pedido
   JOIN producto ON detalle_pedido.codigo_producto = producto.codigo_producto
     JOIN pedido ON detalle_pedido.codigo_pedido = pedido.codigo_pedido WHERE pedido.estado = 'Entregado';