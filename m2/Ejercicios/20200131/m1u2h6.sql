-- Script was generated by Devart dbForge Studio for MySQL, Version 6.0.128.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 14/06/2016 18:28:59
-- Server version: 5.5.5-10.1.9-MariaDB
-- Client version: 4.1

--
-- Definition for database ejercicio8
--
CREATE DATABASE m1u2h6;

-- 
-- Disable foreign keys
-- 
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;

-- 
-- Set character set the client will use to send SQL statements to the server
--
SET NAMES 'utf8';

-- 
-- Set default database
--

--
-- Definition for table clientes
--
CREATE TABLE clientes (
  CODIGO_CLIENTE varchar(4) NOT NULL,
  EMPRESA varchar(25) DEFAULT NULL,
  DIRECCION varchar(20) DEFAULT NULL,
  POBLACION varchar(10) DEFAULT NULL,
  TELEFONO varchar(9) DEFAULT NULL,
  RESPONSABLE varchar(40) DEFAULT NULL,
  HISTORIAL text DEFAULT NULL,
  PRIMARY KEY (CODIGO_CLIENTE)
);

--
-- Definition for table productos
--
CREATE TABLE productos (
  CODIGO_ARTICULO varchar(4) NOT NULL,
  SECCION varchar(12) DEFAULT NULL,
  NOMBRE_ARTICULO varchar(255) DEFAULT NULL,
  PRECIO decimal(19, 4) DEFAULT NULL,
  FECHA  timestamp DEFAULT NULL,
  IMPORTADO smallint NOT NULL,
  PAIS_DE_ORIGEN varchar(255) DEFAULT NULL,
  FOTO bytea DEFAULT NULL,
  PRIMARY KEY (CODIGO_ARTICULO)
);

