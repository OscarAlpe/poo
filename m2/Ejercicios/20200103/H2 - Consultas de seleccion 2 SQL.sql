-- 1.1 Numero de ciclistas que hay
SELECT COUNT(*) FROM ciclista c;

-- 1.2 Numero de ciclistas que hay en el equipo Banesto
SELECT COUNT(*) FROM ciclista c WHERE c.nomequipo = 'Banesto';

-- 1.3 La edad media de los ciclistas
SELECT ROUND(AVG(edad), 2) AS "Edad Media" FROM ciclista c;

-- 1.4 La edad media de los del equipo Banesto
SELECT ROUND(AVG(edad), 2) AS "Edad Media Banesto" FROM ciclista WHERE nomequipo = 'Banesto';

-- 1.5 La edad media de los ciclistas por cada equipo
SELECT nomequipo, ROUND(AVG(edad), 2) AS "Edad Media" FROM ciclista GROUP BY nomequipo;

-- 1.6 El número de ciclistas por cada equipo
SELECT nomequipo, COUNT(*) FROM ciclista GROUP BY nomequipo;

-- 1.7 El número total de puertos
SELECT COUNT(*) FROM puerto;

-- 1.8 El número total de puertos mayores de 1500
SELECT COUNT(*) FROM puerto WHERE altura > 1500;

-- 1.9 Listar el nombre de los equipos que tengan más de 4 ciclistas
SELECT nomequipo, COUNT(*) FROM ciclista GROUP BY nomequipo HAVING COUNT(*) > 4;

-- 1.10 Listar el nombre de los quipos que tengan más de 4 ciclistas y cuya edad este entre 28 y 32
SELECT nomequipo, COUNT(*) FROM ciclista WHERE edad BETWEEN 28 AND 32 GROUP BY nomequipo HAVING COUNT(*) > 4;

-- 1.11 Indícame el número de etapas que ha ganado cada uno de los ciclistas
SELECT dorsal, COUNT(*) AS NEtapas FROM etapa GROUP BY dorsal;

-- 1.12 Indícame el dorsal de los ciclistas que hayan ganado más de una etapa
SELECT dorsal, COUNT(*) AS NEtapas FROM etapa GROUP BY dorsal HAVING COUNT(*) > 1;