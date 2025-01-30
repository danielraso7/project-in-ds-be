-- MySQL dump 10.13  Distrib 8.0.35, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_in_ds
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `label` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `category_user_user_id_fk` (`user_id`),
  CONSTRAINT `category_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,'Default','success'),(2,1,'Business','warning'),(3,1,'Leisure','info'),(4,1,'Family','danger'),(5,1,'Formula 1','primary');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `federal_states`
--

DROP TABLE IF EXISTS `federal_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `federal_states` (
  `federal_state_id` varchar(2) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`federal_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `federal_states`
--

LOCK TABLES `federal_states` WRITE;
/*!40000 ALTER TABLE `federal_states` DISABLE KEYS */;
INSERT INTO `federal_states` VALUES ('AT','Austria'),('B','Burgenland'),('C','Carinthia'),('LA','Lower Austria'),('S','Salzburg'),('ST','Styria'),('T','Tyrol'),('UA','Upper Austria'),('V','Vienna'),('VO','Voralberg');
/*!40000 ALTER TABLE `federal_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `friend` (
  `friend_id` int NOT NULL AUTO_INCREMENT,
  `main_user_id` int NOT NULL,
  `friend_user_id` int NOT NULL,
  PRIMARY KEY (`friend_id`),
  KEY `friend_user_user_id_fk` (`main_user_id`),
  KEY `friend_user_user_id_fk2` (`friend_user_id`),
  CONSTRAINT `friend_user_user_id_fk` FOREIGN KEY (`main_user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `friend_user_user_id_fk2` FOREIGN KEY (`friend_user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (1,1,2),(11,1,3);
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal`
--

DROP TABLE IF EXISTS `goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal` (
  `goal_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `goaltype_id` varchar(255) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `category_id` int NOT NULL,
  `friends` json DEFAULT NULL,
  `is_percentage` tinyint(1) DEFAULT '1',
  `coverNr` int DEFAULT NULL,
  `cover_obj_id` varchar(3) DEFAULT NULL,
  `countNr` int DEFAULT NULL,
  `count_obj_id` varchar(3) DEFAULT NULL,
  `federal_state_id` varchar(2) DEFAULT 'AT',
  `price` float DEFAULT NULL,
  `predef_goal_id` int DEFAULT NULL,
  `progress` int DEFAULT '73',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`goal_id`),
  KEY `goal_category_category_id_fk` (`category_id`),
  KEY `goal_federal_states_federal_state_id_fk` (`federal_state_id`),
  KEY `goal_goaltype_goaltype_id_fk` (`goaltype_id`),
  KEY `goal_predefined_goal_predef_goal_id_fk` (`predef_goal_id`),
  KEY `goal_goal_obj_obj_id_fk` (`cover_obj_id`),
  KEY `goal_goal_obj_obj_id_fk2` (`count_obj_id`),
  KEY `goal_user_user_id_fk` (`user_id`),
  CONSTRAINT `goal_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `goal_federal_states_federal_state_id_fk` FOREIGN KEY (`federal_state_id`) REFERENCES `federal_states` (`federal_state_id`),
  CONSTRAINT `goal_goal_obj_obj_id_fk` FOREIGN KEY (`cover_obj_id`) REFERENCES `goal_obj` (`obj_id`),
  CONSTRAINT `goal_goal_obj_obj_id_fk2` FOREIGN KEY (`count_obj_id`) REFERENCES `goal_obj` (`obj_id`),
  CONSTRAINT `goal_goaltype_goaltype_id_fk` FOREIGN KEY (`goaltype_id`) REFERENCES `goaltype` (`goaltype_id`),
  CONSTRAINT `goal_predefined_goal_predef_goal_id_fk` FOREIGN KEY (`predef_goal_id`) REFERENCES `predefined_goal` (`predef_goal_id`),
  CONSTRAINT `goal_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal`
--

LOCK TABLES `goal` WRITE;
/*!40000 ALTER TABLE `goal` DISABLE KEYS */;
INSERT INTO `goal` VALUES (41,1,'price',NULL,NULL,2,'[]',1,0,'',0,'','AT',100,1,96,'2025-01-28 17:16:28',NULL),(42,1,'price','2025-01-01 00:00:00','2025-01-31 00:00:00',2,'[]',1,0,'',0,'','AT',100,1,128,'2025-01-28 17:16:46',NULL),(43,1,'price','2025-01-01 00:00:00','2025-01-31 00:00:00',2,'[\"lando_user\"]',1,0,'',0,'','AT',100,1,48,'2025-01-28 17:17:04',NULL),(44,1,'quant','2025-01-01 00:00:00','2025-01-31 00:00:00',4,'[\"fernando_user\"]',1,0,'',100,'s','C',0,1,117,'2025-01-28 17:22:04',NULL),(45,1,'quant','2025-01-01 00:00:00','2025-01-31 00:00:00',4,'[\"lando_user\"]',1,0,'',100,'trk','LA',0,1,1,'2025-01-28 17:22:39',NULL),(46,1,'quant','2025-01-01 00:00:00','2025-01-31 00:00:00',4,'[]',1,0,'',100,'t','B',0,1,107,'2025-01-28 17:23:01',NULL),(47,1,'predef','2025-01-22 00:00:00','2025-02-09 00:00:00',1,'[\"fernando_user\", \"lando_user\"]',1,0,'',0,'','AT',0,1,81,'2025-01-28 17:24:35',NULL),(48,1,'predef','2025-01-23 00:00:00','2025-01-29 00:00:00',5,'[]',1,0,'',0,'','AT',0,2,84,'2025-01-28 17:25:17',NULL),(49,1,'cover',NULL,NULL,3,'[]',1,60,'s',0,'','ST',0,1,24,'2025-01-28 17:25:41',NULL),(50,1,'cover','2025-01-16 00:00:00','2025-01-31 00:00:00',1,'[\"fernando_user\"]',0,15,'trk',0,'','T',0,1,41,'2025-01-28 17:28:50',NULL),(51,1,'predef',NULL,NULL,1,'[]',1,0,'',0,'','AT',0,4,7,'2025-01-28 17:34:14',NULL),(52,1,'predef','2025-01-14 00:00:00',NULL,2,'[\"lando_user\"]',1,0,'',0,'','AT',0,5,42,'2025-01-28 17:34:23',NULL),(53,1,'predef',NULL,'2025-01-16 00:00:00',4,'[\"max_user\"]',1,0,'',0,'','AT',0,1,38,'2025-01-28 17:34:43',NULL),(54,1,'predef','2025-01-22 00:00:00','2025-01-22 00:00:00',5,'[\"max_user\"]',1,0,'',0,'','AT',0,4,65,'2025-01-28 17:35:11',NULL);
/*!40000 ALTER TABLE `goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goal_obj`
--

DROP TABLE IF EXISTS `goal_obj`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goal_obj` (
  `obj_id` varchar(3) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coverBool` tinyint(1) DEFAULT '1',
  `countBool` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`obj_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goal_obj`
--

LOCK TABLES `goal_obj` WRITE;
/*!40000 ALTER TABLE `goal_obj` DISABLE KEYS */;
INSERT INTO `goal_obj` VALUES ('','none',1,1),('s','Stations',1,1),('t','Trips',0,1),('trk','Train Route Kilometres',1,1);
/*!40000 ALTER TABLE `goal_obj` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `goaltype`
--

DROP TABLE IF EXISTS `goaltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `goaltype` (
  `goaltype_id` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `federal_state` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`goaltype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `goaltype`
--

LOCK TABLES `goaltype` WRITE;
/*!40000 ALTER TABLE `goaltype` DISABLE KEYS */;
INSERT INTO `goaltype` VALUES ('cover','Coverage goal',1),('predef','Predefined goal',0),('price','Price target',0),('quant','Quantitative goal',1);
/*!40000 ALTER TABLE `goaltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `klimaticket_info`
--

DROP TABLE IF EXISTS `klimaticket_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `klimaticket_info` (
  `user_id` int NOT NULL,
  `special` tinyint(1) NOT NULL DEFAULT '0',
  `costClassic` int DEFAULT '1095',
  `costSpecial` int DEFAULT '821',
  `created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  KEY `klimaticket_info_user_user_id_fk` (`user_id`),
  CONSTRAINT `klimaticket_info_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `klimaticket_info`
--

LOCK TABLES `klimaticket_info` WRITE;
/*!40000 ALTER TABLE `klimaticket_info` DISABLE KEYS */;
INSERT INTO `klimaticket_info` VALUES (1,0,1095,821,'2025-01-20 23:04:19','2025-01-26 19:46:40');
/*!40000 ALTER TABLE `klimaticket_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `predefined_goal`
--

DROP TABLE IF EXISTS `predefined_goal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `predefined_goal` (
  `predef_goal_id` int NOT NULL AUTO_INCREMENT,
  `label` varchar(255) NOT NULL,
  PRIMARY KEY (`predef_goal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predefined_goal`
--

LOCK TABLES `predefined_goal` WRITE;
/*!40000 ALTER TABLE `predefined_goal` DISABLE KEYS */;
INSERT INTO `predefined_goal` VALUES (1,'visit all federal states'),(2,'visit all state capitals'),(3,'visit capital city Vienna'),(4,'visit the north-/east-/south-/west-most station in Austria'),(5,'visit routes along rivers');
/*!40000 ALTER TABLE `predefined_goal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `trip_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `date` datetime NOT NULL,
  `from` varchar(255) NOT NULL,
  `to` varchar(255) NOT NULL,
  `stops` json NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `distance` int NOT NULL,
  `price` float DEFAULT NULL,
  `category_id` int NOT NULL,
  `friends` json DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`trip_id`),
  KEY `trip_user_user_id_fk` (`user_id`),
  KEY `trip_category_category_id_fk` (`category_id`),
  CONSTRAINT `trip_category_category_id_fk` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`),
  CONSTRAINT `trip_user_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trip`
--

LOCK TABLES `trip` WRITE;
/*!40000 ALTER TABLE `trip` DISABLE KEYS */;
INSERT INTO `trip` VALUES (32,1,'2024-12-31 00:00:00','at-43-4639','at-43-4639','[\"at-42-2131\", \"at-42-3628\", \"at-48-1405\", \"at-46-1858\"]','',99,79,1,1,'[]','2025-01-28 17:17:45',NULL),(33,1,'2024-12-31 00:00:00','at-41-5969','at-48-454','[\"at-43-7094\", \"at-43-5255\", \"at-47-1205\", \"at-44-43530\", \"at-46-7112\", \"at-43-3655\"]','',12,72,5,2,'[]','2025-01-28 17:18:05',NULL),(34,1,'2025-01-01 00:00:00','at-43-5210','at-41-5969','[\"at-44-41900\", \"AT-81090288\"]','',3,37,150,2,'[\"lando_user\"]','2025-01-28 17:18:29',NULL),(35,1,'2025-01-01 00:00:00','at-43-5210','at-48-1377','[\"at-49-1003\", \"at-42-3811\", \"at-44-44020\", \"at-42-3813\"]','',14,98,5,2,'[\"lando_user\", \"fernando_user\"]','2025-01-28 17:21:02',NULL),(36,1,'2025-01-16 00:00:00','at-44-43934','at-43-8761','[\"at-43-8757\", \"at-43-7117\", \"at-46-7472\", \"at-42-3823\"]','',8,26,50,4,'[\"fernando_user\", \"lando_user\"]','2025-01-28 17:23:32',NULL);
/*!40000 ALTER TABLE `trip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'raso_username73','Daniel','Raso','danielraso@gmail.com','myNotSoSavePwd','2024-11-22 22:43:43',NULL),(2,'lando_user','Lando','Norris','norris@gmail.com','blabla','2025-01-20 23:03:51',NULL),(3,'fernando_user','Fernando','Alonso','alo@yahoo.com','blabla','2025-01-20 23:03:51',NULL),(4,'lewis_user','Lewis','Hamilton','ham@gmx.com','blabla','2025-01-20 23:03:51',NULL),(5,'max_user','Max','Verstappen','max@red.com','blabla','2025-01-22 12:31:56',NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'project_in_ds'
--
/*!50003 DROP PROCEDURE IF EXISTS `addCategory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `addCategory`(in_label varchar(255), in_color varchar(255))
begin
    declare rows_affected int;

    insert into category
        (user_id, label, color)
    values (1, in_label, in_color);

    set rows_affected = row_count();

    select if(rows_affected > 0, 'OK', 'error') as message
      from dual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addFriend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `addFriend`(in_username varchar(255))
begin
    declare rows_affected int;
    declare v_friend_user_id int;
    declare v_already_friend boolean;

    select user_id
      into v_friend_user_id
      from user
     where username = in_username;

    if v_friend_user_id is null then
        select concat('ERROR: user with username "', in_username, '" does not exist.') as message
            from dual;
    else
        select 1
          into v_already_friend
          from friend
         where main_user_id = 1
           and friend_user_id = v_friend_user_id;

        if v_already_friend then
            select concat('ERROR: user with username "', in_username, '" already in friends list.') as message
                from dual;
        else
            insert into friend
                (main_user_id, friend_user_id)
            values (1, v_friend_user_id);

            set rows_affected = row_count();

            select if(rows_affected > 0, 'OK', 'error?!?!') as message
              from dual;
        end if;
    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addGoal` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `addGoal`(IN in_goaltype_id varchar(255), IN in_startDate varchar(255),
                                                       IN in_endDate varchar(255), IN in_friends varchar(255),
                                                       IN in_category_id int, IN in_is_percentage tinyint(1),
                                                       IN in_coverNumber int, IN in_cover_obj_id varchar(3),
                                                       IN in_countNumber int, IN in_count_obj_id varchar(3),
                                                       IN in_federal_state_id varchar(2), IN in_price decimal(10, 2),
                                                       IN in_predef_goal_id int)
begin
    declare rows_affected int;

    insert into goal
        (user_id, goaltype_id, start_date, end_date, category_id, friends, is_percentage,
         coverNr, cover_obj_id, countNr, count_obj_id, federal_state_id, price, predef_goal_id, progress)
    values (1, in_goaltype_id, in_startDate, in_endDate, in_category_id, in_friends, in_is_percentage,
            if(in_coverNumber > 100, floor(rand() * 100), in_coverNumber), in_cover_obj_id, in_countNumber, in_count_obj_id, in_federal_state_id, in_price, in_predef_goal_id,
            floor(rand() * 151));

    set rows_affected = row_count();

    select if(rows_affected > 0, 'OK', 'error?!?!') as message
      from dual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `addTrip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `addTrip`(
    in_date varchar(255),
    in_from varchar(255),
    in_to varchar(255),
    in_stops varchar(255),
    in_description varchar(255),
    in_duration int,
    in_distance int,
    in_price decimal(10,2),
    in_category_id int,
    in_friends varchar(255))
begin
    declare rows_affected int;

    insert into trip
        (user_id, `date`, `from`, `to`, stops, description, duration, distance, price, category_id, friends)
    values (1, in_date, in_from, in_to, in_stops, in_description, in_duration, in_distance, in_price, in_category_id, in_friends);

    set rows_affected = row_count();

    select if(rows_affected > 0, 'OK', 'error?!?!') as message
      from dual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteFriend` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `deleteFriend`(in_friend_user_id int)
begin
    declare rows_affected int;

    delete from friend
     where main_user_id = 1
       and friend_user_id = in_friend_user_id;

    set rows_affected = row_count();

    select if(rows_affected > 0, 'OK', 'ERROR: user was not in friends list.') as message
      from dual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `deleteTrip` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `deleteTrip`(IN in_trip_id int)
begin
    declare rows_affected int;

    delete from trip
     where trip_id = in_trip_id;

    set rows_affected = row_count();

    select if(rows_affected > 0, 'OK', 'ERROR: trip did not exist.') as message
      from dual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCategories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `getCategories`()
begin
    select c.category_id as id,
           c.label,
           c.color,
           count(t.trip_id) as tripCount,
           ifnull(sum(t.duration), 0) as totalDuration,
           ifnull(sum(t.distance), 0) as totalDistance
      from category c
        left join trip t on c.category_id = t.category_id
     where c.user_id = 1
     group by c.category_id, c.label, c.color, c.user_id
     order by tripCount desc, totalDuration desc;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getDashboardInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `getDashboardInfo`()
begin
    select ifnull(sum(price), 0.00) as totalTravelCost
      from trip
     where user_id = 1
       and price is not null;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getFriends` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `getFriends`()
begin
    select u.user_id as id,
           u.username,
           u.firstname,
           u.lastname
      from friend f
        left join user u on f.friend_user_id = u.user_id
     where f.main_user_id = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getGoals` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `getGoals`()
begin
    select g.goal_id as id,
           g.goaltype_id as goalType,
           if(g.goaltype_id = 'predef', (select pg.label
                                           from predefined_goal pg
                                          where g.predef_goal_id = pg.predef_goal_id),
              if(g.goaltype_id = 'price', concat('travel for ', format(g.price, 2), '€ worth of tickets'), 
              if(g.goaltype_id = 'quant', concat(if(g.count_obj_id = 's', 'reach ', if(g.count_obj_id = 't', 'do ', 'travel for ')), 
                                                    g.countNr,
                                                    ' ',
                                                 (select go.label from goal_obj go where g.count_obj_id = go.obj_id)),
              /*cover*/concat(if(g.cover_obj_id = 's', 'visit ', /*trk*/ 'drive on '),
                                g.coverNr,
                                '% of ',
                             (select go.label from goal_obj go where g.cover_obj_id = go.obj_id))))) as description,
           date_format(g.start_date, '%Y-%m-%d') as startDate,
           date_format(g.end_date, '%Y-%m-%d') as endDate,
           fs.label as federalState,
           c.label as category,
           c.color as categoryColor,
           g.friends,
           if(g.goaltype_id = 'cover' or g.goaltype_id = 'predef', g.progress,
              if(g.goaltype_id = 'price', (select ifnull(floor(sum(t.price) / g.price * 100), 0)
                                             from trip t
                                            where t.category_id = g.category_id
                                              and t.user_id = g.user_id
                                              and t.date between COALESCE(g.start_date, '1900-01-01') and COALESCE(g.end_date, '9999-12-31')
                                              and not exists (
                                                  select 1
                                                    from json_table(g.friends,
                                                                '$[*]' columns(friend varchar(255) path '$')) goal_friends
                                                   where json_search(t.friends, 'one', goal_friends.friend) is null
                                              )),
                  /*count*/(select ifnull(floor(if(g.count_obj_id = 'trk', sum(t.distance),
                                                if(g.count_obj_id = 't', count(*),
                                                /*s*/sum(json_length(t.stops)) + 2)) / g.countNr * 100), 0)
                             from trip t
                            where t.category_id = g.category_id
                              and t.user_id = g.user_id
                              and t.date between COALESCE(g.start_date, '1900-01-01') and COALESCE(g.end_date, '9999-12-31')
                              and not exists (
                                  select 1
                                    from json_table(g.friends,
                                                '$[*]' columns(friend varchar(255) path '$')) goal_friends
                                   where json_search(t.friends, 'one', goal_friends.friend) is null
                              )))) as progress
      from goal g
        left join category c on g.category_id = c.category_id
        left join federal_states fs on g.federal_state_id = fs.federal_state_id
     where g.user_id = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getKlimaticketInfo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `getKlimaticketInfo`()
begin
    select costClassic as klimaticketCostClassic,
           costSpecial as klimaticketCostSpecial,
           special as klimaticketType
      from klimaticket_info
     where user_id = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getTrips` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `getTrips`()
begin
    select t.trip_id as id,
           t.from,
           t.to,
           date_format(t.date, '%Y-%m-%d') as date,
           t.duration,
           t.distance,
           t.price,
           c.label as category,
           c.color as categoryColor,
           t.description,
           t.stops,
           t.friends
      from trip t
        left join category c on t.category_id = c.category_id
     where t.user_id = 1;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `updateKlimaticketType` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`project_user`@`localhost` PROCEDURE `updateKlimaticketType`(IN in_special tinyint(1))
begin
    declare rows_affected int;

    update klimaticket_info
       set special = in_special,
           modified = current_timestamp()
     where user_id = 1;

    set rows_affected = row_count();

    select if(rows_affected > 0, 'OK', 'error?!?!') as message
      from dual;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-30 21:39:18
