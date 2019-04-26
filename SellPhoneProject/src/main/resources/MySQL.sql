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
  `long_description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`numberProduct`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Iphone 4',2000000,'No',0,200,1,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg','4G','128G','abc','100M',NULL),(2,'Iphone 4',2000002,'No',50000,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,'<div class=\"blog-content\">\n<h2><strong><a href=\"https://cellphones.com.vn/samsung-galaxy-a50.html\" title=\"Điện thoại Samsung Galaxy A50\" target=\"_blank\">Điện thoại Samsung Galaxy A50</a> – <a href=\"https://cellphones.com.vn/mobile.html\" title=\"Điện thoại Smartphone chính hãng\" target=\"_blank\">Smartphone</a> với màn hình tràn viền, cụm 3 camera ấn tượng</strong></h2>\n<p><em>Sau <a href=\"https://cellphones.com.vn/samsung-galaxy-a20.html\" title=\"Điện thoại SamSUng Galaxy A20 chính hãng\" target=\"_blank\"><strong>Galaxy A20</strong></a> và <a href=\"https://cellphones.com.vn/samsung-galaxy-a30-64gb.html\" title=\"Điện thoại SamSung Galaxy A30 chính hãng\" target=\"_blank\"><strong>Galaxy A30</strong></a> thì mới đây <a href=\"https://cellphones.com.vn/mobile/samsung.html\" title=\"Điện thoại Samsung chính hãng\" target=\"_blank\"><strong>SamSung</strong></a> tiếp tục bổ sung một cái tên mới vào danh sách <a href=\"https://cellphones.com.vn/mobile/samsung/galaxy-a.html\" title=\"Điện thoại Samsung Galaxy A chính hãng\" target=\"_blank\"><strong>Galaxy A</strong></a> của mình, đó chính là <strong>SamSung Galaxy A50</strong>. A50 với nhiều công nghệ với và hấp dẫn như cảm biến vân tay trong màn hình, cụm 3 camera hứa hẹn sẽ mang đến trải nghiệm tuyệt vời cho người dùng.</em></p>\n<h3><strong>Màn hình 6.4 inch – tận hưởng trọn vẹn với màn hình vô cực</strong></h3>\n<p>Galaxy A50 sở hữu một màn hình có kích thước lớn lên đến 6.4 inch cùng công nghệ màn hình Infinity-U tràn viền mang đến những trải nghiệm tận cùng cho người dùng. Cùng với đó là tấm nền<span style=\"color: #000000;\"> <a href=\"https://www.lifewire.com/super-amoled-4151073\" rel=\"nofollow\" title=\"Tấm nền Super AMOLED\" target=\"_self\"><span style=\"color: #000000;\">Super AMOLED</span></a> ch</span>uẩn FHD+ và màn hình 16 triệu màu nhờ đó A50 mang đến những trải nghiệm xem hoàn toàn khác biệt với những hình ảnh sắc nét, chân thực và sống động đến từng chi tiết.</p>\n<p><img alt=\"Màn hình 6.4 inch – tận hưởng trọn vẹn với màn hình vô cực\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-1.jpg\"></p>\n<p>Bên cạnh một màn hình vô cực với chất lượng hiển thị tốt thì Galaxy A50 còn sở hữu một thiết kế ấn tượng với mặt kính 3D cao cấp kết hợp viền màn hình cong tràn tinh tế tạo nên một tổng thể nguyên khối liền mạch hoàn hảo nhờ đó máy cho khả năng cầm nắm khá chắc chắn. Ngoài ra, màu sắc cũng là một điểm nhấn ấn tượng trên A50 khi máy sở hữu nhiều phiên bản màu độc đáo&nbsp; như đen thiên thạch, xanh đại dương và trắng ngọc trai.</p>\n<h3><strong>Bộ ba camera sau với khả năng chụp ảnh AI cho những bức ảnh chuẩn nhiếp ảnh gia</strong></h3>\n<p>Với ba ổng kính đa khẩu độ, từ camera góc siêu rộng 8MP mang đến góc chụp 123 độ thật như mắt nhìn đến camera đo chiều sâu 5MP và camera khẩu độ lớn 25MP thu sáng vượt trội. Ngoài ra, cụm camera sau trên Galaxy A50 còn được tích hợp nhiều tính năng thông minh như chế độ tối ưu hóa cảnh giúp nhận diện chủ thể. Hay công nghệ trí thông minh nhân tạo AI giúp tự động tối ưu độ sáng, độ bão hòa giúp bức ảnh luôn đẹp hoàn hảo.</p>\n<p><img alt=\"Với ba ổng kính đa khẩu độ, từ camera góc siêu rộng 8MP mang đến góc chụp 123 độ thật như mắt nhìn đến camera đo chiều sâu 5MP và camera khẩu độ lớn 25MP thu sáng vượt trội\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-2.jpg\"></p>\n<p>Tất cả đó giúp Galaxy A50 cho ra những bức ảnh có chất lượng như được chụp bởi những nhiếp ảnh gia chuyên nghiệp. Bất kể thời gian và không gian, hành trình của bạn sẽ trở nên trọn vẹn với cụm 3 camera sẵn sàng bắt trọn mọi nét đẹp dù trong điều kiện thiếu sáng.&nbsp;</p>\n<p>Đặc biêt với tính năng nhận diện ảnh lỗi khi Galaxy A50 có thể phân biệt được các trường hợp mắt nhắm, ống kính bị mờ hay ngược sáng. Nhờ đó người dùng có thể kịp thời điều chỉnh và cho ra những khoảnh khắc hoàn hảo và sắc nét nhất.</p>\n<p><img alt=\"camera góc siêu rộng 8MP mang đến góc chụp 123 độ thật như mắt nhìn\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-3.jpg\"></p>\n<p>Ngoài cụm ba camera sau thì camera trước của Galaxy A50 cũng khá ấn tượng với độ phân giải 25MP cho hình ảnh luôn rõ ràng, sắc nét dù trong điều kiện thiếu sáng hay dưới ánh nắng chói chang. Cùng nhiều tính năng chỉnh sửa, làm đẹp thông minh như tự động làm mờ hậu cảnh giúp cho ra bức hình selfie tuyệt đẹp chỉ trong nháy mắt.</p>\n<p><img alt=\"Tinh chỉnh ảnh thông minh với công nghệ AI\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-4.jpg\"></p>\n<p>Ngoài ra bạn còn thỏa sức thể hiện sự khác biệt, cá tính hay sự sáng tạo những biểu tượng cảm xúc của riêng mình, không lẫn với bất kỳ ai thông qua bộ sticker và bộ lọc AR.</p>\n<p><img alt=\"Thỏa thích thể hiện chất tôi khác biệt\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-5.jpg\"></p>\n<h3><strong>Hiệu năng vượt trội với con chip <a href=\"https://cellphones.com.vn/sforum/samsung-trinh-lang-exynos-9610-tang-kha-nang-xu-ly-ai-quay-slow-motion-ra-mat-vao-q2-2018\" title=\"Samsung trình làng Exynos 9610\" target=\"_blank\">Exynos 9 Octa 9610</a> cùng giao diện <a href=\"https://cellphones.com.vn/sforum/samsung-cong-bo-giao-dien-one-ui-moi-danh-cho-smartphone\" title=\"Samsung công bố giao diện One UI\" target=\"_blank\">One UI</a> tân tiến</strong></h3>\n<p>Về phần cứng, Galaxy A50 được trang bị con chip cây nhà lá vườn Exynos 9 Octa 9610 cho hiệu năng vượt trội với các tác vụ cơ bản như lướt web, nghe nhạc, xem Youtube. Cùng với đó là con chi<span style=\"color: #000000;\">p <a href=\"https://www.notebookcheck.net/ARM-Mali-G72-MP3-GPU.301008.0.html\" rel=\"nofollow\" title=\"ARM Mali-G72 MP3\" target=\"_blank\"><span style=\"color: #000000;\">Mali-G72 MP3</span></a>, 4GB</span> RAM cho A50 khả năng chơi game mượt mà, đa nhiệm tốt.</p>\n<p><img alt=\"Hiệu năng vượt trội với con chip Exynos 9 Octa 9610 cùng giao diện One UI tân tiến\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-6.jpg\"></p>\n<p>Máy còn được bán ra với hệ điều hành <a href=\"https://www.android.com/versions/pie-9-0/\" rel=\"nofollow\" title=\"Hệ điều hành Android 9.0 (pie)\" target=\"_blank\">Android v9.0 (Pie)</a> cài sẵn, giao diện One UI giúp tối ưu trải nghiệm. Đặc biệt, Galaxy A50 còn được SamSung tích hợp chế độ ban đêm cho chép người dùng chuyển đổi dễ dàng sang tống tối, mang lại cảm giác dễ chịu cho mắt.</p>\n<h3><strong>Viên pin 4000 mAh mang đến trải nghiệm xuyên xuốt ngày dài</strong></h3>\n<p>Galaxy A50 được trang bị viên pin mạnh mẽ 4.000 mAh cục khủng mang đến những trải nghiệm xuyên xuốt. Viên pin được SamSung đánh giá thời gian sử dụng 3G liên tục khoảng 12 giờ, 19 giờ phát video, 92 giờ nghe Audio, 14 giờ sử dụng 4G, 15 giờ sử dụng wifi và đàm thoại lên đến 23 giờ.</p>\n<p><img alt=\"Viên pin 4000 mAh mang đến trải nghiệm xuyên xuốt ngày dài\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-7.jpg\"></p>\n<p>Bên cạnh đó, Galaxy A50 còn được trang bị sạc nhanh công suất 15W giúp những trải nghiệm dùng, chơi game hay xem chương trình trực tiếp luôn diễn ra xuyên suốt, liền mạch hoàn hảo.</p>\n<h3><strong>Trợ lý ảo <a href=\"https://cellphones.com.vn/sforum/cung-nghe-tro-ly-ao-bixby-rap-va-beatbox-cuc-chat-tu-nhan-minh-tot-hon-siri\" title=\"Cùng nghe trợ lý ảo Bixby rap và beatbox cực chất\" target=\"_blank\">Bixby</a> nâng cao khả năng trải ngiệm và khám phá</strong></h3>\n<p>Bixby trên A50 giúp người dùng dễ dàng khám phá những kỷ nguyên thông tin với những thao tác đơn giản như sử dụng giọng nói&nbsp; cho phép tìm kiếm mợi thông tin trên điện thoại.</p>\n<p><img alt=\"Trợ lý ảo Bixby nâng cao khả năng trải ngiệm và khám phá\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-8.jpg\"></p>\n<p>Ngoài ra còn Bixby Vision, Bixby Home được tích hợp ngay trong camera cho phép bạn tìm kiếm vật thể, dịch tài liệu dễ dàng, quét danh thiếp để lưu trữ trong điện thoại, sử dụng bất cứ lúc nào bạn cần.</p>\n<h3><strong>Mở khóa nhanh và bảo mật an toàn với xác thực sinh trắc học</strong></h3>\n<p>Galaxy A50 với&nbsp; công nghệ bảo mật sinh trắc học tân tiến với khả năng quét vân tay&nbsp; dưới màn hình nhanh chóng và an toàn. Ngoài ra, bạn cũng có thể lựa chọn một phương thức khác và nhanh chóng không kém đó chính là nhận diện khuôn mặt. Việc bạn cần làm là giữ điện thoại trước mặt, công nghệ nhận diện khuôn mặt sẽ giúp bạn truy cập vào điện thoại một cách nhanh chóng nhưng không kém phần an toàn.</p>\n<p><img alt=\"Mở khóa nhanh và bảo mật an toàn với xác thực sinh trắc học\" src=\"https://cellphones.com.vn/media/wysiwyg/mobile/samsung/Galaxy-A50-9.jpg\"></p>\n<p>Ngoài ra, SamSung A50 còn có tính năng bảo mật các thư mục cá nhân, giúp người dùng có một không gian riêng tư mà chỉ bạn có thể truy cập.</p>\n<h3><strong>Mua SamSung Galaxy A50 chính hãng giá tốt tại <a href=\"https://cellphones.com.vn\" title=\"Hệ thống cửa hàng bán lẻ điện thoại chính hãng\" target=\"_blank\">CellphoneS</a></strong></h3>\n<p><strong>Galaxy A50</strong> là một smartphone tầm trung với nhiều&nbsp; tính năng hấp dẫn. Nếu bạn đang quan tâm đến sản phẩm này có thể truy cập vào website hoặc đến trực tiếp tại hệ thống bán lẻ điện thoại chính hãng CellPhoneS để trên tay và trải nghiệm.</p>\n</div>'),(3,'Iphone 4',1999090,'No',1999090,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,NULL),(4,'Iphone 4',2000020,'No',50000,200,2,'https://static.digitecgalaxus.ch/Files/7/5/1/1/2/9/8/iPhoneSE_SpGry_PureAngles_ROW_WW-EN-SCREEN.jpg?fit=inside%7C1116:811&output-format=progressive-jpeg',NULL,NULL,NULL,NULL,NULL),(5,'HTC one m8',1000000,'No description',10000,200,1,'https://p.ipricegroup.com/uploaded_b63dfe683698a9e7fa2dbfca238f2448.jpg',NULL,NULL,NULL,NULL,NULL);
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_user` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (2,2,'Tkw','hi',NULL,'123','avatar.png');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'huy','123',1),(2,2,'admin','123',1),(3,1,'Tkw','0301',1);
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

-- Dump completed on 2019-04-24 11:21:12
