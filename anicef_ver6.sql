-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: anicef
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_id` varchar(255) NOT NULL,
  `admin_pw` varchar(255) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin1','1234');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `animal`
--

DROP TABLE IF EXISTS `animal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `animal` (
  `id` int NOT NULL,
  `species` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(255) NOT NULL,
  `age` int NOT NULL,
  `date` date NOT NULL,
  `ox` varchar(255) NOT NULL,
  `health` text NOT NULL,
  `local` varchar(255) NOT NULL,
  `main_image` varchar(255) NOT NULL,
  `sub_image` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `animal`
--

LOCK TABLES `animal` WRITE;
/*!40000 ALTER TABLE `animal` DISABLE KEYS */;
INSERT INTO `animal` VALUES (1,'dog','차차','남',1,'2022-11-11','o','좋음','김해','dog1.jpg','1','정말 귀여운 친구입니다. '),(2,'dog','요르','여',2,'2022-12-11','x','보통','부산','dog2.jpg','2','조금 귀여운 친구입니다.'),(3,'dog','츄르','남',3,'2021-08-01','x','좋음','서울','dog3.jpg','3','입질이 살짝 있지만 사랑스러워요'),(4,'dog','만복','여',1,'2023-10-11','o','보통','부산','dog4.jpg','4','간식을 좋아합니다.'),(5,'dog','설규','남',2,'2023-01-11','x','좋음','강원도','dog5.jpg','5','사람을 좋아합니다.'),(6,'dog','쫀득','여',3,'2023-02-22','x','좋음','강원도','dog6.jpg','6','산책을 좋아합니다.'),(7,'dog','팡팡','남',4,'2023-05-06','x','좋음','울산','dog7.jpg','7','장난감을 좋아합니다.'),(8,'dog','비비','여',2,'2023-04-08','o','좋음','강원도','dog8.jpg','8','음식을 가립니다'),(9,'cat','공주','여',1,'2023-04-11','x','보통','강원도','cat1.jpg','9','츄르를 좋아합니다.'),(10,'cat','왕자','여',1,'2023-04-11','x','좋음','강원도','cat2.jpg','10','장난감을 좋아합니다.'),(11,'cat','찌미','남',2,'2022-11-12','x','좋음','부산','cat3.jpg','11','츄르를 좋아합니다.'),(12,'cat','절미','여',1,'2022-12-05','x','좋음','부산','cat4.jpg','12','사람을 좋아합니다.'),(13,'cat','짱구','여',2,'2022-07-11','o','다래끼','강원도','cat5.jpg','13','음식을 가립니다'),(14,'cat','짱아','남',2,'2023-04-11','o','좋음','부산','cat6.jpg','14','음식을 가립니다'),(15,'cat','맹구','여',2,'2022-08-11','o','보통','서울','cat7.jpg','15','장난감을 좋아합니다.'),(16,'cat','뾰뾰','여',2,'2023-01-11','o','보통','서울','cat8.jpg','16','장난감을 좋아합니다.'),(17,'other','도치','남',2,'2022-08-11','x','보통','서울','other1.jpg','17','애교가 많아요.'),(18,'other','가시','여',1,'2022-08-11','x','좋음','여수','other2.jpg','18','장난감을 좋아합니다.'),(19,'other','뾰족','남',2,'2023-11-01','x','설사','경주','other3.jpg','19','장난감을 좋아합니다.'),(20,'other','햄스','여',2,'2022-08-11','x','좋음','남해','other4.jpg','20','음식을 가립니다'),(21,'other','빵돌','남',1,'2023-11-30','x','눈물자국','부산','other5.jpg','21','음식을 가립니다'),(22,'other','돌쇠','여',1,'2023-11-30','o','좋음','부산','other6.jpg','22','음식을 가립니다'),(23,'other','마님','남',2,'2023-12-31','o','보통','부산','other7.jpg','23','배변을 가려요.'),(24,'other','왕비','남',2,'2023-12-31','o','보통','서울','other8.jpg','24','배변을 가려요.');
/*!40000 ALTER TABLE `animal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `answer_id` int NOT NULL AUTO_INCREMENT,
  `qna_id` int NOT NULL,
  `admin_id` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `answer_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `state` varchar(255) NOT NULL DEFAULT '대기중',
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (1,1,'admin1','답변1입니다.','2023-10-11 17:24:35','답변완료'),(2,2,'admin1','답변2입니다.','2023-10-12 11:28:29','답변완료');
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `local` varchar(255) NOT NULL,
  `booking_name` varchar(255) NOT NULL,
  `book_date` date NOT NULL,
  `book_time` time NOT NULL,
  `text` text,
  `state` varchar(255) DEFAULT '예약완료',
  `bookingAvailable` int DEFAULT '1',
  PRIMARY KEY (`booking_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'test','부산','고양','2023-01-01','11:00:00',NULL,'방문완료',1),(2,'test','서울','고양','2023-02-02','12:00:00',NULL,'방문완료',1),(3,'test','부산','고양','2023-10-18','00:00:04','설명','예약완료',1),(4,'test','부산','고양','2023-10-12','00:00:04','설명','예약완료',1),(5,'test','부산','고양','2023-10-18','00:00:03','설명','예약완료',1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `info`
--

DROP TABLE IF EXISTS `info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `info` (
  `info_id` int NOT NULL AUTO_INCREMENT,
  `info_title` varchar(255) NOT NULL,
  `info_text` text NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `admin_id` varchar(255) NOT NULL,
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `info`
--

LOCK TABLES `info` WRITE;
/*!40000 ALTER TABLE `info` DISABLE KEYS */;
INSERT INTO `info` VALUES (1,'공지사항1','공지사항1입니다.','2023-10-11 12:50:05','admin1'),(2,'공지사항2','공지사항2입니다.','2023-10-11 14:53:19','admin1'),(29,'테스트','테스트테스트테스트','2023-10-13 15:48:54','admin1');
/*!40000 ALTER TABLE `info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int NOT NULL,
  `stock` int NOT NULL,
  `main_image` varchar(255) NOT NULL,
  `sub_image` varchar(255) DEFAULT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES ('1','습식사료',12000,100,'item1.jpg','1','변이 단단한 동물들에게  추천드립니다. '),('2','츄르',10000,100,'item2.jpg','1','고양이들의 갓템'),('3','배변패드',12000,100,'item3.jpg','1','여기 아님 안쌈 '),('4','켄넬',13000,100,'item4.jpg','1','이동장입니다.'),('5','개껌',14000,100,'item5.jpg','1','치석제거용으로 탁월합니다.'),('6','치약',12000,100,'item6.jpg','1','입냄새는 이걸로 끝'),('7','칫솔',8000,100,'item7.jpg','1','잇몸이 덜 아파요'),('8','햄스터집',7000,100,'item8.jpg','1','햄스터만의 공간을 선사하세요');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_id` int NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `item_id` varchar(255) NOT NULL,
  `item_amount` int NOT NULL,
  `state` varchar(255) DEFAULT '구매완료',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `animal_id` int NOT NULL,
  `title` varchar(255) DEFAULT '제목없음',
  `name` varchar(255) NOT NULL,
  `date` datetime DEFAULT CURRENT_TIMESTAMP,
  `question` text NOT NULL,
  `file` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,1234,'강아지입양','펭수','2023-10-11 15:52:22','강아지 입양절차가 어떻게되나요?',NULL),(2,1235,'고양이입양','펭수','2023-10-12 10:34:31','고양이가 너무 귀여워요',NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` date DEFAULT NULL,
  `pw` varchar(255) NOT NULL,
  `ph` varchar(255) NOT NULL,
  `ad` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('test','홍길동','1990-10-10','1234','010-1234-1234','부산광역시 부산진구');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 16:43:57
