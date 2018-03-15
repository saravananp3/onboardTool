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
-- Table structure for table `archive_details`
--

DROP TABLE IF EXISTS `archive_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `archive_details` (
  `seq_num` int(11) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `mem_ass` varchar(255) DEFAULT NULL,
  `act_srt_date` varchar(255) DEFAULT NULL,
  `act_end_date` varchar(255) DEFAULT NULL,
  `pln_srt_date` varchar(255) DEFAULT NULL,
  `pln_end_date` varchar(255) DEFAULT NULL,
  `hours` varchar(255) DEFAULT NULL,
  `id` varchar(255) DEFAULT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `stats` varchar(255) DEFAULT NULL,
  `planned_hrs` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `archive_details`
--

LOCK TABLES `archive_details` WRITE;
/*!40000 ALTER TABLE `archive_details` DISABLE KEYS */;
INSERT INTO `archive_details` VALUES (1,1,'Ideation and Initiate','','','','','','','10000','10000','',''),(2,2,'Develop and Approve Business Case','','','','','','','10012','10000','',''),(3,2,'Request Project in GPS with Assigned Project','','','','','','','10011','10000','',''),(4,2,'Assign PM and Project Owner','','','','','','','10010','10000','',''),(5,2,'Assign Priority and Project Risk Score','','','','','','','10009','10000','',''),(6,2,'Gate1 Approval to Plan','','','','','','','10004','10000','',''),(7,1,'Plan','','','','','','','10001','10001','',''),(8,2,'Onboarding','','','','','','','10015','10001','',''),(9,3,'Allocate Resources','','','','','','','10017','10015','',''),(10,3,'Compliance Training','','','','','','','10016','10015','',''),(11,2,'Project Kickoff','','','','','','','10014','10001','',''),(12,2,'Project Plan','','','','','','','10013','10001','',''),(13,3,'Draft project Plan','','','','','','','10023','10013','',''),(14,3,'Delivery of draft project plan','','','','','','','10022','10013','',''),(15,3,'Review project plan','','','','','','','10021','10013','',''),(16,3,'Revise project plan','','','','','','','10020','10013','',''),(17,3,'Delivery of project plan for approval','','','','','','','10019','10013','',''),(18,3,'Approval of project plan','','','','','','','10018','10013','',''),(19,2,'Process and Procedure definition','','','','','','','10005','10001','',''),(20,3,'Archive Information and Requirements (AIR) Template','','','','','','','10024','10005','',''),(21,1,'Execute','','','','','','','10002','10002','',''),(22,1,'Closure','','','','','','','10025','10025','',''),(23,2,'Hypercare Support','','','','','','','10026','10025','',''),(24,2,'Exit criteria meeting and Retirement communication','','','','','','','10027','10025','',''),(25,2,'Stakeholder communication','','','','','','','10028','10025','',''),(26,2,'Lessons learned','','','','','','','10029','10025','',''),(27,2,'Project close check list','','','','','','','10030','10025','',''),(28,2,'Final finances and invoices','','','','','','','10031','10025','','');
/*!40000 ALTER TABLE `archive_details` ENABLE KEYS */;
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
