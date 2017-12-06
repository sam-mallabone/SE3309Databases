-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: librarydatabase
-- ------------------------------------------------------
-- Server version	5.7.20-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `staffID` int(11) NOT NULL AUTO_INCREMENT,
  `startDate` date NOT NULL,
  `salary` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `name` varchar(30) NOT NULL,
  `role` varchar(15) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (11,'2017-05-19',24000,'Abbey@u.ca','301-159-1052','Margaret Beltran','librarian'),(12,'2017-05-19',24000,'Abbie@u.ca','301-159-1065','Sarah Davis','janitor'),(13,'2017-05-19',24000,'Abby@u.ca','301-159-1078','Rickey Bonilla','assistant'),(14,'2017-05-19',24000,'Abdul@u.ca','301-159-1091','Janice Gonzalez','librarian'),(16,'2017-05-19',24000,'Abel@u.ca','301-159-1117','Chris Kennedy','assistant'),(17,'2017-05-19',24000,'Abigail@u.ca','301-159-1130','Edward White','assistant'),(19,'2016-01-19',35000,'Aaron@u.ca','301-159-1026','Jeffery Watson','assistant'),(20,'2016-01-19',35000,'Aaron@u.ca','301-159-1039','Nicole Mendez','librarian'),(23,'2016-01-19',35000,'Abby@u.ca','301-159-1078','Joseph Wilcox','librarian'),(24,'2016-01-19',35000,'Abdul@u.ca','301-159-1091','Julie Bishop','librarian'),(26,'2016-01-19',35000,'Abel@u.ca','301-159-1117','Kathleen Giles','assistant'),(27,'2016-01-19',35000,'Abigail@u.ca','301-159-1130','Nathan Reeves','librarian'),(28,'2013-01-19',41000,'Gudrun@u.ca','334-119-1713','Kathleen Rodriguez','librarian'),(31,'2013-01-19',41000,'Gus@u.ca','334-119-1752','Michael Hamilton','assistant'),(32,'2013-01-19',41000,'Gussie@u.ca','334-119-1765','Gregory Alexander','librarian'),(33,'2013-01-19',41000,'Gustavo@u.ca','334-119-1778','Amanda Perez','librarian'),(37,'2013-01-19',41000,'Gwendolyn@u.ca','334-119-1830','Teresa Turner','assistant'),(38,'2013-09-09',41000,'Gudrun@u.ca','334-129-1813','Donald Stafford','assistant'),(39,'2013-09-09',41000,'Guillermina@u.ca','334-129-1826','Christine Mccarthy','librarian'),(40,'2013-09-09',41000,'Guillermo@u.ca','334-129-1839','Paul Mays','janitor'),(42,'2013-09-09',41000,'Gussie@u.ca','334-129-1865','Miss Victoria Anderson','janitor'),(43,'2013-09-09',41000,'Gustavo@u.ca','334-129-1878','Elizabeth Smith','librarian'),(44,'2013-09-09',41000,'Guy@u.ca','334-129-1891','Megan Henson','assistant'),(46,'2013-09-09',41000,'Gwenda@u.ca','334-129-1917','Christopher Mitchell','janitor'),(47,'2013-09-09',41000,'Gwendolyn@u.ca','334-129-1930','Luis Molina','janitor'),(48,'2017-12-19',36500,'guy@me.com','403-991-9243','Mathieu Cornwall','security'),(49,'2017-12-15',37500,'guy2@me.com','403-997-9243','Max Cornwall','security'),(50,'2017-11-19',36500,'guy3@me.com','403-391-9243','Jay Ross','security'),(51,'2017-12-19',42500,'guy4@me.com','401-991-9243','Matty Johnson','librarian'),(52,'2017-12-19',36500,'guy5@me.com','403-991-9210','Matt Hollock','janitor'),(53,'2015-02-12',35360,'g@owl.ca','778-998-2939','Jack Johanis','librarian'),(55,'2017-11-29',100000,'jterpak@lib.com','403-223-8174','Jak Terpak','librarian');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-06 10:39:44
