-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: centro_distribucion
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `choferes`: Contiene información de los choferes que realizan las entregas que salen del CD
--

LOCK TABLES `choferes` WRITE;
/*!40000 ALTER TABLE `choferes` DISABLE KEYS */;
INSERT INTO `choferes` VALUES (1,'Carlos','Saucedo'),(2,'Miguel','Palacios'),(3,'Ricardo','Datin'),(4,'Marcelo','Palacios'),(5,'Sebastian','Vignolo'),(6,'Eusebio','Constantino'),(7,'Ricardo','Nuñez'),(8,'Federico','Aguirre'),(9,'Marcelo','Figueroa'),(10,'Marcelo','Palacios'),(11,'Juan Pablo','Borges'),(12,'Ricardo','Nuñez'),(13,'Federico','Aguirre'),(14,'Marcelo','Figueroa'),(15,'Marcelo','Palacios'),(16,'Juan Pablo','Borges'),(17,'Ricardo','Nuñez'),(18,'Federico','Aguirre'),(19,'Marcelo','Figueroa'),(20,'Marcelo','Palacios'),(21,'Juan Pablo','Borges'),(22,'Ricardo','Nuñez'),(23,'Federico','Aguirre'),(24,'Marcelo','Figueroa'),(25,'Marcelo','Palacios'),(26,'Juan Pablo','Borges');
/*!40000 ALTER TABLE `choferes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cliente`: Contiene información de los clientes que compran los productos
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maxiconsumo','compras@maxiconsumo.com.ar','Federico Valverde'),(2,'Carefour San Justo','compras_carefour@carefour.com.ar','Alejandro Gomez'),(3,'Supermercado Luna','sin mail','Kin Youn'),(4,'Carefour Haedo','compras_carefour_haedo@carefour.com.ar','Sebastian Abreu'),(5,'Dia%','compras@dia.com.ar','Walter Samuel');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `codigo_postal`: Contiene los CP del pais. Es donde se vinculará a cada cliente
--

LOCK TABLES `codigo_postal` WRITE;
/*!40000 ALTER TABLE `codigo_postal` DISABLE KEYS */;
INSERT INTO `codigo_postal` VALUES (1,'CABA','Retiro'),(2,'CABA','Balvanera'),(3,'Buenos Aires','General Pacheco'),(4,'Buenos Aires','Moron'),(5,'Cordoba','Salsipuedes'),(6,'Santa Fe','Rosario'),(7,'Jujuy','Humahuaca'),(8,'Corrientes','Chajari');
/*!40000 ALTER TABLE `codigo_postal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `despacho`: Contiene toda la información de los despachos (id venta, chofer, cliente, etc)
--

LOCK TABLES `despacho` WRITE;
/*!40000 ALTER TABLE `despacho` DISABLE KEYS */;
INSERT INTO `despacho` VALUES (1,1,'2022-03-10',1,1),(2,2,'2022-03-15',2,2),(3,3,'2022-04-01',3,3),(4,4,'2022-10-10',4,4),(5,5,'2022-10-10',5,5);
/*!40000 ALTER TABLE `despacho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `factura`: Contiene la información de la facturación de la empresa
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,'1','00000001',21.0000,20000.00,NULL,1),(2,'1','00000002',21.0000,19144.40,NULL,2),(3,'1','00000003',21.0000,150000.79,NULL,3),(4,'1','00000004',10.5000,9999.15,NULL,4),(5,'1','00000005',21.0000,100000.00,NULL,5);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `locacion`: Localidades donde se entregan los pedidos
--

LOCK TABLES `locacion` WRITE;
/*!40000 ALTER TABLE `locacion` DISABLE KEYS */;
INSERT INTO `locacion` VALUES (1,'Av. Juan B Justo 7640',1,1),(2,'Av Crisologo Larralde 860',2,3),(3,'Av Directorio 1131',3,2),(4,'Profesor Pablo Pizzurno 154',4,4),(5,'Miraflores 146',5,5);
/*!40000 ALTER TABLE `locacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_productos`: Tabla de bitácora donde se guardan los productos antes de ser eliminados
--

LOCK TABLES `log_productos` WRITE;
/*!40000 ALTER TABLE `log_productos` DISABLE KEYS */;
INSERT INTO `log_productos` VALUES (7,'2023-01-08 23:54:47','root@localhost'),(8,'2023-01-08 23:54:47','root@localhost'),(9,'2023-01-08 23:54:47','root@localhost'),(10,'2023-01-08 23:54:47','root@localhost'),(11,'2023-01-08 23:54:47','root@localhost'),(12,'2023-01-08 23:54:47','root@localhost'),(13,'2023-01-08 23:54:47','root@localhost'),(14,'2023-01-08 23:54:47','root@localhost'),(15,'2023-01-08 23:54:47','root@localhost'),(16,'2023-01-08 23:54:47','root@localhost'),(17,'2023-01-08 23:57:38','root@localhost'),(18,'2023-01-08 23:57:38','root@localhost'),(19,'2023-01-08 23:57:38','root@localhost'),(20,'2023-01-08 23:57:38','root@localhost'),(21,'2023-01-08 23:57:38','root@localhost'),(22,'2023-01-08 23:57:38','root@localhost'),(23,'2023-01-08 23:57:38','root@localhost'),(24,'2023-01-08 23:57:38','root@localhost'),(25,'2023-01-08 23:57:38','root@localhost'),(26,'2023-01-08 23:57:38','root@localhost'),(27,'2023-01-08 23:58:09','root@localhost'),(28,'2023-01-08 23:58:09','root@localhost'),(29,'2023-01-08 23:58:09','root@localhost'),(30,'2023-01-08 23:58:09','root@localhost'),(31,'2023-01-08 23:58:09','root@localhost'),(32,'2023-01-08 23:58:09','root@localhost'),(33,'2023-01-08 23:58:09','root@localhost'),(34,'2023-01-08 23:58:09','root@localhost'),(35,'2023-01-08 23:58:09','root@localhost'),(36,'2023-01-08 23:58:09','root@localhost'),(37,'2023-01-08 23:58:54','root@localhost'),(38,'2023-01-08 23:58:54','root@localhost'),(39,'2023-01-08 23:58:54','root@localhost'),(40,'2023-01-08 23:58:54','root@localhost'),(41,'2023-01-08 23:58:54','root@localhost'),(42,'2023-01-08 23:58:54','root@localhost'),(43,'2023-01-08 23:58:54','root@localhost'),(44,'2023-01-08 23:58:54','root@localhost'),(45,'2023-01-08 23:58:54','root@localhost'),(46,'2023-01-08 23:58:54','root@localhost');
/*!40000 ALTER TABLE `log_productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `log_ventas`: Tabla de bitácora donde se guarda cada venta realizada
--

LOCK TABLES `log_ventas` WRITE;
/*!40000 ALTER TABLE `log_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pallet`: Tabla que contiene información de lo que contiene cada pallet y donde está ubicado
--

LOCK TABLES `pallet` WRITE;
/*!40000 ALTER TABLE `pallet` DISABLE KEYS */;
INSERT INTO `pallet` VALUES (1,1,1,100),(2,2,2,100),(3,3,3,200),(4,4,4,100),(5,5,5,400);
/*!40000 ALTER TABLE `pallet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `partida`: Tabla que contiene información de la fecha de elaboración y vencimiento de los productos
--

LOCK TABLES `partida` WRITE;
/*!40000 ALTER TABLE `partida` DISABLE KEYS */;
INSERT INTO `partida` VALUES (1,'2022-01-20','2024-01-21'),(2,'2022-03-20','2024-03-21'),(3,'2021-07-31','2024-02-19'),(4,'2022-03-20','2024-03-21'),(5,'2022-06-11','2024-03-21'),(6,'2022-03-20','2024-03-21');
/*!40000 ALTER TABLE `partida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos`: Tabla que contiene información de los productos  comercializados
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'Salsa de tomate'),(2,2,'Arroz integral'),(3,3,'Arvejas en lata'),(4,4,'Azucar pack 1 kg'),(5,5,'Aceite de oliva'),(6,6,'Sal fina pack 1 kg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `productos_old`: Tabla que guarda información de los productos antes de ser modificados
--

LOCK TABLES `productos_old` WRITE;
/*!40000 ALTER TABLE `productos_old` DISABLE KEYS */;
/*!40000 ALTER TABLE `productos_old` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rack`: Tabla que contiene grilla de fila columna, donde se almacenan los pallets
--

LOCK TABLES `rack` WRITE;
/*!40000 ALTER TABLE `rack` DISABLE KEYS */;
INSERT INTO `rack` VALUES (1,'1','1'),(2,'1','2'),(3,'1','3'),(4,'1','4'),(5,'2','1'),(6,'2','2'),(7,'2','3'),(8,'2','4'),(9,'3','1'),(10,'3','2'),(11,'3','3'),(12,'3','4');
/*!40000 ALTER TABLE `rack` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `remito`: Tabla que almacena información de los remitos de salida de cada venta/despacho
--

LOCK TABLES `remito` WRITE;
/*!40000 ALTER TABLE `remito` DISABLE KEYS */;
INSERT INTO `remito` VALUES (1,1,1,'Lisandro de la Torrea 749'),(2,2,3,'Saavedra 785'),(3,3,2,'Lainez 1375'),(4,4,5,'Igualidad 885'),(5,5,4,'Fray Mamerto Esquiu 144');
/*!40000 ALTER TABLE `remito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ventas`: Tabla que registra las ventas. Vincula clientes con productos
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,NULL),(2,2,NULL),(3,3,NULL),(4,5,NULL),(5,4,NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `ventas_productos`: Tabla intermedia con relación many to many
--

LOCK TABLES `ventas_productos` WRITE;
/*!40000 ALTER TABLE `ventas_productos` DISABLE KEYS */;
INSERT INTO `ventas_productos` VALUES (1,1,40),(1,2,100),(3,3,10),(4,4,21);
/*!40000 ALTER TABLE `ventas_productos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-09 23:57:25
