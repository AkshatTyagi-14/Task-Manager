-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: user
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `employee_task`
--

DROP TABLE IF EXISTS `employee_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_task` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Project` varchar(45) DEFAULT NULL,
  `Task` varchar(45) DEFAULT NULL,
  `Duration` varchar(45) DEFAULT NULL,
  `Assign_Date` varchar(45) DEFAULT NULL,
  `Complete_Duration` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Rating` varchar(45) DEFAULT NULL,
  `Assign_To` int DEFAULT NULL,
  `Assign_By` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_task`
--

LOCK TABLES `employee_task` WRITE;
/*!40000 ALTER TABLE `employee_task` DISABLE KEYS */;
INSERT INTO `employee_task` VALUES (1,'c++','asdfgh','3','2026-10-14 14:29:15.78',NULL,'WIP','5',5,2);
/*!40000 ALTER TABLE `employee_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `softcopy`
--

DROP TABLE IF EXISTS `softcopy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `softcopy` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `Mobile` varchar(45) DEFAULT NULL,
  `Role` int DEFAULT NULL,
  `Is Active` int DEFAULT NULL,
  `Manage By` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `softcopy`
--

LOCK TABLES `softcopy` WRITE;
/*!40000 ALTER TABLE `softcopy` DISABLE KEYS */;
INSERT INTO `softcopy` VALUES (1,'Admin','7510','9917364308',0,1,0),(2,'Akshat','123','9557966741',1,1,1),(3,'Dev','123','9637418524',1,1,1),(4,'Tushar','123','8976541297',1,1,1),(5,'A','123','7896541230',2,1,2),(6,'B','123','9633217418',2,1,2),(7,'C','123','7417539512',2,1,2);
/*!40000 ALTER TABLE `softcopy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-27 15:00:13
