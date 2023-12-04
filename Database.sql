-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: newschema
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `ID_Categoria` int NOT NULL AUTO_INCREMENT,
  `Nombre_Categoria` varchar(255) NOT NULL,
  `Description_Cat` text,
  `Creado_En` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Coleccionables','Los mejores coleccionables de cine,manga y comics!!.','2023-11-27 18:52:23'),(2,'MARVEL','Los mejores comics de la editorial Marvel','2023-11-27 18:52:23'),(3,'DC','Las mejores historias de Batman, Flash, Superman y mas!!','2023-11-27 18:52:23'),(4,'Star wars','Recorre las estrellas junto Luke, Mando y Bobba Fett','2023-11-27 18:52:23'),(5,'Manga','Las mejores historias provenientes de la nacion del sol naciente!','2023-11-27 18:52:23');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_table`
--

DROP TABLE IF EXISTS `product_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_table` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `product_name` varchar(100) NOT NULL,
  `product_price` varchar(50) NOT NULL,
  `product_description` varchar(200) NOT NULL,
  `id_categoria` int NOT NULL,
  `product_stock` int NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_table`
--

LOCK TABLES `product_table` WRITE;
/*!40000 ALTER TABLE `product_table` DISABLE KEYS */;
INSERT INTO `product_table` VALUES (1,'Izuku Midoriya - My Hero Academia','59.499','De My Hero Academia viene un kit de modelo de fácil montaje que no requiere pegamento, pintura o incluso herramientas para montar\nIncluye 38 piezas',5,2),(2,'Stormtrooper (1/12) - Star Wars - Bandai','$59.499','¡Bandai agrega a los luchadores más peligrosos de la galaxia, los Stormtroopers, a su línea de model kit en escala 1/12!',4,1),(3,'Harry Potter Con Hedwig (qposket) - Banpresto','$54.099','Impresionante Estatua de la linea Harry Potter, original de Banpresto. Inspirada en el famoso universo de J.K. Rowling De unos 14cms de alto',1,3),(4,'Evangelion: Edición Deluxe Vol.01','$5000','Manga original de Yoshiyuki Sadamoto',4,6),(5,'Crisis En Tierras Infinitas Edición Deluxe - DC Esenciales','$19200','Formato: Tapa dura | 17x24 cm528 págs.',3,4),(15,'Marvel Must Have Vol.01: Civil War','$12.000','El Universo Marvel está cambiando. Es tiempo de elegir: ¿de qué lado estás?',2,3),(16,'Flashpoint: Absoluto - DC Esenciales','$8.100','Corresponde a Flashpoint #1-5,Flashpoint: Reverse Flash y Flash #0.',3,3),(17,'MY LITTLE MONSTER 01','$6000','¡La chica fría y el chico agresivo saldrán de sus zonas de confort e iniciarán una extraña relación!',5,5),(18,'LA NOCHE MAS OSCURA','$12000','Autor:Geoff Johns - CONTIENE DETALLES EN TAPA Y LOMO QUE BRILLAN EN LA OSCURIDAD!',3,0),(19,'Mysterio - Impresion 3D','15000 ','Altura 30CM',1,3),(20,'Miss Minutes - Impresion 3D','11000','altura 15CM',1,2),(21,'Iron Man - Impresion 3D','13000','Altura 30CM',1,3),(22,'Chainsaw Man Vol.01','6000','• Tomo de aproximadamente 200 páginas.• Formato tankoubon con sobrecubierta.',1,2),(23,'Broly - Impresion 3D','20000','Altura 30cm',1,0);
/*!40000 ALTER TABLE `product_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promociones`
--

DROP TABLE IF EXISTS `promociones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promociones` (
  `ID_Promo` int NOT NULL AUTO_INCREMENT,
  `promo_name` varchar(255) NOT NULL,
  `Discount` decimal(5,2) NOT NULL,
  `Fecha_Inicio` date NOT NULL,
  `Fecha_Final` date NOT NULL,
  PRIMARY KEY (`ID_Promo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promociones`
--

LOCK TABLES `promociones` WRITE;
/*!40000 ALTER TABLE `promociones` DISABLE KEYS */;
INSERT INTO `promociones` VALUES (1,'Descuento Navidad',0.50,'2023-11-27','2024-01-15'),(2,'Oferta Inicio de Año',0.10,'2023-11-27','2023-12-20'),(3,'Envío Gratis',0.05,'2023-11-27','2024-01-15');
/*!40000 ALTER TABLE `promociones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-04 16:27:17
