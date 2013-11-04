-- MySQL dump 10.13  Distrib 5.5.15, for Win32 (x86)
--
-- Host: localhost    Database: mobserver
-- ------------------------------------------------------
-- Server version	5.5.15

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
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_expired` bit(1) NOT NULL,
  `account_locked` bit(1) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `postal_code` varchar(15) DEFAULT NULL,
  `province` varchar(100) DEFAULT NULL,
  `credentials_expired` bit(1) NOT NULL,
  `email` varchar(255) NOT NULL,
  `account_enabled` bit(1) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `password_hint` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `version` int(11) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (-2,'\0','\0','','Denver','US','80210','CO','\0','chasel.java@gmail.com','','Matt','Raible','a40546cc4fd6a12572828bb803380888ad1bfdab','Not a female kitty.','','admin',2,'http://raibledesigns.com'),(-1,'\0','\0','','Denver','US','80210','CO','\0','matt_raible@yahoo.com','','Tomcat','User','b6b1f4781776979c0775c71ebdd8bdc084aac5fe','A male kitty.','','user',1,'http://tomcat.apache.org'),(1,'\0','\0','','ShenZhen','CN','518000','GuangDong','\0','chasel.li@beyondsoft.com','','Chasel','Li','d429da9f81d9ebe138234554e5dab73dd8143b95','chasel','','chasel',0,''),(2,'\0','\0','','Shenzhen','CN','518000','Guangdong','\0','xavier.huang@achievo.com','\0','Xavier','Huang','ea5c14ac14e8d4883b2dc55457111d3632c0e5cc','xavier','','xavier',0,''),(3,'\0','\0','','','','','','\0','frank.li@achievo.com','\0','Frank','Li','b0229e4ce9ab7cce102069dab44e4c2c8a31eb89','frank','','frank',0,''),(4,'\0','\0','','','','','','\0','beth.chen@achievo.com','','Beth','Chen','07ad02c5ddad19ef5ed0df1c8b4f411d238a0b1e','beth','','beth',0,''),(5,'\0','\0','','','','','','\0','nick.fang@achievo.com','','Nick','Fang','e284f50a61d891e2170b7e0eee16dbeb37f09f10','nick','','nick',0,''),(6,'\0','\0','','','','','','\0','gigi.luo@achievo.com','\0','Gigi','Luo','dc5fee47624221eb21ec9d351359af46d2d5a550','gigi','','gigi',0,''),(7,'\0','\0','','','','','','\0','bem.guo@achievo.com','','Bem','Guo','8a994d32bc17bfe8f38d2e42055628be2ffb9257','bem','','bem',0,''),(8,'\0','\0','','','','','','\0','jo.lin@achievo.com','','Jo','Lin','5781bde5b04bac5e04904ad698408f77bd728000','jo','','jo',0,''),(9,'\0','\0','','','','','','\0','share.yang@achievo.com','','Share','Yang','58d5f4af4b05cec1ee5818c786a337c5b7df632a','share','','share',0,''),(10,'\0','\0','','','','','','\0','leslie.chen@achievo.com','','Leslie','Chen','4096e637866a566cb116809f3fc035cf170d45d7','leslie','','leslie',0,'');
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (-2,'Default role for all Users','ROLE_USER'),(-1,'Administrator role (can edit Users)','ROLE_ADMIN');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK143BF46A4FD90D75` (`role_id`),
  KEY `FK143BF46AF503D155` (`user_id`),
  CONSTRAINT `FK143BF46A4FD90D75` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FK143BF46AF503D155` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (-1,-2),(1,-2),(2,-2),(3,-2),(4,-2),(5,-2),(6,-2),(7,-2),(8,-2),(9,-2),(10,-2),(-2,-1);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-12 10:11:34
