-- MySQL dump 10.17  Distrib 10.3.23-MariaDB, for debian-linux-gnueabihf (armv7l)
--
-- Host: localhost    Database: sbdb
-- ------------------------------------------------------
-- Server version	10.3.23-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `audio_table`
--

DROP TABLE IF EXISTS `audio_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audio_table` (
  `file_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `name_orig` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `name_save` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `reg_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `store_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `audio_msg` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ip_address` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `bell_number` int(11) DEFAULT 0,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audio_table`
--

LOCK TABLES `audio_table` WRITE;
/*!40000 ALTER TABLE `audio_table` DISABLE KEYS */;
INSERT INTO `audio_table` VALUES ('065e383304659f3146a69e3a13e9c061','음성_001.m4a','202010082300_e1bcf2d9840a5b2260f36276f288d6a0.m4a','2020-10-08 14:05:01','임현준','ggghhh03',' 안녕하세요\n','192.168.10.119',3),('d739b6169b4e984b2e57fb14f41f297c','음성_003.m4a','202010062210_f2fe80896f94f1fde3f5a965866e0e5d.m4a','2020-10-06 13:15:55','임현준','ggghhh03',' 안녕하세요\n','192.168.10.119',0);
/*!40000 ALTER TABLE `audio_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covid_sd`
--

DROP TABLE IF EXISTS `covid_sd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `covid_sd` (
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `site` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `violation` int(20) DEFAULT NULL,
  PRIMARY KEY (`time`,`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid_sd`
--

LOCK TABLES `covid_sd` WRITE;
/*!40000 ALTER TABLE `covid_sd` DISABLE KEYS */;
INSERT INTO `covid_sd` VALUES ('2020-10-04 00:00:00','매탄공원','공연장',4),('2020-10-04 00:00:00','매여울공원','분수대',12),('2020-10-04 08:00:00','매여울공원','놀이터',16),('2020-10-04 11:00:00','매탄공원','공연장',36),('2020-10-04 12:00:00','매탄공원','공연장',11),('2020-10-04 13:00:00','매탄공원','공연장',25),('2020-10-04 14:00:00','매탄공원','공연장',21),('2020-10-04 14:43:06','매탄공원','공연장',5),('2020-10-04 14:47:19','매탄공원','공연장',6),('2020-10-04 15:00:00','매탄공원','공연장',16),('2020-10-04 16:00:00','매탄공원','공연장',8),('2020-10-04 17:00:00','매탄공원','공연장',6),('2020-10-08 23:14:53','매탄공원','공연장',6),('2020-10-09 22:32:38','매탄공원','공연장',6),('2020-10-09 23:00:36','매탄공원','공연장',6),('2020-10-09 23:57:24','maetanpark','concert',99),('2020-10-09 23:57:35','maetanpark','concert',99),('2020-10-09 23:59:34','maetanpark','concert',0),('2020-10-09 23:59:42','maetanpark','concert',0),('2020-10-10 00:06:23','매탄공원','공연장',7),('2020-10-10 00:06:46','매탄공원','공연장',7),('2020-10-10 00:10:08','매탄공원','공연장',7),('2020-10-10 00:19:12','매탄공원','공연장',7),('2020-10-10 00:38:35','매탄공원','공연장',7),('2020-10-10 00:52:02','매탄공원','공연장',7),('2020-10-10 00:54:58','','',7),('2020-10-10 00:58:32','','',7),('2020-10-10 01:01:01','maetanpark','concert',0),('2020-10-10 01:01:16','maetanpark','concert',0),('2020-10-10 01:01:26','maetanpark','concert',0),('2020-10-10 01:01:35','maetanpark','concert',0),('2020-10-10 01:04:55','','',0),('2020-10-10 01:05:09','','',0),('2020-10-10 01:05:23','','',0),('2020-10-10 01:05:31','','',0),('2020-10-10 01:05:53','','',0),('2020-10-10 01:06:06','','',0),('2020-10-10 01:06:12','','',0),('2020-10-10 01:09:56','','',0),('2020-10-10 01:10:06','','',0),('2020-10-10 01:10:12','','',0),('2020-10-10 01:32:54','매탄공원','공연장',0),('2020-10-10 01:33:27','매탄공원','공연장',0),('2020-10-10 01:34:47','매탄공원','공연장',0),('2020-10-10 01:35:00','매탄공원','공연장',0),('2020-10-10 01:43:26','매탄공원','공연장',52),('2020-10-10 01:43:39','매탄공원','공연장',0),('2020-10-10 01:43:49','매탄공원','공연장',0),('2020-10-10 01:43:58','매탄공원','공연장',0),('2020-10-10 01:44:06','매여울공원','공연장',62);
/*!40000 ALTER TABLE `covid_sd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_table`
--

DROP TABLE IF EXISTS `event_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_table` (
  `file_id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `event_date` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `reg_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `store_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `password` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `event_msg` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ip_address` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `bell_number` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_table`
--

LOCK TABLES `event_table` WRITE;
/*!40000 ALTER TABLE `event_table` DISABLE KEYS */;
INSERT INTO `event_table` VALUES ('18f6423ec3a9bf4b3710d1dd0da1630e','2020년10월06일22시20분','2020-10-06 13:26:34','임현준','ggghhh03','안녕하세요dddddddddddd','192.168.10.119',0),('474a67aab0e636e3e0d8d9414df3bb9b','2020년10월05일22시10분','2020-10-05 13:11:04','임현준','ggghhh03','안녕하세요dddddddddddd','192.168.10.119',0),('f9e581493be82ad0a312f7e803606aff','2020년10월04일23시10분','2020-10-04 14:14:50','임현준','ggghhh03','안녕하세요','192.168.10.119',0);
/*!40000 ALTER TABLE `event_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_info`
--

DROP TABLE IF EXISTS `store_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_info` (
  `id` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_info`
--

LOCK TABLES `store_info` WRITE;
/*!40000 ALTER TABLE `store_info` DISABLE KEYS */;
INSERT INTO `store_info` VALUES ('azg053465','ggghhh03','임현준','01029581869');
/*!40000 ALTER TABLE `store_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_file`
--

DROP TABLE IF EXISTS `upload_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_file` (
  `file_id` varchar(255) NOT NULL,
  `name_orig` varchar(255) DEFAULT NULL,
  `name_save` varchar(255) DEFAULT NULL,
  `reg_time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_file`
--

LOCK TABLES `upload_file` WRITE;
/*!40000 ALTER TABLE `upload_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `upload_file` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-13 23:15:09
