-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: bookstoredb
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `address_id` int NOT NULL AUTO_INCREMENT,
  `street_number` varchar(10) NOT NULL,
  `street_name` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country_id` int NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `country_id` (`country_id`),
  KEY `city` (`city`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'17','Kenyatta Road','Mombasa',1,'80100'),(2,'1','Spintex Road','Accra',2,'GA123'),(3,'22','Oxford Street','Kumasi',2,'KS456'),(4,'10','Samora Avenue','Dar es Salaam',3,'11101'),(5,'45','Uhuru Street','Arusha',3,'23101'),(6,'221B','Baker Street','London',4,'NW1 6XE'),(7,'10','Downing Street','London',4,'SW1A 2AA'),(8,'42','Adeniran Ogunsanya','Lagos',5,'101241'),(9,'15','Awolowo Road','Ikeja',5,'101233'),(10,'12','Vilakazi Street','Soweto',6,'1804'),(11,'101','Friedrichstraße','Berlin',7,'10117'),(12,'45','Kurfürstendamm','Berlin',7,'10719'),(13,'8','Champs-Élysées','Paris',8,'75008'),(14,'72','Rue de Rivoli','Paris',8,'75004'),(15,'88','Jianguo Road','Beijing',9,'100025'),(16,'120','Nanjing Road','Shanghai',9,'200003'),(17,'32','Marine Drive','Mumbai',10,'400020'),(18,'12','MG Road','Bangalore',10,'560001'),(19,'1','King Fahd Road','Riyadh',11,'11564'),(20,'45','Paseo de la Reforma','Mexico City',12,'06500'),(21,'120','Avenida Juárez','Guadalajara',12,'44100'),(22,'10','Kensington High Street','London',4,'W8 5NP'),(23,'1','Princes Street','Edinburgh',4,'EH2 2EQ'),(24,'123','5th Avenue','New York',13,'10001'),(25,'456','Martin Luther King Blvd','Chicago',13,'60616');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address_status`
--

