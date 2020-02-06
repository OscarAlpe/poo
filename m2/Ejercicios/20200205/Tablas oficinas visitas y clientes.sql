-- Tabla oficinas
CREATE TABLE oficinas (
  id_ofi int NOT NULL,
  direccion_ofi varchar(255),
  telefono_ofi varchar(9),
  fax_ofi varchar(9),
  PRIMARY KEY(id_ofi),
);

-- Tabla visitas
CREATE TABLE visitas (
  id_inm int NOT NULL,
  id_cli int,
  fecha_vis date,
  comentario_vis varchar(255),
  PRIMARY KEY (id_inm)
);

-- Tabla Clientes
CREATE TABLE clientes (
  id_cli int NOT NULL,
  nombre_cli varchar(255),
  direccion_cli varchar(255),
  telefono_cli varchar(9),
  inmueble_preferido_cli int,
  importe_maximo_cli int,
  PRIMARY KEY(id_cli),
);

ALTER TABLE oficinas ADD FOREIGN KEY (id_ofi) REFERENCES inmuebles(id_ofi) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE clientes ADD FOREIGN KEY (id_cli) REFERENCES visitas(id_cli) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE clientes ADD FOREIGN KEY (id_cli) REFERENCES facturas(id_cli) ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE clientes ADD FOREIGN KEY (id_cli) REFERENCES contrato(id_cli) ON DELETE CASCADE ON UPDATE CASCADE;
