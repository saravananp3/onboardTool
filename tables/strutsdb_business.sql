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
-- Table structure for table `business`
--

DROP TABLE IF EXISTS `business`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business` (
  `legappname` varchar(255) DEFAULT NULL,
  `reftoapp` varchar(255) DEFAULT NULL,
  `tid` varchar(255) DEFAULT NULL,
  `descr` varchar(255) DEFAULT NULL,
  `vendor` varchar(255) DEFAULT NULL,
  `expdate` varchar(255) DEFAULT NULL,
  `noticeperiod` varchar(255) DEFAULT NULL,
  `contractvalue` varchar(255) DEFAULT NULL,
  `businessunits` varchar(255) DEFAULT NULL,
  `rodch` varchar(255) DEFAULT NULL,
  `rod` varchar(255) DEFAULT NULL,
  `cmnt` varchar(255) DEFAULT NULL,
  `hasdep` varchar(255) DEFAULT NULL,
  `daterange` varchar(255) DEFAULT NULL,
  `dbsize` varchar(255) DEFAULT NULL,
  `dataloc` varchar(255) DEFAULT NULL,
  `siteloc` varchar(255) DEFAULT NULL,
  `needarch` varchar(255) DEFAULT NULL,
  `archreason` varchar(255) DEFAULT NULL,
  `archcmnt` varchar(255) DEFAULT NULL,
  `sourceoft` varchar(255) DEFAULT NULL,
  `reccode` varchar(255) DEFAULT NULL,
  `triggerdate` varchar(255) DEFAULT NULL,
  `retentionperiod` varchar(255) DEFAULT NULL,
  `retentiontable` varchar(255) DEFAULT NULL,
  `retentionname` varchar(255) DEFAULT NULL,
  `legalholds` varchar(255) DEFAULT NULL,
  `wholegal` varchar(255) DEFAULT NULL,
  `archexp` varchar(255) DEFAULT NULL,
  `useforBI` varchar(255) DEFAULT NULL,
  `creditacc` varchar(255) DEFAULT NULL,
  `financialacc` varchar(255) DEFAULT NULL,
  `dob` varchar(255) DEFAULT NULL,
  `driverlic` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `family` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `geoloc` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `income` varchar(255) DEFAULT NULL,
  `ipadrs` varchar(255) DEFAULT NULL,
  `martialstatus` varchar(255) DEFAULT NULL,
  `mobid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phno` varchar(255) DEFAULT NULL,
  `mailadrs` varchar(255) DEFAULT NULL,
  `physic` varchar(255) DEFAULT NULL,
  `race` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `sexualpref` varchar(255) DEFAULT NULL,
  `ssn` varchar(255) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `expl` varchar(255) DEFAULT NULL,
  `localreq` varchar(255) DEFAULT NULL,
  `localcountry` varchar(255) DEFAULT NULL,
  `localinf` varchar(255) DEFAULT NULL,
  `datacenters` varchar(255) DEFAULT NULL,
  `extaccess` varchar(255) DEFAULT NULL,
  `who` varchar(255) DEFAULT NULL,
  `uname` varchar(255) DEFAULT NULL,
  `roledesc` varchar(255) DEFAULT NULL,
  `accreason` varchar(255) DEFAULT NULL,
  `accfreq` varchar(255) DEFAULT NULL,
  `sysreq` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business`
--

LOCK TABLES `business` WRITE;
/*!40000 ALTER TABLE `business` DISABLE KEYS */;
/*!40000 ALTER TABLE `business` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-16 21:37:18
