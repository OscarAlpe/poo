-- 1.1 Listar las edades de todos los ciclistas de Banesto
SELECT DISTINCT edad FROM ciclista WHERE nomequipo = 'Banesto';

-- 1.2 Listar las edades de los ciclistas que son de Banesto o Navigare
SELECT DISTINCT edad FROM ciclista WHERE nomequipo = 'Banesto' OR nomequipo = 'Navigare';
SELECT edad FROM ciclista WHERE nomequipo = 'Banesto' UNION SELECT edad FROM ciclista WHERE nomequipo = 'Navigare';

-- 1.3 Listar el dorsal de los ciclistas que son del Banesto y cuya edad esta entre 25 y 32
SELECT dorsal FROM ciclista WHERE nomequipo = 'Banesto' AND edad BETWEEN 25 AND 32;
SELECT dorsal FROM ciclista WHERE nomequipo = 'Banesto' INTERSECT SELECT dorsal FROM ciclista WHERE edad BETWEEN 25 AND 32;

-- 1.4 Listar el dorsal de los ciclistas que son del Banesto o cuya edad esta entre 25 y 32
SELECT dorsal FROM ciclista WHERE nomequipo = 'Banesto' OR edad BETWEEN 25 AND 32;
SELECT dorsal FROM ciclista WHERE nomequipo = 'Banesto' UNION SELECT dorsal FROM ciclista WHERE edad BETWEEN 25 AND 32;

-- 1.5 Listar la inicial del equipo de los ciclistas cuyo nombre comience por R
SELECT DISTINCT LEFT(nomequipo, 1) FROM ciclista WHERE LEFT(nombre, 1) = 'R';

-- 1.6 Listar el código de las etapas que su salida y llegada sea en la misma población
SELECT numetapa FROM etapa WHERE salida = llegada;

-- 1.7 Listar el código de las etapas que su salida y llegada no sean en la misma población y que conozcamos el dorsal del ciclista que ha ganado la etapa
SELECT numetapa  FROM etapa WHERE salida <> llegada AND dorsal IS NOT NULL;

-- 1.8 Listar el nombre de los puertos cuya altura entre 1000 y 2000 o que la altura sea mayor que 2400
SELECT nompuerto FROM puerto WHERE altura BETWEEN 1000 AND 2000 OR altura > 2400;

-- 1.9 Listar el dorsal de los ciclistas que hayan ganado los puertos cuya altura entre 1000 y 2000 o que la altura sea mayor que 2400
SELECT DISTINCT dorsal FROM puerto WHERE altura BETWEEN 1000 AND 2000 OR altura > 2400;

-- 1.10 listar el número de ciclistas que hayan ganado alguna etapa
SELECT COUNT(DISTINCT dorsal) AS "Número de clicistas que han ganado una etapa" FROM etapa;

-- 1.11 Listar el número de de etapas que tengan puerto
SELECT COUNT(DISTINCT numetapa) FROM puerto;

-- 1.12 Listar el número  de ciclistas que hayan ganado algún puerto
SELECT COUNT(DISTINCT dorsal) FROM puerto;

-- 1.13 Listar el código de la etapa con el número de puertos que tiene
SELECT numetapa, COUNT(nompuerto) AS "Número de puertos" FROM puerto GROUP BY numetapa;

-- 1.14 Indicar la altura media de los puertos
SELECT ROUND(AVG(altura), 2) AS "Altura media" FROM puerto;

-- 1.15 Indicar el código de etapa cuya altura media de sus puertos está por encima de 1500
SELECT numetapa FROM puerto GROUP BY numetapa HAVING AVG(altura) > 1500;

-- 1.16 Indicar el número de etapas que cumplen la condición anterior
SELECT COUNT(*)  AS "Etapas cuya media es > 1500" FROM (SELECT numetapa FROM puerto GROUP BY numetapa HAVING AVG(altura) > 1500) n;

-- 1.17 Listar el dorsal del ciclista con el número de veces que ha llevado algún maillot
SELECT dorsal, COUNT(codigo) AS "Número maillots" FROM lleva GROUP BY dorsal;

-- 1.18 Listar el dorsal del ciclista con el código de maillot y cuantas veces ese ciclista ha llevado ese maillot
SELECT dorsal, codigo, COUNT(codigo) AS "Número" FROM lleva GROUP BY dorsal, codigo;

-- 1.19 Listar el dorsal, el código de etapa, el ciclista y el número de maillots que ese ciclista ha llevado en cada etapa
SELECT l.dorsal, c.nombre, l.numetapa, COUNT(l.codigo) AS "Número de maillots" FROM lleva l LEFT JOIN ciclista c ON l.dorsal = c.dorsal GROUP BY l.dorsal, c.nombre, l.numetapa ORDER BY l.dorsal, l.numetapa;