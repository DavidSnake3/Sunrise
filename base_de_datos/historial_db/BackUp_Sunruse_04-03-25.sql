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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barcos`
--

LOCK TABLES `barcos` WRITE;
/*!40000 ALTER TABLE `barcos` DISABLE KEYS */;
INSERT INTO `barcos` VALUES (1,'Oceanic Dream',2000,800,900,35.50,75000.00,55.40,290.50,36.20,2015),(2,'Caribbean Star',2500,900,1100,38.20,88000.00,60.20,310.00,40.50,2018),(3,'Pacific Voyager',1800,700,850,32.70,69000.00,52.30,275.80,34.70,2013),(4,'Atlantic Queen',2200,850,950,36.80,82000.00,58.00,295.40,38.10,2016),(5,'Mediterranean Pearl',2600,1000,1200,39.50,92000.00,62.00,320.00,42.00,2019),(6,'Arctic Explorer',1500,600,700,30.50,60000.00,50.00,260.00,32.50,2012),(7,'Amazon King',2100,780,980,37.20,80000.00,57.50,292.30,37.80,2017);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complementos`
--

LOCK TABLES `complementos` WRITE;
/*!40000 ALTER TABLE `complementos` DISABLE KEYS */;
INSERT INTO `complementos` VALUES (1,'Wi-Fi Premium','Acceso a internet de alta velocidad',50.00,'camarote'),(2,'Excursión VIP','Acceso a tours privados en cada destino',200.00,'huésped'),(3,'Spa & Masajes','Acceso al spa del crucero por 2 horas',100.00,'huésped'),(4,'Cena Gourmet','Cena especial en el restaurante de lujo',75.00,'huésped'),(5,'Transporte VIP','Transporte privado desde el puerto',150.00,'huésped'),(6,'Bebidas Ilimitadas','Acceso ilimitado a bebidas alcohólicas y no alcohólicas',300.00,'camarote'),(7,'Acceso al Club Nocturno','Entrada VIP a la discoteca del crucero',50.00,'huésped');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruceros`
--

LOCK TABLES `cruceros` WRITE;
/*!40000 ALTER TABLE `cruceros` DISABLE KEYS */;
INSERT INTO `cruceros` VALUES (1,'Bahamas Explorer','bahamas_explorer.jpg',7,1,0),(2,'Cancún Sun','cancun_sun.jpg',5,2,0),(3,'Mediterranean Adventure','med_adventure.jpg',10,3,0),(4,'Miami Escape','miami_escape.jpg',4,4,0),(5,'Italian Voyage','italian_voyage.jpg',8,5,0),(6,'Greek Odyssey','greek_odyssey.jpg',9,6,0),(7,'Asian Wonders','asian_wonders.jpg',12,7,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cruceros_complementos`
--

