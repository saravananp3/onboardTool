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
-- Table structure for table `app_est`
--

DROP TABLE IF EXISTS `app_est`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_est` (
  `app_name` varchar(255) DEFAULT NULL,
  `data_size` varchar(255) DEFAULT NULL,
  `data_source` varchar(255) DEFAULT NULL,
  `curnt_users` varchar(255) DEFAULT NULL,
  `complexity` varchar(255) DEFAULT NULL,
  `est_archive` varchar(255) DEFAULT NULL,
  `est_scrn` varchar(255) DEFAULT NULL,
  `est_db_size` varchar(255) DEFAULT NULL,
  `est_hrs` varchar(255) DEFAULT NULL,
  `est_cst` varchar(255) DEFAULT NULL,
  `ttl_IA_cst` varchar(255) DEFAULT NULL,
  `ttl_infra_cst` varchar(255) DEFAULT NULL,
  `ttl_IA_prdct_cst` varchar(255) DEFAULT NULL,
  `ttl` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_est`
--

LOCK TABLES `app_est` WRITE;
/*!40000 ALTER TABLE `app_est` DISABLE KEYS */;
INSERT INTO `app_est` VALUES ('','','','','','','','','','','','','',''),('proj1','>1 TB','erp','<100','Medium to High','1800','<=25','128.00','3600','$360000.00','$1280.00','$1280000.00','$128000.00','$8334400.00'),('proj1','250 to 500 GB','erp','<100',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('','500 to 1 TB',NULL,'<10',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `app_est` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 17:55:02
