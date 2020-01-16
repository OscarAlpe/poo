-- 1 Obtener el nombre y la edad de los alumnos matriculados en Secretary
SELECT DISTINCT a.nombre_al, a.edad_al FROM alumnos a INNER JOIN estudian e ON a.dni_al = e.dni_al INNER JOIN asignaturas a1 ON e.cod_as = a1.cod_as WHERE a1.nombre_as = 'Secretary';

-- 2 Mostrar las edades de todos los alumnos
SELECT DISTINCT a.edad_al FROM alumnos a

-- 3 Mostrar los Alumnos cuyas edades estén comprendidas entre 18 y 25
SELECT * FROM alumnos a WHERE a.edad_al BETWEEN 18 AND 25;

-- 4 Mostrar nombre y teléfono de los profesores cuyo primer apellido comience por "K"
SELECT p.nombre_p, p.telefono_p FROM profesores p WHERE LEFT(p.apellido1_p, 1) = 'K';

-- 5 Mostrar nombre y primer apellido de los alumnos que reciban clase en asignaturas que imparta el profesor "Loritta Abich Collins"
SELECT * FROM alumnos a INNER JOIN estudian e ON a.dni_al = e.dni_al
  INNER JOIN asignaturas a1 ON e.cod_as = a1.cod_as
    INNER JOIN profesores p ON a1.dni_p = p.dni_p WHERE p.nombre_p = 'Loritta' AND p.apellido1_p = 'Abich' AND p.apellido2_p = 'Collins';