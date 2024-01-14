-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: saitpovene
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `записьнакурсы`
--

DROP TABLE IF EXISTS `записьнакурсы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `записьнакурсы` (
  `ИмяУченика` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ТелефонУченика` varchar(45) NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `записьнакурсы`
--

LOCK TABLES `записьнакурсы` WRITE;
/*!40000 ALTER TABLE `записьнакурсы` DISABLE KEYS */;
INSERT INTO `записьнакурсы` VALUES ('Анна','creidarecrohe@mail.com','+7 (937) 436-45-31'),('Анастасия','grimmaugraupano@mail.com','+7 (908) 587-30-54'),('Степан','matribexauddeu@yopmail.com','+7 (950) 107-55-35'),('Дмитрий','prodoballosse@mail.com','+7 (964) 846-43-49'),('Олег','zufovuddouci@mail.com','+7 (997) 446-27-21');
/*!40000 ALTER TABLE `записьнакурсы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `курсы`
--

DROP TABLE IF EXISTS `курсы`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `курсы` (
  `ДеятельностьКурса` varchar(50) NOT NULL,
  `ИмяМастера` varchar(45) NOT NULL,
  `ТелефонМастера` varchar(45) NOT NULL,
  `ИмяУченика` varchar(45) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ТелефонУченика` varchar(45) NOT NULL,
  `ДатаНачала` date NOT NULL,
  `ДатаОкончания` date NOT NULL,
  PRIMARY KEY (`Email`,`ИмяМастера`),
  KEY `ИмяМастера_idx` (`ИмяМастера`),
  CONSTRAINT `Email_fx` FOREIGN KEY (`Email`) REFERENCES `записьнакурсы` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ИмяМастера` FOREIGN KEY (`ИмяМастера`) REFERENCES `сотрудники` (`ИмяМастера`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `курсы`
--

LOCK TABLES `курсы` WRITE;
/*!40000 ALTER TABLE `курсы` DISABLE KEYS */;
INSERT INTO `курсы` VALUES ('Татуировка','Артем','+7 (952) 242-16-38','Анна','creidarecrohe@mail.com','+7 (937) 436-45-31','2024-01-15','2024-04-15'),('Татуировка','Сергей','+7 (988) 178-38-85','Анастасия','grimmaugraupano@mail.com','+7 (908) 587-30-54','2024-01-20','2024-04-20'),('Пирсинг','Мария','+7 (918) 396-60-97','Степан','matribexauddeu@yopmail.com','+7 (950) 107-55-35','2024-01-15','2024-04-15'),('Татуировка','Сергей','+7 (988) 178-38-85','Дмитрий','prodoballosse@mail.com','+7 (964) 846-43-49','2024-01-20','2024-04-20'),('Пирсинг','Мария','+7 (918) 396-60-97','Олег','zufovuddouci@mail.com','+7 (997) 446-27-21','2024-01-15','2024-04-15');
/*!40000 ALTER TABLE `курсы` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `окончательназапись`
--

DROP TABLE IF EXISTS `окончательназапись`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `окончательназапись` (
  `ИмяКлиента` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `ТелефонКлиента` varchar(45) NOT NULL,
  `ИмяМастера` varchar(45) NOT NULL,
  `ТелефонМастера` varchar(45) NOT NULL,
  `ДатаСеанса` date NOT NULL,
  `Услуга` varchar(45) NOT NULL,
  `ЦенаУслуги` int NOT NULL,
  `Товары` varchar(45) NOT NULL,
  `ЦенаТоваров` int NOT NULL,
  `ИтогЦена` int NOT NULL,
  `Предоплата` int NOT NULL,
  PRIMARY KEY (`ИмяМастера`,`Услуга`,`Товары`,`Email`),
  KEY `окончательназапись_ibfk_2` (`Услуга`),
  KEY `окончательназапись_ibfk_3` (`Товары`),
  KEY `Email_idx` (`Email`),
  CONSTRAINT `Email` FOREIGN KEY (`Email`) REFERENCES `предварительназапись` (`Email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `окончательназапись_ibfk_1` FOREIGN KEY (`ИмяМастера`) REFERENCES `сотрудники` (`ИмяМастера`),
  CONSTRAINT `окончательназапись_ibfk_2` FOREIGN KEY (`Услуга`) REFERENCES `услуги` (`Услуги`),
  CONSTRAINT `окончательназапись_ibfk_3` FOREIGN KEY (`Товары`) REFERENCES `товары` (`Товары`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `окончательназапись`
--

LOCK TABLES `окончательназапись` WRITE;
/*!40000 ALTER TABLE `окончательназапись` DISABLE KEYS */;
INSERT INTO `окончательназапись` VALUES ('Василий','preprenoumoijo-7154@mail.com','+7 (965) 992-85-81','Артем','+7 (952) 242-16-38','2024-01-07','Надписи и миниатюры',3500,'Doctor PRO',450,3950,1500),('Георгий','gallerittouss@mail.com','+7 (992) 243-21-18','Артем','+7 (952) 242-16-38','2024-01-06','Средний сеанс',15000,'Doctor PRO',450,15450,6000),('Полина','lapeippicropre@mail.com','+7 (978) 606-18-11','Мария','+7 (918) 396-60-97','2024-01-07','Пирсинг',2000,'Украшения',1500,3500,1500),('Дарья','sauvoutohigra8973@mail.com','+7 (915) 923-76-37','Сергей','+7 (988) 178-38-85','2024-01-08','Большой сеанс',65000,'Doctor PRO',450,65450,30000);
/*!40000 ALTER TABLE `окончательназапись` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `предварительназапись`
--

DROP TABLE IF EXISTS `предварительназапись`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `предварительназапись` (
  `ИмяКлиента` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Телефон` varchar(45) NOT NULL,
  `Дата` date NOT NULL,
  PRIMARY KEY (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `предварительназапись`
--

LOCK TABLES `предварительназапись` WRITE;
/*!40000 ALTER TABLE `предварительназапись` DISABLE KEYS */;
INSERT INTO `предварительназапись` VALUES ('Георгий','gallerittouss@mail.com','+7 (992) 243-21-18','2023-12-18'),('Полина','lapeippicropre@mail.com','+7 (978) 606-18-11','2023-12-06'),('Василий','preprenoumoijo-7154@mail.com','+7 (965) 992-85-81','2023-12-22'),('Дарья','sauvoutohigra8973@mail.com','+7 (915) 923-76-37','2024-01-10'),('Мария','yeugeuffareze@mail.com','+7 (998) 283-97-15','2023-01-20');
/*!40000 ALTER TABLE `предварительназапись` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `сотрудники`
--

DROP TABLE IF EXISTS `сотрудники`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `сотрудники` (
  `ИмяМастера` varchar(45) NOT NULL,
  `ВидДеятельности` varchar(45) NOT NULL,
  `ТелефонМастера` varchar(45) NOT NULL,
  `Зарплата` varchar(45) NOT NULL,
  PRIMARY KEY (`ИмяМастера`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `сотрудники`
--

LOCK TABLES `сотрудники` WRITE;
/*!40000 ALTER TABLE `сотрудники` DISABLE KEYS */;
INSERT INTO `сотрудники` VALUES ('Александра','Администратор','+7 (906) 627-98-26','35000'),('Анна','Администратор','+7 (976) 227-98-59','35000'),('Артем','Татуировка','+7 (952) 242-16-38','Процент студии'),('Мария','Пирсинг','+7 (918) 396-60-97','Процент студии'),('Павел','Оператор','+7 (967) 460-38-20','15000'),('Сергей','Татуировка','+7 (988) 178-38-85','Процент студии');
/*!40000 ALTER TABLE `сотрудники` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `товары`
--

DROP TABLE IF EXISTS `товары`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `товары` (
  `Товары` varchar(45) NOT NULL,
  `Цена_руб` int NOT NULL,
  PRIMARY KEY (`Товары`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `товары`
--

LOCK TABLES `товары` WRITE;
/*!40000 ALTER TABLE `товары` DISABLE KEYS */;
INSERT INTO `товары` VALUES ('Dermalize Pro',200),('Doctor PRO',450),('Украшения',1500),('Хна Golecha',200);
/*!40000 ALTER TABLE `товары` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `услуги`
--

DROP TABLE IF EXISTS `услуги`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `услуги` (
  `Услуги` varchar(45) NOT NULL,
  `Цена_руб` varchar(45) NOT NULL,
  `Длительность_мин` int NOT NULL,
  PRIMARY KEY (`Услуги`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `услуги`
--

LOCK TABLES `услуги` WRITE;
/*!40000 ALTER TABLE `услуги` DISABLE KEYS */;
INSERT INTO `услуги` VALUES ('Большой сеанс','>35000',420),('Надписи и миниатюры','<4000',60),('Пирсинг','<4000',60),('Средний сеанс','10000 - 20000',240);
/*!40000 ALTER TABLE `услуги` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-08 20:57:55
