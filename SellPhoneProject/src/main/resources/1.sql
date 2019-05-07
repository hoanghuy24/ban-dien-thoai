-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sellphone
-- ------------------------------------------------------
-- Server version	8.0.15

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'dang dat',2),(2,'',4),(4,'',6),(5,'',8),(6,'No',13);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'HTC'),(2,'Iphone'),(3,'NOKIA'),(4,'SONY'),(5,'Blackberry'),(6,'SamSung');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numberOfProduct` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_cart` int(11) DEFAULT NULL,
  `status` varchar(10) COLLATE utf8_unicode_ci DEFAULT 'No',
  PRIMARY KEY (`id`),
  KEY `id_cart` (`id_cart`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`numberProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (28,1,5,1,'ordered'),(51,1,3,1,'ordered'),(53,3,5,6,'ordered');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `listimage`
--

DROP TABLE IF EXISTS `listimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `listimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_product` int(11) NOT NULL,
  `image` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listimage`
--

LOCK TABLES `listimage` WRITE;
/*!40000 ALTER TABLE `listimage` DISABLE KEYS */;
INSERT INTO `listimage` VALUES (1,2,'http://www.truesmart.com.vn/img/p/iphone-4-p3267.png'),(2,2,'http://www.truesmart.com.vn/img/p/iphone-4-p3267.png'),(3,2,'http://www.truesmart.com.vn/img/p/iphone-4-p3267.png'),(4,2,'http://www.truesmart.com.vn/img/p/iphone-4-p3267.png'),(5,1,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg'),(6,1,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg'),(7,1,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg');
/*!40000 ALTER TABLE `listimage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_order`
--

DROP TABLE IF EXISTS `person_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sex` bit(1) DEFAULT b'1',
  `full_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8mb4_vietnamese_ci NOT NULL,
  `other_information` text COLLATE utf8mb4_vietnamese_ci,
  `address_order` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_user` int(11) NOT NULL,
  `status` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'dang giao',
  `id_product` int(11) DEFAULT NULL,
  `numberOfProduct` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_vietnamese_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_order`
--

LOCK TABLES `person_order` WRITE;
/*!40000 ALTER TABLE `person_order` DISABLE KEYS */;
INSERT INTO `person_order` VALUES (68,_binary '','Ha','H','hH','h',2,'cancel',80,1,123213),(69,_binary '','Ha','H','hH','h',4,'cancel',80,1,123213),(70,_binary '','Ha','H','hH','h',10,'cancel',80,1,123213),(71,_binary '','Ha','H','hH','h',13,'cancel',80,1,123213),(72,_binary '','jiji','dsds','sdsds','HaNoi',2,'cancel',5,1,1000000),(73,_binary '','jiji','dsds','sdsds','HaNoi',4,'cancel',5,1,1000000),(74,_binary '','jiji','dsds','sdsds','HaNoi',10,'cancel',5,1,1000000),(75,_binary '','jiji','dsds','sdsds','HaNoi',13,'cancel',5,1,1000000),(76,_binary '','jiji','dsds','sdsds','HaNoi',2,'order',5,3,3000000),(77,_binary '','jiji','dsds','sdsds','HaNoi',4,'order',5,3,3000000),(78,_binary '','jiji','dsds','sdsds','HaNoi',10,'order',5,3,3000000),(79,_binary '','jiji','dsds','sdsds','HaNoi',13,'order',5,3,3000000),(80,_binary '','jiji','dsds','sdsds','HaNoi',2,'order',5,1,1000000),(81,_binary '','jiji','dsds','sdsds','HaNoi',4,'order',5,1,1000000),(82,_binary '','jiji','dsds','sdsds','HaNoi',10,'order',5,1,1000000),(83,_binary '','jiji','dsds','sdsds','HaNoi',13,'order',5,1,1000000),(84,_binary '','jiji','dsds','sdsds','HaNoi',2,'order',3,1,1999090),(85,_binary '','jiji','dsds','sdsds','HaNoi',4,'order',3,1,1999090),(86,_binary '','jiji','dsds','sdsds','HaNoi',10,'order',3,1,1999090),(87,_binary '','jiji','dsds','sdsds','HaNoi',13,'order',3,1,1999090);
/*!40000 ALTER TABLE `person_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `product` (
  `numberProduct` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `number_of_product` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `image` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT 'default.jpg',
  `ram` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `memory` varchar(6) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `chip` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `camera` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `long_description` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`numberProduct`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone 4',2000000,'No',0,200,1,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg','4G','128G','abc','100M',NULL),(2,'Iphone 4',2000002,'No',50000,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,'<div class=\"blog-content\">\n<h2><strong><a href=\"https://cellphones.com.vn/samsung-galaxy-a50.html\" title=\"Ă„ï¿½iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i Samsung Galaxy A50\" target=\"_blank\">Ă„ï¿½iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i Samsung Galaxy A50</a> Ă¢â‚¬â€œ <a href=\"https://cellphones.com.vn/mobile.html\" title=\"Ă„ï¿½iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i Smartphone chÄ‚Â­nh hÄ‚Â£ng\" target=\"_blank\">Smartphone</a> vĂ¡Â»â€ºi mÄ‚Â n hÄ‚Â¬nh trÄ‚Â n viĂ¡Â»ï¿½n, cĂ¡Â»Â¥m 3 camera Ă¡ÂºÂ¥n tĂ†Â°Ă¡Â»Â£ng</strong></h2>\n<p><em>Sau <a href=\"https://cellphones.com.vn/samsung-galaxy-a20.html\" title=\"Ă„ï¿½iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i SamSUng Galaxy A20 chÄ‚Â­nh hÄ‚Â£ng\" target=\"_blank\"><strong>Galaxy A20</strong></a> vÄ‚Â  <a href=\"https://cellphones.com.vn/samsung-galaxy-a30-64gb.html\" title=\"Ă„ï¿½iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i SamSung Galaxy A30 chÄ‚Â­nh hÄ‚Â£ng\" target=\"_blank\"><strong>Galaxy A30</strong></a> thÄ‚Â¬ mĂ¡Â»â€ºi Ă„â€˜Ä‚Â¢y <a href=\"https://cellphones.com.vn/mobile/samsung.html\" title=\"Ă„ï¿½iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i Samsung chÄ‚Â­nh hÄ‚Â£ng\" target=\"_blank\"><strong>SamSung</strong></a> tiĂ¡ÂºÂ¿p tĂ¡Â»Â¥c bĂ¡Â»â€¢ sung mĂ¡Â»â„¢t cÄ‚Â¡i tÄ‚Âªn mĂ¡Â»â€ºi vÄ‚Â o danh sÄ‚Â¡ch <a href=\"https://cellphones.com.vn/mobile/samsung/galaxy-a.html\" title=\"Ă„ï¿½iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i Samsung Galaxy A chÄ‚Â­nh hÄ‚Â£ng\" target=\"_blank\"><strong>Galaxy A</strong></a> cĂ¡Â»Â§a mÄ‚Â¬nh, Ă„â€˜Ä‚Â³ chÄ‚Â­nh lÄ‚Â  <strong>SamSung Galaxy A50</strong>. A50 vĂ¡Â»â€ºi nhiĂ¡Â»ï¿½u cÄ‚Â´ng nghĂ¡Â»â€¡ vĂ¡Â»â€ºi vÄ‚Â  hĂ¡ÂºÂ¥p dĂ¡ÂºÂ«n nhĂ†Â° cĂ¡ÂºÂ£m biĂ¡ÂºÂ¿n vÄ‚Â¢n tay trong mÄ‚Â n hÄ‚Â¬nh, cĂ¡Â»Â¥m 3 camera hĂ¡Â»Â©a hĂ¡ÂºÂ¹n sĂ¡ÂºÂ½ mang Ă„â€˜Ă¡ÂºÂ¿n trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m tuyĂ¡Â»â€¡t vĂ¡Â»ï¿½i cho ngĂ†Â°Ă¡Â»ï¿½i dÄ‚Â¹ng.</em></p>\n<h3><strong>MÄ‚Â n hÄ‚Â¬nh 6.4 inch Ă¢â‚¬â€œ tĂ¡ÂºÂ­n hĂ†Â°Ă¡Â»Å¸ng trĂ¡Â»ï¿½n vĂ¡ÂºÂ¹n vĂ¡Â»â€ºi mÄ‚Â n hÄ‚Â¬nh vÄ‚Â´ cĂ¡Â»Â±c</strong></h3>\n<p>Galaxy A50 sĂ¡Â»Å¸ hĂ¡Â»Â¯u mĂ¡Â»â„¢t mÄ‚Â n hÄ‚Â¬nh cÄ‚Â³ kÄ‚Â­ch thĂ†Â°Ă¡Â»â€ºc lĂ¡Â»â€ºn lÄ‚Âªn Ă„â€˜Ă¡ÂºÂ¿n 6.4 inch cÄ‚Â¹ng cÄ‚Â´ng nghĂ¡Â»â€¡ mÄ‚Â n hÄ‚Â¬nh Infinity-U trÄ‚Â n viĂ¡Â»ï¿½n mang Ă„â€˜Ă¡ÂºÂ¿n nhĂ¡Â»Â¯ng trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m tĂ¡ÂºÂ­n cÄ‚Â¹ng cho ngĂ†Â°Ă¡Â»ï¿½i dÄ‚Â¹ng. CÄ‚Â¹ng vĂ¡Â»â€ºi Ă„â€˜Ä‚Â³ lÄ‚Â  tĂ¡ÂºÂ¥m nĂ¡Â»ï¿½n<span style=\"color: #000000;\"> <a href=\"https://www.lifewire.com/super-amoled-4151073\" rel=\"nofollow\" title=\"TĂ¡ÂºÂ¥m nĂ¡Â»ï¿½n Super AMOLED\" target=\"_self\"><span style=\"color: #000000;\">Super AMOLED</span></a> ch</span>uĂ¡ÂºÂ©n FHD+ vÄ‚Â  mÄ‚Â n hÄ‚Â¬nh 16 triĂ¡Â»â€¡u mÄ‚Â u nhĂ¡Â»ï¿½ Ă„â€˜Ä‚Â³ A50 mang Ă„â€˜Ă¡ÂºÂ¿n nhĂ¡Â»Â¯ng trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m xem hoÄ‚Â n toÄ‚Â n khÄ‚Â¡c biĂ¡Â»â€¡t vĂ¡Â»â€ºi nhĂ¡Â»Â¯ng hÄ‚Â¬nh Ă¡ÂºÂ£nh sĂ¡ÂºÂ¯c nÄ‚Â©t, chÄ‚Â¢n thĂ¡Â»Â±c vÄ‚Â  sĂ¡Â»â€˜ng Ă„â€˜Ă¡Â»â„¢ng Ă„â€˜Ă¡ÂºÂ¿n tĂ¡Â»Â«ng chi tiĂ¡ÂºÂ¿t.</p>\n<p><img alt=\"MÄ‚Â n hÄ‚Â¬nh 6.4 inch Ă¢â‚¬â€œ tĂ¡ÂºÂ­n hĂ†Â°Ă¡Â»Å¸ng trĂ¡Â»ï¿½n vĂ¡ÂºÂ¹n vĂ¡Â»â€ºi mÄ‚Â n hÄ‚Â¬nh vÄ‚Â´ cĂ¡Â»Â±c\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-1.jpg\"></p>\n<p>BÄ‚Âªn cĂ¡ÂºÂ¡nh mĂ¡Â»â„¢t mÄ‚Â n hÄ‚Â¬nh vÄ‚Â´ cĂ¡Â»Â±c vĂ¡Â»â€ºi chĂ¡ÂºÂ¥t lĂ†Â°Ă¡Â»Â£ng hiĂ¡Â»Æ’n thĂ¡Â»â€¹ tĂ¡Â»â€˜t thÄ‚Â¬ Galaxy A50 cÄ‚Â²n sĂ¡Â»Å¸ hĂ¡Â»Â¯u mĂ¡Â»â„¢t thiĂ¡ÂºÂ¿t kĂ¡ÂºÂ¿ Ă¡ÂºÂ¥n tĂ†Â°Ă¡Â»Â£ng vĂ¡Â»â€ºi mĂ¡ÂºÂ·t kÄ‚Â­nh 3D cao cĂ¡ÂºÂ¥p kĂ¡ÂºÂ¿t hĂ¡Â»Â£p viĂ¡Â»ï¿½n mÄ‚Â n hÄ‚Â¬nh cong trÄ‚Â n tinh tĂ¡ÂºÂ¿ tĂ¡ÂºÂ¡o nÄ‚Âªn mĂ¡Â»â„¢t tĂ¡Â»â€¢ng thĂ¡Â»Æ’ nguyÄ‚Âªn khĂ¡Â»â€˜i liĂ¡Â»ï¿½n mĂ¡ÂºÂ¡ch hoÄ‚Â n hĂ¡ÂºÂ£o nhĂ¡Â»ï¿½ Ă„â€˜Ä‚Â³ mÄ‚Â¡y cho khĂ¡ÂºÂ£ nĂ„Æ’ng cĂ¡ÂºÂ§m nĂ¡ÂºÂ¯m khÄ‚Â¡ chĂ¡ÂºÂ¯c chĂ¡ÂºÂ¯n. NgoÄ‚Â i ra, mÄ‚Â u sĂ¡ÂºÂ¯c cĂ…Â©ng lÄ‚Â  mĂ¡Â»â„¢t Ă„â€˜iĂ¡Â»Æ’m nhĂ¡ÂºÂ¥n Ă¡ÂºÂ¥n tĂ†Â°Ă¡Â»Â£ng trÄ‚Âªn A50 khi mÄ‚Â¡y sĂ¡Â»Å¸ hĂ¡Â»Â¯u nhiĂ¡Â»ï¿½u phiÄ‚Âªn bĂ¡ÂºÂ£n mÄ‚Â u Ă„â€˜Ă¡Â»â„¢c Ă„â€˜Ä‚Â¡o&nbsp; nhĂ†Â° Ă„â€˜en thiÄ‚Âªn thĂ¡ÂºÂ¡ch, xanh Ă„â€˜Ă¡ÂºÂ¡i dĂ†Â°Ă†Â¡ng vÄ‚Â  trĂ¡ÂºÂ¯ng ngĂ¡Â»ï¿½c trai.</p>\n<h3><strong>BĂ¡Â»â„¢ ba camera sau vĂ¡Â»â€ºi khĂ¡ÂºÂ£ nĂ„Æ’ng chĂ¡Â»Â¥p Ă¡ÂºÂ£nh AI cho nhĂ¡Â»Â¯ng bĂ¡Â»Â©c Ă¡ÂºÂ£nh chuĂ¡ÂºÂ©n nhiĂ¡ÂºÂ¿p Ă¡ÂºÂ£nh gia</strong></h3>\n<p>VĂ¡Â»â€ºi ba Ă¡Â»â€¢ng kÄ‚Â­nh Ă„â€˜a khĂ¡ÂºÂ©u Ă„â€˜Ă¡Â»â„¢, tĂ¡Â»Â« camera gÄ‚Â³c siÄ‚Âªu rĂ¡Â»â„¢ng 8MP mang Ă„â€˜Ă¡ÂºÂ¿n gÄ‚Â³c chĂ¡Â»Â¥p 123 Ă„â€˜Ă¡Â»â„¢ thĂ¡ÂºÂ­t nhĂ†Â° mĂ¡ÂºÂ¯t nhÄ‚Â¬n Ă„â€˜Ă¡ÂºÂ¿n camera Ă„â€˜o chiĂ¡Â»ï¿½u sÄ‚Â¢u 5MP vÄ‚Â  camera khĂ¡ÂºÂ©u Ă„â€˜Ă¡Â»â„¢ lĂ¡Â»â€ºn 25MP thu sÄ‚Â¡ng vĂ†Â°Ă¡Â»Â£t trĂ¡Â»â„¢i. NgoÄ‚Â i ra, cĂ¡Â»Â¥m camera sau trÄ‚Âªn Galaxy A50 cÄ‚Â²n Ă„â€˜Ă†Â°Ă¡Â»Â£c tÄ‚Â­ch hĂ¡Â»Â£p nhiĂ¡Â»ï¿½u tÄ‚Â­nh nĂ„Æ’ng thÄ‚Â´ng minh nhĂ†Â° chĂ¡ÂºÂ¿ Ă„â€˜Ă¡Â»â„¢ tĂ¡Â»â€˜i Ă†Â°u hÄ‚Â³a cĂ¡ÂºÂ£nh giÄ‚Âºp nhĂ¡ÂºÂ­n diĂ¡Â»â€¡n chĂ¡Â»Â§ thĂ¡Â»Æ’. Hay cÄ‚Â´ng nghĂ¡Â»â€¡ trÄ‚Â­ thÄ‚Â´ng minh nhÄ‚Â¢n tĂ¡ÂºÂ¡o AI giÄ‚Âºp tĂ¡Â»Â± Ă„â€˜Ă¡Â»â„¢ng tĂ¡Â»â€˜i Ă†Â°u Ă„â€˜Ă¡Â»â„¢ sÄ‚Â¡ng, Ă„â€˜Ă¡Â»â„¢ bÄ‚Â£o hÄ‚Â²a giÄ‚Âºp bĂ¡Â»Â©c Ă¡ÂºÂ£nh luÄ‚Â´n Ă„â€˜Ă¡ÂºÂ¹p hoÄ‚Â n hĂ¡ÂºÂ£o.</p>\n<p><img alt=\"VĂ¡Â»â€ºi ba Ă¡Â»â€¢ng kÄ‚Â­nh Ă„â€˜a khĂ¡ÂºÂ©u Ă„â€˜Ă¡Â»â„¢, tĂ¡Â»Â« camera gÄ‚Â³c siÄ‚Âªu rĂ¡Â»â„¢ng 8MP mang Ă„â€˜Ă¡ÂºÂ¿n gÄ‚Â³c chĂ¡Â»Â¥p 123 Ă„â€˜Ă¡Â»â„¢ thĂ¡ÂºÂ­t nhĂ†Â° mĂ¡ÂºÂ¯t nhÄ‚Â¬n Ă„â€˜Ă¡ÂºÂ¿n camera Ă„â€˜o chiĂ¡Â»ï¿½u sÄ‚Â¢u 5MP vÄ‚Â  camera khĂ¡ÂºÂ©u Ă„â€˜Ă¡Â»â„¢ lĂ¡Â»â€ºn 25MP thu sÄ‚Â¡ng vĂ†Â°Ă¡Â»Â£t trĂ¡Â»â„¢i\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-2.jpg\"></p>\n<p>TĂ¡ÂºÂ¥t cĂ¡ÂºÂ£ Ă„â€˜Ä‚Â³ giÄ‚Âºp Galaxy A50 cho ra nhĂ¡Â»Â¯ng bĂ¡Â»Â©c Ă¡ÂºÂ£nh cÄ‚Â³ chĂ¡ÂºÂ¥t lĂ†Â°Ă¡Â»Â£ng nhĂ†Â° Ă„â€˜Ă†Â°Ă¡Â»Â£c chĂ¡Â»Â¥p bĂ¡Â»Å¸i nhĂ¡Â»Â¯ng nhiĂ¡ÂºÂ¿p Ă¡ÂºÂ£nh gia chuyÄ‚Âªn nghiĂ¡Â»â€¡p. BĂ¡ÂºÂ¥t kĂ¡Â»Æ’ thĂ¡Â»ï¿½i gian vÄ‚Â  khÄ‚Â´ng gian, hÄ‚Â nh trÄ‚Â¬nh cĂ¡Â»Â§a bĂ¡ÂºÂ¡n sĂ¡ÂºÂ½ trĂ¡Â»Å¸ nÄ‚Âªn trĂ¡Â»ï¿½n vĂ¡ÂºÂ¹n vĂ¡Â»â€ºi cĂ¡Â»Â¥m 3 camera sĂ¡ÂºÂµn sÄ‚Â ng bĂ¡ÂºÂ¯t trĂ¡Â»ï¿½n mĂ¡Â»ï¿½i nÄ‚Â©t Ă„â€˜Ă¡ÂºÂ¹p dÄ‚Â¹ trong Ă„â€˜iĂ¡Â»ï¿½u kiĂ¡Â»â€¡n thiĂ¡ÂºÂ¿u sÄ‚Â¡ng.&nbsp;</p>\n<p>Ă„ï¿½Ă¡ÂºÂ·c biÄ‚Âªt vĂ¡Â»â€ºi tÄ‚Â­nh nĂ„Æ’ng nhĂ¡ÂºÂ­n diĂ¡Â»â€¡n Ă¡ÂºÂ£nh lĂ¡Â»â€”i khi Galaxy A50 cÄ‚Â³ thĂ¡Â»Æ’ phÄ‚Â¢n biĂ¡Â»â€¡t Ă„â€˜Ă†Â°Ă¡Â»Â£c cÄ‚Â¡c trĂ†Â°Ă¡Â»ï¿½ng hĂ¡Â»Â£p mĂ¡ÂºÂ¯t nhĂ¡ÂºÂ¯m, Ă¡Â»â€˜ng kÄ‚Â­nh bĂ¡Â»â€¹ mĂ¡Â»ï¿½ hay ngĂ†Â°Ă¡Â»Â£c sÄ‚Â¡ng. NhĂ¡Â»ï¿½ Ă„â€˜Ä‚Â³ ngĂ†Â°Ă¡Â»ï¿½i dÄ‚Â¹ng cÄ‚Â³ thĂ¡Â»Æ’ kĂ¡Â»â€¹p thĂ¡Â»ï¿½i Ă„â€˜iĂ¡Â»ï¿½u chĂ¡Â»â€°nh vÄ‚Â  cho ra nhĂ¡Â»Â¯ng khoĂ¡ÂºÂ£nh khĂ¡ÂºÂ¯c hoÄ‚Â n hĂ¡ÂºÂ£o vÄ‚Â  sĂ¡ÂºÂ¯c nÄ‚Â©t nhĂ¡ÂºÂ¥t.</p>\n<p><img alt=\"camera gÄ‚Â³c siÄ‚Âªu rĂ¡Â»â„¢ng 8MP mang Ă„â€˜Ă¡ÂºÂ¿n gÄ‚Â³c chĂ¡Â»Â¥p 123 Ă„â€˜Ă¡Â»â„¢ thĂ¡ÂºÂ­t nhĂ†Â° mĂ¡ÂºÂ¯t nhÄ‚Â¬n\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-3.jpg\"></p>\n<p>NgoÄ‚Â i cĂ¡Â»Â¥m ba camera sau thÄ‚Â¬ camera trĂ†Â°Ă¡Â»â€ºc cĂ¡Â»Â§a Galaxy A50 cĂ…Â©ng khÄ‚Â¡ Ă¡ÂºÂ¥n tĂ†Â°Ă¡Â»Â£ng vĂ¡Â»â€ºi Ă„â€˜Ă¡Â»â„¢ phÄ‚Â¢n giĂ¡ÂºÂ£i 25MP cho hÄ‚Â¬nh Ă¡ÂºÂ£nh luÄ‚Â´n rÄ‚Âµ rÄ‚Â ng, sĂ¡ÂºÂ¯c nÄ‚Â©t dÄ‚Â¹ trong Ă„â€˜iĂ¡Â»ï¿½u kiĂ¡Â»â€¡n thiĂ¡ÂºÂ¿u sÄ‚Â¡ng hay dĂ†Â°Ă¡Â»â€ºi Ä‚Â¡nh nĂ¡ÂºÂ¯ng chÄ‚Â³i chang. CÄ‚Â¹ng nhiĂ¡Â»ï¿½u tÄ‚Â­nh nĂ„Æ’ng chĂ¡Â»â€°nh sĂ¡Â»Â­a, lÄ‚Â m Ă„â€˜Ă¡ÂºÂ¹p thÄ‚Â´ng minh nhĂ†Â° tĂ¡Â»Â± Ă„â€˜Ă¡Â»â„¢ng lÄ‚Â m mĂ¡Â»ï¿½ hĂ¡ÂºÂ­u cĂ¡ÂºÂ£nh giÄ‚Âºp cho ra bĂ¡Â»Â©c hÄ‚Â¬nh selfie tuyĂ¡Â»â€¡t Ă„â€˜Ă¡ÂºÂ¹p chĂ¡Â»â€° trong nhÄ‚Â¡y mĂ¡ÂºÂ¯t.</p>\n<p><img alt=\"Tinh chĂ¡Â»â€°nh Ă¡ÂºÂ£nh thÄ‚Â´ng minh vĂ¡Â»â€ºi cÄ‚Â´ng nghĂ¡Â»â€¡ AI\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-4.jpg\"></p>\n<p>NgoÄ‚Â i ra bĂ¡ÂºÂ¡n cÄ‚Â²n thĂ¡Â»ï¿½a sĂ¡Â»Â©c thĂ¡Â»Æ’ hiĂ¡Â»â€¡n sĂ¡Â»Â± khÄ‚Â¡c biĂ¡Â»â€¡t, cÄ‚Â¡ tÄ‚Â­nh hay sĂ¡Â»Â± sÄ‚Â¡ng tĂ¡ÂºÂ¡o nhĂ¡Â»Â¯ng biĂ¡Â»Æ’u tĂ†Â°Ă¡Â»Â£ng cĂ¡ÂºÂ£m xÄ‚Âºc cĂ¡Â»Â§a riÄ‚Âªng mÄ‚Â¬nh, khÄ‚Â´ng lĂ¡ÂºÂ«n vĂ¡Â»â€ºi bĂ¡ÂºÂ¥t kĂ¡Â»Â³ ai thÄ‚Â´ng qua bĂ¡Â»â„¢ sticker vÄ‚Â  bĂ¡Â»â„¢ lĂ¡Â»ï¿½c AR.</p>\n<p><img alt=\"ThĂ¡Â»ï¿½a thÄ‚Â­ch thĂ¡Â»Æ’ hiĂ¡Â»â€¡n chĂ¡ÂºÂ¥t tÄ‚Â´i khÄ‚Â¡c biĂ¡Â»â€¡t\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-5.jpg\"></p>\n<h3><strong>HiĂ¡Â»â€¡u nĂ„Æ’ng vĂ†Â°Ă¡Â»Â£t trĂ¡Â»â„¢i vĂ¡Â»â€ºi con chip <a href=\"https://cellphones.com.vn/sforum/samsung-trinh-lang-exynos-9610-tang-kha-nang-xu-ly-ai-quay-slow-motion-ra-mat-vao-q2-2018\" title=\"Samsung trÄ‚Â¬nh lÄ‚Â ng Exynos 9610\" target=\"_blank\">Exynos 9 Octa 9610</a> cÄ‚Â¹ng giao diĂ¡Â»â€¡n <a href=\"https://cellphones.com.vn/sforum/samsung-cong-bo-giao-dien-one-ui-moi-danh-cho-smartphone\" title=\"Samsung cÄ‚Â´ng bĂ¡Â»â€˜ giao diĂ¡Â»â€¡n One UI\" target=\"_blank\">One UI</a> tÄ‚Â¢n tiĂ¡ÂºÂ¿n</strong></h3>\n<p>VĂ¡Â»ï¿½ phĂ¡ÂºÂ§n cĂ¡Â»Â©ng, Galaxy A50 Ă„â€˜Ă†Â°Ă¡Â»Â£c trang bĂ¡Â»â€¹ con chip cÄ‚Â¢y nhÄ‚Â  lÄ‚Â¡ vĂ†Â°Ă¡Â»ï¿½n Exynos 9 Octa 9610 cho hiĂ¡Â»â€¡u nĂ„Æ’ng vĂ†Â°Ă¡Â»Â£t trĂ¡Â»â„¢i vĂ¡Â»â€ºi cÄ‚Â¡c tÄ‚Â¡c vĂ¡Â»Â¥ cĂ†Â¡ bĂ¡ÂºÂ£n nhĂ†Â° lĂ†Â°Ă¡Â»â€ºt web, nghe nhĂ¡ÂºÂ¡c, xem Youtube. CÄ‚Â¹ng vĂ¡Â»â€ºi Ă„â€˜Ä‚Â³ lÄ‚Â  con chi<span style=\"color: #000000;\">p <a href=\"https://www.notebookcheck.net/ARM-Mali-G72-MP3-GPU.301008.0.html\" rel=\"nofollow\" title=\"ARM Mali-G72 MP3\" target=\"_blank\"><span style=\"color: #000000;\">Mali-G72 MP3</span></a>, 4GB</span> RAM cho A50 khĂ¡ÂºÂ£ nĂ„Æ’ng chĂ†Â¡i game mĂ†Â°Ă¡Â»Â£t mÄ‚Â , Ă„â€˜a nhiĂ¡Â»â€¡m tĂ¡Â»â€˜t.</p>\n<p><img alt=\"HiĂ¡Â»â€¡u nĂ„Æ’ng vĂ†Â°Ă¡Â»Â£t trĂ¡Â»â„¢i vĂ¡Â»â€ºi con chip Exynos 9 Octa 9610 cÄ‚Â¹ng giao diĂ¡Â»â€¡n One UI tÄ‚Â¢n tiĂ¡ÂºÂ¿n\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-6.jpg\"></p>\n<p>MÄ‚Â¡y cÄ‚Â²n Ă„â€˜Ă†Â°Ă¡Â»Â£c bÄ‚Â¡n ra vĂ¡Â»â€ºi hĂ¡Â»â€¡ Ă„â€˜iĂ¡Â»ï¿½u hÄ‚Â nh <a href=\"https://www.android.com/versions/pie-9-0/\" rel=\"nofollow\" title=\"HĂ¡Â»â€¡ Ă„â€˜iĂ¡Â»ï¿½u hÄ‚Â nh Android 9.0 (pie)\" target=\"_blank\">Android v9.0 (Pie)</a> cÄ‚Â i sĂ¡ÂºÂµn, giao diĂ¡Â»â€¡n One UI giÄ‚Âºp tĂ¡Â»â€˜i Ă†Â°u trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m. Ă„ï¿½Ă¡ÂºÂ·c biĂ¡Â»â€¡t, Galaxy A50 cÄ‚Â²n Ă„â€˜Ă†Â°Ă¡Â»Â£c SamSung tÄ‚Â­ch hĂ¡Â»Â£p chĂ¡ÂºÂ¿ Ă„â€˜Ă¡Â»â„¢ ban Ă„â€˜Ä‚Âªm cho chÄ‚Â©p ngĂ†Â°Ă¡Â»ï¿½i dÄ‚Â¹ng chuyĂ¡Â»Æ’n Ă„â€˜Ă¡Â»â€¢i dĂ¡Â»â€¦ dÄ‚Â ng sang tĂ¡Â»â€˜ng tĂ¡Â»â€˜i, mang lĂ¡ÂºÂ¡i cĂ¡ÂºÂ£m giÄ‚Â¡c dĂ¡Â»â€¦ chĂ¡Â»â€¹u cho mĂ¡ÂºÂ¯t.</p>\n<h3><strong>ViÄ‚Âªn pin 4000 mAh mang Ă„â€˜Ă¡ÂºÂ¿n trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m xuyÄ‚Âªn xuĂ¡Â»â€˜t ngÄ‚Â y dÄ‚Â i</strong></h3>\n<p>Galaxy A50 Ă„â€˜Ă†Â°Ă¡Â»Â£c trang bĂ¡Â»â€¹ viÄ‚Âªn pin mĂ¡ÂºÂ¡nh mĂ¡ÂºÂ½ 4.000 mAh cĂ¡Â»Â¥c khĂ¡Â»Â§ng mang Ă„â€˜Ă¡ÂºÂ¿n nhĂ¡Â»Â¯ng trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m xuyÄ‚Âªn xuĂ¡Â»â€˜t. ViÄ‚Âªn pin Ă„â€˜Ă†Â°Ă¡Â»Â£c SamSung Ă„â€˜Ä‚Â¡nh giÄ‚Â¡ thĂ¡Â»ï¿½i gian sĂ¡Â»Â­ dĂ¡Â»Â¥ng 3G liÄ‚Âªn tĂ¡Â»Â¥c khoĂ¡ÂºÂ£ng 12 giĂ¡Â»ï¿½, 19 giĂ¡Â»ï¿½ phÄ‚Â¡t video, 92 giĂ¡Â»ï¿½ nghe Audio, 14 giĂ¡Â»ï¿½ sĂ¡Â»Â­ dĂ¡Â»Â¥ng 4G, 15 giĂ¡Â»ï¿½ sĂ¡Â»Â­ dĂ¡Â»Â¥ng wifi vÄ‚Â  Ă„â€˜Ä‚Â m thoĂ¡ÂºÂ¡i lÄ‚Âªn Ă„â€˜Ă¡ÂºÂ¿n 23 giĂ¡Â»ï¿½.</p>\n<p><img alt=\"ViÄ‚Âªn pin 4000 mAh mang Ă„â€˜Ă¡ÂºÂ¿n trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m xuyÄ‚Âªn xuĂ¡Â»â€˜t ngÄ‚Â y dÄ‚Â i\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-7.jpg\"></p>\n<p>BÄ‚Âªn cĂ¡ÂºÂ¡nh Ă„â€˜Ä‚Â³, Galaxy A50 cÄ‚Â²n Ă„â€˜Ă†Â°Ă¡Â»Â£c trang bĂ¡Â»â€¹ sĂ¡ÂºÂ¡c nhanh cÄ‚Â´ng suĂ¡ÂºÂ¥t 15W giÄ‚Âºp nhĂ¡Â»Â¯ng trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m dÄ‚Â¹ng, chĂ†Â¡i game hay xem chĂ†Â°Ă†Â¡ng trÄ‚Â¬nh trĂ¡Â»Â±c tiĂ¡ÂºÂ¿p luÄ‚Â´n diĂ¡Â»â€¦n ra xuyÄ‚Âªn suĂ¡Â»â€˜t, liĂ¡Â»ï¿½n mĂ¡ÂºÂ¡ch hoÄ‚Â n hĂ¡ÂºÂ£o.</p>\n<h3><strong>TrĂ¡Â»Â£ lÄ‚Â½ Ă¡ÂºÂ£o <a href=\"https://cellphones.com.vn/sforum/cung-nghe-tro-ly-ao-bixby-rap-va-beatbox-cuc-chat-tu-nhan-minh-tot-hon-siri\" title=\"CÄ‚Â¹ng nghe trĂ¡Â»Â£ lÄ‚Â½ Ă¡ÂºÂ£o Bixby rap vÄ‚Â  beatbox cĂ¡Â»Â±c chĂ¡ÂºÂ¥t\" target=\"_blank\">Bixby</a> nÄ‚Â¢ng cao khĂ¡ÂºÂ£ nĂ„Æ’ng trĂ¡ÂºÂ£i ngiĂ¡Â»â€¡m vÄ‚Â  khÄ‚Â¡m phÄ‚Â¡</strong></h3>\n<p>Bixby trÄ‚Âªn A50 giÄ‚Âºp ngĂ†Â°Ă¡Â»ï¿½i dÄ‚Â¹ng dĂ¡Â»â€¦ dÄ‚Â ng khÄ‚Â¡m phÄ‚Â¡ nhĂ¡Â»Â¯ng kĂ¡Â»Â· nguyÄ‚Âªn thÄ‚Â´ng tin vĂ¡Â»â€ºi nhĂ¡Â»Â¯ng thao tÄ‚Â¡c Ă„â€˜Ă†Â¡n giĂ¡ÂºÂ£n nhĂ†Â° sĂ¡Â»Â­ dĂ¡Â»Â¥ng giĂ¡Â»ï¿½ng nÄ‚Â³i&nbsp; cho phÄ‚Â©p tÄ‚Â¬m kiĂ¡ÂºÂ¿m mĂ¡Â»Â£i thÄ‚Â´ng tin trÄ‚Âªn Ă„â€˜iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i.</p>\n<p><img alt=\"TrĂ¡Â»Â£ lÄ‚Â½ Ă¡ÂºÂ£o Bixby nÄ‚Â¢ng cao khĂ¡ÂºÂ£ nĂ„Æ’ng trĂ¡ÂºÂ£i ngiĂ¡Â»â€¡m vÄ‚Â  khÄ‚Â¡m phÄ‚Â¡\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-8.jpg\"></p>\n<p>NgoÄ‚Â i ra cÄ‚Â²n Bixby Vision, Bixby Home Ă„â€˜Ă†Â°Ă¡Â»Â£c tÄ‚Â­ch hĂ¡Â»Â£p ngay trong camera cho phÄ‚Â©p bĂ¡ÂºÂ¡n tÄ‚Â¬m kiĂ¡ÂºÂ¿m vĂ¡ÂºÂ­t thĂ¡Â»Æ’, dĂ¡Â»â€¹ch tÄ‚Â i liĂ¡Â»â€¡u dĂ¡Â»â€¦ dÄ‚Â ng, quÄ‚Â©t danh thiĂ¡ÂºÂ¿p Ă„â€˜Ă¡Â»Æ’ lĂ†Â°u trĂ¡Â»Â¯ trong Ă„â€˜iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i, sĂ¡Â»Â­ dĂ¡Â»Â¥ng bĂ¡ÂºÂ¥t cĂ¡Â»Â© lÄ‚Âºc nÄ‚Â o bĂ¡ÂºÂ¡n cĂ¡ÂºÂ§n.</p>\n<h3><strong>MĂ¡Â»Å¸ khÄ‚Â³a nhanh vÄ‚Â  bĂ¡ÂºÂ£o mĂ¡ÂºÂ­t an toÄ‚Â n vĂ¡Â»â€ºi xÄ‚Â¡c thĂ¡Â»Â±c sinh trĂ¡ÂºÂ¯c hĂ¡Â»ï¿½c</strong></h3>\n<p>Galaxy A50 vĂ¡Â»â€ºi&nbsp; cÄ‚Â´ng nghĂ¡Â»â€¡ bĂ¡ÂºÂ£o mĂ¡ÂºÂ­t sinh trĂ¡ÂºÂ¯c hĂ¡Â»ï¿½c tÄ‚Â¢n tiĂ¡ÂºÂ¿n vĂ¡Â»â€ºi khĂ¡ÂºÂ£ nĂ„Æ’ng quÄ‚Â©t vÄ‚Â¢n tay&nbsp; dĂ†Â°Ă¡Â»â€ºi mÄ‚Â n hÄ‚Â¬nh nhanh chÄ‚Â³ng vÄ‚Â  an toÄ‚Â n. NgoÄ‚Â i ra, bĂ¡ÂºÂ¡n cĂ…Â©ng cÄ‚Â³ thĂ¡Â»Æ’ lĂ¡Â»Â±a chĂ¡Â»ï¿½n mĂ¡Â»â„¢t phĂ†Â°Ă†Â¡ng thĂ¡Â»Â©c khÄ‚Â¡c vÄ‚Â  nhanh chÄ‚Â³ng khÄ‚Â´ng kÄ‚Â©m Ă„â€˜Ä‚Â³ chÄ‚Â­nh lÄ‚Â  nhĂ¡ÂºÂ­n diĂ¡Â»â€¡n khuÄ‚Â´n mĂ¡ÂºÂ·t. ViĂ¡Â»â€¡c bĂ¡ÂºÂ¡n cĂ¡ÂºÂ§n lÄ‚Â m lÄ‚Â  giĂ¡Â»Â¯ Ă„â€˜iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i trĂ†Â°Ă¡Â»â€ºc mĂ¡ÂºÂ·t, cÄ‚Â´ng nghĂ¡Â»â€¡ nhĂ¡ÂºÂ­n diĂ¡Â»â€¡n khuÄ‚Â´n mĂ¡ÂºÂ·t sĂ¡ÂºÂ½ giÄ‚Âºp bĂ¡ÂºÂ¡n truy cĂ¡ÂºÂ­p vÄ‚Â o Ă„â€˜iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i mĂ¡Â»â„¢t cÄ‚Â¡ch nhanh chÄ‚Â³ng nhĂ†Â°ng khÄ‚Â´ng kÄ‚Â©m phĂ¡ÂºÂ§n an toÄ‚Â n.</p>\n<p><img alt=\"MĂ¡Â»Å¸ khÄ‚Â³a nhanh vÄ‚Â  bĂ¡ÂºÂ£o mĂ¡ÂºÂ­t an toÄ‚Â n vĂ¡Â»â€ºi xÄ‚Â¡c thĂ¡Â»Â±c sinh trĂ¡ÂºÂ¯c hĂ¡Â»ï¿½c\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-9.jpg\"></p>\n<p>NgoÄ‚Â i ra, SamSung A50 cÄ‚Â²n cÄ‚Â³ tÄ‚Â­nh nĂ„Æ’ng bĂ¡ÂºÂ£o mĂ¡ÂºÂ­t cÄ‚Â¡c thĂ†Â° mĂ¡Â»Â¥c cÄ‚Â¡ nhÄ‚Â¢n, giÄ‚Âºp ngĂ†Â°Ă¡Â»ï¿½i dÄ‚Â¹ng cÄ‚Â³ mĂ¡Â»â„¢t khÄ‚Â´ng gian riÄ‚Âªng tĂ†Â° mÄ‚Â  chĂ¡Â»â€° bĂ¡ÂºÂ¡n cÄ‚Â³ thĂ¡Â»Æ’ truy cĂ¡ÂºÂ­p.</p>\n<h3><strong>Mua SamSung Galaxy A50 chÄ‚Â­nh hÄ‚Â£ng giÄ‚Â¡ tĂ¡Â»â€˜t tĂ¡ÂºÂ¡i <a href=\"https://cellphones.com.vn\" title=\"HĂ¡Â»â€¡ thĂ¡Â»â€˜ng cĂ¡Â»Â­a hÄ‚Â ng bÄ‚Â¡n lĂ¡ÂºÂ» Ă„â€˜iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i chÄ‚Â­nh hÄ‚Â£ng\" target=\"_blank\">CellphoneS</a></strong></h3>\n<p><strong>Galaxy A50</strong> lÄ‚Â  mĂ¡Â»â„¢t smartphone tĂ¡ÂºÂ§m trung vĂ¡Â»â€ºi nhiĂ¡Â»ï¿½u&nbsp; tÄ‚Â­nh nĂ„Æ’ng hĂ¡ÂºÂ¥p dĂ¡ÂºÂ«n. NĂ¡ÂºÂ¿u bĂ¡ÂºÂ¡n Ă„â€˜ang quan tÄ‚Â¢m Ă„â€˜Ă¡ÂºÂ¿n sĂ¡ÂºÂ£n phĂ¡ÂºÂ©m nÄ‚Â y cÄ‚Â³ thĂ¡Â»Æ’ truy cĂ¡ÂºÂ­p vÄ‚Â o website hoĂ¡ÂºÂ·c Ă„â€˜Ă¡ÂºÂ¿n trĂ¡Â»Â±c tiĂ¡ÂºÂ¿p tĂ¡ÂºÂ¡i hĂ¡Â»â€¡ thĂ¡Â»â€˜ng bÄ‚Â¡n lĂ¡ÂºÂ» Ă„â€˜iĂ¡Â»â€¡n thoĂ¡ÂºÂ¡i chÄ‚Â­nh hÄ‚Â£ng CellPhoneS Ă„â€˜Ă¡Â»Æ’ trÄ‚Âªn tay vÄ‚Â  trĂ¡ÂºÂ£i nghiĂ¡Â»â€¡m.</p>\n</div>'),(3,'Iphone 4',1999090,'No',1999090,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,NULL),(4,'Iphone 4',2000020,'No',50000,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,NULL),(5,'HTC one m8',1000000,'No description',10000,200,1,'https://p.ipricegroup.com/uploaded_b63dfe683698a9e7fa2dbfca238f2448.jpg',NULL,NULL,NULL,NULL,NULL),(7,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(8,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(9,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(10,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(11,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(12,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(13,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(14,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(15,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(16,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(17,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(18,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(19,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(20,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(21,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(22,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(23,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(24,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(25,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(26,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(27,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(28,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(29,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(30,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(31,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(32,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(33,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(34,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(35,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(36,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(37,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(38,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(39,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(40,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(41,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(42,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(43,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(44,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(45,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(46,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(47,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(48,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(49,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(50,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(51,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(52,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(53,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(54,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(55,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(56,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(57,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(58,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(59,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(60,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(61,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(62,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(63,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(64,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(65,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(66,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(67,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(68,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(69,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(70,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(71,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(72,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(73,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(74,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(75,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(76,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(77,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(78,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(79,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(80,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(81,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(82,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'user'),(2,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) DEFAULT NULL,
  `first_name` varchar(10) DEFAULT NULL,
  `last_name` varchar(30) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `other_detail` text,
  `avatar` varchar(255) DEFAULT 'avatar.png',
  `about_me` varchar(255) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (2,2,'Tkw','hi',NULL,'123','avatar.png',NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,1,'Hoang','Huy',NULL,'No',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(7,10,'Huy','Hoang',NULL,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(8,13,'Huy','HoangHa',NULL,'',NULL,'',NULL,NULL,'Ha Noi','Ha Noi','VietNam');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) DEFAULT '1',
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'huy','123',1),(2,2,'admin','123',1),(3,1,'Tkw','0301',1),(4,2,'H','123',0),(6,1,'hoanghuy','2403',0),(8,1,'huyabc','2403',0),(10,2,'hoang','123',0),(13,2,'hoang123','123',0);
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

-- Dump completed on 2019-05-07 17:02:16
