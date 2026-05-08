/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.11-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: inventario
-- ------------------------------------------------------
-- Server version	10.11.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auditoria`
--

DROP TABLE IF EXISTS `auditoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `accion` varchar(50) NOT NULL,
  `tabla_afectada` varchar(100) NOT NULL,
  `registro_id` int(11) DEFAULT NULL,
  `datos_anteriores` text DEFAULT NULL,
  `datos_nuevos` text DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `auditoria_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria`
--

LOCK TABLES `auditoria` WRITE;
/*!40000 ALTER TABLE `auditoria` DISABLE KEYS */;
INSERT INTO `auditoria` VALUES
(1,1,'ACTUALIZAR','productos',14,'{\"id\":14,\"codigo\":\"11111\",\"nombre\":\"celular samsung a57\",\"precio\":\"250.00\",\"stock\":210,\"creado_en\":\"2026-04-27T19:58:01.000Z\",\"unidad_medida\":\"UND\",\"proveedor\":\"celulares jca\"}','{\"nombre\":\"prueba\",\"precio\":100,\"stock\":10}','2026-05-04 00:33:19'),
(2,1,'ACTUALIZAR','productos',14,'{\"id\":14,\"codigo\":\"11111\",\"nombre\":\"prueba\",\"precio\":\"100.00\",\"stock\":10,\"creado_en\":\"2026-04-27T19:58:01.000Z\",\"unidad_medida\":null,\"proveedor\":null}','{\"codigo\":\"11111\",\"nombre\":\"prueba\",\"precio\":100,\"unidad_medida\":\"\",\"proveedor\":\"\"}','2026-05-04 00:37:15'),
(3,1,'ACTUALIZAR','productos',14,'{\"id\":14,\"codigo\":\"11111\",\"nombre\":\"prueba\",\"precio\":\"100.00\",\"stock\":10,\"creado_en\":\"2026-04-27T19:58:01.000Z\",\"unidad_medida\":null,\"proveedor\":null}','{\"codigo\":\"11111\",\"nombre\":\"prueba\",\"precio\":\"100\",\"unidad_medida\":\"UND\",\"proveedor\":\"jca\"}','2026-05-04 00:43:25'),
(4,1,'ACTUALIZAR','productos',14,'{\"id\":14,\"codigo\":\"11111\",\"nombre\":\"prueba\",\"precio\":\"100.00\",\"stock\":10,\"creado_en\":\"2026-04-27T19:58:01.000Z\",\"unidad_medida\":\"UND\",\"proveedor\":\"jca\"}','{\"codigo\":\"11111\",\"nombre\":\"prueba\",\"precio\":\"100\",\"unidad_medida\":\"UND\",\"proveedor\":\"jca\"}','2026-05-04 00:43:34'),
(5,1,'ACTUALIZAR','productos',14,'{\"id\":14,\"codigo\":\"11111\",\"nombre\":\"prueba\",\"precio\":\"100.00\",\"stock\":10,\"creado_en\":\"2026-04-27T19:58:01.000Z\",\"unidad_medida\":\"UND\",\"proveedor\":\"jca\"}','{\"codigo\":\"11111\",\"nombre\":\" prueba 11\",\"precio\":100,\"unidad_medida\":\"UND\",\"proveedor\":\"celulares jca\"}','2026-05-04 00:45:42'),
(6,1,'ACTUALIZAR','productos',14,'{\"id\":14,\"codigo\":\"11111\",\"nombre\":\" prueba 11\",\"precio\":\"100.00\",\"stock\":10,\"creado_en\":\"2026-04-27T19:58:01.000Z\",\"unidad_medida\":\"UND\",\"proveedor\":\"celulares jca\"}','{\"codigo\":\"11111\",\"nombre\":\" prueba 12\",\"precio\":100,\"unidad_medida\":\"UND\",\"proveedor\":\"celulares jca\"}','2026-05-04 00:46:17'),
(7,1,'DESACTIVAR','productos',14,'{\"id\":14,\"codigo\":\"11111\",\"nombre\":\" prueba 12\",\"precio\":\"100.00\",\"stock\":10,\"creado_en\":\"2026-04-27T19:58:01.000Z\",\"unidad_medida\":\"UND\",\"proveedor\":\"celulares jca\",\"activo\":1}',NULL,'2026-05-04 01:06:44'),
(8,1,'ACTUALIZAR','productos',15,'{\"id\":15,\"codigo\":\"10001\",\"nombre\":\"Nevera Samsung 260L No Frost\",\"precio\":\"1850000.00\",\"stock\":15,\"creado_en\":\"2026-05-04T19:17:01.000Z\",\"unidad_medida\":\"UND\",\"proveedor\":\"Distribuciones Andina S.A.\",\"activo\":1}','{\"codigo\":\"10001\",\"nombre\":\"Nevera Samsung 260L No Frost\",\"precio\":1900000,\"unidad_medida\":\"UND\",\"proveedor\":\"Distribuciones Andina S.A.\"}','2026-05-05 00:29:11');
/*!40000 ALTER TABLE `auditoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `tipo` enum('natural','juridica') NOT NULL DEFAULT 'natural',
  `identificacion` varchar(50) NOT NULL,
  `direccion` varchar(300) DEFAULT NULL,
  `telefono` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `categoria` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `identificacion` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES
(1,'alejandra contreras','natural','1000125611','calle 59 sur # 75','350874101','alejacon@gmail.com','distribuidor',1,'2026-05-03 23:06:50','2026-05-03 23:06:50'),
(2,'Juan Pérez González','natural','1001234567','Calle 80 #45-23, Bogotá','3101112233','juan.perez@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(3,'María Rodríguez López','natural','1002233445','Carrera 50 #34-12, Medellín','3204455667','maria.rodriguez@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(4,'Carlos Martínez Ruiz','natural','1003344556','Av. 68 #23-45, Cali','3157788990','carlos.martinez@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(5,'Ana García Hernández','natural','1004455667','Calle 26 #12-34, Barranquilla','3001122334','ana.garcia@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(6,'Pedro Sánchez Díaz','natural','1005566778','Carrera 7 #89-10, Cartagena','3145566778','pedro.sanchez@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(7,'Laura Gómez Torres','natural','1006677889','Calle 100 #15-20, Bogotá','3118899001','laura.gomez@email.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(8,'Diego Ramírez Vargas','natural','1007788990','Av. Suba #45-67, Bogotá','3221100223','diego.ramirez@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(9,'Sofía Castro Morales','natural','1008899001','Calle 72 #34-56, Medellín','3342233445','sofia.castro@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(10,'Andrés Ortiz Rojas','natural','1009900112','Carrera 15 #78-90, Cali','3153344556','andres.ortiz@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(11,'Camila Vargas Luna','natural','1010011223','Calle 45 #12-34, Bucaramanga','3106677889','camila.vargas@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(12,'Distribuidora El Sol S.A.S.','juridica','900123456-1','Calle 13 #45-67, Bogotá','6014455667','ventas@distribuidoraelsol.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(13,'Comercial La Estrella Ltda.','juridica','900234567-2','Av. Caracas #23-45, Medellín','6043344556','info@comerciallaestrella.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(14,'Importadora ABC S.A.','juridica','900345678-3','Calle 100 #12-34, Cali','6022233445','importaciones@abc.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(15,'Tecnología Global SAS','juridica','900456789-4','Carrera 7 #56-78, Bogotá','6011122334','ventas@tecnologiaglobal.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(16,'Suministros Industriales Ltda.','juridica','900567890-5','Av. 30 #45-67, Barranquilla','6054455667','suministros@industrial.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(17,'Mega Tiendas del Norte','juridica','900678901-6','Calle 80 #34-56, Cartagena','6053344556','info@megatiendas.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(18,'Almacenes La Mejor S.A.','juridica','900789012-7','Av. Ciudad #12-34, Pereira','6062233445','almacenes@lamejor.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(19,'Comercializadora Andina','juridica','900890123-8','Calle 45 #67-89, Cúcuta','6071122334','andina@comercializadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(20,'Distribuciones Pacífico SAS','juridica','900901234-9','Av. Simón Bolívar #23-45, Buenaventura','6024455667','pacifico@distribuciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(21,'Grupo Empresarial Los Andes','juridica','900012345-0','Carrera 50 #78-90, Bogotá','6013344556','grupo@losandes.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(22,'Fernando Herrera Castillo','natural','1011122334','Calle 34 #56-78, Ibagué','3182233445','fernando.herrera@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(23,'Patricia Muñoz Paredes','natural','1012233445','Carrera 23 #45-67, Santa Marta','3175566778','patricia.munoz@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(24,'Ricardo León Acosta','natural','1013344556','Av. 19 #78-90, Manizales','3168899001','ricardo.leon@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(25,'Gabriela Ríos Quintana','natural','1014455667','Calle 56 #12-34, Villavicencio','3151100223','gabriela.rios@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(26,'Mauricio Pineda Vega','natural','1015566778','Av. 26 #34-56, Pasto','3142233445','mauricio.pineda@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(27,'Ximena Fuentes Blanco','natural','1016677889','Calle 67 #89-10, Montería','3135566778','ximena.fuentes@email.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(28,'Fabián Rojas Soto','natural','1017788990','Carrera 45 #23-45, Neiva','3128899001','fabian.rojas@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(29,'Paola Aguilar Mendoza','natural','1018899001','Av. 7 #56-78, Armenia','3111100223','paola.aguilar@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(30,'Hernán Delgado Campos','natural','1019900112','Calle 90 #34-56, Popayán','3102233445','hernan.delgado@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(31,'Lorena Cárdenas Peña','natural','1020011223','Carrera 12 #78-90, Sincelejo','3195566778','lorena.cardenas@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(32,'Comercial El Buen Precio','juridica','901123456-1','Calle 45 #23-45, Bogotá','6018899001','elbuenprecio@comercial.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(33,'Distribuciones Rápidas SAS','juridica','901234567-2','Av. 68 #12-34, Medellín','6041100223','rapidas@distribuciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(34,'Importadora Los Primos','juridica','901345678-3','Carrera 30 #56-78, Cali','6022233445','primos@importadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(35,'Soluciones Logísticas S.A.','juridica','901456789-4','Av. Boyacá #34-56, Bogotá','6015566778','logistica@soluciones.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(36,'Almacén Todo en Uno','juridica','901567890-5','Calle 100 #78-90, Barranquilla','6058899001','todouno@almacen.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(37,'Comercializadora La 14','juridica','901678901-6','Av. Oriental #23-45, Medellín','6041100223','la14@comercializadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(38,'Grupo Comercial del Sur','juridica','901789012-7','Calle 5 #34-56, Cali','6022233445','sur@grupocomercial.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(39,'Distribuciones Nacionales','juridica','901890123-8','Carrera 7 #67-89, Bogotá','6015566778','nacionales@distribuciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(40,'Importadora Mundial Ltda.','juridica','901901234-9','Av. Las Américas #45-67, Bogotá','6018899001','mundial@importadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(41,'Supertiendas El Ahorro','juridica','901012345-0','Calle 80 #12-34, Medellín','6041100223','ahorro@supertiendas.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(42,'Alejandro Mejía Rincón','natural','1021122334','Calle 23 #45-67, Tunja','3188899001','alejandro.mejia@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(43,'Diana Patricia Núñez','natural','1022233445','Carrera 34 #56-78, Florencia','3171100223','diana.nunez@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(44,'Oscar Villamizar Suárez','natural','1023344556','Av. 45 #78-90, Quibdó','3162233445','oscar.villamizar@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(45,'Marcela Duarte Torres','natural','1024455667','Calle 78 #12-34, Yopal','3155566778','marcela.duarte@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(46,'Jorge Alberto Bermúdez','natural','1025566778','Carrera 56 #34-56, Mocoa','3148899001','jorge.bermudez@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(47,'Verónica Parra Estrada','natural','1026677889','Av. 12 #67-89, Leticia','3131100223','veronica.parra@email.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(48,'Gustavo Adolfo Molina','natural','1027788990','Calle 90 #23-45, San José del Guaviare','3122233445','gustavo.molina@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(49,'Angélica María Osorio','natural','1028899001','Carrera 78 #56-78, Mitú','3115566778','angelica.osorio@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(50,'Ignacio Restrepo Giraldo','natural','1029900112','Av. 34 #12-34, Puerto Inírida','3108899001','ignacio.restrepo@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(51,'Catalina Rueda Santamaría','natural','1030011223','Calle 56 #78-90, San Andrés','3191100223','catalina.rueda@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(52,'Distribuidora El Diamante','juridica','902123456-1','Calle 13 #45-67, Bogotá','6012233445','diamante@distribuidora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(53,'Importaciones del Caribe','juridica','902234567-2','Av. del Río #23-45, Barranquilla','6055566778','caribe@importaciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(54,'Comercial Santa Fe','juridica','902345678-3','Carrera 7 #89-10, Bogotá','6018899001','santafe@comercial.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(55,'Almacenes La Economía','juridica','902456789-4','Av. Oriental #34-56, Medellín','6041100223','economia@almacenes.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(56,'Distribuciones El Valle','juridica','902567890-5','Calle 5 #67-89, Cali','6022233445','valle@distribuciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(57,'Proveedora Industrial S.A.','juridica','902678901-6','Av. 68 #12-34, Bogotá','6015566778','proveedora@industrial.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(58,'Comercializadora Central','juridica','902789012-7','Calle 26 #45-67, Medellín','6048899001','central@comercializadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(59,'Importadora del Norte','juridica','902890123-8','Carrera 15 #78-90, Cúcuta','6071100223','norte@importadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(60,'Almacenes El Triunfo','juridica','902901234-9','Av. Simón Bolívar #34-56, Pereira','6062233445','triunfo@almacenes.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(61,'Grupo Empresarial del Este','juridica','902012345-0','Calle 100 #56-78, Bogotá','6015566778','este@grupoempresarial.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(62,'Esteban Quintero Cifuentes','natural','1031122334','Calle 45 #67-89, Riohacha','3182233445','esteban.quintero@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(63,'Natalia Zambrano Ferrer','natural','1032233445','Carrera 23 #78-90, Valledupar','3175566778','natalia.zambrano@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(64,'Felipe González Ospina','natural','1033344556','Av. 12 #34-56, Arauca','3168899001','felipe.gonzalez@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(65,'Adriana Lucía Botero','natural','1034455667','Calle 67 #12-34, Mocoa','3151100223','adriana.botero@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(66,'Camilo Andrés Pinto','natural','1035566778','Carrera 45 #56-78, Granada','3142233445','camilo.pinto@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(67,'Victoria Eugenia Lozano','natural','1036677889','Av. 78 #89-10, San Vicente','3135566778','victoria.lozano@email.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(68,'Hugo Armando Palacios','natural','1037788990','Calle 90 #23-45, Puerto Carreño','3128899001','hugo.palacios@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(69,'Jimena Trujillo Romero','natural','1038899001','Carrera 34 #45-67, La Dorada','3111100223','jimena.trujillo@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(70,'Eduardo Visbal Martínez','natural','1039900112','Av. 56 #78-90, Cereté','3102233445','eduardo.visbal@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(71,'Liliana Becerra Ardila','natural','1040011223','Calle 12 #34-56, Rionegro','3195566778','liliana.becerra@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(72,'Distribuidora La Perla S.A.S.','juridica','903123456-1','Carrera 7 #23-45, Bogotá','6013344556','perla@distribuidora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(73,'Comercializadora del Pacífico','juridica','903234567-2','Av. Colombia #45-67, Cali','6026677889','pacifico@comercializadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(74,'Importadora Los Andes S.A.','juridica','903345678-3','Calle 72 #12-34, Medellín','6049900112','andes@importadora.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(75,'Almacenes La Sabana','juridica','903456789-4','Av. 19 #56-78, Bogotá','6011122334','sabana@almacenes.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(76,'Distribuciones del Sur Ltda.','juridica','903567890-5','Calle 5 #78-90, Pasto','6024455667','sur@distribuciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(77,'Grupo Comercial El Lago','juridica','903678901-6','Carrera 50 #34-56, Santa Marta','6057788990','lago@grupocomercial.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(78,'Proveedora del Caribe SAS','juridica','903789012-7','Av. del Río #12-34, Barranquilla','6050011223','caribe@proveedora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(79,'Comercializadora La Victoria','juridica','903890123-8','Calle 80 #45-67, Bogotá','6013344556','victoria@comercializadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(80,'Importaciones Unidas S.A.','juridica','903901234-9','Av. 68 #78-90, Medellín','6046677889','unidas@importaciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(81,'Almacenes El Progreso','juridica','903012345-0','Carrera 30 #23-45, Cali','6029900112','progreso@almacenes.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(82,'Sandra Milena Correa','natural','1041122334','Calle 56 #78-90, Manizales','3104455667','sandra.correa@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(83,'Giovanni Rincón Uribe','natural','1042233445','Carrera 12 #34-56, Armenia','3207788990','giovanni.rincon@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(84,'Carolina Ayala Rueda','natural','1043344556','Av. 45 #67-89, Ibagué','3150011223','carolina.ayala@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(85,'Alexander Romero Pérez','natural','1044455667','Calle 23 #12-34, Neiva','3143344556','alexander.romero@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(86,'Mónica Patricia Beltrán','natural','1045566778','Carrera 67 #45-67, Popayán','3136677889','monica.beltran@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(87,'Rodrigo Alonso Durán','natural','1046677889','Av. 89 #78-90, Sincelejo','3129900112','rodrigo.duran@email.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(88,'Paola Andrea Cepeda','natural','1047788990','Calle 34 #56-78, Montería','3111122334','paola.cepeda@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(89,'Julián David Serrano','natural','1048899001','Carrera 78 #23-45, Villavicencio','3104455667','julian.serrano@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(90,'Claudia Marcela Pinzón','natural','1049900112','Av. 12 #34-56, Tunja','3197788990','claudia.pinzon@email.com','interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(91,'Hernando José Perea','natural','1050011223','Calle 90 #67-89, Florencia','3180011223','hernando.perea@email.com','frecuente',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(92,'Yolanda Astrid Vargas','natural','1051122334','Carrera 45 #78-90, Yopal','3173344556','yolanda.vargas@email.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(93,'Comercializadora Premier Ltda.','juridica','904123456-1','Av. Suba #34-56, Bogotá','6016677889','premier@comercializadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(94,'Distribuciones Técnicas S.A.','juridica','904234567-2','Calle 100 #78-90, Medellín','6049900112','tecnicas@distribuciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(95,'Importadora del Oriente','juridica','904345678-3','Carrera 7 #45-67, Bucaramanga','6071122334','oriente@importadora.com','cliente interno',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(96,'Almacenes La Unión SAS','juridica','904456789-4','Av. 19 #23-45, Pereira','6064455667','union@almacenes.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(97,'Grupo Comercial del Norte','juridica','904567890-5','Calle 72 #56-78, Cúcuta','6077788990','norte@grupocomercial.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(98,'Proveedora Nacional Ltda.','juridica','904678901-6','Av. 68 #34-56, Cali','6020011223','nacional@proveedora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(99,'Comercializadora Los Pinos','juridica','904789012-7','Carrera 50 #12-34, Barranquilla','6053344556','pinos@comercializadora.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(100,'Distribuciones Integrales','juridica','904890123-8','Calle 45 #78-90, Cartagena','6056677889','integrales@distribuciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(101,'Importaciones del Llano','juridica','904901234-9','Av. 40 #56-78, Villavicencio','6089900112','llano@importaciones.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19'),
(102,'Almacenes El Dorado S.A.','juridica','904012345-0','Carrera 7 #89-10, Bogotá','6011122334','dorado@almacenes.com','distribuidor',1,'2026-05-04 19:10:19','2026-05-04 19:10:19');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden`
--

DROP TABLE IF EXISTS `detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_orden` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orden_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad_pedida` int(11) NOT NULL,
  `cantidad_recibida` int(11) NOT NULL DEFAULT 0,
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `orden_id` (`orden_id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`orden_id`) REFERENCES `orden_compra` (`id`) ON DELETE CASCADE,
  CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden`
--

LOCK TABLES `detalle_orden` WRITE;
/*!40000 ALTER TABLE `detalle_orden` DISABLE KEYS */;
INSERT INTO `detalle_orden` VALUES
(1,1,14,12,12,250.00),
(2,2,14,23,0,250000.00),
(3,3,14,2,2,250000.00),
(4,4,14,10,10,250000.00),
(5,5,14,15,15,250000.00),
(6,6,14,5,5,250000.00),
(7,7,15,5,5,1900000.00);
/*!40000 ALTER TABLE `detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `entradas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `numero_remision` varchar(100) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `producto_id` (`producto_id`),
  CONSTRAINT `entradas_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entradas`
--

LOCK TABLES `entradas` WRITE;
/*!40000 ALTER TABLE `entradas` DISABLE KEYS */;
INSERT INTO `entradas` VALUES
(1,14,'11111','celular samsung a57','celulares jca',5,250.00,'2026','2026-04-27 19:59:53'),
(2,14,'11111','celular samsung a57','celulares jca',10,250.00,'2027','2026-04-27 20:00:02'),
(3,14,'11111','celular samsung a57','celulares jca',2,250.00,'2028','2026-04-27 20:00:10'),
(4,14,'11111','celular samsung a57','celulares jca',30,250.00,'2029','2026-04-27 20:00:20'),
(5,14,NULL,NULL,'celulares jca',10,250.00,'OC-OC-2026-0001','2026-04-28 19:12:17'),
(6,14,NULL,NULL,'celulares jca',2,250.00,'OC-OC-2026-0001','2026-04-28 19:16:30'),
(7,14,'11111','celular samsung a57','celulares jca',12,250.00,NULL,'2026-05-03 20:47:09'),
(8,14,'11111','celular samsung a57','celulares jca',2,250.00,NULL,'2026-05-03 20:50:40'),
(9,14,'11111','celular samsung a57','celulares jca',2,250.00,NULL,'2026-05-03 20:50:45'),
(10,14,'11111','celular samsung a57','celulares jca',2,250.00,NULL,'2026-05-03 20:51:03'),
(11,14,NULL,NULL,'celulares jca',2,250000.00,'OC-OC-2026-0003','2026-05-03 20:53:07'),
(12,14,'11111','celular samsung a57','celulares jca',5,250.00,NULL,'2026-05-03 21:16:52'),
(13,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:17:08'),
(14,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:17:13'),
(15,14,'11111','celular samsung a57','celulares jca',1,250.00,NULL,'2026-05-03 21:17:22'),
(16,14,'11111','celular samsung a57','celulares jca',3,250.00,NULL,'2026-05-03 21:17:28'),
(17,14,'11111','celular samsung a57','celulares jca',5,250.00,NULL,'2026-05-03 21:17:35'),
(18,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:24:48'),
(19,14,'11111','celular samsung a57','celulares jca',7,250.00,NULL,'2026-05-03 21:25:17'),
(20,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:25:36'),
(21,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:25:37'),
(22,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:25:38'),
(23,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:25:38'),
(24,14,'11111','celular samsung a57','celulares jca',10,250.00,NULL,'2026-05-03 21:25:38'),
(25,14,NULL,NULL,'celulares jca',10,250000.00,'OC-OC-2026-0004','2026-05-03 21:32:27'),
(26,14,NULL,NULL,'celulares jca',5,250000.00,'OC-OC-2026-0005','2026-05-03 21:33:48'),
(27,14,NULL,NULL,'celulares jca',5,250000.00,'OC-OC-2026-0005','2026-05-03 21:34:14'),
(28,14,NULL,NULL,'celulares jca',5,250000.00,'OC-OC-2026-0005','2026-05-03 21:34:16'),
(29,14,NULL,NULL,'celulares jca',5,250000.00,'OC-OC-2026-0006','2026-05-03 21:40:31'),
(30,15,NULL,NULL,'Almacenes El Triunfo SAS',2,1900000.00,'OC-OC-2026-0007','2026-05-05 00:33:19'),
(31,15,NULL,NULL,'Almacenes El Triunfo SAS',3,1900000.00,'OC-OC-2026-0007','2026-05-05 00:33:36');
/*!40000 ALTER TABLE `entradas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_compra`
--

DROP TABLE IF EXISTS `orden_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `orden_compra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(20) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `estado` enum('pendiente','aprobada','recibida_parcial','recibida','cerrada','cancelada') NOT NULL DEFAULT 'pendiente',
  `fecha_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `fecha_aprobacion` datetime DEFAULT NULL,
  `fecha_recepcion` datetime DEFAULT NULL,
  `observaciones` text DEFAULT NULL,
  `total_estimado` decimal(12,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `proveedor_id` (`proveedor_id`),
  KEY `usuario_id` (`usuario_id`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`id`),
  CONSTRAINT `orden_compra_ibfk_2` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_compra`
--

LOCK TABLES `orden_compra` WRITE;
/*!40000 ALTER TABLE `orden_compra` DISABLE KEYS */;
INSERT INTO `orden_compra` VALUES
(1,'OC-2026-0001',1,1,'cerrada','2026-04-28 14:11:01','2026-04-28 14:11:15','2026-04-28 14:16:30',NULL,3000.00),
(2,'OC-2026-0002',1,1,'cancelada','2026-05-03 15:19:23',NULL,NULL,'oferta celulares',5750000.00),
(3,'OC-2026-0003',1,1,'cerrada','2026-05-03 15:20:22','2026-05-03 15:20:25','2026-05-03 15:53:07','sucursal cali',500000.00),
(4,'OC-2026-0004',1,1,'cerrada','2026-05-03 16:08:28','2026-05-03 16:08:32','2026-05-03 16:32:27','sucursal bog',2500000.00),
(5,'OC-2026-0005',1,1,'recibida','2026-05-03 16:33:22','2026-05-03 16:33:28','2026-05-03 16:34:16','colombia',3750000.00),
(6,'OC-2026-0006',1,1,'recibida','2026-05-03 16:40:01','2026-05-03 16:40:04','2026-05-03 16:40:31','bucaramanga',1250000.00),
(7,'OC-2026-0007',78,1,'recibida','2026-05-04 19:32:22','2026-05-04 19:32:35','2026-05-04 19:33:36','sucursal de cali',9500000.00);
/*!40000 ALTER TABLE `orden_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int(11) DEFAULT 0,
  `creado_en` timestamp NULL DEFAULT current_timestamp(),
  `unidad_medida` varchar(20) DEFAULT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  PRIMARY KEY (`id`),
  UNIQUE KEY `codigo` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES
(14,'11111',' prueba 12',100.00,10,'2026-04-27 19:58:01','UND','celulares jca',0),
(15,'10001','Nevera Samsung 260L No Frost',1900000.00,20,'2026-05-04 19:17:01','UND','Distribuciones Andina S.A.',1),
(16,'10002','Lavadora LG 16kg Carga Superior',1450000.00,12,'2026-05-04 19:17:01','UND','Importadora Pacífico Ltda.',1),
(17,'10003','Televisor Sony 55\" 4K UHD Smart',2200000.00,10,'2026-05-04 19:17:01','UND','Tecnología Global SAS',1),
(18,'10004','Microondas Whirlpool 25L',450000.00,20,'2026-05-04 19:17:01','UND','Suministros Industriales',1),
(19,'10005','Licuadora Oster 600W 12 vel.',180000.00,35,'2026-05-04 19:17:01','UND','Comercial La Mejor S.A.',1),
(20,'10006','Plancha a vapor T-fal 2000W',120000.00,40,'2026-05-04 19:17:01','UND','Distribuciones Rápidas SAS',1),
(21,'10007','Cafetera espresso DeLonghi',850000.00,8,'2026-05-04 19:17:01','UND','Importadora ABC Ltda.',1),
(22,'10008','Aspiradora Dyson V8 Animal',1650000.00,6,'2026-05-04 19:17:01','UND','Proveedora Nacional S.A.',1),
(23,'10009','Aire acondicionado LG 12000BTU',1850000.00,9,'2026-05-04 19:17:01','UND','Grupo Comercial Andes',1),
(24,'10010','Estufa gas Haceb 4 puestos',950000.00,14,'2026-05-04 19:17:01','UND','Distribuciones del Sur',1),
(25,'10011','Horno eléctrico Hamilton Beach',320000.00,18,'2026-05-04 19:17:01','UND','Mega Suministros Ltda.',1),
(26,'10012','Lavavajillas Whirlpool 12S',1450000.00,5,'2026-05-04 19:17:01','UND','Importaciones Unidas SAS',1),
(27,'10013','Secadora Samsung 20kg',1650000.00,7,'2026-05-04 19:17:01','UND','Comercializadora Estrella',1),
(28,'10014','Freidora aire Ninja 5.5L',380000.00,22,'2026-05-04 19:17:01','UND','Almacenes La Economía',1),
(29,'10015','Cafetera goteo Black+Decker 12T',150000.00,30,'2026-05-04 19:17:01','UND','Distribuidora El Sol',1),
(30,'10016','Batidora KitchenAid 4.5L',850000.00,8,'2026-05-04 19:17:01','UND','Importadora Mundial Ltda.',1),
(31,'10017','Exprimidor eléctrico Oster',95000.00,45,'2026-05-04 19:17:01','UND','Soluciones Industriales S.A.',1),
(32,'10018','Tostadora eléctrica 4 panes',85000.00,50,'2026-05-04 19:17:01','UND','Comercial El Buen Precio',1),
(33,'10019','Arrocera Oster 1.8L',110000.00,28,'2026-05-04 19:17:01','UND','Distribuciones Técnicas SAS',1),
(34,'10020','Olla presión eléctrica Instant Pot',350000.00,15,'2026-05-04 19:17:01','UND','Grupo Empresarial Norte',1),
(35,'10021','Nevera Haceb 230L Frost',1250000.00,12,'2026-05-04 19:17:01','UND','Proveedora del Caribe',1),
(36,'10022','Lavadora Samsung 19kg Digital',1650000.00,10,'2026-05-04 19:17:01','UND','Importadora Los Primos',1),
(37,'10023','Televisor LG 65\" OLED 4K',4500000.00,5,'2026-05-04 19:17:01','UND','Almacenes La Unión S.A.',1),
(38,'10024','Microondas Samsung 32L Grill',520000.00,16,'2026-05-04 19:17:01','UND','Comercializadora Andina',1),
(39,'10025','Licuadora Nutribullet 900W',280000.00,25,'2026-05-04 19:17:01','UND','Distribuciones Nacionales',1),
(40,'10026','Plancha seca Black+Decker',65000.00,55,'2026-05-04 19:17:01','UND','Suministros del Pacífico',1),
(41,'10027','Cafetera Prensa Francesa 1L',45000.00,70,'2026-05-04 19:17:01','UND','Importadora del Llano',1),
(42,'10028','Aspiradora robot Xiaomi S10',850000.00,9,'2026-05-04 19:17:01','UND','Comercial Santa Fe Ltda.',1),
(43,'10029','Aire acondicionado Samsung 9000BTU',1450000.00,11,'2026-05-04 19:17:01','UND','Distribuidora La Perla',1),
(44,'10030','Estufa inducción 4 puestos',1250000.00,7,'2026-05-04 19:17:01','UND','Grupo Comercial del Sur',1),
(45,'10031','Laptop HP Core i5 12GB 512SSD',2800000.00,18,'2026-05-04 19:17:01','UND','Importaciones del Norte',1),
(46,'10032','Tablet Samsung Galaxy Tab A8',850000.00,20,'2026-05-04 19:17:01','UND','Almacenes El Dorado SAS',1),
(47,'10033','Monitor LG 27\" 4K IPS',1250000.00,12,'2026-05-04 19:17:01','UND','Comercializadora Premier',1),
(48,'10034','Impresora Epson EcoTank L3250',650000.00,15,'2026-05-04 19:17:01','UND','Distribuciones Integrales',1),
(49,'10035','Teclado mecánico Logitech RGB',280000.00,35,'2026-05-04 19:17:01','UND','Proveedora del Valle',1),
(50,'10036','Mouse Logitech MX Master 3S',350000.00,25,'2026-05-04 19:17:01','UND','Importadora Global S.A.',1),
(51,'10037','Audífonos Sony WH-1000XM5',1200000.00,14,'2026-05-04 19:17:01','UND','Comercial La Victoria',1),
(52,'10038','Parlante JBL Charge 5 Bluetooth',480000.00,22,'2026-05-04 19:17:01','UND','Distribuidora El Diamante',1),
(53,'10039','Cámara Canon EOS Rebel T7',1800000.00,8,'2026-05-04 19:17:01','UND','Suministros del Norte',1),
(54,'10040','Disco duro externo Seagate 2TB',280000.00,40,'2026-05-04 19:17:01','UND','Almacenes El Progreso',1),
(55,'10041','Memoria RAM DDR4 16GB Kingston',220000.00,50,'2026-05-04 19:17:01','UND','Importadora del Oriente',1),
(56,'10042','SSD NVMe Samsung 1TB',380000.00,30,'2026-05-04 19:17:01','UND','Comercializadora Central',1),
(57,'10043','Router WiFi 6 TP-Link AX3000',250000.00,25,'2026-05-04 19:17:01','UND','Distribuciones Técnicas Ltda.',1),
(58,'10044','Cámara web Logitech C920 HD',280000.00,20,'2026-05-04 19:17:01','UND','Grupo Empresarial Este',1),
(59,'10045','Base laptop ajustable aluminio',150000.00,40,'2026-05-04 19:17:01','UND','Proveedora Industrial SAS',1),
(60,'10046','Hub USB-C 7 en 1 multipuerto',180000.00,35,'2026-05-04 19:17:01','UND','Importadora del Caribe',1),
(61,'10047','Teclado inalámbrico Apple Magic',550000.00,10,'2026-05-04 19:17:01','UND','Comercial El Triunfo S.A.',1),
(62,'10048','Mouse inalámbrico ergonómico',120000.00,45,'2026-05-04 19:17:01','UND','Almacenes La Sabana',1),
(63,'10049','Audífonos gaming HyperX Cloud II',350000.00,18,'2026-05-04 19:17:01','UND','Distribuciones del Lago',1),
(64,'10050','Micrófono Blue Yeti USB profesional',480000.00,12,'2026-05-04 19:17:01','UND','Suministros Andinos Ltda.',1),
(65,'10051','Celular Samsung Galaxy A54 128GB',1200000.00,22,'2026-05-04 19:17:01','UND','Importadora La Perla SAS',1),
(66,'10052','Celular iPhone 15 128GB',3800000.00,10,'2026-05-04 19:17:01','UND','Comercializadora Los Pinos',1),
(67,'10053','Smartwatch Apple Watch SE 2Gen',1200000.00,15,'2026-05-04 19:17:01','UND','Distribuciones del Pacífico',1),
(68,'10054','Tablet Lenovo Tab P11 128GB',750000.00,12,'2026-05-04 19:17:01','UND','Grupo Comercial El Valle',1),
(69,'10055','Kindle Paperwhite 16GB 2024',650000.00,20,'2026-05-04 19:17:01','UND','Proveedora Nacional S.A.S.',1),
(70,'10056','Cargador rápido Samsung 25W',65000.00,80,'2026-05-04 19:17:01','UND','Importaciones Unidas Ltda.',1),
(71,'10057','Cable USB-C trenzado 2m',25000.00,150,'2026-05-04 19:17:01','UND','Almacenes La Favorita',1),
(72,'10058','Power Bank Xiaomi 20000mAh',120000.00,35,'2026-05-04 19:17:01','UND','Comercializadora del Sur',1),
(73,'10059','Protector pantalla iPhone 15',35000.00,100,'2026-05-04 19:17:01','UND','Distribuidora Nacional Ltda.',1),
(74,'10060','Funda silicona Samsung A54',25000.00,80,'2026-05-04 19:17:01','UND','Suministros del Oriente',1),
(75,'10061','Reloj inteligente Xiaomi Band 8',180000.00,30,'2026-05-04 19:17:01','UND','Importadora del Centro',1),
(76,'10062','Audífonos AirPods Pro 2Gen',1200000.00,15,'2026-05-04 19:17:01','UND','Comercial La Mejor Ltda.',1),
(77,'10063','Parlante HomePod Mini',650000.00,8,'2026-05-04 19:17:01','UND','Distribuciones Rápidas S.A.',1),
(78,'10064','Cargador inalámbrico 15W',85000.00,45,'2026-05-04 19:17:01','UND','Grupo Empresarial Los Llanos',1),
(79,'10065','Soporte celular carro magnético',35000.00,120,'2026-05-04 19:17:01','UND','Proveedora de Occidente',1),
(80,'10066','Cable auxiliar 3.5mm trenzado 1.5m',15000.00,200,'2026-05-04 19:17:01','UND','Importadora del Norte SAS',1),
(81,'10067','Adaptador USB-C a HDMI',65000.00,60,'2026-05-04 19:17:01','UND','Almacenes La Estrella',1),
(82,'10068','Memoria microSD Samsung 128GB',55000.00,90,'2026-05-04 19:17:01','UND','Comercializadora Andina Ltda.',1),
(83,'10069','Lector tarjetas memoria USB 3.0',35000.00,70,'2026-05-04 19:17:01','UND','Distribuciones del Caribe',1),
(84,'10070','Linterna LED recargable táctica',85000.00,50,'2026-05-04 19:17:01','UND','Suministros Nacionales S.A.',1),
(85,'10071','Nevera Whirlpool 300L Side by Side',2500000.00,8,'2026-05-04 19:17:01','UND','Importadora Los Andes',1),
(86,'10072','Lavadora Haceb 14kg Blanca',1200000.00,15,'2026-05-04 19:17:01','UND','Comercial El Dorado Ltda.',1),
(87,'10073','Televisor TCL 50\" 4K Google TV',1350000.00,18,'2026-05-04 19:17:01','UND','Distribuidora La Unión',1),
(88,'10074','Microondas Haceb 28L Digital',380000.00,22,'2026-05-04 19:17:01','UND','Grupo Comercial Central',1),
(89,'10075','Licuadora Imusa 800W 16 vel.',220000.00,30,'2026-05-04 19:17:01','UND','Proveedora del Norte S.A.S.',1),
(90,'10076','Plancha vapor Rowenta 2400W',185000.00,28,'2026-05-04 19:17:01','UND','Importaciones Técnicas Ltda.',1),
(91,'10077','Cafetera Nespresso Inissia',480000.00,14,'2026-05-04 19:17:01','UND','Almacenes El Triunfo SAS',1),
(92,'10078','Aspiradora Karcher WD3 17L',380000.00,12,'2026-05-04 19:17:01','UND','Comercializadora Pacífico',1),
(93,'10079','Aire portátil General Electric',850000.00,6,'2026-05-04 19:17:01','UND','Distribuciones del Centro',1),
(94,'10080','Estufa empotrable gas 4P',850000.00,9,'2026-05-04 19:17:01','UND','Suministros Globales S.A.',1),
(95,'10081','Monitor Dell 24\" FHD IPS',650000.00,15,'2026-05-04 19:17:01','UND','Importadora Premier Ltda.',1),
(96,'10082','Impresora HP LaserJet M110w',450000.00,12,'2026-05-04 19:17:01','UND','Comercial La Sabana S.A.',1),
(97,'10083','Teclado gamer Razer BlackWidow',450000.00,10,'2026-05-04 19:17:01','UND','Distribuidora Nacional SAS',1),
(98,'10084','Mouse gamer Logitech G502 Hero',280000.00,18,'2026-05-04 19:17:01','UND','Grupo Empresarial Pacífico',1),
(99,'10085','Audífonos Bose QC45 ANC',1350000.00,8,'2026-05-04 19:17:01','UND','Proveedora Andina Ltda.',1),
(100,'10086','Parlante Sony SRS-XB100 portátil',180000.00,30,'2026-05-04 19:17:01','UND','Importaciones del Sur S.A.',1),
(101,'10087','Cámara GoPro Hero 12 5.3K',2200000.00,5,'2026-05-04 19:17:01','UND','Almacenes El Progreso Ltda.',1),
(102,'10088','Disco SSD externo Sandisk 1TB',320000.00,25,'2026-05-04 19:17:01','UND','Comercializadora Nacional',1),
(103,'10089','Memoria RAM DDR5 32GB Corsair',580000.00,15,'2026-05-04 19:17:01','UND','Distribuciones Andinas SAS',1),
(104,'10090','Router Mesh WiFi 6E Asus',580000.00,8,'2026-05-04 19:17:01','UND','Suministros del Pacífico S.A.',1),
(105,'10091','Celular Xiaomi Redmi Note 13 Pro',950000.00,20,'2026-05-04 19:17:01','UND','Importadora del Valle Ltda.',1),
(106,'10092','Tablet iPad 10.9\" 64GB WiFi',1800000.00,10,'2026-05-04 19:17:01','UND','Comercial Los Pinos S.A.',1),
(107,'10093','Smartwatch Samsung Galaxy Watch 6',950000.00,12,'2026-05-04 19:17:01','UND','Distribuidora El Diamante SAS',1),
(108,'10094','Audífonos Sony WF-1000XM5 TWS',1100000.00,10,'2026-05-04 19:17:01','UND','Grupo Comercial del Norte',1),
(109,'10095','Cargador rápido 65W GaN USB-C',120000.00,40,'2026-05-04 19:17:01','UND','Proveedora del Oriente S.A.',1),
(110,'10096','Power Bank carga rápida 65W',220000.00,25,'2026-05-04 19:17:01','UND','Importaciones Centrales Ltda.',1),
(111,'10097','Cable Lightning 2m certificado MFi',45000.00,100,'2026-05-04 19:17:01','UND','Almacenes La Victoria SAS',1),
(112,'10098','Soporte monitor brazo articulado',180000.00,20,'2026-05-04 19:17:01','UND','Comercializadora Unida',1),
(113,'10099','Webcam 4K conferencia empresarial',480000.00,8,'2026-05-04 19:17:01','UND','Distribuciones del Llano Ltda.',1),
(114,'10100','Kit limpieza dispositivos electrónicos',35000.00,150,'2026-05-04 19:17:01','UND','Suministros Andinos Ltda.',1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `nit` varchar(50) DEFAULT NULL,
  `contacto` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `nit` (`nit`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES
(1,'celulares jca','90001331-1','342434325','12414124','hilarionsuescamaicolandres@gmail.com','Cl. 170 #20a-08',1,'2026-04-27 14:57:00','2026-04-27 14:57:00'),
(2,'Distribuciones Andina S.A.','800123456-1','Mario López','3101112222','mario@andina.com','Calle 80 #45-23, Bogotá',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(3,'Importadora Pacífico Ltda.','800234567-2','Lucía Martínez','3203334444','lucia@pacifico.com','Av. 68 #34-12, Cali',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(4,'Tecnología Global SAS','800345678-3','Pedro Ramírez','3155556666','pedro@tecnologiaglobal.com','Carrera 50 #23-45, Medellín',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(5,'Suministros Industriales','800456789-4','Ana Torres','3007778888','ana@suministros.com','Calle 26 #56-78, Barranquilla',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(6,'Comercial La Mejor S.A.','800567890-5','Juan Herrera','3149990000','juan@lamejor.com','Av. 30 #12-34, Cartagena',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(7,'Distribuciones Rápidas SAS','800678901-6','Sofía Castro','3112223333','sofia@rapidas.com','Calle 100 #45-67, Bogotá',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(8,'Importadora ABC Ltda.','800789012-7','Carlos Díaz','3224445555','carlos@abc.com','Carrera 15 #78-90, Bucaramanga',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(9,'Proveedora Nacional S.A.','800890123-8','María Rojas','3346667777','maria@nacional.com','Av. Oriental #23-45, Medellín',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(10,'Grupo Comercial Andes','800901234-9','Diego Vásquez','3158889999','diego@andesc.com','Calle 72 #34-56, Cali',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(11,'Distribuciones del Sur','800012345-0','Laura Gil','3100001111','laura@delsur.com','Av. Simón Bolívar #67-89, Pereira',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(12,'Mega Suministros Ltda.','801123456-1','Andrés Mora','3202223333','andres@megasuministros.com','Carrera 7 #12-34, Bogotá',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(13,'Importaciones Unidas SAS','801234567-2','Camila Ruiz','3154445555','camila@unidas.com','Calle 45 #56-78, Cúcuta',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(14,'Comercializadora Estrella','801345678-3','Fabián Gómez','3006667777','fabian@estrella.com','Av. 68 #78-90, Manizales',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(15,'Almacenes La Economía','801456789-4','Paola León','3148889999','paola@laeconomia.com','Carrera 30 #23-45, Santa Marta',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(16,'Distribuidora El Sol','801567890-5','Mauricio Pineda','3110001111','mauricio@elsol.com','Calle 80 #34-56, Villavicencio',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(17,'Importadora Mundial Ltda.','801678901-6','Ximena Fuentes','3222223333','ximena@mundial.com','Av. 19 #45-67, Ibagué',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(18,'Soluciones Industriales S.A.','801789012-7','Ricardo Ayala','3344445555','ricardo@soluciones.com','Carrera 50 #67-89, Pasto',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(19,'Comercial El Buen Precio','801890123-8','Gabriela Ríos','3156667777','gabriela@buenprecio.com','Calle 26 #78-90, Neiva',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(20,'Distribuciones Técnicas SAS','801901234-9','Hernán Delgado','3108889999','hernan@tecnicas.com','Av. 7 #12-34, Popayán',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(21,'Grupo Empresarial Norte','801012345-0','Lorena Cárdenas','3200001111','lorena@norte.com','Carrera 15 #34-56, Montería',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(22,'Proveedora del Caribe','802123456-1','Alejandro Mejía','3152223333','alejandro@caribe.com','Calle 100 #56-78, Sincelejo',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(23,'Importadora Los Primos','802234567-2','Diana Núñez','3004445555','diana@primos.com','Av. 30 #78-90, Armenia',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(24,'Almacenes La Unión S.A.','802345678-3','Oscar Villamizar','3146667777','oscar@launion.com','Carrera 7 #23-45, Riohacha',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(25,'Comercializadora Andina','802456789-4','Marcela Duarte','3118889999','marcela@andinac.com','Calle 45 #45-67, Valledupar',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(26,'Distribuciones Nacionales','802567890-5','Jorge Bermúdez','3220001111','jorge@nacionales.com','Av. Oriental #67-89, Tunja',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(27,'Suministros del Pacífico','802678901-6','Verónica Parra','3342223333','veronica@pacifico.com','Carrera 50 #78-90, Florencia',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(28,'Importadora del Llano','802789012-7','Gustavo Molina','3154445555','gustavo@llano.com','Calle 26 #12-34, Yopal',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(29,'Comercial Santa Fe Ltda.','802890123-8','Angélica Osorio','3106667777','angelica@santafe.com','Av. 68 #34-56, Quibdó',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(30,'Distribuidora La Perla','802901234-9','Ignacio Restrepo','3208889999','ignacio@perla.com','Carrera 7 #56-78, Mocoa',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(31,'Grupo Comercial del Sur','802012345-0','Catalina Rueda','3150001111','catalina@sur.com','Calle 80 #78-90, San Andrés',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(32,'Importaciones del Norte','803123456-1','Esteban Quintero','3002223333','esteban@norte.com','Av. 19 #23-45, Leticia',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(33,'Almacenes El Dorado SAS','803234567-2','Natalia Zambrano','3144445555','natalia@dorado.com','Carrera 30 #45-67, Puerto Inírida',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(34,'Comercializadora Premier','803345678-3','Felipe González','3116667777','felipe@premier.com','Calle 72 #67-89, San José',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(35,'Distribuciones Integrales','803456789-4','Adriana Botero','3228889999','adriana@integrales.com','Av. 45 #78-90, Mitú',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(36,'Proveedora del Valle','803567890-5','Camilo Pinto','3340001111','camilo@valle.com','Carrera 50 #12-34, Arauca',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(37,'Importadora Global S.A.','803678901-6','Victoria Lozano','3152223333','victoria@global.com','Calle 100 #34-56, Granada',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(38,'Comercial La Victoria','803789012-7','Hugo Palacios','3104445555','hugo@victoria.com','Av. 7 #56-78, San Vicente',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(39,'Distribuidora El Diamante','803890123-8','Jimena Trujillo','3206667777','jimena@diamante.com','Carrera 15 #78-90, Cereté',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(40,'Suministros del Norte','803901234-9','Eduardo Visbal','3148889999','eduardo@norte.com','Calle 26 #23-45, Rionegro',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(41,'Almacenes El Progreso','803012345-0','Liliana Becerra','3110001111','liliana@progreso.com','Av. 68 #45-67, La Dorada',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(42,'Importadora del Oriente','804123456-1','Sandra Correa','3222223333','sandra@oriente.com','Carrera 7 #67-89, Puerto Carreño',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(43,'Comercializadora Central','804234567-2','Giovanni Rincón','3344445555','giovanni@central.com','Calle 45 #78-90, Bogotá',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(44,'Distribuciones Técnicas Ltda.','804345678-3','Carolina Ayala','3156667777','carolina@tecnicasltda.com','Av. 30 #12-34, Medellín',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(45,'Grupo Empresarial Este','804456789-4','Alexander Romero','3108889999','alexander@este.com','Carrera 50 #34-56, Cali',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(46,'Proveedora Industrial SAS','804567890-5','Mónica Beltrán','3200001111','monica@industrial.com','Calle 100 #56-78, Barranquilla',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(47,'Importadora del Caribe','804678901-6','Rodrigo Durán','3152223333','rodrigo@caribe.com','Av. Oriental #78-90, Cartagena',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(48,'Comercial El Triunfo S.A.','804789012-7','Paola Cepeda','3004445555','paola@triunfo.com','Carrera 7 #23-45, Bogotá',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(49,'Almacenes La Sabana','804890123-8','Julián Serrano','3146667777','julian@sabana.com','Calle 72 #45-67, Bucaramanga',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(50,'Distribuciones del Lago','804901234-9','Claudia Pinzón','3118889999','claudia@lago.com','Av. 68 #67-89, Pereira',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(51,'Suministros Andinos Ltda.','804012345-0','Hernando Perea','3220001111','hernando@andinos.com','Carrera 30 #78-90, Cúcuta',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(52,'Importadora La Perla SAS','805123456-1','Yolanda Vargas','3342223333','yolanda@perla.com','Calle 45 #12-34, Manizales',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(53,'Comercializadora Los Pinos','805234567-2','Fernando Herrera','3154445555','fernando@pinos.com','Av. 19 #34-56, Ibagué',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(54,'Distribuciones del Pacífico','805345678-3','Patricia Muñoz','3106667777','patricia@pacifico.com','Carrera 50 #56-78, Santa Marta',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(55,'Grupo Comercial El Valle','805456789-4','Ricardo León','3208889999','ricardo@valle.com','Calle 26 #78-90, Villavicencio',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(56,'Proveedora Nacional S.A.S.','805567890-5','Gabriela Ríos','3150001111','gabriela@nacional.com','Av. 7 #23-45, Pasto',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(57,'Importaciones Unidas Ltda.','805678901-6','Mauricio Pineda','3002223333','mauricio@unidasltda.com','Carrera 15 #45-67, Neiva',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(58,'Almacenes La Favorita','805789012-7','Ximena Fuentes','3144445555','ximena@favorita.com','Calle 100 #67-89, Popayán',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(59,'Comercializadora del Sur','805890123-8','Fabián Rojas','3116667777','fabian@surcomercial.com','Av. 30 #78-90, Sincelejo',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(60,'Distribuidora Nacional Ltda.','805901234-9','Paola Aguilar','3228889999','paola@nacionalltda.com','Carrera 7 #12-34, Montería',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(61,'Suministros del Oriente','805012345-0','Hernán Delgado','3340001111','hernan@oriente.com','Calle 45 #34-56, Armenia',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(62,'Importadora del Centro','806123456-1','Lorena Cárdenas','3152223333','lorena@centro.com','Av. Oriental #56-78, Riohacha',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(63,'Comercial La Mejor Ltda.','806234567-2','Alejandro Mejía','3104445555','alejandro@lamejorltda.com','Carrera 50 #78-90, Valledupar',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(64,'Distribuciones Rápidas S.A.','806345678-3','Diana Núñez','3206667777','diana@rapidassa.com','Calle 72 #23-45, Tunja',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(65,'Grupo Empresarial Los Llanos','806456789-4','Oscar Villamizar','3148889999','oscar@llanos.com','Av. 68 #45-67, Florencia',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(66,'Proveedora de Occidente','806567890-5','Marcela Duarte','3110001111','marcela@occidente.com','Carrera 7 #67-89, Yopal',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(67,'Importadora del Norte SAS','806678901-6','Jorge Bermúdez','3222223333','jorge@nortesas.com','Calle 26 #78-90, Quibdó',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(68,'Almacenes La Estrella','806789012-7','Verónica Parra','3344445555','veronica@estrella.com','Av. 30 #12-34, Mocoa',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(69,'Comercializadora Andina Ltda.','806890123-8','Gustavo Molina','3156667777','gustavo@andinaltda.com','Carrera 15 #34-56, San Andrés',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(70,'Distribuciones del Caribe','806901234-9','Angélica Osorio','3108889999','angelica@caribedis.com','Calle 100 #56-78, Leticia',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(71,'Suministros Nacionales S.A.','806012345-0','Ignacio Restrepo','3200001111','ignacio@nacionalessa.com','Av. Oriental #78-90, Puerto Inírida',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(72,'Importadora Los Andes','807123456-1','Catalina Rueda','3152223333','catalina@losandes.com','Carrera 50 #23-45, San José',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(73,'Comercial El Dorado Ltda.','807234567-2','Esteban Quintero','3004445555','esteban@doradoltda.com','Calle 45 #45-67, Mitú',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(74,'Distribuidora La Unión','807345678-3','Natalia Zambrano','3146667777','natalia@launiondis.com','Av. 68 #67-89, Arauca',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(75,'Grupo Comercial Central','807456789-4','Felipe González','3118889999','felipe@centralgp.com','Carrera 7 #78-90, Granada',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(76,'Proveedora del Norte S.A.S.','807567890-5','Adriana Botero','3220001111','adriana@nortesas.com','Calle 72 #12-34, San Vicente',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(77,'Importaciones Técnicas Ltda.','807678901-6','Camilo Pinto','3342223333','camilo@tecnicasltda.com','Av. 30 #34-56, Cereté',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(78,'Almacenes El Triunfo SAS','807789012-7','Victoria Lozano','3154445555','victoria@triunfo.com','Carrera 15 #56-78, Rionegro',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(79,'Comercializadora Pacífico','807890123-8','Hugo Palacios','3106667777','hugo@pacificocomer.com','Calle 26 #78-90, La Dorada',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(80,'Distribuciones del Centro','807901234-9','Jimena Trujillo','3208889999','jimena@centrodis.com','Av. 7 #23-45, Puerto Carreño',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(81,'Suministros Globales S.A.','807012345-0','Eduardo Visbal','3150001111','eduardo@globales.com','Carrera 50 #45-67, Bogotá',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(82,'Importadora Premier Ltda.','808123456-1','Liliana Becerra','3002223333','liliana@premierltda.com','Calle 100 #67-89, Medellín',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(83,'Comercial La Sabana S.A.','808234567-2','Sandra Correa','3144445555','sandra@sabanasa.com','Av. 68 #78-90, Cali',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(84,'Distribuidora Nacional SAS','808345678-3','Giovanni Rincón','3116667777','giovanni@nacionalsas.com','Carrera 7 #12-34, Barranquilla',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(85,'Grupo Empresarial Pacífico','808456789-4','Carolina Ayala','3228889999','carolina@pacificogp.com','Calle 45 #34-56, Cartagena',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(86,'Proveedora Andina Ltda.','808567890-5','Alexander Romero','3340001111','alexander@andinaltda.com','Av. 30 #56-78, Bogotá',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(87,'Importaciones del Sur S.A.','808678901-6','Mónica Beltrán','3152223333','monica@surimport.com','Carrera 50 #78-90, Bucaramanga',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(88,'Almacenes El Progreso Ltda.','808789012-7','Rodrigo Durán','3104445555','rodrigo@progresoltda.com','Calle 72 #23-45, Pereira',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(89,'Comercializadora Nacional','808890123-8','Paola Cepeda','3206667777','paola@nacionalcomer.com','Av. Oriental #45-67, Cúcuta',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(90,'Distribuciones Andinas SAS','808901234-9','Julián Serrano','3148889999','julian@andinasdis.com','Carrera 7 #67-89, Manizales',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(91,'Suministros del Pacífico S.A.','808012345-0','Claudia Pinzón','3110001111','claudia@pacificosum.com','Calle 26 #78-90, Ibagué',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(92,'Importadora del Valle Ltda.','809123456-1','Hernando Perea','3222223333','hernando@valleltda.com','Av. 68 #12-34, Santa Marta',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(93,'Comercial Los Pinos S.A.','809234567-2','Yolanda Vargas','3344445555','yolanda@pinoscom.com','Carrera 15 #34-56, Villavicencio',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(94,'Distribuidora El Diamante SAS','809345678-3','Fernando Herrera','3156667777','fernando@diamantesas.com','Calle 100 #56-78, Pasto',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(95,'Grupo Comercial del Norte','809456789-4','Patricia Muñoz','3108889999','patricia@nortegp.com','Av. 30 #78-90, Neiva',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(96,'Proveedora del Oriente S.A.','809567890-5','Ricardo León','3200001111','ricardo@orientesa.com','Carrera 50 #23-45, Popayán',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(97,'Importaciones Centrales Ltda.','809678901-6','Gabriela Ríos','3152223333','gabriela@centrales.com','Calle 45 #45-67, Sincelejo',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(98,'Almacenes La Victoria SAS','809789012-7','Mauricio Pineda','3004445555','mauricio@victoriasas.com','Av. Oriental #67-89, Montería',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(99,'Comercializadora Unida','809890123-8','Ximena Fuentes','3146667777','ximena@unidacomer.com','Carrera 7 #78-90, Armenia',1,'2026-05-04 14:12:15','2026-05-04 14:12:15'),
(100,'Distribuciones del Llano Ltda.','809901234-9','Fabián Rojas','3118889999','fabian@llanodis.com','Calle 72 #12-34, Riohacha',1,'2026-05-04 14:12:15','2026-05-04 14:12:15');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salidas`
--

DROP TABLE IF EXISTS `salidas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `salidas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `producto_id` int(11) DEFAULT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `proveedor` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `cliente_id` (`cliente_id`),
  CONSTRAINT `salidas_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salidas`
--

LOCK TABLES `salidas` WRITE;
/*!40000 ALTER TABLE `salidas` DISABLE KEYS */;
/*!40000 ALTER TABLE `salidas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `rol` enum('admin','auxiliar') NOT NULL DEFAULT 'auxiliar',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES
(1,'Administrador','admin@sgi.com','$2b$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi','admin',1,'2026-04-10 14:30:42','2026-04-10 14:30:42'),
(2,'alejandra sierra','alejasierra@sgi.com','$2b$10$MEwkhqNJ7nt0oCgHcfHqA.pM9YitEHceV6C8DOu4tHT3o97mWLkFK','auxiliar',1,'2026-04-26 20:42:35','2026-05-03 19:24:47');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-08 15:52:04
