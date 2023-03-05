-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: jocurionline
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `cont`
--

DROP TABLE IF EXISTS `cont`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cont` (
  `idcont` int NOT NULL AUTO_INCREMENT,
  `idjucator` int NOT NULL,
  `idjoc` int NOT NULL,
  `datacrearii` date NOT NULL,
  PRIMARY KEY (`idcont`),
  UNIQUE KEY `index4` (`idjucator`,`idjoc`),
  KEY `FK1_idx` (`idjoc`),
  KEY `FK2_idx` (`idjucator`),
  CONSTRAINT `FK1` FOREIGN KEY (`idjoc`) REFERENCES `jocuri` (`idjoc`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK2` FOREIGN KEY (`idjucator`) REFERENCES `jucatori` (`idjucator`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cont`
--

LOCK TABLES `cont` WRITE;
/*!40000 ALTER TABLE `cont` DISABLE KEYS */;
INSERT INTO `cont` VALUES (33,9,9,'2023-02-03'),(34,10,9,'2023-02-03'),(35,11,10,'2023-02-03'),(36,10,11,'2026-02-03'),(37,10,10,'2023-02-03');
/*!40000 ALTER TABLE `cont` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jocuri`
--

DROP TABLE IF EXISTS `jocuri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jocuri` (
  `idjoc` int NOT NULL AUTO_INCREMENT,
  `numejoc` varchar(45) NOT NULL,
  `tip` varchar(45) NOT NULL,
  `descriere` varchar(45) NOT NULL,
  PRIMARY KEY (`idjoc`),
  UNIQUE KEY `numejoc_UNIQUE` (`numejoc`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jocuri`
--

LOCK TABLES `jocuri` WRITE;
/*!40000 ALTER TABLE `jocuri` DISABLE KEYS */;
INSERT INTO `jocuri` VALUES (9,'Albion','MMO','primul joc'),(10,'Al doilea joc','RPG','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),(11,'MUDDDD','Mudddddd','null'),(12,'Poker','joc de carti','????????');
/*!40000 ALTER TABLE `jocuri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jucatori`
--

DROP TABLE IF EXISTS `jucatori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jucatori` (
  `idjucator` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `parola` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`idjucator`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jucatori`
--

LOCK TABLES `jucatori` WRITE;
/*!40000 ALTER TABLE `jucatori` DISABLE KEYS */;
INSERT INTO `jucatori` VALUES (9,'Primul','111111','primul@google.ro'),(10,'Al doilea','222222222222','doi@upb.com'),(11,'Exempluuuuu','eeeee213133131','ehhhhhhh'),(12,'Username','Parola','email@google.com');
/*!40000 ALTER TABLE `jucatori` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-03  8:17:03
