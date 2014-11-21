CREATE DATABASE  IF NOT EXISTS `pizzastore` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `pizzastore`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: pizzastore
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `EMAIL_ID` varchar(45) NOT NULL,
  `ADDRESS1` varchar(100) DEFAULT NULL,
  `ADDRESS2` varchar(100) DEFAULT NULL,
  `ADDRESS3` varchar(100) DEFAULT NULL,
  `PHONE` varchar(11) DEFAULT NULL,
  `CITY` varchar(20) DEFAULT NULL,
  `STATE` varchar(20) DEFAULT NULL,
  `COUNTRY` varchar(20) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) DEFAULT NULL,
  `LAST_MODIFIED_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EMAIL_ID`),
  KEY `EMAIL_ID_idx` (`EMAIL_ID`),
  CONSTRAINT `EMAIL_ID` FOREIGN KEY (`EMAIL_ID`) REFERENCES `user` (`EMAIL_ID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES ('bestrajesh@gmail.com','House No 167','OLD HBC','Jind','9467505544','Jind','Haryana','India',NULL,NULL,NULL);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `sessionid` varchar(100) NOT NULL,
  `itemid` int(11) NOT NULL,
  PRIMARY KEY (`sessionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `PRODUCTID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`PRODUCTID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Pizza ',200,'a dish of Italian origin, consisting of a flat round base of dough baked with a topping of tomatoes and cheese, typically with added meat, fish, or vegetables.'),(2,'Pasta',200,'a dish originally from Italy consisting of dough made from durum wheat and water, extruded or stamped into various shapes and typically cooked in boiling water.'),(3,'Sandwich ',100,'an item of food consisting of two pieces of bread with a filling between them, eaten as a light meal.');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_topping`
--

DROP TABLE IF EXISTS `product_topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_topping` (
  `PRODUCTID` int(11) NOT NULL,
  `TOPPINGID` int(11) NOT NULL,
  PRIMARY KEY (`PRODUCTID`,`TOPPINGID`),
  KEY `TOPPINGID_idx` (`TOPPINGID`),
  CONSTRAINT `PRODUCTID` FOREIGN KEY (`PRODUCTID`) REFERENCES `product` (`PRODUCTID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_topping`
--

LOCK TABLES `product_topping` WRITE;
/*!40000 ALTER TABLE `product_topping` DISABLE KEYS */;
INSERT INTO `product_topping` VALUES (3,1),(2,2),(1,3),(2,3),(3,3),(1,4),(2,4),(3,4),(1,5),(2,5),(3,5),(1,6),(2,6),(3,6),(1,7),(2,7),(3,7);
/*!40000 ALTER TABLE `product_topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping`
--

DROP TABLE IF EXISTS `topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topping` (
  `TOPPINGID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TOPPINGID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping`
--

LOCK TABLES `topping` WRITE;
/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` VALUES (1,'Bread',NULL),(2,'Pasta',NULL),(3,'Cheese ',NULL),(4,'Pepper ',NULL),(5,'Tomato ',NULL),(6,'Sauce ',NULL),(7,'Baked ',NULL);
/*!40000 ALTER TABLE `topping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping_options`
--

DROP TABLE IF EXISTS `topping_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topping_options` (
  `OPTIONID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `PRICE` int(11) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `TOPPINGID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OPTIONID`),
  KEY `TOPPINGID_idx` (`TOPPINGID`),
  CONSTRAINT `TOPPINGID` FOREIGN KEY (`TOPPINGID`) REFERENCES `topping` (`TOPPINGID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping_options`
--

LOCK TABLES `topping_options` WRITE;
/*!40000 ALTER TABLE `topping_options` DISABLE KEYS */;
INSERT INTO `topping_options` VALUES (1,'Italian',50,NULL,1),(2,'Honey Bread',35,NULL,1),(3,'Whole Wheat',23,NULL,1),(4,'Whole Wheat',35,NULL,2),(5,'Normal',25,NULL,2),(6,'Light Cheese',20,NULL,3),(7,'Normal Cheese',30,NULL,3),(8,'Extra Cheese',50,NULL,3),(9,'Green Pepper',25,NULL,4),(10,'Yellow Pepper',35,NULL,4),(11,'Orange Pepper',15,NULL,4),(12,'Sliced',20,NULL,5),(13,'Puree',10,NULL,5),(14,'Hot Sauce',25,NULL,6),(15,'Light Sauce',15,NULL,6),(16,'Well Baked',15,NULL,7),(17,'Light Baked',10,NULL,7),(18,'None',0,NULL,1),(19,'None',0,NULL,2),(20,'None',0,NULL,3),(21,'None',0,NULL,4),(22,'None',0,NULL,5),(23,'None',0,NULL,6),(24,'None',0,NULL,7);
/*!40000 ALTER TABLE `topping_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `USER_ID` varchar(45) DEFAULT NULL,
  `PASSWORD` varchar(45) DEFAULT NULL,
  `FIRST_NAME` varchar(45) DEFAULT NULL,
  `LAST_NAME` varchar(45) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `EMAIL_ID` varchar(45) NOT NULL,
  `USER_TOKEN` varchar(45) DEFAULT NULL,
  `CREATED_DATE` varchar(45) DEFAULT NULL,
  `LAST_MODIFIED_DATE` varchar(45) DEFAULT NULL,
  `TOKEN_EXPIRY_DATE` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`EMAIL_ID`),
  UNIQUE KEY `USER_ID_UNIQUE` (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (NULL,'raj123','Rajesh','Kumar','ADDRESS_CREATED','bestrajesh@gmail.com','cTIxx3994363','Thu Nov 20 11:06:08 IST 2014','Thu Nov 20 16:28:01 IST 2014','Thu Nov 20 22:26:17 2014');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-20 20:38:20
