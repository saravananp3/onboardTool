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
-- Table structure for table `app_prior`
--

DROP TABLE IF EXISTS `app_prior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_prior` (
  `prj_name` varchar(255) DEFAULT NULL,
  `IA_lic_cst` varchar(255) DEFAULT NULL,
  `IA_maint_cst` varchar(255) DEFAULT NULL,
  `Infrastrct_cst` varchar(255) DEFAULT NULL,
  `strg_est` varchar(255) DEFAULT NULL,
  `lab_cst` varchar(255) DEFAULT NULL,
  `proj_name` varchar(255) DEFAULT NULL,
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
  `ttl` varchar(255) DEFAULT NULL,
  `ttl_cst_fr_app` varchar(255) DEFAULT NULL,
  `add_cst_fr_contigency` varchar(255) DEFAULT NULL,
  `add_cst` varchar(255) DEFAULT NULL,
  `IA_app_sprt_cst` varchar(255) DEFAULT NULL,
  `est_archive_cst` varchar(255) DEFAULT NULL,
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `sum` int(11) DEFAULT NULL,
  `read_date` varchar(255) DEFAULT NULL,
  `sme_date` varchar(255) DEFAULT NULL,
  `priorities` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_prior`
--

LOCK TABLES `app_prior` WRITE;
/*!40000 ALTER TABLE `app_prior` DISABLE KEYS */;
INSERT INTO `app_prior` VALUES ('Project1','10','20','30','40','50','Application1','250 to 500 GB','erp','<100','Medium','1400','<=20','12.00','4200.00','$420000.00','$120.00','$120000.00','$12000.00','2712600.00','0.00','','','','',105,NULL,'26/06/2017','30/06/2017',2),('Project1','10','20','30','40','50','Application2','500 to 1 TB','erp','<100','Medium to High','1800','<=25','16.00','5400.00','$540000.00','$160.00','$160000.00','$16000.00','3516800.00','2712600.00','','','','',114,NULL,'27/06/2017','30/06/2017',3),('Project1','10','20','30','40','50','Application3','500 to 1 TB','regulardb','<100','Medium to High','1800','<=25','16.00','5400.00','$720000.00','$160.00','$160000.00','$16000.00','3516800.00','6229400.00','','','','',115,NULL,'01/07/2017','03/07/2017',1),('Project1','10','20','30','40','50','Application4','100 to 250 GB','product','<100','Medium','1400','<=20','12.00','5600.00','$560000.00','$120.00','$120000.00','$12000.00','3412600.00','9746200.00','','','','',116,NULL,'01/07/2017','04/07/2017',4);
/*!40000 ALTER TABLE `app_prior` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 17:54:57
