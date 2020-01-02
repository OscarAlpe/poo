CREATE DATABASE ciclistas;

-- -------------------------------------
-- Tables

CREATE TABLE ciclista (
  dorsal SMALLINT NOT NULL,
  nombre VARCHAR(30) NOT NULL,
  edad SMALLINT NULL,
  nomequipo VARCHAR(25) NOT NULL,
  PRIMARY KEY (dorsal) );

CREATE INDEX equipociclista ON ciclista(nomequipo);

CREATE TABLE equipo (
  nomequipo VARCHAR(25) NOT NULL,
  director VARCHAR(30) NULL,
  PRIMARY KEY (nomequipo)
);

CREATE TABLE etapa (
  numetapa SMALLINT NOT NULL,
  kms SMALLINT NOT NULL,
  salida VARCHAR(35) NOT NULL,
  llegada VARCHAR(35) NOT NULL,
  dorsal SMALLINT NULL,
  PRIMARY KEY (numetapa)
);

CREATE INDEX ciclistaetapa ON etapa(dorsal);

CREATE TABLE lleva (
  dorsal SMALLINT NOT NULL,
  numetapa SMALLINT NOT NULL,
  codigo VARCHAR(3) NOT NULL,
  PRIMARY KEY (numetapa, codigo)
);

CREATE INDEX ciclistallevar ON lleva(dorsal);
CREATE INDEX etapallevar ON lleva(numetapa);
CREATE INDEX maillotllevar ON lleva(codigo);

CREATE TABLE maillot (
  codigo VARCHAR(3) NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  color VARCHAR(20) NOT NULL,
  premio INT NOT NULL,
  PRIMARY KEY (codigo)
);

CREATE TABLE puerto (
  nompuerto VARCHAR(35) NOT NULL,
  altura SMALLINT NOT NULL,
  categoria VARCHAR(1) NOT NULL,
  pendiente DOUBLE PRECISION NULL,
  numetapa SMALLINT NOT NULL,
  dorsal SMALLINT NULL,
  PRIMARY KEY (nompuerto)
);

CREATE INDEX ciclistapuerto ON puerto(dorsal);
CREATE INDEX etapapuerto ON puerto(numetapa);

-- ----------------------------------------------------------------------
-- EOF

