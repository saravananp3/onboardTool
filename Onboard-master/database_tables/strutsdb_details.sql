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
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `details` (
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `indx` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`indx`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (3,'Requirements','101',NULL,1),(4,'Prepopulate Draft AIR and Load in Box','114','101',2),(4,'Send link to draft AIR to SME','113','101',3),(4,'Update AIR and Load in Box','112','101',4),(4,'Q&A with SME','111','101',5),(4,'Legacy System and Database Access','110','101',6),(4,'Functional Pillars Review','109','101',7),(4,'Sign Off Requirements (AIR, Approvals)','108','101',8),(4,'Finalized read only date for the application','107','101',9),(3,'Gate 2 Approval to Build','102',NULL,10),(3,'Build and Test','103',NULL,11),(4,'Configuration','136','103',12),(5,'Technical Design Document-Development','145','136',13),(5,'Technical Design Document  Approval','144','136',14),(5,'Shell Application Set up','143','136',15),(5,'Ingestion Configuration','142','136',16),(5,'Build & Configuration Screens and Reports','141','136',17),(5,'ETL Extraction Scripts','140','136',18),(5,'ETL Jobs setup','139','136',19),(5,'Build Unit Test Scripts','138','136',20),(5,'Test Extraction for connection validation','137','136',21),(4,'Cycle 1 (Dev)','135','103',22),(5,'First Sample Extraction','149','135',23),(5,'Load of the Sample Extraction','148','135',24),(5,'Build Index','147','135',25),(5,'Unit Testing','146','135',26),(4,'Cycle 2 (Stage)','133','103',27),(5,'Promote Application to Stage','153','133',28),(5,'Test Script inventory - approval','152','133',29),(5,'First Full Extraction','151','133',30),(5,' Full Load and Build Index','150','133',31),(4,'UAT setup (Stage)','132','103',32),(5,'Access and Authentication setup for Application','157','132',33),(5,'Assistance to UAT Test Plan','156','132',34),(5,'Stakeholder Communication','155','132',35),(5,'Get Business approval to proceed with UAT','154','132',36),(4,'UAT','131','103',37),(5,'Pre - Test script inventoryapproval','162','131',38),(5,'Coordinate Business UAT','161','131',39),(5,'Business UAT','160','131',40),(5,'Review results, Defect Fixes','159','131',41),(5,'Job Aid Completion','158','131',42),(3,'Gate 3 Approval to Deploy','104',NULL,43),(3,'Implement','105',NULL,44),(4,'Pre-Deployment Activities','116','105',45),(5,'Stakeholder Communication','122','116',46),(5,'Create CI - Configuration Item request','121','116',47),(5,'Re-evaluate Access and  authentication setup for application','120','116',48),(5,'Review deployment team tasks and  timeline','119','116',49),(5,'Active Directory Integration','118','116',50),(5,'Deploy Infrastructure Components','117','116',51),(4,'Deployment Activities','115','105',52),(5,'Gather meta data for all the files that are extracted from','130','115',53),(5,'Migrate data from stage to prod','129','115',54),(5,'Migrate components from Stage to Prod- Federation','128','115',55),(5,'Create/Validate/update indexes','127','115',56),(5,'Request for Change (RFC)Submission and approval','126','115',57),(5,'Change Approval Board (CAB) Submission and approval','125','115',58),(5,'Release to production/operations environment','124','115',59),(5,'Migration Report sign-off','123','115',60),(3,'Gate 4 Approval to close','106',NULL,61);
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-11-09 17:55:03
