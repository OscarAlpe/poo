-- CREATE DATABASE inmobiliaria;
-- USE inmobiliaria;
-- Modificado script por Rubén
-- TABLAS
DROP TABLE IF EXISTS Directores CASCADE;
DROP TABLE IF EXISTS Empleados CASCADE;
DROP TABLE IF EXISTS Entrevista CASCADE;
DROP TABLE IF EXISTS Administrativo CASCADE;
DROP TABLE IF EXISTS Pariente CASCADE;
DROP TABLE IF EXISTS Oficinas CASCADE;
DROP TABLE IF EXISTS Visitas CASCADE;
DROP TABLE IF EXISTS Clientes CASCADE;
DROP TABLE IF EXISTS Inspecciones CASCADE;
DROP TABLE IF EXISTS Inmuebles CASCADE;
DROP TABLE IF EXISTS Inmueble_Factura CASCADE;
DROP TABLE IF EXISTS Facturas CASCADE;
DROP TABLE IF EXISTS Periodico CASCADE;
DROP TABLE IF EXISTS Publicidad CASCADE;
DROP TABLE IF EXISTS Propietario CASCADE;
DROP TABLE IF EXISTS Pago CASCADE;
DROP TABLE IF EXISTS Contrato CASCADE;
/* Rubén -- Directores */
CREATE TABLE Directores (
  id_dir            integer,
  pago_anual_dir    integer,
  bonif_mensual_dir integer
);
ALTER TABLE Directores
  ADD PRIMARY KEY (id_dir);

/* Rubén -- Empleados */
CREATE TABLE Empleados (
  id_emp            integer,
  dni_emp           varchar(9),
  nombre_emp        varchar(255),
  direccion_emp     varchar(255),
  telefono_emp      varchar(9),
  fecha_naci_emp    date,
  cargo_emp         varchar(255),
  fecha_ingreso_emp date,
  salario_anual_emp int,
  id_ofi            int
);
ALTER TABLE Empleados
  ADD PRIMARY KEY (id_emp);
/* David -- Entrevista */
create table Entrevista (
  id_emp integer,
  id_cli integer,
  fecha_ent date,
  comentario_ent varchar (255),
  primary key (id_emp,id_cli)
);
/* David -- Administrativo */
CREATE table Administrativo (
  id_adm integer,
  velocidad_escri_adm integer,
  primary key (id_adm)
);
/* David -- Pariente */
create table Pariente (
  id_par integer,
  nombre_par varchar(255),
  parentesco_par varchar(255),
  direccion_par varchar (255),
  telefono_par varchar(9),
  id_emp integer,
  primary key (id_par)
);
/* Oscar -- Oficinas */
CREATE TABLE oficinas (
  id_ofi int NOT NULL,
  direccion_ofi varchar(255),
  telefono_ofi varchar(9),
  fax_ofi varchar(9),
  PRIMARY KEY(id_ofi)
);
/* Oscar -- Visitas */
CREATE TABLE visitas (
  id_inm int NOT NULL,
  id_cli int,
  fecha_vis date,
  comentario_vis varchar(255),
  PRIMARY KEY (id_inm)
);
/* Oscar -- Clientes */
CREATE TABLE clientes (
  id_cli int NOT NULL,
  nombre_cli varchar(255),
  direccion_cli varchar(255),
  telefono_cli varchar(9),
  inmueble_preferido_cli varchar(255),
  importe_maximo_cli int,
  PRIMARY KEY(id_cli)
);

