-- 1.1 Nombre y edad de los ciclistas que NO han ganado etapas
SELECT DISTINCT Nombre, Edad FROM ciclista c LEFT JOIN etapa e ON c.dorsal = e.dorsal WHERE e.dorsal IS NULL;

-- 1.2 Nombre y edad de los ciclistas que NO han ganado puertos
SELECT DISTINCT Nombre, Edad FROM ciclista c LEFT JOIN puerto p ON c.dorsal = p.dorsal WHERE p.dorsal IS NULL;

-- 1.3 Listar el director de los equipos que tengan ciclistas que NO hayan ganado NINGUNA etapa
SELECT DISTINCT eq.director FROM equipo eq INNER JOIN (ciclista c LEFT JOIN etapa e ON c.dorsal = e.dorsal) ON eq.nomequipo = c.nomequipo
WHERE e.dorsal IS NULL;

-- 1.4 Dorsal y nombre de los ciclistas que NO hayan llevado algún maillot
SELECT DISTINCT c.dorsal, c.nombre FROM ciclista c LEFT JOIN lleva l ON c.dorsal = l.dorsal WHERE l.dorsal IS NULL;

-- 1.5 Dorsal y nombre de los ciclistas que NO hayan llevado el maillot amarillo NUNCA
SELECT dorsal, nombre FROM ciclista
  EXCEPT (SELECT c.dorsal, nombre FROM ciclista c INNER JOIN lleva l ON c.dorsal = l.dorsal INNER JOIN maillot m ON l.codigo = m.codigo WHERE m.color = 'amarillo');
SELECT c.dorsal FROM ciclista c EXCEPT
  SELECT DISTINCT l.dorsal
  FROM maillot m INNER JOIN lleva l ON m.codigo = l.codigo
  WHERE m.color = 'amarillo';

-- 1.6 Indicar el numetapa de las etapas que NO tengan puertos
SELECT e.numetapa, kms FROM etapa e
  EXCEPT (SELECT e.numetapa, kms FROM etapa e INNER JOIN puerto p ON e.numetapa = p.numetapa);
SELECT e.numetapa FROM etapa e LEFT JOIN puerto p ON e.numetapa = p.numetapa WHERE p.numetapa IS NULL;

-- 1.7 Indicar la distancia media de las etapas que NO tengan puertos
SELECT ROUND(AVG(e.kms), 2) FROM etapa e WHERE e.numetapa IN 
  (SELECT e.numetapa FROM etapa e
     EXCEPT (SELECT e.numetapa FROM etapa e INNER JOIN puerto p ON e.numetapa = p.numetapa));
SELECT ROUND(AVG(e.kms,2)) FROM etapa e LEFT JOIN puerto p ON e.numetapa = p.numetapa WHERE p.numetapa IS NULL;

-- 1.8 Listar el número de ciclistas que NO hayan ganado alguna etapa
SELECT COUNT(*) FROM (SELECT c.dorsal FROM ciclista c
  EXCEPT SELECT dorsal FROM etapa e) AS s;

-- 1.9 Listar el dorsal de los ciclistas que hayan ganado alguna etapa que no tenga puerto
SELECT DISTINCT c.dorsal FROM ciclista c INNER JOIN etapa e ON c.dorsal = e.dorsal WHERE e.numetapa NOT IN (SELECT e.numetapa FROM etapa e EXCEPT SELECT p.numetapa FROM puerto p)
  INTERSECT SELECT DISTINCT c1.dorsal FROM ciclista c1 INNER JOIN etapa e1 ON c1.dorsal = e1.dorsal WHERE e1.numetapa IN (SELECT e.numetapa FROM etapa e EXCEPT SELECT p.numetapa FROM puerto p);

-- 1.10 Listar el dorsal de los ciclistas que hayan ganado únicamente etapas que no tengan puertos
SELECT DISTINCT c.dorsal FROM ciclista c INNER JOIN etapa e ON c.dorsal = e.dorsal WHERE e.numetapa IN (SELECT e.numetapa FROM etapa e EXCEPT SELECT p.numetapa FROM puerto p);

-- Sobre la marcha: Equipos cuyos componentes hayan ganado TODOS al menos una etapa
SELECT * FROM equipo e LEFT JOIN ciclista c ON e.nomequipo = c.nomequipo LEFT JOIN etapa e1 ON c.dorsal = e1.dorsal ORDER BY e.nomequipo;
SELECT DISTINCT e.nomequipo FROM equipo e LEFT JOIN ciclista c ON e.nomequipo = c.nomequipo LEFT JOIN etapa e1 ON c.dorsal = e1.dorsal WHERE e1.dorsal IS NULL ORDER BY e.nomequipo;
SELECT e2.nomequipo FROM equipo e2 EXCEPT
  SELECT DISTINCT e.nomequipo FROM equipo e LEFT JOIN ciclista c ON e.nomequipo = c.nomequipo
    LEFT JOIN etapa e1 ON c.dorsal = e1.dorsal WHERE e1.dorsal IS NULL;

-- Misma consulta hecha por Rubén buscando los mismos ganadores de etapa que el número de de ciclistas en cada equipo
SELECT * FROM
  (SELECT c.nomequipo, COUNT(DISTINCT c.dorsal) AS numCliclistas FROM ciclista c
    INNER JOIN etapa e USING(dorsal) GROUP BY c.nomequipo) AS ganadores
INNER JOIN
  (SELECT c.nomequipo, COUNT(*) AS numCliclistas2 FROM ciclista c GROUP BY c.nomequipo) AS corredores
ON ganadores.nomequipo = corredores.nomequipo WHERE corredores.numCliclistas2 = ganadores.numCliclistas;