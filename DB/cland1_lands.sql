-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: cland1
-- ------------------------------------------------------
-- Server version	8.0.13

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
-- Table structure for table `lands`
--

DROP TABLE IF EXISTS `lands`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lands` (
  `lid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lname` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `detail` longtext COLLATE utf8mb4_unicode_ci,
  `date_create` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `cid` int(10) unsigned NOT NULL,
  `picture` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` int(11) DEFAULT NULL,
  `address` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `count_views` int(11) NOT NULL DEFAULT '0',
  `uid` int(3) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lands`
--

LOCK TABLES `lands` WRITE;
/*!40000 ALTER TABLE `lands` DISABLE KEYS */;
INSERT INTO `lands` VALUES (1,'Bán chung cư xã hội Bùa Tràm, giá 12.775 triệu/1m2','Chử đầu tư mở bán chung cư xã hội Bàu Tràm giá 12.775 triêu/1m2\r\n- Vị trí chung cư: Lô B41 khu đô thị Bàu Tràm Lakeside, Hoà Hiệp Nam, Liên Chiểu, Đà Nẵng\r\n- Thời gian bàn giao: cuối năm 2022','<p>- Điều kiện mua chung cư nh&agrave; ở x&atilde; hội Người hộ khẩu Đ&agrave; Nẵng: + Kh&ocirc;ng đ&oacute;ng thuế thu nhập c&aacute; nh&acirc;n + Kh&ocirc;ng c&oacute; kh&ocirc;ng c&oacute; nh&agrave; c&oacute; đất ở Đ&agrave; Nẵng Người hộ khẩu ngoại tỉnh: + Kh&ocirc;ng đ&oacute;ng thuế thu nhập c&aacute; nh&acirc;n + Kh&ocirc;ng c&oacute; kh&ocirc;ng c&oacute; nh&agrave; c&oacute; đất ở Đ&agrave; Nẵng + C&oacute; tạm tr&uacute; tr&ecirc;n Đ&agrave; Nẵng 1 năm. +C&oacute; đ&oacute;ng bhxh tr&ecirc;n 1 năm - Qu&yacute; kh&aacute;ch h&agrave;ng c&oacute; nhu cầu xin vui l&ograve;ng li&ecirc;n hệ với ch&uacute;ng t&ocirc;i để được tư vấn ạ</p>\r\n','2022-05-14 09:55:37',1,'1-72741137944400.jpg',70,'location Khu công nghiệp Hòa Khánh, Phường Hòa Khánh Bắc, Quận Liên Chiểu, Đà Nẵng',125,1),(2,'Căn góc view cầu Rồng','căn hộ Hiyori 2 phòng ngủ căn góc view trực diện cầu Rồng. Căn hộ đầy đủ nôi thất khách hàng xách valy vào ở ngay không cần mua sắm gì thêm','<p>Căn hộ được trang bị sẵn tivi, tủ lạnh, m&aacute;y giặt sấy, b&agrave;n ghế sofa, b&agrave;n ghế ăn, giường nệm....... Diện t&iacute;ch : 70 m2 Thiết kế: 2 ph&ograve;ng ngủ, 1 ph&ograve;ng kh&aacute;ch, 1 ph&ograve;ng bếp, 2 wc .Ph&aacute;p l&yacute; : sổ hồng sở hữu d&agrave;i hạn Li&ecirc;n hệ : *** (Zalo, viber, whatsapp, imess) Địa chỉ : A02 V&otilde; Văn Kiệt, Q. Sơn Tr&agrave;. TP Đ&agrave; Nẵng</p>\r\n','2022-05-15 14:37:40',2,'2-72884286095100.jpg',70,' đường Võ Văn Kiệt, Phường An Hải Đông, Quận Sơn Trà, Đà Nẵng',202,2),(3,'Căn Azura 2PN DT đặc biệt 152m2, view Sông và biển','Dự Án: Căn hộ cao cấp Azura','<p>Căn Azura loại 2PN DT đặc biệt đẹp đang b&aacute;n tại Azura DT 152m2 Nội thất mới sạch sẽ đặc biệt tầng cao, view cả s&ocirc;ng H&agrave;n, Biển, v&agrave; n&uacute;i sơn tr&agrave; Hiện chủ cần thanh khoản gấp để đi nước ngo&agrave;i LH Ms Linh l&agrave;m gi&aacute; trực tiếp</p>\r\n','2022-05-14 10:00:05',1,'44-73009625574700.jpg',155,'339, 339 Đường Trần Hưng Đạo, Phường An Hải Bắc, Quận Sơn Trà, Đà Nẵng ',800,3),(4,'Bán căn hộ hướng Đông view biển 2PN 66m2','\r\nDự Án: Mường Thanh Sơn Trà','<p>*** Cần b&aacute;n căn hộ chung cư Mường Thanh, nằm ph&iacute;a sau đường biển V&otilde; Nguy&ecirc;n Gi&aacute;p, ph&iacute;a trước l&agrave; b&atilde;i tắm Mỹ Kh&ecirc;, Sơn Tr&agrave;. *** Căn hộ 2pn 2wc, 66m2, ban c&ocirc;ng hướng Đ&ocirc;ng view biển Mỹ Kh&ecirc;. *** Đầy đủ nội thất. *** Tầng cao view đẹp th&ocirc;ng tho&aacute;ng, y&ecirc;n tĩnh, m&aacute;t mẽ. *** An ninh 24/24, tầng hầm chỗ để xe m&aacute;y xe &ocirc;t&ocirc;. *** Ph&aacute;p l&yacute; r&otilde; r&agrave;ng, mua b&aacute;n nhanh gọn. *** Gi&aacute; tốt tiếp kh&aacute;ch thiện ch&iacute;. ( Gi&aacute; đ&atilde; bao to&agrave;n bộ ph&iacute; v&agrave; để lại to&agrave;n bộ nội thất) *** Xin cảm ơn!</p>\r\n','2022-05-16 01:32:58',3,'66-74077606813200.jpg',65,' 270, 270 Đường Võ Nguyên Giáp, Phường Phước Mỹ, Quận Sơn Trà, Đà Nẵng',503,4),(5,'Căn Hộ Cao Cấp The Filmore Đà Nẵng','???? ??????? Đ?̀ ??̆̃?? - ???̂? ??̃?? ??̂? ??̛̀ ??̂?? ??̀?\r\n? ?̛? Đ?̃? ??????? 100.000.000 ???̛?̛́? ???̀? ??/?','<p>hủ đầu tư:C&ocirc;ng Ty Cổ Phần Ph&aacute;t Triển Bất Động Sản Filmore ❤Quy m&ocirc; dự &aacute;n: Tổng diện t&iacute;ch : 1.504m2 ❤Số tầng : 25 tầng v&agrave; 3 tầng hầm Tổng số căn hộ cao cấp : 206 căn ( Diện t&iacute;ch từ 48m2 - 125m2) ✅Loại h&igrave;nh : 1PN, 2 PN, 3PN, Dual Key... Mật độ x&acirc;y dựng: 55.6% ⛳️ ??̣ ???́: 3 MT đường Bạch Đằng - B&igrave;nh Minh 5 - Trần Văn Trứ - TP Đ&agrave; Nẵng ⛳️ Nằm ngay đại lộ ???? Đ?̂ ?́?? ??́?? ⛳️ Con đường tổ chức những ??̂̃ ??̣̂? ??̛́? tại Đ&agrave; Nẵng ⛳️ Tuyến phố đi bộ ban đ&ecirc;m ⛳️ ??̉? ???̂̉?: căn hộ high touch cao cấp sở hữu l&acirc;u d&agrave;i ? Ph&aacute;p L&yacute; : sổ hồng sở hữu l&acirc;u d&agrave;i</p>\r\n','2022-05-15 03:02:22',2,'7-73975964561400.jpg',55,'Đường Bạch Đằng, Phường Bình Thuận, Quận Hải Châu, Đà Nẵng',647,5),(6,'Căn hộ Phan Thanh, Chỉ từ 610tr/căn. Nhiều ưu đãi.','• Nối các tuyến đường trung tâm thành phố\r\n• Gần các trường đại học lớn, bệnh viện, công viên, …\r\n• View nhìn khắp thành phố,…','<p>Hầm xe, lửng, 5 lầu, 2 thang bộ, 1 thang m&aacute;y, s&acirc;n thượng,&hellip; &bull; Tổng cộng 36 căn hộ v&agrave; 3 căn shophouse. &bull; Hệ thống PCCC, điện 3 pha,&hellip; Diện t&iacute;ch v&agrave; gi&aacute; b&aacute;n ni&ecirc;m yết: &bull; Căn 1PN + PK: 36m2 , vu&ocirc;ng vứt, đầy đủ &aacute;nh s&aacute;ng tự nhi&ecirc;n. + Gi&aacute; ni&ecirc;m yết: 850tr/căn &bull; Căn Studio: 26m2 , tiện &iacute;ch kh&eacute;p k&iacute;n + Gi&aacute; ni&ecirc;m yết: 610tr/căn. &bull; Căn 2PN + PK : 46m2, th&ocirc;ng tho&aacute;ng, đầy đue tiện &iacute;ch. + Gi&aacute; ni&ecirc;m yết: 1.170tr/căn. Chiết khấu 2% khi mua trong th&aacute;ng 5.&nbsp;</p>\r\n','2022-05-14 10:14:18',4,'6-73862427401300.jpg',30,'K52 Phan Thanh, Thạc Gián, Thanh Khê, Đà Nẵng',0,5),(7,'Căn Hộ chung cư 12T2 Trần Thánh Tông, Sơn Trà','Dự Án: Chung cư 12T2','<p>Cần b&aacute;n Chung cư 12T2, Sơn Tr&agrave;. Để lại hết Nội thất. 2PN, 1WC. Căn g&oacute;c đầu hồi. Sổ Hồng ch&iacute;nh chủ sang t&ecirc;n ngay. Tầng trung. Ban c&ocirc;ng hướng T&acirc;y, cửa ch&iacute;nh hướng Đ&ocirc;ng. KDC c&aacute;n bộ văn h&oacute;a. Gi&aacute; b&aacute;n C&ocirc;ng chứng. Kh&aacute;ch thiện ch&iacute; mua LH ☎️: ***. L&agrave;m việc ch&iacute;nh chủ. Cam on.</p>\r\n','2022-05-16 15:05:27',2,'5-73367677154900.jpg',55,' Đường Trần Thánh Tông, Phường Nại Hiên Đông, Quận Sơn Trà, Đà Nẵng',4,4);
/*!40000 ALTER TABLE `lands` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-05 20:10:40
