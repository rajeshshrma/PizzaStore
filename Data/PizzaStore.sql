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
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `ITEMID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(45) NOT NULL,
  `PRICE` decimal(10,0) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ITEMID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Pizza ',200,'a dish of Italian origin, consisting of a flat round base of dough baked with a topping of tomatoes and cheese, typically with added meat, fish, or vegetables.'),(2,'Pasta',200,'a dish originally from Italy consisting of dough made from durum wheat and water, extruded or stamped into various shapes and typically cooked in boiling water.'),(3,'Sandwich ',100,'an item of food consisting of two pieces of bread with a filling between them, eaten as a light meal.');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topping`
--

DROP TABLE IF EXISTS `topping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `topping` (
  `TOPPINGID` int(11) NOT NULL,
  `NAME` varchar(45) NOT NULL,
  `ITEMID` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TOPPINGID`),
  KEY `ITEMID_idx` (`ITEMID`),
  CONSTRAINT `ITEMID` FOREIGN KEY (`ITEMID`) REFERENCES `item` (`ITEMID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping`
--

LOCK TABLES `topping` WRITE;
/*!40000 ALTER TABLE `topping` DISABLE KEYS */;
INSERT INTO `topping` VALUES (1,'Bread',3,NULL),(2,'Pasta',2,NULL),(3,'Cheese ',1,NULL),(4,'Pepper ',1,NULL),(5,'Tomato ',1,NULL),(6,'Sauce ',1,NULL),(7,'Baked ',1,NULL);
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
  `PRICE` decimal(10,0) NOT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `TOPPINGID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OPTIONID`),
  KEY `TOPPINGID_idx` (`TOPPINGID`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topping_options`
--

LOCK TABLES `topping_options` WRITE;
/*!40000 ALTER TABLE `topping_options` DISABLE KEYS */;
INSERT INTO `topping_options` VALUES (1,'Italian',50,NULL,1),(2,'Honey Bread',35,NULL,1),(3,'Whole Wheat',23,NULL,1),(4,'Whole Wheat',35,NULL,2),(5,'Normal',25,NULL,2),(6,'Light Cheese',20,NULL,3),(7,'Normal Cheese',30,NULL,3),(8,'Extra Cheese',50,NULL,3),(9,'Green Pepper',25,NULL,3),(10,'Yellow Pepper',35,NULL,4),(11,'Orange Pepper',15,NULL,4),(12,'Sliced',20,NULL,5),(13,'Puree',10,NULL,5),(14,'Hot Sauce',25,NULL,6),(15,'Light Sauce',15,NULL,6),(16,'Well Baked',15,NULL,7),(17,'Light Baked',10,NULL,7);
/*!40000 ALTER TABLE `topping_options` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-31 22:36:09
