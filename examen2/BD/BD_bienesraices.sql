/*******************************************************************

            ESTE ES EL CODIGO PARA IMPORTAR TODA LA BASE
        DE DATOS USADA EN LA APLICACION WEB, INCLUYENDO INSERTOS

********************************************************************/
/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: bienesraices2
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

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
-- Table structure for table `propierties`
--

DROP TABLE IF EXISTS `propierties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `propierties` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(256) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `rooms` int(11) DEFAULT NULL,
  `wc` int(11) DEFAULT NULL,
  `timestamp` date DEFAULT NULL,
  `id_seller` int(11) NOT NULL,
  `sold` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `id_seller` (`id_seller`),
  CONSTRAINT `propierties_ibfk_1` FOREIGN KEY (`id_seller`) REFERENCES `sellers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propierties`
--

LOCK TABLES `propierties` WRITE;
/*!40000 ALTER TABLE `propierties` DISABLE KEYS */;
INSERT INTO `propierties` VALUES
(1,'Beachfront House',250000.00,'beach_house.jpg','Beautiful house right on the beach, perfect for vacations.',3,2,'2024-10-01',1001,0),
(2,'Central Apartment',180000.00,'central_apartment.jpg','Modern apartment with city views, close to everything.',2,1,'2024-10-05',1002,0),
(3,'Country Estate',300000.00,'country_estate.jpg','Large estate with farmland and a cozy country house.',4,3,'2024-10-10',1001,0),
(4,'Industrial Loft',200000.00,'industrial_loft.jpg','Trendy industrial-style loft with all amenities.',1,1,'2024-10-12',1002,0),
(9,'OAXACA',1000.00,'','La mejor casa de oaxaca                ',2,1,'2024-10-31',1001,0),
(10,'foo',1235.00,'','sadkjasd                    ',1,1,'2024-10-30',1004,0),
(13,'Example',990.00,'','Lorem impsum                    ',1,1,'2024-11-08',1002,0),
(14,'PC23',9876.00,'','Lorem impsum asd terws',6,2,'2024-11-08',1002,1),
(17,'REOP',3.30,'','                    sadfh',1,1,'2024-11-04',1004,0),
(19,'POUTRIU',3.31,'','LOREM IPSUM CARLO TUTEP COLEM NAMTI',1,1,'2024-11-04',1004,1),
(20,'UTT',99999.00,'Screenshot from 2024-10-30 18-24-00.png','lorem impsum',80,12,'2024-10-31',1006,0);
/*!40000 ALTER TABLE `propierties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `seller_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `sale_date` date NOT NULL,
  PRIMARY KEY (`seller_id`,`property_id`),
  KEY `property_id` (`property_id`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`id`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `propierties` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES
(1001,1,'2024-10-31'),
(1001,14,'2024-11-01'),
(1001,19,'2024-11-01');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'IGNORE_SPACE,STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER sold_property
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    UPDATE propierties
    SET sold = TRUE
    WHERE id = NEW.property_id;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sellers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `email` varchar(32) NOT NULL,
  `phone` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2719 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES
(1001,'Foo Bar','foo@bar.com','1234567890'),
(1002,'Bar Foo','bar@foo.com','0987654321'),
(1004,'Pedro','ola@mail,','123456'),
(1006,'Pepe','ppeep@utt','0987654');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vw_available_properties`
--

DROP TABLE IF EXISTS `vw_available_properties`;
/*!50001 DROP VIEW IF EXISTS `vw_available_properties`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_available_properties` AS SELECT
 1 AS `id`,
  1 AS `title`,
  1 AS `price`,
  1 AS `image`,
  1 AS `description`,
  1 AS `rooms`,
  1 AS `wc` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_available_properties`
--

/*!50001 DROP VIEW IF EXISTS `vw_available_properties`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_available_properties` AS select `propierties`.`id` AS `id`,`propierties`.`title` AS `title`,`propierties`.`price` AS `price`,`propierties`.`image` AS `image`,`propierties`.`description` AS `description`,`propierties`.`rooms` AS `rooms`,`propierties`.`wc` AS `wc` from `propierties` where `propierties`.`sold` = 0 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-31 18:24:02
