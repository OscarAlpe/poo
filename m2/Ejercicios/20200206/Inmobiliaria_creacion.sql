CREATE DATABASE inmobiliaria;

/* Andrés*/


create table periodico(
id_per integer NOT NULL,
nombre_per varchar(20) DEFAULT NULL,
direccion_per varchar(20) DEFAULT NULL,
telefono_per integer DEFAULT NULL,
fax_per integer DEFAULT NULL,
nombre_pers_cont_per varchar(20) DEFAULT NULL,
primary key (id_per)
);

create table propietario(
id_pro integer NOT NULL,
nombre_pro varchar(20) DEFAULT NULL,
direccion_pro varchar(20) DEFAULT NULL,
telefono_pro integer DEFAULT NULL,
tipo_empresa_pro varchar (20) DEFAULT NULL,
persona_contrato_pro varchar(20) DEFAULT NULL,
primary key (id_pro)
);


/*Rubén*/

-- Directores
CREATE TABLE Directores (
  id_dir            integer,
  pago_anual_dir    integer,
  bonif_mensual_dir integer
);
ALTER TABLE Directores
  ADD PRIMARY KEY (id_dir);
-- Empleados
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
-- Empleados


/*David*/
  create table Entrevista (
  id_emp integer,
  id_cli integer,
  fecha_ent date, 
  comentario_ent varchar (255),
  primary key (id_emp,id_cli)
);

CREATE table Administrativo (
  id_adm integer,
  velocidad_escri_adm integer,
  primary key (id_adm)
  );

create table Pariente (
  id_par integer,
  nombre_par varchar(255),
  parentesco_par varchar(255),
  direccion_par varchar (255),
  telefono_par varchar(9),
  id_emp integer,
  primary key (id_par));





/*Pablo*/

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

CREATE TABLE Inmueble_Factura(
	id_inm int,
	id_fac int,
	PRIMARY KEY(id_inm,id_fac)
);


CREATE TABLE Pago(
	id_pag int,
	importe int,
	fecha_pag date,
	id_fac int,
	PRIMARY KEY(id_pag)
);



/*Agustín*/
-- SQL para tablas publicidad y contrato:


CREATE TABLE Publicidad (
  id_pub int,
  fecha_pub date,
  costo_pub int,
  id_inm int,
  id_per int
 
  );

ALTER TABLE Publicidad add primary key (id_pub);

CREATE TABLE Contrato (
  id_con int PRIMARY KEY,
  importe_mensual_con int,
  metodo_pago_con varchar(255),
  importe_deposito_con int,
  esta_cancelado_con int CHECK (esta_cancelado_con < 2),
  fecha_inicio_con date,
  fecha_fin_con date,
  duracion_con int,
  id_inm int REFERENCES Inmuebles(id_inm),
  id_emp int REFERENCES Empleados(id_emp),
  id_cli int REFERENCES Clientes(id_cli)
  );


/*Oscar*/

-- Tabla oficinas
CREATE TABLE oficinas (
  id_ofi int NOT NULL,
  direccion_ofi varchar(255),
  telefono_ofi varchar(9),
  fax_ofi varchar(9),
  PRIMARY KEY(id_ofi)
);

-- Tabla visitas
CREATE TABLE visitas (
  id_inm int NOT NULL,
  id_cli int,
  fecha_vis date,
  comentario_vis varchar(255),
  PRIMARY KEY (id_inm, id_cli, fecha_vis)
);

-- Tabla Clientes
CREATE TABLE clientes (
  id_cli int NOT NULL,
  nombre_cli varchar(255),
  direccion_cli varchar(255),
  telefono_cli varchar(9),
  inmueble_preferido_cli int,
  importe_maximo_cli int,
  PRIMARY KEY(id_cli)
);



/*Antonio*/

CREATE TABLE inspecciones(
  id_ins INTEGER PRIMARY KEY,
  fecha_ins DATE NOT NULL,
  comentario_ins VARCHAR (355) NOT NULL,
  id_emp INTEGER DEFAULT NULL,
  id_inm INTEGER NOT NULL,
  CONSTRAINT fkey_inmuebles_id_inm FOREIGN KEY (id_inm)
      REFERENCES inmuebles (id_inm)
);

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
  id_emp INTEGER NOT NULL,
  CONSTRAINT fkey_oficinas_id_ofi FOREIGN KEY (id_ofi)
      REFERENCES oficinas (id_ofi),
  CONSTRAINT fkey_empleados_id_emp FOREIGN KEY (id_emp)
      REFERENCES empleados (id_emp)
);

alter table periodico add CONSTRAINT FK_publicidad_id_pub FOREIGN KEY (id_per)
REFERENCES publicidad (id_pub) ON DELETE CASCADE ON UPDATE CASCADE;

alter table propietario add CONSTRAINT FK_inmuebles_id_inm FOREIGN KEY (id_pro)
REFERENCES inmuebles (id_inm) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE Empleados
  ADD CONSTRAINT fk_oficina
    FOREIGN KEY (id_ofi)
      REFERENCES Oficinas (id_ofi);

alter table Entrevista
  add constraint fk_Empleados
    foreign key (id_emp)
     references Empleados(id_emp);
  
 
alter table Entrevista
  add constraint fk_Clientes
    foreign key (id_cli)
     references Clientes (id_cli);

alter table Administrativo
  add constraint fk_Empleados
    foreign key (id_adm)
     references Empleados (id_emp);


alter table Pariente
add constraint fk_Empleados
foreign key (id_emp)
references Empleados(id_emp);  

ALTER TABLE Inmueble_Factura
ADD CONSTRAINT FKInmueble_FacturaInmuebles
FOREIGN KEY (id_inm) REFERENCES Inmuebles(id_inm);

ALTER TABLE Inmueble_Factura
ADD CONSTRAINT FKInmueble_FacturaFacturas
FOREIGN KEY (id_fac) REFERENCES Facturas(id_fac);

ALTER TABLE Facturas
ADD CONSTRAINT FKFacturasClientes
FOREIGN KEY (id_cli) REFERENCES Clientes(id_cli);

ALTER TABLE Facturas
ADD CONSTRAINT FKFacturaPago
FOREIGN KEY (id_fac) REFERENCES Pago(id_fac);

ALTER TABLE Publicidad add foreign key (id_inm) REFERENCES Inmuebles(id_inm);
ALTER TABLE Publicidad add foreign key (id_per) REFERENCES Periodico(id_per);

ALTER TABLE inmuebles ADD FOREIGN KEY (id_ofi) REFERENCES oficinas(id_ofi) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE visitas ADD FOREIGN KEY (id_cli) REFERENCES clientes(id_cli) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE facturas ADD FOREIGN KEY (id_cli) REFERENCES clientes(id_cli) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE contrato ADD FOREIGN KEY (id_cli) REFERENCES clientes(id_cli) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE visitas ADD CONSTRAINT fkey_visitas_id_inm FOREIGN KEY (id_inm) REFERENCES inmuebles(id_inm);