/* Antonio -- Inspecciones */
CREATE TABLE inspecciones(
  id_ins INTEGER PRIMARY KEY,
  fecha_ins DATE NOT NULL,
  comentario_ins VARCHAR (355) NOT NULL,
  id_emp INTEGER DEFAULT NULL,
  id_inm INTEGER NOT NULL
);
/* Antonio -- Inmuebles */
CREATE TABLE inmuebles(
  id_inm INTEGER PRIMARY KEY,
  direccion_inm VARCHAR (255) NOT NULL,
  tipo_inm VARCHAR (50) NOT NULL,
  nro_habi_inm INTEGER  NOT NULL,
  precio_alquiler_inm  INTEGER  NOT NULL,
  precio_venta_inm  INTEGER  NOT NULL,
  galeria VARCHAR (50) NOT NULL,
  id_ofi INTEGER NOT NULL,
  id_pro INTEGER DEFAULT NULL,
  id_emp INTEGER NOT NULL
);
/* Pablo -- Inmueble_Factura */
CREATE TABLE Inmueble_Factura(
 id_inm int,
 id_fac int,
 PRIMARY KEY(id_inm,id_fac)
);
/* Pablo -- Facturas */
CREATE TABLE Facturas(
 id_fac int,
 importe_fac int,
 metodo_pago varchar(255),
 importe_deposito int,
 plazo_pago int,
 observaciones varchar(255),
 id_cli int,
 PRIMARY KEY(id_fac)
);
/* Andrés -- Periodico */
create table periodico(
  id_per integer NOT NULL,
  nombre_per varchar(20) DEFAULT NULL,
  direccion_per varchar(20) DEFAULT NULL,
  telefono_per integer DEFAULT NULL,
  fax_per integer DEFAULT NULL,
  nombre_pers_cont_per varchar(20) DEFAULT NULL,
  primary key (id_per)
);
/* Agustín -- Publicidad */
 CREATE TABLE Publicidad (
  id_pub int,
  fecha_pub date,
  costo_pub int,
  id_inm int,
  id_per int
);
ALTER TABLE Publicidad add primary key (id_pub);
/* Andrés -- Propietario */
create table propietario(
  id_pro integer NOT NULL,
  nombre_pro varchar(20) DEFAULT NULL,
  direccion_pro varchar(20) DEFAULT NULL,
  telefono_pro integer DEFAULT NULL,
  tipo_empresa_pro varchar (20) DEFAULT NULL,
  persona_contrato_pro varchar(20) DEFAULT NULL,
  primary key (id_pro)
);
/* Pablo -- Pago */
CREATE TABLE Pago (
 id_pag int,
 importe int,
 fecha_pag date,
 id_fac int,
 PRIMARY KEY (id_pag)
);
/* Agustín -- Contrato */
CREATE TABLE Contrato (
  id_con integer PRIMARY KEY,
  importe_mensual_con integer,
  metodo_pago_con varchar(255),
  importe_deposito_con int,
  esta_cancelado_con integer CHECK (esta_cancelado_con < 2),
  fecha_inicio_con date,
  fecha_fin_con date,
  duracion_con integer,
  id_inm integer,
  id_emp integer,
  id_cli integer
);

-- Relaciones de empleados
/* Rubén -- Directores 1->1(son) Empleados */
ALTER TABLE Directores
  ADD CONSTRAINT fk_empleados_son_directores
    FOREIGN KEY (id_dir)
      REFERENCES Empleados (id_emp);
/* Rubén/David -- Administrativos 1->1(son) Empleados */
ALTER TABLE Administrativo
  ADD CONSTRAINT fk_empleados_son_administrativos
    FOREIGN KEY (id_adm)
      REFERENCES Empleados (id_emp);
/* Rubén -- Empleados n->1(pertenecen) Oficina */
ALTER TABLE Empleados
  ADD CONSTRAINT fk_empleados_de_oficina
    FOREIGN KEY (id_ofi)
      REFERENCES Oficinas (id_ofi);
/* David -- Empleados n<->n(entrevistan) Clientes */
alter table Entrevista
  add constraint fk_Empleados_entrevistan
    foreign key (id_emp)
     references Empleados(id_emp);
alter table Entrevista
  add constraint fk_Clientes_entrevistan
    foreign key (id_cli)
     references Clientes (id_cli);
