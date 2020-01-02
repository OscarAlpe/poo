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