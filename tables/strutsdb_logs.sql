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
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logs` (
  `USER_ID` varchar(20) NOT NULL,
  `DATED` varchar(25) NOT NULL,
  `LOGGER` varchar(50) NOT NULL,
  `LEVEL` varchar(10) NOT NULL,
  `MESSAGE` varchar(1000) NOT NULL,
  `roles` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES ('admin               ','2018-03-14 19:07:05,344','Project','INFO','created project JBA','admin               '),('admin               ','2018-03-14 19:13:41,435','EditProject','INFO','modified project JBA','admin               '),('admin               ','2018-03-14 19:13:49,312','EditProject','INFO','modified project JBA','admin               '),('admin               ','2018-03-14 19:13:58,011','IntsantApp','INFO','created application IA1 in project JBA for AppEmphasize module','admin               '),('admin               ','2018-03-14 19:14:07,054','IntsantApp','INFO','created application IA2 in project JBA for AppEmphasize module','admin               '),('admin               ','2018-03-14 19:14:45,434','Displaydb','INFO','modified project JBA','admin               '),('admin               ','2018-03-14 19:14:51,515','Displaydb','INFO','modified project JBA','admin               '),('admin               ','2018-03-14 19:18:18,825','business','INFO','modified project null','admin               '),('admin               ','2018-03-14 19:21:45,125','Technical','INFO','modified project JBA','admin               '),('admin               ','2018-03-15 09:06:05,974','EditProject','INFO','modified project JBA','admin               '),('admin               ','2018-03-15 11:27:28,502','EditProject','INFO','modified project JBA','admin               '),('admin               ','2018-03-15 11:28:04,279','Displaydb','INFO','modified project JBA','admin               '),('admin               ','2018-03-15 11:28:52,640','Displaydb','INFO','modified project JBA','admin               '),('admin               ','2018-03-15 11:33:38,706','date_update','INFO','modified project JBA','admin               '),('admin               ','2018-03-15 12:12:33,586','date_update','INFO','modified project JBA','admin               ');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-15 13:33:29
