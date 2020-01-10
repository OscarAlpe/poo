-- 1.1 Nombre y edad de los ciclistas que han ganado etapas
SELECT DISTINCT c.nombre, c.edad FROM etapa e INNER JOIN ciclista c USING(dorsal);

-- 1.2 Nombre y edad de los ciclistas que han ganado puertos
SELECT DISTINCT c.nombre, c.edad FROM puerto p INNER JOIN ciclista c ON p.dorsal = c.dorsal;

-- 1.3 Nombre y edad de los ciclistas que han ganado etapas y puertos
SELECT DISTINCT c.nombre, c.edad
  FROM (ciclista c INNER JOIN etapa e ON c.dorsal = e.dorsal)
    INNER JOIN puerto p ON c.dorsal = p.dorsal;
SELECT c.nombre, c.edad FROM etapa e INNER JOIN ciclista c ON e.dorsal = c.dorsal GROUP BY c.nombre, c.edad
   INTERSECT SELECT c.nombre, c.edad FROM puerto p INNER JOIN ciclista c ON p.dorsal = c.dorsal GROUP BY c.nombre, c.edad;

-- 1.4 Listar el director de los equipos que tengan ciclistas que hayan ganado alguna etapa
SELECT DISTINCT e1.director FROM etapa e INNER JOIN ciclista c ON e.dorsal = c.dorsal INNER JOIN equipo e1 ON c.nomequipo = e1.nomequipo;

-- 1.5 Dorsal y nombre de los ciclistas que hayan llevado algún maillot
SELECT DISTINCT l.dorsal, c.nombre FROM lleva l INNER JOIN ciclista c ON l.dorsal = c.dorsal;

-- 1.6 Dorsal y nombre de los ciclistas que hayan llevado el maillot amarillo
SELECT DISTINCT l.dorsal, c.nombre FROM lleva l INNER JOIN ciclista c ON l.dorsal = c.dorsal INNER JOIN maillot m ON l.codigo = m.codigo WHERE m.color = 'amarillo';

-- 1.7 Dorsal de los ciclistas que hayan llevado algún maillot y que han ganado etapas
SELECT DISTINCT l.dorsal FROM lleva l INNER JOIN etapa e ON l.dorsal = e.dorsal;
SELECT DISTINCT e.dorsal FROM etapa e INNER JOIN lleva l ON e.dorsal = l.dorsal;

-- 1.8 Indicar el numetapa de las etapas que tengan puertos
SELECT DISTINCT p.numetapa FROM  puerto p;

-- 1.9 Indicar los km de las etapas que hayan ganado ciclistas de Banesto y que tengan puertos
SELECT DISTINCT e.kms FROM etapa e INNER JOIN puerto p ON e.numetapa = p.numetapa INNER JOIN ciclista c ON e.dorsal = c.dorsal WHERE c.nomequipo = 'Banesto';

-- 1.10 Listar el número de ciclistas que hayan ganado alguna etapa con puerto
SELECT COUNT(DISTINCT dorsal) AS "Nº clicistas" FROM puerto;

-- 1.11 Indicar el nombre de los puertos que hayan sido ganados por ciclistas de Banesto
SELECT p.nompuerto FROM puerto p INNER JOIN ciclista c ON p.dorsal = c.dorsal WHERE c.nomequipo = 'Banesto';

-- 1.12 Listar el número de etapas que tengan puerto que hayan sido ganados por ciclistas de Banesto con más de 200 km
SELECT COUNT(*) AS "Nº Etapas" FROM etapa e INNER JOIN puerto p ON e.numetapa = p.numetapa INNER JOIN ciclista c ON p.dorsal = c.dorsal WHERE c.nomequipo = 'Banesto' AND e.kms > 200;