--
-- Definition for table pedidos
--
CREATE TABLE pedidos (
  NUMERO_DE_PEDIDO int NOT NULL,
  CODIGO_CLIENTE varchar(4) DEFAULT NULL,
  FECHA_DE_PEDIDO timestamp DEFAULT NULL,
  FORMA_DE_PAGO varchar(8) DEFAULT NULL,
  DESCUENTO decimal(19, 4) DEFAULT NULL,
  ENVIADO smallint NOT NULL,
  PRIMARY KEY (NUMERO_DE_PEDIDO),
  CONSTRAINT FK_pedidos_clientes_CODIGO_CLIENTE FOREIGN KEY (CODIGO_CLIENTE)
  REFERENCES clientes (CODIGO_CLIENTE) ON DELETE CASCADE ON UPDATE CASCADE
);
--
-- Definition for table `productos- pedidos`
--
CREATE TABLE prodped (
  NUMERO_DE_PEDIDO int NOT NULL,
  CODIGO_ARTICULO varchar(4) NOT NULL,
  UNIDADES double precision DEFAULT NULL,
  PRIMARY KEY (NUMERO_DE_PEDIDO, CODIGO_ARTICULO),
  CONSTRAINT "FK_prodped_pedidos_NUMERO_DE_PEDIDO" FOREIGN KEY (NUMERO_DE_PEDIDO)
  REFERENCES pedidos (NUMERO_DE_PEDIDO) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT "FK_prodped_productos_CODIGO_ARTICULO" FOREIGN KEY (CODIGO_ARTICULO)
  REFERENCES productos (CODIGO_ARTICULO) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 
-- Dumping data for table clientes
--
INSERT INTO clientes VALUES
('CT01', 'BELTRÁN E HIJOS', 'LAS FUENTES 78', 'MADRID', '914456435', 'ANGEL MARTÍNEZ', NULL),
('CT02', 'LA MODERNA', 'LA PALOMA 123', 'OVIEDO', '985323434', 'JUAN GARCÍA', NULL),
('CT03', 'EL ESPAÑOLITO', 'MOTORES 34', 'BARCELONA', '934565343', 'ANA FERNÁNDEZ', NULL),
('CT04', 'EXPORTASA', 'VALLECAS 34', 'MADRID', '913452378', 'ELVIRA GÓMEZ', NULL),
('CT06', 'CONFECCIONES AMPARO', 'LOS MOROS 23', 'GIJÓN', '985754332', 'LUÍS ÁLVAREZ', NULL),
('CT07', 'LA CASA DEL JUGUETE', 'AMÉRICA 45', 'MADRID', '912649987', 'ELÍAS PÉREZ', NULL),
('CT08', 'JUGUETERÍA SUÁREZ', 'PARIS 123', 'BARCELONA', '933457866', 'JUAN GARCÍA', NULL),
('CT09', 'ALMACÉN POPULAR', 'LAS FUENTES 124', 'BILBAO', '942347127', 'JOSÉ ÁLVAREZ', NULL),
('CT10', 'FERETERÍA EL CLAVO', 'PASEO DE ÁLAMOS 78', 'MADRID', '914354866', 'MANUEL MENÉNDEZ', NULL),
('CT11', 'JUGUETES MARTÍNEZ', 'VIA LAYETANA 245', 'BARCELONA', '936628554', 'FRANCISCO CUEVAS', NULL),
('CT12', 'FERNÁNDEZ SL', 'PASEO DEL MAR 45', 'SANTANDER', '942049586', 'ELISA COLLADO', NULL),
('CT13', 'CONFECCIONES ARTÍMEZ', 'GENERAL PERÓN 45', 'A CORUÑA', '981345239', 'ESTEBAN PASCUAL', NULL),
('CT14', 'DEPORTES GARCÍA', 'GUZMÁN EL BUENO 45', 'MADRID', '913299475', 'ANA JIMÉNEZ', NULL),
('CT15', 'EXCLUSIVAS FERNÁNDEZ', 'LLOBREGAT 250', 'BARCELONA', '939558365', 'LUISA FERNÁNDEZ', NULL),
('CT16', 'DEPORTES MORÁN', 'AUTONOMÍA 45', 'LUGO', '982986944', 'JOSÉ MANZANO', NULL),
('CT17', 'BAZAR FRANCISCO', 'CARMEN 45', 'ZAMORA', '980495288', 'CARLOS BELTRÁN', NULL),
('CT18', 'JUGUETES LA SONRISA', 'LA BAÑEZA 67', 'LEÓN', '987945368', 'FAUSTINO PÉREZ', NULL),
('CT19', 'CONFECCIONES GALÁN', 'FUENCARRAL 78', 'MADRID', '913859234', 'JUAN GARCÍA', NULL),
('CT20', 'LA CURTIDORA', 'OLIVARES 3', 'MÁLAGA', '953756259', 'MARÍA GÓMEZ', NULL),
('CT21', 'LÍNEA JOVEN', 'SIERPES 78', 'SEVILLA', '953452567', 'ASUNCIÓN SALADO', NULL),
('CT22', 'BAZAR EL BARAT', 'DIAGONAL 56', 'BARCELONA', '936692866', 'ELISA DAPENA', NULL),
('CT23', 'EL PALACIO DE LA MODA', 'ORTEGA Y GASSET 129', 'MADRID', '927785235', 'LAURA CARRASCO', NULL),
('CT24', 'SÁEZ Y CÍA', 'INFANTA MERCEDS 23', 'SEVILLA', '954869234', 'MANUEL GUERRA', NULL),
('CT25', 'DEPORTES EL MADRILEÑO', 'CASTILLA 345', 'ZARAGOZA', '976388934', 'CARLOS GONZÁLEZ', NULL),
('CT26', 'FERRETERÍA LA ESCOBA', 'ORENSE 7', 'MADRID', '918459346', 'JOSÉ GARCÍA', NULL),
('CT27', 'JUGUETES EL BARATO', 'VÍA AUGUSTA 245', 'BARCELONA', '933486984', 'ELVIRA IGLESIAS', NULL),
('CT28', 'CONFECCIONES HERMINIA', 'CORRIDA 345', 'GIJÓN', '985597315', 'ABEL GONZÁLEZ', NULL),
('CT30', 'BAZAR EL ARGENTINO', 'ATOCHA 55', 'MADRID', '912495973', 'ADRIÁN ÁLVAREZ', NULL),
('CT31', 'LA TIENDA ELEGANTE', 'EL COMENDADOR 67', 'ZARAGOZA', '975694035', 'JOSÉ PASCUAL', NULL),
('CT32', 'DEPORTES NAUTICOS GARCÍA', 'JUAN FERNÁNDEZ 89', 'ÁVILA', '920268648', 'JUAN CONRADO', NULL),
('CT33', 'CONFECCIONES RUIZ', 'LLOBREGAT 345', 'BARCELONA', '934587615', 'CARLOS SANZ', NULL),
('CT34', 'BAZAR LA FARAONA', 'CASTILLA Y LEÓN 34', 'MADRID', '915483627', 'ANGEL SANTAMARÍA', NULL),
('CT35', 'FERRETERÍA EL MARTILLO', 'CASTELLANOS 205', 'SALAMANCA', '923548965', 'JOAQUÍN FERNANDEZ', NULL),
('CT36', 'JUGUETES EDUCATIVOS SANZ', 'ORENSE 89', 'MADRID', '916872354', 'PEDRO IGLESIAS', NULL),
('CT37', 'ALMACENES FERNANDEZ', 'ANTÓN 67', 'TERUEL', '978564025', 'MARIA ARDANZA', NULL),
('CT38', 'CONFECCIONES MÓNICA', 'MOTORES 67', 'BARCELONA', '935681245', 'PEDRO SERRANO', NULL),
('CT39', 'FERRETERÍA LIMA', 'VALLECAS 45', 'MADRID', '913532785', 'LUIS GARCÍA', NULL),
('CT40', 'DEPORTES EL BRASILEÑO', 'ABEL MARTÍNEZ 67', 'SALAMANCA', '921548762', 'CARLOS GÓMEZ', NULL);

-- 
-- Dumping data for table productos
--
INSERT INTO productos VALUES
('AR01', 'FERRETERÍA', 'DESTORNILLADOR', 6.6280, '2000-10-22 00:00:00', 0, 'ESPAÑA', NULL),
('AR02', 'CONFECCIÓN', 'TRAJE CABALLERO', 284.5769, '2002-03-11 00:00:00', 1, 'ITALIA', NULL),
('AR03', 'JUGUETERÍA', 'COCHE TELEDIRIGIDO', 159.4462, '2002-05-26 00:00:00', 1, 'MARRUECOS', NULL),
('AR04', 'DEPORTES', 'RAQUETA TENIS', 93.4694, '2000-03-20 00:00:00', 1, 'USA', NULL),
('AR06', 'DEPORTES', 'MANCUERNAS', 60.0000, '2000-09-13 00:00:00', 1, 'USA', NULL),
('AR07', 'CONFECCIÓN', 'SERRUCHO', 30.2045, '2001-03-23 00:00:00', 1, 'FRANCIA', NULL),
('AR08', 'JUGUETERÍA', 'CORREPASILLOS', 103.3356, '2000-04-11 00:00:00', 1, 'JAPÓN', NULL),
('AR09', 'CONFECCIÓN', 'PANTALÓN SEÑORA', 174.2310, '2000-01-10 00:00:00', 1, 'MARRUECOS', NULL),
('AR10', 'JUGUETERÍA', 'CONSOLA VIDEO', 442.5444, '2002-09-24 00:00:00', 1, 'USA', NULL),
('AR11', 'CERÁMICA', 'TUBOS', 168.4253, '2000-02-04 00:00:00', 1, 'CHINA', NULL),
('AR12', 'FERRETERÍA', 'LLAVE INGLESA', 24.3986, '2001-05-23 00:00:00', 1, 'USA', NULL),
('AR13', 'CONFECCIÓN', 'CAMISA CABALLERO', 67.1306, '2002-08-11 00:00:00', 0, 'ESPAÑA', NULL),
('AR14', 'JUGUETERÍA', 'TREN ELÉCTRICO', 1505.3766, '2001-07-03 00:00:00', 1, 'JAPÓN', NULL),
('AR15', 'CERÁMICA', 'PLATO DECORATIVO', 54.0911, '2000-06-07 00:00:00', 1, 'CHINA', NULL),
('AR16', 'FERRETERÍA', 'ALICATES', 6.7362, '2000-04-17 00:00:00', 1, 'ITALIA', NULL),
('AR17', 'JUGUETERÍA', 'MUÑECA ANDADORA', 105.0593, '2001-01-04 00:00:00', 0, 'ESPAÑA', NULL),
('AR18', 'DEPORTES', 'PISTOLA OLÍMPICA', 46.7347, '2001-02-02 00:00:00', 1, 'SUECIA', NULL),
('AR19', 'CONFECCIÓN', 'BLUSA SRA.', 101.0566, '2000-03-18 00:00:00', 1, 'CHINA', NULL),
('AR20', 'CERÁMICA', 'JUEGO DE TE', 43.2728, '2001-01-15 00:00:00', 1, 'CHINA', NULL),
('AR21', 'CERÁMICA', 'CENICERO', 19.7468, '2001-07-02 00:00:00', 1, 'JAPÓN', NULL),
('AR22', 'FERRETERÍA', 'MARTILLO', 11.3952, '2001-09-04 00:00:00', 0, 'ESPAÑA', NULL),
('AR23', 'CONFECCIÓN', 'CAZADORA PIEL', 522.6930, '2001-07-10 00:00:00', 1, 'ITALIA', NULL),
('AR24', 'DEPORTES', 'BALÓN RUGBY', 111.6440, '2000-11-11 00:00:00', 1, 'USA', NULL),
('AR25', 'DEPORTES', 'BALÓN BALONCESTO', 75.2731, '2001-06-25 00:00:00', 1, 'JAPÓN', NULL),
('AR26', 'JUGUETERÍA', 'FUERTE DE SOLDADOS', 143.7020, '2000-11-25 00:00:00', 1, 'JAPÓN', NULL),
('AR27', 'CONFECCIÓN', 'ABRIGO CABALLERO', 500000.0000, '2002-04-05 00:00:00', 1, 'ITALIA', NULL),
('AR28', 'DEPORTES', 'BALÓN FÚTBOL', 43.9147, '2002-07-04 00:00:00', 0, 'ESPAÑA', NULL),
('AR29', 'CONFECCIÓN', 'ABRIGO SRA', 360.0736, '2001-05-03 00:00:00', 1, 'MARRUECOS', NULL),
('AR30', 'FERRETERÍA', 'DESTORNILLADOR', 9.0584, '2002-02-20 00:00:00', 1, 'FRANCIA', NULL),
('AR31', 'JUGUETERÍA', 'PISTOLA CON SONIDOS', 57.2500, '2001-04-15 00:00:00', 0, 'ESPAÑA', NULL),
('AR32', 'DEPORTES', 'CRONÓMETRO', 439.1764, '2002-01-03 00:00:00', 1, 'USA', NULL),
('AR33', 'CERÁMICA', 'MACETA', 29.0434, '2000-02-23 00:00:00', 0, 'ESPAÑA', NULL),
('AR34', 'OFICINA', 'PIE DE LÁMPARA', 39.7606, '2001-05-27 00:00:00', 1, 'TURQUÍA', NULL),
('AR35', 'FERRETERÍA', 'LIMA GRANDE', 22.0692, '2002-08-10 00:00:00', 0, 'ESPAÑA', NULL),
('AR36', 'FERRETERÍA', 'JUEGO DE BROCAS', 15.0950, '2002-07-04 00:00:00', 1, 'TAIWÁN', NULL),
('AR37', 'CONFECCIÓN', 'CINTURÓN DE PIEL', 4.3273, '2002-05-12 00:00:00', 0, 'ESPAÑA', NULL),
('AR38', 'DEPORTES', 'CAÑA DE PESCA', 270.0000, '2000-02-14 00:00:00', 1, 'USA', NULL),
('AR39', 'CERÁMICA', 'JARRA CHINA', 127.7704, '2002-09-02 00:00:00', 1, 'CHINA', NULL),
('AR40', 'DEPORTES', 'BOTA ALPINISMO', 144.0000, '2002-05-05 00:00:00', 0, 'ESPAÑA', NULL),
('AR41', 'DEPORTES', 'PALAS DE PING PONG', 21.6000, '2002-02-02 00:00:00', 0, 'ESPAÑA', NULL);

-- 
-- Dumping data for table pedidos
--
INSERT INTO pedidos VALUES
(1, 'CT01', '2000-03-11 00:00:00', 'CONTADO', 0.0200, 1),
(3, 'CT23', '2000-03-18 00:00:00', 'APLAZADO', 0.0600, 0),
(5, 'CT25', '2000-03-31 00:00:00', 'CONTADO', 0.0900, 0),
(7, 'CT12', '2000-04-12 00:00:00', 'CONTADO', 0.0700, 0),
(8, 'CT01', '2000-04-15 00:00:00', 'TARJETA', 0.0200, 1),
(9, 'CT21', '2000-04-21 00:00:00', 'CONTADO', 0.0400, 0),
(11, 'CT04', '2001-05-01 00:00:00', 'CONTADO', 0.0800, 1),
(12, 'CT06', '2001-05-19 00:00:00', 'CONTADO', 0.0900, 1),
(13, 'CT13', '2000-04-30 00:00:00', 'APLAZADO', 0.0300, 0),
(16, 'CT25', '2001-05-11 00:00:00', 'CONTADO', 0.1200, 0),
(19, 'CT10', '2002-05-22 00:00:00', 'CONTADO', 0.0700, 1),
(21, 'CT16', '2001-05-28 00:00:00', 'CONTADO', 0.0300, 0),
(22, 'CT07', '2000-05-31 00:00:00', 'TARJETA', 0.0500, 1),
(25, 'CT18', '2000-06-02 00:00:00', 'CONTADO', 0.0600, 0),
(26, 'CT09', '2001-06-04 00:00:00', 'APLAZADO', 0.0700, 1),
(27, 'CT34', '2000-06-06 00:00:00', 'CONTADO', 0.0400, 0),
(28, 'CT28', '2000-06-08 00:00:00', 'APLAZADO', 0.0800, 0),
(29, 'CT30', '2001-04-02 00:00:00', 'TARJETA', 0.0600, 0),
(30, 'CT02', '2000-08-15 00:00:00', 'CONTADO', 0.0600, 1),
(31, 'CT30', '2000-06-08 00:00:00', 'TARJETA', 0.0500, 1),
(32, 'CT14', '2001-06-20 00:00:00', 'APLAZADO', 0.0600, 0),
(34, 'CT26', '2002-06-23 00:00:00', 'TARJETA', 0.0500, 0),
(35, 'CT26', '2001-06-30 00:00:00', 'CONTADO', 0.0600, 0),
(37, 'CT24', '2001-07-02 00:00:00', 'TARJETA', 0.0300, 1),
(39, 'CT20', '2001-07-08 00:00:00', 'TARJETA', 0.0600, 1),
(40, 'CT04', '2002-07-12 00:00:00', 'CONTADO', 0.1200, 0),
(42, 'CT34', '2002-07-15 00:00:00', 'APLAZADO', 0.0700, 1),
(43, 'CT09', '2001-07-18 00:00:00', 'CONTADO', 0.0700, 0),
(44, 'CT34', '2002-07-20 00:00:00', 'APLAZADO', 0.0400, 0),
(45, 'CT30', '2002-07-22 00:00:00', 'TARJETA', 0.0700, 0),
(46, 'CT31', '2002-07-25 00:00:00', 'CONTADO', 0.0600, 0),
(47, 'CT34', '2000-07-31 00:00:00', 'APLAZADO', 0.0800, 0),
(48, 'CT18', '2002-08-30 00:00:00', 'CONTADO', 0.0300, 0),
(49, 'CT28', '2002-09-02 00:00:00', 'CONTADO', 0.0300, 0),
(50, 'CT09', '2002-09-05 00:00:00', 'APLAZADO', 0.0800, 0),
(51, 'CT09', '2002-09-05 00:00:00', 'CONTADO', 0.0500, 1),
(63, 'CT28', '2000-09-10 00:00:00', 'CONTADO', 0.0900, 0),
(72, 'CT01', '2002-08-18 00:00:00', 'CONTADO', 0.0500, 1),
(73, 'CT01', '2001-08-02 00:00:00', 'CONTADO', 0.0700, 0),
(74, 'CT01', '2002-09-17 00:00:00', 'APLAZADO', 0.0800, 0),
(75, 'CT01', '2002-09-30 00:00:00', 'TARJETA', 0.1200, 0),
(76, 'CT01', '2002-10-19 00:00:00', 'CONTADO', 0.0400, 1),
(77, 'CT01', '2000-10-28 00:00:00', 'CONTADO', 0.0500, 0),
(79, 'CT34', '2000-12-12 00:00:00', 'CONTADO', 0.0500, 0),
(85, 'CT04', '2002-12-23 00:00:00', 'TARJETA', 0.0400, 0),
(86, 'CT09', '2001-12-24 00:00:00', 'APLAZADO', 0.0300, 0),
(98, 'CT01', '2001-12-27 00:00:00', 'CONTADO', 0.0800, 1),
(102, 'CT06', '2001-01-12 00:00:00', 'CONTADO', 0.0700, 1),
(103, 'CT02', '2001-01-24 00:00:00', 'CONTADO', 0.0400, 0),
(105, 'CT30', '2001-01-01 00:00:00', 'APLAZADO', 0.0900, 0),
(5005, 'CT30', '2002-08-10 00:00:00', 'TARJETA', 0.0000, 1),
(5050, 'CT30', '2002-03-27 00:00:00', 'TARJETA', 0.0000, 1);

-- 
-- Dumping data for table prodped
--
INSERT INTO prodped VALUES
(1, 'AR01', 11.00000),
(1, 'AR04', 10.00000),
(1, 'AR15', 4.00000),
(1, 'AR22', 18.00000),
(3, 'AR02', 20.00000),
(3, 'AR22', 3.00000),
(5, 'AR04', 16.00000),
(7, 'AR06', 16.00000),
(8, 'AR02', 6.00000),
(8, 'AR06', 5.00000),
(8, 'AR07', 6.00000),
(8, 'AR10', 2.00000),
(8, 'AR12', 30.00000),
(8, 'AR15', 15.00000),
(8, 'AR18', 20.00000),
(8, 'AR19', 18.00000),
(8, 'AR25', 5.00000),
(8, 'AR32', 15.00000),
(8, 'AR33', 18.00000),
(8, 'AR34', 5.00000),
(8, 'AR35', 24.00000),
(9, 'AR06', 14.00000),
(11, 'AR08', 1.00000),
(12, 'AR08', 12.00000),
(13, 'AR08', 8.00000),
(16, 'AR10', 17.00000),
(19, 'AR13', 4.00000),
(21, 'AR15', 11.00000),
(22, 'AR17', 6.00000),
(22, 'AR26', 4.00000),
(22, 'AR28', 21.00000),
(25, 'AR19', 12.00000),
(26, 'AR19', 12.00000),
(27, 'AR21', 11.00000),
(28, 'AR21', 22.00000),
(29, 'AR22', 12.00000),
(30, 'AR23', 33.00000),
(31, 'AR24', 31.00000),
(32, 'AR25', 11.00000),
(34, 'AR22', 7.00000),
(34, 'AR27', 3.00000),
(35, 'AR22', 9.00000),
(35, 'AR27', 12.00000),
(37, 'AR27', 11.00000),
(39, 'AR29', 22.00000),
(40, 'AR30', 1.00000),
(42, 'AR31', 21.00000),
(43, 'AR32', 3.00000),
(44, 'AR22', 22.00000),
(45, 'AR36', 21.00000),
(46, 'AR37', 8.00000),
(47, 'AR38', 12.00000),
(48, 'AR38', 13.00000),
(49, 'AR39', 13.00000),
(50, 'AR39', 1.00000);

-- 
-- Enable foreign keys
-- 
/*!40014 SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS */;