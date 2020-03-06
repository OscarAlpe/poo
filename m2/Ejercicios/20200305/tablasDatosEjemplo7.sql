DROP DATABASE IF EXISTS ejemplo7;
CREATE DATABASE ejemplo7;
-- USE ejemplo7;

CREATE TABLE provincias (
  CodPro varchar(2) NOT NULL,
  NombPro varchar(30) DEFAULT NULL,
  PRIMARY KEY (CodPro)
);

CREATE TABLE localidades (
  CodLoc varchar(5) NOT NULL,
  NombLoc varchar(40) DEFAULT NULL,
  CodPro varchar(2) DEFAULT NULL,
  PRIMARY KEY (CodLoc)
);

CREATE TABLE clientes (
  CodCli int NOT NULL,
  NombCli varchar(50) DEFAULT NULL,
  Direccion varchar(50) DEFAULT NULL,
  CP varchar(5) DEFAULT NULL,
  CodLoc varchar(5) DEFAULT NULL,
  PRIMARY KEY (CodCli)
);


CREATE TABLE errores(
  id SERIAL,
  mensaje varchar(20),
  fecha date,
  hora time,
  PRIMARY KEY (id)
);



/*!40000 ALTER TABLE provincias DISABLE KEYS */;INSERT INTO provincias VALUES
('00', 'Extranjero'),
('01', 'ALAVA'),
('02', 'ALBACETE'),
('03', 'ALICANTE'),
('04', 'ALMERIA'),
('05', 'AVILA'),
('06', 'BADAJOZ'),
('07', 'BALEARES'),
('08', 'BARCELONA'),
('09', 'BURGOS'),
('10', 'CACERES'),
('11', 'CADIZ'),
('12', 'CASTELLON'),
('13', 'CIUDAD REAL'),
('14', 'CORDOBA'),
('15', 'LA CORUÑA'),
('16', 'CUENCA'),
('17', 'GERONA'),
('18', 'GRANADA'),
('19', 'GUADALAJARA'),
('20', 'GUIPUZCOA'),
('21', 'HUELVA'),
('22', 'HUESCA'),
('23', 'JAEN'),
('24', 'LEON'),
('25', 'LERIDA'),
('26', 'LA RIOJA'),
('27', 'LUGO'),
('28', 'MADRID'),
('29', 'MALAGA'),
('30', 'MURCIA'),
('31', 'NAVARRA'),
('32', 'ORENSE'),
('33', 'ASTURIAS'),
('34', 'PALENCIA'),
('35', 'LAS PALMAS'),
('36', 'PONTEVEDRA'),
('37', 'SALAMANCA'),
('38', 'STA CRUZ DE TENERIFE'),
('39', 'CANTABRIA'),
('40', 'SEGOVIA'),
('41', 'SEVILLA'),
('42', 'SORIA'),
('43', 'TARRAGONA'),
('44', 'TERUEL'),
('45', 'TOLEDO'),
('46', 'VALENCIA'),
('47', 'VALLADOLID'),
('48', 'VIZCAYA'),
('49', 'ZAMORA'),
('50', 'ZARAGOZA'),
('51', 'CEUTA'),
('52', 'MELILLA'),
('99', 'ANDORRA');
/*!40000 ALTER TABLE provincias ENABLE KEYS */;

-- 
-- Dumping data for table localidades
--

/*!40000 ALTER TABLE localidades DISABLE KEYS */;INSERT INTO localidades VALUES
('00021', 'AQON DE MONCAYO', '50'),
('01651', 'ALGAR (EL)', '03'),
('01839', 'ALMARCHA (LA)', '16'),
('02050', 'ALTERO DE MOMPOY', '46'),
('02814', 'ARAYA', '12'),
('03061', 'ARENAL (EL)', '07'),
('04033', 'AUZOTXIKIA', '20'),
('05495', 'BASANOVA (LA)', '12'),
('05754', 'BEG', '02'),
('05998', 'BENAMAHOMA', '11'),
('06362', 'BERROCALES DEL JARAMA (LOS)', '28'),
('06571', 'BINIAMAR', '07'),
('06579', 'BINISALEM', '07'),
('06905', 'BONRETORN', '43'),
('07625', 'BUGARRA', '46'),
('07766', 'BURRIANA', '12'),
('07951', 'CAQADA (LA)', '16'),
('08751', 'CALA LLITERAS', '07'),
('08764', 'CALA ROMANA', '43'),
('08820', 'CALATAYUD', '50'),
('08993', 'CALLUS', '08'),
('09248', 'CAMINO DE PARACUELLOS', '28'),
('10917', 'CARNICERA', '33'),
('11024', 'CARRASCA (LA)', '46'),
('11408', 'CASA GRANDE', '44'),
('12060', 'CASILLAS (LAS)', '14'),
('12309', 'CASTELLON', '12'),
('13003', 'CELADA', '24'),
('13541', 'CEUTA (CIUDAD)', '51'),
('13996', 'CIADUEQA', '42'),
('14140', 'CINT (EL)', '08'),
('14637', 'COLOMER CUADRA', '25'),
('15424', 'CORTIJO (EL)', '28'),
('15619', 'COSTA DE LOS PINOS', '07'),
('16745', 'CURRELO (O)', '36'),
('16926', 'DEHESA DE VILLANDRANDO', '34'),
('17791', 'ENCINAS (LAS)', '28'),
('17859', 'ENRAMONA', '12'),
('20267', 'FORMICHE ALTO', '44'),
('20295', 'FORNADEIROS (SAN PEDRO)', '32'),
('20875', 'FUENDEJALON', '50'),
('21104', 'FUENTES DE JILOCA', '50'),
('21355', 'GALILEA', '07'),
('21819', 'GENESTOSA', '24'),
('24263', 'IZANA', '38'),
('25630', 'LENTEJI', '18'),
('26289', 'LLUCALARY', '07'),
('27215', 'MAHAVE', '26'),
('27861', 'MARRATXINET', '07'),
('27948', 'MARTINEZ (LOS)', '04'),
('28023', 'MAS D''EN ROCA', '08'),
('28097', 'MAS DEL SECO', '12'),
('28370', 'MATALUENGA', '24'),
('28623', 'MECO', '28'),
('29149', 'MIQANA', '03'),
('30586', 'MORERA DE MONTSANT (LA)', '43'),
('30996', 'MUGUETA', '31'),
('31195', 'MURUZABAL', '31'),
('31289', 'NARANJEROS (LOS)', '38'),
('31481', 'NAVARREDONDA DE LA RINCONADA', '37'),
('31527', 'NAVASEQUILLA', '05'),
('31982', 'NOVELE', '46'),
('32003', 'NOVILLAS', '50'),
('32093', 'NULES', '12'),
('32101', 'NURTAL-CDA. FARANDOLA', '46'),
('32112', 'OASIS', '35'),
('32419', 'OLMOS (LOS)', '44'),
('32457', 'OMAQAS (LAS)', '24'),
('32550', 'ORBITA', '05'),
('33246', 'PAIPORTA', '46'),
('33534', 'PALOS DE LA FRONTERA', '21'),
('36300', 'PLANASSA (LA)', '08'),
('37953', 'PUEBLA DE SAN MIGUEL', '46'),
('38168', 'PUERTO (EL)', '07'),
('38576', 'QUESADA', '23'),
('39063', 'RAIGUERO (EL)', '03'),
('39486', 'REBON', '15'),
('40066', 'RENTERIA', '20'),
('40332', 'RIAHUELAS', '40'),
('41550', 'ROSAMIANA', '33'),
('42277', 'SALINAS (LAS)', '19'),
('42366', 'SALTO DE TORREJON', '10'),
('42567', 'SAN ANTONIO DE PORMANY', '07'),
('43446', 'SAN SALVADOR', '39'),
('45004', 'SAX', '03'),
('46278', 'SOMOSAGUAS (CENTRO)', '28'),
('46302', 'SON DEL PUERTO', '44'),
('46305', 'SON FERRER', '07'),
('46332', 'SONEJA', '12'),
('46876', 'TABLADA DE VILLADIEGO', '09'),
('47218', 'TARTANEDO', '19'),
('47731', 'TIURANA', '25'),
('47881', 'TOMILLERAS (LAS)', '28'),
('47974', 'TORIL', '44'),
('48037', 'TORO (EL)', '12'),
('48192', 'TORRE-BELTRAN', '12'),
('48367', 'TORREQUINTO', '41'),
('49180', 'TURIS', '46'),
('49866', 'VALDEARENAS', '19'),
('50500', 'VALLS DE TORRUELLA', '08'),
('50646', 'VARA DE REY', '16'),
('53027', 'VILLAMARTIN', '11'),
('53596', 'VILLARREAL', '12'),
('53608', 'VILLARROAQE', '24');
/*!40000 ALTER TABLE localidades ENABLE KEYS */;


/*!40000 ALTER TABLE clientes DISABLE KEYS */;INSERT INTO clientes VALUES
(3, 'DAMBORENEA CORBATO, ALICIA', 'CALLE MADRID, 83', '12425', '17859'),
(6, 'FOLCH CASABO, MARIA MERCEDES', 'SANT RAFAEL, 158-17', '38894', '31289'),
(9, 'FERNANDEZ MARTIN, CRISTINA', 'URBANIZACION LAS PALMAS, 1-5', '08738', '50500'),
(12, 'VIVES GOZALBO, INMACULADA', 'DE BAIX, 123', '50769', '21104'),
(15, 'GUAL SALES, MARIA', 'FELIPE II, 49', '03707', '39063'),
(18, 'MATEU MARTI, MARIA DOLORES', 'CALLE PADRE LUIS MADRE LLOP, 30', '03607', '29149'),
(21, 'BELTRAN MENEU, CRISTINA', 'GABRIEL SOLE, 10-6', '46186', '31982'),
(24, 'SIMO GONZALEZ, NOEMI', 'DOCTOR SANCHIS BERGON, 148', '26707', '27215'),
(27, 'HERRERO BERENGUER, IRENE', 'CALLE SAN ISIDRO, 118', '11334', '53027'),
(30, 'CANCELAS MORA, MARIA', 'PINTOR ZARIQENA, 117-4', '46501', '07625'),
(33, 'MARTI GALVAN, ALICIA', 'EL BARRANQUET, 117', '44144', '11408'),
(36, 'TICHELL MONLLEO, MARIA ANGELES', 'CORAZON DE JESUS, 171', '46426', '33246'),
(39, 'GARCIA MARTI, MONICA', 'AVENIDA CAMPANAR, 171-1', '44163', '46302'),
(42, 'CUBEDO FIBLA, MILAGROS', 'MAESTRO MARTI, 69', '34476', '16926'),
(45, 'GALLEN GOZALBO, PATRICIA', 'CONSTITUCIO, 115-15', '23911', '38576'),
(48, 'LUIS MARIN, MARIA', 'CALLE COSANTA Y BORRAS, 34-11', '16186', '01839'),
(51, 'SABORIT DOMENECH, ELENA', 'FERRANDIS SALVADOR PALMERAS, 124-6', '07101', '15619'),
(54, 'FUENTES VILLALONGA, MARIA', 'MEDITERRANEO, 91', '07521', '38168'),
(57, 'ORENGA CUCO, MARIA PILAR', 'POETA VERDAGUER, 189', '50044', '32003'),
(60, 'MIRALLES OGAYA, ANA', 'GENERAL ARANDA, 95-1', '31955', '31195'),
(63, 'AMO ZAMBRANA, SUSANA', 'PINTOR RIBALTA, 131', '15425', '39486'),
(66, 'VIVES TORRES, LAURA', 'CARMEN, 114', '16860', '07951'),
(69, 'GALLEN HUERTA, OLGA', 'RICARDO CARRERAS, 75', '12094', '48192'),
(72, 'NAVARRO BARBERO, MARIA LLEDO', 'BURRIANA, 19-15', '12406', '48037'),
(75, 'CASTELL VIVES, MARIA', 'CASTELLDEFELS, 102-10', '28192', '15424'),
(78, 'IGLESIAS NAVARRO, IGNACIO', 'ESCULTOR VICIANA, 30-15', '03615', '45004'),
(81, 'DURAN VICENTE, DIEGO', 'PLAZA SANTA ANA, 46', '19793', '49866'),
(84, 'MARTINEZ FORNER, JOSE', 'SAN MARCOS, 176-10', '32364', '20295'),
(87, 'ATIENZA CASADO, RAMON FRANCISCO', 'FALCO, 60-17', '07061', '42567'),
(90, 'RIPOLLES VILLALONGA, JUAN RAUL', 'CALLE DOCTOR FLEMING, 189-18', '28388', '28623'),
(93, 'LOPEZ VICENS, MANUEL VICTOR', 'PLAZA ESCULTOR ADSUARA, 173-5', '50934', '00021'),
(96, 'GARZON CALVO, GABRIEL', 'MAESTRO MARTI, 152-15', '24485', '28370'),
(99, 'CATALA REVERTE, GUILLERMO JOSE', 'ESPERANZA, 198-6', '44335', '32419'),
(102, 'BARRACHINA BUESO, LUIS JORGE', 'CLAPISA, 58', '39137', '43446'),
(105, 'EGEA HERNANDEZ, CARLOS ANTONIO', 'PASAJE PEQAGOLOSA, 108', '37812', '31481'),
(108, 'BLASCO ESCUREDO, CESAR LUIS', 'ALFONDEGUILLA, 127', '44953', '20267'),
(111, 'GARCIA GIRONA, MANUEL', 'BARON DE CARCER, 88-8', '05933', '31527'),
(114, 'VIDAGANY GISBERT, ADOLFO', 'JOVER, 82-3', '33227', '10917'),
(117, 'HERRERO ORENGA, FRANCISCO TEO', 'AVENIDA CAPUCHINOS, 149', '35476', '32112'),
(120, 'CASTELLO DAMBORENEA, ENRIQUE JAVIER', 'GRUPO SAN VICENTE, 138-11', '12257', '46332'),
(123, 'VIDAL VILARROYA, VICENTE', 'CALLE AMALIO GIMENO, 139-1', '04540', '27948'),
(126, 'MORA RUBERT, FRANCISCO', 'VIRGEN DE LOS DOLORES, 128-7', '24228', '21819'),
(129, 'PALANCO MARTINEZ, CARLOS', 'MAESTRO SANCHIS, 28', '19599', '42277'),
(132, 'CUCO NAVARRO, JAVIER SERGIO', 'PALANQUES, 164', '44219', '47974'),
(135, 'SERRANO MUNYOZ, ENRIQUE FERNANDO', 'CORTS VALENCIANES, 128-13', '19130', '47218'),
(138, 'CHINE BARRACHINA, JOSE MANUEL', 'MEDICO NEBOT, 23', '42293', '13996'),
(141, 'LOPEZ DOBON, VICENTE RAMON', 'GASSET, 81-14', '08288', '36300'),
(144, 'SIMO MARTINEZ, RAMON', 'ALIAGA, 118-3', '11745', '05998'),
(147, 'SALES LOPEZ, MIQUEL', 'CARRER TELLOLA, 124', '21560', '33534'),
(150, 'FUENTES RIVERA, JOSE', 'CURA PLEBAN, 25-14', '10674', '42366'),
(153, 'LOPEZ SANMIGUEL, CARLOS', 'URBANIZACION EL BALCO, 142-13', '28241', '06362'),
(156, 'ANDRES GARGALLO, DIEGO JAVIER', 'SANTA CRUZ, 18', '24432', '53608'),
(159, 'EGEA HUEDO, VICENTE CARLOS', 'SAN PASQUAL, 50', '28193', '46278'),
(162, 'REINA VIDAL, LLUIS', 'CALLE BARTOLOME REUS, 11', '24593', '32457'),
(165, 'BUESO ORDOÑEZ, JUAN MANUEL', 'CALLE LA PUNTA, 46', '05359', '32550'),
(168, 'ALOS CONESA, SABINA', 'PINTOR VERGARA, 102-2', '02536', '05754'),
(171, 'RODRIGUEZ HERNANDEZ, CESAR', 'GENERAL MARTINEZ CAMPOS, 119', '07340', '26289'),
(174, 'RODRIGUEZ ALOS, JORDI SABINA', 'EL PLA, 100-8', '12042', '02814'),
(177, 'LLEO GUAITA, MARCOS', 'CAMINO DONACION, 144-3', '07604', '06571'),
(180, 'CABALLERO GALLEGO, ANTONIO', 'CAMINO DE ONDA, 51', '33807', '41550'),
(183, 'CARRETERO PAVIA, FRANCISCO CARLOS', 'PLAZA DE LA FONT, 105', '43163', '06905'),
(186, 'FABUEL CEPRIA, RAFAEL DAVID', 'AVENIDA ESPRONCEDA, 116-15', '50084', '20875'),
(189, 'NEBOT VITAL, SERGIO MOISES', 'LUIS MADRE LLOP, 4-19', '07119', '06579'),
(192, 'CASAS ROMERO, CARLOS JOSE', 'GENERAL ARANDA, 180-3', '43292', '30586'),
(195, 'LLEO SORIANO, JOSE IGNACIO', 'AVENIDA DE LAS CONCHAS, 191', '25057', '47731'),
(198, 'SERRET JOVER, JOSE', 'ENMEDIO, 110', '07339', '08751'),
(201, 'MARIN RAMIREZ, SERGIO VICENTE', 'FERNANDO EL CATOLICO, 6', '07350', '03061'),
(204, 'VERA GOMEZ, VICTOR', 'ORFEBRES SANTALINEA, 124-14', '51965', '13541'),
(207, 'DOMENECH FLORES, RAMON', 'GENERAL MARTINEZ CAMPOS, 172-7', '07541', '46305'),
(210, 'CEPRIA AGOST, FERNANDO LUIS', 'ERMITA, 75', '07284', '21355'),
(213, 'MEDRANO FELIS, FERNANDO', 'SALVADO BARRI, 141', '46454', '49180'),
(216, 'DAMBORENEA VALLS, DIEGO RAFAEL', 'AVENIDA ALMASSORA, 51', '03008', '01651'),
(219, 'CASTELLANOS ANDRES, JULIO', 'CONDE PESTAGUA, 43-4', '08681', '08993'),
(222, 'RAMON LEON, JULIAN', 'BENITANDUS, 183-15', '14197', '12060'),
(225, 'PERIS VIVES, MANUEL', 'LUIS CENDOYA, 124', '09168', '46876'),
(228, 'ROBRES FRANCO, VICENTE IGNACIO', 'VALL DE UXO, 179', '07771', '27861'),
(231, 'BARBERO VALANZUELA, IGNACIO JAIME', 'GENERAL MARTINEZ CAMPOS, 5', '24913', '13003'),
(234, 'FIBLA ROMERO, EMILIO', 'PLAZA SANTA CLARA, 64-8', '28406', '17791'),
(237, 'BURRIEL SANCHEZ, JOSE', 'COS DE GRACIA, 196-10', '28460', '09248'),
(240, 'FERNANDEZ VENDRELL, DAVID JUAN', 'POETA DURAN Y TORTAJADA, 29', '28563', '47881'),
(243, 'ROMERO AGUILELLA, SERGIO', 'SAN ABDON, 15-14', '43748', '08764'),
(246, 'FORTUNYO GRANGEL, JOSE', 'PIEDAD, 148', '08408', '28023'),
(249, 'CUBEDO ANICETO, JAVIER RUBEN', 'ALBUFERA, 43', '08602', '14140'),
(252, 'CEPRIA LORENTE, CARLOS MIGUEL', 'VINAROZ, 137', '12974', '05495'),
(255, 'GALLEN MOLINER, JORGE TEO', 'RIO ESCALONA, 132-3', '16555', '50646'),
(258, 'TORRES PEREZ, ANTONIO', 'MARIA VICTORIA, 117-5', '36848', '16745'),
(261, 'AMO MONTSN, RAMON FERNANDO', 'CALLE BENICARLO, 42', '46332', '32101'),
(264, 'ADELL VILLALONGA, LUIS JOSE', 'MANUEL BECERRA, 61', '12712', '28097'),
(267, 'FONSECA ALMELA, JOSE', 'PLAZA SANT JOAN, 81', '38572', '24263'),
(270, 'MONSONIS SALA, FABRICIANO', 'CARMADAY, 116', '25683', '14637'),
(273, 'GALLEN IZQUIERDO, EMILIO', 'PLAZA BORRULL, 72', '41924', '48367'),
(276, 'GARCMA LIZONDO, CARLOS FRANCISCO', 'BENEDITO, 124-14', '31157', '30996'),
(279, 'SANMIGUEL CORET, FERNANDO JOSE', 'CORDON, 182', '50725', '08820'),
(282, 'MORA RIBES, ENRIQUE MIGUEL', 'CALLE BENASAL, 146-14', '46367', '11024'),
(285, 'BERGES REGODON, JUAN', 'FARIGOLA, 80', '20399', '04033'),
(288, 'BETORET ABRIL, FRANCISCO', 'ALCANAR, 169-11', '20052', '40066'),
(291, 'FABUEL CEBRIA, FERNANDO ADRIAN', 'CALLE CISCAR, 49-20', '18288', '25630'),
(294, 'BELTRAN MUNYOZ, JAIME VICENTE', 'DEL ANGEL, 79-2', '46390', '02050'),
(297, 'NAVARRO GARGALLO, CARLOS', 'PEDRO ALCAZAR, 72-6', '46470', '37953'),
(300, 'RIOS MARTINEZ, LUIS ABEL', 'MEDICO MIGUEL GIMENO, 44', '40742', '40332'),
(303, 'MIRAVET SALA, MARIA MERCEDES', 'URBANIZACION EL BALCO, 84-11', NULL, '53596'),
(306, 'SAMPEDRO SIMO, MARIA MERCEDES', 'FINELLO, 161', '12217', '07766'),
(309, 'GISBERT MIRALLES, BEATRIZ LAURA', 'CALLE ASUNCION FRANCH, 79', '12111', '12309'),
(312, 'DE LA CRUZ AZNAR, CONCHITA PATRICIA', 'GRUPO ZAFER, 55', '12868', '53596'),
(315, 'VILLALONGA SANCHIS, MILAGROS', 'RONDA ESCALANTE, 71-11', NULL, '53596'),
(318, 'PITARCH MONSONIS, MARIA CARMEN', 'SALVADOR, 136', '12708', '12309'),
(321, 'GARCIA CASADO, YOLANDA', 'CONCEPCION ARENAL, 18-14', '12914', '53596'),
(324, 'ADELL GALMES, MERCEDES ROSARIO', 'MAJOR POBLENOV, 18', '12597', '53596'),
(327, 'HERRERA SALA, ANA', 'FOIA DE BUNYOL, 15', '12162', '32093'),
(330, 'MARTI MOLTO, CONCHITA', 'SAN ABDON, 152', NULL, '53596'),
(333, 'SOS CARRETERO, JESUS', 'MOSEN COMPTE, 14', '12964', '53596'),
(336, 'MIGUEL ARCHILES, OSCAR RAMON', 'HISANT BERNARDO MUNDINA, 132-5', '12652', '07766'),
(339, 'CHALER SORIANO, MANUEL DIEGO', 'SAN ROBERTO, 27', NULL, '53596'),
(342, 'PINEL HUERTA, VICENTE', 'FRANCISCO SEMPERE, 37-10', '12112', '07766'),
(345, 'LOPEZ BOTELLA, MAURO', 'AVENIDA DEL PUERTO, 20-1', '12439', '12309'),
(348, 'PALAU MARTINEZ, JORGE', 'RAVAL DE SANT JOSEP, 97-2', '12401', '12309'),
(351, 'RINCON VERNIA, DAVID', 'BORRIOL, 74', NULL, '12309'),
(354, 'MURIA VINAIZA, JOSE', 'CIUDADELA, 90-18', '12990', '12309'),
(357, 'HUGUET PERIS, JUAN ANGEL', 'CALLE MESTRE RODRIGI, 7', '12930', '12309'),
(360, 'FABREGA GARGORI, JAVIER SEBASTIAN', 'SANTA GEMA GALGANI, 130', '12939', '32093'),
(363, 'VILLALONGA RAMIREZ, DIEGO SERGIO', 'CALLE BARTOLOME REUS, 98-7', '12332', '32093'),
(366, 'BADENES CEPRIA, ANDRES RICARDO', 'MAESTRO CABALLEROS, 30-4', '12397', '12309'),
(369, 'BOTELLA CATALA, JUAN', 'MONCADA, 70', '12572', '07766'),
(372, 'LOPEZ LLORENS, SANCHEZ MARCOS', 'CALLE DOLORS, 6', '12967', '53596'),
(375, 'LOPEZ RINCON, LUIS MIGUEL', 'PADRE MELIA, 49', NULL, '07766'),
(378, 'GUIMERA AGOST, LUIS', 'PADRE PEDRO VELASCO, 89', '12423', '53596'),
(381, 'GUILLOT BELDA, FRANCISCO JOSE', 'PLAZA MAYOR, 200', '12059', '12309'),
(384, 'LOPEZ GUITART, XAVIER', 'CALLE PUIG RODA, 162', NULL, '07766'),
(387, 'TUR MARTIN, MANUEL FRANCISCO', 'CALLE PEDRO VIRUELA, 108-8', '12008', '07766'),
(390, 'AZNAR MONFERRER, ADRIAN', 'EBANISANTA HERVAS, 138', NULL, '32093');
/*!40000 ALTER TABLE clientes ENABLE KEYS */;

ALTER TABLE clientes ADD COLUMN edad int DEFAULT 0;
ALTER TABLE provincias ADD COLUMN cantidad int DEFAULT 0;
ALTER TABLE provincias ADD COLUMN iniciales char(1);
ALTER TABLE errores ALTER COLUMN mensaje TYPE varchar(255);

/** 1.- Crear un disparador para que cuando inserte un registro en clientes me compruebe si la
		edad esta entre 18 y 70. En caso de que no esté produzca una excepción con el mensaje
		"La edad no es válida". **/
CREATE OR REPLACE FUNCTION chequea_edad()
RETURNS TRIGGER AS
$$
BEGIN
	IF NEW.edad < 18 OR NEW.edad > 70 THEN
		INSERT INTO errores (mensaje, fecha, hora) VALUES ('La edad no es válida', current_date, current_time);
		RAISE NOTICE 'La edad % no es válida', NEW.edad;
		RETURN OLD;
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER chequeaEdad BEFORE INSERT ON clientes
FOR EACH ROW
	EXECUTE PROCEDURE chequea_edad();

DROP TRIGGER chequeaEdad ON clientes;
DROP FUNCTION chequea_edad;

/** 2.- Además, cada vez que un usuario introduzca un registro con una edad no valida debe
		grabar ese registro en una tabla denominada errores. **/
CREATE OR REPLACE FUNCTION grabar_error()
RETURNS TRIGGER AS
$$
BEGIN
	IF NEW.edad < 18 OR NEW.edad > 70 THEN
		INSERT INTO errores (mensaje, fecha, hora) VALUES ('La edad ' || NEW.edad || ' del codcli ' || NEW.codcli || ' no es válida', current_date, current_time);
		/* No funciona
		devuelve este error: "list index out of range"
		RETURN NULL; */
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER grabarError BEFORE INSERT ON clientes
FOR EACH ROW
	EXECUTE PROCEDURE grabar_error();

DROP TRIGGER grabarError ON clientes;
DROP FUNCTION grabar_error;

CREATE OR REPLACE FUNCTION graba_errores()
RETURNS TRIGGER AS
$$
BEGIN
	IF NEW.edad < 18 OR NEW.edad > 70 THEN
		INSERT INTO errores (mensaje, fecha, hora) VALUES ('La edad no es válida', current_date, current_time);
		RAISE NOTICE 'La edad no es válida';
		/* No funciona. Devuelve este error: "list index out of range" */
		RETURN NULL;
	END IF;
	RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER grabaErrorEdad AFTER INSERT ON clientes
FOR EACH ROW
	EXECUTE PROCEDURE graba_errores();

DROP TRIGGER grabaErrorEdad ON clientes;
DROP FUNCTION graba_errores;