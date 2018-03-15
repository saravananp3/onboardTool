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
-- Table structure for table `technical`
--

DROP TABLE IF EXISTS `technical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technical` (
  `datatype` varchar(255) DEFAULT NULL,
  `pname` varchar(255) DEFAULT NULL,
  `archneed` varchar(255) DEFAULT NULL,
  `formatsp` varchar(255) DEFAULT NULL,
  `mlang` varchar(255) DEFAULT NULL,
  `loclang` varchar(255) DEFAULT NULL,
  `dataretain` varchar(255) DEFAULT NULL,
  `systemdoc` varchar(255) DEFAULT NULL,
  `userdoc` varchar(255) DEFAULT NULL,
  `techdoc` varchar(255) DEFAULT NULL,
  `traindoc` varchar(255) DEFAULT NULL,
  `supportdoc` varchar(255) DEFAULT NULL,
  `datadic` varchar(255) DEFAULT NULL,
  `testcasedoc` varchar(255) DEFAULT NULL,
  `testrec` varchar(255) DEFAULT NULL,
  `designspec` varchar(255) DEFAULT NULL,
  `validityplan` varchar(255) DEFAULT NULL,
  `dataloc` varchar(255) DEFAULT NULL,
  `servername` varchar(255) DEFAULT NULL,
  `prodinstance` varchar(255) DEFAULT NULL,
  `prodinstanceloc` varchar(255) DEFAULT NULL,
  `infraengage` varchar(255) DEFAULT NULL,
  `sourcearch` varchar(255) DEFAULT NULL,
  `apphost` varchar(255) DEFAULT NULL,
  `retenduration` varchar(255) DEFAULT NULL,
  `clientapp` varchar(255) DEFAULT NULL,
  `extcustfacing` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `dbsize` varchar(255) DEFAULT NULL,
  `nooftable` varchar(255) DEFAULT NULL,
  `noofrec` varchar(255) DEFAULT NULL,
  `xmlcount` varchar(255) DEFAULT NULL,
  `anyvpn` varchar(255) DEFAULT NULL,
  `vpnacces` varchar(255) DEFAULT NULL,
  `appintegrate` varchar(255) DEFAULT NULL,
  `integname` varchar(255) DEFAULT NULL,
  `decomdate` varchar(255) DEFAULT NULL,
  `appname` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical`
--

LOCK TABLES `technical` WRITE;
/*!40000 ALTER TABLE `technical` DISABLE KEYS */;
INSERT INTO `technical` VALUES ('Structured','no name','No','any format','Yes','Yes',NULL,NULL,'user doc','tech doc','traingin doc','sprt doc','data dict','test case doc','test rec','design spec','val plan','stage','APST1000v','APST1000v','lpd','no name',NULL,NULL,'no','legacy applicatio ','no issue','no web apps','10GB','300','none','100','yes',NULL,'ad','27/12/2017',NULL,'IA1');
/*!40000 ALTER TABLE `technical` ENABLE KEYS */;
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
