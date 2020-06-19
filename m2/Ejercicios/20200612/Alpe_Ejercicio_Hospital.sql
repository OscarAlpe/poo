CREATE DATABASE ejercicio_hospital;

CREATE TABLE hospital (
  hospital_cod  NUMERIC(2) NOT NULL,
  nombre        VARCHAR(10),
  direccion     VARCHAR(20),
  telefono      VARCHAR(8),
  num_cama      NUMERIC(3),
  PRIMARY KEY (hospital_cod)
);

INSERT INTO hospital (hospital_cod, nombre, direccion, telefono, num_cama) VALUES
  (13, 'Provincial', '0 Donell 5O', '964-4264', 502),
  (18, 'General', 'Atocha s/n', '595-3111', 987),
  (22, 'La Paz', 'Castellana 1000', '923-5411', 412),
  (45, 'San Carlos', 'Ciudad Universitaria', '597-1500', 845);

CREATE TABLE sala (
  sala_cod      NUMERIC(2) NOT NULL,
  hospital_cod  NUMERIC(2) NOT NULL,
  nombre        VARCHAR(20),
  num_cama      NUMERIC(3),
  PRIMARY KEY (sala_cod, hospital_cod)
);

INSERT INTO sala (sala_cod, hospital_cod, nombre, num_cama) VALUES
  (3, 13, 'Cuidados Intensivos', 21),
  (6, 13, 'Psiquiátrico', 67),
  (3, 18, 'Cuidados Intensivos', 10),
  (4, 18, 'Cardiología', 53),
  (1, 22, 'Recuperación', 10),
  (6, 22, 'Psiquiátrico', 118),
  (2, 22, 'Maternidad', 34),
  (4, 45, 'cardiología', 55),
  (1, 45, 'Recuperación', 13),
  (2, 45, 'Maternidad', 24);

CREATE TABLE plantilla (
  hospital_cod    NUMERIC(2) NOT NULL,
  sala_cod        NUMERIC(2) NOT NULL,
  empleado_no     NUMERIC(4) NOT NULL,
  apellido        VARCHAR(15),
  funcion         VARCHAR(10),
  turno           VARCHAR(1),
  salario         NUMERIC(10),
  PRIMARY KEY (empleado_no)
);

INSERT INTO plantilla (empleado_no, hospital_cod, sala_cod, apellido, funcion, turno, salario) VALUES
  (3754, 13, 6, 'Diaz B.', 'Enfermera', 'T', 2262000),
  (3106, 13, 6, 'Hernandez J.', 'Enfermero', 'T', 2755000),
  (6357, 18, 4, 'Karplus W.', 'Interno', 'T', 3379000),
  (1009, 22, 6, 'Higueras D.', 'Enfermera', 'T', 2005000),
  (8422, 22, 6, 'Bocina G.', 'Enfermero', 'M', 1638000),
  (9901, 22, 2, 'NuÑez C.', 'Interno', 'M', 2210000),
  (6065, 22, 1, 'Rivera G.' , 'Enfermera', 'N', 1626000),
  (7379, 22, 1, 'Carlos R.', 'Enfermera', 'T', 2119000),
  (1280, 45, 4, 'Amigo R.', 'Interno', 'N', 2210000),
  (8526, 45, 1, 'Frank H.', 'Enfermera', 'T', 2522000),
  (1234, 22, 2, 'Garcia J.', 'Enfermo', 'M', 3000000),
  (2222, 2, 22, 'Garcia J', '', '', 0);
  
CREATE TABLE ocupacion (
  inscripcion   NUMERIC(5) NOT NULL,
  hospital_cod  NUMERIC(2) NOT NULL,
  sala_cod      NUMERIC(2) NOT NULL,
  cama          NUMERIC(4) NOT NULL,
  PRIMARY KEY (inscripcion)
);

INSERT INTO ocupacion (inscripcion, hospital_cod, sala_cod, cama) VALUES
  (10995, 13, 3, 1),
  (18004, 13, 3, 2),
  (14024, 13, 3, 3),
  (36658, 18, 4, 1),
  (38702, 18, 4, 2),
  (39217, 22, 6, 1),
  (59076, 22, 6, 2),
  (63827, 22, 6, 3),
  (64823, 22, 2, 1);

CREATE TABLE doctor (
  doctor_no     NUMERIC(3) NOT NULL,
  hospital_cod  NUMERIC(2) NOT NULL,
  apellido      VARCHAR(13),
  especialidad  VARCHAR(16),
  PRIMARY KEY (doctor_no)
);

INSERT INTO doctor (doctor_no, hospital_cod, apellido, especialidad) VALUES
  (435, 13, 'Lopez A.', 'Cardiología'),
  (585, 18, 'Miller G.', 'Ginecología'),
  (982, 18, 'Cajal R.', 'Cardiología'),
  (453, 22, 'Galo D.', 'Pediatría'),
  (398, 22, 'Best K.', 'Urología'),
  (386, 22, 'Cabeza D.', 'Psiquiatría'),
  (607, 45, 'Nico P.', 'Pediatría'),
  (522, 45, 'Adams C.', 'Neurología');
  
