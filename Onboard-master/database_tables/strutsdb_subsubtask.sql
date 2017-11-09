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
-- Table structure for table `subsubtask`
--

DROP TABLE IF EXISTS `subsubtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subsubtask` (
  `subid` varchar(255) DEFAULT NULL,
  `subsubid` varchar(255) DEFAULT NULL,
  `subsubname` varchar(255) DEFAULT NULL,
  `mem_ass` varchar(255) DEFAULT NULL,
  `act_srt_dat` varchar(255) DEFAULT NULL,
  `act_end_dat` varchar(255) DEFAULT NULL,
  `pln_srt_dat` varchar(255) DEFAULT NULL,
  `pln_end_dat` varchar(255) DEFAULT NULL,
  `progress` varchar(255) DEFAULT NULL,
  `hrs` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subsubtask`
--

LOCK TABLES `subsubtask` WRITE;
/*!40000 ALTER TABLE `subsubtask` DISABLE KEYS */;
INSERT INTO `subsubtask` VALUES ('ST-10014','SST-10016','Allocate Resources',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10014','SST-10017','Compliance Training',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10016','SST-10019','Draft project Plan',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10016','SST-10020','Delivery of draft project plan',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10016','SST-10021','Review project plan',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10016','SST-10022','Revise project plan',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10016','SST-10023','Delivery of project plan for approval',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10016','SST-10024','Approval of project plan',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10017','SST-10025','Archive Information and Requirements (AIR) Template',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10022','SST-10031','Requirements',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10022','SST-10032','Gate 2 Approval to Build',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10022','SST-10033','Build and Test',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10022','SST-10034','Gate 3 Approval to Deploy',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10022','SST-10035','Implement',NULL,NULL,NULL,NULL,NULL,NULL,NULL),('ST-10022','SST-10036','Gate 4 Approval to close',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `subsubtask` ENABLE KEYS */;
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
