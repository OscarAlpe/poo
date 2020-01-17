-- 1 Obtener el nombre y la edad de los alumnos matriculados en Secretary
SELECT DISTINCT a.nombre_al, a.edad_al FROM alumnos a INNER JOIN estudian e ON a.dni_al = e.dni_al INNER JOIN asignaturas a1 ON e.cod_as = a1.cod_as WHERE a1.nombre_as = 'Secretary';

-- 2 Mostrar las edades de todos los alumnos
SELECT DISTINCT a.edad_al FROM alumnos a;

-- 3 Mostrar los Alumnos cuyas edades estén comprendidas entre 18 y 25
SELECT * FROM alumnos a WHERE a.edad_al BETWEEN 18 AND 25;

-- 4 Mostrar nombre y teléfono de los profesores cuyo primer apellido comience por "K"
SELECT p.nombre_p, p.telefono_p FROM profesores p WHERE LEFT(p.apellido1_p, 1) = 'K';

-- 5 Mostrar nombre y primer apellido de los alumnos que reciban clase en asignaturas que imparta el profesor "Loritta Abich Collins"
SELECT * FROM alumnos a INNER JOIN estudian e ON a.dni_al = e.dni_al
  INNER JOIN asignaturas a1 ON e.cod_as = a1.cod_as
    INNER JOIN profesores p ON a1.dni_p = p.dni_p WHERE p.nombre_p = 'Loritta' AND p.apellido1_p = 'Abich' AND p.apellido2_p = 'Collins';

-- 6 Alumnos con la máxima nota en alguna asignatura
select a.nombre_al, a.apellido1_al, e.dni_al, e.cod_as, e.nota_al_as 
from estudian e inner join (
  select cod_as, max(nota_al_as) maxnum from estudian group by cod_as
) g
on g.cod_as = e.cod_as and g.maxnum = e.nota_al_as INNER JOIN alumnos a ON e.dni_al = a.dni_al ORDER BY e.cod_as, e.dni_al;

-- 7 Alumnos que residen en la misma ciudad que "Margo Laughlin"
SELECT * FROM alumnos a WHERE a.ciudad_al IN (SELECT a.ciudad_al FROM alumnos a WHERE a.nombre_al = 'Abby' AND a.apellido1_al = 'Plunkett');
SELECT * FROM alumnos a INNER JOIN (SELECT DISTINCT a.ciudad_al FROM alumnos a WHERE a.nombre_al = 'Abby' AND a.apellido1_al = 'Plunkett') a2 ON a.ciudad_al = a2.ciudad_al;

-- 8 Nombre y apellido de alumnos ordenados de forma descendente por edad
SELECT a.nombre_al, a.apellido1_al FROM alumnos a ORDER BY a.edad_al DESC;

-- 9 Alumnos matriculados en más de tres asignaturas
SELECT e.dni_al, COUNT(dni_al) AS NAsignaturas FROM estudian e GROUP BY e.dni_al HAVING COUNT(dni_al) >= 3;

-- 10 Ha habido un error en el nombre del profesor con el DNI número 82341356H, se llama Heya y no Hella. Actualízalo para que así conste.
UPDATE profesores SET nombre_p = 'Heya' WHERE dni_p = '82341356H';
SELECT * FROM profesores p WHERE p.dni_p = '82341356H';

-- 11 Elimina los profesores cuyo primer apellido sea 
SELECT p.apellido1_p, COUNT(p.apellido1_p) FROM profesores p GROUP BY p.apellido1_p ORDER BY COUNT(p.apellido1_p) DESC;
SELECT * FROM profesores p;
BEGIN; DELETE FROM profesores WHERE apellido1_p = 'Thaler'; ROLLBACK;

-- 12 Mostrar las notas que tiene cada alumno y la asignatura a la que corresponde la misma (pero solo los alumnos que cursen más de dos asignaturas)
SELECT e.dni_al, e.cod_as, nota_al_as FROM estudian e INNER JOIN (SELECT DISTINCT e.dni_al, COUNT(e.dni_al) AS NAsignaturas FROM estudian e GROUP BY e.dni_al) g ON e.dni_al = g.dni_al AND g.NAsignaturas > 2;
SELECT * FROM estudian WHERE dni_al = '51650912Y'

-- 13 Mostrar la media, mínima y máxima que ha puesto cada profesor para cada una de las asignaturas que imparte
SELECT p.nombre_p, a.nombre_as, ROUND(AVG(e.nota_al_as), 2), MIN(e.nota_al_as), MAX(e.nota_al_as) FROM estudian e
  INNER JOIN asignaturas a ON e.cod_as = a.cod_as
    INNER JOIN profesores p ON a.dni_p = p.dni_p GROUP BY p.nombre_p, e.cod_as, a.nombre_as;

-- 14 Mostrar un listado de alumnos y sus teléfonos ordenados alfabéticamente 
SELECT a.nombre_al, a.apellido1_al, a.apellido2_al, a.telefono_al FROM alumnos a ORDER BY a.nombre_al, a.apellido1_al, a.apellido2_al, a.telefono_al;

-- 15 Mostrar un listado de alumnos ordenados por su edad, de mayor a menor y, en caso de igualdad, alfabeticamente
SELECT * FROM alumnos a ORDER BY a.edad_al ASC, a.nombre_al, a.apellido1_al, a.apellido2_al;

-- 16 Mostrar los alumnos que no han sacado una nota entre 7 y 9 o que viven en Hobart
SELECT * FROM alumnos a INNER JOIN
  (SELECT a.dni_al FROM alumnos a WHERE a.ciudad_al = 'Hobart' EXCEPT
     SELECT e.dni_al FROM estudian e WHERE e.nota_al_as BETWEEN 7 AND 9) AS sq ON a.dni_al = sq.dni_al INNER JOIN estudian e ON a.dni_al = e.dni_al AND e.nota_al_as IS NOT NULL;

-- 17 Mostrar los alumnos que han aprobado alguna asignatura
SELECT DISTINCT e.dni_al, a.nombre_al, a.apellido1_al, a.apellido2_al FROM estudian e INNER JOIN alumnos a ON e.dni_al = a.dni_al WHERE e.nota_al_as >= 5;

-- 18 Mostar la nota media del alumno "Ervin Gainey"
SELECT ROUND(AVG(e.nota_al_as), 2) FROM estudian e INNER JOIN alumnos a ON e.dni_al = a.dni_al WHERE a.nombre_al = 'Ervin' AND a.apellido1_al = 'Gainey';

-- 19 Mostrar, de la asignatura , la nota máxima, mínima, y la diferencia entre ambaas. DEvolver también el número de alumnos que la han cursado