LOCK TABLES `cruceros_complementos` WRITE;
/*!40000 ALTER TABLE `cruceros_complementos` DISABLE KEYS */;
INSERT INTO `cruceros_complementos` VALUES (1,1,1),(2,1,2),(3,2,3),(4,2,4),(5,3,5),(6,4,6),(7,5,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinos`
--

LOCK TABLES `destinos` WRITE;
/*!40000 ALTER TABLE `destinos` DISABLE KEYS */;
INSERT INTO `destinos` VALUES (1,'Bahamas','bahamas.jpg'),(2,'Cancún','cancun.jpg'),(3,'Barcelona','barcelona.jpg'),(4,'Miami','miami.jpg'),(5,'Roma','roma.jpg'),(6,'Atenas','atenas.jpg'),(7,'Tokio','tokio.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_habitacion`
--

LOCK TABLES `detalles_habitacion` WRITE;
/*!40000 ALTER TABLE `detalles_habitacion` DISABLE KEYS */;
INSERT INTO `detalles_habitacion` VALUES (8,1,'Habitación estándar con servicios básicos, ideal para viajeros individuales. Incluye baño privado y TV de pantalla plana.',18.50,1,'Individual','[\"Wi-Fi\", \"TV\", \"Aire acondicionado\"]',2,0,0,NULL,NULL);
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
  `id_habitacion` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id_detalle`),
  KEY `id_reserva` (`id_reserva`),
  KEY `id_complemento` (`id_complemento`),
  KEY `id_habitacion` (`id_habitacion`),
  CONSTRAINT `detalles_reserva_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`),
  CONSTRAINT `detalles_reserva_ibfk_2` FOREIGN KEY (`id_complemento`) REFERENCES `complementos` (`id_complemento`),
  CONSTRAINT `detalles_reserva_ibfk_3` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_reserva`
--

LOCK TABLES `detalles_reserva` WRITE;
/*!40000 ALTER TABLE `detalles_reserva` DISABLE KEYS */;
INSERT INTO `detalles_reserva` VALUES (22,21,1,1,1,50.00),(23,21,2,2,1,200.00),(24,22,3,3,1,100.00),(25,22,4,4,1,75.00),(26,23,5,5,1,150.00),(27,23,6,6,1,300.00),(28,24,7,7,1,50.00),(29,25,1,2,1,80.00),(30,26,2,3,1,90.00),(31,27,3,4,1,110.00),(32,28,4,5,1,120.00),(33,29,5,6,1,130.00),(34,30,6,7,1,140.00),(35,31,7,1,1,160.00);
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
  `metodo_pago` enum('pago_unico','dos_pagos') NOT NULL,
  `fecha_pago` date NOT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `id_reserva` (`id_reserva`),
  CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`id_reserva`) REFERENCES `reservas` (`id_reserva`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facturas`
--

LOCK TABLES `facturas` WRITE;
/*!40000 ALTER TABLE `facturas` DISABLE KEYS */;
INSERT INTO `facturas` VALUES (8,21,2000.00,150.00,50.00,2200.00,'pago_unico','2025-04-20'),(9,22,1500.00,120.00,40.00,1660.00,'dos_pagos','2025-05-12'),(10,23,1800.00,135.00,60.00,1995.00,'pago_unico','2025-06-15'),(11,24,2500.00,200.00,80.00,2780.00,'dos_pagos','2025-07-25'),(12,25,3000.00,250.00,90.00,3340.00,'pago_unico','2025-08-30'),(13,26,1200.00,100.00,30.00,1330.00,'dos_pagos','2025-09-10'),(14,27,800.00,60.00,20.00,880.00,'pago_unico','2025-10-05'),(15,28,2100.00,160.00,55.00,2315.00,'pago_unico','2025-11-12'),(16,29,1600.00,130.00,45.00,1775.00,'dos_pagos','2025-12-05'),(17,30,1900.00,140.00,70.00,2110.00,'pago_unico','2026-01-08'),(18,31,2600.00,210.00,85.00,2895.00,'dos_pagos','2026-02-20');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas_cruceros`
--

LOCK TABLES `fechas_cruceros` WRITE;
/*!40000 ALTER TABLE `fechas_cruceros` DISABLE KEYS */;
INSERT INTO `fechas_cruceros` VALUES (1,1,'2025-06-10','2025-05-01'),(2,2,'2025-07-15','2025-06-05'),(3,3,'2025-08-20','2025-07-10'),(4,4,'2025-09-05','2025-08-01'),(5,5,'2025-10-12','2025-09-05'),(6,6,'2025-11-20','2025-10-10'),(7,7,'2025-12-25','2025-11-15');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_barco`
--

LOCK TABLES `fotos_barco` WRITE;
/*!40000 ALTER TABLE `fotos_barco` DISABLE KEYS */;
INSERT INTO `fotos_barco` VALUES (1,1,'oceanic_dream_1.jpg'),(2,2,'caribbean_star_1.jpg'),(3,3,'pacific_voyager_1.jpg'),(4,4,'atlantic_queen_1.jpg'),(5,5,'mediterranean_pearl_1.jpg'),(6,6,'arctic_explorer_1.jpg'),(7,7,'amazon_king_1.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitaciones`
--

LOCK TABLES `habitaciones` WRITE;
/*!40000 ALTER TABLE `habitaciones` DISABLE KEYS */;
INSERT INTO `habitaciones` VALUES (1,1,'Suite','Suite Royal','Lujosa suite con vista panorámica',60,100,50.00,5),(2,2,'Balcón','Cabina Deluxe','Cabina con balcón privado',60,100,30.50,0),(3,3,'Interior','Cabina Económica','Cabina sin ventana',60,100,20.00,0),(4,4,'Vista al mar','Cabina Superior','Cabina con ventana grande',60,100,25.00,0),(5,5,'Suite','Penthouse Suite','Suite con jacuzzi y sala privada',60,100,70.00,0),(6,6,'Balcón','Cabina Confort','Cabina espaciosa con balcón',60,100,35.00,0),(7,7,'Interior','Cabina Básica','Cabina económica',60,100,18.00,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `huespedes`
--

LOCK TABLES `huespedes` WRITE;
/*!40000 ALTER TABLE `huespedes` DISABLE KEYS */;
INSERT INTO `huespedes` VALUES (36,21,'Pedro Ramírez','Masculino',29,'1995-09-12','Costa Rica'),(37,21,'Lucía Fernández','Femenino',27,'1997-03-21','México'),(38,22,'Alejandro Torres','Masculino',35,'1989-06-30','España'),(39,22,'Camila Pérez','Femenino',30,'1994-05-10','Argentina'),(40,23,'Jorge López','Masculino',41,'1983-07-18','Colombia'),(41,23,'Sofía González','Femenino',29,'1995-08-25','Chile'),(42,24,'Emilia Herrera','Femenino',26,'1998-11-05','Perú'),(43,25,'Diego Castillo','Masculino',34,'1990-06-14','Ecuador'),(44,26,'Laura Gutiérrez','Femenino',32,'1992-08-21','México'),(45,27,'Hugo Martínez','Masculino',38,'1986-10-05','Chile'),(46,28,'Natalia Rojas','Femenino',27,'1997-12-10','Costa Rica'),(47,29,'Raúl Jiménez','Masculino',30,'1994-03-28','España'),(48,30,'Marta Suárez','Femenino',29,'1995-07-15','Colombia'),(49,31,'Francisco Ortega','Masculino',40,'1984-11-02','Perú');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itinerarios`
--

LOCK TABLES `itinerarios` WRITE;
/*!40000 ALTER TABLE `itinerarios` DISABLE KEYS */;
INSERT INTO `itinerarios` VALUES (1,1,1,1,'Salida del puerto de Nassau a las 10 AM.',10,11),(2,1,2,2,'Llegada a Cancún a las 8 AM, tour guiado.',10,12),(3,2,1,3,'Exploración de Barcelona y visita a la Sagrada Familia.',10,10),(4,2,2,4,'Día libre en Roma para pasear por el Coliseo.',0,0),(5,3,1,5,'Recorrido en Atenas, visita a la Acrópolis.',0,0),(6,3,2,6,'Excursión en Santorini, degustación de vinos.',0,0),(7,4,1,7,'Llegada a Tokio, recorrido por el mercado de Tsukiji.',0,0);
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
INSERT INTO `password_reset_tokens` VALUES ('agargore.io@gmail.com','$2y$12$kJqbZTls1p4uT2prY1NfXOHVGAxvMYGuY9JAX1i2aMui7b/gyj7.K','2025-03-03 04:33:05'),('jeherrerasa@gmail.com','$2y$12$BLcaJSV.Ff.IYi8mjKZpqOTwOd/rlfPza2W.FB0IjPY1rsoZhJhwS','2025-02-12 01:32:52');
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
  PRIMARY KEY (`id_precio`),
  KEY `id_fecha` (`id_fecha`),
  KEY `id_habitacion` (`id_habitacion`),
  CONSTRAINT `precios_habitaciones_ibfk_1` FOREIGN KEY (`id_fecha`) REFERENCES `fechas_cruceros` (`id_fecha`),
  CONSTRAINT `precios_habitaciones_ibfk_2` FOREIGN KEY (`id_habitacion`) REFERENCES `habitaciones` (`id_habitacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios_habitaciones`
--

LOCK TABLES `precios_habitaciones` WRITE;
/*!40000 ALTER TABLE `precios_habitaciones` DISABLE KEYS */;
INSERT INTO `precios_habitaciones` VALUES (1,1,1,2000.00),(2,1,1,1500.00),(3,2,3,900.00),(4,2,4,1800.00),(5,3,5,2500.00),(6,3,6,1200.00),(7,4,7,800.00);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puertos`
--

LOCK TABLES `puertos` WRITE;
/*!40000 ALTER TABLE `puertos` DISABLE KEYS */;
INSERT INTO `puertos` VALUES (1,1,'Nassau','Bahamas','nassau_puerto.jpg'),(2,1,'Puerto Cancún','México','cancun_puerto.jpg'),(3,1,'Puerto de Barcelona','España','barcelona_puerto.jpg'),(4,1,'Puerto de Miami','EE.UU.','miami_puerto.jpg'),(5,1,'Puerto de Roma','Italia','roma_puerto.jpg'),(6,1,'Puerto de El Pireo','Grecia','atenas_puerto.jpg'),(7,1,'Puerto de Yokohama','Japón','tokio_puerto.jpg');
/*!40000 ALTER TABLE `puertos` ENABLE KEYS */;
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
  `estado` enum('pendiente','pagada','cancelada') NOT NULL,
  `fecha_reserva` date NOT NULL,
  PRIMARY KEY (`id_reserva`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_crucero` (`id_crucero`),
  KEY `id_fecha` (`id_fecha`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`id_crucero`) REFERENCES `cruceros` (`id_crucero`),
  CONSTRAINT `reservas_ibfk_3` FOREIGN KEY (`id_fecha`) REFERENCES `fechas_cruceros` (`id_fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (21,15,1,1,2,'pagada','2025-04-15'),(22,16,2,2,3,'pendiente','2025-05-10'),(23,17,3,3,4,'pagada','2025-06-20'),(24,18,4,4,1,'cancelada','2025-07-30'),(25,19,5,5,2,'pagada','2025-08-25'),(26,20,6,6,3,'pendiente','2025-09-15'),(27,21,7,7,5,'pagada','2025-10-10'),(28,4,1,1,2,'pagada','2025-04-15'),(29,5,2,2,3,'pendiente','2025-05-10'),(30,6,3,3,4,'pagada','2025-06-20'),(31,8,4,4,1,'cancelada','2025-07-30'),(32,9,5,5,2,'pagada','2025-08-25'),(33,10,6,6,3,'pendiente','2025-09-15'),(34,11,7,7,5,'pagada','2025-10-10'),(35,4,1,1,2,'pagada','2025-04-15'),(36,5,2,2,3,'pendiente','2025-05-10'),(37,6,3,3,4,'pagada','2025-06-20'),(38,8,4,4,1,'cancelada','2025-07-30'),(39,9,5,5,2,'pagada','2025-08-25'),(40,10,6,6,3,'pendiente','2025-09-15'),(41,11,7,7,5,'pagada','2025-10-10');
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
INSERT INTO `sessions` VALUES ('0fW17T552Gl0NiS569uzTjIssb3ySe1fTMEFGX2X',NULL,'::1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoidmZYaWNFV0FGNTNTQ0pFSDZKMVNRMEtwYU1nV2RxMUxxakRPRWZ1bSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODEvU1VOUklTRS9iYWNrZW5kL3B1YmxpYy91c3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739316283),('D0n4DBzzJZrdOAjT2BEX8MFsuT5op3uz7Cozn8qc',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiWjRRQTU3U0RRY29vUUhtYWtCbHloY283dEtuWEJidTNlMnNYaVhidiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739256943),('Ivlq1KdgWnEFZ95xHzRhW8iwTYYUQYjLaTaOqtRa',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiYURieHgxTEplYlAwQ2lOUFFzcDNGb25yb1E1QWZtRm5za0N0SkFuNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739665884),('OpyvFYlykLUVd8bNkQoCA2vcic0bstRbWJT7Y3Lr',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/133.0.0.0 Safari/537.36','YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTZZU05Cd2FQVUdnbWtlZmdIbjBrOTFRU1BlSEcweVhnelh5TE5kRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739256910),('rUMzSr8l7lWVvpEK8fcLBW2GAYrh7gdgvFsQ6k42',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoibTBNeUVHU0NVTXBlUTJBZGdHY1ZqQVBBVkJWT1Q5d0RxdkdCb2hzaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91c3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739316096),('S23IT2aRrkTYTBnpi2DjEta5pKLL1exn2DTt32XI',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkh3eU03ZkF6NFBQMWlmeVd3T0JXSXpCNndnNGNlQmxBQll2bEpGWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC91c3VhcmlvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1739667493),('WbKcezbByUt2w15JmrG7CXFeaiCXydWg9hMi5MAg',NULL,'127.0.0.1','PostmanRuntime/7.39.1','YTozOntzOjY6Il90b2tlbiI7czo0MDoiMTBEWXpIMHNoSzJybzFIakZSVDdwdDRyMzZua2p6T0pSVU83emFCdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9jcnVjZXJvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=',1740865957);
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

-- Dump completed on 2025-03-04 22:34:50
