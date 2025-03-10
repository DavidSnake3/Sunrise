CREATE DATABASE  IF NOT EXISTS `sunrise_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `sunrise_db`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sunrise_db
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `amigos`
--

DROP TABLE IF EXISTS `amigos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `amigos` (
  `id_amigo` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`id_amigo`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `amigos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amigos`
--

LOCK TABLES `amigos` WRITE;
/*!40000 ALTER TABLE `amigos` DISABLE KEYS */;
INSERT INTO `amigos` VALUES (50,15,'Carlos Ramírez','Masculino',34,'1990-07-18','Colombia'),(51,16,'David D','Masculino',22,'2003-12-21','Costa Rica'),(52,17,'Ana López','Femenino',29,'1995-06-25','Argentina'),(53,18,'Luis Fernández','Masculino',30,'1993-03-15','México'),(54,19,'Gabriela Torres','Femenino',25,'1998-07-22','España'),(55,20,'Javier Soto','Masculino',28,'1996-09-30','Costa Rica'),(56,21,'Esteban García','Masculino',35,'1989-05-14','Perú');
/*!40000 ALTER TABLE `amigos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barcos`
--

DROP TABLE IF EXISTS `barcos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barcos` (
  `id_barco` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `capacidad_pasajeros` int(11) NOT NULL,
  `capacidad_tripulantes` int(11) NOT NULL,
  `total_habitaciones` int(11) NOT NULL,
  `velocidad_maxima` decimal(5,2) NOT NULL,
  `tonelaje` decimal(10,2) NOT NULL,
  `altura` decimal(5,2) NOT NULL,
  `largo` decimal(5,2) NOT NULL,
  `ancho` decimal(5,2) NOT NULL,
  `año_construccion` year(4) NOT NULL,
  PRIMARY KEY (`id_barco`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcos`
--

LOCK TABLES `barcos` WRITE;
/*!40000 ALTER TABLE `barcos` DISABLE KEYS */;
INSERT INTO `barcos` VALUES (1,'Sunrise Voyager',2500,800,1200,22.50,85000.00,60.00,300.00,40.00,2015),(2,'Ocean Dream',3000,900,1500,23.00,90000.00,65.00,320.00,42.00,2018),(3,'Caribbean Star',2000,700,1000,21.00,75000.00,55.00,280.00,38.00,2016),(4,'Pacific Explorer',2800,850,1300,22.00,88000.00,62.00,310.00,41.00,2017),(5,'Atlantic Majesty',2600,820,1250,21.50,87000.00,61.00,305.00,40.50,2019),(6,'Mediterranean Pearl',2400,780,1100,20.50,82000.00,58.00,290.00,39.00,2014),(7,'Arctic Aurora',2200,750,1050,20.00,80000.00,57.00,285.00,38.50,2013),(8,'Indian Ocean Queen',2700,830,1280,21.80,86000.00,60.50,308.00,40.20,2020),(9,'Baltic Serenity',2300,770,1150,20.80,83000.00,59.00,295.00,39.50,2015),(10,'Red Sea Jewel',2900,880,1400,22.20,89000.00,63.00,315.00,41.50,2018),(11,'Black Sea Legend',2100,720,1080,20.30,81000.00,56.50,288.00,38.80,2014),(12,'Arabian Nights',3100,920,1600,23.50,92000.00,66.00,325.00,43.00,2021),(13,'Coral Princess',2500,800,1200,22.00,85000.00,60.00,300.00,40.00,2016),(14,'Golden Horizon',2400,790,1180,21.20,84000.00,59.50,298.00,39.80,2017),(15,'Sapphire Seas',2600,810,1230,21.70,85500.00,60.20,302.00,40.10,2018);
/*!40000 ALTER TABLE `barcos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complementos`
--

DROP TABLE IF EXISTS `complementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complementos` (
  `id_complemento` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `aplicado_por` enum('camarote','huésped') NOT NULL,
  PRIMARY KEY (`id_complemento`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complementos`
--

LOCK TABLES `complementos` WRITE;
/*!40000 ALTER TABLE `complementos` DISABLE KEYS */;
INSERT INTO `complementos` VALUES (1,'Wi-Fi Premium','Acceso a internet de alta velocidad durante todo el viaje.',50.00,'huésped'),(2,'Paquete de bebidas ilimitadas','Bebidas alcohólicas y no alcohólicas ilimitadas.',200.00,'huésped'),(3,'Excursión en tierra','Tour guiado en uno de los puertos de escala.',100.00,'huésped'),(4,'Spa completo','Acceso ilimitado al spa y tratamientos relajantes.',150.00,'huésped'),(5,'Cena gourmet','Cena de 5 platos en el restaurante exclusivo del barco.',80.00,'huésped'),(6,'Servicio de lavandería','Lavado y planchado de ropa durante el viaje.',30.00,'camarote'),(7,'Decoración especial','Decoración temática para celebraciones en el camarote.',50.00,'camarote'),(8,'Paquete fotográfico','Sesión fotográfica profesional y álbum de recuerdo.',120.00,'huésped'),(9,'Clases de cocina','Clases exclusivas con el chef del barco.',70.00,'huésped'),(10,'Tour VIP','Acceso exclusivo a áreas restringidas del barco.',90.00,'huésped'),(11,'Seguro de viaje','Cobertura médica y de cancelación durante el viaje.',60.00,'huésped'),(12,'Alquiler de toallas','Toallas exclusivas para uso en piscinas y playas.',20.00,'huésped'),(13,'Paquete romántico','Champán, fresas y decoración romántica en el camarote.',100.00,'camarote'),(14,'Clases de buceo','Curso básico de buceo con instructores certificados.',150.00,'huésped'),(15,'Tour cultural','Visita guiada a museos y sitios históricos en puertos.',75.00,'huésped');
/*!40000 ALTER TABLE `complementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cruceros`
--

DROP TABLE IF EXISTS `cruceros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cruceros` (
  `id_crucero` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `cantidad_dias` int(11) NOT NULL,
  `id_barco` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  PRIMARY KEY (`id_crucero`),
  KEY `id_barco` (`id_barco`),
  CONSTRAINT `cruceros_ibfk_1` FOREIGN KEY (`id_barco`) REFERENCES `barcos` (`id_barco`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruceros`
--

LOCK TABLES `cruceros` WRITE;
/*!40000 ALTER TABLE `cruceros` DISABLE KEYS */;
INSERT INTO `cruceros` VALUES (1,'Caribe Dream','caribe_dream.jpg',7,1,3),(2,'South America Explorer','south_america_explorer.jpg',10,2,2),(3,'North Atlantic Adventure','north_atlantic.jpg',8,3,1),(4,'Pacific Paradise','pacific_paradise.jpg',7,4,1),(5,'Mediterranean Escape','mediterranean_escape.jpg',9,5,3);
/*!40000 ALTER TABLE `cruceros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cruceros_complementos`
--

DROP TABLE IF EXISTS `cruceros_complementos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cruceros_complementos` (
  `id_crucero_complemento` int(11) NOT NULL AUTO_INCREMENT,
  `id_crucero` int(11) NOT NULL,
  `id_complemento` int(11) NOT NULL,
  PRIMARY KEY (`id_crucero_complemento`),
  KEY `id_crucero` (`id_crucero`),
  KEY `id_complemento` (`id_complemento`),
  CONSTRAINT `cruceros_complementos_ibfk_1` FOREIGN KEY (`id_crucero`) REFERENCES `cruceros` (`id_crucero`),
  CONSTRAINT `cruceros_complementos_ibfk_2` FOREIGN KEY (`id_complemento`) REFERENCES `complementos` (`id_complemento`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruceros_complementos`
--

LOCK TABLES `cruceros_complementos` WRITE;
/*!40000 ALTER TABLE `cruceros_complementos` DISABLE KEYS */;
INSERT INTO `cruceros_complementos` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(5,2,5),(6,3,6),(7,3,7),(8,4,8),(9,4,9),(10,5,10),(11,5,11);
/*!40000 ALTER TABLE `cruceros_complementos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinos`
--

DROP TABLE IF EXISTS `destinos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinos` (
  `id_destino` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` VALUES (1,'América del Norte','america_norte.jpg'),(2,'América del Sur','america_sur.jpg'),(3,'Caribe','caribe.jpg'),(4,'Oceano','caribe.jpg');
/*!40000 ALTER TABLE `destinos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_habitacion`
--

DROP TABLE IF EXISTS `detalles_habitacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_habitacion` (
  `id_detalle` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_habitacion` bigint(20) unsigned NOT NULL,
  `descripcion_larga` text NOT NULL,
  `metros_cuadrados` decimal(8,2) NOT NULL,
  `cantidad_camas` int(11) NOT NULL,
  `tipo_cama` varchar(255) NOT NULL,
  `amenidades` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`amenidades`)),
  `capacidad_maxima` int(11) NOT NULL,
  `vista_mar` tinyint(1) NOT NULL DEFAULT 0,
  `balcon` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_habitacion`
--

LOCK TABLES `detalles_habitacion` WRITE;
/*!40000 ALTER TABLE `detalles_habitacion` DISABLE KEYS */;
INSERT INTO `detalles_habitacion` VALUES (1,1,'Habitación interior cómoda y acogedora, ideal para viajeros que buscan comodidad a un precio accesible.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(2,2,'Habitación con vista al mar y decoración moderna, perfecta para disfrutar de las vistas del océano.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(3,3,'Suite de lujo con amplio espacio y vistas panorámicas al mar, incluye jacuzzi privado.',45.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\"]',4,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(4,4,'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.',30.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',4,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(5,5,'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(6,6,'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.',25.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(7,7,'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.',60.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(8,8,'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.',20.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(9,9,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(10,10,'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(11,11,'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.',35.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\"]',4,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(12,12,'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(13,13,'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(14,14,'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.',50.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(15,15,'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.',30.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',4,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(16,16,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(17,17,'Habitación interior cómoda y económica, ideal para viajeros que buscan comodidad a un precio accesible.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(18,18,'Habitación con vista al mar y decoración moderna, perfecta para disfrutar de las vistas del océano.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(19,19,'Suite de lujo con amplio espacio y vistas panorámicas al mar, incluye jacuzzi privado.',45.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\"]',4,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(20,20,'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.',30.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',4,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(21,21,'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(22,22,'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.',25.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(23,23,'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.',60.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(24,24,'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.',20.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(25,25,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(26,26,'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(27,27,'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.',35.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\"]',4,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(28,28,'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(29,29,'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(30,30,'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.',50.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(31,31,'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.',30.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',4,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(32,32,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(33,33,'Habitación interior cómoda y económica, ideal para viajeros que buscan comodidad a un precio accesible.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(34,34,'Habitación con vista al mar y decoración moderna, perfecta para disfrutar de las vistas del océano.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(35,35,'Suite de lujo con amplio espacio y vistas panorámicas al mar, incluye jacuzzi privado.',45.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\"]',4,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(36,36,'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.',30.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',4,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(37,37,'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(38,38,'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.',25.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(39,39,'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.',60.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(40,40,'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.',20.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(41,41,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(42,42,'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(43,43,'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.',35.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\"]',4,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(44,44,'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(45,45,'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(46,46,'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.',50.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(47,47,'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.',30.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',4,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(48,48,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(49,49,'Habitación con vista al mar y decoración moderna, perfecta para disfrutar del paisaje oceánico.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(50,50,'Suite de lujo con amplio espacio y comodidades exclusivas, incluye jacuzzi privado.',50.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(51,51,'Habitación familiar con capacidad para 4 personas, ideal para familias que viajan juntas.',30.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',4,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(52,52,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(53,53,'Habitación interior económica, perfecta para viajeros solitarios o parejas que buscan ahorrar.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(54,54,'Habitación con balcón privado y vistas al océano, decoración elegante y moderna.',25.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(55,55,'Suite presidencial con servicios exclusivos, incluye acceso a áreas VIP del barco.',60.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\", \"Servicio de habitaciones\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(56,56,'Habitación con vista al mar y decoración clásica, ideal para una estancia relajante.',20.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(57,57,'Habitación interior estándar, con todas las comodidades necesarias para una estancia confortable.',18.00,2,'Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\"]',2,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(58,58,'Habitación con balcón y vistas al mar, decoración tropical que evoca el espíritu del Caribe.',22.00,2,'King Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Balcón\"]',2,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(59,59,'Suite familiar con espacio amplio y comodidades adicionales, ideal para familias grandes.',35.00,4,'2 Queen Size','[\"TV\", \"Minibar\", \"Aire acondicionado\", \"Jacuzzi\", \"Balcón\"]',4,1,1,'2025-03-07 07:04:15','2025-03-07 07:04:15'),(60,60,'Habitación interior económica, perfecta para viajeros que buscan una opción sencilla y funcional.',15.00,1,'Individual','[\"TV\", \"Aire acondicionado\"]',1,0,0,'2025-03-07 07:04:15','2025-03-07 07:04:15');
/*!40000 ALTER TABLE `detalles_habitacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalles_reserva`
--

DROP TABLE IF EXISTS `detalles_reserva`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_reserva` (
  `id_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) NOT NULL,
  `id_complemento` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_reserva` (`id_reserva`),
  KEY `id_complemento` (`id_complemento`),
  CONSTRAINT `detalles_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  CONSTRAINT `detalles_reserva_ibfk_2` FOREIGN KEY (`id_complemento`) REFERENCES `complementos` (`id_complemento`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_reserva`
--

LOCK TABLES `detalles_reserva` WRITE;
/*!40000 ALTER TABLE `detalles_reserva` DISABLE KEYS */;
INSERT INTO `detalles_reserva` VALUES (1,1,1,1,50.00),(2,1,1,1,200.00),(3,1,1,1,100.00),(4,1,1,1,150.00),(5,1,1,1,80.00),(6,3,6,1,30.00),(7,4,7,1,50.00),(8,4,8,1,120.00),(9,5,9,1,70.00),(10,5,10,1,90.00),(11,6,11,1,60.00),(12,6,12,1,20.00),(13,7,13,1,100.00),(14,7,14,1,150.00),(15,8,15,1,75.00),(16,9,1,1,50.00),(17,9,2,1,200.00),(18,10,3,1,100.00),(19,10,4,1,150.00),(20,11,5,1,80.00),(21,11,6,1,30.00),(22,12,7,1,50.00),(23,12,8,1,120.00),(24,13,9,1,70.00),(25,13,10,1,90.00),(26,14,11,1,60.00),(27,14,12,1,20.00),(28,15,13,1,100.00),(29,15,14,1,150.00);
/*!40000 ALTER TABLE `detalles_reserva` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facturas`
--

DROP TABLE IF EXISTS `facturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facturas` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_reserva` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `impuestos` decimal(10,2) NOT NULL,
  `tarifas` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `subtotal_complementos` decimal(10,2) NOT NULL,
  `subtotal_habitaciones` decimal(10,2) NOT NULL,
  `fecha_limite` date NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (1,1,250.00,25.00,10.00,285.00,0.00,0.00,'0000-00-00'),(2,2,250.00,25.00,10.00,285.00,0.00,0.00,'0000-00-00'),(3,3,110.00,11.00,5.00,126.00,0.00,0.00,'0000-00-00'),(4,4,170.00,17.00,8.00,195.00,0.00,0.00,'0000-00-00'),(5,5,160.00,16.00,7.00,183.00,0.00,0.00,'0000-00-00'),(6,6,80.00,8.00,3.00,91.00,0.00,0.00,'0000-00-00'),(7,7,250.00,25.00,10.00,285.00,0.00,0.00,'0000-00-00'),(8,8,75.00,7.50,3.00,85.50,0.00,0.00,'0000-00-00'),(9,9,200.00,20.00,8.00,228.00,0.00,0.00,'0000-00-00'),(10,10,150.00,15.00,6.00,171.00,0.00,0.00,'0000-00-00'),(11,11,120.00,12.00,5.00,137.00,0.00,0.00,'0000-00-00'),(12,12,90.00,9.00,4.00,103.00,0.00,0.00,'0000-00-00'),(13,13,70.00,7.00,3.00,80.00,0.00,0.00,'0000-00-00'),(14,14,60.00,6.00,2.00,68.00,0.00,0.00,'0000-00-00'),(15,15,100.00,10.00,4.00,114.00,0.00,0.00,'0000-00-00');
/*!40000 ALTER TABLE `facturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas_cruceros`
--

DROP TABLE IF EXISTS `fechas_cruceros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fechas_cruceros` (
  `id_fecha` int(11) NOT NULL AUTO_INCREMENT,
  `id_crucero` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_limite_pago` date NOT NULL,
  PRIMARY KEY (`id_fecha`),
  KEY `id_crucero` (`id_crucero`),
  CONSTRAINT `fechas_cruceros_ibfk_1` FOREIGN KEY (`id_crucero`) REFERENCES `cruceros` (`id_crucero`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas_cruceros`
--

LOCK TABLES `fechas_cruceros` WRITE;
/*!40000 ALTER TABLE `fechas_cruceros` DISABLE KEYS */;
INSERT INTO `fechas_cruceros` VALUES (1,1,'2025-02-01','2025-01-25'),(2,1,'2025-03-20','2025-03-10'),(3,1,'2025-04-10','2025-04-01'),(4,1,'2025-04-25','2025-04-18'),(5,1,'2025-05-15','2025-05-08'),(6,2,'2025-02-05','2025-01-27'),(7,2,'2025-02-20','2025-02-12'),(8,2,'2025-03-10','2025-03-01'),(9,2,'2025-03-28','2025-03-20'),(10,2,'2025-04-12','2025-04-03'),(11,3,'2025-04-14','2025-04-04'),(12,3,'2025-04-29','2025-04-20'),(13,3,'2025-05-18','2025-05-10'),(14,4,'2025-04-15','2025-04-05'),(15,4,'2025-05-01','2025-04-22'),(16,4,'2025-05-22','2025-05-14'),(17,5,'2025-04-15','2025-04-05'),(18,5,'2025-04-28','2025-04-20'),(19,5,'2025-05-10','2025-05-01');
/*!40000 ALTER TABLE `fechas_cruceros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_barco`
--

DROP TABLE IF EXISTS `fotos_barco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos_barco` (
  `Id_fotos_Barco` int(11) NOT NULL AUTO_INCREMENT,
  `Id_barco` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`Id_fotos_Barco`),
  KEY `id_barco` (`Id_barco`),
  CONSTRAINT `fotos_barco_ibfk_1` FOREIGN KEY (`Id_barco`) REFERENCES `barcos` (`id_barco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_barco`
--

LOCK TABLES `fotos_barco` WRITE;
/*!40000 ALTER TABLE `fotos_barco` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_barco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `habitaciones`
--

DROP TABLE IF EXISTS `habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitaciones` (
  `id_habitacion` int(11) NOT NULL AUTO_INCREMENT,
  `id_barco` int(11) NOT NULL,
  `categoria` enum('Interior','Vista al mar','Balcón','Suite') NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `capacidad_min` int(11) NOT NULL,
  `capacidad_max` int(11) NOT NULL,
  `tamaño` decimal(5,2) NOT NULL,
  `cantidad_Disponibles` int(11) NOT NULL,
  PRIMARY KEY (`id_habitacion`),
  KEY `id_barco` (`id_barco`),
  CONSTRAINT `habitaciones_ibfk_1` FOREIGN KEY (`id_barco`) REFERENCES `barcos` (`id_barco`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,1,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(2,1,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(3,1,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(4,1,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(5,2,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,12),(6,2,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,10),(7,2,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,8),(8,2,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,6),(9,3,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,15),(10,3,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,12),(11,3,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,10),(12,3,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,8),(13,4,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(14,4,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(15,4,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(16,4,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(17,5,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(18,5,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(19,5,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(20,5,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(21,6,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(22,6,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(23,6,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(24,6,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(25,7,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(26,7,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(27,7,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(28,7,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(29,8,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(30,8,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(31,8,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(32,8,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(33,9,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(34,9,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(35,9,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(36,9,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(37,10,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(38,10,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(39,10,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(40,10,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(41,11,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(42,11,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(43,11,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(44,11,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(45,12,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(46,12,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(47,12,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(48,12,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(49,13,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(50,13,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(51,13,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(52,13,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(53,14,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(54,14,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(55,14,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(56,14,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4),(57,15,'Interior','Habitación Interior','Habitación cómoda y económica.',1,2,18.00,10),(58,15,'Vista al mar','Habitación Vista al Mar','Habitación con vistas al océano.',1,2,22.00,8),(59,15,'Balcón','Habitación con Balcón','Habitación con balcón privado.',2,4,25.00,6),(60,15,'Suite','Suite de Lujo','Suite espaciosa con jacuzzi.',2,4,45.00,4);
/*!40000 ALTER TABLE `habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `huespedes`
--

DROP TABLE IF EXISTS `huespedes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `huespedes` (
  `Id_huesped` int(11) NOT NULL AUTO_INCREMENT,
  `Id_reserva` int(11) NOT NULL,
  `nombre_completo` varchar(100) NOT NULL,
  `genero` enum('Masculino','Femenino','Otro') NOT NULL,
  `edad` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `nacionalidad` varchar(50) NOT NULL,
  PRIMARY KEY (`Id_huesped`),
  KEY `id_reserva` (`Id_reserva`),
  CONSTRAINT `huespedes_ibfk_1` FOREIGN KEY (`Id_reserva`) REFERENCES `reservas` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huespedes`
--

LOCK TABLES `huespedes` WRITE;
/*!40000 ALTER TABLE `huespedes` DISABLE KEYS */;
INSERT INTO `huespedes` VALUES (1,1,'Juan Pérez','Masculino',35,'1988-05-15','Costa Rica'),(2,1,'María González','Femenino',32,'1991-02-10','España'),(3,2,'Carlos López','Masculino',40,'1983-07-18','México'),(4,2,'Ana Martínez','Femenino',38,'1985-06-25','Argentina'),(5,3,'Pedro Ramírez','Masculino',45,'1978-12-05','Colombia'),(6,3,'Sofía Herrera','Femenino',42,'1981-04-10','Chile'),(7,4,'Luis Torres','Masculino',50,'1973-08-22','Perú'),(8,4,'Laura Díaz','Femenino',48,'1975-11-30','Ecuador'),(9,5,'Jorge Morales','Masculino',55,'1968-03-12','Venezuela'),(10,5,'Carmen Ruiz','Femenino',52,'1971-09-20','Uruguay'),(11,6,'Miguel Ángel Castro','Masculino',60,'1963-01-05','Paraguay'),(12,6,'Isabel Mendoza','Femenino',58,'1965-07-15','Bolivia'),(13,7,'Fernando Gómez','Masculino',65,'1958-10-25','Panamá'),(14,7,'Patricia Silva','Femenino',62,'1961-04-30','El Salvador'),(15,8,'Ricardo Rojas','Masculino',70,'1953-12-20','Honduras');
/*!40000 ALTER TABLE `huespedes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itinerarios`
--

DROP TABLE IF EXISTS `itinerarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itinerarios` (
  `id_itinerario` int(11) NOT NULL AUTO_INCREMENT,
  `id_crucero` int(11) NOT NULL,
  `dia` int(11) NOT NULL,
  `id_puerto` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `hora_llegada` int(25) NOT NULL,
  `hora_salida` int(25) NOT NULL,
  PRIMARY KEY (`id_itinerario`),
  KEY `id_crucero` (`id_crucero`),
  KEY `id_puerto` (`id_puerto`),
  CONSTRAINT `itinerarios_ibfk_1` FOREIGN KEY (`id_crucero`) REFERENCES `cruceros` (`id_crucero`),
  CONSTRAINT `itinerarios_ibfk_2` FOREIGN KEY (`id_puerto`) REFERENCES `puertos` (`id_puerto`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerarios`
--

LOCK TABLES `itinerarios` WRITE;
/*!40000 ALTER TABLE `itinerarios` DISABLE KEYS */;
INSERT INTO `itinerarios` VALUES (1,1,1,1,'Llegada a Orlando (Puerto Cañaveral).',8,18),(2,1,2,2,'Visita a Nassau, Bahamas.',9,17),(3,1,3,3,'Día en Ocean Cay MSC Marine Reserve.',10,16),(4,2,1,13,'Llegada a Buenos Aires, Argentina.',8,18),(5,2,2,14,'Visita a Montevideo, Uruguay.',9,17),(6,2,3,15,'Exploración de Puerto Madryn, Argentina.',10,16),(7,3,1,4,'Llegada a Los Angeles, Estados Unidos.',8,18),(8,3,2,5,'Visita a Cabo San Lucas, México.',9,17),(9,3,3,6,'Día en Mazatlán, México.',10,16),(10,4,1,7,'Llegada a Puerto Vallarta, México.',8,18),(11,4,2,8,'Visita a Catalina Island, Estados Unidos.',9,17),(12,4,3,9,'Día en Ensenada, México.',10,16),(13,5,1,10,'Llegada a Victoria, Canadá.',8,18),(14,5,2,11,'Visita a Vancouver, Canadá.',9,17),(15,5,3,12,'Día en San Cristóbal, Ecuador.',10,16);
/*!40000 ALTER TABLE `itinerarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2025_02_07_045553_create_amigos_table',1),(5,'2025_02_07_045553_create_barcos_table',1),(6,'2025_02_07_045553_create_complementos_table',2),(7,'2025_02_07_045553_create_cruceros_complementos_table',2),(8,'2025_02_07_045553_create_cruceros_table',2),(9,'2025_02_07_045553_create_destinos_table',2),(10,'2025_02_07_045553_create_detalles_reserva_table',2),(11,'2025_02_07_045553_create_facturas_table',2),(12,'2025_02_07_045553_create_fechas_cruceros_table',2),(13,'2025_02_07_045553_create_fotos_barco_table',2),(14,'2025_02_07_045553_create_habitaciones_table',2),(15,'2025_02_07_045553_create_huespedes_table',2),(16,'2025_02_07_045553_create_itinerarios_table',2),(17,'2025_02_07_045553_create_precios_habitaciones_table',2),(18,'2025_02_07_045553_create_puertos_table',2),(19,'2025_02_07_045553_create_reservas_table',2),(20,'2025_02_07_045553_create_usuarios_table',2),(21,'2025_02_07_045555_create_DeleteUser_proc',2),(22,'2025_02_07_045555_create_GetAllComplements_proc',2),(23,'2025_02_07_045555_create_GetAllCruises_proc',2),(24,'2025_02_07_045555_create_GetAllDestinations_proc',2),(25,'2025_02_07_045555_create_GetAllShips_proc',2),(26,'2025_02_07_045555_create_GetAllUsers_proc',2),(27,'2025_02_07_045555_create_GetComplementsByCruiseId_proc',2),(28,'2025_02_07_045555_create_GetCruiseDatesByCruiseId_proc',2),(29,'2025_02_07_045555_create_GetFriendsByUserId_proc',2),(30,'2025_02_07_045555_create_GetGuestsByReservationId_proc',2),(31,'2025_02_07_045555_create_GetInvoicesByReservationId_proc',2),(32,'2025_02_07_045555_create_GetItinerariesByCruiseId_proc',2),(33,'2025_02_07_045555_create_GetPortsByDestinationId_proc',2),(34,'2025_02_07_045555_create_GetReservationDetailsByReservationId_proc',2),(35,'2025_02_07_045555_create_GetReservationsByUserId_proc',2),(36,'2025_02_07_045555_create_GetRoomPricesByDateId_proc',2),(37,'2025_02_07_045555_create_GetRoomsByShipId_proc',2),(38,'2025_02_07_045555_create_GetUserById_proc',2),(39,'2025_02_07_045555_create_InsertComplement_proc',2),(40,'2025_02_07_045555_create_InsertCruiseComplement_proc',2),(41,'2025_02_07_045555_create_InsertCruiseDate_proc',2),(42,'2025_02_07_045555_create_InsertCruise_proc',2),(43,'2025_02_07_045555_create_InsertDestination_proc',2),(44,'2025_02_07_045555_create_InsertFriend_proc',2),(45,'2025_02_07_045555_create_InsertGuest_proc',2),(46,'2025_02_07_045555_create_InsertInvoice_proc',2),(47,'2025_02_07_045555_create_InsertItinerary_proc',2),(48,'2025_02_07_045555_create_InsertPort_proc',2),(49,'2025_02_07_045555_create_InsertReservationDetail_proc',2),(50,'2025_02_07_045555_create_InsertReservation_proc',2),(51,'2025_02_07_045555_create_InsertRoomPrice_proc',2),(52,'2025_02_07_045555_create_InsertRoom_proc',2),(53,'2025_02_07_045555_create_InsertShip_proc',2),(54,'2025_02_07_045555_create_InsertUser_proc',2),(55,'2025_02_07_045555_create_UpdateUser_proc',2),(56,'2025_02_07_045556_add_foreign_keys_to_amigos_table',2),(57,'2025_02_07_045556_add_foreign_keys_to_cruceros_complementos_table',2),(58,'2025_02_07_045556_add_foreign_keys_to_cruceros_table',2),(59,'2025_02_07_045556_add_foreign_keys_to_detalles_reserva_table',2),(60,'2025_02_07_045556_add_foreign_keys_to_facturas_table',2),(61,'2025_02_07_045556_add_foreign_keys_to_fechas_cruceros_table',2),(62,'2025_02_07_045556_add_foreign_keys_to_fotos_barco_table',2),(63,'2025_02_07_045556_add_foreign_keys_to_habitaciones_table',2),(64,'2025_02_07_045556_add_foreign_keys_to_huespedes_table',2),(65,'2025_02_07_045556_add_foreign_keys_to_itinerarios_table',2),(66,'2025_02_07_045556_add_foreign_keys_to_precios_habitaciones_table',2),(67,'2025_02_07_045556_add_foreign_keys_to_puertos_table',2),(68,'2025_02_07_045556_add_foreign_keys_to_reservas_table',2),(69,'2025_02_11_061127_add_remember_token_to_usuarios_table',3);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
INSERT INTO `password_reset_tokens` VALUES ('agargore.io@gmail.com','$2y$12$n0vNvAHEWK3tr3CJDXpqjer22lFMG3LIP41f/zuE7QrvPSz5k8qli','2025-03-09 02:07:46'),('jeherrerasa@gmail.com','$2y$12$BLcaJSV.Ff.IYi8mjKZpqOTwOd/rlfPza2W.FB0IjPY1rsoZhJhwS','2025-02-12 01:32:52');
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios_habitaciones`
--

DROP TABLE IF EXISTS `precios_habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `precios_habitaciones` (
  `id_precio` int(11) NOT NULL AUTO_INCREMENT,
  `id_fecha` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad_disponible` int(11) NOT NULL,
  PRIMARY KEY (`id_precio`),
  KEY `id_fecha` (`id_fecha`),
  KEY `id_habitacion` (`id_habitacion`),
  CONSTRAINT `precios_habitaciones_ibfk_1` FOREIGN KEY (`id_fecha`) REFERENCES `fechas_cruceros` (`id_fecha`),
  CONSTRAINT `precios_habitaciones_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios_habitaciones`
--

LOCK TABLES `precios_habitaciones` WRITE;
/*!40000 ALTER TABLE `precios_habitaciones` DISABLE KEYS */;
INSERT INTO `precios_habitaciones` VALUES (1,1,1,500.00,0),(2,1,2,700.00,0),(3,1,3,900.00,0),(4,1,4,1200.00,0),(5,2,5,550.00,0),(6,2,6,750.00,0),(7,2,7,950.00,0),(8,2,8,1250.00,0),(9,3,9,600.00,0),(10,3,10,800.00,0),(11,3,11,1000.00,0),(12,3,12,1300.00,0),(13,4,13,650.00,0),(14,4,14,850.00,0),(15,4,15,1050.00,0),(16,4,16,1350.00,0),(17,5,17,700.00,0),(18,5,18,900.00,0),(19,5,19,1100.00,0),(20,5,20,1400.00,0);
/*!40000 ALTER TABLE `precios_habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puertos`
--

DROP TABLE IF EXISTS `puertos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puertos` (
  `id_puerto` int(11) NOT NULL AUTO_INCREMENT,
  `id_destino` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `pais` varchar(50) NOT NULL,
  `foto` varchar(255) NOT NULL,
  PRIMARY KEY (`id_puerto`),
  KEY `id_destino` (`id_destino`),
  CONSTRAINT `puertos_ibfk_1` FOREIGN KEY (`id_destino`) REFERENCES `destinos` (`id_destino`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puertos`
--

LOCK TABLES `puertos` WRITE;
/*!40000 ALTER TABLE `puertos` DISABLE KEYS */;
INSERT INTO `puertos` VALUES (1,1,'Orlando (Puerto Cañaveral)','Estados Unidos','orlando.jpg'),(2,1,'Nassau','Bahamas','nassau.jpg'),(3,1,'Ocean Cay MSC Marine Reserve','Bahamas','ocean_cay.jpg'),(4,1,'Los Angeles','Estados Unidos','los_angeles.jpg'),(5,1,'Cabo San Lucas','México','cabo_san_lucas.jpg'),(6,1,'Mazatlan','México','mazatlan.jpg'),(7,1,'Puerto Vallarta','México','puerto_vallarta.jpg'),(8,1,'Catalina Island','Estados Unidos','catalina_island.jpg'),(9,1,'Ensenada','México','ensenada.jpg'),(10,1,'Victoria','Canadá','victoria.jpg'),(11,1,'Vancouver','Canadá','vancouver.jpg'),(12,2,'Buenos Aires','Argentina','buenos_aires.jpg'),(13,2,'Montevideo','Uruguay','montevideo.jpg'),(14,2,'Puerto Madryn','Argentina','puerto_madryn.jpg'),(15,2,'Port Stanley','Islas Malvinas','port_stanley.jpg'),(16,2,'Cape Horn (navegación)','Chile','cape_horn.jpg'),(17,2,'Ushuaia','Argentina','ushuaia.jpg'),(18,2,'Punta Arenas','Chile','punta_arenas.jpg'),(19,2,'Amalia Glaciar (navegación)','Chile','amalia_glaciar.jpg'),(20,2,'Puerto Montt','Chile','puerto_montt.jpg'),(21,2,'San Antonio','Chile','san_antonio.jpg'),(22,2,'Roca Leon Dormido','Ecuador','roca_leon.jpg'),(23,2,'San Cristóbal','Ecuador','san_cristobal.jpg'),(24,2,'Bartolome','Ecuador','bartolome.jpg'),(25,2,'Punta Espinoza, Fernandina','Ecuador','punta_espinoza.jpg'),(26,2,'Punta Vicente Roca, Isabela','Ecuador','punta_vicente.jpg'),(27,2,'Bahia Elizabeth, Isabela','Ecuador','bahia_elizabeth.jpg'),(28,2,'Caleta Tagus','Ecuador','caleta_tagus.jpg'),(29,2,'Punta Cormorant, Floreana','Ecuador','punta_cormorant.jpg'),(30,2,'Islote Campéon, Floreana','Ecuador','islote_campeon.jpg'),(31,2,'Bahia Post Office (Floreana Island)','Galápagos, Ecuador','bahia_post_office.jpg'),(32,2,'Estacion Darwin and Puerto Ayora, Santa Cruz','Ecuador','estacion_darwin.jpg'),(33,2,'Los Gemelos, Santa Cruz','Ecuador','los_gemelos.jpg'),(34,2,'Cerro Dragon, Santa Cruz','Ecuador','cerro_dragon.jpg'),(35,2,'São Paulo (Puerto de Santos)','Brasil','sao_paulo.jpg'),(36,2,'Camboriu','Brasil','camboriu.jpg'),(37,2,'Porto Belo','Brasil','porto_belo.jpg'),(38,2,'Abraao (Ilha Grande Island)','Brasil','abraao.jpg'),(39,2,'Buzios','Brasil','buzios.jpg'),(40,2,'Angra dos Reis','Brasil','angra_reis.jpg'),(41,3,'Miami','Estados Unidos','miami.jpg'),(42,3,'Harvest Cay (Isla privada)','Belice','harvest_cay.jpg'),(43,3,'Isla de Roatán','Honduras','roatan.jpg'),(44,3,'Costa Maya Port (Majahual)','México','costa_maya.jpg'),(45,3,'Cozumel','México','cozumel.jpg'),(46,3,'Puerto Plata','República Dominicana','puerto_plata.jpg'),(47,3,'Charlotte Amalie, St Thomas','Islas Vírgenes de EE. UU.','charlotte_amalie.jpg'),(48,3,'Tortola','Islas Vírgenes Británicas','tortola.jpg'),(49,3,'Great Stirrup Cay (private beach)','Bahamas','great_stirrup.jpg'),(50,3,'Basseterre, St Kitts','San Cristóbal y Nieves','basseterre.jpg'),(51,3,'Cococay','Bahamas','cococay.jpg'),(52,3,'Ocean Cay MSC Marine Reserve','Bahamas','ocean_cay_caribe.jpg'),(53,3,'San Juan','Puerto Rico','san_juan.jpg'),(54,4,'Navegando','Oceano','oceano.jpg');
/*!40000 ALTER TABLE `puertos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_factura`
--

DROP TABLE IF EXISTS `registro_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_factura` (
  `id_registro_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `total` decimal(10,0) NOT NULL,
  `fecha_pago` date NOT NULL,
  `tarjeta` enum('VISA','MASTERCARD') DEFAULT NULL,
  PRIMARY KEY (`id_registro_factura`),
  KEY `fk_factura` (`id_factura`),
  CONSTRAINT `fk_factura` FOREIGN KEY (`id_factura`) REFERENCES `facturas` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_factura`
--

LOCK TABLES `registro_factura` WRITE;
/*!40000 ALTER TABLE `registro_factura` DISABLE KEYS */;
INSERT INTO `registro_factura` VALUES (1,1,100,'0000-00-00','VISA');
/*!40000 ALTER TABLE `registro_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reserva_habitaciones`
--

DROP TABLE IF EXISTS `reserva_habitaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reserva_habitaciones` (
  `id_reserva_habitacion` int(11) NOT NULL,
  `id_reserva` int(11) NOT NULL,
  `id_habitacion` int(11) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`id_reserva_habitacion`),
  KEY `fk_habitacion` (`id_habitacion`),
  KEY `fk_reserva` (`id_reserva`),
  CONSTRAINT `fk_habitacion` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reserva_habitaciones`
--

LOCK TABLES `reserva_habitaciones` WRITE;
/*!40000 ALTER TABLE `reserva_habitaciones` DISABLE KEYS */;
INSERT INTO `reserva_habitaciones` VALUES (1,1,1,400,2),(2,1,2,600,3);
/*!40000 ALTER TABLE `reserva_habitaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id_reserva` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_crucero` int(11) NOT NULL,
  `id_fecha` int(11) NOT NULL,
  `cantidad_huespedes` int(11) NOT NULL,
  `estado` enum('PENDIENTE','PARCIAL','CANCELADO','PAGADO') NOT NULL,
  `fecha_reserva` date NOT NULL,
  `metodo_pago` enum('Pago Unico','Dos Pagos') NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_crucero` (`id_crucero`),
  KEY `id_fecha` (`id_fecha`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_crucero`) REFERENCES `cruceros` (`id_crucero`),
  CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`id_fecha`) REFERENCES `fechas_cruceros` (`id_fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,4,1,1,2,'','2023-09-01','Pago Unico'),(2,6,2,2,2,'PARCIAL','2023-09-02','Pago Unico'),(3,8,3,3,2,'','2023-09-03','Pago Unico'),(4,9,4,4,2,'','2023-09-04','Pago Unico'),(5,10,5,5,2,'','2023-09-05','Pago Unico'),(6,11,1,6,2,'PARCIAL','2023-09-06','Pago Unico'),(7,12,2,7,2,'','2023-09-07','Pago Unico'),(8,13,3,8,2,'','2023-09-08','Pago Unico'),(9,14,4,9,2,'','2023-09-09','Pago Unico'),(10,15,5,10,2,'PARCIAL','2023-09-10','Pago Unico'),(11,16,1,11,2,'','2023-09-11','Pago Unico'),(12,17,2,12,2,'','2023-09-12','Pago Unico'),(13,18,3,13,2,'','2023-09-13','Pago Unico'),(14,19,4,14,2,'PARCIAL','2023-09-14','Pago Unico'),(15,20,5,15,2,'PARCIAL','2023-09-15','Pago Unico');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('0fW17T552Gl0NiS569uzTjIssb3ySe1fTMEFGX2X',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidmZYaWNFV0FGNTNTQ0pFSDZKMVNRMEtwYU1nV2RxMUxxakRPRWZ1bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODEvU1VOUklTRS9iYWNrZW5kL3B1YmxpYy91c3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739316283),('agIAS7bwuxTUcE7JVwnGqBFXr6zYNwKbwy6kTwgv',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoielhjY3lOQVV1aG9jd0VJUEhIM1ZRN3JJcUxXZEk3RlptbjFCUTB0NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9jcnVjZXJvcy9ub3J0aF9hdGxhbnRpYy5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741363509),('bWqP9NPxnvHKE6ag72uGAn1mf9IAkoPASwAmpzrm',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoid2ExSVFDRFc4MkJxcTZORHNxdlhGVnREUHdxRDRMc2RINk5JTWRWMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9jcnVjZXJvcy9tZWRpdGVycmFuZWFuX2VzY2FwZS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741370250),('D0n4DBzzJZrdOAjT2BEX8MFsuT5op3uz7Cozn8qc',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjRRQTU3U0RRY29vUUhtYWtCbHloY283dEtuWEJidTNlMnNYaVhidiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739256943),('dDgsA6XS6L3qUTg8kCNTKbqqgv1xzEreQ8WYYIBt',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXhTQzJHbWxKa2ZzY3BXdFBodEU2Z1RvdmZBa2FSZjBObnVRZW5WciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9jcnVjZXJvcy9tZWRpdGVycmFuZWFuX2VzY2FwZS5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741331241),('eQkPDTPO4Xp086CFiPIXhUkA4dUHIAMF2bOrpTdy',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU1zcXZJTmRvS1dPdExwSG1QRllOd0tQTzVYU2tSNGpUeG8zQ2ZKciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9jYXJpYmUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1741465086),('EXJe8nVjY5v5w1m9XUoaWMjmBSXA9hxKG3m50MDm',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiS2RJVFRzYlNCbXRicjNsNVdXVENNUWRjZ0tEOGhsZ05wblQ1SW1uTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX25vcnRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741377941),('FH54cK1zpll1j2CeBBy8bkKord0S9AAKRyW34fQB',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMldpM3FUbXVaakNBajMwRmlGNkZQT2JFRGQyYmFHcU9Yd3B3akRzSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX3N1ci5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741395542),('fzr9skevG7h253m8NAgiwcOjsPNYlFDkpdELXyUK',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiUkMzTTJmQW5Kcjc5ZFEyeEZ0WXhuZXpDUmdLRHRRVXlBdVlGc0hWZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX25vcnRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741331215),('IoYJfcLTJtT8hf2mpDRXBNXaa0GwX7jBgTanFJKv',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2JNd3AzcFRyRnpCZk94Z0RxYko0elRKNHhaN2xQNzlKTFl0YXhMbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX3N1ci5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741377943),('Ivlq1KdgWnEFZ95xHzRhW8iwTYYUQYjLaTaOqtRa',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYURieHgxTEplYlAwQ2lOUFFzcDNGb25yb1E1QWZtRm5za0N0SkFuNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739665884),('jOqPANZWjsI4VK572S2faWWgxCVMIX7VJUihRtG3',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0FGWGVOMFBzN0V1UzRBeU5lTlZwOEszckg1MGZTZHpacUlnc2VBdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9jcnVjZXJvcy9wYWNpZmljX3BhcmFkaXNlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741363511),('k7IR71Euj5Lhh7F76pBBjKdJkkl18ouiGQ7ZEnAm',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFBwbWFOejkwd0RIZ3h0dENRcllKUlNIR2RnVU90eTlxNW84MUlKMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX25vcnRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741394445),('KSp5vFHz0Z2tDZAhss229ATOXje1exkervJdqyhl',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoibm9JYWVlMVZGVFhFS0FMQzlIdGxqTEpSNXJwVDdQUGwxQjY0VmpuNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9jcnVjZXJvcy9zb3V0aF9hbWVyaWNhX2V4cGxvcmVyLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741363506),('LC5vzGewtvuiJ6usxS92xTG8GRHpU0XQninOeDWb',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoibmxRSHViQTZucjgzYUJBcUZYRUNRdjg1WVNKMlVrT1Q1U2hqZ3dpViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jcnVjZXJvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741462499),('NsFw7ALVrVADTBKDsZPKYeVDZpfqHpZ020lYBl6W',NULL,'127.0.0.1','Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Mobile Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiaTlCWGxCZ1g0djFoRmJiSXNKc1VGWlZnQkhFaGxVTk1MZnNkSjgyQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9jcnVjZXJvcy9jYXJpYmVfZHJlYW0uanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1741363503),('OpyvFYlykLUVd8bNkQoCA2vcic0bstRbWJT7Y3Lr',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTZZU05Cd2FQVUdnbWtlZmdIbjBrOTFRU1BlSEcweVhnelh5TE5kRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739256910),('rUMzSr8l7lWVvpEK8fcLBW2GAYrh7gdgvFsQ6k42',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoibTBNeUVHU0NVTXBlUTJBZGdHY1ZqQVBBVkJWT1Q5d0RxdkdCb2hzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91c3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739316096),('S23IT2aRrkTYTBnpi2DjEta5pKLL1exn2DTt32XI',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkh3eU03ZkF6NFBQMWlmeVd3T0JXSXpCNndnNGNlQmxBQll2bEpGWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91c3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739667493),('tr7nGP5961aBMmznvRwU6Q6wNbJwlHR2TvIWZ4iC',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVVZZUdoZ3FIa01CSzBucUJlQWVrUmwwTHBqVFl2Mjh4RlYzak9wRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9jYXJpYmUuanBnIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==',1741381595),('uMWD58U7N6eWn7FUK4rpIlO225ytv1wSfcnc7zQF',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiM0ZsZlhBck02SzRBSjhsMFlUbWZmZ2VVS3V3MDFyZ1VNaTBJaTBCbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTc6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX25vcnRlLmpwZyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1741464848),('vFol3AQ8oOglwnkKrAskU80BMG77AR5Zhu1c5Jyw',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYjFBMTNTNlZrdFNhdmRKVlFFVVNxbDNZaWk0ZlU2aFBhRUdrOEh4WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX3N1ci5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741331218),('VhrY3rVyPXT7msEyWUrfIKhXZRIeQUgxW9AqbiZU',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiOW5JNGoxNnBNTmE3alN3c0JlSks4bTYxYmpWalJnN2s1YUxzSURSZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX3N1ci5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741394448),('WbKcezbByUt2w15JmrG7CXFeaiCXydWg9hMi5MAg',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTBEWXpIMHNoSzJybzFIakZSVDdwdDRyMzZua2p6T0pSVU83emFCdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jcnVjZXJvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1740865957),('ZwzzFxaH5dtJEo4zGVmVrkNzMjFQ7QTEirW6AuvT',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/134.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMWNzd0F4WnFmMFMzT2tJWXRCc0c2V3pmNjBHc2pDSzNwMFNmR3lGSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9pbWFnZW5lcy9kZXN0aW5vcy9hbWVyaWNhX3N1ci5qcGciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19',1741464850);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  `genero` enum('Masculino','Femenino','Otro') DEFAULT NULL,
  `edad` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `telefono` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'David',0,NULL,NULL,NULL,NULL,NULL,'David@gmail.com','$2y$12$KVo2dEzHte6PoKeyX6wkS.1fmaAhPYO8kmprLORUjTes1hBbrY70m',NULL),(3,'David',0,NULL,NULL,NULL,NULL,NULL,'DavidVillegas@gmail.com','$2y$12$6ZPckiqrBLiTBlA9GMG5du.r6jbvaEG5f5sVOdH3DAxe/fjL3Jeza',NULL),(4,'David Villegas Salas',0,'Masculino',22,'2002-05-11','Costarricense','60605959','DavidVillegasSalas@gmail.com','$2y$12$DAEkd9N7UwCC1cqWLT6rTerI5MH5.8axbuQquCh.HEFquFtEKmS5.',NULL),(5,'David Villegas',1,'Masculino',22,'2002-05-11','Costarricense','60605959','agargore.io@gmail.com','$2y$12$laDv3Fd9mGZOb897WsQyAudIJ885DeHnO5C1imMLOUg9uUWPWHT7u','mmLT1ujFLrnsmpEKzS24ZntgBeyaJlcvX0IGTka8SDfBSkaBrolLucoRKVXI'),(6,'Jeshua Herrera',1,'Masculino',19,'2005-11-14','Costarricense','60606060','jeherrerasa@gmail.com','$2y$12$7LAc.fX686erunFOGEO59uuiae.3De25YEwgLUdOzkzJVDhEg2Sri',NULL),(8,'Nicol',0,'Femenino',21,'2003-04-02','Costarricense','60606060','nicoletmutillosoto03@gmail.com','$2y$12$dM0rvBUYs.cE9335GuciLezscqHIG5LWStpZYjcynhEe0DDtYikvm',NULL),(9,'aaaaaaaaaaaaaa aaaaaaaaaaaaaaaaaaddd',0,'Masculino',22,'2002-11-06','CR','123123123','agargore.io1@gmail.com','$2y$12$Oog7oXR8m3Rv6WThx.4Q6OXmQtVumxjqFtHcmYr5GVMvziw4M5iPy',NULL),(10,'Diana Villegas Murillo',0,'Masculino',22,'2002-11-05','US','1234567','agargore.io2@gmail.com','$2y$12$EpJ2T8ox1LK.zKSP.n6BaeCzEiJeTHtCf3mN92L/lRctsmWIA4i6q',NULL),(11,'Viego Villegas Murillo',0,'Femenino',22,'2002-11-11','CR','666666','agargore.io33@gmail.com','$2y$12$rfoGsQTP2um/hVqzrJtP4uQ8iSi0TbDmbyDmH.0Cd3sGaAWwr7Yam',NULL),(12,'Viego Villegas',0,'Masculino',21,'2003-11-22','ES','123123','agargore.io333@gmail.com','$2y$12$5dhpeesPg8nJS99oHlUBVOlFN0tOfCZ.qnSFyx4JRlyYBU54yrSrC',NULL),(13,'Viego  AAAA',0,'Masculino',19,'2005-11-03','MX','123123123','agargore.io12321@gmail.com','$2y$12$pa6XbK/CHPXsk2/QChMH6O.y/LQR95AV05y2naYFVylmjLM5B/O7i',NULL),(14,'holaaaa',0,'Masculino',21,'2003-12-02','CR','1223333','agargore.io123123@gmail.com','$2y$12$C/ZJI55UycjW7PEwrtH.pOr4fgmmwZ58pdoNR9X5RSzsyiB9KRUn6',NULL),(15,'Juan Pérez',0,'Masculino',35,'1989-05-15','Costa Rica','8888-1234','juan.perez@email.com','hashed_password1',NULL),(16,'María González',0,'Femenino',28,'1996-02-10','España','622-334-567','maria.gonzalez@email.com','hashed_password2',NULL),(17,'Alex Moreno',0,'Otro',31,'1993-08-22','México','55-1122-3344','alex.moreno@email.com','hashed_password3',NULL),(18,'Pedro Ramírez',0,'Masculino',40,'1984-07-18','Colombia','7777-9876','pedro.ramirez@email.com','hashed_password4',NULL),(19,'Ana López',0,'Femenino',29,'1995-06-25','Argentina','6666-5566','ana.lopez@email.com','hashed_password5',NULL),(20,'Sofía Martínez',0,'Femenino',27,'1997-04-10','Chile','5555-1122','sofia.martinez@email.com','hashed_password6',NULL),(21,'Carlos Herrera',0,'Masculino',33,'1991-12-05','Perú','4444-3344','carlos.herrera@email.com','hashed_password7',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-09 17:00:03
