-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: tubes_rpll
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int DEFAULT NULL,
  `pinNum` varchar(4) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (7,'budi@hotmail.com','qwerty',0,'1234','budi'),(8,'Chandra@hotmail.com','qwerty',2,'1234','Chandra'),(9,'michael@gmail.com','123',2,'1234','michael'),(10,'steve@email.com','qwerty123',2,'1234','steve'),(11,'brain@email.com','qwerty1234',2,'1234','brian'),(12,'randy@email.com','123',2,'1234','randy'),(13,'will@gmail.com','qwerty',0,'0000','william'),(14,'aqbil@email.com','qwe123',2,'0000','Aqbil'),(15,'devid@email.com','qwe123',2,'0000','David'),(16,'admin@admin.com','admin',0,'0000','Andre'),(17,'wil@w.c','1234',2,'0000','william'),(18,'michael@m.com','qwer',2,'0000','michael'),(19,'member@member.com','member',2,'1234','Moana'),(20,'admin2@admin.com','admin',0,'0000','Aminsana');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `example`
--

DROP TABLE IF EXISTS `example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `example` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `example`
--

LOCK TABLES `example` WRITE;
/*!40000 ALTER TABLE `example` DISABLE KEYS */;
INSERT INTO `example` VALUES (1,'Andre'),(2,'Bruce'),(3,'Chandra'),(4,'Dennis'),(5,'Erly'),(6,'Firhat');
/*!40000 ALTER TABLE `example` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `id` int NOT NULL,
  `wallet` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `member_ibfk_1` FOREIGN KEY (`id`) REFERENCES `account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,60000),(15,740000),(17,0),(18,140000),(19,277500),(20,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(8192) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `poster_img_path` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'Superman','Film ini menyoroti pergulatan batin Clark Kent yang mencoba menyeimbangkan identitasnya sebagai pria biasa yang bekerja sebagai reporter di Smallville, Kansas, dan sebagai alien dari planet Krypton yang dianugerahi kekuatan luar biasa.',127,'superman.png',1),(2,'Sinners','Film ini mengisahkan tentang saudara kembar bernama Smoke dan Stack, yang keduanya diperankan oleh Michael B Jordan. Smoke dan Stack adalah veteran Perang Dunia I sekaligus mantan gangster asal Chicago.',137,'sinners.png',1),(3,'Fantastic Four','Fantastic 4 mengisahkan keluarga pertama Marvel dalam film MCU pertama mereka sejak 10 tahun yang lalu, di bintangi oleh Pedro Pascal, Vanessa Kirby, Joseph Quinn, dan Ebon Moss-Bachrach. Mereka akan melawan Galactus',124,'fantastic_four.png',1),(4,'Mission Impossible: Final Reckoning','Misi anda jika ingin menerima. Ethan kembali lagi dalam petualangannya yang menegangkan. Dikerjar oleh sebuah entitas bernama The Entity dia harus mencari tahu siapa dibaliknya dan menyelamatkan dunia lagi.',159,'mission_impossible-final_reckoning.png',1),(5,'Jurassic World: Rebirth','Kembali lagi ke dunia Jurassic, Sebuah tim akan pergi ke pulau terkutuk itu untuk menemukan spesimen baru, tapi sayangnya mereka menemukan bahwa ada eksperimen yang dilakukan pada dinosaurus ini dan mencoba memecahkan misi',140,'jurassic_world_rebirth.png',1),(12,'Final Destination: New Bloodlines','The narrative revolves around a college student plagued by recurring violent nightmares. She returns home to uncover the truth behind her family\'s dark past and to find a way to break the cycle of death that threatens them. The film explores tragedies from the grandmother\'s past, making the story darker and more personal compared to previous installments.',110,'final_destination-_new_bloodlines.png',1),(13,'Paddington: in Peru','Paddington returns to Peru to visit his beloved Aunt Lucy, who now resides at the Home for Retired Bears. With the Brown family in tow, a thrilling adventure ensues when a mystery plunges them into an unexpected journey.',106,'paddington-_in_peru.png',1),(14,'Spider-Man: Across the Spider-Verse','In \"Spider-Man: Across the Spider-Verse,\" Miles Morales embarks on an adventure with Gwen Stacy across the multiverse, where he encounters a new team of Spider-People known as the Spider-Society, led by Miguel O\'Hara (Spider-Man 2099). However, a conflict arises over how to handle a new threat posed by the villain known as the Spot. As the multiverse becomes unstable, Miles finds himself at a crossroads, navigating the challenges of being a hero while dealing with personal struggles.',140,'spider-man-_across_the_spider-verse.png',1);
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genre` (
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (1,1),(1,2),(1,8),(1,9),(2,1),(2,7),(2,11),(2,17),(2,19),(3,1),(3,2),(3,8),(3,9),(3,15),(4,1),(4,2),(4,5),(5,2),(5,9),(5,13),(5,17),(6,1),(6,4),(6,5),(6,7),(6,11),(6,13),(6,17),(7,1),(7,4),(7,5),(7,7),(7,11),(7,13),(7,17),(8,1),(8,4),(8,5),(8,11),(8,13),(8,17),(9,1),(9,4),(9,5),(9,7),(9,11),(9,13),(9,17),(10,1),(10,4),(10,5),(10,7),(10,11),(10,13),(10,17),(11,1),(11,3),(11,5),(11,7),(11,13),(11,15),(12,1),(12,3),(12,5),(12,7),(12,13),(12,15),(13,1),(13,2),(13,4),(13,7),(13,8),(13,9),(13,12),(14,1),(14,3),(14,4),(14,8),(14,9),(14,15);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showing`
--