CREATE TABLE enfermo (
  inscripcion   NUMERIC(5) NOT NULL,
  apellido      VARCHAR(15),
  direccion     VARCHAR(20),
  fecha_nac     DATE,
  s             VARCHAR(1),
  nss           NUMERIC(9),
  PRIMARY KEY (inscripcion)
);

INSERT INTO enfermo (inscripcion, apellido, direccion, fecha_nac, s, nss) VALUES
  (10995, 'Laguia M.', 'Recoletos 50', '23-JUN-1967', 'M', 280862482),
  (18004, 'Serrano V.', 'Alcala 12', '21-MAY-1960', 'F', 284991452),
  (14024, 'Fernandez M', 'Recoletos 50', '23-JUN-1967', 'F', 321790059),
  (36658, 'Domin S.', 'Mayor 71', '01-JAN-1942', 'M', 160657471),
  (38702, 'Neal R.', 'Orense 11', '18-JUN-1940', 'F', 380010217),
  (39217, 'Cervantes M.', 'Peron 38', '29-FEB-1952', 'M', 440294390),
  (59076, 'Miller G', 'Lopez de Hoyos 2', '16-SEP-1945', 'F', 311969044),
  (63827, 'Ruiz P.', 'Esquerdo 103', '26-DEC-1980', 'M', 100973253),
  (64823, 'Fraser A.', 'Soto 3', '10-JUL-1980', 'F', 285201776),
  (74835, 'Benitez E.', 'Argentina 5', '05-OCT-1957', 'M', 154811767);

CREATE TABLE emp (
  emp_no      NUMERIC(4) NOT NULL,
  apellido    VARCHAR(10),
  oficio      VARCHAR(10),
  dir         NUMERIC(4),
  fecha_alta  DATE,
  salario     NUMERIC(10),
  comision    NUMERIC(10),
  dept_no     NUMERIC(2) NOT NULL,
  PRIMARY KEY (emp_no)
);

INSERT INTO emp (emp_no, apellido, oficio, dir, fecha_alta, salario, comision, dept_no) VALUES
  (7369, 'SANCHEZ', 'EMPLEADO', 7902, '17-DEC-1980', 104000, 0, 20),
  (7499, 'ARROYO', 'VENDEDOR', 7698, '20-FEB-1981', 208000, 39000, 30),
  (7521, 'SALA', 'VENDEDOR', 7698, '22-FEB-1981', 162500, 65000, 30),
  (7566, 'JIMENEZ', 'DIRECTOR', 7839, '02-APR-1981', 386750, 0, 20),
  (7654, 'ARENAS', 'VENDEDOR', 7698, '28-SEP-1981', 162500, 182000, 30),
  (7698, 'NEGRO', 'DIRECTOR', 7839, '01-MAY-1981', 370500, 0, 30),
  (7782, 'CEREZO', 'DIRECTOR', 7839, '09-JUN-1981', 318500, 0, 10),
  (7788, 'GIL', 'ANALISTA', 7566, '09-DEC-1982', 390000, 0, 20),
  (7839, 'REY', 'PRESIDENTE', 7839, '17-NOV-1981', 650000, 0, 10),
  (7844, 'TOVAR', 'VENDEDOR', 7698, '08-SEP-1981', 195000, 0, 30),
  (7876, 'ALONSO', 'EMPLEADO', 7788, '12-JAN-1983', 143000, 0, 20),
  (7900, 'JIMENO', 'EMPLEADO', 7698, '03-DEC-1981', 123500, 0, 30),
  (7902, 'FERNANDEZ', 'ANALISTA', 7566, '03-DEC-1981', 390000, 0, 20),
  (7934, 'MUÑOZ', 'EMPLEADO', 7782, '23-JAN-1982', 169000, 0, 10);
  
CREATE TABLE dept2 (
  dept_no   NUMERIC(2) NOT NULL,
  dnombre   VARCHAR(14),
  loc       VARCHAR(14),
  PRIMARY KEY (dept_no)
);

INSERT INTO dept2 (dept_no, dnombre, loc) VALUES
  (10, 'CONTABILIDAD', 'MADRID'),
  (20, 'INVESTIGACIÓN', 'BILBAO'),
  (30, 'VENTAS', 'SEVILLA'),
  (40, 'OPERACIONES', 'MALAGA');
  
ALTER TABLE sala ADD FOREIGN KEY (hospital_cod) REFERENCES hospital(hospital_cod) ON DELETE CASCADE ON UPDATE CASCADE;

UPDATE plantilla SET hospital_cod = 22 WHERE empleado_no = 2222;
UPDATE plantilla SET sala_cod = 2 WHERE empleado_no = 2222;

ALTER TABLE plantilla ADD FOREIGN KEY (hospital_cod) REFERENCES hospital(hospital_cod)
  ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE plantilla ADD FOREIGN KEY (sala_cod, hospital_cod) REFERENCES sala(sala_cod, hospital_cod)
  ON DELETE CASCADE ON UPDATE CASCADE;
  
ALTER TABLE ocupacion ADD FOREIGN KEY (sala_cod, hospital_cod) REFERENCES sala(sala_cod, hospital_cod)
  ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE doctor ADD FOREIGN KEY (hospital_cod) REFERENCES hospital(hospital_cod) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE emp ADD FOREIGN KEY (dept_no) REFERENCES dept2(dept_no) ON DELETE CASCADE ON UPDATE CASCADE;
