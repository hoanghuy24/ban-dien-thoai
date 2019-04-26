-- MySQL dump 10.13  Distrib 8.0.15, for Win64 (x86_64)
--
-- Host: localhost    Database: sellphone
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,'dang dat',2),(2,'',4),(4,'',6),(5,'',8);
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
  PRIMARY KEY (`id`),
  KEY `id_cart` (`id_cart`),
  KEY `id_product` (`id_product`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_cart`) REFERENCES `cart` (`id`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`numberProduct`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (2,100,3,1),(3,10,4,1);
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
INSERT INTO `product` VALUES (1,'Iphone 4',2000000,'No',0,200,1,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg','4G','128G','abc','100M',NULL),(2,'Iphone 4',2000002,'No',50000,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,'<div class=\"blog-content\">\n<h2><strong><a href=\"https://cellphones.com.vn/samsung-galaxy-a50.html\" title=\"Ä�iá»‡n thoáº¡i Samsung Galaxy A50\" target=\"_blank\">Ä�iá»‡n thoáº¡i Samsung Galaxy A50</a> â€“ <a href=\"https://cellphones.com.vn/mobile.html\" title=\"Ä�iá»‡n thoáº¡i Smartphone chĂ­nh hĂ£ng\" target=\"_blank\">Smartphone</a> vá»›i mĂ n hĂ¬nh trĂ n viá»�n, cá»¥m 3 camera áº¥n tÆ°á»£ng</strong></h2>\n<p><em>Sau <a href=\"https://cellphones.com.vn/samsung-galaxy-a20.html\" title=\"Ä�iá»‡n thoáº¡i SamSUng Galaxy A20 chĂ­nh hĂ£ng\" target=\"_blank\"><strong>Galaxy A20</strong></a> vĂ  <a href=\"https://cellphones.com.vn/samsung-galaxy-a30-64gb.html\" title=\"Ä�iá»‡n thoáº¡i SamSung Galaxy A30 chĂ­nh hĂ£ng\" target=\"_blank\"><strong>Galaxy A30</strong></a> thĂ¬ má»›i Ä‘Ă¢y <a href=\"https://cellphones.com.vn/mobile/samsung.html\" title=\"Ä�iá»‡n thoáº¡i Samsung chĂ­nh hĂ£ng\" target=\"_blank\"><strong>SamSung</strong></a> tiáº¿p tá»¥c bá»• sung má»™t cĂ¡i tĂªn má»›i vĂ o danh sĂ¡ch <a href=\"https://cellphones.com.vn/mobile/samsung/galaxy-a.html\" title=\"Ä�iá»‡n thoáº¡i Samsung Galaxy A chĂ­nh hĂ£ng\" target=\"_blank\"><strong>Galaxy A</strong></a> cá»§a mĂ¬nh, Ä‘Ă³ chĂ­nh lĂ  <strong>SamSung Galaxy A50</strong>. A50 vá»›i nhiá»�u cĂ´ng nghá»‡ vá»›i vĂ  háº¥p dáº«n nhÆ° cáº£m biáº¿n vĂ¢n tay trong mĂ n hĂ¬nh, cá»¥m 3 camera há»©a háº¹n sáº½ mang Ä‘áº¿n tráº£i nghiá»‡m tuyá»‡t vá»�i cho ngÆ°á»�i dĂ¹ng.</em></p>\n<h3><strong>MĂ n hĂ¬nh 6.4 inch â€“ táº­n hÆ°á»Ÿng trá»�n váº¹n vá»›i mĂ n hĂ¬nh vĂ´ cá»±c</strong></h3>\n<p>Galaxy A50 sá»Ÿ há»¯u má»™t mĂ n hĂ¬nh cĂ³ kĂ­ch thÆ°á»›c lá»›n lĂªn Ä‘áº¿n 6.4 inch cĂ¹ng cĂ´ng nghá»‡ mĂ n hĂ¬nh Infinity-U trĂ n viá»�n mang Ä‘áº¿n nhá»¯ng tráº£i nghiá»‡m táº­n cĂ¹ng cho ngÆ°á»�i dĂ¹ng. CĂ¹ng vá»›i Ä‘Ă³ lĂ  táº¥m ná»�n<span style=\"color: #000000;\"> <a href=\"https://www.lifewire.com/super-amoled-4151073\" rel=\"nofollow\" title=\"Táº¥m ná»�n Super AMOLED\" target=\"_self\"><span style=\"color: #000000;\">Super AMOLED</span></a> ch</span>uáº©n FHD+ vĂ  mĂ n hĂ¬nh 16 triá»‡u mĂ u nhá»� Ä‘Ă³ A50 mang Ä‘áº¿n nhá»¯ng tráº£i nghiá»‡m xem hoĂ n toĂ n khĂ¡c biá»‡t vá»›i nhá»¯ng hĂ¬nh áº£nh sáº¯c nĂ©t, chĂ¢n thá»±c vĂ  sá»‘ng Ä‘á»™ng Ä‘áº¿n tá»«ng chi tiáº¿t.</p>\n<p><img alt=\"MĂ n hĂ¬nh 6.4 inch â€“ táº­n hÆ°á»Ÿng trá»�n váº¹n vá»›i mĂ n hĂ¬nh vĂ´ cá»±c\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-1.jpg\"></p>\n<p>BĂªn cáº¡nh má»™t mĂ n hĂ¬nh vĂ´ cá»±c vá»›i cháº¥t lÆ°á»£ng hiá»ƒn thá»‹ tá»‘t thĂ¬ Galaxy A50 cĂ²n sá»Ÿ há»¯u má»™t thiáº¿t káº¿ áº¥n tÆ°á»£ng vá»›i máº·t kĂ­nh 3D cao cáº¥p káº¿t há»£p viá»�n mĂ n hĂ¬nh cong trĂ n tinh táº¿ táº¡o nĂªn má»™t tá»•ng thá»ƒ nguyĂªn khá»‘i liá»�n máº¡ch hoĂ n háº£o nhá»� Ä‘Ă³ mĂ¡y cho kháº£ nÄƒng cáº§m náº¯m khĂ¡ cháº¯c cháº¯n. NgoĂ i ra, mĂ u sáº¯c cÅ©ng lĂ  má»™t Ä‘iá»ƒm nháº¥n áº¥n tÆ°á»£ng trĂªn A50 khi mĂ¡y sá»Ÿ há»¯u nhiá»�u phiĂªn báº£n mĂ u Ä‘á»™c Ä‘Ă¡o&nbsp; nhÆ° Ä‘en thiĂªn tháº¡ch, xanh Ä‘áº¡i dÆ°Æ¡ng vĂ  tráº¯ng ngá»�c trai.</p>\n<h3><strong>Bá»™ ba camera sau vá»›i kháº£ nÄƒng chá»¥p áº£nh AI cho nhá»¯ng bá»©c áº£nh chuáº©n nhiáº¿p áº£nh gia</strong></h3>\n<p>Vá»›i ba á»•ng kĂ­nh Ä‘a kháº©u Ä‘á»™, tá»« camera gĂ³c siĂªu rá»™ng 8MP mang Ä‘áº¿n gĂ³c chá»¥p 123 Ä‘á»™ tháº­t nhÆ° máº¯t nhĂ¬n Ä‘áº¿n camera Ä‘o chiá»�u sĂ¢u 5MP vĂ  camera kháº©u Ä‘á»™ lá»›n 25MP thu sĂ¡ng vÆ°á»£t trá»™i. NgoĂ i ra, cá»¥m camera sau trĂªn Galaxy A50 cĂ²n Ä‘Æ°á»£c tĂ­ch há»£p nhiá»�u tĂ­nh nÄƒng thĂ´ng minh nhÆ° cháº¿ Ä‘á»™ tá»‘i Æ°u hĂ³a cáº£nh giĂºp nháº­n diá»‡n chá»§ thá»ƒ. Hay cĂ´ng nghá»‡ trĂ­ thĂ´ng minh nhĂ¢n táº¡o AI giĂºp tá»± Ä‘á»™ng tá»‘i Æ°u Ä‘á»™ sĂ¡ng, Ä‘á»™ bĂ£o hĂ²a giĂºp bá»©c áº£nh luĂ´n Ä‘áº¹p hoĂ n háº£o.</p>\n<p><img alt=\"Vá»›i ba á»•ng kĂ­nh Ä‘a kháº©u Ä‘á»™, tá»« camera gĂ³c siĂªu rá»™ng 8MP mang Ä‘áº¿n gĂ³c chá»¥p 123 Ä‘á»™ tháº­t nhÆ° máº¯t nhĂ¬n Ä‘áº¿n camera Ä‘o chiá»�u sĂ¢u 5MP vĂ  camera kháº©u Ä‘á»™ lá»›n 25MP thu sĂ¡ng vÆ°á»£t trá»™i\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-2.jpg\"></p>\n<p>Táº¥t cáº£ Ä‘Ă³ giĂºp Galaxy A50 cho ra nhá»¯ng bá»©c áº£nh cĂ³ cháº¥t lÆ°á»£ng nhÆ° Ä‘Æ°á»£c chá»¥p bá»Ÿi nhá»¯ng nhiáº¿p áº£nh gia chuyĂªn nghiá»‡p. Báº¥t ká»ƒ thá»�i gian vĂ  khĂ´ng gian, hĂ nh trĂ¬nh cá»§a báº¡n sáº½ trá»Ÿ nĂªn trá»�n váº¹n vá»›i cá»¥m 3 camera sáºµn sĂ ng báº¯t trá»�n má»�i nĂ©t Ä‘áº¹p dĂ¹ trong Ä‘iá»�u kiá»‡n thiáº¿u sĂ¡ng.&nbsp;</p>\n<p>Ä�áº·c biĂªt vá»›i tĂ­nh nÄƒng nháº­n diá»‡n áº£nh lá»—i khi Galaxy A50 cĂ³ thá»ƒ phĂ¢n biá»‡t Ä‘Æ°á»£c cĂ¡c trÆ°á»�ng há»£p máº¯t nháº¯m, á»‘ng kĂ­nh bá»‹ má»� hay ngÆ°á»£c sĂ¡ng. Nhá»� Ä‘Ă³ ngÆ°á»�i dĂ¹ng cĂ³ thá»ƒ ká»‹p thá»�i Ä‘iá»�u chá»‰nh vĂ  cho ra nhá»¯ng khoáº£nh kháº¯c hoĂ n háº£o vĂ  sáº¯c nĂ©t nháº¥t.</p>\n<p><img alt=\"camera gĂ³c siĂªu rá»™ng 8MP mang Ä‘áº¿n gĂ³c chá»¥p 123 Ä‘á»™ tháº­t nhÆ° máº¯t nhĂ¬n\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-3.jpg\"></p>\n<p>NgoĂ i cá»¥m ba camera sau thĂ¬ camera trÆ°á»›c cá»§a Galaxy A50 cÅ©ng khĂ¡ áº¥n tÆ°á»£ng vá»›i Ä‘á»™ phĂ¢n giáº£i 25MP cho hĂ¬nh áº£nh luĂ´n rĂµ rĂ ng, sáº¯c nĂ©t dĂ¹ trong Ä‘iá»�u kiá»‡n thiáº¿u sĂ¡ng hay dÆ°á»›i Ă¡nh náº¯ng chĂ³i chang. CĂ¹ng nhiá»�u tĂ­nh nÄƒng chá»‰nh sá»­a, lĂ m Ä‘áº¹p thĂ´ng minh nhÆ° tá»± Ä‘á»™ng lĂ m má»� háº­u cáº£nh giĂºp cho ra bá»©c hĂ¬nh selfie tuyá»‡t Ä‘áº¹p chá»‰ trong nhĂ¡y máº¯t.</p>\n<p><img alt=\"Tinh chá»‰nh áº£nh thĂ´ng minh vá»›i cĂ´ng nghá»‡ AI\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-4.jpg\"></p>\n<p>NgoĂ i ra báº¡n cĂ²n thá»�a sá»©c thá»ƒ hiá»‡n sá»± khĂ¡c biá»‡t, cĂ¡ tĂ­nh hay sá»± sĂ¡ng táº¡o nhá»¯ng biá»ƒu tÆ°á»£ng cáº£m xĂºc cá»§a riĂªng mĂ¬nh, khĂ´ng láº«n vá»›i báº¥t ká»³ ai thĂ´ng qua bá»™ sticker vĂ  bá»™ lá»�c AR.</p>\n<p><img alt=\"Thá»�a thĂ­ch thá»ƒ hiá»‡n cháº¥t tĂ´i khĂ¡c biá»‡t\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-5.jpg\"></p>\n<h3><strong>Hiá»‡u nÄƒng vÆ°á»£t trá»™i vá»›i con chip <a href=\"https://cellphones.com.vn/sforum/samsung-trinh-lang-exynos-9610-tang-kha-nang-xu-ly-ai-quay-slow-motion-ra-mat-vao-q2-2018\" title=\"Samsung trĂ¬nh lĂ ng Exynos 9610\" target=\"_blank\">Exynos 9 Octa 9610</a> cĂ¹ng giao diá»‡n <a href=\"https://cellphones.com.vn/sforum/samsung-cong-bo-giao-dien-one-ui-moi-danh-cho-smartphone\" title=\"Samsung cĂ´ng bá»‘ giao diá»‡n One UI\" target=\"_blank\">One UI</a> tĂ¢n tiáº¿n</strong></h3>\n<p>Vá»� pháº§n cá»©ng, Galaxy A50 Ä‘Æ°á»£c trang bá»‹ con chip cĂ¢y nhĂ  lĂ¡ vÆ°á»�n Exynos 9 Octa 9610 cho hiá»‡u nÄƒng vÆ°á»£t trá»™i vá»›i cĂ¡c tĂ¡c vá»¥ cÆ¡ báº£n nhÆ° lÆ°á»›t web, nghe nháº¡c, xem Youtube. CĂ¹ng vá»›i Ä‘Ă³ lĂ  con chi<span style=\"color: #000000;\">p <a href=\"https://www.notebookcheck.net/ARM-Mali-G72-MP3-GPU.301008.0.html\" rel=\"nofollow\" title=\"ARM Mali-G72 MP3\" target=\"_blank\"><span style=\"color: #000000;\">Mali-G72 MP3</span></a>, 4GB</span> RAM cho A50 kháº£ nÄƒng chÆ¡i game mÆ°á»£t mĂ , Ä‘a nhiá»‡m tá»‘t.</p>\n<p><img alt=\"Hiá»‡u nÄƒng vÆ°á»£t trá»™i vá»›i con chip Exynos 9 Octa 9610 cĂ¹ng giao diá»‡n One UI tĂ¢n tiáº¿n\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-6.jpg\"></p>\n<p>MĂ¡y cĂ²n Ä‘Æ°á»£c bĂ¡n ra vá»›i há»‡ Ä‘iá»�u hĂ nh <a href=\"https://www.android.com/versions/pie-9-0/\" rel=\"nofollow\" title=\"Há»‡ Ä‘iá»�u hĂ nh Android 9.0 (pie)\" target=\"_blank\">Android v9.0 (Pie)</a> cĂ i sáºµn, giao diá»‡n One UI giĂºp tá»‘i Æ°u tráº£i nghiá»‡m. Ä�áº·c biá»‡t, Galaxy A50 cĂ²n Ä‘Æ°á»£c SamSung tĂ­ch há»£p cháº¿ Ä‘á»™ ban Ä‘Ăªm cho chĂ©p ngÆ°á»�i dĂ¹ng chuyá»ƒn Ä‘á»•i dá»… dĂ ng sang tá»‘ng tá»‘i, mang láº¡i cáº£m giĂ¡c dá»… chá»‹u cho máº¯t.</p>\n<h3><strong>ViĂªn pin 4000 mAh mang Ä‘áº¿n tráº£i nghiá»‡m xuyĂªn xuá»‘t ngĂ y dĂ i</strong></h3>\n<p>Galaxy A50 Ä‘Æ°á»£c trang bá»‹ viĂªn pin máº¡nh máº½ 4.000 mAh cá»¥c khá»§ng mang Ä‘áº¿n nhá»¯ng tráº£i nghiá»‡m xuyĂªn xuá»‘t. ViĂªn pin Ä‘Æ°á»£c SamSung Ä‘Ă¡nh giĂ¡ thá»�i gian sá»­ dá»¥ng 3G liĂªn tá»¥c khoáº£ng 12 giá»�, 19 giá»� phĂ¡t video, 92 giá»� nghe Audio, 14 giá»� sá»­ dá»¥ng 4G, 15 giá»� sá»­ dá»¥ng wifi vĂ  Ä‘Ă m thoáº¡i lĂªn Ä‘áº¿n 23 giá»�.</p>\n<p><img alt=\"ViĂªn pin 4000 mAh mang Ä‘áº¿n tráº£i nghiá»‡m xuyĂªn xuá»‘t ngĂ y dĂ i\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-7.jpg\"></p>\n<p>BĂªn cáº¡nh Ä‘Ă³, Galaxy A50 cĂ²n Ä‘Æ°á»£c trang bá»‹ sáº¡c nhanh cĂ´ng suáº¥t 15W giĂºp nhá»¯ng tráº£i nghiá»‡m dĂ¹ng, chÆ¡i game hay xem chÆ°Æ¡ng trĂ¬nh trá»±c tiáº¿p luĂ´n diá»…n ra xuyĂªn suá»‘t, liá»�n máº¡ch hoĂ n háº£o.</p>\n<h3><strong>Trá»£ lĂ½ áº£o <a href=\"https://cellphones.com.vn/sforum/cung-nghe-tro-ly-ao-bixby-rap-va-beatbox-cuc-chat-tu-nhan-minh-tot-hon-siri\" title=\"CĂ¹ng nghe trá»£ lĂ½ áº£o Bixby rap vĂ  beatbox cá»±c cháº¥t\" target=\"_blank\">Bixby</a> nĂ¢ng cao kháº£ nÄƒng tráº£i ngiá»‡m vĂ  khĂ¡m phĂ¡</strong></h3>\n<p>Bixby trĂªn A50 giĂºp ngÆ°á»�i dĂ¹ng dá»… dĂ ng khĂ¡m phĂ¡ nhá»¯ng ká»· nguyĂªn thĂ´ng tin vá»›i nhá»¯ng thao tĂ¡c Ä‘Æ¡n giáº£n nhÆ° sá»­ dá»¥ng giá»�ng nĂ³i&nbsp; cho phĂ©p tĂ¬m kiáº¿m má»£i thĂ´ng tin trĂªn Ä‘iá»‡n thoáº¡i.</p>\n<p><img alt=\"Trá»£ lĂ½ áº£o Bixby nĂ¢ng cao kháº£ nÄƒng tráº£i ngiá»‡m vĂ  khĂ¡m phĂ¡\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-8.jpg\"></p>\n<p>NgoĂ i ra cĂ²n Bixby Vision, Bixby Home Ä‘Æ°á»£c tĂ­ch há»£p ngay trong camera cho phĂ©p báº¡n tĂ¬m kiáº¿m váº­t thá»ƒ, dá»‹ch tĂ i liá»‡u dá»… dĂ ng, quĂ©t danh thiáº¿p Ä‘á»ƒ lÆ°u trá»¯ trong Ä‘iá»‡n thoáº¡i, sá»­ dá»¥ng báº¥t cá»© lĂºc nĂ o báº¡n cáº§n.</p>\n<h3><strong>Má»Ÿ khĂ³a nhanh vĂ  báº£o máº­t an toĂ n vá»›i xĂ¡c thá»±c sinh tráº¯c há»�c</strong></h3>\n<p>Galaxy A50 vá»›i&nbsp; cĂ´ng nghá»‡ báº£o máº­t sinh tráº¯c há»�c tĂ¢n tiáº¿n vá»›i kháº£ nÄƒng quĂ©t vĂ¢n tay&nbsp; dÆ°á»›i mĂ n hĂ¬nh nhanh chĂ³ng vĂ  an toĂ n. NgoĂ i ra, báº¡n cÅ©ng cĂ³ thá»ƒ lá»±a chá»�n má»™t phÆ°Æ¡ng thá»©c khĂ¡c vĂ  nhanh chĂ³ng khĂ´ng kĂ©m Ä‘Ă³ chĂ­nh lĂ  nháº­n diá»‡n khuĂ´n máº·t. Viá»‡c báº¡n cáº§n lĂ m lĂ  giá»¯ Ä‘iá»‡n thoáº¡i trÆ°á»›c máº·t, cĂ´ng nghá»‡ nháº­n diá»‡n khuĂ´n máº·t sáº½ giĂºp báº¡n truy cáº­p vĂ o Ä‘iá»‡n thoáº¡i má»™t cĂ¡ch nhanh chĂ³ng nhÆ°ng khĂ´ng kĂ©m pháº§n an toĂ n.</p>\n<p><img alt=\"Má»Ÿ khĂ³a nhanh vĂ  báº£o máº­t an toĂ n vá»›i xĂ¡c thá»±c sinh tráº¯c há»�c\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-9.jpg\"></p>\n<p>NgoĂ i ra, SamSung A50 cĂ²n cĂ³ tĂ­nh nÄƒng báº£o máº­t cĂ¡c thÆ° má»¥c cĂ¡ nhĂ¢n, giĂºp ngÆ°á»�i dĂ¹ng cĂ³ má»™t khĂ´ng gian riĂªng tÆ° mĂ  chá»‰ báº¡n cĂ³ thá»ƒ truy cáº­p.</p>\n<h3><strong>Mua SamSung Galaxy A50 chĂ­nh hĂ£ng giĂ¡ tá»‘t táº¡i <a href=\"https://cellphones.com.vn\" title=\"Há»‡ thá»‘ng cá»­a hĂ ng bĂ¡n láº» Ä‘iá»‡n thoáº¡i chĂ­nh hĂ£ng\" target=\"_blank\">CellphoneS</a></strong></h3>\n<p><strong>Galaxy A50</strong> lĂ  má»™t smartphone táº§m trung vá»›i nhiá»�u&nbsp; tĂ­nh nÄƒng háº¥p dáº«n. Náº¿u báº¡n Ä‘ang quan tĂ¢m Ä‘áº¿n sáº£n pháº©m nĂ y cĂ³ thá»ƒ truy cáº­p vĂ o website hoáº·c Ä‘áº¿n trá»±c tiáº¿p táº¡i há»‡ thá»‘ng bĂ¡n láº» Ä‘iá»‡n thoáº¡i chĂ­nh hĂ£ng CellPhoneS Ä‘á»ƒ trĂªn tay vĂ  tráº£i nghiá»‡m.</p>\n</div>'),(3,'Iphone 4',1999090,'No',1999090,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,NULL),(4,'Iphone 4',2000020,'No',50000,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,NULL),(5,'HTC one m8',1000000,'No description',10000,200,1,'https://p.ipricegroup.com/uploaded_b63dfe683698a9e7fa2dbfca238f2448.jpg',NULL,NULL,NULL,NULL,NULL),(7,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(8,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(9,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(10,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(11,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(12,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(13,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(14,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(15,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(16,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(17,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(18,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(19,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(20,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(21,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(22,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(23,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(24,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(25,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(26,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(27,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(28,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(29,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(30,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(31,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(32,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(33,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(34,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(35,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(36,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(37,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(38,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(39,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(40,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(41,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(42,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(43,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(44,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(45,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(46,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(47,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(48,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(49,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(50,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(51,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(52,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(53,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(54,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(55,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(56,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(57,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(58,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(59,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(60,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(61,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(62,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(63,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(64,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(65,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(66,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(67,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(68,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(69,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(70,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(71,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(72,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(73,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(74,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(75,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(76,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(77,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(78,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(79,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(80,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(81,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL),(82,'Sony',123213,'No ',12312313,10000,4,'https://cdn.tgdd.vn/Products/Images/42/146014/sony-xperia-xz2-1-600x600.jpg',NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (2,2,'Tkw','hi',NULL,'123','avatar.png',NULL,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'huy','123',1),(2,2,'admin','123',1),(3,1,'Tkw','0301',1),(4,NULL,'H','123',0),(6,NULL,'hoanghuy','2403',0),(8,NULL,'huyabc','2403',0);
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

-- Dump completed on 2019-04-26 17:27:13
