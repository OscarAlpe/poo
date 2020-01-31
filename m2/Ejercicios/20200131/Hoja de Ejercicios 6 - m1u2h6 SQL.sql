--1 Crear vista que debe mostrar los pedidos de los clientes que son de Madrid, Barcelona o Zaragoza.
--  Visualizar los campos: CODIGO_CLIENTE, NUMERO_DE_PEDIDO, EMPRESA y POBLACION. Llamar a la vista CONSULTA1.
CREATE VIEW CONSULTA1 AS SELECT CODIGO_CLIENTE, NUMERO_DE_PEDIDO, EMPRESA, POBLACION FROM pedidos
  JOIN clientes USING(codigo_cliente) WHERE poblacion in ('MADRID', 'BARCELONA', 'ZARAGOZA');

--2 Quiero modificarla para que la consulta este optimizada. Para optimizar la consulta primero deberíamos seleccionar los
--  registros en clientes y después combinarlos con pedidos.
-- consulta c1
SELECT CODIGO_CLIENTE, EMPRESA, POBLACION FROM clientes JOIN pedidos USING(codigo_cliente) WHERE poblacion in ('MADRID', 'BARCELONA', 'ZARAGOZA');

CREATE VIEW CONSULTA1OPTIMIZADA AS SELECT CODIGO_CLIENTE, NUMERO_DE_PEDIDO, EMPRESA, POBLACION FROM pedidos
  JOIN (SELECT CODIGO_CLIENTE, EMPRESA, POBLACION FROM clientes WHERE poblacion in ('MADRID', 'BARCELONA', 'ZARAGOZA')) AS c1
  USING(codigo_cliente);

SELECT * FROM CONSULTA1OPTIMIZADA;