DROP TABLE IF EXISTS `showing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showing` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `studio_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `studio_id` (`studio_id`),
  CONSTRAINT `showing_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `showing_ibfk_2` FOREIGN KEY (`studio_id`) REFERENCES `studio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showing`
--

LOCK TABLES `showing` WRITE;
/*!40000 ALTER TABLE `showing` DISABLE KEYS */;
INSERT INTO `showing` VALUES (1,1,'2025-07-11 10:30:00','2025-07-11 13:00:00',1),(2,1,'2025-07-11 13:30:00','2025-07-11 16:00:00',1),(3,1,'2025-07-11 16:30:00','2025-07-11 19:00:00',1),(4,1,'2025-07-11 19:30:00','2025-07-11 21:00:00',1),(5,1,'2025-07-11 13:00:00','2025-07-11 15:30:00',2),(6,1,'2025-07-11 16:00:00','2025-07-11 18:30:00',2),(7,1,'2025-07-11 19:00:00','2025-07-11 20:30:00',2),(8,2,'2025-07-11 10:30:00','2025-07-11 13:00:00',3),(9,2,'2025-07-11 13:30:00','2025-07-11 16:00:00',3),(10,3,'2025-07-11 16:30:00','2025-07-11 19:00:00',3),(11,3,'2025-07-11 19:30:00','2025-07-11 21:00:00',3),(12,1,'2025-07-12 10:00:00','2025-07-12 10:00:00',1),(14,1,'2025-05-29 08:30:00','2025-05-29 11:00:00',1),(15,1,'2025-05-29 09:30:00','2025-05-29 12:00:00',1),(16,4,'2025-05-29 12:30:00','2025-05-29 15:30:00',1),(17,4,'2025-05-29 16:00:00','2025-05-29 18:00:00',1),(18,4,'2025-05-29 18:30:00','2025-05-29 20:30:00',1),(19,4,'2025-05-29 12:30:00','2025-05-29 15:30:00',2),(20,4,'2025-05-29 16:00:00','2025-05-29 18:00:00',2),(21,4,'2025-05-29 18:30:00','2025-05-29 20:30:00',2),(22,4,'2025-05-30 12:30:00','2025-05-29 15:30:00',1),(23,4,'2025-05-30 16:00:00','2025-05-29 18:00:00',1),(24,4,'2025-05-30 18:30:00','2025-05-29 20:30:00',1),(25,4,'2025-05-30 12:30:00','2025-05-29 15:30:00',2),(26,4,'2025-05-30 16:00:00','2025-05-29 18:00:00',2),(27,4,'2025-05-30 18:30:00','2025-05-29 20:30:00',2),(28,4,'2025-05-31 12:30:00','2025-05-29 15:30:00',1),(29,4,'2025-05-31 16:00:00','2025-05-29 18:00:00',1),(30,4,'2025-05-31 18:30:00','2025-05-29 20:30:00',1),(31,4,'2025-05-31 12:30:00','2025-05-29 15:30:00',2),(32,4,'2025-05-31 16:00:00','2025-05-29 18:00:00',2),(33,4,'2025-05-31 18:30:00','2025-05-29 20:30:00',2),(34,4,'2025-06-01 12:30:00','2025-05-29 15:30:00',1),(35,4,'2025-06-01 16:00:00','2025-05-29 18:00:00',1),(36,4,'2025-06-01 18:30:00','2025-05-29 20:30:00',1),(37,4,'2025-06-01 12:30:00','2025-05-29 15:30:00',2),(38,4,'2025-06-01 16:00:00','2025-05-29 18:00:00',2),(39,4,'2025-06-01 18:30:00','2025-05-29 20:30:00',2),(40,4,'2025-06-02 12:30:00','2025-05-29 15:30:00',1),(41,4,'2025-06-02 16:00:00','2025-05-29 18:00:00',1),(42,4,'2025-06-02 18:30:00','2025-05-29 20:30:00',1),(43,4,'2025-06-02 12:30:00','2025-05-29 15:30:00',2),(44,4,'2025-06-02 16:00:00','2025-05-29 18:00:00',2),(45,4,'2025-06-02 18:30:00','2025-05-29 20:30:00',2),(46,4,'2025-06-03 12:30:00','2025-05-29 15:30:00',1),(47,4,'2025-06-03 16:00:00','2025-05-29 18:00:00',1),(48,4,'2025-06-03 18:30:00','2025-05-29 20:30:00',2),(49,4,'2025-06-04 12:30:00','2025-05-29 15:30:00',1),(50,4,'2025-06-04 16:00:00','2025-05-29 18:00:00',1),(51,4,'2025-06-04 18:30:00','2025-05-29 20:30:00',2),(52,5,'2025-06-10 12:30:00','2025-05-29 15:30:00',1),(53,5,'2025-06-10 16:00:00','2025-05-29 18:00:00',1),(54,5,'2025-06-10 18:30:00','2025-05-29 20:30:00',1),(55,13,'2025-05-31 14:30:00','2025-05-31 14:30:00',5),(56,12,'2025-05-31 11:30:00','2025-05-31 11:30:00',3),(57,14,'2025-05-31 11:30:00','2025-05-31 11:30:00',1),(58,14,'2025-06-02 18:30:00','2025-06-02 21:00:00',7);
/*!40000 ALTER TABLE `showing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studio`
--

DROP TABLE IF EXISTS `studio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `studio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `price_per_seat` float DEFAULT NULL,
  `row_count` int DEFAULT NULL,
  `column_count` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studio`
--

LOCK TABLES `studio` WRITE;
/*!40000 ALTER TABLE `studio` DISABLE KEYS */;
INSERT INTO `studio` VALUES (1,'Alpha',50000,4,8),(2,'Beta',30000,5,8),(3,'Charlie',30000,5,8),(4,'Delta',30000,5,8),(5,'Echo',20000,6,8),(6,'Francis',20000,6,8),(7,'Golf',20000,6,8);
/*!40000 ALTER TABLE `studio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trans_id` int DEFAULT NULL,
  `seat_name` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `trans_id` (`trans_id`),
  CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`trans_id`) REFERENCES `transaction_ticket` (`trans_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (17,8,'A1'),(18,8,'A2'),(19,8,'A3'),(20,8,'A4'),(21,9,'E1'),(22,9,'E2'),(23,9,'E3'),(24,9,'E4'),(25,10,'C2'),(26,10,'C3'),(27,10,'C4'),(28,13,'B6'),(29,14,'B6'),(30,20,'A1'),(31,21,'A3'),(32,21,'A4'),(33,21,'A5'),(34,21,'A6'),(35,22,'C4'),(36,22,'C5'),(37,23,'C4'),(38,23,'C5'),(39,24,'C4'),(40,24,'C5'),(41,25,'C4'),(42,25,'C5'),(43,26,'C4'),(44,26,'C5'),(45,27,'C4'),(46,27,'C5'),(47,28,'C4'),(48,28,'C5'),(49,29,'C4'),(50,29,'C5'),(51,30,'C4'),(52,30,'C5'),(53,31,'C4'),(54,31,'C5'),(55,32,'C4'),(56,32,'C5'),(57,33,'C4'),(58,33,'C5'),(59,34,'C4'),(60,34,'C5'),(61,35,'C4'),(62,35,'C5'),(63,36,'C4'),(64,36,'C5'),(65,37,'C4'),(66,37,'C5'),(67,38,'C4'),(68,38,'C5'),(69,39,'C4'),(70,39,'C5'),(71,40,'C4'),(72,40,'C5'),(73,41,'C4'),(74,41,'C5'),(75,42,'C4'),(76,42,'C5'),(77,43,'B5'),(78,44,'A4'),(79,44,'A5'),(80,45,'A4'),(81,45,'A5'),(82,46,'B4'),(83,46,'B5'),(84,47,'C3'),(85,47,'C4'),(86,47,'C5'),(87,47,'C6'),(88,48,'B4'),(89,48,'B5');
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nominal` float DEFAULT NULL,
  `member_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `member` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
INSERT INTO `transaction` VALUES (8,200000,7),(9,200000,7),(10,150000,8),(11,155000,7),(12,105000,8),(13,50000,15),(14,50000,15),(15,0,14),(16,0,14),(17,0,14),(18,0,14),(19,0,14),(20,30000,14),(21,200000,15),(22,60000,15),(23,60000,15),(24,60000,15),(25,60000,15),(26,60000,15),(27,60000,15),(28,60000,15),(29,60000,15),(30,60000,15),(31,60000,15),(32,60000,15),(33,60000,15),(34,60000,15),(35,60000,15),(36,60000,15),(37,60000,15),(38,60000,15),(39,60000,15),(40,60000,15),(41,60000,15),(42,60000,15),(43,50000,15),(44,60000,18),(45,100000,14),(46,40000,15),(47,80000,19),(48,60000,15);
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction_ticket`
--

DROP TABLE IF EXISTS `transaction_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_ticket` (
  `trans_id` int NOT NULL,
  `ticket_status` int DEFAULT NULL,
  `showing_id` int DEFAULT NULL,
  PRIMARY KEY (`trans_id`),
  KEY `showing_id` (`showing_id`),
  CONSTRAINT `transaction_ticket_ibfk_2` FOREIGN KEY (`showing_id`) REFERENCES `showing` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_ticket`
--

LOCK TABLES `transaction_ticket` WRITE;
/*!40000 ALTER TABLE `transaction_ticket` DISABLE KEYS */;
INSERT INTO `transaction_ticket` VALUES (8,0,2),(9,0,1),(10,0,2),(13,0,1),(14,0,1),(15,1,8),(16,1,8),(17,1,8),(18,1,4),(19,1,9),(20,1,7),(21,0,1),(22,0,8),(23,0,8),(24,0,8),(25,0,8),(26,0,8),(27,0,8),(28,0,8),(29,0,8),(30,0,8),(31,0,8),(32,0,8),(33,0,8),(34,0,8),(35,0,8),(36,0,8),(37,0,8),(38,0,8),(39,0,8),(40,0,8),(41,0,8),(42,0,8),(43,1,52),(44,0,8),(45,1,41),(46,0,55),(47,1,55),(48,1,9);
/*!40000 ALTER TABLE `transaction_ticket` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-30 18:41:51
