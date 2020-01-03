-- 1.1 Listar las edades de los ciclistas (sin repetidos)
SELECT DISTINCT edad FROM ciclista;

-- 1.2 Listar las edades de los ciclistas de Artiach
SELECT edad FROM ciclista WHERE nomequipo = 'Artiach';

-- 1.3 Listar las edades de los ciclistas de Artiach o de Amore Vita
SELECT edad FROM ciclista WHERE nomequipo = 'Artiach' OR nomequipo = 'Amore Vita';

-- 1.4 Listar los dorsales de los ciclistas cuya edad sea menor que 25 o mayor que 30
SELECT dorsal FROM ciclista WHERE edad < 25 OR edad > 30;

-- 1.5 Listar los dorsales de los ciclistas cuya edad este entre 28 y 32 y que además solo sean de Banesto
SELECT dorsal FROM ciclista WHERE (edad BETWEEN 28 AND 32) AND (nomequipo = 'Banesto');

-- 1.6 Indícame el nombre de los ciclistas que el número de caracteres del nombre sea mayor que 8
SELECT nombre FROM ciclista WHERE CHAR_LENGTH(nombre) > 8;

-- 1.7 Lístame el nombre y el dorsal de todos los ciclistas mostrando un campo nuevo denominado nombre mayúsculas que debe mostrar el nombrar en mayúsculas
SELECT nombre, dorsal, UPPER(nombre) AS "Nombre Mayúsculas" FROM ciclista;

-- 1.8 Listar todos los ciclistas que han llevado el maillot MGE (amarillo) en alguna etapa
SELECT DISTINCT nombre FROM lleva l JOIN ciclista c ON l.dorsal = c.dorsal WHERE l.codigo = 'MGE';

-- 1.9 Listar el nombre de los puertos cuya altura sea mayor que 1500
SELECT nompuerto FROM puerto p WHERE p.altura > 1500;

-- 1.10 Listar el dorsal de los ciclistas que hayan ganado algún puerto cuya pendiente sea mayor que 8 o cuya altura esté entre 1800 y 3000
SELECT c.dorsal FROM puerto p JOIN ciclista c ON p.dorsal = c.dorsal WHERE p.pendiente > 8 OR (p.altura BETWEEN 1800 AND 3000);

-- 1.11 Listar el dorsal de los ciclistas que hayan ganado algún puerto cuya pendiente sea mayor que 8 y cuya altura esté entre
SELECT c.dorsal FROM puerto p JOIN ciclista c ON p.dorsal = c.dorsal WHERE p.pendiente > 8 AND (p.altura BETWEEN 1800 AND 3000);