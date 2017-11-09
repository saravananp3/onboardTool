-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: strutsdb
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `user_details`
--

DROP TABLE IF EXISTS `user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_details` (
  `uname` varchar(255) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `pwd` varchar(255) DEFAULT NULL,
  `projects` varchar(255) DEFAULT NULL,
  `roles` varchar(255) DEFAULT NULL,
  `stats` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `answer` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_details`
--

LOCK TABLES `user_details` WRITE;
/*!40000 ALTER TABLE `user_details` DISABLE KEYS */;
INSERT INTO `user_details` VALUES ('parthiban','parthiban','v','parthiban@gmail.com','poiuytrewq','Project1','ArchivalAdmin','active','',''),('chandruashwin','chandru','kumar','chandru@gmail.com','Bala09876','Project1','LegacyTechnicalSME','active','',''),('sobanth','soban','murugan','soban@gmail.com','soban1234','Project2','TestLead','active','',''),('balamurugan','bala','murugan','balamuruganm96@gmail.com','bala1234','Project1','LegacyBusinessSME','active','',''),('arunkumar','arun','kumar','arunkumar@gmail.com','arun1234','Project2','LegacyProgramManager','active','',''),('SatyaDangeti','satya','dangeti','satyadev@gmail.com','satya1234','Project3','ArchivalBusinessAnalyst','active','',''),('SeelanC','seelan','c','seelan@gmail.com','seelan1234','Project1','ArchivalTechnicalLead','active','',''),('RajeshJeyaraman','Rajesh','Jeyaraman','rajesh@gmail.com','Rajesh1234','Project1','ArchivalProgramManager','active','',''),('HariVignesh','Hari','Vignesh','harivignesh@gmail.com','hari1234','Project2','ArchivalProjectManager','active','',''),('Venaktesh','venkat','v','balamuruganm96@gmail.com','venkat1234','Project3','ArchivalDeveloper','active','',''),('arul','arul','kumar','arul@gmail.com','arul12345','Project1','TechLead','active','Who is your fav Cricketer?','dhoni');
/*!40000 ALTER TABLE `user_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 17:55:05
