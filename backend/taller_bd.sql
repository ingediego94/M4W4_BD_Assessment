CREATE DATABASE  IF NOT EXISTS `taller_bd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `taller_bd`;
-- MySQL dump 10.13  Distrib 8.0.42, for Linux (x86_64)
--
-- Host: localhost    Database: taller_bd
-- ------------------------------------------------------
-- Server version	8.0.42-0ubuntu0.24.04.2

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id_city` int NOT NULL AUTO_INCREMENT,
  `city` varchar(30) NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id_city`),
  UNIQUE KEY `city` (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'New York',1),(2,'Bogota',1),(3,'Medellín',1),(4,'Cali',0),(5,'Los Angeles',1),(6,'Chicago',0),(7,'Sao Paulo',0);
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `events` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `capacity` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'Carolines Marriage','This event is to do Carolines marriage with Jonh','2025-08-30',333,'2025-08-10 15:41:08','2025-08-10 15:42:33'),(2,'Esteban Birthday','Will be the next month in Georgetown Capell','2025-09-25',450,'2025-08-10 15:41:08','2025-08-10 15:42:33'),(4,'Marrigage','Great marriage at Las Vegas','2025-08-14',8,'2025-08-10 15:41:08','2025-08-10 15:42:33'),(5,'celebracion golfistas','esta sera una magna celebracion','2025-08-12',2,'2025-08-10 15:41:08','2025-08-10 15:42:33'),(16,'Coldplay Concert','Live concert by Coldplay','2023-10-01',50000,'2025-08-10 15:43:46','2025-08-10 15:43:46'),(17,'Art Exhibition','Exhibition of modern art','2023-10-05',2000,'2025-08-10 15:43:46','2025-08-10 15:43:46'),(19,'Esteban Wedding','Boda de Esteban y su prometida Giselle','2025-08-10',3242,'2025-08-10 15:57:16','2025-08-10 15:57:16'),(20,'Food Festival','Local food festival','2023-10-15',10000,'2025-08-10 18:26:02','2025-08-10 18:26:02'),(21,'Marathon','City marathon event','2023-10-20',8000,'2025-08-10 18:26:02','2025-08-10 18:26:02'),(22,'Music Festival','Outdoor music festival','2023-10-25',15000,'2025-08-10 18:26:02','2025-08-10 18:26:02'),(23,'Film Screening','Screening of indie films','2023-10-30',500,'2025-08-10 18:26:02','2025-08-10 18:26:02'),(24,'Tech Conference','Annual tech conference','2025-08-27',67,'2025-08-12 02:31:18','2025-08-12 02:31:18'),(25,'Tech Conference 2024','si es la buena','2025-08-20',2321,'2025-08-12 02:50:33','2025-08-12 02:50:33');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John','Doe','jdoe@email.com','password123','admin'),(2,'Jane','Smith','jsmith@rmail.com','segurepass123','admin'),(3,'Alice','Johnson','a.johnson@gmail.com','alice00001*','admin'),(4,'Diego','Vega','dvega@mail.com','diego123','admin'),(9,'Carlos','Gomez','gmez@gmail.com','calroew3','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'taller_bd'
--

--
-- Dumping routines for database 'taller_bd'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-11 22:05:50