/* David -- Pariente n->1(pertenecen) Empleados */
alter table Pariente
  add constraint fk_Pariente_de_empleado
    foreign key (id_emp)
      references Empleados(id_emp); 
/* Rubén/Oscar Clientes n<->n(visitan) Clientes */
ALTER TABLE Visitas
  ADD CONSTRAINT fk_Clientes_visitan
    FOREIGN KEY (id_cli)
      REFERENCES Clientes (id_cli);
ALTER TABLE Visitas
  ADD CONSTRAINT fk_Inmuebles_visitan
    FOREIGN KEY (id_inm)
      REFERENCES Inmuebles (id_inm);
/* Rubén/? Empleados n<->n(inspeccionan) Inmuebles */
ALTER TABLE Inspecciones
  ADD CONSTRAINT fk_Emplados_inspeccionan
    FOREIGN KEY (id_emp)
      REFERENCES Empleados(id_emp);
ALTER TABLE Inspecciones
  ADD CONSTRAINT fk_Inmuebles_inspeccionan
    FOREIGN KEY (id_inm)
      REFERENCES Inmuebles(id_inm);
/* Rubén/?  Oficina 1->n(de) Inmueble */
ALTER TABLE Inmuebles
  ADD CONSTRAINT fk_Oficina_de_Inmueble
    FOREIGN KEY (id_ofi)
      REFERENCES Oficinas(id_ofi);
/* Rubén/?  Propietario 1->n(de) Inmueble */
ALTER TABLE Inmuebles
  ADD CONSTRAINT fk_Propietario_de_Inmueble
    FOREIGN KEY (id_pro)
      REFERENCES Propietario(id_pro);
/* Rubén/?  Empleado 1->n(de) Inmueble */
ALTER TABLE Inmuebles
  ADD CONSTRAINT fk_Encargado_de_Inmueble
    FOREIGN KEY (id_emp)
      REFERENCES Empleados(id_emp);
/* ? Inmuebles n<->n(en) Facturas */
ALTER TABLE Inmueble_Factura
  ADD CONSTRAINT FKInmueble_FacturaInmuebles
    FOREIGN KEY (id_inm)
      REFERENCES Inmuebles(id_inm);
ALTER TABLE Inmueble_Factura
  ADD CONSTRAINT FKInmueble_FacturaFacturas
    FOREIGN KEY (id_fac)
      REFERENCES Facturas(id_fac);
/* ? Clientes 1->n(pagan) Facturas */
ALTER TABLE Facturas
  ADD CONSTRAINT FKFacturasClientes
    FOREIGN KEY (id_cli)
      REFERENCES Clientes(id_cli);
/* Rubén/Agustín Periodicos n<->n(publicitan) Inmuebles */
ALTER TABLE Publicidad
  ADD CONSTRAINT fk_Periodico_publicita
    FOREIGN KEY (id_per)
      REFERENCES Periodico(id_per);
ALTER TABLE Publicidad
  ADD CONSTRAINT fk_Inmuebles_publicitados
    FOREIGN KEY (id_inm)
      REFERENCES Inmuebles(id_inm);

/* Agustín Clientes n<->n(contratan)(Empleado/inmueble) */
ALTER TABLE Contrato
  ADD CONSTRAINT fk_Clientes_contratan
    FOREIGN KEY(id_cli)
      REFERENCES Clientes(id_cli);
ALTER TABLE Contrato
  ADD CONSTRAINT fk_Empleado_contratado
    FOREIGN KEY(id_emp)
      REFERENCES empleados(id_emp); -- ???
ALTER TABLE Contrato
  ADD CONSTRAINT fk_Inmuebles_contratado
    FOREIGN KEY(id_inm)
      REFERENCES Inmuebles(id_inm);

/* Rubén/Pablo */
ALTER TABLE Pago
  ADD CONSTRAINT FKFacturaPago
    FOREIGN KEY (id_fac)
      REFERENCES Facturas(id_fac);