DROP TABLE IF EXISTS `address_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_name` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `address_status` (`status_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_status`
--

LOCK TABLES `address_status` WRITE;
/*!40000 ALTER TABLE `address_status` DISABLE KEYS */;
INSERT INTO `address_status` VALUES (1,'Current','Primary active address'),(2,'Previous','Former address no longer in use'),(3,'Billing','Address used for billing purposes'),(4,'Shipping','Address used for shipping/delivery'),(5,'Temporary','Short-term address'),(6,'Work','Business or work-related address'),(7,'Vacation','Seasonal or vacation address');
/*!40000 ALTER TABLE `address_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `author` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(100) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `biography` text,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_name` (`author_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES (1,'Ngũgĩ wa Thiong\'o','1938-01-05','Kenyan writer and academic who writes primarily in Gikuyu and English'),(2,'Chimamanda Ngozi Adichie','1977-09-15','Nigerian writer whose works range from novels to short stories to nonfiction'),(3,'Nadine Gordimer','1923-11-20','South African writer and political activist who received the Nobel Prize in Literature'),(4,'Thomas Sankara','1949-12-21','Revolutionary and President of Burkina Faso whose speeches were compiled into books'),(5,'Wei Hui','1973-06-06','Chinese novelist best known for her controversial novel Shanghai Baby'),(6,'Jorge Luis Borges','1899-08-24','Argentine short-story writer, essayist, poet and translator'),(7,'Ayi Kwei Armah','1939-10-28','Ghanaian writer known for his novels about political and cultural corruption'),(8,'Alaa Al Aswany','1957-05-26','Egyptian writer best known for The Yacoubian Building'),(9,'Mariama Bâ','1929-04-17','Senegalese author and feminist who wrote in French'),(10,'Binyavanga Wainaina','1971-01-18','Kenyan author and journalist famous for \"How to Write About Africa\"');
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `isbn` varchar(20) NOT NULL,
  `publisher_id` int DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `num_pages` int DEFAULT NULL,
  `publication_date` date DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `stock_quantity` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `isbn` (`isbn`),
  KEY `publisher_id` (`publisher_id`),
  KEY `language_id` (`language_id`),
  KEY `title` (`title`),
  KEY `price` (`price`),
  CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`publisher_id`),
  CONSTRAINT `book_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `book_language` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES (1,'Decolonising the Mind','978-0852555019',6,1,256,'1986-01-01',24.99,50),(2,'Wizard of the Crow','978-0099504156',1,1,768,'2006-01-01',19.99,30),(3,'Half of a Yellow Sun','978-0007200283',2,1,448,'2006-01-01',15.99,40),(4,'Things Fall Apart','978-0385474542',3,1,209,'1958-01-01',12.99,60),(5,'July\'s People','978-0143026259',1,1,192,'1981-01-01',14.99,25),(6,'Born a Crime','978-0399588174',5,1,304,'2016-01-01',18.99,35),(7,'Shanghai Baby','978-0743419341',5,5,240,'1999-01-01',22.99,20),(8,'So Long a Letter','978-0435905558',10,3,112,'1979-01-01',11.99,30),(9,'The Reader','978-0375408267',4,4,218,'1995-01-01',16.99,25),(10,'Ficciones','978-0802130303',9,8,174,'1944-01-01',13.99,20);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `author` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (1,1),(2,1),(3,2),(5,3),(7,5),(10,6),(4,7),(9,8),(8,9),(6,10);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_language`
--

DROP TABLE IF EXISTS `book_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_language` (
  `language_id` int NOT NULL AUTO_INCREMENT,
  `language_code` char(2) NOT NULL,
  `language_name` varchar(50) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_code` (`language_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_language`
--

LOCK TABLES `book_language` WRITE;
/*!40000 ALTER TABLE `book_language` DISABLE KEYS */;
INSERT INTO `book_language` VALUES (1,'EN','English'),(2,'SW','Swahili'),(3,'FR','French'),(4,'DE','German'),(5,'ZH','Chinese'),(6,'HI','Hindi'),(7,'AR','Arabic'),(8,'ES','Spanish'),(9,'YO','Yoruba'),(10,'ZU','Zulu');
/*!40000 ALTER TABLE `book_language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `country` (
  `country_id` int NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  `country_code` int DEFAULT NULL,
  PRIMARY KEY (`country_id`),
  UNIQUE KEY `country_name` (`country_name`),
  UNIQUE KEY `country_code` (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` VALUES (1,'Kenya',254),(2,'Ghana',233),(3,'Tanzania',255),(4,'United Kingdom',44),(5,'Nigeria',234),(6,'South Africa',27),(7,'Germany',49),(8,'France',33),(9,'China',86),(10,'India',91),(11,'Saudi Arabia',966),(12,'Mexico',52),(13,'United States',1);
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cust_order`
--

DROP TABLE IF EXISTS `cust_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cust_order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `shipping_method_id` int NOT NULL,
  `dest_address_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  KEY `shipping_method_id` (`shipping_method_id`),
  KEY `dest_address_id` (`dest_address_id`),
  KEY `order_date` (`order_date`),
  CONSTRAINT `cust_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `cust_order_ibfk_2` FOREIGN KEY (`shipping_method_id`) REFERENCES `shipping_method` (`method_id`),
  CONSTRAINT `cust_order_ibfk_3` FOREIGN KEY (`dest_address_id`) REFERENCES `address` (`address_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cust_order`
--

LOCK TABLES `cust_order` WRITE;
/*!40000 ALTER TABLE `cust_order` DISABLE KEYS */;
INSERT INTO `cust_order` VALUES (1,1,'2024-01-15 10:30:00',1,1),(2,1,'2024-03-22 14:15:00',2,6),(3,2,'2024-02-10 09:45:00',3,2),(4,2,'2024-04-05 16:20:00',4,7),(5,3,'2024-01-30 11:10:00',6,3),(6,4,'2024-03-18 13:25:00',9,4),(7,5,'2024-02-28 15:40:00',7,5),(8,6,'2024-04-10 12:00:00',1,10),(9,7,'2024-01-20 08:30:00',2,11),(10,8,'2024-03-05 17:45:00',4,13),(11,9,'2024-02-15 10:20:00',5,15);
/*!40000 ALTER TABLE `cust_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `email` (`email`),
  KEY `last_name` (`last_name`,`first_name`),
  KEY `email_2` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Brian','Mwangi','briankush05@gmail.com','+25424345670'),(2,'James','Bond','jamesbond01@gmail.com','+23324867463'),(3,'Daddy','Kool','kool@gmail.com','+25524567453'),(4,'Shukri','Hassan','san@gmail.com','+445924824457'),(5,'Ngozi','Chukwu','ngozichukwu@gmail.com','+234802345678'),(6,'Amahle','Dlamini','amahled@eyahoo.com','+27821234567'),(7,'Sophie','Müller','sophiemueller2@yahoo.com','+4915123456789'),(8,'Jean','Dupont','jeandupon6t@gmail.com','+33123456789'),(9,'Wei','Chen','weichen@outlook.com','+8613812345678'),(10,'Priya','Patel','priyapatel@gmail.com','+919876543210'),(11,'Youssef','Alfarsi','youssefalfarsi@yahoo.com','+966501234567'),(12,'Sofía','García','sofigarcia896@yahoo.com','+5215512345678'),(13,'Aisha','Johnson','aishajohnsonofficial@outlook.com','+447912345678'),(14,'Tyrone','Williams','tyronew@gmail.com','+12025551234');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_address` (
  `customer_id` int NOT NULL,
  `address_id` int NOT NULL,
  `status_id` int NOT NULL,
  PRIMARY KEY (`customer_id`,`address_id`),
  KEY `address_id` (`address_id`),
  KEY `status_id` (`status_id`),
  CONSTRAINT `customer_address_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `customer_address_ibfk_2` FOREIGN KEY (`address_id`) REFERENCES `address` (`address_id`),
  CONSTRAINT `customer_address_ibfk_3` FOREIGN KEY (`status_id`) REFERENCES `address_status` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_history`
--

DROP TABLE IF EXISTS `order_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_history` (
  `history_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `status_id` int NOT NULL,
  `status_date` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `status_id` (`status_id`),
  KEY `order_id` (`order_id`,`status_date`),
  CONSTRAINT `order_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`),
  CONSTRAINT `order_history_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_history`
--

LOCK TABLES `order_history` WRITE;
/*!40000 ALTER TABLE `order_history` DISABLE KEYS */;
INSERT INTO `order_history` VALUES (1,1,1,'2024-01-15 10:30:00'),(2,1,2,'2024-01-15 12:45:00'),(3,1,3,'2024-01-16 09:20:00'),(4,1,6,'2024-01-18 14:15:00'),(5,2,1,'2024-03-22 14:15:00'),(6,2,2,'2024-03-22 16:30:00'),(7,2,3,'2024-03-23 11:10:00'),(8,2,4,'2024-03-25 08:45:00'),(9,3,1,'2024-02-10 09:45:00'),(10,3,2,'2024-02-10 11:30:00'),(11,3,3,'2024-02-10 15:20:00'),(12,3,6,'2024-02-11 10:15:00'),(13,4,1,'2024-04-05 16:20:00'),(14,4,2,'2024-04-05 18:30:00'),(15,4,3,'2024-04-06 09:15:00'),(16,4,6,'2024-04-08 14:00:00'),(17,4,7,'2024-04-09 10:30:00'),(18,4,8,'2024-04-09 14:45:00'),(19,5,1,'2024-01-30 11:10:00'),(20,5,11,'2024-01-30 13:25:00'),(21,6,1,'2024-03-18 13:25:00'),(22,6,2,'2024-03-18 15:40:00'),(23,6,3,'2024-03-19 10:15:00'),(24,6,6,'2024-03-21 16:30:00'),(25,7,1,'2024-02-28 15:40:00'),(26,7,2,'2024-02-28 17:55:00'),(27,7,3,'2024-02-29 09:30:00'),(28,7,5,'2024-03-02 08:15:00');
/*!40000 ALTER TABLE `order_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line`
--

DROP TABLE IF EXISTS `order_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_line` (
  `line_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `book_id` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`line_id`),
  KEY `book_id` (`book_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `order_line_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `cust_order` (`order_id`) ON DELETE CASCADE,
  CONSTRAINT `order_line_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line`
--

LOCK TABLES `order_line` WRITE;
/*!40000 ALTER TABLE `order_line` DISABLE KEYS */;
INSERT INTO `order_line` VALUES (1,1,1,24.99,1),(2,2,2,19.99,2),(3,3,4,12.99,1),(4,4,6,18.99,1),(5,5,5,14.99,1),(6,6,9,16.99,1),(7,7,3,15.99,2),(8,8,6,18.99,1),(9,9,9,16.99,1),(10,10,8,11.99,1),(11,11,7,22.99,1);
/*!40000 ALTER TABLE `order_line` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_status` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `status_value` varchar(20) NOT NULL,
  PRIMARY KEY (`status_id`),
  UNIQUE KEY `status_value` (`status_value`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (11,'Cancelled'),(6,'Delivered'),(4,'In Transit'),(5,'Out for Delivery'),(1,'Pending'),(2,'Processing'),(10,'Refund Issued'),(8,'Return Approved'),(9,'Return Received'),(7,'Return Requested'),(3,'Shipped');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `publisher_id` int NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(100) NOT NULL,
  PRIMARY KEY (`publisher_id`),
  UNIQUE KEY `publisher_name` (`publisher_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES (9,'Casa de las Américas'),(8,'Chennai Books'),(6,'East African Educational Publishers'),(10,'Editions Présence Africaine'),(4,'Hachette Livre'),(2,'HarperCollins'),(7,'Kwani Trust'),(3,'Macmillan Publishers'),(1,'Penguin Random House'),(5,'Simon & Schuster');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_method`
--

DROP TABLE IF EXISTS `shipping_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_method` (
  `method_id` int NOT NULL AUTO_INCREMENT,
  `method_name` varchar(100) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`method_id`),
  UNIQUE KEY `method_name` (`method_name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_method`
--

LOCK TABLES `shipping_method` WRITE;
/*!40000 ALTER TABLE `shipping_method` DISABLE KEYS */;
INSERT INTO `shipping_method` VALUES (1,'Standard Shipping',5.00),(2,'Express Shipping',10.00),(3,'Overnight Shipping',20.00),(4,'International Shipping',30.00),(5,'Drone Delivery',25.00),(6,'Courier Service',15.00),(7,'Economy Shipping',3.00),(8,'Freight Shipping',50.00),(9,'Same-Day Delivery',12.00),(10,'Pickup Point',0.00);
/*!40000 ALTER TABLE `shipping_method` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-13 20:13:20
