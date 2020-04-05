CREATE DATABASE  IF NOT EXISTS `book_monitoring_system_with_rfid` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `book_monitoring_system_with_rfid`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: book_monitoring_system_with_rfid
-- ------------------------------------------------------
-- Server version	5.7.19-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_books`
--

DROP TABLE IF EXISTS `tbl_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_books` (
  `id` int(9) NOT NULL,
  `rfid` varchar(10) NOT NULL,
  `title` varchar(60) NOT NULL,
  `subject_id` int(4) NOT NULL,
  `authors` mediumtext NOT NULL,
  `publisher` mediumtext NOT NULL,
  `copyright_year` varchar(45) NOT NULL,
  `original_totalpages` int(4) NOT NULL,
  `current_totalpages` int(4) NOT NULL,
  `quantity` int(6) NOT NULL,
  `date` date NOT NULL,
  `time` varchar(11) NOT NULL,
  `shelf_id` int(4) NOT NULL,
  `user_id` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_UNIQUE` (`rfid`),
  KEY `FK_tbl_books_tbl_users_user_id_idx` (`user_id`),
  KEY `FK_tbl_books_tbl_subjects_subject_id_idx` (`subject_id`),
  KEY `FK_tbl_books_tbl_shelfs_shelf_id_idx` (`shelf_id`),
  CONSTRAINT `FK_tbl_books_tbl_shelfs_shelf_id` FOREIGN KEY (`shelf_id`) REFERENCES `tbl_shelfs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_books_tbl_subjects_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `tbl_subjects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_books_tbl_users_user_id` FOREIGN KEY (`user_id`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_books`
--

LOCK TABLES `tbl_books` WRITE;
/*!40000 ALTER TABLE `tbl_books` DISABLE KEYS */;
INSERT INTO `tbl_books` VALUES (1,'0011677950','General Mathematics (For Senior High School)',3,'Marc De Guzman Garvida, Corazon S. Aspuria, Liberty Gay C. Manalo, Anjo M. Abaratigue','Books Atbp.Publishing Corp.','Copyright Â© 2016',335,335,5,'2020-03-21','02:33:21 PM',1,1),(2,'0003297238','Physical and Health (Volume-1)',6,'Lualhati Fernando-Callo, Peter Fermin Dajime','REX Book Store','Copyright Â© 2016',134,134,1,'2020-03-29','10:58:34 PM',2,1),(3,'123','BAGO',1,'BAGO	','BAGO	','123',123,123,123,'2020-03-30','12:06:54 AM',1,1),(4,'456','NEWEST',2,'NEWEST	','NEWEST	','456',456,456,456,'2020-03-30','02:20:37 PM',4,1);
/*!40000 ALTER TABLE `tbl_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_borrowed_details`
--

DROP TABLE IF EXISTS `tbl_borrowed_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_borrowed_details` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `book_id` int(9) NOT NULL,
  `student_id` int(9) NOT NULL,
  `borrowed_from_date` datetime NOT NULL,
  `borrowed_until_date` date NOT NULL,
  `actual_return_date` datetime DEFAULT NULL,
  `lent_by` int(2) NOT NULL,
  `received_by` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_tbl_borrowed_details_tbl_books_book_id_idx` (`book_id`),
  KEY `FK_tbl_borrowed_details_tbl_students_student_id_idx` (`student_id`),
  KEY `FK_tbl_borrowed_details_tbl_users_lent_by_idx` (`lent_by`),
  KEY `FK_tbl_borrowed_details_tbl_users_received_by_idx` (`received_by`),
  CONSTRAINT `FK_tbl_borrowed_details_tbl_books_book_id` FOREIGN KEY (`book_id`) REFERENCES `tbl_books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_borrowed_details_tbl_students_student_id` FOREIGN KEY (`student_id`) REFERENCES `tbl_students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_borrowed_details_tbl_users_lent_by` FOREIGN KEY (`lent_by`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_borrowed_details_tbl_users_received_by` FOREIGN KEY (`received_by`) REFERENCES `tbl_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_borrowed_details`
--

LOCK TABLES `tbl_borrowed_details` WRITE;
/*!40000 ALTER TABLE `tbl_borrowed_details` DISABLE KEYS */;
INSERT INTO `tbl_borrowed_details` VALUES (1,1,1,'2020-04-04 18:25:24','2020-04-03','2020-04-04 21:50:26',1,1),(2,2,1,'2020-04-04 18:25:24','2020-04-04','2020-04-04 22:05:40',1,1),(3,3,1,'2020-04-04 18:25:24','2020-04-04','2020-04-04 22:05:43',1,1),(4,1,3,'2020-04-04 18:34:57','2020-04-04','2020-04-04 22:06:34',1,8),(5,2,3,'2020-04-04 18:34:57','2020-04-04','2020-04-04 22:06:41',1,8);
/*!40000 ALTER TABLE `tbl_borrowed_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_genders`
--

DROP TABLE IF EXISTS `tbl_genders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_genders` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `gender` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gender_UNIQUE` (`gender`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_genders`
--

LOCK TABLES `tbl_genders` WRITE;
/*!40000 ALTER TABLE `tbl_genders` DISABLE KEYS */;
INSERT INTO `tbl_genders` VALUES (2,'Female'),(1,'Male');
/*!40000 ALTER TABLE `tbl_genders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_grade_levels`
--

DROP TABLE IF EXISTS `tbl_grade_levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_grade_levels` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `grade_level` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `grade_level_UNIQUE` (`grade_level`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_grade_levels`
--

LOCK TABLES `tbl_grade_levels` WRITE;
/*!40000 ALTER TABLE `tbl_grade_levels` DISABLE KEYS */;
INSERT INTO `tbl_grade_levels` VALUES (4,'Grade 10'),(5,'Grade 11'),(6,'Grade 12'),(1,'Grade 7'),(2,'Grade 8'),(3,'Grade 9');
/*!40000 ALTER TABLE `tbl_grade_levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_shelfs`
--

DROP TABLE IF EXISTS `tbl_shelfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_shelfs` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `shelf` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `shelf_UNIQUE` (`shelf`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_shelfs`
--

LOCK TABLES `tbl_shelfs` WRITE;
/*!40000 ALTER TABLE `tbl_shelfs` DISABLE KEYS */;
INSERT INTO `tbl_shelfs` VALUES (1,'A-001'),(2,'B-001'),(3,'C-001'),(4,'D-001');
/*!40000 ALTER TABLE `tbl_shelfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_status`
--

DROP TABLE IF EXISTS `tbl_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_status` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `status` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `status_UNIQUE` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_status`
--

LOCK TABLES `tbl_status` WRITE;
/*!40000 ALTER TABLE `tbl_status` DISABLE KEYS */;
INSERT INTO `tbl_status` VALUES (1,'Allowed'),(2,'Not Allowed');
/*!40000 ALTER TABLE `tbl_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_students`
--

DROP TABLE IF EXISTS `tbl_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_students` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `rfid` varchar(10) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `gender_id` int(1) NOT NULL,
  `date_of_birth` date NOT NULL,
  `age` int(2) NOT NULL,
  `address` mediumtext NOT NULL,
  `grade_level_id` int(1) NOT NULL,
  `contact_number` varchar(40) NOT NULL,
  `photo` longblob NOT NULL,
  `status_id` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rfid_UNIQUE` (`rfid`),
  KEY `FK_tbl_students_tbl_genders_gender_id_idx` (`gender_id`),
  KEY `FK_tbl_students_tbl_grade_levels_grade_level_id_idx` (`grade_level_id`),
  KEY `FK_tbl_students_tbl_status_status_id_idx` (`status_id`),
  CONSTRAINT `FK_tbl_students_tbl_genders_gender_id` FOREIGN KEY (`gender_id`) REFERENCES `tbl_genders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_students_tbl_grade_levels_grade_level_id` FOREIGN KEY (`grade_level_id`) REFERENCES `tbl_grade_levels` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_tbl_students_tbl_status_status_id` FOREIGN KEY (`status_id`) REFERENCES `tbl_status` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_students`
--

LOCK TABLES `tbl_students` WRITE;
/*!40000 ALTER TABLE `tbl_students` DISABLE KEYS */;
INSERT INTO `tbl_students` VALUES (1,'0003297366','Magoliman, Joshua  C.',1,'1998-06-22',21,'Manila',1,'09108827366 / 09475613881','ÿ\Øÿ\à\0JFIF\0\0H\0H\0\0ÿ\áExif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\0\0\0r2\0\0\0\0\0\0\0Ž‡i\0\0\0\0\0\0\0¤\0\0\0\Ð\0\nü€\0\0\'\0\nü€\0\0\'Adobe Photoshop CS3 Windows\02019:03:20 18:33:42\0\0\0\0 \0\0\0\0\0\0\0 \0\0\0\0\0\0Ý \0\0\0\0\0\0ú\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0&(\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0\0\0\0\0\é\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0š\"\0ÿ\Ý\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sð\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñð3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0\ï\ÒI$õ\êI$’R’I$”¤•>§\Ö:_Hc_\ÔrFÿ\0¡\\\Ø\ï\êS^\ë6ÿ\0/\è.s;üac°úx%À\í\È\È!­~w¢\Ù\Ýý»°«zôû]\à~\å\äù\ß\\¾°e=ÓŸew¡Â¦Ž\Þ\ßM»¿\éªýb\ëŒ;\ÔrŸ[f·X\í¦ï¤‡‚-öb\äG\Å%\äø[:\Ö;?G›yx\Ò\Ê\Üý\í™úuú»ö­¾™þ1²\ÚXÞ£K2©&\r\Ô\ÅV\ë3ú5Ÿû,—KÞ¤«`u¥öœ…\ÕN\×FŽc¿\Ñ\ßS¿IMŸÈ±YNR’I$”¤’I%)$’IOÿ\Ð\ï\ÒI$õ\êI$’R–O_ëƒ¥TÊ©\Ù\Ù-q£wÐ­­\Ñ\Ù9\×k\ãú&†±i\Ûk(¦\Ë\ì’\ÊX\ë$0?­µy/Y\êOªX\ì¬\ë\ZÁa€\Ñ%¬h\'m\×W©ü\Ï\Ñÿ\0Ï¿¤@”\Ö\ê9¶_’!•\Ýk¾»ƒž÷ws¬ú~\åN\è°Íµ¹®\Ñ\Ømü\Ö\îŸ\ÍQ7R\Çû\Z\ç\Þ6‚|a\ÅÊ»Ÿ\ß\'wŸú½5l$\íi\Ä(°\Ã^<\Ú\áÜ£¹\ï\î]ðÿ\0r‰mÃ±#À¡j¯\á\æC›!Ã¯\×{8:–þUX:\æö?Š\ËdD¨>a$½B\ë]71¹8®ý \09Ž¶\×Þ›¿{ùŸRõl,\Ì|ü:sq‰4\ä0=“\Èü\×1\ßË­\íuo^\ì—mh\àt?\ëü¥\èÿ\0\âß­\ã_\Ó\ß\Ò-²3+¶\Ëé¬¥S\Ã_f\Ç}\ÕY½\Ïo\î#šm\ì\ÒI$õ)$’IJI$’Sÿ\Ñ\ï\ÒI$õ\êI$’Sõ¿.œo«™µ\Îk²\Ú1);\\l¸\Ã[¿óY±–Ywü,^W\Ô2\ZHÇ¤6š«ú>›÷OýJö.©\Ó\Û\ÔúvF	/¹‡\Ðu“µ—v5\Þ\ßw\è®\Ø\ïjñ›‘ö—c\ÛP¡\ìyµ€F\àvº>“q2[ \îÎŒKrl\ÙNü\çw[¸?TË€sÛ»\Í\Ú©\Ð:[k­¯sa\ÇXð]%t€4Uå“£<q€5p(ú±C\ä7ü\Û\Ç?H\È[ž™O±7U\á\ç\íú§ƒ`ˆ øªVýJ N\Ç|­Ø˜µ+#ªŸ>\êVÝY:øq¢¯õ?©³¤}eÃ¾\á4¹\ç\Ó1\r¿ô§ým\Îkýß˜»\î£K-\Æ{\\$§‘^eŸIªûtugp·]>\å,$z°\äˆ\Ü>\ìAi-<ƒ$Í´\\\Æ\\8µ°wúm\çûIÕ…ªI$’R’I$”ÿ\0ÿ\Ò\ï\ÒI$õ\êI$’S*ÿ\0œo\Ä~U\åa‹:µX\å»K¯y±§–µ®qÙ¯\î\í^ª¸‹p[ÿ\0;óž\ÒP­Ö±\ÃQúmž\ß\ì9Ö¨òì˜‹!a\Öú~#@9\îo\ÒsD\ì\Ç\î©\Õõ«	\Ä\rƒù\Â\Î@¸\à\á1÷\ÜÆ†I<*Xh95aþ\Í«|z;v´»p\Ü\Ç\0y¿¾ n¢M352§¥§ªQq†|D#›\Â\ç±.®Ç‘^…Ž\Ùcnc‡\æ?n\æÿ\0U\Íö=l:‹E[»D\Êe¯¥òz¶>3eúùžÿ\0­8¾ k˜\æƒ\ßB«\ä,k\r±\Û*¤j\ç»Áƒù?ž\åžÏ¬}=¹b;\Â\ÊI{C‹v\îß»n\ç{6=::þ‰+e¦œ@[»ûc.§\Ö\×m²%³Áø.3¯\ãŠr\ïó\Ú]\åJ\é0²šÜŒp6»\Â>ö¹ž\Ô«\Ñþ\Ù×º]\0\ì¯3cmwf¶§o½\çwý\×O\èÇ_@ÁeµôüJ\îþu˜ô¶\Îþ\á[\ZýeßœŽ—ªË‰²·5\Ä\ê\Ó!%d1©$’IJI$’Sÿ\Ó\ï\ÒI$õ\êI$’R,¶¹øyd\ïuO\rŽgi…\Ìa1Þ¦÷\Ïu5\ã\Ì{\Ý\î]`0gÁs·°SÔ²*n¡¥£\È\î-PgŽ¢_\à²\ã:\ãk»ð\ç1®p\Ôª¸jEU81²­2J“¶´¡¦P\Ð`Ä\04ZŸ¡\Û\äƒXu»ž 1¦\'\Äù+&\Ú\Íz‘ üˆ\0’\\\×c·—1¯‰@&1*\éý5\Öý’¿Pòý°Oõ•«môCmvµ9Á¥Ã±?E\ÊÁcN£O‚Ji·¦\á‚\ã]b¢\ã\'f€Ÿ¿Gr«\Ôja»¸j{\Ãgsó~\í\Í\Ô¹fõ\Ù{\Æ}=\í-$z-­G˜v>­2ö[\Ôc\Ýe{ª,.3‡\îkV\â§\Ò*\à1\Ý\í&\Â|1¿ôX®+X…B#\ëþ7©‡!¹“ôÿ\0Ò¤’I=b’I$”ÿ\0ÿ\Ô\ï\ÒI$õ\êI$’R–_W¢-fHo-ô\Þ\á\äe›–¢uf\Ü;š5!»€óo¿ø&\äHLM<\ÏqxXØ«u,ÿ\0±b›Œ\íº$\êc\Ú>­› “;9\Õ\nñou,\'\ÜX\à×\ê9Í±ª½˜½I\Ôz#$‡Dz¤4»ú\Ûcfÿ\0\ì S\×]sA¢§4\Ü\ê\ÜLÿ\0RW¼;h¬\ï:ÿ\06ÿ\0ú”\à<#3¨m\à\áf\n}\ËýfŽ	2ó¬·{¶\Ö\ßoõV«·I\\ý½nüv\îÈ¢Í\Ü+p#ðWps™›Ž/¯pi\Ò\\òš\ä­j‘¨4[öÙ¹°£‹…öü‘ŽKš\Â\Ý\Ö9¦`:ÿ\0Ÿôrýat]½<?ƒs\Ëþ ~Ÿõ.N\Ç)Q\Ûu¹Ñ¼ZZ6µ 5­€Ð$•¶º’I$”¤’I%?ÿ\Õ\ï\ÒI$õ\êI$’R’ø$’JyŽ«Š\ì,¢\Ð?Cd¾—vÎ¯ú\Õ\Ô*­{,€ðŠ\Úú\Ëe_e¦’\á\ê¹\æ\Æ3¾Ö–Y»º\Æ1suÙµðU<‘dxJ\ã«i\Ô\ì;\êy€†ü\ì\Ý\Ñ\é¸\Çub«[JN¹³Yv¬]’w\\±(–X\Ö7ktR²\æ\í\çUF\ëu\Ñ\r\ÐOv\æf\ä³­ó«»5£\é\Ø\ï\ê5v,c+ck¬C+hk€h\Ú\Õ\Ëý]\Ê\Ç\Æ\Î`½â³–>\ÏK\×eunü\ß[\Óskÿ\0„ý\Zê•Œ\0p“Ü°\ä$•$’Jf5$’I)I$’Jÿ\Ö\ï\ÒI$õ\êIF\ë*¢£vE¦‘Í–81¿\ç>w×Ÿ«¸€úw?2Á\Ã(i\Ú\ë\×zlÿ\07\Ô@\ïª][«atŒ_´f>	þj–Ç©að­¿»û÷;ôu®7üaõ¼§¸aŠð(üE–Ÿ#}\á\Íÿ\0¶©­sÙ™\ÙW:\ì‹u\ÏúV=\Å\Î?94Ï²\á¸úµnGÖ¬®¿“n\Ö^\ÆbW†\ÏÍ­96ŠZï¥¶\×:ÿ\0úâ«‘EŒµÌ±¦»aõ»Bšøª\ê-\Ç\ëÙ˜/03¨k\Ù\æú\ïýzô^¯\Ñqz›\è\ï`†^Ñ¨ºñþµññ\0F\éŽAA\Ùó½ö´x¡»%\ãVŸQ\éy]>\ßO%°üÝ­ÕŽþ«¿{þ\rÊ‹˜e£B€½Ak\í~ƒ@§Ud\Î\ãº-Xö]kj¥…ö;\è´rµ™\Ó+Æ¯u\Çu£°ú ø7÷¿®\Ê{mÔ­”„wß³…õ„lú½š]\ípmn¯±m•¹ŽþK\ÕÏªŸ\ã	·zx=zÀ\×@m}A\Ú	\á­\Íþ·ý\Ëÿ\0Øô\Ë3ë¥%ô\Ìz¯h?\0\íÿ\0ÁqŒ$|”\àpLDñ_ {\Èp–‘¨ ð\æ‘ôš’ñ~“õ§¯t†6¼·¶†ñ‹d[O2Ci³w§ÿ\0Yô—c\Ò\Æv- 3«bš_Á¿\ÞÏ‹±\í>«\ëvÚž$On’«Óº§M\êŒ/\é\Ù5\åF®c=¿ñ”?m\Ìÿ\0¶Õ¤\ä)$’IOÿ\×\Ô\ê?\ã¦\ÐK:}.\Êpÿ\0l\×_öY­\Ïþ×¢¹ü¿ñƒ×­$Umx\Í<\n«lÿ\0ŸoªõÉ›LÄ¨—“â…ž\ìº7³:–^m¾¶U\ÏÈ·÷\íqy\rÓ·û*®\ç8\êP\ÕLLw“\Ê\n´­pn€\ÑF\ÇI\í‚‡u\é:j;¤«t>¯\æ?¯\à\æ7\é1\î\ÌŸi^íË©m2×€Aò+\ç–\Ù\é\ÛU‡Š\ìc‰ò¿\è¯hú§šm\é\í­\Æ]Q\Ûòü\Õ,‚å»·•]õ:›Z,­Üµ\ÂA\\[/¥u*°r3k\Çû@\Ü\ÓlŸM¤\ík¯s¶µÿ\0\à·ý5\ÚuÞ³\ÑzFOS¼o6YP\æ\Ë•Rß¥ü\ãÿ\0“\ìg\éŽõG\ãõ\"þ£‘xnn^\Û.sËŸ[œ\á\Ùôþ—¶FÊ¨³#Ó«ü*‹0‰\0¯vLFZ\Ñ}Fœ^ŸIª\\cÕ¸\Æ\çžy™ýEŸ™d“øÀ.s\êO[\Èu/\è9~\çb\ÖnÁ´8=®¤;m˜\ÂÖ—6\ÏI\Îõqÿ\0\à½j¿ÁT¶ò_´yî¥8E9]›\Ý\ã>¸Û¹ŒoƒÀü¥r\ãB·¾¶>K;½\Îyþ\È\rõkŸ6{¦;%…6º‘\á¥)«›5d9®k\Ú\âÇ³è½¤‡ê½¾æ®“¦}~úÁ„\Z\Ë-ô6e\çüœ–m¿ü÷Ø¹=\Ð?*–øIVú¯Lÿ\0(\ì\ÏcúuŸ¾MIÿ\0®\Ô\ßV¿ú\å?\Û[_óƒ\êÿ\0þZb}ÿ\0\Ï3\èþ÷?ô>šñV8\ì¥\ëyŸö#\ÄU£ÿ\Ð\à7\'C•!ùP^\Îtó\ì¡\ê\Ø\×`\Ü<G*A\Çæ–‘¨Ó¹IJµ\âZf9\çO½HQ[\0@’þ	){\æ9¾ €½+\ê/Q\ÓS§ù\æ\r\ÃÁ\à{¿\én^i:B\ê>§\ä\ßV1²‚”½\Ì\0ñ?\ÎTÿ\0\ìoO¢¶cGsü`u:…\í\éøä½˜ŽTÖ˜Ë´Y:ÿ\0\Új7\Óü‡¿)r®§\Ðv~“J Gª\íE™oÿ\0ü\Ïô8ÞS®½˜¸x¸õ	¿\'\Õu·8\Ë\Ã Vð\Ï\ÝûO«c.³ýª\Ïð\Ö,üV\Ó^ò²@~+²ª] º\Ð5«\Û\îû-\r,¿>\Ïô^–7óÙ•¨³•vý¬\ØEB\ÏV§M\ËÍ£¬b\\H¬¼P\Z\Îj±\íýÌ‡\×ú=\ß\ÎSú_¡e{ûÜ—±ô‹Û¥v4= ö\ß\Ôú€q¹\Ù\Ì\Ì÷]a¼:=\Ïp{Ýµ¿\Èw±ú®\ç%•¿\ï¡ÛŸ}¿ðL\Ëý¶µK„úH\ìÅ˜/0ù÷\ÖLŸ_©¼pÚš\Ö4xHõOù\Û\Ö`ðD\Ê\È9Y\ä¸A½î´\rÄ¸7û-CSI³jS)ð\n\"Ç¸{÷÷\'\å#\â>Þ‚Y4u<’S—\0<\ÔRIK\î\Õ-\ÅA-?‚Jÿ\Ùÿ\íŽPhotoshop 3.0\08BIM\0\0\0\0\0n\0\0™¼(\0bFBMD01000aa603000004160000b22400001f2600008f2700008f2e000023450000d04b0000b44e0000885100002c7d00008BIM%\0\0\0\0\0eMeGe]—\ÊA§`%Ž/\Ñ\ã8BIM/\0\0\0\0\0JC\0\0H\0\0\0H\0\0\0\0\0\0\0\0\0\0\0\Ð\0\0@\0\0\0\0\0\0\0\0\0\0\0\0d\0\0\0À\0\0°\0\0\0\'\0T\0.\0j\0p\0g\0\0\0\0\08BIM\í\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?€\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIMó\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\n\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIMõ\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0¡™š\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIMø\0\0\0\0\0p\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\0\0\0ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ\è\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0ú\0\0\Ý\0\0\0\n\0J\0C\0M\0 \0L\0A\0T\0E\0S\0T\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ý\0\0ú\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0ú\0\0\0\0Rghtlong\0\0\Ý\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0ú\0\0\0\0Rghtlong\0\0\Ý\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?ð\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0š\0\0\0 \0\0\Ð\0\"\0\0\0\é\0\0ÿ\Øÿ\à\0JFIF\0\0\0H\0H\0\0ÿ\í\0Adobe_CM\0ÿ\î\0Adobe\0d€\0\0\0ÿ\Û\0„\0			\n\r\r\rÿÀ\0\0 \0š\"\0ÿ\Ý\0\0\nÿ\Ä?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q2‘¡±B#$RÁb34r‚\ÑC%’Sð\áñcs5¢²ƒ&D“TdEÂ£t6\ÒU\âeò³„\Ã\Óu\ãóF\'”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö7GWgw‡—§·\Ç\×\ç÷\05\0!1AQaq\"2‘¡±B#ÁR\Ñð3$b\ár‚’CScs4ñ%¢²ƒ&5\Â\ÒD“T£dEU6te\âò³„\Ã\Óu\ãóF”¤…´•\Ä\Ô\äô¥µ\Å\Õ\åõVfv†–¦¶\Æ\Ö\æö\'7GWgw‡—§·\Çÿ\Ú\0\0\0?\0\ï\ÒI$õ\êI$’R’I$”¤•>§\Ö:_Hc_\ÔrFÿ\0¡\\\Ø\ï\êS^\ë6ÿ\0/\è.s;üac°úx%À\í\È\È!­~w¢\Ù\Ýý»°«zôû]\à~\å\äù\ß\\¾°e=ÓŸew¡Â¦Ž\Þ\ßM»¿\éªýb\ëŒ;\ÔrŸ[f·X\í¦ï¤‡‚-öb\äG\Å%\äø[:\Ö;?G›yx\Ò\Ê\Üý\í™úuú»ö­¾™þ1²\ÚXÞ£K2©&\r\Ô\ÅV\ë3ú5Ÿû,—KÞ¤«`u¥öœ…\ÕN\×FŽc¿\Ñ\ßS¿IMŸÈ±YNR’I$”¤’I%)$’IOÿ\Ð\ï\ÒI$õ\êI$’R–O_ëƒ¥TÊ©\Ù\Ù-q£wÐ­­\Ñ\Ù9\×k\ãú&†±i\Ûk(¦\Ë\ì’\ÊX\ë$0?­µy/Y\êOªX\ì¬\ë\ZÁa€\Ñ%¬h\'m\×W©ü\Ï\Ñÿ\0Ï¿¤@”\Ö\ê9¶_’!•\Ýk¾»ƒž÷ws¬ú~\åN\è°Íµ¹®\Ñ\Ømü\Ö\îŸ\ÍQ7R\Çû\Z\ç\Þ6‚|a\ÅÊ»Ÿ\ß\'wŸú½5l$\íi\Ä(°\Ã^<\Ú\áÜ£¹\ï\î]ðÿ\0r‰mÃ±#À¡j¯\á\æC›!Ã¯\×{8:–þUX:\æö?Š\ËdD¨>a$½B\ë]71¹8®ý \09Ž¶\×Þ›¿{ùŸRõl,\Ì|ü:sq‰4\ä0=“\Èü\×1\ßË­\íuo^\ì—mh\àt?\ëü¥\èÿ\0\âß­\ã_\Ó\ß\Ò-²3+¶\Ëé¬¥S\Ã_f\Ç}\ÕY½\Ïo\î#šm\ì\ÒI$õ)$’IJI$’Sÿ\Ñ\ï\ÒI$õ\êI$’Sõ¿.œo«™µ\Îk²\Ú1);\\l¸\Ã[¿óY±–Ywü,^W\Ô2\ZHÇ¤6š«ú>›÷OýJö.©\Ó\Û\ÔúvF	/¹‡\Ðu“µ—v5\Þ\ßw\è®\Ø\ïjñ›‘ö—c\ÛP¡\ìyµ€F\àvº>“q2[ \îÎŒKrl\ÙNü\çw[¸?TË€sÛ»\Í\Ú©\Ð:[k­¯sa\ÇXð]%t€4Uå“£<q€5p(ú±C\ä7ü\Û\Ç?H\È[ž™O±7U\á\ç\íú§ƒ`ˆ øªVýJ N\Ç|­Ø˜µ+#ªŸ>\êVÝY:øq¢¯õ?©³¤}eÃ¾\á4¹\ç\Ó1\r¿ô§ým\Îkýß˜»\î£K-\Æ{\\$§‘^eŸIªûtugp·]>\å,$z°\äˆ\Ü>\ìAi-<ƒ$Í´\\\Æ\\8µ°wúm\çûIÕ…ªI$’R’I$”ÿ\0ÿ\Ò\ï\ÒI$õ\êI$’S*ÿ\0œo\Ä~U\åa‹:µX\å»K¯y±§–µ®qÙ¯\î\í^ª¸‹p[ÿ\0;óž\ÒP­Ö±\ÃQúmž\ß\ì9Ö¨òì˜‹!a\Öú~#@9\îo\ÒsD\ì\Ç\î©\Õõ«	\Ä\rƒù\Â\Î@¸\à\á1÷\ÜÆ†I<*Xh95aþ\Í«|z;v´»p\Ü\Ç\0y¿¾ n¢M352§¥§ªQq†|D#›\Â\ç±.®Ç‘^…Ž\Ùcnc‡\æ?n\æÿ\0U\Íö=l:‹E[»D\Êe¯¥òz¶>3eúùžÿ\0­8¾ k˜\æƒ\ßB«\ä,k\r±\Û*¤j\ç»Áƒù?ž\åžÏ¬}=¹b;\Â\ÊI{C‹v\îß»n\ç{6=::þ‰+e¦œ@[»ûc.§\Ö\×m²%³Áø.3¯\ãŠr\ïó\Ú]\åJ\é0²šÜŒp6»\Â>ö¹ž\Ô«\Ñþ\Ù×º]\0\ì¯3cmwf¶§o½\çwý\×O\èÇ_@ÁeµôüJ\îþu˜ô¶\Îþ\á[\ZýeßœŽ—ªË‰²·5\Ä\ê\Ó!%d1©$’IJI$’Sÿ\Ó\ï\ÒI$õ\êI$’R,¶¹øyd\ïuO\rŽgi…\Ìa1Þ¦÷\Ïu5\ã\Ì{\Ý\î]`0gÁs·°SÔ²*n¡¥£\È\î-PgŽ¢_\à²\ã:\ãk»ð\ç1®p\Ôª¸jEU81²­2J“¶´¡¦P\Ð`Ä\04ZŸ¡\Û\äƒXu»ž 1¦\'\Äù+&\Ú\Íz‘ üˆ\0’\\\×c·—1¯‰@&1*\éý5\Öý’¿Pòý°Oõ•«môCmvµ9Á¥Ã±?E\ÊÁcN£O‚Ji·¦\á‚\ã]b¢\ã\'f€Ÿ¿Gr«\Ôja»¸j{\Ãgsó~\í\Í\Ô¹fõ\Ù{\Æ}=\í-$z-­G˜v>­2ö[\Ôc\Ýe{ª,.3‡\îkV\â§\Ò*\à1\Ý\í&\Â|1¿ôX®+X…B#\ëþ7©‡!¹“ôÿ\0Ò¤’I=b’I$”ÿ\0ÿ\Ô\ï\ÒI$õ\êI$’R–_W¢-fHo-ô\Þ\á\äe›–¢uf\Ü;š5!»€óo¿ø&\äHLM<\ÏqxXØ«u,ÿ\0±b›Œ\íº$\êc\Ú>­› “;9\Õ\nñou,\'\ÜX\à×\ê9Í±ª½˜½I\Ôz#$‡Dz¤4»ú\Ûcfÿ\0\ì S\×]sA¢§4\Ü\ê\ÜLÿ\0RW¼;h¬\ï:ÿ\06ÿ\0ú”\à<#3¨m\à\áf\n}\ËýfŽ	2ó¬·{¶\Ö\ßoõV«·I\\ý½nüv\îÈ¢Í\Ü+p#ðWps™›Ž/¯pi\Ò\\òš\ä­j‘¨4[öÙ¹°£‹…öü‘ŽKš\Â\Ý\Ö9¦`:ÿ\0Ÿôrýat]½<?ƒs\Ëþ ~Ÿõ.N\Ç)Q\Ûu¹Ñ¼ZZ6µ 5­€Ð$•¶º’I$”¤’I%?ÿ\Õ\ï\ÒI$õ\êI$’R’ø$’JyŽ«Š\ì,¢\Ð?Cd¾—vÎ¯ú\Õ\Ô*­{,€ðŠ\Úú\Ëe_e¦’\á\ê¹\æ\Æ3¾Ö–Y»º\Æ1suÙµðU<‘dxJ\ã«i\Ô\ì;\êy€†ü\ì\Ý\Ñ\é¸\Çub«[JN¹³Yv¬]’w\\±(–X\Ö7ktR²\æ\í\çUF\ëu\Ñ\r\ÐOv\æf\ä³­ó«»5£\é\Ø\ï\ê5v,c+ck¬C+hk€h\Ú\Õ\Ëý]\Ê\Ç\Æ\Î`½â³–>\ÏK\×eunü\ß[\Óskÿ\0„ý\Zê•Œ\0p“Ü°\ä$•$’Jf5$’I)I$’Jÿ\Ö\ï\ÒI$õ\êIF\ë*¢£vE¦‘Í–81¿\ç>w×Ÿ«¸€úw?2Á\Ã(i\Ú\ë\×zlÿ\07\Ô@\ïª][«atŒ_´f>	þj–Ç©að­¿»û÷;ôu®7üaõ¼§¸aŠð(üE–Ÿ#}\á\Íÿ\0¶©­sÙ™\ÙW:\ì‹u\ÏúV=\Å\Î?94Ï²\á¸úµnGÖ¬®¿“n\Ö^\ÆbW†\ÏÍ­96ŠZï¥¶\×:ÿ\0úâ«‘EŒµÌ±¦»aõ»Bšøª\ê-\Ç\ëÙ˜/03¨k\Ù\æú\ïýzô^¯\Ñqz›\è\ï`†^Ñ¨ºñþµññ\0F\éŽAA\Ùó½ö´x¡»%\ãVŸQ\éy]>\ßO%°üÝ­ÕŽþ«¿{þ\rÊ‹˜e£B€½Ak\í~ƒ@§Ud\Î\ãº-Xö]kj¥…ö;\è´rµ™\Ó+Æ¯u\Çu£°ú ø7÷¿®\Ê{mÔ­”„wß³…õ„lú½š]\ípmn¯±m•¹ŽþK\ÕÏªŸ\ã	·zx=zÀ\×@m}A\Ú	\á­\Íþ·ý\Ëÿ\0Øô\Ë3ë¥%ô\Ìz¯h?\0\íÿ\0ÁqŒ$|”\àpLDñ_ {\Èp–‘¨ ð\æ‘ôš’ñ~“õ§¯t†6¼·¶†ñ‹d[O2Ci³w§ÿ\0Yô—c\Ò\Æv- 3«bš_Á¿\ÞÏ‹±\í>«\ëvÚž$On’«Óº§M\êŒ/\é\Ù5\åF®c=¿ñ”?m\Ìÿ\0¶Õ¤\ä)$’IOÿ\×\Ô\ê?\ã¦\ÐK:}.\Êpÿ\0l\×_öY­\Ïþ×¢¹ü¿ñƒ×­$Umx\Í<\n«lÿ\0ŸoªõÉ›LÄ¨—“â…ž\ìº7³:–^m¾¶U\ÏÈ·÷\íqy\rÓ·û*®\ç8\êP\ÕLLw“\Ê\n´­pn€\ÑF\ÇI\í‚‡u\é:j;¤«t>¯\æ?¯\à\æ7\é1\î\ÌŸi^íË©m2×€Aò+\ç–\Ù\é\ÛU‡Š\ìc‰ò¿\è¯hú§šm\é\í­\Æ]Q\Ûòü\Õ,‚å»·•]õ:›Z,­Üµ\ÂA\\[/¥u*°r3k\Çû@\Ü\ÓlŸM¤\ík¯s¶µÿ\0\à·ý5\ÚuÞ³\ÑzFOS¼o6YP\æ\Ë•Rß¥ü\ãÿ\0“\ìg\éŽõG\ãõ\"þ£‘xnn^\Û.sËŸ[œ\á\Ùôþ—¶FÊ¨³#Ó«ü*‹0‰\0¯vLFZ\Ñ}Fœ^ŸIª\\cÕ¸\Æ\çžy™ýEŸ™d“øÀ.s\êO[\Èu/\è9~\çb\ÖnÁ´8=®¤;m˜\ÂÖ—6\ÏI\Îõqÿ\0\à½j¿ÁT¶ò_´yî¥8E9]›\Ý\ã>¸Û¹ŒoƒÀü¥r\ãB·¾¶>K;½\Îyþ\È\rõkŸ6{¦;%…6º‘\á¥)«›5d9®k\Ú\âÇ³è½¤‡ê½¾æ®“¦}~úÁ„\Z\Ë-ô6e\çüœ–m¿ü÷Ø¹=\Ð?*–øIVú¯Lÿ\0(\ì\ÏcúuŸ¾MIÿ\0®\Ô\ßV¿ú\å?\Û[_óƒ\êÿ\0þZb}ÿ\0\Ï3\èþ÷?ô>šñV8\ì¥\ëyŸö#\ÄU£ÿ\Ð\à7\'C•!ùP^\Îtó\ì¡\ê\Ø\×`\Ü<G*A\Çæ–‘¨Ó¹IJµ\âZf9\çO½HQ[\0@’þ	){\æ9¾ €½+\ê/Q\ÓS§ù\æ\r\ÃÁ\à{¿\én^i:B\ê>§\ä\ßV1²‚”½\Ì\0ñ?\ÎTÿ\0\ìoO¢¶cGsü`u:…\í\éøä½˜ŽTÖ˜Ë´Y:ÿ\0\Új7\Óü‡¿)r®§\Ðv~“J Gª\íE™oÿ\0ü\Ïô8ÞS®½˜¸x¸õ	¿\'\Õu·8\Ë\Ã Vð\Ï\ÝûO«c.³ýª\Ïð\Ö,üV\Ó^ò²@~+²ª] º\Ð5«\Û\îû-\r,¿>\Ïô^–7óÙ•¨³•vý¬\ØEB\ÏV§M\ËÍ£¬b\\H¬¼P\Z\Îj±\íýÌ‡\×ú=\ß\ÎSú_¡e{ûÜ—±ô‹Û¥v4= ö\ß\Ôú€q¹\Ù\Ì\Ì÷]a¼:=\Ïp{Ýµ¿\Èw±ú®\ç%•¿\ï¡ÛŸ}¿ðL\Ëý¶µK„úH\ìÅ˜/0ù÷\ÖLŸ_©¼pÚš\Ö4xHõOù\Û\Ö`ðD\Ê\È9Y\ä¸A½î´\rÄ¸7û-CSI³jS)ð\n\"Ç¸{÷÷\'\å#\â>Þ‚Y4u<’S—\0<\ÔRIK\î\Õ-\ÅA-?‚Jÿ\Ù\08BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\03\0\0\0\08BIM\0\0\0\0\0\0\0\0ÿ\á,http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"ï»¿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.1-c036 46.276720, Mon Feb 19 2007 22:40:08        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xap=\"http://ns.adobe.com/xap/1.0/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xapMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\" xmlns:exif=\"http://ns.adobe.com/exif/1.0/\" xap:CreateDate=\"2019-03-20T18:31:06+08:00\" xap:ModifyDate=\"2019-03-20T18:33:42+08:00\" xap:MetadataDate=\"2019-03-20T18:33:42+08:00\" xap:CreatorTool=\"Adobe Photoshop CS3 Windows\" dc:format=\"image/jpeg\" photoshop:Instructions=\"FBMD01000aa603000004160000b22400001f2600008f2700008f2e000023450000d04b0000b44e0000885100002c7d0000\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"c2\" photoshop:History=\"\" xapMM:InstanceID=\"uuid:7ED322A2FB4AE9119F56CB7FC05C1DF6\" tiff:Orientation=\"1\" tiff:XResolution=\"720000/10000\" tiff:YResolution=\"720000/10000\" tiff:ResolutionUnit=\"2\" tiff:NativeDigest=\"256,257,258,259,262,274,277,284,530,531,282,283,296,301,318,319,529,532,306,270,271,272,305,315,33432;CB24F3EC25097D52BCCCC9C456727F39\" exif:PixelXDimension=\"733\" exif:PixelYDimension=\"762\" exif:ColorSpace=\"1\" exif:NativeDigest=\"36864,40960,40961,37121,37122,40962,40963,37510,40964,36867,36868,33434,33437,34850,34852,34855,34856,37377,37378,37379,37380,37381,37382,37383,37384,37385,37386,37396,41483,41484,41486,41487,41488,41492,41493,41495,41728,41729,41730,41985,41986,41987,41988,41989,41990,41991,41992,41993,41994,41995,41996,42016,0,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,24,25,26,27,28,30;44A260919C50646E5ED7247DAC8ECE54\"/> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>ÿ\âICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \Ü\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0ü\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0\0\0\0gXYZ\0\0¤\0\0\0bXYZ\0\0¸\0\0\0rTRC\0\0\Ì\0\0\0@gTRC\0\0\Ì\0\0\0@bTRC\0\0\Ì\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0ö\Ö\0\0\0\0\0\Ó-XYZ \0\0\0\0\0\0\0\03\0\0¤XYZ \0\0\0\0\0\0o¢\0\08õ\0\0XYZ \0\0\0\0\0\0b™\0\0·…\0\0\ÚXYZ \0\0\0\0\0\0$ \0\0„\0\0¶\Ïcurv\0\0\0\0\0\0\0\Z\0\0\0\Ë\Éc’kö?Q4!ñ)2;’FQw]\íkpz‰±š|¬i¿}\Ó\Ã\é0ÿÿÿ\î\0!Adobe\0d@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ÿ\Û\0„\0ÿ\Â\0ú\Ý\0ÿ\Ä5\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\012# 0P!3	@\"$AC4%`5\n67€BDE8&\'9\0\0\n	\0ð!1AQaq‘¡$4±Á\Ñ\áDñT%5PdtEU\"2B’#e&6R‚3„uF¢²â”…¥Vf `br\ÒCs¤•µ\Åv†70@\ÂS´\Õ\å¦\'	€òcƒ\Ô\ÖGgw(8\0\0\0ð!1aAQq‘\Ñ2 0P¡±Á\áñ\"@b\Ò`BRr’#‚3²Â€¢Cs\ÓSc$4ÿ\Ú\0\0\0\0úôéº°\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0OV<û3\è\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y8ƒS‰±´ð\Z.Ž§ñ\ãWÿ\0«^q¾£\é\á¤X—{§ò¯o¾\È\í\ãr–lžFYo\Û[·ø\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?F)WP\Ì®\ë½õ3G\æYF4Üœ\âe$œ}f?M\ËY+m,lõV\î\ÃÏ®NÌ‰\Þ5„¾\Ýz;6FÀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0±Ž>D\Ñ\×]dN¦j õ«]]¥§\"\ÆÓ†»I\Zó˜D—’\Íhš\ßT\Î\Ã3eŠVy\Ö\åÍ¶lù‹8\Ùó´­+þ¬|ý$u\Ù\Ê=û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F½=VQó¿:|\ç¾8IÕ©qk‰\Zr\Ó\Ç$M\ê\0b%‘$ÂŒNªmqK.\Ú0l\Ù\ìƒnEºª\Î5Ž(se®Ù«‘€“\Ä\ÎXoƒõ½\Ö\×vSw;À\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ý1\×m=\Î7%\Ìt\Ë.v¸Y\ì›n\ì\âé­½URŽv\ãdbÈ¤O\ãNjV\è\ÙvU\æÎ\Î\"\Ã\Ï\Ý6¿EÂ•[G\Ìì´“ûû™³zóô-\ÑT}B÷›\ì³\è\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~Ž (i:\æª5ü»¾œyñ\"\è\Ù´|85nw\Ò¬j£,Š\â¯;c’1’\ä|\Æ=>,#Ú«?­\é/3«\\‘3S6ÌŒ‡6\\€\ç­rJ\ß]\Þô\\·\Ö_Ñ¦Jõ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~Ž\×V|zq\ÕùõŽ8a\'Oi/hš/\Ô=\èhŒ\ï’_y™€˜@!ú‡„•ñqˆ—R³±\Ì\ê¦x\Âl¼\ØÖ²_SlŒI\Ùù‹°Wp}r·¥\È\ë¤w\Ï\Ñò?S?F™\ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08WWò\Íx\×þdqt\á\ÄÊ{¥z\ÉJ\ìj\Ú&G¸‘O\ÍE›9%\Ù´Æ¸¦(FxÍž\Ç#\Ù\ê‰\ç>)\n\Ò\'¨»\ßÍ„˜RöA\Èj\ÛüÞ¶«\ë¾«\î¬œ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·Æ¿\ç\çó¾{mÍš²\Ñ\ÃŒ\Ú4jót\Êõ\à\×~fcg\ã\Ô?<_8‘s›9%)‰Ú¦\ÈÉ±\ìCÍœr\è³0¸žlŒÜ~}Eýy°\Ú0¥Öœ…\Ì\Í\ÉYg\È/?{¿V\Í\Æ\ß@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ÑÕ§3Qó?\ÌÁ\âgN\á#:à¦‹\æð\Ë,³½N6\Ç\ÎEcdK\Ådb¸\Æ\Èr½F&EóÆš\â­r9P,‰1­\ì‰-8Ù“E\×\ä²Ç¬´\Ës*l#\Õ92Y\Õ\ÃûB\ïõv\é\Ð\Ì\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0uW]òIM\ÇY[x\ïŒ\êL¶IEó‰enj\ÉY\Æ\Äk3\Åeqbce\\¯QL_6%’Æ‘UW+tƒ1‹³,<fnXRÅŸ¶OŠ\ì\Ø\Ís*.l0¯<Ž³\ß\Õ\Ì?©.\Ò\Ì\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01Áð[\Çrº]†\'·^®.%z\Ø\ç²/˜¥,[8bE)TAD‹kI‚\×\Ìø\Ål¨˜\Ùdx#’H­5\Æm\Ç%3C.0\ÈñŸk©ñ[ZmPû\Âjû\Óú7M\ä\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07­\'\ÌM<\Üf}VK³Äƒ\ß+\×8\Åóä­‹c\\F.Ä¹\Ùüª¤G\Ü)üÏŒB—\"\È\Æ\È\Åq ™Šh\Â-\áte¥‘„™öl©X\î=ø2\ØPù¿_]öù\Ôú\î­\ì\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?l|Žð\Ü\×O8×¶l³\Æ\ï{x`a%†Eó$È³g]qí®­Å”g©U\Ø\Íw\ÛfÕ¶R!\ì\å$­qŠ\ïQ«lkh\ë\äG±¬¯—\æ)w$c-K¢X\É)&\×V™Ÿ¨G2yjß½Ž\ê\ï²\îš\ì\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<xþqü1¤¡Yò\ÒÍ­-ap\èÓ†z\"ù\ÉJ¬\Ù\âE|Yò–62E–YS\ëmW·´>£6¬²²‰efx’¤1¥lb»Ôœ&Î·[¢RY\×`ªq³Ì˜Ñv%I/¤Vcf%6»\0,=@\ËLþ¦·ú\Þ\Û÷Q\Ø_€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\Æ\Õü\Þ~cA\Ï[[I\'[vž8bR*l‰Qlñ³	\Û6\î²\Ç`DÓº\ë,wdKm\ë[eŸùµ\Ëk,²Z¹wež­\ÖG¾¾\Ú@›<UÊ“\æ´\×ñs«¬ñ«¥óZ\ÞÅ‰\Êx+3GHRÌ‡„\ÙV\à k{.o_\î\Ó$Íªcý\ßu¾ˆº[\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0bÑµ<\ï˜\Ð\Ñt›8¨jÍ³0’^5Ýš–6q·K½he\ï\ê\Û-ý\Ï\ßn\Ê\ÛM‘#;F²\Ëdyõ¸«¬öˆ¹!.daî¯¶”]x^\â²\ÂF9%Ö°™^0«,bqZ\Ø\×\×p“\\Y\Öñvÿ\0Œ\ã-‡7¢.)ñ2\Ï\\~\ã\ãDþ_C\í¥g \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ë+O\Ñ/7\ç5¶®\àb\ÇRgW£Í‡ŒWR,\é)\ç\ï\îo¤\å\ì+nC\Öt»¶²f\ìN\Þ\Úc\í£=õ¯-2BA\æG™i\Òb\ÇðJ$ŸŸP<Ÿ’8)\n4¼L\Ç$h\Ö\æ˜\Ý\ãNœ \èy\Î%ô\\\ß\çñZ’Îµ&\ËqV\Öÿ\0F>žÓµ\ËP\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ù\Ð|\ëÇ©7ñ/¨®Ó‹G3%ù°‹W\ë\Æl¹\Ëvœ\Ï\æº>ZÂ·\åk’>t\í„ü\êdlŒŸ\ë]™b	’<“¤Å(÷ƒó\ê\0òxr±.”‰&¤`fh“¯\Ùõ\Ü\èù¾º:+EYV\ÓE\Äû:\ïµO^þ¬:þ˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0è—”\æþ]yLðvúf$HE\ã\Î,®\é\çòf»£\æ/\ÖóC›\èù±\ZG!Í·VXdø\ÑbJ³H?~vx?9\ÒO“œ{\Ït‰3´þ\Ï\Â \Ðz:vÄ²¯«÷\Z8U£Ws«z\Ä\íø¾ô\\\Ý.\ÜVŸJ\è?v\ÏF\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yc\àƒ\äº\ÔÙ³A\Zk:+qa\Ê:ŽÓ”\\?E\Ø/;\×s‹›\è¹1&.\Ñ6>\ÝWE®4H$Y¼¯;<Ÿœ\é\'ûó\Ù+fˆÄz½\nð:vþ¬«\êý\ÅÆ?\'WV]Bô|_º>o[\Û\ÖV\×Ç«þˆ?A\ê@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ñ\Ý\ÄQ|tíªºN¤Õ·/óa\Ì^r\çž|_oØ¿;\Õrª»¦ß»)3ó9Æ‹³ÅšIúó°~s¤y“8{ó¦P\"žci1Á3\ãOaW}•ty^1\ÃVœ:Y¹\çø\Ûózžm£˜\\ÿ\0ô÷ú¯iú\Î@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n?\Zÿ\0˜·Ë¹.µz)·:¶\î_6\Ï\ç:\ÎÎ¸¾ßž|\í\Ï$k¼\î\r’óbû\Z,‹«0ýy\Ùü\æO\äýÉ ü\æ@Ž1´‰8÷ñŸˆÈž‘«Ç¦Ê»\Û+\Æ.jS‡GQ\×<ÿ\0[Ý¿7¬&\ÐÖ›‡žþ§\ßR\ìn¶\í\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=xóðñ~c­n–\Ë_ù÷x°\ì[Œ\í»M\á»~G\ÆÕ½M—‰Yw+m\ÙcRˆ­\ÞO¶\Ë \ç_’0?P0?3ó$õQæ´¬•™[^M³\ÑIeY§*&q/6YÎ¡\ê\ï¶\âuu\ÍLs3Uý:»žsI\Þ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Uyñð9ñŠ\Î?ô\ÖZ\Ã\ÃÍŸsÿ\0&\íy±]e½·MÞ…\âe\Ùs\"\r™+|žü\ïŒG×²IøÎ±\äüž}‡R)ø=\Zª\ëŠ\Ù;+H²«¼½‘ü\ÙVjZ‰œ6Í‡\çPôû\Ûq:*\æ§.1ˆ\Õ_\Ò{´¾\æl\é€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0·øhø½F†Ÿi\ÆùSqº\ë¢Nµ\ÝÕ–›\Î\ÚKgˆ\ÙI#e•fd,¥i÷øÍ—³\ÃV\É\'¿o¨\Ä\Í^bŸœ\êýb³\Î\Û(…&¨µ\ÖLk\Õ^5f³Œ»2<Vd¶mâ»ƒ\Õ\Ý/ª\âô\×\Ûñv\èy|\0ó¢ôU\í,;¸²\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*üøø[øµW\æ\ÆÓ¯»\èûÓ†\î{ø\å;[\ËZ­iE]d¤ô­1°du>ù4±\Ïù‹Lµg%+6/ul”z\áúŒL™\æ°ñU¸¬Õ›³©9E©l˜žj¤\ÙgG\ÆlI9V\Íqž!WtºÞ¯O½¿\Â^‡†\Æ\Ï: E\î\ÞËœ¶\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0«~->7I\Åùý	öSvw\Å}\'³ª»nt•½xÊ«Z\Õ\×Dµ\Äl\ë³xr¬­R(ñ’:^QQK\ÛU6{*¾ô7œY)\ïÍ”b´­1\ï4\Úý]Ã™þxñg[­\í*\é,ó©m*°•vÊ‡\'?,\'D\É+Ï“+-\æº<\Þ%·R\Ö|\×Y½W_e[¾ \ÖJo£õ6Y\È\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>p>WS\Ð›\Î/m\Ó\Þ\çÈ¾‘u\ÓA\àÿ\0IY‰G±»¬³\Ú\Z1Kci&<95y\Ó\Æs’DÓ²,\ìvUv\ínþ³b\Ã6R\nS5\Æ4\ëœVhœcIXV\ã{|Ç±\ÃeUš\Ò6Øž\n9´•¶X³…§”^¼òf‹©\ë¢Ïšêƒª\â(\ì«{€óî³¼\è€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:J\á*¾\\\é\'hw¿Nÿ\05\íh\î«øÝ›$}\É[c²#G\ÚFY\Z\'‹M%Wi¦óŒ+oª\Ó#™œü\Øú½\ìƒ%ÛŽ%\à­B\ÂLN>[\Z\Ú\ÃnË ¢‘§³i\ÉM\'fLƒ–{\ç9U\ç²\èk³ù¾e[ôù¯\Ç\Ö}t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\×}/Œ\îv\æ÷\ê“æ½®µ\ß\ëR¬¬\èm²\Ú\Û2¢\âF)¾=j\é<ús=&›,H“z\ÏÍŸ*\Ç/b\âQ‰¥\ës[¶kò4,\ç\çˆ\Üôn™û\È\Ø\Ñ\ä\æ\Ö*]\r5d\Âe\ÅÍºns“x_+½Ÿ\Í\ël«~\ç®dv÷\Ð\Ï\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0õi\×ð?ò½?š§\éKœ\íµ.š\n¶\Â=\\\Ê\Z\ËN3\í°\ã\ÇM\Íõõ\Õñ<oí¸\\ñ\Ê*Î›—¿9úWdOkyºZn¹NCø«\Ë\'dauµ­–ñ³_\Õ\ç#\Ý\ïˆv5¼S\ë9.w6\ÔÑ·mª\ËNZsÝ¿*ù\ÞÛ•0blc–•òl`rgm6Ñ²ƒò;\Ô|÷\Õk\ÎH \ßd>²\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y0NW¾}\Ùü\ÝÀ\æ¤l¹\îw›\íõ6ªý)[c‰U\Ì\Ò5–k÷•œg\é9ž×º\Î+¡ž\ã‡\à¯5¦JÎ“—µöFñZ\íó\ç½FZn¸X\å_O[¿¥\ÖF5¾%q\â²\ËFcf3Wž·úˆoq\Ãöc\ßü³\ãzÇž\â¨}•VYrŸúN\Íö½˜ü\ï¬\æ}k.³¯³³\Êjm³e\æ*Û‘\åÿ\0Eóÿ\0ª›N\ç]ñWÜ™\ïù½¯\ÕD\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0g—O_“þÉ­k:\nö\ß;»ïŸ°:J]›´\ås_Fß «l5´[FÍIÙ©•4²3¿™µ\Í!\"“;*·ns\ÊÎ‚õ»\çm\r}\ã\ß+\ìõþ6I:\ê‘q\É*Ø¾ªºŸ\éyž3ù¬\åwO½¹û\É&¶\Ó#˜\Õm\ék§$³\Ç\"$óûFÖ»¥{¾GJsV´rŸHÍ½X\ßâ—¾Ÿ\Ö_´—€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0³\Ã\ækð\Ç\ìUY\Òe\ß\\üÓ¸\åD\äD’\Ïf\ê\Ê\ç‰QU–5±½y«XKó\\µÀ&5j\Ç‰\"Qî‡™U¸Ë³žLô6\å\ß;fk\ßô}ž‚TˆRì­²M”\×~}I¬Äš\ÜI‘¦°®‘	´R%\ÖØ¶FˆYm­w^2(5w5\Ûò®§¤\à÷1\Ûa\\\Ç\Ñ~Æ¿rþ\Ü-P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ý\ç9¿ƒ¿a\ê(wÖ¿6ra¿w\â~EwS×‘¡\ÆX\âu²\é+X\Í]®8QË“JVEœ(Ô•¶Yô\É[û£®Í¬)¦˜†\Ìi\Z\Ü\ëøöB>À½\Ä+\Ã\Ä\Û\"ÿ\0\Í,e\êÊºU\æœD\Äi,«\â\\Èœg«\é9!\Êö\Þ+l¸-\Ë}‡\ëƒö\Ï\á@v|ð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\É\ÒW\ãÿ\0\Ó||\àzJ?­|Sv6\í<O\Íq®\êz\Î4?+™]]Š\ï\Æ\Ìf4º@Y£I\Æ\ë,óù‘ö\×GW—ù\Õù1Í˜Öµ¹\Â#\ÙWv0¢‘¶\è²×«$3/4·%•”_U\Ù-\æ˜\Æ!K¯Å§\æ\Ðq³¤\æ‡\'\Ñ\äUÖœ\åþÁõû{ð\Ö\î\ëi€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0†?\Z\îú\Õü\ßúRý/\â·n6\Ê\Ï&\Ù2Ì\âD£\ÌO2ˆž¤Q•\Åqù+Š:{%S,\è<m\Ë\Z»Ýžü˜¾u\á&+\Ìs\Õg¡e‰G‘H{ó¯-2\ë_8ªöI\Ð?56vˆ”t\á¢óŽ¬y\×\ÃõK/e\Ç\Ño\ìÿ\0\É~ý˜\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\nhú{üƒö\Î*t\\þ\ãÝ«l¬\ìöLÿ\0.\ÏdO2J¯R=G´…)[Oeâ©‘t7}^_³\ÜSÎ¼H\Å\"yŒx\Ý\î\íg\"<zÒµ,X\ìóû\ÅW¢NŠÂªMƒ\×^i\ì\ãª1¸§ó\Ìsk\êŸ6\ì\Ãô\ÊÀ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~˜\ë³\à}\ßXügK¹%Wmœ’Nl\ä\ÄÅ¡\ïõ\"Iù“c(\ÌoT<n·5q\æZT\ã#´¯Ý½<\×NúÂŸÎŒ~q¾q*\éñaj\ÏÌŽ\Î\Ú\ÄôeFú¸¤c1\")ú\ÙŒ\×\Ê³`t™ÿ\0ôþÌ¬ù\ÎÝ¿G~u\ä_Ðª€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00|\âû¥ßŠýeL­\ÛK9œ\ÙÊ‰‹\"\ëÔ‹³\ß&\ÇôVÙ…jÝ‰V¢\ÅÕ¶¬ñgi_´¼@\ÊüH\Þta3óƒ\ÅóŽWO\ã|)»ˆÞ–{2z^úºC1#1²“d8\Æ˜|¯\évG?\Þv!gó^óÿ\0W|\Z\Ö~@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\rW\Ì\Ê\è“\áŸP\Ëj\ân|Xþs>Ä°Ç›\ÔûŸV6™¯+£C\Â:\â¿\Ö]g\Ìû\ÎW$±€#JXd‘÷y!\È×…*\Éw†’®³\àýoI\Ø&i6Õl\ÖÞ²ýR3[M³‰«¡nÄŠLf2:¯‹µý·(¹«ži}#\ä\Äþù\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ZŸ>ß›þ‘ƒ\Ó\ï\ä\æ,l3>Ä»Ç™ióýX\É<\È\Äc[,tŸ=i›X\×r®]=mŒ\ro]#Xå‘¢F0¹õ¶mvB\Ð<¶uE[\Òs£1¹3c[?v\ÉG«~¨™­³Ù­\án\×\åv3\\„\Í\æl`v\×ur{.û\×Å»	úU\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~;\Óu\ãó›ý\Å\î}Œ{\"\Çe\'ûýXsÇa‹7Uix¬\Ë$Rp\àà­¥8V{\ÛL¨\Ë]¯<µ¬“=óvYd¯\\pXò¯d]ü­¸³\Ù(ýb¶°ôy\\`Uú´¦\Åf·À+{™’c};þ¥øfS7\È\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Ÿ\ä\æõsñn\ç\Ç3:\Êu„’F$“ýþ¬eH\æ9¦,q­u\ØFm8™Œ\"\Î,•_-5\è»Xðšmg\í«w+Npó–\\«‘\ï’\n‘>o›/}ž\É\ë¢¿\Ìz\Ó	1²³9­Wbbl\n\ÛÆ¾\ÝóNÀ¾›B\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00~w[ú>²\æõÏµ»k%¤¼\Ç=Ù³ŒVÙ¢–šk¢\ÙgŠº¯8NlQf¶\\ÌœÙŠ\Û8¸’·WF¼\Üuv\\Ø\ëm*\ä\Ç\Ù>%uˆN\ÄS\Õ¶Œ\Æ\Ê\Â5}b»“žhtœ—p_ 9€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~1\Ãß™\Í\àW\Ç>‚÷o\ì=u’‰\Þ^G\ç6rOÕšAe§Ÿ•bG„˜El?6yŒ\×™emäˆ·UÖ¹¼6Z\ê‹J\Ôú:\ë¤_\ç\ï\Õdb®=öuñU\Ô\Û\àw¡ú\çÛ¿¡Œ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0•\ãDþj\í5?3\Óþ¼ÏŠ\ÚNüø±ýý\ÖY\Óc\Ø\Ö\Öúªº²¬®³\ÑYœJ‰š<\Ù\×\",\ë¼UÊ•Weû•ñg™5uü\ÚG®‘²Ò·]üx_‰P|‘v\ÄbTú)x\ç{Pû\Îù•ô \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\âøgI\Äÿ\0šv\Ôþg›IßŸ1K_u’J=ºµ-•rÏ•\ÚÖ’}H³\ÇM&*6˜\ê\'\æÊµY*–²\Î,¹Y-/5¥^?M\Ý}…•GAúeø•¶9 ¬#\ìIÔ›ó±ù\×v? 9 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ˆ¼þ¹~%\ÛRVôµº¶¿>,D¸µÕ³ jiúø\ïŽk$Å®â®±\×.‡Q\Ù\ÙWfX¼\Ä\É/\Zÿ\02«l«<GÄ•noY¯mc›y‡–\ÚVf\Ñ-n«ú_Ç‰±\Èþ£\Æ#lx/ü\ÕvöOŽöiõÚ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_À\ÇK_™¾‹CY\ÓWj\ØN‹\â\ÆÄµ‹]€N\Å\Ù\Úú\Þ\éy¼–²\ÎMoqwc76³±ºõ>Q¿	t\ÅmTj8­\×þªq·7v \æ5UŸ8cú\ÍkúIþ\'C1Q\ë	{E\çžg·¿\Ñ&\æ/m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00~p\ìt_\ÚVz±ŒI\×o ½\Ån$pž\Î@ý\Ç1G›mýWô¾c\Ä\èsgGš\Îõ*\Æ\ÓW\ëºÔ‹]¤¡\ÈÕ¹º\"\æ´Vº.Zs|g\×\ÅóÏ™´\ïo—•» XÉ•¶„\Æ\Ê\Ò_ºÌ”›sSôcú{ã·’|€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ƒÿ\0<™\Ö\Ä~•[ Ž5\Û\Ï/q[\ãÇ¬\è›«m\élú£*\Ëhº=ý{_²,j\ëµ\Î\Ö\ë+¤,•\\\Ä=[Ÿ\\1¨µÔ•|\í\Õ_?½}U\î\ÍZr˜0%mÄŒhŒ[{¬³9¯ô\ï›w;÷.8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0ªž‚ÿ\06÷øG5\×FXþV6E\î6Õ›bØ•\èš\Ý\ÓRX\Ù\Ø\æ\Ò\î\Þó-Wy\Ä\ÏoYŒ}:\á\ê–%Š\Îgejƒ¶†½\Ôkr6šB®Mx•œI°\ßW\èÿ\0ò{¤\Ð\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:øù”þ¬þ7ô¨ø²‰]\ÑLl²W]m‹–¼FÆžq+/x’\Ë‘2³6¸\î7\Æ\"yy<FÏœs$hy½“h\Ôl²(õ\îÄ–8œm4dy5ö%\Ö+¹ƒô¾\'½½q`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0xóç¡Ÿ‚v<g\ãûHÕ²gþeXÝ™º\ìµ\ç2$˜í–Œ$\Õþü\êó[ZbŒI28•{D\ÚQ\ï3\â\ê¦\æ´\Ç5V\á&\'³§¿n«#1•[ôSúWä›–ò8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0WR¾z¿7}«\ê\ãAŸUÙœ{®\Ér¼È»%\ÙhŒcpf\â&\'›Q’H“Y–™,XÑŠ\Íw‘…j­ÄŠ]˜ŠI·\Ózv\çõ\ï—v¥ô¾p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\èºÁùGmL\ébNóy[Œ\Ûdû¥nF\Æ\\e¥‰ú²\ÑZF¬›xóXGö’CÎºc\Ó\ã	1­»\é\n=¾Šù6Q³Z\Üý\Zþ›ø\× z€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ëg\äQ? í°¬f¶wGy[Œ·dü±[t\ÆZe¦HJ²\Ñ­¬\ÅiY>o‚dE*ó¯0M>1³\ZÛ¿)-\àHVdi{F·?G?¨>5¶nò\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0®?Žô=IüS¸\×ó\Øå·™v™v»´È³§$2\ã$-¬<Q”¤S\Åvø§¿:\Åq„Q‰ž\ÏÝm¨W¹\ÆÁ¯»\Ú5\Ù\ï\ïô\ßÅ¹\Õ\é\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Û~xú\r¾s\Õa˜O¿U¶•y%=¾ley‘vd…\áka\â1‰ˆ•\Û\ÄL\ë\Æ\"cf$b–õTvUµ¾¶f¼\Îv\\;¼þµ\ïûÌ¾¢þ\Ï\Î~Y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u_\ÎI\è\Û\àL\ä?)\ÐR˜J>%?>-\êr\ê¯94\ëÌŒ¼\Æl$b°¬?­ü‘ñO\è(¡f\Æ\Ñq»65eKK‹;º\Ügõµ\Ï-g¨_¨ñ}ú}_\ç_A\×\Û\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0 ×«ù\âp\Ø\Ýdž­¾õ\n\Ã\noÂ§¨½¼\Ý\î‰e\æ,\å\0E\"‘³\ê)U«Ûœh\Ç=F¤±\Ï\æ¾Mª\Ç#¨m\Zö\Èß›.›™\Ð?@\æþ[\ì ý\èõ\Ô\Ý\èt:ÿ\09\È\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01øï“¿ž\Ü|\ÊY\ãú\Åtœ¿\Î\åÿ\0¹qÃŸŸO—­\Êliö–”²V\ÉvDm›„oq…t8\ÑJ\ëX\Õe&ùT‚$‹#\ÝCkhm=[vA’í‹‘ýs\æž&ùøa°¬\æ5u¯\Ò/G\ëK¯¦\Ø;r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Wj\Óòó^ƒ§\Ø\Ö:›³æ¿­I\Íq‡å½‡Í—\ÃþÅ„\âF6Q\æ~4W¹\è\Ä[mU\ÅØ‘Š\ë•§˜²„orh\È\Ñ\ä]–p\å]½\å¦\ÊÕ·$#};\ç›×µ\ç1ª©ÿ\0™n}rÎ¶Ç²i0¾\ä~‰K\Èy^À\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0òq‚ÏŽ_žt<÷»Žçž¢ƒú\Øô|VÑ£\ÇRÿ\04úW\Ï÷É¾«À_¶E!C˜\ÈÓ´WšcÒ˜Ý’Œôc|	fYEŒMù!–\éd…ž¯?]\â7\ïe\Ã\×\Ö\Ø\é=\ØøŒ´­½«™Ÿ›®<\Þjlñ÷\ÚRö\'m\à\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Ò\è³ùø ²\ã^,5Ä¨ºØ²\ê(?®E\Åo\îŸ^zø\âûß›Ï‘ýSR[\Æ(s°ôcDr4ô…&T…v#\ÒI¢Is}Ù—IYXù¯!»N\"“\Ìøõ¶<\Ý[ñõiY’U\ßd…\Ôy¹©¹£úún\è\à}`v57þ½€\0\0\0\0\0\0\0\0\0\0\0\0\0\0\äÀõzêžƒo\\Uv}\\RXq³\Æt¤…!ˆ\ÉÕ‰\Ý\Õ/õŸï¸®yð~|\åøô\â%gMóoñO¶ñW‰\í+¦\×VŸŒÀ†z\äl¬(eMò~ñZ#cHº&\ïÇ«»X›k\ëŸ8\Ü]?Kh¥¢´\ÆÎª,\èþ`3\â\Þ=¦J_\×Î’e‘\æ\å¦÷\Î\î\îmh;\î¿\Ïl¶Ñ­=\ä\0\0\0\0\0\0\0\0\0\0\0\0\0Œ:Ö«\ßó¿\ÌZô\Ó\nv1\Þ\Û(\ì¼bf#1LJNªC[\ï¦þ?k\â>‰>y‹þ{ß¦\Ã_¦SL-z%ùo\×:²ùÑ±\Ò`FSÓ‹Z\â­u§\ë±ˆ¹Ÿ$¼‡¿?\é9®~}¿\ã™oi\Î\ã‘3¤\êó¯¡\Ûj\ã¤~§Ÿè¯™\é½\ÚVEý|\ë\Ê<Ü–\ÛuŒI¯\Ç*\íjû÷³\Ûô;\Ö\ÕófSÀ\0\0\0\0\0\0\0\0\0\0\0y!x\Ï«3\Õõ<¾yûN³cl\×1\ëS¶\Ô]Ç»\ÖüL‹\'UiMˆõ\Æ\rº\Ô\ß\Û~k÷+G\ã~ñR™ŽRMaS±\×?%ôNŠ¿>}wFP\ßEÙ®<qŠ˜þ¼$yŽF=\ãÞ«^ù\r\Ýò=•~ƒùóž‹\\\Ñq/4õc‰\ãJZyùô±¦ê£›\è$TKòZb|’Iddg’.œ\Ø\Ùg7­Û¶Ž\Ïw;é¿©\îË \Æ\Ý\ß\ãÀ\0\0\0\0\0\0\0\0\0*uù\ëŽWN´–[ÁÆ¸>°?\Z\ßÎ¼H\Ä\Ñ÷¢t¸º#Ÿ[ð’²N«#õˆø\áƒ\Êõ\ÏÏ¢ü\ßúIvñùý¦_@³“X¾4\r|\î‹>ö^ü\Ë\é4ÇˆD\ê)\è‘æ¸ŽŸ=‡}\Çæ†ýƒ\åZ\âd¾\Zr¹§b^a5Œ*N®Xó?\É}xs}•D¸¤\ÌO²\Ù$òXi\Î3eœ•$2E†É«\Î\Ô÷#¸\Éð{ô\èav\ÓsO¬€\0\0\0\0\0\0§Çž¾i·t\×Y?¥ª\r\ã:þVœl¢\Î\ìl7]!–\ÂÝ–ž	G¦\'œl«–¬#M¯Œkˆ\Úvm\ÎFO£ñ\Üó6[#——gZ‘#MT¹ø¥¬zÙ¬\\Ž¥þAôÎ¡~1ôŒ\'ž\è\ã\í^A#úa\å·ð;ƒû\ï\ËyiöšjøûF”¨jC_\×Y`œ‰_À>–¿¡šy|9\ãz?Ä™`dg\ï\Ìÿ\0%”J,\'f1ùõ\ìµó>\ìË \ÊÍ‹˜þ¹‡»\Çz•ý\ÍZ\Ãç¥·Ÿ\Ör\0\0\0\0¦4¬}\\&¨²\á\Ülð’²Û¬xX\ã¬\âY\Æ¯\ÕaJ\Ó£B\Æ\Ë\Ó\ä™ü-Ñ‹\"Ii\Îaò«#‘g{ŒG‘§\\YsŸpZ\ã~¦±c¿¸Iy%b\ÏFŠ©³ñ\Ë\r…\ï^o¯…?\éºOü\Óö\í\Éõ•\ÄR°\Ü\Ý_)\Ý\Ç\é‘nÏ¢ò\Z–§1ü{\ÕÆŠ¨bF¿®²Ó†º\çº\Õ\ÍgH\Ô÷üT\ã:?Ä™cÁx~¼\Ïò^AÄ“\ß;6e¨E¯™öD¸2³b\æ?©Ežcf¯|\ïóŽûúx\âtU[\ßvð\0\0~Ž&\Õú\éþŠgVu¸‡§:’<üLÆ¥)q\nÆ­\"Wˆ¤b\ÈôA•dI$—9‘—´ˆ8\Ì\èÑˆ\Äb?Ÿ\Z²Î»\éß¸\à~Áû:\Î~r6[\'›²°\×\îN\Òñ\Ù#{\Å\\ÿ\0Zzf8§\ÍtýG~tú?>qôˆÙ“Ê¿¢ñ}\Óþ—ø–o\Òó\Z’–v8`ðs§kš´\Æ\ÍO^´³®\ãuŸ?\×\Óg+\Öñ¿›\éazó\äŒI,ID~¼Ï²,=@£2RÈŒ]\Þg\Ù¨8¼2:\éw†Y#wj\Ó\ê{š\è\ã÷e«‘òñ\à¥þSIµ7qT\ÉÂ¬üaw\Ò²++ŒjXR²(½Å­#O$‚ö«\"´‘$³\Æ\Ü$\èÑ‰%!\çÏGg]\ÞgqÀýVö•\×Ã²Þ¼½\Ýg©8JÓŠKv\ìU\Îõ…jh“Ž\ì~[¾#ôŽgó7ÿ\0D¿¥>E•õuxX¥6¬HÕs©«˜A­\ÌNNKa]Ã‹zþ$pv¥\ç:_Ç¯> ’YHÄ¿3\ÅÏ¨J\â\ìK\ß3\ä™4F.\Òìˆ±\à\æø´±Ó».\Åwr¢®Š·´‹/3s\ëùœ|Ë¢ÀJÂ¸¡µ‚#7bdV™%h\0Œ	%™*¨Ç¿;©9ºüH\Äd:BH=\Zû5½•w\\g\ÑwmYô•;¼\æ,²j­—5¹IÄYª™\ê¾F1Ùž5¿¯?1_oñ	ó>\ã\Æ>‰~™\Íýý“ýT\Ö\Å\Î\Í9_Œ+\Ã[š¾6œl\Äm\"i\Zþm‹Á\ã¦ß›ö\Zn«¨³÷\Z°ü\çx’Y‘IE‰\à³id	%‰\ä²$—¾mdŸ¨8³.c™yi¾3²ùºFó³\ÉXVž={ŒFDÄ)r’I$•¤’\ìôA•÷¡V‘gO»#‰(t„’Ì¤xÆ³[¿ºž3è—¶¬ú.\è]™\è±\Û|¾Û¸\Ø>Txê²‡¤þj_&úÖ¥÷aYŠ\ê_¾„ûþ\íº\áõ¿¸~0¯\0À#i®0‹Hœm±¯\à\îØ¼]:-ù·\Ñ5ýY\î]‘Wö@ö\ÂP$’A$¬2BP,ˆÄ‚g’HÐ—‡‚A/$—y‹;0\'k…‘\Ô%iZVO ðJ,ˆÅ§™\àY\Ï\0”E+O¨d’¸\É$\Ø]71\ß7m\Ä÷§2gxV¸\ß\ÔY-v.bÌ´ƒ‡¼y\ÆucoÅ\Ê>‰\Ó)ô;e7¦,»#}½ý\Ç\ä}°@¦\×þ\ìõüX8I\Z^¬N\Ã\Z\Þo;\ÅS‰^<q—6=Ÿ0\í\É\Ðô$¬h]g|bI$ðI&yŸ$üú\à&¤\á’{½oòYAbRƒ/ó?\Z2\àV”…Ç¨…™\à®,ˆÀJ#E÷™ô„’1”H\"žAƒú’1 \ÇzÖ§\èß´\â{\'¿\ÕôMkŽZB²Ï©ó{]*Î»O±ñc\Íôý|§í½¢R\Õ\à0q\ÕFøýt÷,j¿f\È\è Bo»|o?\ælõlx2LJ^¬N\Ã\Zºo;\ÅÓŽö>:ò\æ,:W\á;zD\ïÎ‡“\Î4I,3¾I\à”	\'£\Ìû#ó\ê“Ñ@€“—¿;\ìˆ\Äb\ìŒI#¯3\î\Å\ã<+#¤y®=Zdù+ü\è\É\n\É[‡¾>e;3õ+HJ+\äF1²\Ã\Ô\à³1\Ù\Z—5_CÝ¿Øœ\í=óô¸\ì?-\ÅX\Ì*.\ì«ñ\"&þÈ›\ë;ù¯\Ûy\ÃV®³\Î[E¹i<õóižº:z\Þðþ\Õñ±fpª\ÏU¦2&e]§fi\Ñ3óÇŸ=Kñ·T<§QZ{\ãúŒI$ž‰l^‰2K\È$’ñ¢´°\Îú\Ò\Ó\Z\0²–¥nV$rNÐ³œg­¤$\ã‹Ic\Í2e:$’%n®=ñò/|\ì²XÖ´Ø’Š\ÒIZ‰KP<eii#‘€f«·¾ß‹\íºvž\áz\\v¿iûY…Kwy^°‰»\à\Ó/®2\ê\ækÞ±\ç\ìšüp ¤Æ½g|V\Ï\Û«±?\Ò?˜¾\Ñ:|\ì_¥\Å\Ìd<JÊ¿R\êÓ¤\ç\çEx\×\Ð\×\Úõ÷\Ê[ˆ‘ýYQ\æG˜\Ä\ílO ðYŸ¬h’{ó¾´ôc@DÀŒ	%c7†o¿\Är1$Áf{tÉ­$‘OFE\ç„a£Ï“\Ý/Ô’¿Í¨ªõU\äôHÄ‚9vH#¿1\ég\çgM\Îw_\Ðr˜\Úgº~‹o&q‘\Ï\íË«lzð\ëù\Òoª\ã‡Å¿AE\æû®\çøªN³¬¬ô\Öù[ŽÉ¿ôB\ÒV9\â\ï\Õ>ô·õ¯’ws\Ê}[\å„o¬Â­+5¶ý\Ú)AD“ò\ïón\ßWÄµ­$’O\ÌROD2I£Û¢Ma3\Z,‰27\Æ1¬\ÂÀ\r·u‘Ib1ä‡¯+\"1\ê6\Æÿ\01ˆ¤¢6RIy\'i’<I¾k\ãM†uùšE¶F¼Ö–žvRýk\Ç	r1vV’Ic\Ó\æ<ƒ\Æ6\çM\Î}t§>\í3\ÜgE·œ&Ñ¯Ý—UXü&û¬\à·3iÕ—Á¿Jö\Î\Õú<_k\Û=·¢>%d\á|ª.Yó7½‡ô{õŸ“ýK‘›s6­\ßYÒ³IoÝ§zÅ¢¼ù\ìù·oŽoõ³¾?¨\Å\ì1K0{tI­=Ñ’Ü\Z\Ã¢Ï­¢gñ·x=‚\ì’We‘C‡\ï!7N[3™$bI\0I<e#2,Oß˜ô…­xIŽHÅ‘±ó»-+b\ÈËŒ?BI”nZx<–@¬<˜\Ô\\`•ŸS}Ÿ\Íû]¢[\ï\ì\ÊÉ»z\Í\æ³ò)\ê‹\nù\Ç\Ö:¢ø\×\ÞûÕU\Öm\Õ÷:Œ0:\Ö8—qÙ»–Æ·T÷mö’ö\ã\ÒSv­W\Ók\é\ÕXUƒE\Â\Ñ\Æh9\é>› ê£…\î1\ÜÅ’F\0ðJ$ŸŒ\ë’R(\Êl@\Ë\ágd\\GõŒY’¤yŒl’FbI\ê6!dy\ÂAY”¬\"–dœ˜\\ú‘\àôb?œ*½k¤1\Ù¤)q¸Øº\'\æÅ„yÕ¥¶\è\ÒHÅb1\â.4\í¥gy}Ÿ	\ÛÅŽ{·\ÑÛŽ7füosY\Ôû9þµ~#úŸ”+»\àm½žÒ‘+—§³‚¦–\ÎöI\Ïc¦>Ò›·¯¢|—¶¥rý\ÓZø£¥±\Öö=B\Ñ\×<ô\Õó\îÏ€•ö¸–%a#*\Ò\ì~u‰Œc\Ã9©“c\Ý\ÙdÌ£óÐŒY\Ò<\É+H\Å\ÙZJÂ+É›–8X\å\\0e²x\Êó\ÙI\ÂI?ªÜ¥oó]–3X\Ù{»³\'&C)J#AXy5þ]‚ö_9îŸ¥®\ì§dŽ×¬³Ã¨›ú­²$k\écòÿ\0\ê.Æ¹k>«úŸ’5\î\ÓVl\Ñ\Åø5½£\Ó\Ðüõw9\Èu\ë\æ\Ò>I\Þ\ÐxÅºlò>þ.œ„ÔµÏ˜˜ý+W\Ù$™‚I’X•¥™ñ†#\ë^lz1²Afy<A\è+\0+I$b~u\×O\Â\Æ\É82²\Â1\'(Å–²²\Â\Ë&¥\ÙW£Ôœ%\Èò\Ê*H³F“†5•n‰9F\ÂÈ­$\åu„r\Æò\åŸAA\ÚwG\Ãv«q\'±k,ô{G¿$±½©\'ð\ïñ÷\ê•ºŽ§,y\ËöøÝ†#¶›´\î2³¡\Ãn¿™m\Ï\"~ò? Ï©ü¿°.›<«•»®~o=gC«¼­\é~]8>æ¬?G\ë’.²»+I%nY~3¯2ÿ\0;#\å’IF$‘JP\Æu$\Ùx\Ù÷g\\c\É$ýy\ÙvCõ¯\Éúó²Ä”Œ#–D’1a\Ð÷ú\ßZA\ÝÁ²$”…\ÙI•–1I–}kAô\Ñó›dNZh•°;,\ä¼Goò-ù\Çôu¾Ü°¹\Õ+mzõ\Ú/)Áõõ\ÐZñN|½\ÎcWK\Äý:ýwá½tmûšî‘«¬|\Â\ÑÀ\Îw·ùô\å®ñ¢´²#Iä—’O\Æuù<\×+J\ë»?x\Ù$Œ	$`‹Õ‘Y\'H’J3Œlü\ë­$KLl“„OZü¿;.ò¤,°ŠY’Aa\Ö\"Xú\ß$ön‹QHx<ž2òV•~¡ý.tœ\ç&§C£6Ì˜|«²uy\Ã}7£\ïŠ}¯/ß»--üL\ç\ï7\Ìl‰¾zè¾³\ã&bù÷\Å^—‰úˆú\ï\ç¾\ÙúLäž±\Ó\ím—j\×:¾3>k\Úõ\ÍU&\ÉrA$ýcg’uÝ•¤£õ’J¬\ëŽZcgƒ\È,ˆøD\Èy#qý]‘d\é­$ƒ6,\Êül²?9\×\Ê1²°²\ÃÁ!$»\ÂAŽe‘Fõ*]þir²2\ÒNˆ\ÙV–@­<a+(\Äb1ˆg\Ç\Ñ\ÇI\ÏóûDL\Ø÷_FÞ¶8\è³\â z\ß\áú<\Ò=¦cŽbÆ®ú\æ¨þV;<jÉx÷\É\r[·N°\Û\Îw\Íõ¯ŒwôŽj\çVÞ°\êó\Í)ö??7\í¨\âk¬#$µ\ÆÈ¥›j\ßš\Ê\Ç>+	 µ\Æ\ÌH°Î°,HÇ“\Î6G?9\Ö y\Ù\ã/vu‰Ei´\Ï;#eøÎ¿Q–y\Ù\\E%I’I\älhþµq…\Èó\'+,,K\Â1dW\n\ÂI\ä¤Waù\Ë\ZÏŽþºN³M69:\Ê.\å±|\çüô\èz<\Ö%¦¹±\Ç\Ò_9A\Õ\ÌÍ¼3¹™¤,é·§‹\r\èß§œ\å¿\ÙþIÝ¯\Òùœ«nž³jó6!:\íñ†¸\æ6J$I˜\Ù`Fb2·,1Õ”üøðF<–¸\Ù\Ãó¯%%’8=X\Ù …r\Ìw\Î\É9~3®1x@?ÿ\Ú\0\0\0ÿ\0\ÔùWIŸúK¸8šb\Ü\Ï!k¡\äUŠ\å]\Ö~¤ðz»Á\ê¯59§u=¨ª)WdtÍ½¤#PB™\Øú…Pÿ\0\ÑZ‘Ý·oK©ÅªQW\ïÖ§‚¡l[ö\í‹}¶Î€Œ‹†Ä†J‘†\îÛº/ô!™Yód³©‘¸”p\àPÞª\Í(\Þ2\á\"Ø¶4\Z\rF½¶Å¾\×	•!ÂºUCc¡Zg‘*u&ªkSþ€UdÑ¥Ôµ`\×t\à\èLô\á#Q¯·\Â8}®\î\Þ¥p\â\ÖÆ¦S\Ì\ÝüxÌˆ9–¡*«’]\Ýiþ`šdFšC‚‘ÁO¹\à¤pS\ît\Z“»Dª†\Ü\ÑNÀÈ¹QMEQ|nI\çQ3¬ý2¡\é•\Ã\îî‹½¼tŽ:E~\Z½®ð¢aD\Ì\Î!­5h®š\éøË§\\!5ªR¤Ò¦¢\æ\é\Ý\"\Ý\"\Ý>ÎƒA Ó¶ñ‹\Ç\Û\Ä8…~\Z½µ-L&\ØÛœfI\Ê)ñ‡\ïI¡g\Â8}þ£_~¢aD\Ì\Ï\Z’­Tþ,¥d¿­\Ê\Éþan‘nŸgA§\âUHŒ”LsU3Q¨p\Åf\ÜM³s¦¦§\ÃG±t]ü.£_cøp\à0²gMX\ÚÆ«/Š?xI²¬Íµ•%\ì^1xÿ\0ü4\Z\É]\É¿’u\Ê5¦ª«©?‚¬9&¯þ\'>µGRa?‚¬ï€”¤þ$g¡=Vò\é¨Z¤®¾\çQ¨¸.R\"\n£HQ\å\Z*ðŒù²\Ùv\Î\Ð9\Ô\Ç:˜M\å:\Ð\î(pD(pZs9ƒCˆr\æ9söä“©51ww˜|AZ\é¡5OSIQB‡§º¸.ej\"RV £Ê´Q\á\ëÎ˜\çLs•r¡Í˜\æ\Ì&ð\Ì\Óy^”8¬‚Ns\naA\ÆcŒÇ¨Qö\ç\á,=TÍ§\Ä¢KµK\ÇhZöµ\n.AW4‘ªðˆ(ò’5…SÄ£ŠtUÁq\\=›š‹‚\èº|t„åŠ‚NZS–§Nm!Í¤9\Ì\Ü©¸¤‚u¢²>\×I\\<t’M/ˆ;X›·Lõ®Ø·Û Ó³P£ŠŒ”rdj¼={QšŽj\ÑEÌ‚«Ÿ\nŽ[‚\ç²fcˆ\ÅÁp(\Ä\é%0’FH\Èsun¡\Ì`$\æ£	®z\'X¡CÓ±ºd Y\é\Æ;¤Ê¢ø~@\ï@\ÕB\âö8\Çpâ“¥ËBŽ)\ÑW­Ásñ-\Ô-[¨EM*BŠdªGY\ãµqF|>uJ¨r\ÑC\âö8\êur\ä.â£©E\ÏEU­Ï\ßÄ¶TÎ¦êž”ø©	ªušie‹\×^¿\Éb•x”J\è4\íSò\Ó[š)©Âš“…‹\ß[ý\Ê@»»\îK½º¥«jË‡²kNþdFO\è¥\'>\Ã\ã*Ió“¢§*…4?}hZ÷)\î\ìK¹öõ\é[u4.ÈŠŠ—®•\êpU\"¯µß…\ç‰@}ÿ\0‚\Ði\ì\Ð)\îö†]Ý•™’„FEðõS¥TÛ¸3Q½<Tö;ð½ñ*¿ñ\n{½†!—wb¾$)\áC\áõxb»\×ð÷ ñÁUK\ÒÖ«BÐ¶-‹bØ´-bß·l[öx\0¶-‹d-L\'\Ùüx\Ùý.\Ç=Ì©ª–¯^­J¥\Ëò‘v*\âª\Åe\ÆvÅ±l[4Ž\ZF„4!¡\r\ÛÐ†…\ì\Û\Ç\r#†‘d…’	„û?ƒ/?¥\Ø\çº,Î¨ÿ\0‡\Õ\á¤\Ì\ê 4LÈ¤T\"©C\â\n¶ª³¡½u[³P³P³P³P\åŒr\ç\íñR8©öµ44	¶«D\Û©·>55Z\ÕA¦|$aAWŠ\év:ñ@¨u\Æü>½x¤ˆ§á®\ÍR-¨ª”\Ð#:ŠEŠEŠEŠG/ò&þ\ÝÁs\Ø!¨\ÔPÚSo¨I¹q&…:X¤X¤,ÚšIO\Êfü\ê„ú]Ž¼P…YF|>¢Ö™\Í£Âªñ\Í4\ÖÞƒ©D3¥2\á4\Ü\ÓHM\ZBh\ÒNšU\ÓM:R8i¸¦ ¡Gî¨¬ˆ\ÓPŒ“Nš4‘p\Ò8)©©\n$B¶%Q¸¯ˆœ$u¡)ñR\èuSIQO\Ä2Zxd\ã©p£,\à\éQ²E«jH©TŠ’QÁ\Òi\ËTFœ¸V\\\è\nO\ÕHõ³¶a7f‘e\î“P\È\è¬È“–ª ”¹\é\ëJ[Pz\ÍC\Öj	ÊF›\î!p\ê\"Hª\'B0S\â¤B%J®þ#•5;ñÿ\0”ç¾•}üb\àQÆ¢·‘\Ü?P\ç\ê\É\Ò~¥M%\Ì\æ\\¨\\«¶á‹†.‹¢\åB\åCŽ‘\ÇHõ*j.kˆûP\ÈP¡&\àˆ\ètZsP:J²\Ý\á§\ÅH\Äóþ#75Z\'ò®{\éW\ß\ÅP\ã¨ÂŽ*Ò·Cˆ\ÇŽB¡\ÈTFð“–\çAó˜ˆ^.\Û\Æ/º.‹\Ä/¸.\ÍÎº›FTö&¯\Í548«TœœU7üÔ¿\îð\Ó\â¤c\r»?ˆ¸¢•M¨\å|)ƒ\îTU\á¬5:•©¼5n)c‹\Ôu³\Å\ê\à¯Ð•€29\ÌR£§Ó«eWeÂ¨\ZgY\ècC	6ª“£ò•~Bj\ÕY\ÑEUrºTctÐ¦\'Yq59\Ä\êF—µ#R)hS@šš„\Ô-\îO¾2¢0®ªV¦Ÿ\Ä&2„#\ëy›Ia-UbWÂ˜>\åE^\Z\ÃhZQ6\ÕRÜ˜?§‰›ò\àR_RV\\Œùº^\Ó9Oce8ªn™UG\0\à\n¶¦’TøE~Cšj©Œ\rQJTR:i%^PwAš\î\èZ—ô-R‰ð…U\Ð&¡™¦¦¡>\äû\ãkù³]_¿\Í·\'{ˆò•!²vòJ|6³Ò‰¹)ªž\Ðu\Â\ÖUP·z½\ÇÜ¨Q=‰™\Ze\ÂsM%\Ì\æ09p\Å\Ã\n\ïn\Zö\Ö¿±33	\Ù;\Êkm—»\"W(§ErŠG©\Ò=N«\Þ2QC¨\èLõM=~$\Äedt\äµ\ëWÎ“\æ\n€\Ó#&ó,\Òñ—\ÃúYÊ©šnòº\Õ\Ç\ãInõ{¹P¢e¢‰\èü¤³š©>b±\ÌV9\Ì\Æ/P{p×¶°}ý‰„Á»f@\ä\Ú\Ðj°¨\éV>­yj‡-PM‘\Ö‰Ô“OBM2\Ñ?b*³\à\Ék«Wœ8ªšUU¸ue^3ð\ÅZ7A­\\ôOÔŠú=‰»,™\è¢b\ÍB\ÍBÉ‹&,˜²aT\ÏE\r¨>&\éTtö(÷i\îöød‚A7þ\ï·\ßôŸ\Ã;\Æì²¡)¸Ÿ©ô{	v®€²e­ŠEŠEª…ª…ª…ª‚‰\ê µn•:·L¸{\nû´w{ü2A@ ›ÿ\0wÁ4±O†\î¬%n\Û\ã\í\êADŽ\â@ý\ì—{^ô\Â~Ý±oAÀc€Æ†40~\ÂJ„\Ô\".\Æ]\ï;p\Ú\Þ\È$•%ð\Ù6t?f»Rk\\Qš”ƒ÷²]\í{\Ó	ûv&-‹bÐ´\ØMC\Õ%{Yw¼\íÙ¸\Î%¾G\Ô\Õ\äQð\ÖºP*üÔ¬Úª³~\Üøh\ìO¹\ê…~ý¯†KÆšuj’Cl\ãÍŽ1ðý\ÂiMM\ZÐ 0~\éC\Ð(«ˆ\"Úš\È\Û\ÓHùj}\È÷T+\Z\r=\ë_—4‚(gÐ˜G|?/jn ™\ÔM\ë\îŒ(¦¡Tµ\nG\rH\\™\"Cˆ)\ÝWyw§\Ú~á¯†K\Ç Už\ßFT\å÷\ÄJ…\Ñ\ÈR6{£	+¨I-E‘p\\E\Ñp\\cŒ)\ÝWyw§\Ú~á¯†K\ê8OMº²\Ë\â;YªI\'\ÆTû’\ì\á0dc½W#x\Ê<ŒªŽ\á0a4j“€½Kˆê‘¥Ë«&8O°ýÚA ¬ƒ¨\ætG²øŽf\Ý5¡\Ü$T\Ò\â¾÷\Ùlc’³W;f®~‘\Ï\Ó\Øa*,\Zröir\êýciZ«b\ßa{µƒ\Æh—Ä²†µ»‡q\ÅHY\Ù\Ð~\é1Ow-P\åª	§óI!l[…#¤-A\è¢zd-{7E\ßhƒ¯6¬[ªM\ÙR_ª’®œ‹¢Šdc¸T÷I‚\×NX‡,A$…–Å°O\éý!D\ÂÉ–¶A£\ì\êcSöˆ73®¼j0£c¾(ªt«Fh×—\î	„\Ò\Ð$®ƒ™!\Ì¿Iô„Ñ¤Î„©\n:-pFpZ¦\â“+\Â\èQ=B‰™š½\ë{g\å‘7­\Ñ\â\Øcx¢ø¶\ä6$\äý\Âa0ªZ\Ðs*b±z¡~ ”­DiË˜UÁŠ\ÜTa7—>¤\rP¢e¢©j\ï[¿Ú“òªÂ˜ó\Îþ/ž15ØªöQ\îK¿R¨¹c3U\Ñè«¯šm\ê\Õ&ç¥Š…Š…Š…š…\rZ\Ô-¶BýBýA%ªL$ÿ\0B¬´\ìÎ¥6Õ¡™ü^Q©<`©=”{’\ïk­U6mEi©\Z\\*GÛ‘\ri\Ò\Í\"\Í\"\Å\"\Å!Ô‘¦Þ’E¡\èôG¤)MV$GX>ÿ\0hô­L	©¡	ñŒ®)V/Ð§‚¯iŠ…JŒ^\ÑBj\È\Òd³‚¨^B`‹\å\í\'_I\é8ŸNº\\LF§z½þ\ÔZ\Ý8dØ™´ø\ÆxÌ•F´xkö©¨\é4ž\ÕI%#Yš.¡tŒ] ˜.\îþ\Þþ\Õ+:B¯LŽ\â•@Ì”\ïW¿\Ú\ÛfD\á\ç\Æ_³¡óiø\åZº\á1¡ö—¸¼/\Âðõ3¦c\ÔG©dŠ°£Š«>\Óöhò\Âm\êr1hã‹ø\Ö}q+b\ßi{‹¤.¸.N¡\É\Ô9QÊ„\Û\ÕY¥\ZUû\ì\ÈºðÒ‘qñº©*\é\É`”Ž].¥{\Ö\î÷Á\ÌP9Š1@\æ(D8ˆ]}»b\Øa£‡üIDG|rr.™Frh¨\ÉÒ½\ëw{‹‚\à\æs9ƒÁ‹‚\à¸.{v…¡…B¦eñ\í\ÍK\ßb€û\Ï\ÝhcC÷6Å½BQŠ\ÑÁñ\í\Ññv(¼ýÕ±o\Ü\ÛÂQ±|{u*M—zŠD¢gQþ\nŠT\Ó\Ð\'\ÆDPV¡\Â¿Œüt\ÏBÜ—\Æ\åò&\ïMC¨\ÓLª/Á&ž„še£”Êš\\W\ÃR•\èJ)¨\Úù5	™|s!zi·Ï£j¡·b!/ŠD¢gQûF½¼€P™\êšZ\ÂðR²2QMC\í*TgŸ\rQoÈ©øÚªÒ•(-TŒž\ã\Ç\'Lwb!.ú+:4Ê¢\Ôk\îu\Z‹b\ØM=i—\\ ¢š…35u®¨†\ÅQF&Dn•ª‘.UT_p\á6\éÊ¾Uò˜\Ò_šQ/”\ÄEi“zlŸ±t]\í\ä)…\"\Ùd-¶C“˜¼/*G>\Ëz+t¦7U)§ÞˆM=l¥mB+¤½YjQ¥Ô’\ÏTùcI\êriÑ”\Ä\ÑJ.\Ó$\Õ\ì\Ðh51©öóÔŽz‘dY\ZR4¤s†9\ÃE\Ñp\\ö`\àh¦ª–¥…)÷¢H( ’Yº\Í]¤\é?Š;A­2x·f7\ß-òÄ²\ÌR¹jªeRæ—³t]\í¸.‚\à¸.‚\à»P»Wktv¦9\rU)\Ö+ñF÷¹\ï\íEeR>]³\ï‰.½Q#:½fn+¬þGÛ÷Ë‘\nj$\È\Õ#ªWB\Ô\ÄM)©\ì]{xŒq\â¨qT8ªU*‡Bñ\Å\Û	Ž\ÑEFt1¢±_Š7½\Ç°šu!S<€\Ð:k¢²øb‹¢‘/’µ¤\Ô\È\\V+%ª×³¡Q!“ k6¦\ÔD*¤ôY½U\Ö$«r¢AHª½­F¾\Û6„úH\Ì\ÛÇ©•«\ã\Õc‰¤ÞªM#\á+b\Øb\Ø\è7ß”ýªj®ƒm2ñ\0\ÚmªÂ…(RŸƒT\ÒN%H-6\é`nŒ\Ç)P\å*LY?f\á\Ñ&h“˜\×IuNš¨«ˆ\Ó#¬,\Í\éd›|šŠû\Í_\Í\\F7K\ã„\Å\Ç\ë4(‘%›\ÓI*|À8\r©¦‰\Ë_¸¡\Ç\ÍŠPlrESw‰8§\à5ªšd¬\Û\É|Žª‚\î:ª\Ùû¶Dt«‹¹\"FA•\Ê zö$n+^N„Ž*¾2©-Zb”\ÍÁ{Šª²\ê\ã\Ã\ÖEh\è¢A|*Š…~$’=RL8\ïsõ=\Å*GC‚ \ÚQ\Ësm¦a\'(,_‹Qd’\'Y)\Z³n–#wUFšuTi²*Å’K\Ý\ÐT\ÓTƒ¦‡K\ë\Ï\ÙEEHJ¢¨š»¡™Jc-r\"\Ëð\ä\ã\Ój¥}Æ·•\Â0¤¤ÑŽ‹Ev½…|*Š…~$\ÒPFN;\ÜýOqGŠ‘À8±´\ÒjtŸ5óBe\Ê¬\Ú\Ó]?…­J(¥yö)2\Z\ë:\ë­Cü\r­*„W‚”‹ˆ¦\Z\ÕUjPfJ¥§b?“>#N¯š\Ôs©\ä˜:¯Uqª¸ª¤kö\Õ\\)¶‡_\'§\rÂ”Qc4ö›7:*où(™ð‹ð(¸]¹¥‘!	\ÈõUME\ïLÈ…NÐ¤+6¤EPRu\â‡S\Ú\ë>R¡\ÊW\ì\è4÷:\r;\\£\ÃTbº\ÌH6*‰du\nQI\nBuDPUJAbJªr<1[\äPô\"¿±\ÂÓ“/ŽaˆB ­I¤¨•öùzh\ÂgÀ^/Ár•R°\Õû†\æ\Ò~£$\Ü$¯¹3\"Ì±@—È•¬\Õr\ás\ÔÅ±lpT8*\n¿B?B*¨r…\\.\è‚1ÀT’FD\î¤QQ¹m\ÄNc¸ \ÄV¦š™\ÖÁG‘\Õ\È×‰`j«LF7Sz•._µ_\n½´Pu\Zt–Å±3\áK\ÅøKUUv#$ù\0”\Ñ_5\\ûý…rMhZU\Â\á4\ê¨\ÓdUö\ÙG\0\àƒðd(ð³ñ2ð¹m¨]/±ZeÂ‘ðŠ+˜\"\â¥\Ä9£¨<ŒE\Ò9F5A+Ž0¥G\Ú)6AŒ™(OŽ\çj¾{hLµM1ÁH\à¤LøRñ~Ðµ\Û\Ì(9…I\'%TSU5\à¨pT8*~,û!#ª¥+“\â\'hª&Hõû\è(\Í\Å-\Ë!‘¢´\Ïó\Ö\í\é\Õ^#>MSQJ+¥Gœ¸PW\âö(	ö\Éw·üm5Ö™ú“\îƒA§nƒO{ \ÓÜŸd\"º\ÔuŸVK!ªj§ Q?`Œ\È5>*rG5¶\'\Ò¨l|\Ðlx…ÚšŒV}Gõ½`UÒ ¯\Å\ìP\í’\ïoø]žÎƒOÁ©ù\êSJc;\Ýw*Ÿ*\'¡\×@§Bì§¹ZhlžI+O+4V´™0¬FSXý!3VÚ¸¼ªi¤Mª¤´Ÿe$»X¦t\Êpðøü\"š\Öj\Õ\Ã\Þ\ë¹dŠªkLV¤Žªj*»\'\äm\"\å*žÖ¦õ½5! \Ø\á2?P‘+VtU*¢d\á±82¦®\Ê<Iv¦™2\ê\'ü?¨\×ÞŸ\à™x˜øPñ¡\áY3\Ñd¸‰J>J&,˜²z\Ïkn¿dt„Ü•$\æ8\ê#Ž|\'2’\â6³\á‚2:gBÉ‹&H$™‘#ÞŸ}=Óž?\Çj5÷\çø&^&><hxTOPºdOZ”¤Œ[ù\Û!?ô\ëñW­%R‡R\æèŽ¢ª‘!BF\Å\íMO.3”lU²\È$™j’z{\Ó\ï.\é\Ï\Ã>C\ä8\0¶-ûõüQ]ÉŠ<\"¢\â%hÔ”L\È\×N\í\Ô&\Å//K\ÚSNž\'.\ë\Ë&@a0šFbŠaªX­u©Y7Í¸C\Èx{P‘N}R]O‡pR8)Å¾\Ýž\íWrbb©:\ÂIq\Ó.¯-RiTt\Ë\Ër\">?öñ:rRt¦PZ¤ŠP\ÐV*³Z‰f\ÅIQùBbdò†’u¨j\Õ\ïôø‹Ž\è±@H&\Ð:\îq\ãf\\)\å\Îi¦©\Z¸\éf™WW°ÁZdƒ\ì‘<mªÁ*‹c*Ä›c¨Ë½ ¯‰n\é\Ç4\ÕM%ùýþŸ\Ôk\ï\\wEŠA0u\Ü\ã\ÇAp%š¹:]J\ë6HSE~Ä‰¥PÁ•9B\Ï*4\Ä\Ü]N/ZªrÜªÞWÄ·t“Š«¥¡U ¢ù­^”—zaE5\n¥©Ò¥2\Ñs/)ƒ•‡Jª+PøK±CÐ¹ŠH\Ø,¦SZhúPv¡x’¤iµú­E®w„(¡hª¿\èX…ªUC¨‹½0’º„\Ò\Ôò5ˆU\Ù\å2\Ìûòc\Í)\'Ž+:\Ê:œa4\ßú¹;TÊ¼AO\È\×\êµS*IÊ‡Aª©\n\ë2?ô#u)\âAO\Ë\Æ8\ÂJ\ê(P´\Ý\Æ\Ä\á¸þ;=\çJ(óŸ,n8Ñ§¿²IR\\ñ¥	½-•Ò¦µ—\nŠ\n\ë\"4S:\n]^ÿ\0B7Só7R®:‡BŠþi*3i#rŠ…{cÀR\Ò\ÕGÕE\Ó]2nŠ2’=;©z¦Õš·PÊ¶õŸ\ru™Š\n\Ó*i\È\á¯ý\×\ë7\ï\ìN¿’j\á¹*»Ò¦i\Ãg4\Ç\Æcm\êNF4õ©\ßr\Ý\Êwi\Æ)pH\n¥&\Ú½W\áPd\n\ÑZ\Å\Ç\îLÆšýfýýˆx“\ï\Ïÿ\0¬¯ú4‚c$úÿ\0J0<\î[¹N\æ]ó=\Ø7ôð\Õ\×\áPd>>¯¹0_ˆÿ\Ú\0\0\0ÿ\0\ÔùWAŸúMG\ÈPg&–‡& ª—§#È´\ãS¡\ÝDQõSQ6pFI9 ”Ž€¤M\Ê*£+Y4Á¹UJ«MzË’\Z\Ò5¤qR8©\ZÔ…\ÑtQQjš…Wj¬µ›”NªUH¨U:ÿ\0Ðº‘\"®J’;Y`’fa4\ÈËžð\âCˆq1\Æ.‹¡:ô:+2.ÄŸU&­5ªâ¸³®ª\ê4…\nP¡ ]$)w:bµPÎš»x\Ç·\Ä8½žbš‡Î£M=jt]\r\äH\É\ÓeUU\É\×ñ\ítHSEJ\ßyZq\ÜdT£·Š¡\ÅW·\Äcˆý–\ëU¶üô(™PJ) ¼Bñ\r pGK˜JJšS­±\ÓQWO\Æ\äW:\Î\Ñ!\Ä.‹¾\Ï\rC†¡\ÃPá«·A§²\Ù3¦¦\Ê4û	*P´7Pª’¬“MTŒŒ¾2\í\ß	\ZUkd\ÇŽ#\Ïg€pÁ\Ûó?f\×¹Áì¦¡™¤¨j\äê©±qRõ•	Ð¢†‚¿~\æª\n;T\Å\Ñw\Ù\á¨p\Õ\îx\Ç»H%Ú¢…Q(™\ÔmÔ®šþ,¥d\Õ7‹9òŠ\à¹\ìðs©OÝ¤\íMC¨\ÓLª)D\r¢¢®ŸŠ¾rUµ \ÓÞ¦Ÿ\0IR¤».‹½¼#‡µ\ä…\Ñt9\îiQ?z\ê\Ø?o\æ>~õTŠ’QNÛ¢\ïo\r#†ž\Ô{’ˆ^ \ä¾L\ë\Ño‰ºZ\Ê4¢¡Ö™•\î­A4øJ•%\ìZ…¡hZ½\Êi\èP¨.Æž\n—&\ï>\' ©Ô¢ˆ‰M)«\ÝZ‚©$¢œÍ¡hZ…¡kÜ¨™PJ)§kOÇ¥h?‰È–®\â¼&8O\ÜðŽB˜E±ƒB½,\Ôffi3«N@\Ç c€\år†¨\éV:³Z+UZØ¨X¨rÃ–++ö\ß•0n.6ø‚•k©ðs\ÃH\á¤&Þ“:•šEšBL©	3¤‡ C!\È\äriŽM0¬u ªR\Z’\nÂ‘šEšG,˜\å“hhö\ßø`*£—ø‚ô\\I.û‚\çn†41\Þ9c¨\ÓC„&Þ­¬\êN>³	334™˜¡\n\Ì\"\Üô³H³Oo$9!_\ÌT_›Q¨\ä‡&=.¡\éuK¨z]C\ÒzA…\Öd£3\Õ\ÂG£„\Ï^Ê»¡/ˆ.¡&’]÷…\î\ÞÀkQ¶mMi¦ÜµM\rBQô\ã\é\Ñ&dfDI·#:S¥£·\è¬T›A \ç8\n±\Æ8\Ìq˜\Õ1ªaFe¢(#p™h\á2×²¾\ä6\Ë\ÓQT_|¾ª¦¡QWÎŠÊ¢H$ \È\ÒH6eQ\ÖÝZ6cU5 \é¥.\ä»ý¤{’ñ{Ë¢\ïk”Ï…tõ\n¦|*Q ¨Uâ†«V_u]T<¢³\Ñ5Žš\Ì$	$L´lÊž6\Ì\è\á&EH*)¤’\îHþ~\Ò=\Éx½\å\ÑwµtôS-TL*<UŠ»à«®\ï\Ã\æckZ¸u	:8‡IPš„D\Ù3:Ð£\äÞƒ:\Û\Ð|>\é/\n=ýš}Ê^\Õ\Ô,–¡\ÂZ“”\Ï^\Èõ-¹øy‘¥N\\U*‚jšJ\è$Fm¨-$GSZ\Ë\Ý%\áG¿³A§¹P+Ú’ºšij£Z&GWcC\áqñ\È\n%Ü—‰ d™\ÜdŸ\äkù+là©£\ÜZ¤Z¤]¨]«\Û\àÊ€ûý‡¯ŒÈ‹R/‡©E5Ð‘h\ïH$%\Ã[:<³Ò’\æNŸsdÅ“ˆ^/oB\Z² >ÿ\0aÇ\Çkÿ\0\n%Â\Ã\ëð¦ž¡4Ì‰4õPzB%ÁUÒ¦ƒQ¨\â!\ÄCA \Ôk\í\ê5öx\étF£Q¨«º rA\ç…\ç\Ô\ìz\Z‘\Ò\Û\á\ê	&Di§ ¢‚\Õ:\n‘—	¹[†F£Q¨\â!\Ä_\âCB\Zù«º rA\ç…\ç\Ô\ìz#\ÌÍŸ\Ã\êð\ÒðºP«8\ÄN¢Œ£„:S„¹š9 sTj\ÍP9ªHM\"2M@’¥§±©\rK¶¯\rCŠ‘\ÅH\æG29š1@\æ¨\Õ\èºwµú%Að\Í\'ù»$„Mg[/‡×¯?	­\Ç\\eU-h\á)%’\æG29‘ÌŽds\"‰S	\ËTdš†fšžÎƒNÚ¼51\Æ\r\Åc™¬s#™\È\æEÁt6\ïkôiKòÍ¦GWd‹*‰\Ã\ê-iFž\n\Úý\ÚŽ5=(QMª‘\Z‰ñ…gZ‡U*Q]G\ÄcŠ \Ú5J+n\ÑBi\êHÈ½\ÅTQ3#Vƒ\ÑDô\ê\ê«UD¥\nT|F8Œ^¨^¨6sU5·’¦šð\Ë\nü5\ntâ¤Š’ø…e£–¿F5-+N›j*dJ(NšªI\ZqT\ÔiÀ‘\Ó\ètC zzd9b¤“Hˆ\ÓOÜ¨™WO\ÍDÂ©–¾‘H(ŠT\ÔiÀ\Òtú\Ð\èHôzG¦pŽZªiC\Ã,+ð\Ô\ÐJ8ø‹º4]·tÖ¯¹4ŒÎŠOJ3RzZ!h‚I!5\ngŒ1À8Ž\í\Ðh>C\ä8p\à¿Ø´B\ÑD\r\">)ž±þþ\nü5\êu[\â.\Ó:‰·tÖ¯ºš&™QA\ÓÐ­T-TL¨\nªt†²\Õ\Z\ßqŽ\ZG\r#†‘\ÃOo\Ì|ÆƒA\ÃH\á¤p\á/fÑ‹F-²az5¡\ÅuGøø+ð\Ô#Ò¶—\ÄV ”JciD\"fuÔ–”¤x“c™!K‡LR7™>\É‰|’“ª#$-Ë°uS6l\\Q\ÙVœ5‹‚\àL%ò\ì1U|$£\Úd\ÔSEyE4¨ž[@K+L2\É\éZ¦O	j{ñ+Ü°X8LÈ•«ó\Ò\\4üAº$±dª)x¢gT\"e\ÅRdT$x“#_¯KŒQ\ê¦ö.®±fF´m\\Q1•0ð2W\ÉòIöT*\ÇCŽ O°\Ã\åL¨zö´ë—”­\É#SŠ’i^©´¯Fqõ\"lžTv*5{–	*8R©t\Ò~\Þ-\Êõ7Å«R…\Ø.ÚŸ†\é¨\Ãñ\Å£TZ‰Q<µ\Zýfý†(¬µMB2õ\"¦AU\ÉDÎ³M=Bi™ƒ@]Š÷«\Ý\ÙG‰>\ÕSQ(GY¸†f\æ—XG&\ÛoZQ[\\%¥4ñŽ1`‡/H\ãa@°˜H\ÜUc¸\'I™ˆ\ÖUUL\Î²QUQRu|0»öÜ³•ŠM43$\í.\×\ë7\ì0š†GEg§-X\åª	©\ÆHª$“\"4\Ó\Ð|\Ç\Ìb½\ê÷vQ\âOµ7Q§­Dp\Ï;O\ÕÖš;¤q\â1\êõW¨q\â¨([S~IRi•UB3¦ª&›¢´,\âVeþ}\Û\â‚e*\à’C0ýK„‚Cø˜H\'\Ûp\\L]1t\Å\Ó	Š|*(Z*®¤Ù´-{*{TPŒ”OŒJx±Ÿ•Ž5RÒµ4…ÊŠ\á».\àÉ¶Næ¤“vw\ÔH$?‰„‚}¼F8Œ]1t\Å\ÓLP)?’ªhR¢>\Â\ì\Ú½•½©©\ÆLŒ¥<XÏÚ‡¬bº’ªe\ÈT»5ðÝ¾C‰™\Z%7­S\â§\Þÿ\0P?µO}!p\\\í¬U\â\ì´-v\Ìx\àG/]ó¤òy\ä\ãq\ã33øke\ël¼Tn¨\É©ªŸ>÷øŠø½ªK\çA‹\Âð\Ðh+x»-h-v\Ìx\à;Ü¶\"\'\ZS^\é<S\Õ~2\Æ•G(\\TS\â¤R)ðû‚H\Z]ª÷«\Ý\Øcø$\ï\ÐÆ‡\ïd\Ò2¯\ZHÈ‘#¤¥\ÜpœÃže\ï\Ãñ\åx;2®Š|TŠE>qo@Iv­Þ¯i\àC¿€p{\ÙDÿ\064‘iV…F@\äÓ¨Žª‹\áì”´\éwÒ§\ÅGj^{ý„‚b1#¤:T©÷ª£QE-C\â%›UQ\Úƒn\æ\ßId\ÏEÓ¶°}þ\Â\Ý\êøjSóA¨EB8(\Ìß—\Äq…\rdiñQÚ—…ÿ\0a ˜j‘R$\Ô:ý\êŠ(ù¦™R5\Z„ÿ\01¢ÚšŠÁ‹w6úJ&Lµ\ì¬°·z¾\Z”2ªO\Ên*¥‰Á¯!ñmÁ$ª]\È÷ö%\áG¿Ø S\áY\Í5’…\Ä|°\å‚SOˆ\Ò\È\Þ\Ð	…$IL€’4\ß\ßh*©4\Ü%[’¬•ü\Þ\åEŠº¾o“»^*©7£2rUQ\×W\ÄX(i9K¹.þÄ¼(÷û\n|(¹ª³Oó/@\å©\n\ÒÊ’UvDIÂŠšÄ´M\à››-Ez\ÒJ82:f—\æ÷5VaEÎ„¸\ÂJa/6´\Ä\Û\ÖI¬uÒ¡…Ør^/h\Ö0Kõ‡¨¤½¢ª\\)\ÇWªU\nÈ•$¬‘\n&iMPd£\Ò2R¾ —…þ\ÍF¾Ê¡A¥-\è\Ì\\“•ÈŠ’ø‘–¤\ÚEd+ŒzjQØr^/j\é£\ÔT¢ \ç+¨\éP\ë+’OT©¨ªJšˆ’xfi\Öu¼(÷û…BjùtÝ®nø¡‘cŠ\èšA r^/bµ…U–«9¦²¬µ:¨:ˆ™\×P¡Z\ÐÎ³¥F•(\Ì\Ì\ègV´3¬\ËÓª¤‰½Dm]&Ÿ\å$\Ô\Ð&¡&©jšŸ/ir\ã¥ËŠZš²;£\â\Ð*TFH#Ü—‹Ø®³\"QN#E\ÍU\Z˜›&UVÙ•\'JL©	² (Ê’\n3¤&Da6T1\ÔSC†ôRj¶¦‚PÎ“MC\Õ544\Ô\Ð&±\é\í5\ÕJr¥ªM‹ÇªI,\×\ë6÷%\â\ìX)\Ü\ä9ñ\Ð\ËSN$\Ô	§©\ÓI\éÌŽd¾#:\ë¨(\ë@£ªµQÉ™V\ç\æ\á\É\Ã\â’SZ\Z¤u<hø=§j¹£*ž|\\\Ì\È5ú­‚=\Éx»\nw9\ïs\ã`ûZØªU¥Mªi‘¦M\r£JºÐ†¦ªT!\\i®4…q¿™\Ãß“—ÿ\0™Ê¦b13:Pñ£\àö\Öd”\\Nþ1ðŒ\êPª/i\Â|t¹eQ\ÕU*F\Çh›v_™³/\ËBœ7”\ÓJuSªUPAJi0¥4™¸{IÒº…]Nbª\áq¨K6Á$Í±S\ßGµ>ú„‘®®:þ1±¢\é8\èö©£ŒÍ\çM\Ý\ß\r\rŸ~f\Ï*ªTTªòºJ‰êµ¢yM+›¬‚“Uy]B•²r©r±k[ú+\Ñrª{\è\ïö²—&j|fªH\Æ8úšI]Bjb^Ö¿–¶\Î)¦„žRF›\ÚB•\ÑQV&vX!f‘f‘k„S]4‡\Ô\ÖN«#>Ä‚~ÊŠ’„«\ÊUº¯Æ£\ÜÔ‚©¨fi+¯j^ß•%\Ì\ÔB‡•kCÊˆ“Ÿ¨\êNVª‹\ÕLz©U1\ê¦\Ê\ÕM.\'Î‘\Î\ÕQš‡Qö$öX)R”\ä\î«Mo\×IWL•)™¸\'4§Üj¾%»½‹4‹4ŽZ¡\ËT9j‡-P\å\Ç.5\ZûzD\â”3A\Ò\æ\áoŽU\ÑV8¹¸¡>\ä{Uñ-\Ý\ìZ1h\Ç,9a\ËXr\ÔZ \Ó\Û\Ðh\'¥Tx¯Ç±ÿ\0¨Ø¸jjä©¤»+\ß\í]¨]«Ýª¡h¢ ‚øþ?õª¤\è3q\Â²°}þ\Õ\âˆj5÷*+ QC# `¾?%u{B\ÐM3¤\ÓP©+µµ~E4\nªDzû(¶·\ÇLô,-\nT+b\ÐQ2¤”P\é;\Ä/\àUTÈ”S_`ˆN6¡#/Ÿ\ÇY•&å»’®Ž\ËD,\åÎFt¤5/oŒqHjCŽ‘\ÇH¸.„\Ó\Ô&™‘pò¤‰\Å4²—Q¨\Í5~6ª´¥J\í	˜‹x¥N;-´a\Ëb¤œ~S\ã~\ßCŠ¡\Æ8\Ç\âA¨HŠ¤\Ó4Ž5¦—.LEMA[:k\nPi™|c\æf\É¢™eJ\ÑH\ÙÕ¥\Ñ½¼5\Z…±o¶\èº8‡\ç\êýC†¡\ÃP¶-Ž%\ì¨Tµ£ ’#ª®\êÂŠ’\àá–¨k¯\Å\ÖZ„iI4•’ÊŸ\nJ\êxÌ‰Òª\ZV—g\0\à…®Û‚\à\â1\Äc1\È\á1\ÂbÑ‹F8Hp—³-7UT¤\Ô\ä®\ê\ÂJŒ¹&N\ÚSM%]&I*Õ©œi•“Jž÷>]xŽYDri¯B‚†—=ŸùT‹T‹D-\Ðh4\Z\rƒ\æ>}´\×K*&§h:\Ó‰\Zõ&µ‘U\Û]\×MI*™|Dˆ\ê4\"\ëZš8H&è‹¶o\éS\ßVŠ‹\'ACdKq\ÄH\ÜO\Ø\Ðh,˜²b\ÕB\ÕCS\Z˜\ÔÆ¦51©ùv\ÍN\ÖTS]OjL\"$\ë¨5Põö\áPªŒP\Å*QY|2š+¬\èlµf„^¤T\ÓI|½™¿¥OmfIˆ|–³‰UQ ›ú}«bß³\ÃP\á¨<ÙœIRyCT\ç\çi58ˆqR8‡~¡J£/i\Ë.*Tfµ[W	–¥ð}BM”T1\ÐiQKb\â s\\\'ó?fs\éS\âA\ÉDÙ‘Tm¦\Ôj¦9—©R~Õ¡k\Ù\à):i,’|\ØU-“+Q\"u¾>1\Æ8\êu•:\ê‡L«£\Úç¸…\Êj*\ß&±VÐ–5\ã+HTGIüšj¨\É:\ê	°V°šI$Z„{’ñ{‰\ÌÓ‘L\ÍJAOwa\æUBu·È’p“´\Ò–ž\å›Æ´\ÖR¹:u¥-)Jªÿ\0í¦’L‰\Éo\Þ\Û\Ã\î¯Á\Ã1SuS:Ó®ƒüY\ÔDi6QPP\ÇA¥E-Šª\nƒ½À>C\ä\îK\Å\î$S¤ÓKU(x{tÒ¨Ó\ÈLcùeN«OGIû…IFA–(Ö¥^©X­\Z\ë?\à]®KBr\ä\é6Á·‡\Ý\\=\Ä	R¨)À©zUu\Z­\ÔHk¯áª®šJ”U¨\Ñ`fŠ’\í\â¤qS\îx©Tö­\á[ÆOµ\ä¾f`‚jr\Õ\ãù…\rho ’¡¹S]>\ÅhAGI¦yv[D‚m<Ú½¥Ô•WA\ã¯ðUQEd«:\èMTHýö¤*p• ™,c‘Tzô\ZG\å¤\Ø\â^\çˆqv­\á[ÆK³¼#Ü—y‚kª³fu.Rªª\ÂLÔ¢^\ÄÄ±¦œ¶NªJZ”\Ó\Ëûj) QC#‰ñWø2tU:jCðŠ£Õ¤\ÓrŠ¾\êš+¨&ÁZÇ¦M1x^L]?~¯‰n\ïaAW}b¯1O‡³øŸkr*klã„±\ì‰>$\ÖMòlj&\å9:T›…\nª\\\'Q\Õ\ÙüµEŠº\Ë]F¢ /\áü\'\Ì|ÂŠq…#3l½ éªŸe&ÊªÁ’”UAPw¸6C›!t…\ÒH]! \ÓÞ«\â[»\ØPU\ßX«\Å@§»\ä4!üO·\æG\Ì\ÕIP²ŒTÇ²*øe§k$¥ž*\é[‡P$Š²\ìþ\Û]g¥u™‚ /\áü&£Pš†fš|b³¤\ÉZ©\n\Å\Z%V´5\ÓY\"D8ˆqm\Ñw\ÞñR8©÷5Š¼RA°H$;‡gð1 Ô“\Ü\×qõ•U7ªšGq˜J\ê:Û›aYš†@ý•Ý±	&ª”\éøK¢\èº.‹¢\è\â¤qR®•\èôåµ¸.‚\çmÁs\Þñ/sX«\Å$‚@½©#4\ÏnK”lu‡-ÊnH\Ï\åP\Ê[\ÒÞ˜ó5+ ~Ên\ÖI’t½P\èü-Áp]E\Ñtq š¦õB\àø\Ú”“«ˆ1\Ü5ö)oSŠ\àc\êNŽ=ºb\é…ÿ\0:Y$zŠ+OŠ`»\\ø\ãB^{þ=9ApÒ—\æÀk\Ø]¸\Â\éfQÔ¤–¦5¨\Å\âH5;¢B>•=ô{\Ú\ç\ÅÜ—…ÿ\0\ÇqŽ?z˜Kð/|<@»{û>c\æ!U¼´2„Š\\…#§°é¦ ÚŠ¸dR0ñzP6+Ò¹ü\Ç\Ì+ó\n\â`\ÒÒ¨D\Ì\éüw\ãU*½\êa/À½ð<ñ\ÞÆ£Q…*k­Z†š\\õ \ä)*{\Z¥ò’Hˆe.M\n±W&\àj5\n…ñ0t\"Ft~;Š¡\ÅW½º.‹¦.˜\Ôk\Ût]÷t	_û	„¾AUm©z±Fµ57\Îi:OJ’H\ÈrC’t\"{M? Ö¢%;J°sMDûó\n…]\ëw«\á¶j\×	A£O¾¼bñþ6ñ\Ä.ºCQ¯mÁs\Ý\Ð%|g\ì%ò	|Äº–\Æ>.BÉ¡*\à\ê¦Z&™s£+2¥\ËÚ©<2]5’$+ˆruÔ©TT*\ï[½_%©’d•ú\í\"õ?\â¤qR/¼~\î¯\r}\ä]1t\Çð\ê«\Û\êÊ‰%Jº[¥Ug\ì.¡8 \ë®Q>a9Z,¨\×ò\Ö\ÝÁS@!ü„\ZgMf¯û€p|Œq‹´‹´ûº¼5÷!t*Cø¦nœm\Üu·r¡\Ôqitûj¬\Í20‚w©\ÌS$+ùSO3U=„?ðŒD©\Ô:\ÝüõÐ‹³B\ZÀ\íR-S\ï\ä›UM-©\ì0©|\Ö\îf™”«4Œâ›¶=ZþZ;P*­$vi Ht´O1O\Ì.\ÍF‚\áPV\ê_\â¶LY?8Úši¤ô¬[½n\æiJ³LŠ\'–¦‘ó¤ûTÈ”P\'­£$FžeA\\/bM[u\ã)Ò½?\èG	žŽùðT8*HZ!6ª•\Ñ.{#ÿ\0 z\æšM\Í¬ee\ÙE\\9Mu—biGM\'£ô\ïUŠ§fô#”\ËG	¼#„Z1h\ÆØ©T\Ì\éK±/\ËLÃŠ“7Tbe§d}—)£Z»»)¤µM2¤™\"N+d•š?ÐŽ{œwûô(X@Äš\Ô\ÕKDkY[\\\"\ïþð\Íx¦(\Ô\"Ÿ\æ0B\ê\Õ\á÷\ÝX w\Æ÷8\ï\í1B‡õ„=þ{–\ïþðL÷\Ìw7\ï0B\ê\Õ\Ý\îº±@.\ï\Ãÿ\Ú\0\0\0ÿ\0\Ôñ\Ôi¬’µÿ\0¤©¦ªvº\ë\é“fe^ý\çºKh\×p\äóyºÿ\0ò\Z\êzY\Í~¸\rÿ\0\È3®…i÷­\ë*›Å¾û\ÝI\á³Lºò2\É#>\ä]oã“»e÷\Â\Ý\æˆ\ì\ß\Þgr|/ûô™•§¶û\ï³;¾T\ÕOú*š+¨f\Ù\Æ¶\Ð=Pý\ÍfñÉ\âûõSžÁ\ç»\Å$\áu¥\\\Î,Ž\ê°\ÙT†!(™B\Ç.\ç3F+»rþ\Û\ÌJf^m¾˜ ŽI¶Rl¶¯qó6o7þC#g‘¹rÁ\î\Ê}Ùº\Æ\Ø\Û÷\Ø\é\Çp\Ú\íNómNùc\èJRV±¾Q\ì?N{\Å÷°\é§o™u3÷\ÇÞ¬³m\×&Gº3ùV\ãd\í\Ð\Ì3y\ä“\Ù©/\ÝS–xûõ‘¹‡¦\É#ú?\Ü9BiH÷\Ã\Èÿ\0`Ln\Ó\Ö@\år¦Ró>,©žü›\Ì\âB\r\ç\ï\ç³”p?&R[=¼{·YŸK?¹J²ü+8\Â÷\'ÿ\0@dY?‡@u±÷@\Æv÷\ß\ïÔŽ\ç/\Ö&@\È˜·?G$}¹Y£‘e¼g713¦ñK<È³ý\Õ\Î3\Î#\ï-‘\Ãz”ó\ëè¬ðò-À˜õñ¸\ÞG1+Î¯}l*ô¨\Øy\Û\È\É!ë¨­7È¯•0~õe\ê|´÷4€\Ã÷\Z?q\éÛ¬ z\0\Ïú5û¥t\Ó\Õüy‘—\Çi¢ª‡R\ßq½¦\Ø£­º~\ê\ï$¦\ágóB=	O¶½‹Ì«)\Åpü\Û}±\éÅ‘\Ï\Û.´–\â\È>eR(,Ž\æ\È^[#õU½rA»;\á\É¡9ýfh_kz\Ó\ÐF]Œz\â7ô+C\å%_s£p¼\êM%ŒC\å$ùœna º&„z\ã	\Ìaò¨wŒd1¹.€~\ïù\Û%\r1‘Cüjšj®¯º·WpUk\í~GžEtÿ\03\Ä6\ÞU\Ú*=«+\Ûô2Dg?\Ç(\æ\ä„T—\í\Îy˜Aylw B5\ã\"b«=¤m8$±lƒE\æUº,Ð‡|¥·A\ÙÐ·\ë‘fÇ‘x³‚ì•.r\"s‘H7]œ\ÌQ\ÞfûE\ã¥o†oµŸ¦[\È\Û\ÎF\Ç_b>\Ùÿ\0rù½šdõ”›/ŒSMU\ÕÖ—WLzh\Çw·+o-»Sý¯»[\à\ÞT<Þ˜u\ÂÛüIn·ª\â¨\ÎdB>VNKnc\Ð¿®FH\Û\ÞYüz\álv=–X˜\äzK7\ë~\Ç~ƒ5›\äñH\Ã\î6A sò¡V\ë‰x£²³+\á\ÉÀ\È\ì<’C\Îy\Ýð¼\â(\àe[¬m\n\ÊÑ¯I‹\È\ÈùX\Þ^\Â\ßlO¹>K·\Ó=\åñ~¿ú\ê\Ç::Á7«v7Oy\å2Nœ²ŒQ\äö9!óue_ž‹‡\ÈÃ¾\È\"‘\æ	‹\Äwþ9$¶\æ¸]e·\Z=ò(\ämù7“—\Ã\ÉYáœ¬€\ç[òh¯˜f\Â=uV‰@,\Æø’ƒùŒPœ|Š\È7²·.\Ä,¿<¯\ê£\æº/ùÆ¯ÈˆyVë‡«úS\Ìmûx£pOYa\ëÿ\0rûYõ\Ðû >-5;‹Bu¿\Û\Û\Ö\×R;f2H3\Í\ÝŽm½{~O2Lÿ\0•\å2­„\Å8|\'°w(<y‹H?E? ½û:\Í|~)g’·\Ã\Æøûõ¿naöQ\Ç?G\èrI	–!iÉ”n#\Î#\åG=º\ËñÈ–o¬-$\Æø’ý\nÑ¯†Hú?œ¿È‡‘W\Ä\ë\"Kû«8ÜŠ\ØD\ãvS\Ø2õI—ln\ác³\ÑYV?ñJiªº¾\åFcQ[K%¸\ÛƒŒÃ«\âTdˆHJ…‡\é\ë­È·.$qÅ²¬¯ö\â3\ÛÓ®õ\æ\ê8|ªÓŽ~Ÿgû8ç› J\ß?\äG\î9ƒG÷xFWž1\æ´\"	~\ß\\3]\Ã ’\í\×¡|3|\Þô\Ä‡\Â‹v3J\Ñò«<o!Š\Ì_\äVy\Ý\Â1\ÜÇ¦H±¿Tl­O†¸\ÕeP%\Ï\Â<û(\ï6O»=|S\îA÷,Àúƒ\Ïòvy{Y\é\ÌxÙŒ‘\ïGúÁa\Ù\ãÉŒrGY›\èüŒb±Q\Ø<©¿1YlŠU\êñ÷¯\Ì \È\æ\"‘[2n¸[*p€ý\â\áq$\Æú\Ö$.\á\\#\ê%¤,½Aƒ\á\éRAª@F\æ-\Ç=:!ò¯JYf-Ÿ<y‚\ã64\'a\á\×ó™¾ô¡ù»\â’}b§I¡ò\'f$²¹Ì¿ã“¼‰,¿\Äú\Æ\ên£þœúƒÞ\Ì\Þü±\Èö\"K#õV\ï“ðwd¡ö¯0}€f<’ôüra\æc Œ÷÷´VÀ#\Â\Ø>ß‚Cb}‚+J°¼¾G /¸\\X‘¼“\ÃÂŽAk\'gú½q\Â\n­+¹\Þ=Uƒ\à´S‹\Üôƒ%£Vq•-9\"³œœg8|œúW‡œõP«\Ù¥¤²(ù\È\åŸq¾áŒ”k\é\'ö0\Ü\ç¸G\\deñ/ùo\Î\àDœ“ü\Ô`ò…Ö\é›x3…–\ÙÝÁ\Äô\æ\Ç\í\Ê3MnðóÓ™C\é&’²^N8¸\â\Ê9Œƒq\áò¥ûsc˜ú\0¢ñô\nþ0\Å$r8p¶Gee\ï‚\æ/J°9y~o¡\ß2A\Â‘nº6Z±\Ï\Ö[\ÈZ6p_L\\1YW\ç9þ\ÃÉ…ÿ\0¹O/|cr®-t\Ô,†\Ë\ï÷\Ú\ã\î‡u=Ž|E*x\Õû§\î–3\ÔWP{“\Ô.?Žeò8F/•C\îFG8¶U·;¯:?`n8& ó\r$±\É\Ã87Eøñ~\0´£t­\È«\Ì?Yf2\0 \ä6˜\ä…\è\Ü5\Ã\Ð\Ïj\ß\ÙyµR\ìVg¶K>Gü~ºœ°+„0iElD+‹X\n\ãš#ûVA’>ˆc’\å\Þ@·#È¬«‚¼²$¸f\Ç\ÐÖ’Aº\ã$C\Ífùº\Ù\är‡Ê›Á­±{óº[\'’}­·‘\\÷¦?ˆKN\Åb\Ñ=\\oûý\Ç\ÝÝ¥\é\ÓüŒŽ•m~*¶\ã\î\Þ\ìA\ÉLo„\Â\ï2¬\Ë8\È\ÖyûÁðô©‚Yva^J\Ç\Å¥f\rdfCHI\Öý«*m”ú\è\Ã\í\Z\ëˆ«A€G\0$öA8ó†|ñm¹ŽE°\"½þ4¼\ïi/¯%³\Ï\È-µnl‡&óp\â’Ú®l­Ž9\\~\Ûý<l~Ü \Ä\Ã\Ò<«¹³¯a\æ8úAŒ÷\Ø\èö\ç\é[\â³¶\Ø\îð\íŽ\ßlw!ž­\Ó4þ*Y¶‡F\îñ\ã*^#œf°\åÜ®²\ÈzX’”+<û‡\áž; ø\â0yZh\ÉqŠ\í\'Ÿ·ö	²|#v­»Ž!yD#·2º\\\ÕH.?Ä®øY\ÂÁ‰q§þ<8:y²ó`\\\"¶I\Ó\Õñ%\Ód„R2{,\åÿ\0\É.ñ\æÒ¹¼ónYy·PIla\0÷\rD¦HET¹\Ê‹¸Y\"†‘¿ƒ’ÿ\0Žö7°8\×M\ßÎ³œ{kðŠ÷C\Î÷6\êƒ½•oª‰‰Y\Ì\Ö\æ\ã­\Ð8\ä\ç¥l\Üm\Ãå±½¸¾1½¤\Õh«o¤n\ÜXF7ù\Æ\íû‚(}²~¹\Ãl\é˜g²Áœ`\ÚF\ãüWHGl\Â8\0CncôGn \Â…°ð\ïn[®m$z\âKaÛ¬r]<ó\È<\Ø\ÌCÍˆ‚m¤r\Ú=\É6\È\ÆK·D‚\Ù\Þ\â\Ë?\ìo>¸Œœg±\"úQ\ê\á“\æRl¾ÿ\0\"þµ²ünaö’Bu\æa¶{o’3\Ü¥\ÇñÁ\éM\Ð\nú‚\ë,Åº&eœ.!\àùñ„\à\×\Åv\å¹onP@@\ác\ÚGˆnb7l£\Ð¸<z£\Ý\éV¤ƒ‰ùK}=%¸ôSˆŠ‰K‡|z [1\Æú­ŽG…±T0\Âwl›‰\í²®U€G\Å3\Ü(6\î\æ\ÑC6`\á–\æPØ ¸\Â2©ˆ5¾Ë™Z¹oÛ£\áÿ\0v\ì3v‘û¬Anf\ç±Å³|\â>q\ã\Í\Íq\Ï÷VA*œA_¿YlN\\aø=òÀöþÀÅ°\×®\Ò91\í”z·b\ÅX\Åb‚QC‘0Š¡ò$>V”’HY!d…‹\â\É$C\ÉZ)\Ç#\çzXZ+É˜Ã¯Œ\Ã\0ogvpføw“#eeoxò`W»ÿ\0\Z=\Ç\Ýix‡ý\è>Ö™ÿ\0\\8º³*\íþy\ÓÜ‡©3\Ù\é\Æc·\ëJó\Ë4d\ã${‡0@ö÷N0,»a\â„lV¡œPF+\Î\äLX,®`ùšc³A§·d‡$\rY\0²z*=ò[«€HJ³\Ü\ÜVÂ»‘\è2¸§<±ú4|‡Ÿñ\É\ß\Ïñ§WŸ¦ª¨«î«º\Þ\×\ä\Æþ¯‘‰\íÓbò{1Yk\Üm$O¡\Çm¾W¶\ß\Ð`x\â+`F\ÅyÑ¬B,B(\Év\Ù H–¦‰j9r’·¸1c\ÎY‰®‹\Än\É\Âìºƒ\Å\rŠ;³\ßL²\ÑRE}¦[¶û‚|C\ïù\Ðn\è\íþM/+¾—y+\Ï2E\ëcqN%d±´¾y¶ø¶ƒoqK,±rÀ‡‰òcYX\Ð¹XŽ@r–©ŽT\Ç.C— ŠÉ‹&9s¹Ž\\Æ¢ÑŽ\\ÅG-\ÙKr	-`|\Ã\Ä>s\È\r\àŠnùžóc\ÆKã°\áˆx»qÑ†\àd¸f\ëRFTü?(\Ä\à3üg­n‘\áö3w‘\Çd8‘Šp‚¸tW¥3\Ùül\Ö-¦\Ã\Æ7CŠ\Ì~lØ„P¡|X&À²c’1`…‚‹\"À°,Á\rX}¼B‘ô;$†T¸\Ü\æ÷\Ñ\ê.*\Âù\ê\r\ï\Ø¾[jÐ‡ýë°8¬w\á\ê©JIoML7 \Ü}•qŽ<\Û\')\"”%ù.žöý\Â\ëaø\é1\Û/:™\Ùf\Ü\"\Ü\".@…¢E‚<\áË—e’\ì°4¸°,²B\É››˜Y¸\Ðh4÷<De|\Âøúœca¦t\Är?£\ä\\ ´l[œnœ±Ü‹\é\ï\áó­?„\Þ\r¿\Ì\"²¥¡[¾)†Nó\Û€7e\r`b°W\ÄlM€‰6@\"¸Es@\"ùx…ñ|‚Ë‹\çfñ\Ä/¿\äû§¼²ý—ˆs‚\æag/¡®†/ù\Ã1ca¼¯\Õ\Ô$\Z±Ì¢\r\Â\é ½€³\æòè±˜A\çÛº[(›\èk\á\èÒ¿X™Düþ\å\ã¸\ä}ý\æ\ÈýVcjâŸ¯=·¸w\í\Èn\ß,\Î+Ð‘<ª=Š?¸\\-(hs\ážBÁp„\î£÷,±ƒœlC\Õª_x\Â/Ïœ4ª\Øñ‚|zœ±\\1\ë\Â\Ù[t¹S{.óø„-Æ‡|?q!e	£Õœ¶¢7\Ï[pþ\Ù<\Æú»«Žs\ÑØ™’\Ç/¼’Bb*I)\É&>\ÒÛ1º\Ýü>n§ôCd‹\ÈJ³~úA‹<Ány\çK¸A\În-X2e¸\Ì1´¦z¯pýd7úŠ*õ5¸žÞ™wÈ£\Ô\Ö\àA£ÿ\0œ.£\×>ƒ\Ü[¨\Ì_*Yž\æ ùyûw\è³\Ï\ã\×Yœ¯0Š+Žts\æ9Ð³\á\Ï•°J‰\í\Å\äFI¿­\â–\Êzp‚/7ùÁ3y\ÕñŸUØº\Ø\ßP«Ê³=÷Ž²Žø¡g	\ßøù\Ägò¦ùTJ‚\è<Í¢½S\ÝHOK\ÉJ\ÈELeSŽ3’Lq\ß\Ûm–s\Ð\ï\Ã\Öh\Ùú=\\í´Ž\Õõ¹²¼Œ4\Â\ã¢!º\è\Ì.QL÷v\ã¹7™\ÌþG<¼Û—Æ³\é„\Z~ù]\æœf,†c?\ÎI‰\ÃÀ\ß\äk\Ös™7+\\™\Î8^7\Î$Eœ\åôR•÷“Ï…Ÿy\Ï%l²MQ‘Ì›®Žy›È¾˜˜\ÎCÌŠ@Ö’œ1=”h‹<A\æ+œG±÷\Å\äs›\Ñ\Û\Å3¶\Øu\'>7m\Ä\ä’64\ê†+ö\æa‘ó¾G¦\ÌGš\ßXhˆ\Ì~#\âu\Ö	c½E\î\ë$$%^ô—‡HA`{Ÿ#8¶k¶.=a\Þ °ˆ\Ù\Ù	e™\í]\àM~¸õ\çC9B!n”s\è¼\ÙÜ‚)ñÃ…ÑŒ\Ç$B:#½€\Í{C\Êù(¾¾\\s¡g\Ö“\á/:\'Ÿ8p¶FË˜y= øŽ ¹\í\Åð\Ï`r‰U¿ñ{8²}.Èš\ß\à‚ò\Û;ŸÁ…]D¤9\ÜC9\ç\Ò\Å|—^}*zuUIŸôb-žÅ·/­ßˆý\à°G8\É`›\ärPH8_0\éÿ\0ô=·\ÉRAò\Ù.\ê¢jÛ¢¼>\ÙGˆ|»\Ý\0Pm\×Øª‰\ÜLAò!S!a¸\Ñ\Z¹u\Äk\à‹€³$ø\ÐOŒI> ññj²Š1\Þ8;s\â±\è#ûr=póŽY,;\È\É0b@<À\nôv(Ù‹\Äp\èõ\ä°<rúŸp}¤‡Š\ÂUBùýñ\É\ÂR}œüGî—·3™ÿ\0GsË·^7c`ýsr\"\â¿j\á?µ½dùšK\èœn\ÄIo?Ž\"·W\Ø\ÂK¬<9\0·V»^ø#»{•	$\\\Ö@\Ð×¨F¸¨@÷F¡¨ó\Ð_\ÖIH\Ühó‹W‹\Ôbº\â5%½;„\"Ï©¸u\Ïÿ\0&‚=Mb÷ wk\ÈÁJÇ®$PAa=‚\ÂÅ \ï	C\å\Ö&û\ÇfdPô¬\ê\rfNô\Å\Ò\Ï\Ä\\!K¶»·{\îƒñVùVü=\Ö\Æaý¯\ê\rc\Ó \Ìcñ\È×™–oœ\äo\ÐmŠ;›\Õ\î\àJC\ÉuŸ\Î`hu_¸\Z@\çûƒ\ë\ÛW\Õa‡-Š\æþ\àC¬…¸Åµ\Ô<\í ¶7ax?&u†¨Ï¡Ë„\ß[—ŽŠg¹\Û\Ä\æq\í\ÚoŽ@\Ìu§º\â¨õ³“\Þ\Æú\à\Ì\"\Ý\í\ïT;Mº‹3\ÜmÀÛ’À÷Š8Œx¿0b\Ø\Ä\n\Â¾y„®`û§!›l†\ÎJoŽ\î\âX\ÔfŠü<ˆ\ÌóÃˆ\Äa\Ô~Âž°a&gsß¶n\È\äDò¤/£\"…€÷\È,\á‹wÃ©Î¨fLlž\Ê\È>Ê·k`vw:{d¼ƒ™()\ët[±¹¹W\\«\ìþUŽ3\Ü\Ù™wSœ\Ç÷BÀÃˆaú†q\í\×Eh\\d‘~L\ë%‰¾Q˜\ã…\ÇR\ÝI\Ã/žloNn7$\ß.ž°ˆ®‘r¦-\Û\í#?’Ó»d\Ã?\ë3©›1|\ê\Þlžb¾žº°3ž¨\ÏM\n»\Ì%õ\Ð\ë3qŽo—Ùƒj’–\ë+6\ë;dq§\ÇÕ¦jý}·Ý†yñ|5\"W}w\î™‡\Üh|\áŸX¸\ãt1¿·\î8\â+o\\I7%Ä¼…\Ä\Ä„m·/ò¶p=(c÷czI°Œ÷KŽ€W¤œ\Ýr\èK bp2\ÌE@ÿ\0€°û/:{\ÚùF{M²\Ðû:·¥ŒY‡¸¯#¿§W™³!\ä\ä¨y\Ë1¾²\Ñ7\àpÿ\0·	\"}=e\Èñ½ð‹†\Þ#ó…\Òûs\Ã ómúzý›<Ž\ÇnNDª\Ý0œ\Å:d\Þ\rˆ’\Û|\Õ±y(:]Å€N}É°\Ö\èd8c“£·±Qø\äl\Æ\íÀ`\è\ì\×Y\ÙD\Ó,’\áˆü\Öë‘¡9….þ\r¦ü>•\Âzoƒ8=°A\r\äAcžw\ì\ï‚\Øz­€²‚ž0ó#°Œ\ÆR\ás’} ¸Zø\å\×	1pb1È¯;còf€[\Å?\Ë\Ù\ÉXù\ÖHY ·… ™?°9|zT#‡møý‡˜ý« \Åc\×°cß‰Ç‰e¶°\Ûu!ò+‘2p,pò­½\é¾\ÄDœ§\"–\áAÏ¯1µkú\êl\Ô_\ì\×\ÃR\ã¯8£^oƒq+¿\È8Š\Æö­G\nf‡’\Ñ’[ @<ŠEjGš\ß5¢ˆ-Ž’\ãöñpe¢ðz˜üñÈ¡\ÆÀoôDúÑœ`9;‘1\ËWó‘\ï®|_±\'?<<Š\æxÅºf6\r\â\ã©\Æ-\åvÛ§¥\ìcq¸|óyp\æ\ëÀ\ãq.\ÝN—>{ð\Â3¤þ\à8\Ã\Õò™cú>¥%\Þ\â¨ò0ñ¨j\Z/òA\0Ž¨9}~kš\ìuAv\rh²EF‚1D\Ü=b9]hv6:ŸÉ’\î‘e|,\Är$b$¢¤ª\á\0Œ\àFT3^øg\ß`r‹þJ\È	&Va¾¨\ï•Ãºp\æ,i‹t\î:ñh\ÜSž\Ï:nˆRc>\ÖF\ÜQ‘\ã›c\éS½Bù(\é#?N\\\"¸\çÜŽt_ÀY’\Ú.‰$w¤€Ž\îBû%ù\Ø=\Ï\nýk‘\Ð-\Ì	,]¹£û@#Á†H\î¿`_òy\Þ]tŒ<|\'Œf\Þ|f\Ø\åMñ\\\×œ\ç†aúŒ?av\Ñ\Îkž6lƒ6\ß\r\ÈñÆ™~:p\'›\ïÆ‹\ä:Xd/¼Bÿ\0“É¼bøY~\Î\\\Ç.ao\n¿[ø3ñ3\î\Äò1¾,’CÎ’c`<\î\Z\êBøô›\æ´Kp´]€Š_$<$Ü´°=STRœqy\ã\ï\"aq0½ös\Èþ\Ü\Ü-«Ê¯›\Ï?\èOnùy‡QW{\ïŒS¼\Ûÿ\0þý‹y\ì\Ð\ï ŠöÇ“ü›\Ç\"b\Ã{\Ö,»\Þ÷+Þ³›>ô~¾6·.w;@Lü’w\à{\ä.”¢¬\Íc\Â\ÈH-|,\Å\Ê!n\å—ùI./•\ëÿ\0%¥|—‹\ß9…üÔŠp†m³G!\êH·%ñ¾–q¯\Û\Û?ðþ¨b*R©<‘`‹_‡C¼—	/ó¾ð¢€E•’ôW\ÔI\Îr\ãnþQh\Ø%\Ç h/\Zû‘&op²\áßžS_5¾œ£UG61ƒ\Ïaù—<#W¿Ú·r\È_Eh«\á\ãœ’\àYp²þr\âHgnf\ÛcŽi%Gº’a\n\Óƒø~öÁ¯?µ{Ø¼~F\ÓnG\ÊÃ˜²}…\Þ\Ñš«/\ç,» úÁK\Ê\Z\Z\Ý|Žc\Åc\â£VnÁ\nd\×36“šš3£\×[s›…²?\Ö\"õ¬\èô*Fömÿ\0®b\Ûy˜¸b\ï	›7¬\Ù/¨ýOa.½\ç|\ÂL’\çqw½_\æ\ìü\×\ßfv÷\äQ\é\ÖŒ¯xþ i¦½Nm<‹iŸ<Œi/?X7úIx‘_\ç|5n÷Žä§“1+`l§Ÿ\'NF\Þ\ÓÌ¿öH\Þ\Ë<©¹¬\Ï(ne-\Ä\Æq¡-Ÿ·7p9›w÷\Ð_*\\\ç[¸\Åw7feœ.É›\á\Ïy\×Á.\r9e\Ã\Ï\é\åû\Þw{\ß\Â\ÞLnƒÁ¢\ï8‡d:Û—¬¡þ#\Ö>MS\ØLüW$GÆz=\ÈwŸŸ0c˜1~ÀYq&¸\ÉW¾o<\áŠNz[q› ŽöuÝµûHr_w=Žõ-Ÿ\êOo÷R!\Æoe\Ö\ã7]\íÀòwk®}—\ÚI-šûl¾bó\Ühü‘™etŒ’\çs]¥ý:(.\\_¾|/¾.$WóžwþILrúo6G.¶\Í\í~bñþ‰\Æ`¸‡\Äw\Ò9¼¦\Þfø¯#•#\âG½\0Kü\Í\â\ì\Ä/\ØW¾$\Ø\ß¯n–a›þ³6ØŒ[1—y\Ñ\Þøb½/cûs\'½\È95p²;ð\Ëps zI‡^K\é·‰[\Ìqý¸gŠ\Ê\Èf\"A``ùk¾/‹\áe\ÂË‰\'\ÞK\Å\Â\Èhµ²ù“zb{nc\ß#Ñ·O\éÂ¶ø–\ã\Å:˜\Ã3e£\Þ¡û\Æ\r‘/ò¾/‹þrÁo‹\á\æb\ÝsÝ®ž\Øg\án7)\ä\Öd(š;r\Ý[n,°qþ3p3\rˆ\Å\Öôu1*6Ç¤,?®Š,‰\0HXø–\\\"¸\ç‚Ò–<A\â\á\âö;_ˆÕyŽ™ö¹M\Ü\Ê\Ìþ&\ÙÂV\ê§\Åd’Ig7ùž\Ãsò\'?.ds#™Áö\êA[‘l&Ž|±Á\Ç8U8\à´TužE¸8¤/#\ØÅ‘Î\åô%\ã\×\n¯óYšÏ‡:9ó/|s/\ä­\Ú\ã¿#­÷Oûb{a€|Q“µ™8\ÝLy,or\Ö\\^ kü‰•ñÎ„W®\r\ÈYñ ?q\ß\Îž®\à‘\\&h»ò?ª\Ü\È@\Ç.\ä9\ê·ÁÎ…rN`½W@«\í<AÃž!Î…Ÿ|\Ö_\æ²\áKg2t\ß\ÒÏ¶33ø·UiG\î’\Ý\Ë.\rcÐ–=/\æ\"¸\ç|©Sž\ÌM¸‚\È\ÂO¯\Z+“\à”¬z¶e\0\Ég™&>ùa‚\ã˜\\ˆ\å[Þ“\Ü\Ü^ÿ\0\Ëx~¬ò¨…Á¾njË½\'i\Ç,\Éÿ\0‘|\×¾Wû/Ž`\Ç29\Ï\æ}=\ã%—oq™™ü[«\Ür—¸’«…¼F¿œNE—®ñJ>°ŽU9`LdK¿‘Œ\È\Ð@#›Ç \'÷ý‚BK>\È%Võ¹…Ç­È H\æ/\Ð[µ>lÿ\0{¿Yo]pü‰ðý\ã0\Ýlo|yŽý\ÝM\×8\Ù\Ã\\4}ó?¡\ÙÌ…—‹±8º\Ç\Z>\Éþ/º¸µY¦\Ý.­J$·„\×ùÿ\0+\á\ä<S\ëÂœpÈ³Î£?cICõ{¶ò¨\Éo|†F#r³\æ,\æñ\ã÷Lpw‘ÇW#n¸õ¶×¿x°n?\Ãyüy‰Œ\ãA\r¾\Òo$z\ç\Ûx9Ÿ\ß\ì_1F\nT—ö-\ä‡=}Wù£\Ý\Ìy=b-\á6\ãÉ‹¼\Â÷5\êú…—ù\Þ1|\"¸\æL7pºÁ\êcsl(\Ü\é\äze\ÌŒ+g¦­\Ó\Ö`þ67¥ü½ðG¤ÁV\é·0bŽI°[ ¸y±ûÁ\êP9\î\Ëä£º&Ÿ|ôL\ÜÄ—E\Ö\Ì:^˜Aó§<aÿ\0ˆ9„¬\Æ\É\àù~;¶\æ\áx\äù‹‡‹Žd#Üs©<‘\æ1\0\Ã\Æþ1Öž)IÀI.Ü–\íEš+…¾Ž\çaß¸ÑŽØˆö2Nö•µ–{e»Hž\\ckX\Ûö¢¶+‹®\Í\æ\r‡‘\Ì\íþ>ù\äv \â°\ä$  £=˜añC$^BpI`\í\å\Ù7½\íc08\ãx4¹\â\á\â\áo\r\â‹\Æ:\Û÷9¦ò|g\"€‹\Ëñœû›Àr¢r/¿`\"¸M÷b\Ìy\àŽ8\Ýpónº2xp(»$’«%\Ü1[÷Š(þ\é\\~ñ!ûÀ\ÂÙ¼ˆ‘\É$‰%ï…˜qZŒj\"Ç‘wº\\<} Yqx…\â\ë\Ã\Ï7A‘v¥m¨Ù¿uÏ²\Î\ç#V_˜;\ãœ\àMðEðE›/¢°xx\ÇCv\Ü\Ð%¥,³@<\Ü\äh\ÑþF`?\È\íf7ƒ7¼ò\È B‰®#X’n÷‹‡O´|ù\Ñx\Â+„<=m½\Ñ\Þ3?Ôš+¥\Ô\ÖÍ»\Ø}\ÅYpNG3ù‘•ó™¾\Ô4_\ä\É’+_#|<c ’Šò]\ÅH $p! c1¢\ÑR:£!¤lÀ‡\Ä\ä¸Û€\Î\nÀú\â\á\ã\àñ÷\Íe\Ç0A\Â+r:K\"–\Ø]ˆ\Ø\í·ø\æó\ì\î+¾û{¸˜^U·YZË¯ù¯•\äW\ß|}òfû@Š\ã—0¬Py\Ýpón\à-·-\Çø\á¸ÿ\0·@ÿ\0d7ð\ëž:\Ý\0ŠPñpñð‘}óYp²\âøEÀDÿ\07\Û\Çc\Ù\Ö\Û\ã\ßp¬B·[Œ¹…üF\ä3\\F/¨G½š\áš\áŸx°@X¹_É²,%\Øñq$ø<\\<\\,¸%õô	wC1¾:U‰ôNþ=\×ó{‹I!`-¨5üæ‹ˆ\Å\ÂKüÙ®#W\Ð3\\\"¿bË·,\\‡ºC˜ ·rË‰%õ>.pa§v4\ß\Î\ØZOd¾=\×\Ú\é ¤\Â’+R\Ð2q¡3p¸ €f¸f¸Eq|<\\s£œ\Ç:9Á\Î‹‰\'Á\âþJË‡o‚\Ï\Å\á\Z\ãÎŽù:Æ€\é*m)\îž>:¥}_\ï„\éo’\×Ä‘j—.¢\ÌÞ–±¯H3}òEðEðFT#*J\ßJT¬=Xz°õ`´\ç\ÍiP³\ã\\<|.\\p\è#D/\Ì4?—K¿r\Äú`\ëªN“ø\ç\ÝÃ®3è»¦žŒñ\\¢/¦5¼/‘“\ÎôV°Ê†r\Ä\ËeB3ƒ\×G\î#\nÊV ´ õ1\ê\äòV“0´™…¥´7’\Ú’ –¾³3¼´C\Z†¦~B?y³q‡I}Ž~\æLz\ÛS#/\æn3·xo\ÜÏ«—ª½õ\Ù-‚9_´\"\È»¤0÷½o\nN5\Êe2£\ÕªT\nÊTJõRª=T-8N|––\âÿ\0b\"51\È\Äj\Z»e_x÷ÿ\0H»;¸95ö\Üû\Ã\à=Da\ÕRtŸ\Æ2\Ü\Ã\Û\Ük\î—÷%\ê·ˆ9\ÌwS§,=·K=Km,†\Òîš¨j$Pòdó¹r\Z\Ð]°•p=Pz©U1\ê\ÃÕ‚Ò¦=XÇ«ZvÀy‘X©|#\Í.>}ŒÐ¾´³\Z†Ü¬|n\ØEH2Gª&-ó›\à_8b¶\Æ\îjðr_oÿ\0¼[Ó³Ý¬\Ý]»\Þ\Ü\â\ÛÉ¼ûq°8Yx\æýM\æû…•HJ=\é½ò\ÝWmR\ä†\Ö\ïKÍ·\ç\ÉqÉŒnad>K1\"\ÂÌ¬\\X!\ä­\Ì}\Í\ïV1\ê†=lÇ«\Ô=Z ´©\î/HE¹4 A&¸‡Š° \rv\ì™\áø\ä†a0ªú­º›ÿ\0\ÞyT;\ÞEl?9%™ô=÷\Ýn‰w¦¨öo«Ý²ø™\Ô}Mõq³)\â\Ýau«º=Ofó†yT©>G¦5ù.«v\ÏÀ\Ùù\×OC?\äž‚ƒ‘²d@,\Ä,\ÄX0¨,À\Â\Ñ&‰0³±+ÖŒj?ÊŠW²ù\"É›\Õ¤cŠûv(\ãx\ä†`²†ÝŠ)/\ço\Ì\á\ÅmºÏ¯O¢½ñ9 €\ÌGKe\î\ÇI»™Ð·\Ü\Ç`º\ë„22?ˆn\ämö\ÒcQý\är¦û¼ò™ù‰\ÛÁ\ã\ï;$}\çl;\îG¨>ŸÝ·4Hˆ“£‡ª®ˆ¶ÿ\0x¢÷7i2ý«žY\0²5HYBÌE˜˜Y\Íh ¬I ˆ#CÒˆzqXE±0\Íô7‡HN<h\ÇÒ‘U{\ë˜\ë\Zo\Úfe\ç£\ä~xŽ]\Ã\0\Ï#ó°\ÝÂš\Æ_}º~ûù\\\Ö-•\âù\Ì1‘‘ü(ˆ\ê<ótv\Ók#·«\ï›\Ñ>Ö\Ïû\å\ïöà¥º½D\îžñ\Í\ÏenWE\ä­ðñ÷œ\í~DI/°\Èýpº\Ï[g;§gu\Òþ¾0\Ûý\Ó.q±óÁd,9n\Ë$C\ä³oš\Ñ\áh«\ãÒ¬D…d…’±¡¨E\â\Ç6²`\Ã87\Îg_ Œ”®ƒ\î˜ò;>“9\n+üÙ¯|_ó£eleF\Ìu/¼[\ç§?ùõe·\ÇÓ—\Þ×¡\ÝùS™LGÁ”2I.§~\ê}-ô\âÓ¨¾gUÛ¦\çq·\Û3Ï¤0”¾2©ddø–œ+\Ë=@_pø=C\Îx‹v##|ß›û!\ï¿ïŽ•¡\Þó\ÉT`‹ò¯U)\r\Ò\Ú\\_q£z\èCZb*B)\å“¹ŽXrÁo\n\È!ó\å\Ìr\æ9a`‚& 1l:c*y\ìv?·\ì¹\"œZy\â_ºN’\Ï>püÕ™¢‡\"ñù\á\Æk„W¾ý¯ \Ï+DlGX½@\ìT—Mÿ\0ò\ÞLq\ßM¿pþ’:©ˆ22ø\Ôrr1ÐŒ÷\îÑ¾\×\'½\ß~\\:!ŸRrÎ¦z‹¢c>ç–“Ê´B—ª»Yó„\ç¤-ò³~øY\ÖI>°>¸62­?\Ü\Çó¨\ÏC}”“†h,K§\Øõq/*Rý\áÛ¨\Ïv¶#p6rfÀ$u.\\\ÂÝ–H.,\'\Ùbù\"Ž‡´»g\Ëb»sŒ`\ë!\ëfytŸ}ò‘þ¢O\æ7\r\ï#\Ö\Ä\ç<½H‘¾@%¨¾]Æ¬\ß8\Åñ1\Ì Œc\çœÛ˜¹bO?sþ®ö)œ>þ»M“×´[ù²»ùU5RŠ\Èrwˆ\ß»·LP7{\ïm\Ô\ÖgV\åõ?¹{†¬\Æ~»\ã’\Ì.´”\ãžrJp\Ð¿<¬2·#]\Â\ì\ï¸@,„xU~Ekþk7Ü‹9%\Ü°2O\èþ\Ø;«û{:o\Î\åXLCÿ\0$.!|;FÁË±\'rv—\Ïczœ\è› \Û\'« \á\Î\\\Ç,ð¬‡m€Í‰¾_czI|\Zc\Ðq¯¸\È\Þ<6\ìO%|\à<^ø“CC‘^À\Ýù[½TJ\ßJ¥\Ç\Étoù\ß\Éú\è ò+ù-þ±y\æK¸bñir\å\ÄnG \ÄC\ç7\Æ1¸2x„\×M{þ°¶°ºiû\Ït‰¾\á“\ÖRlÿ\0\nñ\ËH\æû\Õ÷J\è·eZ\ï‡\ßcy2:·s©\Ý\Ú\ÝY·™¼€’œ˜\\=•°Œ“\Ó@\"$ŸX«\Ñóò‘Š˜\ÅXE\äT‚Ë \Ý–z…—œ>Ø‡¾x\Ê\Ö\ç‘\é/\"ý¹»_l\Í\Û,§j±9R²\Í}H¼ƒ\îy\ç¿ .	\è(ù\Æ}Hô?*3(Á\ä¬v­\á[ºÆ£Á\çó‰\éÀcAº\Ì/!8òI„|Tdô¯1ç‡ˆr\è\Ì.2G\ÞNû\Îm\ê‰÷œ‡ž‚\"øEódG0\Ø~¢\Ê/¬~Š>xg\ç‰&<ò1«‹-\ÐG˜¾‹5\ì\É\Æ÷‘•°œ³°]{õ1\ÓQl_ü…2S§d>\æ}\ïÑ§]\n§\ïJŠ\ÌgýF\ìÖ–y÷u\é#§7û\æ³j¶\â}æº«\Ì\ÝÎ©÷wuŽK*4D\ÆT\Ø<œqg\×/¢¶T\á\0´\ã„ZZ=tQ;\ë\"½õ `ù\ç%o#~øþ\à¸\ç¤®8]i%\ìG\'NòË·³$M\ß-0ƒu‘\Û\Õ\Û\ã™\ïÚ§vý`y>gûDZ.\ácþ!ó’¨’\å.Ë˜C{6\'\Ü\Ý\Ú\Øüƒl¤–@Y0²o\Ï\ìNa¼S\'\Ó\Ö³°\ï;§§9çˆ±o\Ï0•ò^/\Ì	ù\ì#0µõ²§öoc\Û\ã©]{;C\å\Ì[\ÏGùÈŽzÀ¼aþ_@\"½…‘ñO!a\ë7\ÖEð\ÔF¾¾‹7\Ñö‘œpae\ï£‘¸]\äŒt\ë÷ \ê¦ù.œÿ\0\ä\r‚\Í7\Ù§v¨\Øc##öé¢º\Ï|:\ßé§\Ôw‹\ïg™<»×Q;Ä«\Í\Ì$\Æ\æ\É>3pN7@/9 ¸Zr=\0ñk\ág\r\ÂË·3DÛ®ñn]y‡œ\Ç8.>º·\É\0·.¸d¿.]»€·0\ÅoU\æv…õcX·½b=\0·\È,ú=Ç‘‡’\Ò-\çDùÿ\0¥w÷&5úò(¾\Ñ_÷\Ã\Ä/’¨–°2¾Œû\ãu6\æ1\Þ^žd0\å¬_\"6¥£v\Þ\í\æ\ÙaûcŽ,…”r©U\×4X·ŠFuÿ\0\Î}õð¸˜]½™%¹Õ¦\ÍòR\Â;¨·<·R\ï\r\Â[\Ï]`–\å‡\ê/1ýkþM\áô7\Ð§]š>B\Ì\ß7¾ù ý\Â!œ«{\È\Êù\ÈÊ…Ÿ\ØY”¯\ÎX¬£9€\Üy§›+÷˜\ëke\Ëc¿\ä³\ÙM—\êï¦ž¡Rªš©>\Ý\ëû\Üôç…—Psî¦·¶‰-\Í\æyž\ß2›\ál¤‰e§J÷\î²\\-9}W“¤º,\ÜHŽAVp\Ý^y¼ò²c ‰ÿ\0p\ZH ‹>b\rUnº+J\Ã\Þfú=–}\ä£ç‡¬o¼—B\È[˜bŠÞž\à*¿“\ZÇ¡\çfl-\Ñ\Æcÿ\0õ\ïC{}–9}“\'\ZŽ}\0“ƒ¼·žJ¢@}=K‰\è“\æ8\Ýò=xuÁ\Óþ\Öo÷K¹\Ôe3ƒˆt ¯«#\å\Älx¤f	…\ïœ\Êú\"ñq<ûUR²ŽJvQ\Ü\'Æ¸\Ü)fã¨¹^{s‘ó\Íd5\ÈrÁd? Šÿ\04Wn]\×\Ç1}~xY\0‹\ëz©.wü–k„Wòy\à\Íóqô$–”n=S\ÉAñ\"!\ç,}\"‚\Ø\Þq!¯I_zÎ¦v~ñýo\Ëh\Ù(Ù–‚c?pº\È\ä|ò\Ï_¹ae¥o‹\íôzúû3}aoUoeg\ÞJ2¿4__¾xª\Õx¹ «\Å\ÜY\ç£Øˆ\Ö?¬ZU\Å\è\ÙX÷\ë,¾?u\á\Â+\ØfŠ\íù7‹¸½a½•\Ûù,üžY\Úö.\àdhy\n\äw¶—¤]\ÆôI±\ÈÛ¸FõôP=B+\é\Ùü•‚È…\Ð!’1%\×û\Õ}\Îñþ”1¼\Ãl·…ò\Ð?\å9´Ý³x6#*[q¡\×\Æ\àQ]q19|H\Êüž>òf¶Å„^ÿ\0Oš¾²\Ï<•ó·	U[—ç·™X•øýú\×Û‹þMûñ\ÓÞ²bÃ€²U,#ú{\Ï>a˜Y\0.¸\\Û£a\Å\ïUõð\Íóu\Â\Þ@YÇ’\Ív\ë£\ê¶\Ë\ßY¶\ìVõC]¥\ê“xöqñ}\ï:\ì-¯y7`,÷‘Eš¦Y¸Y{+<•ó‘ž K¬^¡\Î<}a±È¢\Íxô	e¼˜\ÙSº¾Zõ½W‘ó‡\Ë,ùº,w\Â\Õ7@*¼zã‘|†\ë\åa\ÛòrR®f\Ï\ÈfŠ\í\Â¿9”ó¡º\'\È\ÜA\Ì\ìGan•·\×1\\rRú\r/©ö®wý\Íú\à\Åú-\Ù=\È\Ïó\â\Ï?qdL\ä·(|KeS+²\ß\Ü\Ó(Ú½Â’\æ­2¸v¿\ÊE÷›˜JòF‹\ï\é½_\É\Ü\Þv\äJ\ØA\äSv+nC\ïUÍ¯•\ÔW0Š÷\Â\È7A\â?Evþwg.ó\Çòy\ï)o=G\Ð[ù,\Ø\ß«\ØòöQ]º\çúpn[ ²\Ò\r\Ã5\Â<À¼\à_8¾Œ;ÿ\0%g\Î\ÜmùdP\çž-\ê¬±8@\"ƒ…\Ã6\îo,¿<\æ±põ[\ÈVõðŠ¢½‡‹!an»;³ò\Ë\êlý?K\Í\×²°Š(8ðý9#ú…\Â(ŸXZ5w+IL1¾´’üñ­ú\æo4ô~’\å}+}ö~Y\Ä—G9ý‰,VúQµ|\ÂK|\Õ\ì[»sw\Û<\'¶¯©º~\çoöSŽä…•l¾H\Ër\"°\Òÿ\0·\â–e+\éK}–þ\ãñýT\í\ì÷0Á\äš\á\ã\îEo¬ó\è=úS¼œññ‘‹‡Åº›\Åb?\\k¡È£|û\\3_õ‹\"\à-Ë®^Àþ¸Xoy ?N+\á\Üjñ`3}|#\ÌrlØ‹÷ú­ú‰PÍ‹Mý=”|ô^._ôl\ßs¡b&+z­ö|\Âüš+‡üõôy\ë\ë\"¼‚s\ÄZ@…÷Y¯È‹üò\Ìù…Ö°\ä3b]\Â\è\É/`@±õÅ–C\Éô¨û\Ë1¾,H µÿ\09\Ü.²\Þ@w\ä9…\ÖYp‹\îy\ã\ÅÛ\Ô> \ÝQ]»\æs\ßg\Ê8\Åw;Zú\Ý7\å^”ólr>z\"ö%‚A¢\ÖÅŽ\Ïù:ý\Îj;\é\íû:Œo\Ý_t‚\Íz û<u£Õ§BOôi.yT|\Ú+J\Ù[	\ß\r\È\Øì«¤n«ðþ»zQ”_TV\\\æ\Þ/ô‡«ù3¾SËœ«\Ì\Èu™)\é[\Zóô&»‹\çüŸ\ä³\Ü.\Z>¾p\Ýo„X\ØEš? ª\È|‘\æY\'\Î_ó¤˜ò+$¿ª³Zûˆy\Ü\Íš/¬\ÉXó¬\Þa~ú\Èó(\Óÿ\0&5÷\äs\Ë,\Ý\0º\Í\×\n¸°\Î5ð¼\áY¡}eòo¸A\î‘\æ\Â+¸AdWA\â<\Â\á\×ôq¬\\1E\0«\ç\Úy½\ß\Ô b\á\0¨ •ò^>n¸’œrø3A„S4°¯|,½…¦ô¤O\É\äo—BKfr?\Üx®\Ò>¾·L™ª\â¸Ô¯“\Zû@ŠúX\ëÛ«|¢Þ˜ú…\Ü\Ý\Î\ÝÎ¨zWÏ°÷¢y¾,\Å\æUŸ\ír\Ì\ÙõÝ¼$\ë&ûIu\ä¯Pn^¡öyyœ¦ò?ñ¼\ê¿ Ú½ÿ\0ÍþüñÈ‰-E\ïÊ©5õZþD÷2T\\k÷–±²þr?X}tQòVþ\Þ>‚ß§²ªöG—½\Þ\ä,ò\îù\Â+¸Au‚>xføØ»ú\ë_p‚\Ë=\×¯¢Š÷\Ù\ßn} ‚Ë¾°}`¯¸]Ÿ<\às¢\êüo\nø\äW\\,ƒ„ù®»‚G\Õ[ 9\ï%¬Š\âÿ\0>\Î\Ç\"ô\ë¯\ÉÅ±–Ÿ\ÛÛ¢ñõõ‘•¾¡ª\Ë}‹·¼Œ© ]\Â\â\îZÍ„yˆõ\ÑGû¨ú\ë}tQCžhóô+e(_[¢)\Ï\\Ù­¤•°·L™Sx©\ÜVWTa\ßn4E•WŠ\Ï\ßË¬6ý^õÖ†\Û)\Êv—|7ƒ:\Ì\Üô\ï&\ØeûY\ÓóÜ«\ÈÑ’C•i²Rûß·Kõ€\È\ïo\ÛW(¼+¦=\Ûÿ\0;lv‚`¼•ü9Üº2l¹\Èü;ô:ü\Ê[\ä{\îñp²\í\ì³ó\Â\ÈyI!`-õ–ò;/\Ó|ôV\æZõôY®÷’Ï˜]%\ã\ì¢ú>\Ë\Å\ìzú(¾¾ŠË·\\Fù\ã\èyÅ—‹ù/òy\ë/\"‰/gUõYÃ‹,\×p¸{õ¯\ê‹\Çö\Î`}Mvü\â\Ì<\çˆ8#\È,?¹\"RN1EÀ\Âhñû	dY°o\Î<o €Eôƒ\å–õ\0K\È®Š(_y18\Þ(Fúƒ¿®Ð¾BÀx¿“\ZúÀYöˆ\Ì!|d¨9]§\Û\Âr\Â\Ûlþ\Â\Û?8á‹½½•õX\Ø\Ú\Ó¸E}G\Ü÷¬¼{¢^•¶6+(\ÎW\ÝIY\È!¬\"\Ý4l¶\Ðt[µ{“»{ÔžT\Ï2g\ì\îLn\Ûül§÷\Û‹\é£vÿ\0nõ9\Ñfôÿ\0‚:\Ì\"½.FI\rx¿\"‹\Ä.Œ‰\ß[1A\Â\ëd¹Ý¬«÷¾\á}`¯3ú?\Å\Â+ö9d ²+_A\æ¨\\\"\Ü,F9\ÓAŒŽ=Š0Ò¾ª´k\ë!to¶\Â(_Ya$‡“út\×\Í`²\í\Å\ës9\Õø^\Ã6kX \åp¯\ÖYwö^!\ÏA÷\Öõ\ÇŸH }ú4_|\Ñ} k<{ú\É\ã^5iWKGf\ïƒ2¾‹Cpz¯\"^¡ø-!\Ï-&»x(\ÔX“‹>}$²\ÑúK>o\Î\"\Çõdq÷‘ýs\ÄP\ä^I!}nŒò?Û›ñ„/`m‹\á\Ó\ÞG\ê°ø\Ú\â1}B¯n—\Ý[©¢ë·­\í\Ù\Ç\à;}˜ùù\'\ÛO¥gMo—V\ÝSf=rn\Þ¶^¹·Ñ»qŽa*M\Ù\ïŽ\ê\È>g‘\Í\ê¶ß·‘\Ã\â|\ß#G¥|ÿ\0ü\Ó\Ó\Û\ÆöyË¾w1\ç‰üüŒu¥›¸„\Û\Û\Åù…™¡`_ó‘^ú?\Åe\ï¬Í¸GU\ÖG\ÈE/<,½ðŠöE\Å÷—› ³\É\ÆBK8pô™Á¸~´;D#\ä2ý}\î\"Š¬Y÷•Ì…»_ûj\'}H¡\Í=}}i\Î#ç¬ªö[˜]n\0ªþu\ç¢Š\î=Ig\ÅÉ¬»`§®]ºó\ß\Ûdýd’K\ÄnG1#sø÷Á\ç‡/\",\Â(j\áw¿§@3\å\ÐEi\Æ\ád?Ea³\à\îUº\Þ/}¥ŽD<c º+„ðœüs¸øƒ\æ\ï‘Û—\ÖMùW#1¾3¾yýÛº\Ëÿ\0Äž”6\Çý«õQ”Ç¾ˆÊ›¹\Í~\æ\Ù-\Ð_JX\Ú\èC\í\\?òV)òq¶U\'˜­}\rŸ\éû(\ê8ßŒ’)\è\ç#<\Ç`º3\Ü\ßñ&\ê\îQ1xò+‘^B3¾AnncŠ\Äu±‘\ÈDí´‹†\ìB\ßEmPE\ç\é\Ã5üï Š(YGú³‹\Þpƒ¿Ó Š(ç‚¹®÷7|=\Ã\áÝ¸F)½–HY[ùL×¾‹5\ì,·z+·÷“õ\Ñ\çœ¼ñ`r\î\È;ü·ß…\Ðp»\ËöýBè ºüš+„WòQ_õ‹..\Ü\Zñë¢²ðUôuÅˆû?·¾Ulq\Â\ïc®Pr‰3{EÍ°³9g3Œ\ÖA\Ã\è\Ö y\è­Ë±Cø¬»\ç†eÈ…˜„|…‹¿/Š¾¯C»\Å!•mŽ\ÜJ«œ&O1	^u›L‹‘i\Öÿ\0P®:\Ø\ëœP\êC#œ\ß/¶>\Õ\ã\èn¦\ënžsÔ“?K™Gy9\Æ#<}\ê»?1!*Ž\Ú\ì¶\çõ\'º½n\çJ[OŠ\ãœûO·,­\ì\'có\Ù<¨·WifJ»{3«·±žJ¸\Üm\Ãû„e^·Ôƒ·\×Ö¿È…—O­ú‡\Î\ÑúÈ|\å\Ü_!|Xofu\Í\äZB…‘Šó‘a`X-#y„þ\àºÈ¯ €g\Ì\Ò_\Ö,½öh¯adW¯}e—ó1ú‹ß¦ü%ýg%\ä\ê\ßDJøxVx\ã³út¯„Hì¢»‹\Ì\Ðq«6òI\É*‡Éšo¢’ò‘p¸Y¿œ´€\äP½Š\à¸ä‘ƒn\Å‡\ÞJ(XFûu\Ée\ãù;\îfÏ˜\\*úøý:\èÆ®\ÝrY\ï/ú<“úÎ‘W[\Ø\ìú?#i¶ò\Ãc2¯U€û«uE!´›„\á\Ì1\\f5Ÿ·c¸buE÷_\Ý}©\Û\Ì8ôv÷	A\Âûc’/}¦U\ÃÝ½‡\Æò\\«s\Ù\í‡\Ú?§¹Dd$\Ûx?\ì\ßn¹]7Sn:o•ý¸¶\á\Äò##|7\ãq[\â°ûIŠ¡Ž3ÜŒ\á\Æq›\Z\0üõ¬y\×\Ê\Ê\ÞB<½„Pq|\"¿<,W\è³òY}Z>V59™¯\äù\è~‚+\ØJ¸\\,úAp\\½\é%\ã\ï_n€E;ž¯ae›·¼ž·ò¿’hr!eÆ¦	w>€Eó…\Öý2\è}bû.FA™­\äóÁÛ ‹2¾Íš¿Yn‚+EXx\Í¬\Ø\È\"\Ñò/p€Š`ù¿Bñ\âö#¾º+/\ä#ôVB=»>E\Â\èóÄ¼j\È_\r>‹7ß¬Y\â\Ç0¶H…øÞˆgl\æ\Úò<–\Ò\æ1ò¬ö{q£ñTw›u&:Œ\ê\Åd%VÊ¶\æg\Ú]\ÃGû@t™•A €\Û\Ãn\Æ#j\åo†h\æ\Ø\Ïz9\í·M\Ý2mÿ\0\Ûk`³\Î\Ü¤÷³*\ÅcñÍ½\ÂWmþ7\è\Í÷í¾«±d<Ý‡c~5>«Š\ïGûT3}#¹™·Y™ø{¢\×¡g%ô“`¬£\ä|õ¾²\ß\Î@-ú‘ó\ÖY\ìE\0òžf\Í}B>Ó h˜¿ú\Ë\í\×Zû{+r\ï‘fƒu\ÑY{\Ç:ò’@\È\ÑA½›¿ä®»„Y–¦^\Â7\Ü ƒ7\Îõ’Y\Ñß‘¼ˆú\ï(X[½(\×J¾ ‚¬ü€²òÏ¹}\ä¬þú\Æ\Ç\ÕQ’Z\Â(¾nø<úÈ¾_0²\áß’\æG‘°ñoÐ¢Š\ã\ä»4WqzI{I k³\é§#ý¹žb\ÑM\åcv\ÞZCl²Mò\ÜþKjö÷\å\Ñ\Ù<V=º\ß}¿\é\'is\r\Ç\Ü\r\Ü\Ê\Þ/f\ë¼\Âb¹á„½qþ7ûKtk‹\çùW][dlõŠ¾Ž#û¢sovõƒ„1\\o#Ã·û\Õw›\Çû<¼«|q·sˆüûr6k\0p¹}\ï3ø\ÛGˆXr\ãë¬¯ë…Žye¹„?E\ã\ì£\ä%¥P²\à¼ôoù\Üðžb¯\ç:5%\âr:®]º\ë~Ÿ“\ç´\n¡\ç\"…ø\ß\ç<ú7Û ²\È7½ \ç|Õ—5Õ²vG÷6 \Íd<”P°Ìœ8½\Z\Æ\Ã;ö\ÞB×¬#ü˜\×\Ö<ÀK˜²Ž‹‡‹\Èsˆ®\âõŽyi\ç\Ñ\è3¿`<•°CŸE®x3Au\Ñf»{( H,Šÿ\0¬x\Å\ÃŠ\ÑY9.&<õ‘]\Ã\ä^ 0\ç\Ë\Åe[&¿\î<V7o*Íž0\á\æ6Ç‘Vû‘˜û\áe\\ö7\Ì3\Ï¿dr±\ìrD9‹\ßn®‡óŽ»·;\ïI\×4}#„¬\Þ+*\ê*ý\Æ\Í¯\\\Û\ÔX·[5Í¢œ¾’\Ø÷–±¨£\î¢\Ö!ýž\Ü-™Áñòû¢n\ÜvôõÞª\î,/‹\ßüñò¼Š_ \áp·ž®\ßO®Š\ÈXýüˆYq%|3}ä­ªeÇªù\ß]Wn¿b½÷\Ü‚\Þz?]eŠ\Â(¡}\ÖXýE{ž¾Š\Ë\È. \â\É \áÈ¸\ä‘A\Â\è“E|ñbø°\ÞòÜ»l\ÐoaO\\#\äI<\æk\ÉL/|,¿œ²\î/3\æ$_7¼\ï\ÈGù\Ï9p²”mÿ\0Ñ¼A\Ã\àŠ\â>ž»Ç‹þŽIóu\Ö@\Û\ÅeýNz¶\Íck„~ƒ4,-…‰/»Fcû«¬J‡›Z¯Gc’<ó\Þt÷µ{¿¹W\ÜK©œ#\ìõ\Ñ\ì–,H`L÷5¿\îM\È\æ25ö÷\ÛŽ\â+;ŒÛŒ\Ãzw§67±¯õgºo¿·$¿ÿ\0\Ì3mÛ\Øþš–•\È%O\ë<\ë÷\Ç\×\\}tA \â\Íûj¸±a˜\ßEï®°fƒ„IEX+÷\Ùß¾?P‚\ß\\3×œþ/;ó\ÂË…¾Š_E\ç\Ñf»w«\äWý&­\Â_Y/\ë?øHÿ\0F\Ï\ë%oöfŸ\Ñ‰˜G\ë/õ^wCV·õ‹}ÿ\0úm\ïûl\Òd#¿ß–ÿ\0fyõ£{\ä¿é¨÷–_\îõYWôrA_¥ÿ\0\Ó#ÿ\0MH}y\Ñ\Ðý¬\Å~³?\è\Òú\ØGûÿ\0^?þ\êÿ\0b™ÿ\0rwô\ã£ÿ\0w¾\èÿ\0þõ\Êÿ\0\í¿J_÷±‡ý¾\Ùÿ\04aÿ\0÷ƒ\íÿ\0ºMÿ\0©68nwûyÿ\0\Ös_ÿ\0Ì™\ê\Öÿ\0m_ú4{‘\ïú©}£Œþ±Qõ³\ßúô¾·ÿ\0\r§ôKw4úŒ¿\ÛY†]\ßû\æDo\ÔiõúÔ¿¢gõƒ\ß\èÿ\0ùˆÿ\0F|g‰ÿ\0gÿ\Ú\0?\0ÿ\0\Äüƒ„ÿ\0d\æœ\Òò\ç\ÖÊœ§û»•9\r\ÚTÁ\r|f¿\Þ>—–\å?\îº;‘k¹\Ó\Z¾\Ü\×\èÁ>\áó\ÖWû\ä\ëù)sùgXùW¸kiôš“^\'ûR½\Ü\ÞhüÎ—.4¯g3ž\ïn\Ï%eÄ¸º|JùI’¼\Ã,L\Â\r\çr¥ˆ¯„‘w#š-»/ûRˆ2n\Ð*Q®I:\é½W\én€ˆq¬b¨cjººº¿O‰_)6?%#!PsC³Jž©¼¿ºhp9\Å\r\ï+/-\Óo\ì»˜\é\Û\ÓO;œ\ã>\é\ì\Éu~¦\êýô,¬¤/òSk»³h5\Ç\Ù\Í9¶\ÈvõJ,\å3\Üt\æSæ¾¾\n‹–V\êl­\Òn®‰rúm\Z\Ô\Âo/\î&y:s\ÓCÛŸ\Ù\åšgS\n7¨Þ®¯\Õñ.,·WD¡Ó’4œ\Óy|\×O\í\ÍÆŒE1²k\Øf\Ò;h±—G\ÝR‰%Z6+FÎ·‰qe²²(t\äUPp4ŒS9<ó?· Õˆ§‡lÿ\0i§\ëSy™*\êý€A	¿c\Î3,IÀf\î\író`¹¼Çš¸ü³h_O`€NFs¹fO‹•\Ïå™±\íwö±ûn]F}¨\â4 3ü:<K‹ñvVA\Ç2s	\áp\ØGjŽK*ò+‚&S*‚±ŠÃ£Ä¸¿utÓ›\ä¹\ßo™\Â}\ã\çÚ\æŽ+\re=\ï3q5(ö+—\'œ\î\È\ê\"^Ÿj3“?¤	§#Ø®NNû^s¸™´ž\á\í\ÂR§¦~\Ñ%?™¤©ŠË¬\á\\(\Ö\È\èF´Œ•`¸£bâ‹†6.Ø­\ç¹[\Ïr\Â0U4Œ1‚¡Š7(Ü¬¬­U£oM¯Ï½7\í\Ü\\yœ¼\çA°\Z»E\îqú@*y=_\n²¡¼hDðBµŒ•\ã\ÅlWŠñ±^6+\Æ\Ä\'xÁ\Z\Ö0WŠQ\ä¯\å¹_\Ëv[\Æ\Åx\Ù\ÓIsù@ÿ\0˜:gU‡hóùG;|ª¥Š\â\\]3+!\í´`ªi#ž5(ÜŒ\ãÁ#Á}1à¬­–\ê\ê\ÊË…pª\Þ0R&6)ð@F\ç¹|÷.(Ø¸£b›£ÁM#2\è\n’\æ3\Ü?¼M°hóy®°Gšº¿Nc4hG\Û\æt`¦Mcgs\ZU\n$Ø¸W[+dº²²úoª\æB¶CJ¼lWŠ7(Ü„\ï)”º\ÊE£\â¹<ñ`k¨\Ðø \àh{@}¸°¾&†^«\Û(ƒÑ²²™SœSe\nmeoÄ†‹\Ñ\0\rE\0 ¦t\ä÷\rUœ¼g\ß\Úp|úKÁ\0M·ôn®£¸Ç‚˜(‘\nË‡ñ!³ª¢¢D•\Ï\å\ÏürŸ};CûÜ†\Í\â\ãHÁ8:„O¢Aº\"q±FºqN¾\êýKº\rL\×\ê›3¢Ÿ|¬ž}Gˆ\í	/¸,÷Ÿ>ˆŠ/h¡ù`‰œQF\â\ê]\Ðj\å\ëõMô¡\ç—\í‰þ!\ë\Ú/û†6|·™œ\Æ\ê@F\Ä4\Ê\î\ïDcBo\âŠÿ\0PŽ¯A”Ÿªhfe\Úc\Ä\ÚB-žYhE\Ç+£BpŒÉ¨þ$¡\Ñ\ïõ\êôK}Ó“\0žš_´©O^ƒ‰´·`‰ŒË‰q+«««®%Ä®¯Óº¿F\ê\ê\ê\ê\ÊÈ£•±œ!²\Æ\íZ\î!\Ëo\í\Êò*F\àú¡–¶Œ\Õ\Õ\Õ\ÕÕ•¿uueeÂ¸QG+c8B3eŒÚ“o•‡hI\ä\Þh£¦7)R7)H8óB=z1½Fþ\ÕútÌ„¯ x©\Æ9cz‘\È\ÔSuelh\\ t‘\ã?^\Ð|¯\"Š*rª\"rª\0¨Þ§cômU£oN\Ê\Ý1(ñQ½I\Ñ\â€6\Êc\Õ25\ÝY[\Z\Û¶F²\ÄL{@!s9F\í$y!«\Ð\"sü”a‚>„}	µ²©´hA\È\Õ:)¸¼‚¡¬`iÕ„·’2M\"\ê\Ê\ÙEn¦mF4)²1¡3PôA\ßw\ë\âšÖ‰4	\Ñû™‘\äunO2§Á8\Î\'©4›R¿4 @U‘ûU/•^?¥Z?¥G\éT±GW\"®¯\ÒcøUü¿Jù~•xþ•xþ”A[F‰\ÑQ	š‡¢®S]a]rŸir¹\Ã÷Áð!wú…ÜŠ²\áQ¹\èð\\+…T\Æ\ÅxØ«V6(Ü£r\â\\Yn®¸—\â\\J\ê\è‰\Ò0Tn…T³\Æ\nõŒ\0F\Ä6F4/õz„\\\îgð´ø‘»´¿¸\ÑVy)œ\Ä.\äU\ÕÑ™™.®­UmN\Óò\Å›åŠ¼lW‹‰qe\â\\K‰q.%Ä¬¬ƒgH\Å4\ç\ÓÝ¯)2UR±‚<3h^\ãø£\Zú½B§sù²=\Âró\í.k&\Ò\Ó\ä¨*¬z\'dj( D\Ó\\3\Çñ\Ó{z~t\0lH~uhþ¤\0\ÍÄ‰h¶ÿ\0\çNo¶Q¬\å”\ê‰\n\Ê\ÈGª\0¢š¨¦ETˆ\Ç\Ëó&ç§ ü\ÈI±ýh\Ê\Ñù\Ñ V?:öÊ‘Ši\"ˆW!E\Þ\ïE\Ë\å´}n w’\0Lå·… \Ý\Ú.\äòþ®p\×Oˆg\ÝÈ‹‰¿¬°N\Ö=²5>\Øþ¬\0PK\Ó^„$)OLi\"t\Çð©˜ÿ\0Ê¤m\çñ\ÊÖ¡0®®Œ£\Å\0MMLu¦{‡\Òe\éù‘ )YØ±Œ¥(Ô½\ÄL\Æ(\Ñ\r­\ÐElû—\Ûs~\é\Òä´’N2§Œ‘n\Ã\Ì9®‘_\ã!­¯£KSy\Þq\Ðpœ\ã_v÷ºn/>RÐ…k8Ì†¤\ä\ì\È*e	Ç‚\Ê7+\Æ\ÅxØ®®†FÆ”\ÝyB9dM¾)\Èß§[tÈ…)O\á\Õü\nB?ò+\Çô.‚\áñø(Ü•²{Õ´z,Tn_k\Ìa“›\Ì\Zsù{—\Û}\ÓL\Û\Ì`v\Þ\Í\æ)ò_v\'û\î‹&\0s\Æd+™9;#Q¦BAF=nQ¹^6+\Æ\ÅÄ¸\È\ØÒ›¯(G)NTg‹·)ù\îU4ŒQ™ŒWm\\QµõTŒPD£Þ¶-_@‹`¾\ÜOpô_ð\äý)w‚Gf¼`W<J£˜D»õ¡\Ýè›«vV¦\å¨\èp®Â¸rƒ$-”&õn\é\rg\É:4&¦®Gw¢ÿ\0‹\Ô\ïúf\É}\ë\Ù0ó&;\ät\éšÞ‰º·ejnYt8W\n\á\\(«/xº\ne	½[ºCYòF4 ‚\äwz/øpM]\Ë.þ§\ÙÜŸ½\å‰Ð‡l¡¸@»Lg\Å6Z:÷F„\Íc\Í\î\Õú‘‚]\ß\è£¼·®|†8._\'–$Æ€¡\Ù\Ü\ï¶\æ6`$Z8šO\ÖUNm\Ý{£Bf±\æŠwO‰]]]q..Œ\ÇA\ÝþŠ0\Ë÷~\æ}< Z.øO´9\ÒA>\í§\æ‰­	¨€£zl…@t\Öþ÷\Ã(ME½\Ú\ÓunV\É\É{„\Î\æ=\Ý\Þ\â\Ð\'\ÚŸ¹³ ÷\ÊIÓ±hAH¦\×<gTŒVBj(u\îÖ›« c8‰\ï_eöcÿ\0O–³´>\íSdí†¾‡T˜Ç­ HEuuel—WWA‡«tô¦\êM8n_h×¤ã©µÓ¤xö3”ñ6¸¹ü¬\ít¼{ú\Ð\Òh!•—\n\á\\+…YYPG«v´\ÝH	E¾øŠ‘\íÏ‡ir¾\ì3\è};\ÇÁ5~®\Ù=¢±©N<\Õjš-sHp¼O,ŽtcÄ§*\Æ+\ÛJ\ÝpM\\®W-¿[ 5‘«:ûo´`ce¬Üžó>\Òsœ>¦½²:&dP”Y8fùu|K‰{£\ÍJ<•\ãb¼l\ÊFt\0ý+\ÛJy¾X««õ¡57þGžß®_H®pº\çWiý\Ç+–&\àA\Øfˆ\"Ÿ%S:²‚´mV¨€µ®%Ä­U£jœ–\nË‡£Â¸zLYrýÿ\0\ì¶EÚ¦¯ž¡\0-\Úe®²\æý\Ç\Û7\é3˜®ô\àO_Vf‚´mV¹\Õ\Õ\ãb¼lRÌ§)\Ép®µ ‘\æ¹a\Ãü¯úŽ\Z\Î\Õs&_q\É\ÐýÇ©rr„\ÐMw(Ü£vV”dªk,cõG‚Ç‚\â\\Y\\ºr7C\Ùre-˜„Ïºû¯¯\î.d\ß3\Ú\á\íoû\ï±ð©(¢@ª5¢\Êñ³%•#Á\Z\Ú?…‚‘	UuÄ€\'!N\é‰	/·P8\æ\È\é\íŽG\Ý4}\\·uxz-MD+¢3\Æƒž4)\çŒP&<U\Õò\á«F\ÕÂ¬¬¬¬¨#bôÀe\Íû¢\Ú5²ù¾íºûyL–\ÓX¨ñ@\Õ7¢\ÔÕŠ7;µ£!H\ÅõS\â­XÇ¡t4\Æ*bÊ\\>*?RÔcú”§X\Åzm$gM\æA\æ÷\noíŸ¼\å\Óû„\å$‘{\Ó\Æac\Ó\Z>!\n\Ò^ƒxØ‰#Ä¸‘B]\Zd™Ì„Å­GO~•\Z\Ê\åNN\îé±œ±7JZ\ä¾\ß\íA˜\å°\r³\Èû†³\ê\0‚|½Q¦‚q±T\Ö0W\\Hõº\Ó\ZWNN\îé¿œñôr\æ{óo\í®oÛ¾\ÎœÇ·\ê^:ò[«\â\\K‰q+\Æ\ÅxØ¸£b\âðø*ˆØ¦#Ã©hˆ\Ú(?ý\Þ`8R@l\í±ÿ\0!\Ë“°\ÐTýË‹ªª\â\\J\ê\ë†6®Ú£z´mR1\â¨coR &?˜?\ÇË“u‡§n‘DöKüD’\Ý[s\"IœÓ“º›+(Ü£r\Ê7+«®\ÃÓººå±›\É\0k˜\ZW+\íœgÎ”\Üq\í\×ò­\Ì\Ìûnk%\Ìi3	\É\ÝO\n\áQ¹F\å”nVVVV\éñ.$\ïùsg\í2n¹T\ß5»\í\Þ þX\ÚAô\Ê?\rÄ®‚jÿ\0Ž\ZXN\×\Ûÿ\0ñ\çòú†Q\Ö]_©ºº	«þ/ÿ\0hyž\ßÿ\0ú‹\æS*AL~R¹š”Ô…‘Ò¿\ã]¡\Ãc§oM:\\“Gq¯ŠhAH©ŸÁ„@*0N¾JõR™\Ès§\È.=\ÇM¶ E»wÿ\0§\É2\çs)=>\Û&TyŒrµ0\â¤˜\ën¯*¹q#’¢Ÿ$±M2•½>Ûœ\ê\Ë\é>¸\\P7÷0\Z3fLtª9½§NV¦©I\ën¯€U\×@HM¦’4zbª+¸0kòM\å}Ëµ;z\Zv\É{Üˆ$ŽX°õ@{i?TiB=¦\ÜþºÓº<+‡-£j´mVVWWQ½Fõuuu~ˆLhBw”gMM@Ê‰¼¾a.\åhÑ«r\å:m\ír\çyu3Á`„Î„\îk±=á¹£:p\Zz›\Æ\ÅxØ¸W\n²²\Ê7.%Ä¬­\Ñk\Ýzz~d„iMMDTdhƒùf†\ã1ðA\ì?Vq£µHs§\Ì\Ð\"‰\Ü\Îkªm j\Ê\Ý~¨wù[ûóE\ì\çð\ã-\ê­\èñ.,¼+…YYYYYYq.,­\0g\Û\äš\â ©P×¹FóyN“\Â\Û\Î\Ðs\ê4\í\"÷š\'òù?C<TË¦z\r\×êƒ¿{\àŒ¬¦x“Ÿ\Ët\î÷`H¾ž\â\ËuuuuuuuuÄ¸²µ\Ä[\áù“d0‹ Š\ZýBŒ:>\ï\Þ	¼¿¹%Ü«O8ð¯š›\\\ì\Ùó9\èŽCñ¨SðRk½£’÷s	s±3\\=Mk5\Ë\æNž\Ð?ó7zš‘*B\èˆóEû¿YG–û÷a\ë\É41­HE°Lµ¶m\ìCÝ£w\ær”y©utf(~¡8·O\Ü\Çp@9Á\ìŽñ]³R\æM\Ú6 \æ<ž\Ç%\Ä\0½¼¯­þQ\Üö·@\ß)©“XÁp\Æ\Õ\ÃW\n\á\èòkOpò•\ïúÊªÍ‘\Ì\ç9\Êuô!\ç£ÿ\0s¯M&Ä?0Ms›ZiýnR”„jR5 ®®†¡\å­S©¡¤`¾‡p¢ky\Ò\æh|:a=\àe\Í÷D}¿.CI\Ý$]\Ï\æ¹\ÓÆ›,­ÕƒŸ\â€\Í/†„O¶¿%,®E81´”£\ëbp\Ï+\ÖõPŽ˜\Õ\Ô\é&=Pž\Ä\Ò\æ\çžl?:\åµÙ€ô\Ç\ä\äD„MÐ£@\êB*\Ê\Ê\\¾i\r\Ñ:l’\rç¶¤\ÜO\ÊKü|\Ð|ö~2|Ç€žY~6\î{Zt|”\Ü\âL`‚\Æ1\\+‡«i\Å0Føøc\Ð3D„Xs\ë\ÜW÷9”i\×úÚž\æ6¢y\Îoõ”[Ô°J\å5\îPÏš_œ!Kk\ÃEÁ99TÐ¢1¡FÔ„U\Õ\Ô\åU\r#z\Æ\nœÉ·A¯\Ç\Åó[\ì\'¼ \æ8\\\ç\0¹n/8-¨û´F¹\î%\ÚM\ÂkTÁ;K\ÑZ\ë\Ýj½\0Qft\î[m\Z“œN¯þA{‹%\Þ?Rö‘\Ñö†\Ôü?™4†\èÑ‡\æbc\Þ\ÛKFýÂš\Ù\Øn\é‚kóÖ›#ü»\Óû¿>O5\Í8E.g,;hôM›\ìyþ!/x©µÀŽº¥U\èÿ\0k–]\à·\í\ÆÓ¹»\í	z7¼“Šâ«Š6þ‘d\Z.\ä´½÷:¢[”\ÕFPŠ›Âµ>I\Ïki,^„\àxý\î‹\Z\ác(úš¹N,¤†s‡\çr%´ÚŽŽ£nC«zw\àø£jâ«\Ý\É\æ\å²R@}\Ç/ÝˆÜ¾‡W©ª?\å÷<f\0”G!­\Ós\ä‰\æó\\\îüœ+…YYY[ðrõD\ÐmðDË¿bŒ1UTMAB1£H6øbœeA«Oó¢\×\n\Î3”\Æ4L\Æ!4‘Iƒ›Hÿ\0ö&¼Š	y\ÌPl\í\årw@Q]]lü7\n\á\È=Ÿp\â\Ý£\Å\Í\å÷\ÊL\ævƒO5N„¹\\™;I+üœ\Ó-¼X\Æ9x|WŠººº¿\á\å\ê‰±™LYM]b\ÈrRñ‚œ\ãbt\ÛR1\Þˆ\æL\'ø½F) \n\Ë\ÒÖ½±\ä¦3ü2¹;(¢™·š²²:ý\rÂ¸r\ß\Ër¿–\ä_\îa\ÌP›]\áµM¤’\Ê\Ê\Êß`\Õè›«j\0E”ò\0NNü³ƒ\r\ÄfN\"\ÈØ¦	 œÒ¤©°Ð©N6(#\Ñ(\åv³\æ?÷1Å®À\É{û—Ž\Ûös\Û\Ñ2Y\Â Š\'8©th¦P$ŠMEHØ™ù`¦è²œ¨#J2-h5\ç<³j\ÌÐ¦S\è”r»^\ä#Oo´E$†jlC_¨F4\"§“\ØxÛ•\î”À2õ\Å;\Û	÷_nDû¿\êÞ‰lTˆ¬kL&\ÃzÖ–;–Š\Ç(N\ÊI\Å_6\ï\Ø-TÑ¡64#\Z\Ëý\É}M\ÊXÁ¯¦\×)\Å\Ù\ÌhS Á¿¬§‡ºt!Á§\Æs\ZÁ‡?\ê\Î\Ç4›\ç+\ç@AÐ¦\Ó_’h¥4i,>X££\å”\'eµµK\Ïö¿\Ô.\ï@†°»‚œ”§,¼*^\Ô\íH£0¤lF4b‰\åW\í\ç2\×\0öN—k‰l\éyNV^\Þo3\ÙJLO6`jr\É{KMˆ3£\0˜\å\è¦ˆº\á\\91MA\ßû\ß\êw CX]\Ã((++\'jE\Z¯\ír¹“gº^\â$%9{†s¡HŠi€\Ås¾\Ü;Ÿc´\ésN3dÎ”9mÿ\0l›\Zú_\"¹R\Ð<‚\Ò5«+,r5g\Ý]]_¯»r(d\"C$\Âi\0!šRµ$¤c\Í+8þ‰%O.\ÕYÀ ×‚`Hš\åW,·é“‰3÷8’}\×pm\0\r™$¢Š™B”)³˜ôø¦ynULQ÷gš(e©¢tŽ~Ï²²º¿^v\äPË‚pqú•“‹M„iD¸ \Z~©\áo\é5ò\ÆtkO/\ë÷™\Þr”\Ý)H\ëlµ¦¢4QVQT\Í\"^A2gG¢µ\â¨\0Š]+I\ØF„\ØÐŠr(£\Z`=)õ\ÓFF€\ÏP¦ð¹¼\Ã@l%9\ÈûhtO\nô\\M£R÷=ÿ\0\ä&A²6\Î\éû]L\ÃIœ¬S\çOœó;™\ËI®ª\ç@™I\nS\åŽ9œœ¤hÌ+\ÓöÑ¡64\"œŠr1¡F\n‰Àñ™´M$3\ÚZ\êŸ\Ëþ\Z\ZÎ´œˆ¸œå„º\'™\Íu&$\Úýuú¤\057Ð‡\Ýý\ÓKù-u¨=Å²úk\í\Ñ!\î\á 	L)\Ïê¿–´&i#\Å	š\×\Ñ*ü±\È\ä\ä\ä\â˜\'?\Ø6\ÒVôV\ÈQ\0¢@¢\ç\Ý#\Ó\Ïhvs*|¿ºOù\'Nüó÷Nb`ŒuIH\å ¢\çLr:û®k!\Ì\n÷9²\å4KÉ¢©¬´™’nSY\íåµ²kg?h5”\æ\éÔ’NrP¾JS¯\É\Îb¥59 Hý†iÜ„ŽBš	¢i\"¥s\Üc\ãYþþ\Å÷N{¥\ÉmµH,Ú¸‚{Ë¥!%A›\Ðb©Ÿá–‚(›\È\å	gÍ L“!A\"kF‰\Ö\äò\ËidNsq»®\éR@Òžr¯)F†¡Y@MFp„iN\",!\É2aC…\æÁY[$\ÂsA§³\ÓX^\Öð¶\Úô‘\î\"g\ÈYO(h\0ˆu\år\ê\\k\á&\Ô\nö™\Ó Qþ\ãkó\Ç!|‚VM÷X\Æ8!3JQ\r*BÈ£J&\éý…\Ðp4WWS\È\à\ãað\Ðö\ÜÆŒ¾\áh\Å\"ß”¦s\Ü÷!:‹}DNÕ¥ª4	Ö‰–L_ ‰©\îM\éTuu!t]5\ßû\n\Ø\Î9D³\rˆU5±›\É\ZQ9\Îûgúš\ç}Ã€™õ—–‰HP\ä¥õz„cBr*B\èóþ\Ø w›\Zš\ßAÔœ\ár=SŒ³zPDÎ²F¿°­Œ\á\Ó\Ðk>‰º‡˜NE635&\ëÜŒhNE:4&\ÞýÙ­Žž\ä”.\ïBŠ	ÚŒÝ‡ÿ\Ú\0?\0ÿ\0\Äüƒ„õþ\Ê2N\nœ·O¹S–\ßeÍ–¡ñ_ÿ\0 \ì\×ûþ?þÁŽôC¹“\Û×¹¤‡kø¢GÜ»\Çzÿ\0|\ìø©s[2®Gr“\'ûõ8/ ÉžjN&Zþ+ƒ\Çâ®®®¯—…p«ôŒWøù†Z.<\×\Ö\Ù\ìÞµ\Âcö¥s\ë…Wø\ØNµS!‚ªÒ¸ü>\Ãà¬¬¬¬¬¬¸WA–¢±‚™^Ù \æNc»þ\ä	¨Sc¦?`K¹ŽA¿j;þ_[\ÉV\Ëen•º1¹b¤.±\\K‰HÇ‚\îK¤c€\æ}/ð\Û\Û\ÕE¼¶Ì þ{\ç=ƒ\Å	\ÜÆ•u|·W\é\Ý_¢·\ÆH;–*f\ë‰q)\é%˜¶\ny¾_™{.\È\Å4Í§·?´\Ûg\\*\ÊË…pôl¬¬­Ô´“šh\"-Ñ‘º$ #b\Z ?ô\ã4\í¯g,\ÕLÂ®®¬­Ñººº¿S)©ôETÔ£F„\\bˆÒ‘Š3?\ãùW¶O+–~²¼Ô®\ÃÑ²·Sen­\É\Ùd\Âþ\Ï2£1\íw<\Ø\'ón~APKG‚²·F\êÿ\0…rvY2ƒ\Ø$Eb©¯mˆ\ío\ì°\ëü,…–xW[«\åjj\â\\HÆ…\Ìi\Ì};Wûl?QðUü.\nf\ÙxW[+ejj\â\\HÆ„ö\ã\Ë\çÚ…\ãŠÁ¹\Óq50Qõ|K‰HYa\Ñ\â\\K‰q.%\Å\Ô\È]c”k+•\Í<3‘\Ôd={Sûy‚ ¬bŒ­\Õñ.%‚™·G‰q.%Ä¸—SŠ™¾Q¬§F„\ï´\ç8û‰˜$\ê\Ü%*zg\íSß¤«+u7WS’\Z#•R•\ãJ¨Þ£z\ê7®Ú¸cj ¨Ò‘Š¥Õ••”oQ¿©_ä¿´\âK\ÚMôNƒ´\\\ç\Z\0‰WW\êl¬¦ci˜\ÅW#tJ3©J‘Š\ê7¨Þ£zù\ï_=\èÒ¢4ªR5£[Gñ*þ¬¶óÞ­ç¿©Œ5ƒ\Ý>\î\Ñ{4„5«+t¸k\ä¼b¨#j”£jµ\âŒT\ä£z\á\\9x|~+‡\Ç\â‚9cz´m\\?Á\ãñ\\?Á\ãñQ½Fõi\Å^1SŒ\ÊdE2•\Ì\áýó›\Ú/qÐ‚\á\\9n®›¦7øk@F*™\Óiq\ÕDmC8ŒT€ª—ŒU«®\Ãã—‹\Ãà¸¼>#–7*Ç‚”•••—Š\àñFVŒU¦#9S\ä½Ñ›)\\¾p\Í\å4\Ðö€\äƒAu,®NBŠf\è\"z\Ð\r——z9·\ëBbÉ©½6¦õ¼+‡)¢”Ô\'\"š=Ó“ˆÕŸ×´>\ä>þó³7„•ò¹9Us\Ë~”4\Æ(™R1R’joM©½o\n\á\ËtD«’¢h\"¹Ü±þß¶}ó\í÷\\‘7J£J©¬••”ª\ZSA½(›§B\Zz¶¦õ¡7)h(/òDfùe`\Ì\á(\ï\í	÷mg\æ;\Ì+«¢@B$\ÍJ¦Œó@\æ¥cj?V\ÔÞ´&\åh%B2‹)|²ò	þ.\Ñw0¡\Ç\Çâššœœ€ŸšeõS\È&©øj\êxW\n\â\\];«ôB=ÁFZA¬÷ 	¯h9®’Zjrrd­OD\ÚÄ–\n7u<+…q..´#ÑŒa–0\\¦\Îrh®švƒµd\ÅL¡<\é¦Z=©—\á\î¯\Ò	©©Ñ¡Fc\È¸`ò\íy3¦@\áiE‡Ë£eoÀ\Ù[¤SS£BŒ2\Æ]yy/\Ðv¤rcòB´ù)\æ\Ý%(Ì£r\ÊÑ±Z6+F\ÅhØšs g:’‚ºº\ÊÑ±F\å•£b´l\\+…F)±˜#<\ëMr˜Ð¹`þ\é#\Æ~½ ù^E€J„¦“ z#1%\"h~”nVŠÑ±Z6+F\ÅhØ„\ï*Ç‚¿TPVVQ¹F\å”nVŠÑ±p®¦\Æ`ŠqŒùLh\\p•öLË´4„\æœ\Çz˜ qÜ†h1ZToU²˜jººShü¤¨„ªGWQ)ô*¦\Ñm+ñÔ€´jG¹¥¦ƒE€\ídfB3&3\î@K6\å;Š¢ ¨Æ”)Hü\Ê\ÑýJ?Rœy \'H\Å\nH©K«‘²­d£õ,có ¼iB‘ýJ\ÑýJ\ÑýJ?RÔ¦/©ƒWp_\éEÀ\ë_gi5\ÚB¥3Z9-’r\\>+‡\ÅZ«\'U1h\Å]]]_§uuu|–\ËF®Â¬±ù)fù-¾‰ÚE\çhoi1\àYF)š\Ñ\ÉT2p®Š½U\é&’(e\\+…Y[§en„òðªµp®H²–o’\Ûè¨ùPE\æ\îôŸi=„P‚¤úR4¡1’r(\"½\Å\Ôÿ\0Vô@ƒ·*|?*©œÊ„Ú„\ïOOÊ€\Í‡\å	¤;7\æ\Þ2”•“‘\Êj¯XÁ;Ìœ\Ï¸ª\èþ„&k‘5 \Ô\Ë\Óòb”f\Ç+“““•`5$$ vˆ<³&œô\Þ\Ës\r?­h”k)¢æžˆÀ\'\"‚(´»Á»\Ñ%\Õÿ\0O\ëDJŸ,T\ç\Å	˜Ú¤oAŠo\×Y\èo\êMú\ëL\Í\Ò1\ÊPWWNG)ü\ìkòÁH»LXi^\ãcž@ƒhÒ…diM$\ÔK\Ó\Ò\'›+“““‘2ªå»že\Ë’|¼d¤G´wyi@¹\æ\ç^\çÕº`žÎ’i`ý\Ü?PFb\ÛÔˆÎ„gÆœ²Ï“‡\Ç\à¸|~\ny•¨†t4Ž‹“²„r\ÊQ±-§ú¿PA\Þ\ê\ê?ü5Ó ×§ÿ\0q4{­ü\ßü˜+++«\Æ\ÕedW´G’k…®v\ÎDQ¼±\\\ç\Ê\Í:5ÿ\0ù¹o\âi ÷\Í	ž\ëû1\ÑÝ¡<\ç½=¢\ÓõB3„cOB·Wª¦6©\æX)g(f\è¹;(G(7bk¯ü¿©4ÿ\0JùoWÿ\0¥]]^?¥P\Çô«« š…+-\Èg™4Jzb¾\ç\é¯öÎ\ëþC—£š|kÙ¥0gþß Á<šˆÁ9Í­cBrvW#–\ÊË…p®ÂŠB2ùu<K‹¢r\à¤l†­É½\Ê0BY¥\è¹øòýÿ\0‘?Ÿ\Ðvph5\0úà¹†q=IÄ„\ä\ì®G£Â¸W\n\áG&*ýO\â\è„Ü³X!«rn¤Dâ‰§\Ýiz.q”¿\Ç\èü‹¿ý’\Ø\0\ì\â\×:^\é‡QG\Úg!‚$„\ë‚ô\Â*\Ê\ÙB9n¯”wy ¸i¬Bû¾S\Õý©J\Z|\Ñq¹3\Û\ÙÜ®{\rZPtÇ´yO@@‹üG®#\Ó®Ã”#—‰qe\ÞIšÇ˜Q†)\Ú>K—ö-ÿ\0k\Ú	\Ø0õ\í´Ÿ¨HlBf³AP\êx—W\'tZ›×Š\Ø!3Z sH\"	#2{úG\Ï×´=š|\ÓO\ï|E:ž%Å•\É\Ý¦««õ JDß§B?\ÂyŸ\ÓZ÷¹\ÜG´9.:P´A­M\è¹3§rœ\íðNNSU\Ë ¯W\n\áF4¡‡Dtœœ„Mœ„fcb{G©´j\í\çMžq\è‚9Z›\Ñr(‰QHE““º2*Q\æ¸W\n1¥\ÌUD\å”tœœšr¥c$\â%“ô64v—5„VýÉ©¹Z›\Ñ((Ü¦oW¨ý?ôþ”\0lÎ¶þ”\äW¸£#Ò¦,cB¤x\"HQ¹îˆ{º²Y\Ógr#J\æ:u—¢s\É\í&oD\ÍI¹Z›\Ñ()Ç’™Q½Fõ?eu¹U¾.NE59F\Õ m\ZT„x£#U&Ç‚#\Ýöõs\"ˆ†ŠFµý¹ýöý#´\Ø\âh„¬P”x\åjoO‰q./=Ë‹\Ïr”fÁR,¯\ãbœy\'\èØ¨oÂ€?¥Ñ©}6MM\êZ‚>û|õ¦1°6 »NE5®3\Zi†\Ã+Szur\â\\^[—–\åS2]]Fôe9.†1¡TÔ¦¦õ-AF´þa9ûVEH\æ	\ÉÉ©½\"©\nc! F\ÕjF(ÑŠµcô\Þ1XF(óR-ª7¨Þ¤r\n¡ž]A¢$ˆ\ØP÷Q†4\×p\Ð|Ó““Sz7\É8òS&ˆN \æ\ïS”_N*B\æ4 E\ãKF(R‘Š\Æ1BWŒUEG\ÃF–*7©HD:6ŸL\Î\ëûm»lW>ô#8QŠjnW\'(ÁR,k©4F\Õ2¬£r\ÈŠ\Æ\nrS\Í\"eXÁ\ZFÅ„`ŽV,PóD\Ñê†°†¡\Ó|­%L\Óí‰‹„\Ø\Îbš›•\É\Ê0Q‚òÁ6B$2ð\Æ\Õ\ÃP\Ñ H\êFq\â„z¡ªr¬bŒ¢\Ø/\ËòÁN3#1CXCPé¸‹H®n²Æœ\'\á‚\nt\éX\nq›&+òüÉ¥Æ’ÝŠi\Ó4øÁ\É“LèˆšªÒ¥8¦\n–R”S,ÿ\0,Wº?\ë(0Z5 M\Ú%“Ÿ¤ö\Ë%c\ZI7”º‰‘P“j$¥*ÀÑ‚hÏ¢h\ÑL\ÕH˜Øªk•^½ß¥^Qüª—1ü(cfI\Ê(¯O’4ˆ\Ê\È#\Óo(Xùl\í t!;J3 ‰–P›”kðÔ¦\rc$+)*\Ý]]]]T*\ÝØ¶\È\ß\á•\ÈôBú¯\';7Ç¶\ÃA¡VsB¿¡7.\nÑ±\ZFN<¬J›Æ…”nQ¹F\äL\åE ~T\ãb÷•\ÈôL\îö\Øo8·n¸Q0‰\á‚i)€MM\Ê\ä\î\n\áWªñµ^6«\Æ\ÕxÚ¯z·’sF”\îa¶n\Ýa¨_Q\Í\Z0MM\Ê\ä\îŠ\áñWªñµ^6«\Æ\ÕxÚ¯z³\Ê\è\å˜vÿ\04a¹%h\Z2Ž£‰qu`Ÿ\Ø>gw˜@ƒU \ØÙ”uK‹«º?°\\\Ì$¸”ý\ÊeH®%\Åø)šO¢öžÞš{¿x‚¥\î\\JaH.%\Åø2\épq\ë\ÛÜ²\á0\Ò\n\å€t¦^\Z.2cj Šõ6V\ËuuÂ¸T”•\Õ\Ð•þ¨Á<~ñNc­:\Ü.qM\ã\Æ*.\ãöƒ\ß\î#F­™xj¸V,P,¬­Óºº²²²²\áVR\'%•‘\ÓòGO\Ë[*ˆÚ«Â¦;du2>³#4\04¢\å¼\à!4µ\Ô z`¦~Yl¬®¯—…p\å\Ê7eººº¿D“hÖˆi\Ï‘ÉEÜ³SYC»c\Ü\â¹\âk\Ú\Õ\í\ÅMW/”÷\Ë\ÜO·»5¶&™åºº\â\\YxW\nºº\ê7««®%\ÅÓ”\é¦\Z½ÇˆÆŽLLJ.ÝŠ-Ÿ\Ô;T5MqŠr»VIˆ²k	ú­\éü\0.©=>Â¸|WV\â\ã(°·ð¢œ§(¢¿@µ\Âa\î7Ë´¤\Ñ2ƒœ\ê\Þ:U21†Wj\ÉU6¦r¹®™\ÓAi^ˆr7a\Ó\á\\+…põe‚3\n%×H§*\Zü¥&<ú$I8ò\Ít|f¦\×;6Mi%H7\Ëzi}Lb¤\Ð\0\é;R–9fSMFñùJ`ž8~T]\çð\é\Ý_£ed@‹jQ½8\Î6\à4\Çî«««+ c2q\Ïò\é\Æ©´ý1Š›\ÙMcd‚(	_[§(þ% \Øñ\\(€#gMÚ\Ë!^\é\Æ\Ô\Ð\×hŽ¹`›\Èx\Ëø:|K‹£ut\\t©X\Ç\å(°\Z_¡9\Ît\ç+++« ­›wNsˆ 3w\î@Œñ¥\ÝI\×\ì)4L¡\íj›©³zúF¦õ.\Õ\èœ\é\Ä\Ñ\é4\ÓÀ\"a÷W¿ô„Htb†—R\îÿ\0D\ÒM>X§4OO\èO•£‰$\ÑH¶6(\Å64õ|+…}#\êT¯\ZÔž\Ù\ÆJhF“\×\Ö\é\Çó\"e\êõT9Z›Ô¸K7¢q”\ê|\ÑT\èÍ†6	¬ž\Ì?*c	”\å\éù´\ã¤¸fŒS\Ú\r{¿AÁHº{7\"sôAe\Ë	±§«²²öÇ’$\ÑH„K(Ö¦mþn4R\ròÞ¿\É*M«õ7W\èF	\É\ÙZ›”<\æŒPl\éilü…45\Þyû±AÀ\Ðôj\ä>{“š\Õ)z\0€‰=0dŠn¿P‡\à¤ö‚‰m£Vª¾®UkŠ6®8þ¥xþ¬€\Î6tl­\Ô\Ù[¢Q\Ê\ÔÜ¢4#33òL5\î\Ãò&Ö±ùz/¬[B5¤\íOÑ‚ÇŠ GŸN…\Z¦F„?@\'uô\Þ?2!¦q­I¯T=­Su6o\\1µZ6®%Ä¸—^\ä\îˆE…›O\îüSkA(¶	\'Dp¡\'y\á©M×¬gN\åƒYŸGò\"3ü¤S§ ¯”wz~\"f\èý5Bb{7ª‰t@41Š\Õ?\æWª¡Q¹F\åÄ¸—‚\ãð\ëÜ\Ñ¡ ­\Ò\ÅH\ZF»\Ë\ri\'Dp§HÄ¿•M\Ç\Ë\"hzw\è\ïO\Äb¤.¨\Ù)I\ÇGõ)9\×2]]]_/\n\á\ën¯Ô„SµŸ0£S©\Ó\é\Ï\ZP˜\ÑéŠ‘ŒT„[tü¿2“­•,ý0›”\æÜ¨Â¸W\n\á\\+…]]{.W»\Ýôh‚¬¬¬­–\Ê\Ým•ºŠv³\æbœLI\ì\"ú–Ø¬>X©\Î6d%¢Dˆ\ÎqN:a7(˜¬½¤[ð¶V\\+…p®edJöN‘‡`“c$I±G¨h>\ìBd\ìeUV\\K‰9²ÌŒ„«†ô\éˆÐ¯\Ô&jI½¿<\äd=eæ³Œ\á6‘µ]]]Q\ÊF\"jº#:G¦#B:ýBf¡\ä›øû+u¥;ð&4#\Z2˜`6’\ê‘ã’¼^*r²3\ÑmŠnÒ‰Z›•ºö¦˜\Íøû++«õ¥;ð&4#\Z2“\è°\ÎÏ	’Ñ¹F\å2++z[,Á´ESQ“½¶÷=H\Ï°\Ê\Ô2¶YÊ¥iøû«õ¼K‰qø.?\n\á\ê\Êv¡\Ñ)Ê¨–®YpÄ©Fl%Lšù(Þ£zú‚\"UŒ¥ž~%MlN˜#8²§\'&bPžˆó\ëø—\ãx—\â\\]+ue;P\è¹$™<òó\Z´\"[Ä©\\Ä„£: ”nB4#Y–	ÄŠKÖ¨\Ë2\0»>\ì˜¢§\'&ƒ§rh¯\âW\ì;«®%\ÅÕ”2ñ.,­MI¤Š	ÛŠ{Nq\àDó\è\è\Ì¢tª\Üû¯t\ïhu:7 	¯\ÃWD¥ž]}\Õû\ÊË‰queelœK‹/,<\Òc\ÓRh—\î\Æu\"‰\Ò\'\å\Ñ\rºtw/g,}]öÓ¬\ÖZOz\'Bt­1\æ°V#a¹R\ß.°ŒÊƒ±¸W_lû±N\"Y\\œ¾Ú’ñ\ä¾Þµö4=\Âl>!KGCA*Aµ8üb\Ê\ÕN9F¹÷d9~«)6°;W…põô¤gN9\é•\É\Ë\í«Oxò_n\0›‹Gœy(Þ±ËŠ$\Ý\íª\áDbŸ*_!\Ê\ÒeõEµ~\ÂûŒYLˆ¢²²\á\\)´ý\èÎ¹c?´e8O\Ñ\n\Ê\nsŠ pÝ”™V©\à‹\ÏË¢%d°³\"Ÿ$]Ÿ-Z¸SÓ»\ßi\Ì=2™©!)JZ|\î7eujž5÷Ó¢¯=Ú“d+/O\ØS\Za\Ñ:‡ª\æ\å\Ç>\à<\Ñ\çaö@m%1I‹\äs\êJvS\è^ˆç¯©W\Ê\ÝhŒýPG¶ŒhQ‡D\ê«›–0]Û“‘\Êµz\ß\êŽV\ëÜTüGÿ\Ú\0?\0ÿ\0\í<\Ê$t™\è!N®ª¶®²²­ž’®®\Zt\ê\Û\'ŸF‰*-\Çþ´Ê3364õµß½|Ã¨Yx\\µ~sÁ\Ëv\ëŸ\Õ\é\ë\éQ:Uhë–¤©\á)ÿ\0±M¢\ß\Â`­ôn\Þh×¾J¤\Í;ˆ\îË¶¥Mz¦~\n_LO\Ê\ê\r²\ÒóN)…mS§“w-5MY~#\âø¾žJ;i;\ê\Z‡›Ê›·\Ê{ŸD\ÝtªŠ‚\Ç:\Ç\íQWR6ñ\ëU\ã¯OD\ê(Tjü\Ï5’´\ã\ã©\æ—\'UYUù‹\ÉW*n\å[\É\ãW=\n5UThUU°£Dñ‡}b\ë‘÷i\àÆ”Ò®VŽ\êÞšO¥õ\å\ZªW\Ô\êÊ«ý›ˆq4O+º\éHK<\Ä.´w}\Î\ît<*\ÛüŸ¤½Î¿\Íd_\çcœ>\î…ò\åC™ûz\ÎóIu\ÕP™\à\ä*TN‹‰\îµ}\Z…¬)¶3#·\Ý\Û]x®­ñ¯x¾i§½7\ëõ\Ôô­:\ÊGN™V\ÑüZ\Ê©ti‘\Î?Só[˜\Ï\çem\Zú\Õ*éºŸ\ÎJ\çm\Z%D«Ô¨E[TŽ›\n3ª£F8\åŒ/¯~!K}S¹j\Í[\Ý#\É\Ùv\ïjº£g\è\èp\Ú\èÑ£™¢\ì¿9™vo[¶½ì¶š\'‹\â\ä\Ýú÷\ã­\ÆfDt+o²‚ŠOGyQ26ú:5\ÆÃ\Ø\ÇÞ·Y+”Ø¥eô¹7\Âí¤®£=4Š9Ž®´‹\ZX…e.Zs6\ç_\núšGF½\Ü\é|§¤ø¨:?\é\Ü\Õ\çPô©\"ÿ\0eTA”¨Ò¢\Ù<\â2\éÿ\0Y_ƒF•/ö´Lú+¼üÀ¼\îk \áBEIKÁú¶­Y\ÍUWX~š¾™¶*4(\Ò30E÷z|Üµ7f¡£Fñ¼—m\àö]{V²‘¼^žC¹3|\Ú>}:™´ÌŠ ­Ä¯š5\Î\ìuSR¹mÀu¤º·…ù_L¼\ÚnWªºuuŠP:1 ¥VTˆ\ãhUR\ä©\êk\Zk\×#~4øÁ\Êmlfr‰Š\Óx\ä6ÿ\0w\Î/%\àûN\ëuð½\r·úÅh>Š¾d\Ç^<²²C0´ZI2\Þ\ÑÙ²`\Ì§w\Þ-\í\àd¯R\',¯£ý^~\á˜pþ.{&À†Ú¼½\ï–!y9_~¥z&t¡5þ\Å\\|V?ò(r<\Õ:\îÚ´>ú°ûW¼Ž~ •\è\íI\í\ç\é\Ò0!û@\ïµ;^\ÞüÛ½ª\î\è	^K\ï\ÕÀæ»†F‚ô¹\"{r\Ý\é\r±\r\Z\Õxs¦\à!¢kS»yˆ\ïNø«7C<\Ú.J·\Å\nojŠÊ©h\nú>k˜È…\n\\Ð¸÷Ó–*\Ì\Î\ÐðqUQ¿7i6:\ÂEA5å©£ˆÖž1Q{yE\Ì±\ÌmUMmj›ºò«T©\Ýh¢t\êjNªeTöq,§F‰Ÿ YQQ\\L6\Ñÿ\0X¥\æU\ÖRlžm\nT›‘„m_œ\Û\æ+’\ïrš‘8“S­|Þ§Š\Ê\Âm\È.Ó¦­[Ú¾°\Ê3?DT(—\ãR!Sö\éó™o5I}=U2wPºTÍ¿€÷y>hV¬FTX\ÓbjM\Â)\Ö\\GsÇ–\×v¢$$w6ª¶±\ìô§I¤gF÷«¢\Ô\ÔJ‰\ÄU4*Œ°˜°½.\Õÿ\0\\ó{l»˜\ç\ë\Ø\Ê8\ã36F x>?w¸¾\Ä\å#z:\Ød)/N©)¤÷\ãPû\ÆA\ì\äÎ·§¨­·\èn¿\ÙSxå¨¤wy—=¡\èôñ\è–\Ø}\ã˜>Ó¼%T\í°\ì;	S\Ã\Ôp·—\Ï\Ú\êdb\Îðx%\Ðw“g±`\í|]÷‚©ÜŠ^ \è\Û\Ð\ïP©+\ÉZE†~@»oz§]‘u¿a\Î\Ì#hñM»!ZPd‚ò;\ÝþÁ}\ØxóŽ\Åî§‰a\Â8‚ªÈƒnE˜‰†®\çƒÃŠ;\r°¿W(ImlgdQF8ƒ½B¤ªU¡\áø\Þ-\ëo§&9œû\ä÷5j\ê\éUTWºŸ48\ïUM3/:¥EEm\ZuJ*)°¼\ê\È\èÒœŒ]\î^ýöù\\\ï\å\Ê\nÔµN—¯6®•®’d/Ê¶ù\ï«\Ës\éšôiMk\ÓRóªÌšUtˆ\ØN«\í\Ë\Ë\Ûw/\Í\Ï}\ÕR¯t^{¨÷Dýq¼j¨S:ºt’¼]õµ\é«|\ÊtN\"*M###ý`¼oU\î~:\î\Õ\Ús\Õzw£ñô²¥¹AKY\\¦¾•\Zº$YZf.›Ÿ“T\î5ýª½\×vºð-\æ\n\Ç\Å\'ŠK­F‰ù•nR¹èŽ¡y\ÞZ\âü\"«xÖ¥ª \Â#£I±‰8NDTL\Ð°ñ¨¹ô\Þ\r2oœ\æºô	E?9±ùÔŒÁ»\ß7~\á«~%\Øú­qŸÚ¨Í¦\ÛÀm”>\ì÷Ä•\Úõ]·\Û}\êòŽ)ð.õ\éÝ–”œ\"ÜŠahwñEJ+­þ\Å]\Å8su·ö¢\ï¥L™\Z\"_m°û)\ãö‹¸)û>øJôL¯\å\Þ\ÕwwwªT™V™õ‹Bw}•\å\êKQ8ó„Öe¼’©{+¦Q\Æ›½\à—kC`ú®n\Ñgf\Ó³ŽøF<?¿£”¤™±ðŒeŒ9¼7d‹ž\îlq\à\Ì=¡\á<l\ÝAK¾\ÐVd›ŽŒ£‡³fXV÷xŒ<û³\Ífãª`™Þ£dSa\ÛbŽ<ž½¶’-rk	Š\Ñiù´&¨NW¯Í¢,#\ì¿0K\Ú)À\Ö\Ë\Äz\Å\Ç\ÊK\ËVº\â?ŠŸ\åköz\ë‹z”£V½\à\ëKZs±\äœÍµj\ÖUWPŽ\æÒ¥D\Ý¤OjþWsV½\ÛV©ñË‹õL’P©X\Ê%^š\ï^\Úu	\\WŽ®…*_‚TiT¨¦Qú˜ŒŒ²‘—OÇ¬£D\Î2(ˆÌ‰¸p\Âs;”s2ù8\Ýt\Ö\Þ÷}è†©\Ùv\ÔS&¥HðSJu5ª)‘ù\Ôê“•*T\n#23\n.·\ZzN\×U\\\îs¼V:\\\î\nq§QJ²²²µEq\ÅøT\éRdÌŒ&¼‚ð?žo%{õ«dwœ\ßg\îô\Æpôî´¼_\Æ\ç\Æ©¯Ê„¼K\Ç\"÷§G‡/ù~•ýt›°\Þxýœ÷/ò€&´;\Ò\Ú|uˆñŽ!w\Ô=jdØºIM¡\à«kùwFp§\Ú\n•%ùhRFË`\Å;Gx<6eeƒ\Ý\Í\ÆÒ’Cò\Î=jr¶\É0õW—©LñË‚0¦£\Ä\Ã!\\Cyú*}A2vµ5º\ÞF?Ÿ3­ƒg\r¼úºG\é\Ïf\É\î\épd\ç‚uo$’-\è\é	¯G¼ˆ¬f³\ï(Åáµ©Ia½)A>Í“\è\è\Â{¿x=ö‘¶¹&nPœö®\"]\î\é\Ð.\ç)~ó\n7·–4(:\\s™ueI\ãy\î/\èJ¦®¡ôU)W^»©D¨Q**j\È\ÕT‘\n°™@7\ÄñF÷q¿]¨_g³¾¾‚”7[\É5R\Ä\Ñ)«:Uj«K]F²…:&eJ\"?ŽÊ3¤fDDD\Ói‡/Ý¡70V\\\'\Ï2œõÏ¾a\Þwš¢}]ÛƒVu‰\ë\Ð%2m:…O“#*TšFUTL¿(<¿\Ñú‡§1’Û¬ÅŽWõ\×Ã³\ã\n_÷\àø[µ›\n$K½ã¨‡±\Ü	8o},A;tN<÷+\ÑÈ­¡¿«…\Ûx(x%u¦V¹Ñ¾¸ý”\îŸX¼œ¿\Ù_\×I\ìOdm¾\ê\ëý¨·}\àwºÞ‰\ç}\"	¾Ï¼ZU\î%²ùÎšÔ¥°`\Ú*7Mÿ\0± ¸ƒ¾Ô^‘\Ä.ý\àu¥L\ß\Zü7_À¨Rð\ã\Î\ß]D=±w\íVB°~µ\ÔƒÚ’¦ùj\áhPðKfHÉ Ág¯xZ§Ë¥J§Àþ±è˜Z7lŒ[ñ½,œÂ”þ%ZºB‡w÷‹q7Pjˆ¤#\Ì8ƒ¿vñ\ÇÑ„q|}½¤c\ÕT¤,aª5ù­@Á¼û*œ9»ÅIE}\Í<Í†¯!\Êx$]\ÎLóz÷\×<¹WEK®ª±\êCÁù\ËEÞŽ•$”œµ\È\è\ÓR¢\äzz%F•]*5žŒ©*²#iRFòv«N½\ÜðMPµ\äu\Ô$X‘M]\Z\ä\êSWÕ*º\êŠ\êªeJ*&dd•\Z$gHÌˆˆ‰¦\ÓwF\éR¤»÷µ\ÛZª\ï\Ð7Ek\Ý\Ñr]¤\Ú\ï]\é¡B•\n4\Ô\Òo£ f\Ú\ÊE€ŒÂŽ`^‹Þ’ý\ß\ÕKh¿^W\Ã\íöò¼\ëÞ”(•\Zt(Q\"£B®…e\Z$\Â\"ˆ¢7‚õ\æ™^üµ\îz®[\ßþ¯ÿ\0“K\âW]2d‡n±}–‰\Ýù@\Üc\Ú\îµI¤\ÛO…µ½‡\'\']›\à\Ì9\Þ\Ó%ýJ\Ó	¶Ž(™¾	ts³$\ä\ïx<=-wW}Z‡ü¢\ì=\ÞJ­)\ÄZ;\Þ\nž¾†\Ûì·«»¼)‰*§“=õa„C‡¨sô\Âah\á\ÊR©\"ðK¦fy”\êK:½õN¡hw×³çº³˜Rð\â¯‘--Q\Å\àWu\å~jL!ÓŒ{¼øk7\'\Ó:Ç³\Ôp¸›bZ»\04\ï\r•J³†‘\Ä6®¾ðuþ%#\'\Æ\ZÝ¤¥”ð\âY\Ôø¿,¸›<:0šn8$ŠX¾\r¢#Wl\ÙÅ¥Ü£fFG‹t˜%\ÑE`\ëð‘Lß¬ZÎrùÍ—¥{\ï•\Ê}Ò»¯%õÉ¨Wr\ä\ÒQ¬4ªjTQ¨5štŠ®]: ¢\ÊTŠ‰Ñ¤FQ‘\ÆG1‘\Èe—\ã‡K¢\í=n\ëÃŸWü\Ût.\ã\Ô\é)©»wf¢°\è>\ïóýM*”\\\îºtjÊ‘—¥­‘¥FyRU~oEó}\Þ\Ë\ÓD‰a-*4W\Ñ\"\"£F\îQ¢ThÐ¡D¢\"(ˆ)ûQÀ]o·²:\ä+m\ÙøA÷gw½	J½\ÆÅ†p^\ë&õ/¥]ñã‘7±Þ–Ÿ˜\ç\Â6w?R“Ô½—\Ä{p÷Çµ.Ú¸¿[;±j\Ïx$´¤\Û\ìKuL¯¿ju©ð8]\ÚG|p¸¼n¬M¡>\è^7½Œhx\í,\Øv‡\è_úD{Á§\àuô\r¢\Ëiùiô\èJt©•v\ë”m^’\É1fN1¶­“@–\\M¡;­\ëƒ€½\Â\Ù\êQ\É.1\Ã\Þ\nÞ‡\'ø\Õ\Ý\äOµ&Ÿ6€\Äð\éJek˜|¥##(a\ïO\ï=ýÅš_(S2h\æˆ\ã1g^†¶&‡g…ƒ1ƒ\Ùöl\â\ÑhÙ•–Üˆl\Ù|˜$\r%1\äy¸p­\äo0*\éVó—7z¨\Ýú²:Ey.ËššGQ\Ð{û\Óõ\ÜU•~u\"Š¾­´ð¨™\Òø\Ù÷zoS\Õ3Ž\í]—;\Êð?\Þ\ë)ú4Ž\×C¡-b×‚\Å\Î*5	ªiR3ÀCœ<ÿ\0AsV\Ü[\éxžŽ~_!óJ…4 »~Í¸këŠ‰Rª\íùÕµ¦_[N•)\ÃËˆ\ÜûU\äW°8\Ñ]„<S\ì\ïý_`R\ï¾‚\á¸]¦»aDú^\ãz^«\Å‹;¼žE1\Øx\Ó÷…½[¢ ¥\à\ï¹þ\Òõ\Ûwi„\É\ÔYR\í\Å.1h\â´ª’z\ïz7CB•\éÓ«J¥\'ø,\àÀÇ…™RŸmC1\ã³û-/Ì—j)G´6¨ü²RÏ\Z—{\Ã\Ú_\"\n}ž—ûûŠiÐ»\ê’ü\Ê\r˜l÷ü\ëùïº±\Å8\Ù\ì¯O–¡ö£\"’pfž½/Ì–\é\ïT1\é§µ%\Z#Ë”{Aßƒ¡\ìuÌ–·,@¸ƒ¾/]˜‡z&!2¨›b\Ï0´;ûue=¯\å\ÝZ‘\à\ï÷Û¥q\äxùG\Ú\í{.°?E\ì÷¸L¢%I•\î+G³\ÔC¤m*‘\Ò§xb\ÛrL;\Ô(\Þ\×\ì%\ÐM«\ê\"\ïs:é«­Iyœj«(L¢‡¤NüK_F•R„\ÕõgøõõTŽ\"•‡‘°ÃŠô8•P\\ã¼ŽwkùÎº­¾c­ìŽ¥z4›\\š¾,MøÔ¨\Ñ#:FdDDM6˜¾ÿ\0wK°©\Òÿ\0½\Åp.»wýZU•>\Â]\Õô(QV’¾¥=e:T/+Ê¨\Ë\ÐT\Ó\":4\é\"j›¿w\ÜüQK¥\âµwÙ‡VkÃ‰£‡\Ýô\êœ)þE\ï^Áöð¢\Ëò%¤-…J¾Z=žžÔ›\å°\Â,\ìJ•1ý5ƒ6`û³»Þ…dZ\è;\ß\ë\í›®«\ÔQ-C\î\é³;½\Þ\ëÁ¸³ˆwºÒ§rò?ušf\àš-Ñ´]ùX=\ÞôJ\Üù˜`¶\æKPôƒ\Ù\Ü1|‡…\å\Î6w÷’\è\ÇÒª“|»;N\Ë,0xl\Ð\Õ÷{­TžmeIgØ£oX\Ù\ß_ž\Å\Æ\ÎðJôLp`\Û\íIT\Ç,	Gª\É\Ñ)Ž ŸyñÈŽ.#\Ð8‡†õ.˜ñ7^ð³oüñ˜ñ7=\á»$–\"\Ê0&„X‚k:\ì¶½Y\ÂkAY¤\Øt‚\È}‡Z‰\â¶ ™\Þð÷’Mùa•¬C\ÂÊ•å¿¡[õ†²hv:\ïs\æ¹öô\åUý½\\¹v©Q@¨×§ºNº.\åW]\ß]L£¬¤\nºUDg%\n4Jo\\\×!:*w—œü\Êr¾8]©TUQ©¹q5U$õ\×\Þò\Ñ3:Ê´™Ñ¨ D\Ú\ÚUt\ÌÎ‰6•ô¿œ\ÂX\å©|¤\èt^Ã¤ø¤g)\Þ\ZF\Û\ßHÃ¹\áµ:ÜŠ·¯¥\ÜSˆ½ú¢\ï»ø[·\×Q!c\×\Ê-\n*z)õÕ«™•\×w»ökm¿\Û#\Ù÷|Þ–Mùj\ÞÁö^ð&z:\Ô\îZ‡\ÝÇ€{ACúù>÷+Vý†ðt©lˆv\å¶\î\Øcˆ</ù—Ù‡{ç¥³|µø~B»\éRü\ÈxVEn\Ñ\Ú,\éø¯÷ö	X6~)üõ³¼\çó\Ø\ä”Zû4%~ ª(u¡=«;zAoNµ9ñ\Í(;;\ÂÔ›4BÎ£eS…k8Qd\Ê?J‘K\'\ë\Î8ƒ¾\×f\ëòoI°tˆ0l\Ì3Dj¾9¼:lƒŒ9÷e~>\á\nS¨\Ù^I%³cÁBi\ZK,£‡¨P\Ä\ç“\ÙÚ‡9Q\íðŽ!g8­dMŸ&!ò”‡·a“f½< a5\àN¢È™\ìv\äA3À—\ÚIÒº8!÷Ž\äzŠå´ªi\Ö]~h]{[?‘Vž\Íx(M:u´Ÿ\éFrU\'øÓ™<ü{9)^…9\ÕWB\í\ÝJµ•h+oE\íz¨ªw]\çZª\Ò:5D©}}\ZU†DtŠ¦…3\"3&\n®b_;\ÉU\Ìf_ºš«\Ë|^u\Ê)\îª÷\ÝU\n„÷f¦ª®\Zºš‹QWF…\n4HŠ\"(‚«Áx§®‘{\Äzw=\ßU±ý5b˜\á\ï‡\Â]¯a±\"\Ì8;½\ÏÇ¯%¹\ì½\n\ç\Òek–!\ÄY~\Ò3r}.?g:\"\Þ\ç\à$\ÏnX½–\\_\ãöÁ\à\ëu¨I¸ð_jqúÀÀ¥\Þ\ïx~\à\Ñ³§¼\n»ñ‚¯\ï\ì#÷¡\éi×‘˜A~\Ô^ˆç¶„þÐ²á¶‚\'{½\ÖJ=u­—\Þõ\ÌR\n«ùD4\rŸV¼*J¦8N\"ö¢bõ/,ƒ\ÅÙ‹G|ƒxµ&†\0¡‚\Ð\ïx*ùtðŒ{BÒ•»Š\ÔE—H‰F]\ÕT™bò„\É\Ýû-\äVºÀV\Õü/ˆ\â\ÄÐ¥Þ¢Ê•J5\ÖÈ£öq³¼6W’Xh\nnû\Ãj²m\èV\Å\í@\â	ö­p8ÅŸ\Ó\ÙT·a\î>\Ë\ã\Ðþ®\Å8v\Þ‰I!°^”_Xþ¾Œ&w³\ä¡8R\ïð\Ù2L\rBu>±b`¸*S5n»ú\à¼7\åB¯\Ìó«\Õ\Ô\nš§J®\Z\Þ5U5´\Ú‹@\å8ƒH\ÚGFGñŸ#¾\ì\×)\Ôu\×rô\ÝÇŸ7yš¿/\Ên¤˜±Q¢½Ü®\"8ŒÎ‰\Ì?a®:«5\ì]±.}.ú\"\îÿ\0“ñAgL\ëyEoDú„7¼	\\.B\\H[Wp\ÇS¸;^\Âÿ\0ª>\ÒoÈœ¨J)É˜{\ï¥J™^Þ¹m»\íC\×ö‡ƒ\ìý×¾\nnKw\Ô~Õ°{Bð*z|·Ž{V^ H8‡\Ëó\Ó\ï,õŒh„²ô\r:¨I {B\ï`Ü÷4Z»Þ‰~[nlpY\åS\ë¹A(Qj“6q\áJH¥,P\Ë \ínƒmXjE•T0c1hwlª{A=—”|¦ˆu\Èc†\Ú!\å\Î,\ê4tJ=Ÿp\Ä-	÷ƒðXº‡\Í!ŒÑ»‡\Í0\å0™\àŸvWžL¼ýöö\éøŒC‡úÜ°\ÈøXu4q­2Bu²,Q_ó~\ï\ÝôŸoùzü5\èv\ïe^(Ž\îðÀQŠWù\ß\Zº_x§«\Öõ\Þ\Ë\Ñt\Õ\Ôð\ê—_¤SQI\Ùw55Õ¬«Gvªj«¨UP(¨Ñ¬8™#\Çñ]7Î§B‹0¶‘3´=\Î\Æwmº¼ù{N™¤§Zõ¦ƒ—õµŠ¸Ê²°Š²\ïQ¾j\ë\éù´©GH˜q;‚\ç\Ý{I¿­|ýè»¿@\È?\ÒGu±[Ž¿\"c\Ñ\ì\îÿ\0³ù\Ãï‡¢§#¥\r\n/\Ö\à\ßujª\×H‰‘³\ÜõI”«ñ«}–ˆ^¶ŸRƒD‰U)ùð\çñ\Ù:\é\ÓÍ¯\È=Þ–\Ü#@«Á\Ü6x6v‘\àB…Qùg:–fkÕœE\r1Ù£\ìù:ñJ6‡~\Ì\Ö\ÛI°`\Ý\Ï\Å04\ê*%f-‰Uk\ì±\é.Ñ»š¬å‡¨Fœ<QË˜D˜¥<¬ŒGVa+ÁJD™Yl+böŽ!\è!/_T¤G«,‚S³d\í”&\Ùð\áÅ€D[2¿ñvPJ8†\Õ\ÜÈ…¡ß²©I\Âw‡®w\ÜA=«\n.Æ‡jw‚w[®\É2<.Qi»\éý£\ë¶î™ƒ²ù\ÜG\Õ$wš‰½Î‹ñ½¼fq‘“q\Ëk“z/e\â¾|Ðº7\Ò÷¾O‡\åe\Þb[Àðy\ÞEA\èTÎ}$®Ä´jŠ…:%H¨\Õ\ÄfR|`ô½\å©Ý®;´\îZÿ\0|¼U\ÖRd.§Bz\Å\ë\Õ\×\ÖRŠRtµ©R<9•\Ì*„÷]\×~9‘|\îû#Á\ïÿ\0\í!œe\ç0\ã.`>/§Z \Ñ^t>Õ¼_õ}¡\Ú\çOwý¶{ŽóXœU\Ý1ƒ@\çw\Ü\ÕWm\Ó\ão:Ã¤™Ÿ´±‡•¡;…\Ãk^\Õ\Üù\Å&\È>‹&H\Ë\r‰øz3Kû>–\Íò\×\çF\ïKiW\àm\Ø\æ˜{B\Ê\ëMÁ\ìÿ\0j)\èkF\ÐðJ•6&tx*9<“\áN’\á\ê•a\Ï\ä\ïzx\Ü9=¬\Õú—fÖœBBŽ´žy4\Äy5’µ\Ç8L\ÛV\È\ÓC\'~\Ä8=—\äH™—R¡C¿\ÚEòöH>w\åŒI\r5~\ë\ë\Ö&· Ÿ‰¦\n=Ÿò¢S·À\ç–@(bd‹­\è‘vH\Ø\Æ\ï‚\ßV“\Èc’|h¤\Ü\ÄÜºCYºO$c\r’´(õ†B>\íah³’xH=0\Z,ýK¦Q\ìý\å_†\'µZY¸\ë\è\×\Ï}7¯š\ê_µ¼\Î\æBe¤½ð\ë¡h¶\ë&|W±´©T»\Ý4\èQ&¶\"¥‘Ÿ\Æ÷•·­7ƒ‚þ\ÝW\Í\Ùx%«¯¤š²•šJÊššÊºú…UYP \èS¢s\n+ù•^õy\Þò¿7¾\á\×F…†\í;¸ÿ\0û6drFFAK\ã\í\Ã\Ñ*g¶Áb\àž\Õ\á\ÐÈŸU­Üˆ)w\ï\\%‹\Ð\"Z»Šp\â³\éU|µ–‘õZfõ‹:u\n•)†õ£\Èü/ ö†\Ñ[f Y÷h»!†k\È\Ù2\ÑZu³vI\Ò7x\ÒHxD{·€\É ÙûOK#\Íi§–v\ÉŒ’ž\rw\Â7|ýòˆ“ª\Åwyc\ê\î\è\ï\ìgcG»\Êl‘µ™ˆ†á¨‚‚y§Ç¤(´;ðá‹´\Zw}ß²)ð:â”‚Ÿ.\Å\Ò=Þ¨±J=Üª}¶Ã®!»GŽCw„x2‚+>¸H6t\íLE,\nqg&\ä–\\f-;\Ö,Ç¤Å¡\à\îJ•Lö$LƒGNž\r\ì\n} V”ž¥å2‹=ª\Ô\Ûuµ±´_½\Ó|Ý¤\Ü÷\æ]\îz\Þÿ\0ri?«¾—z\ä\Ý\Õ$\ê¹);)\×Z‰Úš©}ma\×Ð¡\è\éV)£B‘¶/Œ/‡2¯j¾v.\r\Ü{^\×\ê\ß7\Î*‡s%b\å™=*T*˜E9˜W\Ì3ý‚y\Þ\îd_gX–¸ß—¥\Ò_i÷’òp\Ã(ö}\àz%µ¡þ¥¡\Çþr@óÉ¬;o\Z~p¹gƒÞ—kß­¾\Ô\ÐBÎ¢Ô¥ž¥Bð<8\ncˆ¾µxŽ\çL©*o]úW \Ý\îs“\Ê=i³Œ&mAh\Ñ\Ú3ymžoHõ¢\×\Ò\Ãh;:ñbh30c\Ê\ì\ÒI95D%Õ„K\ÐÑ¬ƒ\Ë\Ú%Àr`=\ä5i³\Ã&!ð\Â7|\ZzFî•˜a£p\Ô\Ì\Ù\"=¥¦\r‹&Ž±hö[F»\ë]R^\Ï-®>\ÃC½TÌ—4 ¬\é•Y±˜÷rY§&i\Ò@¥Žô¥‡&\ç\n|*|H·8bw}”Ñ—øW¸)Q\âRn0”‚Ÿg\Ë\ãr:—\æRÀ\ÅÏ¾×‰\ÃTòºW¹1r\Òõ¿^t\éU\×]§\rä¯¨PWŽ®\n4\é¢®¨¡H\è‘~:3´#y;U¦^\ïx%N¹\äu\Ô$X]M	•&¯«:Uu\Õõ5”iQ¤FddmøÁ\Í÷2\å›ê“±\Þþ»\ÎKÿ\0\Ï®\ÅuD÷x£{?h¡¸ºOVEç¥­X­\'\Åsc¬«©¨c	¾s’ø^‹¿\Âþ\Ï{‰\Ô/¾St•\ÏQw\îk…ø\é]`Zµ\ì¿gù¿yG7;\Ñ\è™\"\ïüd¡Ot*J™!o·™ù\î\æ\ÎÀ™;½G—rCì¨&0j/Ã‰¼°¢ö§@³–Ì™#v/.hP\Ö\ÎxH&\Ù\â‹pOˆnö©\"\ÎÁ»\å\Å\Ú\Ö\'wž\\ChO»\Ã(\Ý\á\Ù\Ý\æ\Ó8Çœ¦\Æ!Ò‰5w‰5w‰\n„…\Ãÿ\0½\Ú?»\r³\Å.8\ÄÚ‡\ä\é\î“Óþ\ì2\Æ\ïõˆN7~±»¥\è\Ï9Ý½Q»´\á\Ô= -¦\Ú+ö}\ë.B\Æ\"azŒ†\ÜñC\ç~7F\åL²Ž\Ï8þ_\È¨\Õ\íLk¼…—0\ä2¥7¡M\éZé©½nµ\ë<\ÛS¢¹\ÙzžÞ‰Á\\d^q›µuW›\ç4Ê®(ˆˆ¾/ûË¯\æ+Â´’V\Þw\àº\ïZôô¹\Ór´\îJ²H\éWQ\"*\ê\ÔI|Êšt¥¥N™™œ`Ž\ã\ßú\ër$^HØ¾lÇ”);\Ñ~·¡E»\é¤>\Õ>\ï\í_=\í ›\Ù\éU)VL\Ür‹:ø—N`¦¡\ÞI¦nû\åi\âLŽ0œ\ÔmGƒH8û²œ\ãg- KhO<¸\"Á˜3°4\ê:ÙœHjŠ5’†uu7\Ê:õ5½\"mB<ù\ä\Æ%\×\Ü%\×\Ü%\×\Ü<¢m&&\Òbm&&\Òb<==Bm&&\ÒbX3 õ¬Çj\Å,²À\Ç\åi\îô\È7xc\ÂÀ§ˆ;\í]-\ÐrŽ\î»Ql°K‡Q\Ä%žm9…˜Ó±(Shògf,ú\åhÙ”0xG=9vñx\"W\Ê\'C¦òºÑ¯ ©[®ü=UÔ¤Z¢©DU¦™ô\íOL\ë(°\èùÉ¨G/\Å÷s›ŸvõNœý¹e]\Ï|]›À²±Ú‡™·.Š\ÚO§24o&\Ù]÷¢\ë>)\ÖÖ£§]\æP®¡]J\Ó#¡B+\Í\ËNe¤Wr\ï\Å\Æ~ß½”W :/wc\àŒ\î\Ý\â»\æG0\Ú>\Ð;\ïC­\è\ä{/\Ã\í^ñ\è\rÞ©*•{ˆ\âx‹;â—«o}3/°nü`­©\ÃPL\ïw•«À!2\Õpš\ï}Q¿.ú\Å\îa\Æ\ß J˜“\É1\ç¶\Ä2Á¹DŸ\0\Ô~N€Î¾6¡.¾\à\ÆKd\Ô<S:\"†?‚]}ÁŒ’&Ë¨xVuOþ§Öº\Ð_\êf\ÒbJP\Î$¥ã¯´oõi\nm\ËOb\É.‘\ÄI:«12\ÃmŸSh—À\ëÁ€)Oº©Š?«H³\Ê	N\Ë\âgxL\á»7}ò4C4qB—(\Þ\'T¥\Ý\Ïk›xn\íR\Úõ4\Ów¿n\åEmýpÐ¢–™¢š§zE	¨\Ñ##ó«\ÚMc\âò¥DÌ©Q222˜\Ê1Ï›\Ò\çz§~*]\ÌË¡mÞ»†n\Ç{‰u\×v¥«]NóRc)\×\ÒYBŸže\Ói”Cˆ£t·^\í«?n-\ãž\Êÿ\0³\áJ‹¾\ïz*y}t¶L9ˆ†Ñµ)V^6@—ˆ{\Å_xSx+\Ë\ÚJ¶«!pÿ\0\×\Òb\rnfLxðÞ‚³’x\ÏdŽQ.]q\ãQ\éÃ¢q¦>Á.¾\á6“øf\Òbm&&\Ò‡ ûDšûÄ‡ ûDü\ïüø;‡vŒtH\ÃŠ¦<¬Œò0)P{\ÄFE‡A\á\nTt\ë<@\í“\È¼<6\rChO\ÐC\îÒ¡Ú‰=\n£½w­\Å^j“\Ú\ë\èWòòü¢KB­CK\Ð\ÖV¨®£F)©Kñ\ëû\æòu\Ì\ï¼ž¾\ä…\ë\Î\Çe½\ïp9‰V™5\ÙO{*ªi2•;³|\Ó\×UPVt|\ïF³\Îó¼Ò¬«#·\Þ\nõOHiˆqRS\êYE¡Fó“·LŸz\í\í\ä\îójd…`A\".šÏ†¥0Ÿ\åp\Ã`\ÚlŒ\ÏN‚ž˜0C.¡§®q!\è>\Ñ\ÈÜ£¼w‰!ù\ÂM\Ý	5ÿ\0t!þ\èCýÐ„Ú„úHO¤„… »D… »D… »~	I	AvUg“P’ðG ûD Á7÷ñˆ{F,2Œ:;ƒ\È><þ\ÍWþ.{°ú\ÇP£\æ=q‹C¿ið ™©\á1p\Ðr\åR«¿|\ïþ¹Ž\']\éEôei^+µ\è\é~)\ÉOŠ%J—HˆŠ•&y\ÆE&DÓ›\ã\Åp\ïcµ;\æ\ê\ßW#\Ê\ê\ÞGBº\'I+\É\ÆýIZ\íy¢¯¢GDý\Z„Š)Q3##&´£ÞºŽkÀ\ìû7q¯mðw8¸\Û\r\íx\ÜôLÈ³°x¦‚\ÌF,Ò©@½\ä¯aÁÃ‹\"\r†LÁ9¨w\à>¦ƒ‡CBn¸KŒe\í,\ãD™ B\ë\æ\Ð%\×\Ü%\×\Ü!¤K¯¸K\rJ0\Î%\×\Ü%\×\Ü%\×\Ü\Éblš„ºû„ºû„ºû„ºû„ºû¾	u÷\åý°†øB.–µ¿o]S\Ã Á«´(Àp\è\É0I4¡M ¾bCˆ)Áÿ\0(Á¢-:2`o\Ú\nœ/.8\çA±»½¿ƒp:\Í\à¡\ìn\×+­½UÖ•z§™£CPŸˆ)¯(«”,ô~’?Ê¥H\Ï\ã\n\Ê\ÚT\éUQ««§YJ²‡\ã\ÕÑ¡D\é:2þ&–1\Ì\Âÿ\0\åú´É¯\ì|<\\»\Òµ\'¹›Zr˜y<\çj}ª]\Z ¦Ñµ<•‘Û—M³\ì\Ø1³8Mú	W`˜0ŽÈ´Œ\Ä$@„Ý‚Œc›@—}‚B\Òc\Õq|\Âm&1±¹¾	Aöüi?‚]}\ß°\Ð%\×\Ü&\Òbm&&\Òbˆh´Bÿ\0¨?A½CÖ”ÿ\0\Î3\rß±„É‚Œ \ÔEò4N\Â\ÉR¢Ñ³D\Ù;…£&\Û\Ðp}•ö­ˆ¢Eôˆ\äUÔ½õÕŠoe\Ù\ä\ç,œ™Er‚W[\\ÿ\0sÜ·+½ñYX¨Œ\ÉM:oõ†u„g\çŸ\á4\Ûñƒ\åº°\êžOˆkh\Äuk$®©MXFsÐ¯§Dó\Ýß¿‡›†ò:_w\ë°ù6½\Äß§ÌšÖ‡šu	ýš\é\Ø¾¾±|3ú¿AOw\Ù®‹5\ã	“žÔ¦Ý·u\ä	”§Oe\ØM¥\ÆKj<¹p`Ë³(‹£7PkHbX¦\Å<˜„\Úm ”ôŸ`ò\Â1›˜\ÚM \Ä\Úffoõ3\ÙzºX!>¿‚m‚6K¬xYú\å\ë†\é\Ï\Þ<*]xK\à\å\Ã\Þ<`9f\ïf`¤\á$²…)\Ëzd¹Œò0)O\âX[ž ûw§\ÝU\è×Œ&w¨Oe}ø\Ò)^.\0\Üÿ\0!\ØV\Ã(û«¼/•}j«À|—¹h«\Õ×¨ ©B\Ô§m[r•\n\Z\Õ+\\H\ÓV\Ö¾}3kM§ñ…I”¥[Ve”©‘\æ\í[\\¦¾ñ^«\Ù|Þ‡\Å¤TW½h\Ò2*4JB\"\"abEEà²¸\\‰~Ã»½¨õx\ÄEÇ‚g}\Þw¥p»];‰}œÖ²x¢0\ä¨oŽ\Øg\â2\å”;7]\Æ|\Ø0ò\é	TpöÚ¥\Å.P×†\ËdŠ_j\Å,‚\Î\ïc\Ó\ZÒ„\ãù®¼\Ü01\ï¶Ÿ‘B1\ï¸zµBUSEœxFf\í67?h\ï.\Ñù:;\Ç\ä\è\ïd¬\È&\ÔE&MbM¤¡¨G´‰µ	µ\r\äõv\å\ÏE\Ñ&²\ísÀÍ¡K	qi<2N¡\à—l\Æ\ÍCxU±\Ï#½\ÆhgCÁ/tøˆ\Ñó\âŽ!g\É,‘v‹By$nYg\nsÿ\0„`\ÐñN\ÈE¨)+>\é)\Ç\Ô¶e\Úö\Ö\Ó÷v1´o.•Í†`™ñµ*².Á¦ic~?“¨¨y¸‘^KN²½\Ún¢VŠ\æ^—»‰Ìª¡\'\â•U\'*Tô‘EJ²…)\ÛñƒÞ›ªE\'¥búN\Ú*«©5%ôRÖš:*+hÑ¥Jª \Ô>‘\Z-6oN\ëzp—\ã8\×\Ö/v\ã¿\í\"®.½rß«B«>\ìu€¦\â2#\ÃÄ¤‰\ê\ìsa	Œ“ªU°\Çb„ÁCÁ\áwÞ‰I#Wí«¸\\±B”\ïƒJn\ß‰\ïÿ\0m!\ì²Ma\Øm¥\Å¯\ìˆ{>ð¿R—Ž\×m\ß@ô¾Jú\ëó\Ùn\èÅžø]…Vkv%¼Q\Ô\î\ì	“ð‹Re{Š>\ÂÞ™Å{\ê™2Mr\Ë8pSÁ\Þ	R©?µw¼&™\ÑjK\ê+pOPðJ¨ütPœ‚dö\ïq–\"\Ó\ä´`”º„´¡˜.zû¿Ø†\Ú Q”±™½h\ÞaÁ3xQ\Zf¤—\ÞmxTþxú“–\rš\ï*5*÷2a\é\Þ\r<6&\ê?•<¼v\Äüzp\î\Ði\íW“e[.(¢‡y¥³$ß­¹˜8zƒKd\èŽ lHÍ‡HL~\Ë-‹¸ñ‹;½C\Ñ\è™^\âµ!Ju\ÊE\æ{`TI\Ìö9ðu…6‡}ªNˆ\æ\Æw}\à*¤\Ïm½\nß«žóah^ô®½‡Ûˆ‘}#Xv¼ûÊ½Ä–ýœ\Ç\Ý\Ñ\ß\Ì[¼–\ë\ÞTw\Ð\Ðt#¬¡N¢®\î\å\ëJ\æ+£\æ\"¡M\ãt)!QN‰›J•aµ‡|_Z…e]\Z\ä‹j«*©¥øµ©”Q:šúº_\ìi\ÕS2<¢ôò]\Ü\ãP\ïq\Ü{\ÈðªsÓ¡KÎ£Nïªª ¢\ëS*G/S[G¼)NŸyV»|‹/”Á\'ñ)0}\Ï(Rÿ\0þñE’\\’J‹+­4L·.ŠaK\Ä\ÞN“\Æ-÷Q\ç)¢\ï»\Õ8S\Z\í÷Þ¯W‰f’ûPôL\Û\Z·ËƒD=;¾ç¿ž–LÁÁ\ÞYýhð$K¸£\Ön–Ž\ç{\î~	o²Þ®\ì-=\áP\áJj\×mÈ–¡7^(\Âg{\Ý\Ï\í? \ßEE\î»÷‚\Êów®\Æõ»¸¢\Ã\Þ\ÖS\'ˆösÀ\â‘\Ö8…¡;R©/ñsß¬;m.Ã·\"„¡1z\æi2Ž­lgH×žM¸B0Á1°oU0n)„geÇ‹´\Zõ\nRº\Óxa3¯\0³1R“œ¾±\Ðc\Ú©‘lH‹Ú\Î3‚x¥JY8¦|á¶…J­s-]ÂºT\'\âŠU\ï\ßUI\Ø-	\î=\èp\Ú÷\Î\å~{*xÁ(w\Þ¯DÞ¤úŽaKðÚ¯¶7SÅ¹E¡{ŸŠ)I\î5¨˜\ëz³W\ÚAûÇœ*ûò\ì{\Ñ\Ôðÿ\0³\ì”{aß´ªñ¨‘?lò…)Ù½·4½\çr²Â—{Ä¿XM‡ó\á\É7W4S?r’ø\ßû™wo\ÏÙ³¦Os\Þ[\ÅF\áÒ«#¬*\ÆtHÌŠHÃ©À\åEP\ís8Ý¨\\\î—rZV•\Þ\ìv%ªDj²Š­:D•*\èQš/Œ^*¢WYY}ygsžO\Z\ÔeøU”\Ê;Š•#´ŠŠR&\â\n^*WjM¡3¾Ï¾F´´›µ\àƒyW±˜zB•üy\å\àm‹½•˜)x^À©þšw/\ÑN\æMƒ\0MÁ\Ýî´®\Ûv\ßeð\ïú¿ \âz§¥“\èG*\ße<§û,þu&J†$V\î3Ï¨T—\rµoz\à	ž.÷•Il\Ú\\Qö<Ez¥VO´ø©™‹>×†~©JkU÷£w\Ãõw”§9GÉ¼¥4b\Ñ\á¡)\r£¯ah„#Ñ†a`<Y±F3öhú„\æ`\ÏLR\çˆpô	¢Vº\"\é\Ö=¡jÊ‹\\‚\Î\ïwªax4R\ÈÌ§ROž\ëu—7\Ò\âzqû<§û>\ëu&W\Z\í†\\\ÃùU“À­}¿8VF´l\è*“}Jˆ½•ˆš,\í\áŽÔ‘”\\Q\Õ\Ü\Zðw¥T›\äQ½]\Í8\È&Qwø©^D‡°›=\â®÷‚„Îµ)6õË¬/Ç¦Ò„©ø†ø\Õ\èlK›“PM\â­hN\Ý/P%©þ1npñw\ì¾O(q«¼¯ZúT¹Yu\ï2Ü·mâ’­zº\×u:—2D´+k[B®›™Uò °†\ß@\Â(\Ú_òG™È’ÐªF‚®ó\Ý\ê¢gž¥umRE—Z¦™\ÊdJ+«\Ù13½¯w‚‹RgJ\í‰\ÑRûø;]\îu5»nZ·\éH»i\É?\ØVÇ£XS\é\Þ	Z“~±}6„\ê¬Þ¤‰®±³8,Ó¶\Ý\Ô¢¢}xG¼`“+±d´½§«\\ÑÝ˜lLÀXð\"(\å\ë2\'c1\r¥’Ç†\r\Ãø¡-œ³`>†\æœŽ\àP\Ð\ÐQ\Ã@8\á e\ë\è!\âŒoK±\ëœI¯¡&¸¢\Ôa>£)X<.VZˆ|›\Ë>M\ÔÁ&\Í>¹D\ÊXÜ‘÷ŸNÝª@™E-¤¤\Øtœ˜¼\ï£­J\Íùj$$ôu\Å.@\íOgu¿“+\Ø­\àq»£<„\Þ=©R˜\í\ÙZh)rŽ!\á²dö\æ\"§Rƒ¬pÜ§\Øs=¬\ÅR\ïªOz/\Z·Â„É©\ázz\Ê.\"“ò\n—\ÆW\Ñ}Ü ðXó\å\Ã\É%ý®sºªŠµ\à÷q\"N¡\Ûx’\'*S\Ðu/§\\lÍª0¡©öh\ì(¾±Bxx·\î\ÃbÉ˜;,ò¤q\Ø\â{\ç‚w±\â¯o^µo\Öò”…(Š\\†î”™£n¨\Äj\r,m‹)õ6a¼)Só$2a\Ñ\â8a=\Z†\ÐðT”¢\ßPœ¡ˆ/­T\Ûô±\êˆ\Æ\ÏKû\Ê\n=X“¢F˜Ë’>\Ý@òŸH„P`\Ãd†±¸B-X\ÇCef,Hy:$i	!’ahd b\Ìðx%T¦K)ú\ÈZ]÷¢¤\ß1Àm“(\Ú.ûú1hqG^jñ\ì÷Ã­^2(Ù¢f³ˆw\æ¸dj“\Ì\Æ\à¡\Þð³³©\ã¬nü-K6\ë(¼nówªUdBf\ÜM\è\nS¨\× S\ê\Ä\Åðˆ:¯â·«ÁUôûÈ¹\îo1¯;’¾…\n—m\Ðw§v¼)];¶\ëª\"ó\Î\È\ê}Ò§_N‘\ÇN™Q\"e:—\Æ*\ÑS«£]T½\"”5\Õ4¿º¥]M:ŠÚ£\ÅYB™–q~”®÷\n4W²÷»Œ›\î\Ó\'ó‚#&\"›>Ê’6ý\\\ÌR\Î\Z6\é\Ç(\Ú\Z¨4C\ë\è ¡\àðQeM \ä\Ð<¨\à7Këµ¾õx\Ì\Ög\n8ƒ\ß\íC\î3ß¸¦b\È8\ßw*º\ÎKw‚ò\Ý\èû@•*›¼üt \à«W~\Õ^/´Gú\ï“0]ñ\Ã\ÔxF¯ß¦n\ï¨w¥Uy\×\Ñ~\ìNU\ÜP\Ý\î{\Æ\É\æ¼Á\Ú\ï½\éÞœ5_‚}G…¬Š!\Æ.ú‹Rboø9„1NÁg\ê\n(N%T\Ë#{H¶Ia0<Ý£Vc‰™´\Ì8‚‚²¦JG·4)w»Ÿ?e\î‘F¾ó³Ú¯g\Ã\Æð\\{Žôz&I¿^…¹˜qLF\ß\Îw¢—#¥ùÀ_«~Šw}¢ý\ÞË¿’\Ú\ØÆ¯À¤o¯D\Ê\Ð\Ä\å}\á\ït\ê¹qyÆ¢ö[©\ãLC\Þ.—®¢‰\ë§)ƒP\ïQ?ü†0\ÈE\ÑvlY#<þA“Ë˜^K¿¼©{8\Ë}Š6\ãŽ ûw¼>‰\\÷w\ê\é&ZryÊ¶ƒ¹g0¯Óš\áV\×\Óo£s\Õ\Þ\'ù]ºu´\ÙøGB®‹L\Ù]›œ\å¡N­\Ït\îûš\í:j\ë)yõ”®\'rgZ\Z”ÿ\0*©hœ\çñJfDYN\"\nTiÑ¬}\ÕTÐ®WJEergMMaÐ®Rt|\Ò32\ÍkL™1´(¬»\Äõ\'@üê³¯»¨\×y†Fló|Êš\'”M3\Úø¾M*e+š÷…u¼_\r33nS¶ð)ð¨I\ß\Ô4ÝŒ±“&(Ë¬©¥d”Z+µ$ó\Ìx‚ŽWò}¥J½ƒ2\"ÀQJ>yÀ\ïz^‡l~9Œ`}\Ýûžn·\r\ätûB\ê#÷_µû˜9ý÷½\nŽ·—Ú«£Ì·\Z/¢ž7º\îã»—†8£ý \n¬ñÚ³B0ò\ç\Å\à\']\Ìr*\å\Ï.®\Ê\ÞÃŠ\î¸ht‘‹¤\ï»ÿ\0`ÞŽÛ‘u~\ÉpW/z=^8o\ä»_û4pû|?Ò…À°ºW¿-qð·Q4¿h\\3þ\æ‡-øº\ê8¥\Û{!\ÈÎ–\r\Þ(N\ÃO\àŒ\Ø4dô³°‚”\íŠƒ\ë“zD\Í\×.1\ZxN?Ð½\ØxqE.¥ÆùbúEð_@\Ê·ƒš*žR}‹ú)\ÜÈŠ!\Í¿s\îòT¯%n7ºô;	r\æ$\ìö“§˜\Þ\Ü\ÅþOikGŽ\éo•÷]ñÇœ—N\êò\ê\éq¢?e~Î¸hG»\ïûI¸Ø¾’Š(›„‡\Ø\î`\'Tõr+õ\ßz»f\Ä¼Á\åó\Ãe{oÈý#0L¢\"\Î\Éûþ&\Å\Ù\äyË«\0«\'Ž’y\äw¨w\Ù’ò\\†8L.W0oEU]]\Õå»žô¼\ÊñW)ª@\äp?]Z\än¼o\ÊúÚššG\è+\éù¥J‘Qôžoø-!X\æ¹\ïj\Îk?\Ò\ZKª.e:¥Wy	œgEm\æe7}Iú3¬Œ4®¨\æKIIUV\'P…{\ÝB2\"e/K]T¦£\Î3<LP,w\Ñs¿\nª•mQTVzg[Òª‰™Ó¬@¦“):ºÒ¡Hˆð4ˆ\Ï\â\ê£9\n²žB¤M\Ôo§òõhV¿\ÊUÑ¢QQ«ª\"««£D‰Œ*4(fA\Ðð´¦W$òËœÀ°\Û\×h§„IT\Þ\áo¤xb\rn\Ó‚œp“U\Ò4P\Ã(\áûRTúG¹™œÅ™Þ½R\\z\ØX6§jCð~\Ëz‡—¹\ï5|[`\\¶\Â\äö‹zý\×\Ýtž¢·5\ê;\ßi”\Åã \Ãu\å=\áuÒªSó£›X½®¾ž\Ët¯·‘9~®{\É\Ó\ÜRùBl\Òe\É(, \á‡À\ÅšP›<“\ë¾^Ò°\ì3ö\Î¾Z•<o\n\ësñj\Õ\Þñ|4û¿xŠžI\Z‚\ÛnÇˆ±…	\Ý÷\è©<v\ï¥X?;\Ý\Åp\ÞOh\ßf\åEû\Ä(\â£eù¡Mðº÷=\ê–ò+ß¯:\ïz¼Y+´>%Ukß­¨cŒ<~\Ð]÷Z¥?1÷tyL)x\\÷Š§¥Òˆþ\Ì.“L\àS­÷\ã‘u3)\äl$	”Ï‚h¦ˆ%³§\Þ\Û)dÀ\Ñ)i.Át¯\Âtûß°WiŒ\Ã\ÉÞ\àôJ\ä¼-\ãŽTK¸[©\âz‚d\éŽÊ4\â7ð•+Y±E¡Ww×ªObxqTL\â§Gò\èRˆÿ\0²‹HâŒŽ0\è¼\í\Åö\ì@õI—\è%ªSW‘›Y!ü[TXk(lA\ìœ÷c½¯­?h¤;žõ\Z˜\ÉA(Qµ<•\ì,.ƒ\êˆ9\êZ£%ö\ØN‡4ù\çh\Ä\Æ\r\Þ.¹0þ(-Ÿ¢>\Ã\'‹»#L2\Î\ÜQdc;ò	µ	 `³\ãšr\Êx\Ël\Ãr\æ\Í(ü^ù„#rƒ\Ó¡4\Òe\Ä!\Ñ+LC\n9c\na\Þ&\Òbm&!„6&·CDg\Ã+´.û©L‘\Øu\Ìöy.\â\rN\çJ–V6\rÜ—L\"³17 j‡s1\Ã\âû,3ˆ4Z¼«»~¥ô«¸&·\\£ÿ\0ÀmA¨Ž\ï?-ý²0Z,\éR\Ø\È\'\ÞtQ\Ä_\n-V\Âl˜ZYL;M7‹±œ“d½QQKÎ¡F\ï\Ô%3a—\éPW×¡¯&þ\rrjEƒ\âÚŠG%\Z\ê£<…N‰˜¼\Õþ©{_ÿ\0¼<x“\åd\Ìó\Î8s½=•Lñ\ã>\Ñv\Óþ£\ë0š†ï‡§„3Œ†\"\æL¢,ð\ÌŽ\\™L\â\Z&†a,\Ø\Z \È\Ã4“H<¸rõ­Á¤n\Òa\Ó0dQc–\\Œ0YK þq\å\îŒ7£<\Ã33É M¨I\Î<³\Î}&\Ö \ÉYi‹³\à\Ò\ØJ:g“$\Ñ\äu\Ä02B•°\Ó+M¢ò\Úø\é\í\nx‡„<P\ì…00\îR\ß+p\ÄØ¥\Êa\Ýó\èKˆ\\?\Òz]™\íøx}¾ô\èø´©¤de”¤/‘#©ô)\×;>‘‡úJJ\ÔVV\ÖZ\Ö\×R¥’Avýe!mùsa0\í—~Ûƒµ\È{ˆ\äÀ!\Z\äa1öF\r¸K \Ø\'—;CY†\Ö7xtDCwžS`ƒb‹!\Ð\"Ÿ.h˜z|š„!\Ú†žq\'’ð?$Á\Ã±ÛžA>±³\çÅ¤l\ÑMŽ1´j‹$:D\ÝQˆO6˜úLK¯¸Hz´x®¹õõ\rÜ¥gV‘F6…\rM\à{ð´OX»5‡\Ú}—kC\à37yøC,ñg\Z Ü ŽÏ§G6#	\Ô\'ð±3.Yr\Ñ\riùÕ´®\Òw…a±Ÿ„÷¯¯zù¬iþ!,\"l\ìø¹\Û{\Ò#¡L\êSÒº—\âó\Ô\"YL\ëµiš™\áN•Gü R\ïQ*F\Ä\Æy# \ä´\îä¸a9°d?„i m\Ú!\Çq‰iC0“Wx‘V‘J?\ã	õ‰´˜,\Ýb\æ\ÔZ\ÃòHq™3„$\ë\î“¨C¢F8a\ë\îQ†qÓœ0\Ë9’Œ?Š7}p”G‰½­3\Ê\Ãø#„\â|=\á­\ÙôK4øœis7ˆ”ZN!´\'Y‹;[\Ò§\ÄR\å‘ÞD‹»uDÌœ§S€\â\Ë<\Â\î¹j¨z\n\ë\È÷w;\×DÚ¤‰*kª­/Á¥øT\ÕR2i1¡:4µTj$OR•5Me\n¤\é\ê\è\Ô\Ô\Õ\Ñ/\àÐ« DY>.~]uÔ¼\Ô\ï\×b—œ‘][D¬õ¤Ö‘R«¯£F‘\r†A]Me2¤tW\æib(˜\É\Ù\ã\íø\ç	¬ø\Ø?8M \Ä\ÚO‡¼Oƒ8ŸA	5wˆM«\à´h´h† Á\ä\íÏ \ÂXK“†±6“\è.\ÂƒFr\è/‡L2\à\ÑÕšL\â4\êº2L!Ù„\'1!\è>\Ñ\à\Ã{f\"K\Ì\îÌ‹6&´DÔ¶¼AI\ç’J{;XE\Ó0¼j²Ì­q.<‡¨&Nq¶L8Sò½1\Ã|VSà®ª§S®‘\Ò/8–¿iÕ­xV\Ð&\":³«S@\Î\"ek#›\â\êÿ\0ƒJ/\Í2> ­RJb{ÂŒ¯EEEE[Ò$K(4‰”©Šƒ¤\íˆ&Qòûp\Ä\Ù1ð\È3ŸGÁ–<†\Èþ\r}ð\Ð\ä.ŠB,=bmBEIT²fˆ\àR\å˜g.Ÿ¨\å.\Þ0\Å\Öc1ÿ\0j\Ý\Öø£1t‚†¹\ZcwÙ)dú\ÄV©­Ó¡CgÏ§\í<\äø\ÂˆIJ\ÇNq‚,š\Ìf.‘J:OHÏŽ\\Ö¤\Ë3$Í‡`fž¨Ä¹c\èˆ<¼RefÀ”Š3ƒq‡l\Ûsp°9VTú™Rû\ÇH™HŽÄ¶»\Ñ:(™R9	Ôžª‘HFT¾0¹·²…IR­p>T»+”GR…\ê\ÏðÌ¿\'Ó§\"#9\ékÁ’.gôst‡j‰¬1v\ç\Ð>M\Ý\Ò:»š»\Ä0˜„\"„¢m&!“#Af\ëšL`‡P‡P´xn\ì\àÛ›^‘ƒjLqÀÄ„bX631ò™0Í¤?(†¼A2w†Ôše–ƒS	Dùq\Ë\Õð\æ.‘»\Âl§8ƒb\×0-Ÿªl\Ê,ð\Ô´C¬n°PüšA\âðˆ“3r6µ¡2ŽˆFN´d\Õk\Þh;\è\ÈgJ•\"*4ZqFf·y$N7CµÐš‘\ËJ¥ÜŠ¡%8ˆšeUñ…óL˜ö”š\Ç\âz¹««\\\Ô\è<=	ÿ\0\ÂU\Ô\Ò \íAº©\ã›u±†n\çD\ÚGwû¶\ÜV0˜úK\á8j‘„?WÃ¢\n\Ø\à\ÌAQl§?HSñ\êÁ€¹>6\Í(LŸe+,\"\Ê7~ø\ÆM]šÆ–Ù§\Å\Ò$\Ö]£§&)Ž|˜\ïeÁ,\Ò\ã\ì\nT\'÷“§oCbÁ$ûªiôDWœýÁžl<¿š»þ\Å\ÒC\Ê§\\À²Aüè‘¤\"\ÇÕ„)PŸjÛ³\Å5\n*0·-B\àº\êª\èV»®\ír\Û\Öõ¥L\éS\ÝÚ»;¶…KJ“Î¾¤£a1¹\ã\n\Ô\Õ\ÔJBºªÄª(R’BŠ\'W[@ÿ\0\ÛP¤bù]z”P¼.\ë\Ù\ä\ëI]A§Fµ*šº5\é\ë\Î3*U5…œ)sýRºÀ»ú[4±ˆ`1œú~\Ê]„$j\ïþ\Î]\Õqc—@8a\×\Ô\Z¡§4™C\Éz	^R¥’|Cm²\Ä1\ç’x„†ó”K‹r\r\âFòr\ç‹FI!(”´˜Shõa¶\ïý\Ç-\èb\ê ›£{HcŒM$3	5w‰5w‰\åfq	µ\Ê}c7Q\å\Ð_b\ê\nO\\\Úð\'}•\åaÛ™¤Xí´œžRh½\\\×}e%Wš°®Ã‚…2&±Ê¦…7»É§D©y\ÏW­&±•\rŸ\ã+¯}ª¨Ñ¦ò\ì¤\ázP#ü2º=*\Ç5m\"2iúT‡J‹[þö/k¡F\ì­wDZ\ÂcÏ f>‘&%‡\æ‰KIv	KIv¡8>\Ð]\Z¦³.|c ²`l’‡“YõNÞ³>ð^S\Ë\êW/µ˜\Ø\r\ßxü\Æu¦õ\Î\ì¦ô°&òþø:\ï;¶rDºy\Ë`‡p=£;t–°E\Ä,\Í\é-.{Á~8\í\åI%Ö»x£Ù¤XGQö¡\Åò\×ÓŽ\"	žg‚W¢u{”\ÞP§-=Áöÿ\0LM%k°\á1g„½m\Ñ\Ø!6±«$òf¹\äh1&®ñ‰\ZC«¸g.‚ø(\áoXMhOjÛµ7}\Ï-¥§\'q\ÄA\ÅA}*÷\Ýõ½Ë.ôI«ÌªXô¼-:uµ´˜eBªª*TŽ*4H\Ì]»žç©«¨w]\×B7mM\nª>m\nu•5Dj\Õy¿ùÅ«)VWS3Œ\é\Ó38\Ï\ã%I\ÔQ*F÷w–%3(\è+ öMQB•˜Îª¾™g	\ïx\íN+A\Æs\èŸ¨I«¼I«¼M \ÄpœM \Äp92L¤d\ê\é\ÃX´;\ËFaö|”\Ù^Lf\Ú^Yx\'µ<•·m\Ä¸zX4\â\ë¨T\ëy7\è_eq—P³¼6¥>0?\Ó\Î]}C‡»×½NBß¬E\ï)µ´^{-l\ÛcX\Ú\n\Õde†\ÄdA2~!\Ã+nÅ§+E¥ÜU™\\Ú™€5°\î\r3‡”O „š»Äš»Äš»Æˆ»D›4#i“6	»p\æ›<\ÂXò÷\Å\ÒA3½º›.0šðV=ù²aˆŠP›œ×µ\ß\íg­E#¸(•\n\âv:k¨\éóM§Tô~TVÒ£Fz\'†‘‘|dúL%b\å55O\n´u4Šj›Š¥5•T\âó©UP¤Âœ\Âjú…	•\'#ÁœdmÀÁû3Ÿ@ŸA	5w‰5w‰5w‰5wˆh\Ä!5\äš\\\ÃFD\ZQ´û\'6/•K07; ÷\Ë\Ò\Í†(û\ä\Æ-S6a¸<np!$XqÅ I	˜\"waA¤5\ÌJ’—®â‹¡ ‰\ÞðTi•µ}µ³½\"\Ððwªz>ýuk2ô\Ø\å91u	O¢<©º\Ä0>Ñ¼a\Â#\ÈQE\Ó(ŸX‡D!\àz>š\Z£‘JL“\Å+W;ŸŒOt.\éÔ¾/mA‘™?*U:(n\Õ8¢¨¥[@Î°\åóÈ£6‘\Z4h\Ñ*4(P/6…\n4HŠ\ZJ*4HŠOŒ\èW\ÕRói\Ð6‘ô\é ¯˜¹IFRC¬{Þ‹œŽ\Zµ´«\êhùô\ßWn‘™P«xP¡DÎ\ÊcJ6¶H\ä\Èxò°K\Íø%‡\æ‰aù¢X~h–š%‡\æ‰KIv|1\åƒ$Š!.›‚O\è6iØºr‰-Jp\àœyg» iÉ€úp‚Qº\è\ÌBÅ¤H¯I†H\Ó\×+¶,\Z1ˆ\Ô6B&k‘£N¢\Ð!>°Ì°>±-fj\ç\Ð%-%\Ø:ûÉ¢-«£~ýAB\âLj\é•\Z%DŒ\ÌÎ“ˆ™™œÁ\"õ5uw™ûZo»\ÈuqÑ©P¦…ª…#3:U.tEF¤¤#¦T©0›ñ­U}E3«§B‘fcI­)\âñ\ßP¡•5O\Å„“VðGR²EQ¯&b„bm$\Õ\Þ$\Õ\Þ$\Õ\Þ%¥\Âˆh–š±\Ï\Öh\ëŽ@Y¢\×#‡‘é‰³„ÑªÑ€f\Å&\Ã,c^)d’#8~h¨\Í\Ô`\ì“GÀ›\ä\áÀ,\æiz:¦u&\í·¶†šå‘‚&³8†\r3‰õ‰iC0ƒcP„$„@™g\Ð(»]©\ÍS\Ím\"w;\Ñ}dù6¤Æ™‡]\ê¿\Ò\Þ^gQ#[VUE\ç8®…zšª%YR\í«8žOz)\Z\ÅÕ¥\ç›L¨Œ\Úf\Ó\ÂU¼*ª\éÑ¤þºnÕµÕ†T¼\Ê\Å•µ\è)\ZGøuõUM\"“\Î&\Ê3H„\"\è!>‚\è!)i.Á¼vGˆb’H6r×†!¼G,xº¨a|†R`‰Di\'\Í‘€\Ê,¢Î¢¾i\ZR³(i/K\áˆDñK\Ý>6˜;:‹Q\æ”z&Pv‡\Úq\å‹X\Û\Þ1÷h\Å- ö†G\Æ@þI£¬6¡D5’|YÀ»&\Ï³‰5t$\Õ\ßðI«¼JZK°K\Í\ÃóFŒr\Õ*Ó¨\'mâ¨½kI¤Mw]ŠŠw4ŒÊš\êuTXM—\0i™™œ¦qŸ\Æ÷ró•Y\ÖR»\ï\ê¤Uô|\êD\êž2Z\ÊTi23ªzÔ§¢ED\âô†fFQ–r‹´&!>ñ)\é>Á	õˆM¬ñzÁ‘”\ìl¥+&\éz…IY\Ê‘(‹þqŠ,\àž/	L\ì1t³¹\Ê\ÔB\Ñ\Ä÷M8\ß\Õ3)wHÁ¿ª“H\å6…;Å­Ù¤D½˜tM‚!¼C¥£ñ¨\Ã0´\'x*(²·H$\ïyzð \á³™òFböclŸôw”p_\í¾aù¢\ëh?°\Åû½”¨Ÿwœî»¼Ž™•\"£j~\×q7š‹J‘U! \ÙÈ©cø\âø]ªªuŠžNEd\ï*\êu•uDôKD–º\é\ÖSªm2¡A\àš¬Í„m\"a‘”Fž¶‘R£J#£J*&T¨\Ò#6Ñ¤F\Ã*D\Æ0\ã	\ÈI«¼I«¼I«¼f>_\Å\è\ÇV ¢5S\ä\Ð6‡‡T­s%/,\âÐ‚ô%T¤ó°Û Á\Ù\Þ1ø(a`÷ƒ0ã›¤\ÆòX\"“A¼\ê9ó´¥Œr}€\ÊÓ‡WpoKˆ\á \Þ<ƒhxFR\"œFñ=&?@ð\Õ\ßƒ£·¼{\Çg/y;\Þô©T·rDp‰¡2‡z„¶‰¢·5\éŠ V~ü\n?\Åø>MÓƒX\Ó.x‘eƒD! \Ì}#,z\å\ïE\Z5Ä®ÿ\0\Þ“ò³\Ó~1!COƒ»hÑ¢\Â2 uh\é\Ó#¾{dg\Ç7\ÕÆ¥\r\n„\Õ\Ï7“\å\ÑYTTý7À‰EÞ£@\éQ¢Ó©­¥Jª›\ZTk*\éQi°C¢V„$\è!&®ñ¦.Á)\é>À¤\àP òQº¦$8\ç’fŸg*³[¶l\ÑI„\ÂeU™&–IY LV…Q”[t\ç€&P¡ñeÅ”&e\àzK.0™—\è\Ù-°6\Þ*U3WI…$\ïÚ¢<>P™Þ¡Ì©/ó\à¥:u¤Ö²\ßV°¸pö…ðT­M»ngQ)\Þ7\é?–!³Þ‡¦@¤¸\ÃÐ¬¿!\Ä±\àô&\â\Ï<‚\ß`T¨§]¦FeBP\ïUfI¿-ú»>3	”l»‚\Ã`]Ÿ\'\í›°K\Í+®xd¤!p8\ÓZ\ß÷™\ãF\ï8QœTI\îmm*F\ÏÁ«¢Q\Ò9ˆŒ\Åß»ºª5.\ëº\åu¹UP\"*4:\ÑT\"©\"\"\"\"m\n’?ŽnµþN…E:n×…;¶úx\'©¡[A+µ\ä^™\ÕX°™\é)U\Ô=|\ï1†\Ê\'[Ka\Å¤gúˆBAD3@³¨\ÚüºÂ‡‡JlC`C1÷ƒô\é\ål7}¨› „1›O@³¨\Îa7\Ê÷\Ò\é6,’\Ë\Ò,\ç6\ãPùI@\Ãcc«(\Ú%4¸Ë±Jw}\ßJ¨\ÏÆ¬]ª\\\0Û»[¤Ñ¬m¡½á¦ŸN^‰‚mžÊ§\Ç~±\êtús_ÁÙ¤\Ä:$ia!6ƒ\Æ\Û\Ö\'\ÐA]÷YB\'\'-t^Ž‘\Òb\Û\äù3H\éR\ÂaR$nºUôåŠ™Pˆþ:\Ü\×òrT\ã½\Å.‡šsˆ\é\'WVuT©P¥ù4\èy\Í#\Ä/Ó¼4(\Ñy8\Õ\Ðt<\ë\èh(K]D«¨ e-\n\êªEH²ˆ¹ž“\ì\Âq	õ(f\êø!£ „sN\Ì%¡‚öD$i\Ï\ä’1Ž-Z¶vH\È£\nhÙ–>¡8—û\á/ö=\Ãx\èŸ;\nX†ðY\â	5‚)ñ\ç\ÃL±K\ÖZ\ÇvX£Ñ‚Qœº1\Ï+LB`}¢m&\Ð`\Ù\Ì1­ig´ƒ¡#\Ñ5÷šö*Q{¯\r\Z¼â«¤ò£UAÈ„Ì©R/9\Ýwª\ÕRd^©|v“7~©Zªû²\ê7%ôt&¤\ÚoQ\Ö7Cæ®‰6‘\×:\×\Zxj\éµ”G§¨\ÐÒ– \ÆG“¼Kýˆ—ûYú4\Î;3J!	C?\ã\rSˆL2G\Û(\Ð\È\ÈF\Zx\â(ñzDú\Çu.Àm)ŠH0cdmo‘†\"\ÅL\æ\î&vŒ\å\Ð;4˜8H\ÑÇ®q-f\è!¦.Á#0\ì|¼Ñ¢Qry{B\æ¼uU”\n³Ó¾yô.‹€¨Rü5!ù\Ê)™´¼Ú¦NA§\á?Ž\ë\Ò*©ªReMbU‰k\èeB„\ÕôN®º¦º¬ÿ\0]:³221^ç©¨¢¢\çÞµowõÁx‘þ7\ni)º´è‘\"+“\ç•*UN‰\Î`¦—Qh\ÃóD°gûPÞ®	ÁÎ§£>!‰XBhniD&’\à”*›>\\b4\í9¡<cv\Ê$kŒBp{6¸»£)ŠCt\Â1.QŸN±\Í&4Ëž \Øõ\Î!6¡)\é>ÀQˆB0\éq»*Tõ}<÷yÂŒÍ”^‹\Èd^u#6Q)\ÎB\"‹–€Óªz\Ò:o[\ÚûOTU_h/*\Êf½\ãN‹\n‘\Ñ/0ª\êü\æ™U\Ñ/^—ôy\é+«+(<\î\Í\á¨a®º÷‘-\nt]\ï„&qeU*gF‘E\çP3#\ë‘}\Ò\Õ%¼NŠúš—…õ…XZUtkS©¨­£ø5•5\ÕTŠ•)K\Ì]#DY§ñË€B\rfÎ±	v‰AvŽ½Mo@”\ã1}Cv„\Ñe¾£\í¿Vƒ\Ì<¡›/^,ñ‚\Æ\Èf²|é‘„4Ëž2ö\é›P„#j\ï„B,\çµ\àE\é\ë½:\Ç.ª\ÖP£N’\n5$i\ï=\á«ü#\"¯z*¦u\r„th\Õ\Óþ|t\ïMEEE*õ7\nµ\Ò\Ú\Ã/=ub\Ê\Ê\ÚUú*…uq™0\Û,F7X†\ÃóD:$iü·ItJ\Â¤þ	u÷B1!h.\Ñ÷Cxÿ\0c&±!i1.¾\á6“ø!7`8i`„ý¢vO¬I\r!Œi\ä\ïúA\ïP!\ÊWqRó¼Ë¦™SY\æ\ÆñP¥\àdÆŸ\âÚ˜\ÙÙ›\ãþ_\Óþ¦ö\ÔÉUÞ¥ÿ\0”6xòÀÿ\0L\Ö30‡LŒ1“Wf±H!7`„ph\í\ÒCL]ŸœP`„\"\Ú7š0\Î%-%=\'\Ø3H\ÑoÁÙ¤ÆŽ©‡f“\Ë\ë\rlPŠ-9ôÑ¯´r–…U?IWG—W<¨\Óþp$1\éøÿ\0•\çI¥^toIÕ–\Z>š\îXq1£Hf¶g\Ô3H„Ý‚4\Çn’˜~¡Û¤„:%aO¨I«¼vi1-(fÿ\0b$\Õ\Þ%£\Â_\ìD¿ØˆM\Ø\ZX }\âjq¨Šht†Ï<„$\Õ\Þ\"\Ò}¦\'P\ë\Æ\ÆtŽY«©­£]E#©\à\ä:\Ê-a\Þ~=„F\Ó?\Âôh(·\Ç\Ô(Q#3¥H¨\ÄFg‘5…€^\'5\Ó|T½\\œ«Y_\Ë\ÛuAÑ¤ƒ\í#¦¶•uå«­¤EbK\Âui\Ïþ \Ö\é\Ã (~QŽ\ÌB\Î Øµ\Ì\n\Zð3$¨vf”Ba	\Æk&‰ú\ã•£¼K¯¸K¯¸K¯¸K¯¸g\é!	„ýs2ç†À³\á6.Ñ¼R†qDC\0<…\ÐA7\Ýs›bHó^“­cŠó¯§B¤®=ü¼4|ûb\ÊúT}\Êö¥WF­E2*³eiy´Š™\Ñ3#c##i‘‘”¤d¼\Ê\è=)£\çG5\Ñ=n\Ï.i¤ók]\äôS\Ð\'õó§Vdl¢\åI^Tjd?OYF‘4¨•z\ç¡&½‹\ß\î6´ý\â÷f¡$4uN1\ç);3\ë\Ç\"ÀCV1«ÕŒA‘=¿¼O«´ukc:òZû\å\Ò\Ñ\Þ%\×\ÜwEƒD]\Ål§!aDRbF\Æ\Ç$²	™\Æft\êˆ:dƒ\Ú0I×œr/š.ý—‹8øzå¸´:¾\ì¼\ã½)«y\áptnõä²¦‚ži\ÜduFUh\è#£h½·%5QT,«/Ã­NT)‘Ð¬¤l2a\à?Ž\ï?0\ï»Ö¡\Ãsnk¥Sòñ>•B\'r:³­®¬¤\Â3¤gF‹‰¦f/‡0\Þ\n\ÕT¹Ö¼ªœ7!\Ã\æÑ£J\î\\ª–\Þr\Öù‘RR¢¶•*\Ú\Ú_—[YJ”ã’©”»\Ó&¼wz\ïÑ½\È&\"3¥LŽL$z‚˜ð\ÂA˜ºDRO®`\Ù\Ø]$eŽ8igBp\ËD#6\É\Ñ\Þ?\'Gxü\ã«[\Ð?+Gxƒ|£û¡.±.±œòÃ¤h3¢-b\"ÙŽ9{ŒF¦ül’s\×8\ËF™A²hq\Ýôñ¼x\ãÇˆ‚—Ã½=©M\È]oÃ ]›\çwK.õ\æ»kè¼œ/\×\Zót½Ýš&GF•\ZD~u\ZTLšFQ‹½q~ñ/·U\É\æ\åEd7\áU*´?˜ŠN¢\Z\Ë\ëü\Ú	n\ê®óÒ¥®:”Íµt¨™•Xa°\ÈÈŒ©Q6Ñ¤FM#£H¢22ø\å\í}/\ãý\Ýv.£‰5bÇ›\Ýè¢­2zªªº>w›@\ë½-m9(Ñ¢\ÚFf–\\¿®y]L»Š‹_WPü½\ÏzŒ\êž\ï\ê<\ãN1Ÿ\èªHÌŠSi\Érnú{Wµ¯Ã¡¬úx‡/¹rðNVb\åÃ¡\Ühð\'K€^7ô™5»ˆ 2a‘“\"d\Ìa¦!\ß#™2³‡û¯†\Ð\ØM\Ð!`ü\ãòG\ä\Å\Õ\Þ?Wxƒ|¢]}\Ãû®\áÆ\çT†ó«&†õ“_ÁŽ\Ö4”\ßQ\ÈÙž3õ…7ñ\ï\ËÅ‘Ž\é¢\Ç\æ\ßPŸ{º¯sÍ„(w³t\\øA\Ö	?beX¡KËŽy®s‘4\êÊƒ¹}bš/k\ï\Ë#«¡D¨%u—\à›Á\ÛJ£ÁiR*Ê‚e*štYJ…739U{Ü·\â\ä^D\ÔTºŸ\Î5TT§¥ø4Nµ\"º£*\n]\Ï$§H¨\×&QB®¾¦Ÿ\àÓ Gñ»ß™|Ò¼	ný\ÙtP2¡\éiÑ·>^¨R¤•\Ê\åKJ•\ZkÞ‹N•]]\å3a™*|=\ëÔº®Cª;‹qÑ¯£J\î9\Ý\ÆL¬\\¾¼¨\Ñ57Î»ò©™0‹ðh‘0<”Z$Á\Ø\È\Ç$“<\Õk\æ3¢fFEs·€œn†`“²¼Ž\n‚ûZ\àEH\ê\âg(Ì”\Úe0x¸/½RW’E\ÖÈ™ °”B”A’· ×ŒOlÿ\0t$=\Ú<¥\Ú1G+1f”jšFd”z®,£ò¡œ&\Î\Ó\Ç@—YvN$\Ô}¢C\ÑK´B‹P’¬O\Ñ\Õ8—.	ûB—‚ý\Ù\'”&¾=•È“\ÜNYñ?…œ\ån\Û\Ö/ju·\ÙW»\'Œÿ\0Î§¾‘&¹»\È\'N¡Aƒf6˜£x®Em}\â¸O\å\åO™­\\¾»z\åF•\Z¥\î\å\'WYMøL\Ö\Õ\×P#2üZeNÒ¡I74¹-yj\ß.º•h/g£I{nCøêŠš‹»{Ü…YY^\éz¦36‘*º\Ê?…B•*&ßDŽ‘\à\"3=)¾ùˆþ©SxVTVýš¸NŠ\Ú\noE\á]FÒ¨NIha:‘\Ö\ÒaRT§\Ñ\ÕQ)<\êL¢k/Eü}Ó¦\æL´þ\Ç\\÷]\Z?e®k®‘P*\ç[¦»\Í*Å¯\'@©WW\Ö6²¶‘Fl\"\"S\íDÈ˜|®\"”a\æ;£¯ »Eú‰\Ò}˜AÎ™8CË™¸LDü‰zôE#\Ä\ãk$0¥\Îø@©\ÖòI\à b#†F \Ù”7,¬K¯¸y0\è˜v³‚ˆ0K«™\Çv)„‡¤¾a1‹30D$\ìŠ-b”f\Æ È¢\Ö\ZF˜û§Q>>¼M	ž‘\É\à\\¿Yh\Â\Ðiû°\ç}žŸ\è7¹\åfy\ì\êßv@\â1|\ÒcÉ”z\Òl¸Y :¹©\É;\ÑX\â¼4jÎªó]·¥¥s\ïÓŒÌ\ìý\ã»\Ô)Q¬¢tL›F\nTk*\éR¡J\"#\"Ku+«n6]\é((¼|¥¼Šª©¼ªŒ¨y\Õ\ë.‹Ú\Z”·\É\ËR\Ãó«\ÓQ£[VD\ÚÊªYH\Ødde)FY¾1]}9Ÿ{œ÷.\ì;¨%\'Âª´\ç[I£P…5#´/SNjºª4\é\0úº¿wgA\Ü{½H©\"¥\Ìw\åûpòE[GÍ®Uv4\×v¸\ÚeF¶¼«k\nŒe\æÒ‘[\Ñûy‡²\ãkÁ\âþx\áòó2\"Ž*Ft©	’‹F)f\ë\r„øŠ—\"œxn¶Nc::ô‹¤\Ï\ä	\Â\ê\"\Æz„f\Ö\ã\î„Ž#,yZ÷K¡3®÷y­%©(ù´ž\rüšD\Óe.¦\ïÞ‡z¤¶E»\ï\Ö2\röˆB@}‚m&%‡\æ‰aù£\È\È\â\Ô;s\È Ø¢\Ö Á\Ö\Ü\Ío@\Ñ\Ò7xt\ÄbJZGxƒ%nA¦>Á\ÈÜ£O\\\â\r3	Ÿ9%v\ÇÀœŒ\ä\Z\"\ÔyNo‚ûm7{²i‚ŸŸE)Ž\Ã&1\Êa\Öûr>žÎ‡ª<]\ï\Ç\Zót½Ý”ˆ\ÛF•\ZER#&‘‡\')>ûƒ¼\×	i\Ðt]þ|W;\ëjo­\ØSQGÍ£Kš	Sy\Õo\×5iQ*$ð¨ªµ\Ñ?Â§\é¦Ix\îM\äq_¾¾‡¤Bü»d/\×B\Ê\ra\ÒLðv×©K\\Dd\Ãói˜a†FFR‘“³|V\Ê$fxŒ\ÏA{ó3˜7+—®²¡J²\ß}/3ž\í%¥F\ã]k\ÝbB­2ÁE¦#¹Š/¿:\ß\ËÌ¥F\ç9i8ní±¿‚Ž¶ñ\Þúªº™-*…¡EX\\Ëµ\Éw*\ÊEÐ®’\Z»\Ïz\ë©Ht\Í\áy\êj”\ÎO1%#œU\ÞNhsó\ßµQyŽµ‘õE\áR\ç¡/™US@¨\ÕUQl\ÔHˆ)\ÚbÍˆ|¥@\ØO€Z7¥*\á’q´oE‚\r%ñõM\êt.(²\á\Æ9lø¨ñwUÍ¤œeK¤¾3&A\ãPðw&\'‘‘\Z%‡1™4ÛÂ”\Ïz¥NC\ÜV\ê\ë„\ÂŒI\ÎCó¾	´˜„%\Ã\È%\Õ­\È:$\Ä#‡PŸX´D\Øg\Ã@–\Zõf”a†³§µ(\ëœ&|?\Ó\Æq¡E‚C\Â	C\Â)l3öDZ\Ñh&ôˆ36üw·÷‹`’^Ö†g\ÂbE<]‚|=\ãN‘‚\Ö+ò{šWû•\Õ\Õ\Ê\í•\Ô.U\ë~\Ýj5µg-\n\Ê$Â§@\Û!´‚w_<+\ï\å¥XU¼ER:‹ƒ}¨;(\ÑóhV\â\í¥Vâ¯§\çÒ¯E]N”d\ÙT\ë¼W\ÑO!¯aQ\ÚÜ£V\çp&#$7æ¨Ž\íW\Ð\")k\ë\Ò3ˆˆ\Â+Áv»\È\áy§ ­\Úûp¯Löt¼\Öh)DðCY^•ME\"’•\nF_Ó¯­2ª¨«¢t\ë+\ëLª\êj\èQ&Ò§Y[I”(P¢Q™™°ˆ< ¼T9\Ã~’P¤euùx¹\Z÷j\Z~khS^‚:\çrJŠT‹\Í:)(®QD\åª(Œ<Ü»x¹¹u\ÕPôh\Ñòþªƒ\ÎóS£\á¤…”+*\ÓV6ZI\ê\ê2£\Öó^7½\ä{.27‹ùþÿ\0¤÷|\Òa6•*m¤q\ç Kx4vd{‰‘œ·I7\rÉŠ1´\'\Þün\ëP”\ÎS\çhS\Ä	RÉ‘‘i	¬ö­°mV–G”\ÅÀwñ\r¥ÐÐƒ\áŒ$8)wü{Aa6aÇ”)w¾]\é•\Z¤fQ·¦8Œ<\ï-\íj“Fðà½¡K½\àRU)<\Öv21>’‚\íCó„ü\á$!†ˆûD! ´h´h’œ$=\Úø¡¸`q\ÈØ‚d÷}©6œÍŠA\ÆS\È\á„Zl\åfJ\ÍS‰sO‹\0\Ï\ÖBŒ0\ÙpG¤pÿ\0\rÝ”Fl‹C„?WÁÛ¤†ñŸo4¡˜K9\â)b­\ï\Ê>o_ž_Š4h½\Ó]\ë\ÑA\nUTh´\è\ÐPš´©\Ô\×\Ð#3Š(Ã½\Ñ÷‹¸wgš—je«o-\ÐLW\"þ»+J‘~º+(\×9¯%¢\ÒójjÒ¥iµ¦*rËš®‡u\à3:µü¿¿JP\ÝKò\ë¯#?\ÐWº¬¦e#¢^sRW¨¢E)‘\Ä	¤d\Ù\ZLnOˆDŒ\Ï™\è!^ò}¼P¹]©¨b—ƒ\Ù]C½\nzùUÊ•Sª©«£”\ÈV›ÿ\0žWQø²¨šn[‡][}5‡1U¦qÕ©¨,´\ë(T‹‘\\§Z½i‘U\äæ¢º·::ŠS²\í;«).­#\ÂjK P’ýó)üšè«¡F®•Å¹j(\Ý©[B‰‘Ñ´9	µ\ë)\"iR®§YI±´)w\Ú7H9„}Ý³\rž\Õfñ\Ëzñ´{<¶dœa\×\Û´\'O¯ Y­\á‚@™:tú¡ \Þ\Î\ïT6‡‚d²\æ\Ò`½¢”Ôµ’\ä\ë\ny`øx7n\ØuK&9ªQ\ç¥4x{¾†¹@\Û\å\n^÷zW]\äõ\ÔS¶YG¼Yü\nÈ¸S\Ç9‰|º\ÄzHHZ´ñ¾	´˜,\Ýb]}\Â}%ðo>Ff\ÆBXyz~er\Z¸Y\Ý\éÒ¦²D¹i\ÎM‹F?VÇ¤lóG\Ä;dÁ€y`\nSôjc„¡=£,y¦\r\Í(„Ú†\Ò\Éc\Ã	5w‰sõ\àÏˆo4tw\rF\\SiŽ\é‚lr´z¶y \ÑhÞ”¤\Éœ#Mr9\Óyu\Z·}MÈ¿t\ê/¥\ØM\èšT	\Z›\ÕBš¤)\ê)Õ™‘J]ÿ\0½\r\ÇU\Ê×e£K˜W&}\ä¸T©0Ì©½\åJ¹ø\æ2aj\íEI¿‹E‚¢órcš/™NjúL”\ÝG\âG•uA”V ¡N‹Á\r3þ\ruU¥F•ÁHŒ_þ6©ÿ\0{¯†\é¸Ñ‘\Z§½\å{¡r;ªHÉ¤tÕ¼k“Ô”XÂ‡eÄ¤ü\çe\æLM®ªºT( ºi©e\í_SM5\"ÿ\0\ÍTÖ‘\È\Ù\Âôw¢\êò™Ö¢«\Ñy·qc\Ñø‚‰±´\é>–R¦û©­6~5Bz“\ëù‡\Ì;\Õ}*I”UÞ‡óõ\ëFIB\âÐ¢SDAŽ÷†\Ì8†I$0º³³ ³\Ù\ålb\Î\ïÚ”«\í\Ê;ý:EJU\ï\Ñ\ÌF÷Ã‡ñ\\3…\'\ÆªS\Ä6r8\Ï3\Ç1h\Ú\í’…%\ÃÒ³\åšä‚m¢(M$£Ö»4„\ç`Hz$=„\ÛF\Íms¯ŽB\Ã »w={-hrÇŒš`\Ú\Ýf\ëf\ÌÆ†\á\é\ëŒZ\'\ïcX9\ï\n¯DÊ£É˜±“þ\çÚž·h¼\Õó\ë[®¢\Å#>	Av‰!ù\ÂHB|2\ë\ît\é\íJ¬‚kÁ\ÌöT»ýŠŽ\ïw\ÙR¤a\àÉ™‚=•Ü–v™qu°Y\á\Ð#·C,¤B84Z2\Ë<\á\æ\ÞÙ˜9\Û$%g\Å\ÚF&nx¢\Ì&\Ã\Þ?Œ0\ë~ ›\Å&Œ¾Y\ÈB\é1gŠ6Ë¬põ\r\Ù1a\Ä\É¢‰1c\ì=h–8e»\Ùr\ï\Úé¿™<(¼O\nN—»¶‘J•\ZD\ÊTi\ït_\'Ë—ž\×E5Q\Ô\ÑK\Ì:\Êu—¢ª‰™*T/R_6õ)¬Ž+MZŠ%5…\É}B\ßetÊ¦‚aVTÒ¹\Ë+\Ë\Î:tP_”µunô´J‰7\ÚU.\ã36œa;\ÉØ±+\ÉÚ²®…r7ŠK«©¬/:…reu©\ÔW\ÕS¢m*Tiþ-Z±\æ±#±E¬¯ZñQT‰%Eüª\Õ\n)U\ÕU\Ñ\Êa\éR§š‰9‹z6®¢\êrÂª•\éX©S?=\'G˜\å©39O\Ó\Ò2Á0\\\ï\ä¥ÇºœªtQ¡\æ¥^¡~ou:dq\ÖÕ ¡V\ÓT\ß\àEc0\Î?9‘\Ì\å~\Þ\Ë\êÊ©=}\å}\ÑxT§ª(Êª¢¦Q«©«£5\Z4H‹\0\Ú-0\Å „\Òf=Š²™ih³»\ëþ{0u”Z-\ß†.¡òhGŽ1\Ã\ØòV{3Aþ€•)\ï\Ã¯H\'‚u6\\(¾±ñV¤2¡:kZ’ò\É\ì\ÖX¡8´(‰I\ì7„©q\ç\ÄÐ§\Ú’Ã§˜9}¡½\ì•†\ÉEÛ¨P£iHv\è\'„\ä¯6\Ïûo‡³*ø\ÙÐ¥\ÞðN•U¯¨ð…7‚\ç¦\á/ù\Ä)w\Þz¤ªc‹Nƒ\ë\îøa„†b\éž¾\àš\ï\Ý÷z§š•yñž€–ð_\ÜRòKb“‡DØ§ \Ì=\Ú»\Ýþ\íŠÞ³6IH3kžP§§¿Ñ¬)\è\×‰V»Œ!†É˜ñFñ¯¼JYdž“\ìI!˜J]C1ô	Lz¬)‰\í8g\Ïô\nkói”\Ä\ÞA¥ašI™\Ú1öÇˆZ\'UL,œ¥\ç-ïºŽ«}7‡Ùš\å\É/=\ÉxÓ¬\"£NŸ\Ù5õ\naÑ¢E\çyžtA;¿Ÿ|š»\ï’3ü+\ÇË·\é\Ý\Õþa—û\í\Ñ}\ÐyÒ®¦\Ù\è(©&L$»\ßu\Ýgò8¾\Ís\"¢º\å<ªk(›=	¼^Eö]Uu?É¢\á[J–\Ä(\×UR£[SLˆ\èV\Õ\Ò*ut\È\ã#£YDÎ\"2Àøb2£I†ló˜~n™¢¿\Ü\å\å\Õ\ÛPŠ‰SRe\æAZòª¢q\Òw$¦¡aF_À\n*®Ò›óÌµi–*u·Z\í\×$qzcŒýºø²Ô•\ÅWH\Ìô‡•]\Ç\äA\Zjªw­½÷\Ý=Em:qþ§k±\ÖTŠŽ*5\å”U\Ü~\\žX\Ô\ÔTS©UQu.¡>”.¯¤\ÆVU)¼5u4¨3ð}:\è®>dóNÿ\0_*u\ß\ÉT^[\Øüy8\ê›•UMUU&¢D:,L)Y‡\Ù\âÓƒ¨)x—\0f\ê\ÖÀÇ´<^\ã‡H%|„\àQ	%S)gÉŒzªh´\Í\à,Y…£\èÔ‚\Ð\ïù†8÷~\é“CŠ\é\ì8š<.\É2\Ü%”{A\à•(m*_úG¸|\Ðð…*8†Ñ•„Òªµ\ãœYÓ»÷¸ch7{½:ST	`cºL¶ðO¼¤~5q\Ê\Ö4ða	\îýz\ìðwÆœ\Ù\Ý‡«º17À}‚Œ0<4\ÌÓž¨§\ÎÐ¥;Á[Iø\Ù\rM¡ªÝ¾»4h´O¤„\'\Ô!„‚g}\ßwû0÷\å«}\Ò\í=g»Òª}ø\ç\ÖX\Ì\Ù)\â8ô³\îùO~„e³õ²Md;š\"Ë†N€yz\Æ\Ñ½¢-\Ú12‚™ºr·rYýG[1‚xxŸ.Vfž“\ìº\ähþ(\Ú$†v°b\×\å\è!J \Ó1òžø\Ä0\â†\Òd\Ñg\Ë\ê\ïø&´\ëÏœ5FfE”Z3I\æ\rÚ¶M\'ˆ\âŒ5FÔ˜²\á\é\èÇš÷¥\Ówi&\Ü\Ç\åuUà¹‹Ž™‘Ò§Sv\ïe\nVz\êLþR¯Ì¬)©J\êû\Êò\Õ\â\àUø¿ny_Ro—)‘›\n“\æ\ì,QE\â\ë¥@£¥Nª¾´©MVS\Õ>¹1\ÍK£~j\é\Õus­\Úò¡SxÕµ†o¸´“>‘R&6²¢˜Ì£222”Ž#/ü\n4©™Dg\ÄM`x\Õß¾g:¿\Ý\ÔYJ\æ\Ü\Ú\Êžô×¨2# ’Š44\ÍJúM‘JŠ‚,!R>Kr\Ñ\Çt]ô\èy©\ïÿ\0¯¥x\ÇJ/\Ò&w;iT]d\ß\íkU),s£\Ìo\Þun\Ã&\Ûv<S]—\"&3Ïºèªª*«Œ¥¤FaN˜K„D¡U›)h!g´*³eÇ¦@§hUiIàµœ’D&Ë”4;\Ô%ù”€\ÉFa}ª\r.±h³\Çj}\é2HbŒnû7O`\Ý\á\ÜA©\ãS\Û\Øc‡§x*Kd\Â\Ïh³0³¨xl\É0\å6xZ²c x*JZ2xž]:ûAR½~@¥B‡‚]’^™\ÎahQ­¡I§NS\å›L¡–^À§h²©dP0¥;RªRö÷\â\æÁ2‹F\èº\ß\â1v\Þ\ì\Ü\ëð\á\Ê\Ï[B]]€›\r³œ³d\ÎÁÙšQ.¸Æž¾\Ìò	³\áŠ=IC¬)Nðw¥T\Øfˆ)x]ôö¤\Æ\Ër(2QÓ–R\Ä%ÁlB\ÞðOÀn‘\ÅmúÇ®0ž\ï\ÝwzT©’3mú\ÆR\Í f±\ï\Þ{\"\Ô6}\ç\ÇB ÎŒóŒ¦\Â7XS4Yü4qGõaœ2²`¦=3u„þ+\Ø]M»ñ÷)\ã³CX’œ>J\Ý}\"Áˆg>‘\r\Ê\Ì}lh„]c–6« 4ó\è~˜šgÍ”\Æ\ï§‘h81“´\Ø\Õ\Ð=†òK<¢5”5†\ì±w˜³\Ù\í]²\r\æ<ý3Á\ÌñT\êT‘†…j%\Æ\\9˜(Djù—C›N*ªWM\Í\ÍdT/#¢l*,~¢²¾\èùŸ’D¤ˆŠ&2 \éE\Ï\ÞS^®]½\ë+¨¥|^’¦¢÷Ýš“\"\"¤ö«»ô\Í=òF\í:R\Ðô*k(”‡H\â| \ç-Ê½\ëÊ«\ÓV8jž4Wž¦¨”«+n\Ó\î¥\Úû£W@\å¥\èŽ602•¢x)‘\ëÿ\0P¡/&\î­\ì\æ’ó¢v\'»þ¦ª\æ]¤rR®_^j\ÕV3ø4hQ(\Ëð‚—[\ãš4\î\ÛZ¤ªk..\Ó\ÔrW\Õ\ä+zÖs\Ùe”Ê¶¾™b ¥\á_µ)‹6‘\Ä\rFDGº‡d$\ç\è‹H•*¤°1Œû„‡‚#v›\ë\nx}š|=,†%´÷\ä‹>X4&ôû*…›ô\Ã\çpŒ³xZ´\ã\n^\r\ç¼oV¸e)Wþ.\Ò;Ô“­J•!\Î8zw=«\å¦P”YÓ¹ðÅ¯8/g\í\'\Ñ	¬\îöLºk:{*fFÉ´E•L#	”q^6û¸Z(T«.n‘\îô©T£Š\\z‡Q²\Ù7ý}Œ*QgTª\Ö{”Y1a\Ìg \å»\Ãzö#ž\Z‡\ÙûO\Ë\Ðêœˆt\Ç#3‰\à\Ñ)b\ÝL\ê1!À\ÇX„#‹¥­h\Ù\ân†ÍXShN\É35™\ÂnO\ÝûÁeyZ¯E\Ø÷UÞ˜ð0…Û½\n9Á\Êþh9=Eó…½]\Å+xeŒ;x}”ª÷m#1\Ý\Þ\r\Þ\ïä­…<bÐ¥E¥ä­¥0¨òw†a\ì\Ã!\Ä%‘’ù:$iž’R?N)BP²…)ú³\È©Qƒnc%\ÔaR„\ì³X:Œi\ã†@{Fvˆª,¹Äü\à}‚Ð£VN‘H=j\Z\Æ\ï†\ãj\ï9#\nvƒ\Å	†ñ´ùdu\é˜¬\à‰‚|=\ã·IuÙ¡\Ø\'³+\Õ\Ñ\Ù\Ï_\ÆÏ¢L\Ãg\é\Í(\Þ&Œ£\ë=D¨N­S\Î8ƒ¹\â©\Öòõ\äK¸^ ž\ï^—­~rý-¡ö˜\ÏJu·\Å\×VQ]Ý¾\Õ4N¶¾«ZŠ5õTYø4I¦\×r\'\Õþ«\ä•óW[Ee\Ø\æµe[‘s\Ç\Í*U•k\Ùæ“\çSD\â£J²šj\ÊGþö*žgŠÃ½E¬N½Ô±;ÁŠ³Œ«*%¬­¨­«<4i|´qB1¼O\Z6w†±gÞ²‰öM9±´nªri\nvs˜\á˜pô\ê\ÆÛ™¦C=¯(;F´cgÚ¤Éœnû\×\\’\äÂ«2N‘>\Öe\Ù\Ô6¨\á0\Ù\Ôm*\ã‹\è\é\Ø8÷ô}\äCˆoI\Ò0{½U˜\â\\Pœ¡:­’\Ä¨O^©/¨\ìZð*8‚¤\Ï$ž9‡¼-I§Šc\Þ/nÓŒ2\ÓjM0M©»\ë5\È8‚±h3K…’„\Îõ?\\·>!\ìÿ\0ý”|¬\â[¦fD=¡ÿ\0`v\Ôów\ßo‡‘·y\ÛQhcs‘G„\'¯ð\Ê\Ñi kd\Å\Ða‡+O I™O\àþ(,\ÝbŒyp\é&µ¹ºúò_•\ï¯Nv_d6¿«®ˆf`S\Ì\Å\àu¿”\Þ\Å\Äþ^¹\î(õx\É\Ö-7y\àõu¼’ø\Ô^\Ê\ì\Âò\ïQx—£•×±}\Ç|\ßK½«s&lL\Û\Ñw\Þ	oK’ð¡·¸Ö¹}¨\êxË q—¾ñ\à¿WH4\à”6mpˆCH7z}©L2J>vQjÀ(\å>°¥<;Âž²\ïð\Ö\í¸_ev¦I°DS³h\Ë1e!h³–ÉŒ\ÇO	â–‘>ñ«,òg\è!»©þ\"\é ›uò\Ð[<p–X„ÿ\0«\Ê-	÷œ\Ã\Õtd‹D!\Ð>L®ipƒaœ\Ð!	0\å>Nüƒ$ò\ânaò™ñ\ã\Ì>MÓƒXõ­£\\±G\Ü-\ÂPJ-x†(N£4PU\Ê\îj_û„¶®˜¢ª\ì^\Ç\íÖ«®«´+h7Í­¡†FB\Ë>b\Ýs{Ò­ª:\Ë;Œ\í+\íE%\n\Ôk*h£$\Ü>‘VS§DÎ¸\ê½)e(\Ì`y=Ž·•-¥^Žð¥CvŸ\"!hñ^\\xo×‡IŽ\Ý2\Ì?—µY[8\Þ7¯\'Qž\Ëf‹§´)´@›\Ð7†\Ã\0vNšÕµ·°o\n¬\Ð&F†l¶œ\Óö…\n=S^ñhÞ­›ôs\ÙÓ¶\×\Þ8{½ß½\ï\Ý<QZ\ãŠ,\Þ*ÉT£hLj­y4wªÃ±ÆžÔ”‹ Z6«G©eh÷†Í†6Á‚\ÑP\Î\ÌÑ…>\Ï\ÚU\îS„\Î\í\ÕJ½ùo\Õ\Ä\r\ÞvWZi%ˆm¶?¤|O«i\â8…ösøb\\\è_b\É\Ó(M\êýQ·¤;m\r¥³ðÀ\Âv0Ž\ÝR†O	²ú‚\Í\Ö)ô˜}>*,¯Nm^\Ät¬»?J¼^ù0ds#ž\ïJù´ö~1\ZC$ºE½\ÞoD©¼\ê\ã\Ö\È\ÌÑ´–ý°\Ç\à¡W~1t~\íü\à¾®I^\Å\Ö\Û\Îmû÷ngN¦Ò™^â¹….L‚h\à\ÑÙ¤\Ä\Ø>R¬¶ASÁFò®c1¤GpSq|)\ß\×\êðŽÌ®õ=\ÊF\Â1–,\Í\íIŠx2Qò]YX>v\ÓC(ež\Æñ&‹\àý>m#hQ³w\æ4\è`\Þ!ƒ.!&\Ó\'vùF\ï³K¦|5¡B¨`hþ(kvhD;0ƒ³\îýLBŽ\èµ\Ä<ÙŒ3\Ó\ïy\Ð$\×7”C¢F˜ž\ÍH-ñ&´D\Èf\r´Cƒ‡\Ú6”Á8´3h!ü¼ò70\ÞÃ´o:5! š4£Ö¼v¡»¥Áƒ1´C\\\ìÏ˜Ï³G/Xöl\Ð\Ö,ö˜\ãiI‚¢9\Îa\Ã\àY‡\è¥\ÚÅò­s4K\0§\ÐÒ¯Æ‹Nõó/£¥Ú™Drg±M’1h\áûJ¶\ìC‡\Ùþ^ºN±hP\ï\êŒx¤¶¼¥\åiC¾\Õf†69\ÛK3A¨\ÙRÃ¨&|(\ÙSn6ui{<\'f0™=VÇ¿E	GO\áÿ\0\Ê1c\Â§³\ìÞº\Æu„\È_\Ú«`CHw;\×û¹^\â´óa\ï52¹p\áhLp\Ê\ÉÁC\0_\Åø=?‡Uðf.‘y/\Åðx%u¹.ó\îý^µnA{>øwhr—›N\ÞT.°\\nEq\ÃuÞ§s ‰¼~\ï\é\n]ÿ\0zO?¹K{nöÁb}]V\Å\'\ï\0v¾ïºn\Õ{´½\â\Ì\ç€\'7=–Ò­v\ä\äg³\Ê,\é\Ôm\nðyNð´\í»i3þWù°ø²ó³—\Î?\Øu¯£ýóº1….õ&.SC\ÂD\Ò\â\r\çÁ~®£\Éú\ÈCPShÃ«°q†\í\àQdÅ”^\ÛÀ¼Ú™\Ò\ä{¯>˜˜W—‹=»DX°d™\Æ\ïü\Ë\\?A\í*\â&a´—(S+Ry1\rž\Z¦h\Ç6€§¢ š&\ãaê§Ÿ²A¼oxð¨\Êh¹úð	\í>£¨Y\äƒ\"\ÅN\ÆHx3H\î°#gÝ¼w\ê\ìB\rn²6‘†Y\áŒ)wú¦E¨&ñRG‡4£\å(óO\Ò0Y!˜|\î0˜\Þ7I3\æ\naœq\ê$›P³\Ú\rT5¡h?Htˆ\æüRi³ŸP,§\ÒaM£v–Z-{*l˜\Ä~/ðš\Æ\Î[\Ø\á\ïˆlMÁŽp¥:…\n•C´\'ñs*=:_P±k´%\Ù;4\ÜA:T¹\ä\Î-\n%a\Ã@³¨w\î‘\ÛZ\rE¢Ë°Em\rOeß¬·jˆx¤¦z¥\ì	øz‹W\Ë~±ò´*x(N•T:ZA2‹B£?.YFð—kõÞ‰Â™6¹\â”6Óºb™¸Fñ‰t2øüXÅC,\Éø\ç”\ÂcP¢ÒšDCˆZ<¸\ä†Ú”¤oøDz¯WhMfµ%v\Çn1ro=\Óz?Á\í\rº¤\ËC±»2”‘Ë¤;¶„ó\åkÏ X<2­õ }|s\î\Êç·¶\ïZ;\Î7\Ú%\ÆEwn•&±\Âg#i0\Ï0vó÷†þr\å÷w›a¼÷.õ}—z‘E\Ùÿ\0\ë,`\î‡\ÞÃ“ü›û\îr\ÝZ/Z¶\ë8\î¿5\Ø\"þ²0\Î0žü}\Ùþð\ï?»6ž\ë¬y,ûC\ÃN\ë\Ýõ\0cK0?·ü Jþ»i?þ[\åŠ½T\Ý›ökPT¡¹Ø©’­F\Òg”±ÏŽ9±°]¾kò\Þð=.½ö\å\ê\â8\Ö\"cŒ\ç·û\È]M\Ç!\à<\Ôr¢þ¯^\ï\ë	\á#ð•9˜´}\Z“q)xŒ(\å>\ÅyB˜Z¦\nS§Ý½vI[,¡T0\Û\ë/eÎ‡¡\ê¹zš:!(›‰6\Ø\ÑüPmð\Â8F­\Ô-‡”|\ï>r:Œ3d\Ê7Ž¹xE$p\Îf7q´\'Uµ·¡£gµl°”n\ç#:‡O»d\î…S2)[´3\'[Š>ñœº&É¹Jr\r\à’\à†@¥\ß\áºž<Ð¥:‚U˜†Ñ²\Ù#ˆ¤\Ã\Ð\íQ÷‰ö¾¾¶’\Í‹[ª‚ÿ\0jy\ZŽ¶Z‹.1-›]\ãT#\nS¨OjMa\Zp\ä §\ä‘\í°1¼*´³Á@ó \Õl’\éhT£6\Û\Þ6—a–„ýQ˜L:„¿.\Ì¼6m“.!4\é’m\ë£ðÚ­*\ÙašL‡´6[^üyò…;:U)˜z2‹:w:«L:D|Q\Ù\ê9ûñjS$#>\Ñe\é—\\ƒg\"SkCÓƒ ³¨Ú¬˜&öy|º`¥E \Òa\Ê8{½=•\å\ë¹Â—{ÁE•4_Ò¹†Ñµz\ë\ÉV«JMù‚£\Ã+\Ü L!ó½û§\0õ«^ýšp¥7‰I·¡ýc¹ƒzRöº®…ë¤™¡>œ’„¨o.ž\Æd\Zš\"j©2bŒ6“2\ã\Ç,Œø9‘Ï‹\ÞðJ•5\Þq½ø\Z(ý¢øŠq|ù\á\Î\ä\ïR¼¼\âZw\í\"\Å\Í6º¯™\Ý\ã#dT|\Ær0\í»ïª\Öv\rÇ©„8…CR_±I;dµ7]Ö©\Úk½ô‰z»žøpm\ßwóA\é÷‚\ä	.Û¹I\Ì\å\Å ÿ\0\Î\0¥\Þþ»\ê¾\áüûH\Ä–9–“¶\é\Þ#\ÆFFM6’ûn¿¼_-;ys–^\Ô.ŒˆšE0¡Ü¡—b”»ö\Å\íC\Â/ÿ\0#\ï\rÿ\0ùÆ€‰ùmo»·º‰¼ý¤S2i›¾\ïµ¹#m\ëa„lû²Fa\í\Ç>\r>6ôf\ëŽ<:´¥[:sŽ\Üy€)\Éh¸7\\”\Ï\Ç\Ãùvs\Ö7Ž¹ó\Æ6Œýb\Ó\\rIu\È,öŒ-2\æFò“qgS0õ•{ðMhµ3¯¦A³\ás‰\ÒÅ¯¦#\nZ\ËKÃ¨z{B¹;Ù&†	r\æ¨ˆz¯oKF3\ä\Ã(ù£\"\Zc\é\×1žF\Ñ\á%\î\Î#ñp\Ä6|YJyñe\×Áh\í\é\Â5w\Ì7ŽŒXÑ»d\ï\à\Ò,Ö‰ó3¢@J,û\Þ,X‡¤ŠC/JÒŠ2‹?PÙ·lób\êE8\Ú>\ãª\Â<_Ë¢6I¥£wUò\Ë\äõN©E£þ\'‰˜pƒ\Ý=}vN–´o±b>\Ïã¡¬jnI³\ë	”7{„aN\Ñjµ­°lZ¤q1.u	¬¶½¿~÷pMQµª²d!\ï.¨54Ä¯q“1\át·Tƒhw\ì\Ê\×\Ûn\Ï\Ëý#x\Þ6”›òŒ‡zvZús\á	ÿ\0@•R˜£rP×–þ¸{;j²xÒ†™?‰I\î!h‰R\Â,cÿ\0N,35£‡¨Q’Agxl¾LA3\Â\Î\ÉO„¦œ8Ó•«öyø÷p„ðš(\Âg­ \é)ˆ&„§0f6ô\é8ƒ&\Ñ\ß8†OŽY.GÜ¾\ç¿\í\\¥\äŠµ¼\âÛ…<os}\Â\Ã\È9r÷º\ë\Ò\'Sr®£¤Z\ßÁtù\Ô\ï™ñ3„\ße\î?.m+\ZV\Õ\Èfl}#‡¾9]u\ÕX\äZ‰ù\ï¼ŒoŸ\Üÿ\0¸72\ë\×ó’‘.¸üšIz_\Ôo\í\à¢g:DDtŠ‰f\Â0™\áÿ\0\Ëû­\Ä\ÏR½/\Ï(ÿ\0º\åN´\Þ:\Äü\â†\Ðj9\Î\ë\ÑqS%]Ù¼\Ëø•\×x\àöŒøªþlrþ\ë¸y\èNN<\ã\æo,}–\ê¾n‰¾\Ð]ø£`¿\ïrJ/²½]Ì£\ïGq•#<´¼\Ö\å0\íxZ,—\Ú\ä!\à7©\Ö$OÀB8FBS´\ÇaK)Q_µ)W&¦võh\ÇkÇ‹¤}žOµ&¹UÐwô»:Ž©‚jˆ­)\ZxÁE	ˆƒÁ˜dµ·fŠQ\ëph?Yƒc\Ä-\n6¬“\á8\Ù\á>2@›\ÕG…\Z5‰>bCwc\Æf\Ý#ˆÏ¤)QðlQºk3“8ñp’P¥°–QŠ,°h?g\Ùl™¤\Ä\Ôxž¸¤cgÚ±\ë\êñJ:»†xt\âxµŽ!ßœ|§[;G ´Køz\rb(¬˜8‰E)Qh\Ý1\Ë\å	½gN‘\ìöO\Ø-/[.\ã@´\ìªma\Ûg\Ùa0S´\ïe\àºqJ&$\ÞA³\ÂlÁJ{=ªMx§	¬þ!„\ÖtöS\È]A3½\àOGZž¡³×¥þzÁ°Ym	0–	²hT%þe£(öyZ¢\ØqK™>ô£Ô S? \Ý!\Ð\Ñ|¸–\Å(ð¾¾}cx\Ý2{G\"A\áeJòV‡þNýCSgwÿ\0\ì\ìxf\n]\ê2\Ã\âI#\Ø,ZFÎ£fW‹@\á\é\ì¶mý`L¡=–Ò’O\Ö9\Ì&R¥;ú\éøvp™\áº\ê/(\æE\ÏP¢/c¿–‰BhðJQ‡jTf¥	ž\ìx­L\×2„#ú1ù ð^˜¯\'{ º¨­\Þð{\à2\Î/·6yûÿ\0\Ì\Û\Ô÷½·¥jß££\í\nw[M\ì~õD·{0\â\n\Ù]\ä]¡\Ë÷÷û\ë\Ü÷ý\è}\Þ\Â5ÿ\0uŽR,B\×S½\ìM¥w\Ûwÿ\0\Êk\â\Æ\â×œ\à^™\çy\Ëx}\Ös\"6\Ý^U\Ý&Ÿ\ì%Þˆ™L\nSp\åI}Ð‚&{G¶Pû´=\Ó:Ý¼qÐ‚Úµ¾÷1ywu­÷\Ç,i\ß]\Éx/Á-\èy]ÿ\0`Ø¦\á…Ï³]¾f®°?¹L\Â_´\Øa!û%z‘üüú²­Á¤gch‹²Sl\íÀ-\Z|\Ýcˆ<0õt\Æ4\Âa—N¶”\ãˆZ6tm^¸°¿÷\Â\ÑjLö½O…ÿ\0\Ò]ÁJˆö¼\ã>9pË­¬	½f|‘7\â›‚X‡\Í:ðhJ®&BaüQ³\î\Ù\Ä Ñ»\ÂyFðy\àÁˆC´\Ç\å4\é\Ö2.\Ë\ØûA-§À\Ã´(\Â\ÂG\Ö?O2\È\ÖÕ°Dð³M	†ðÖ…*6¥Sw\âËŸ(³\ÂUø\nh\Ùñd9\ä–’\ì“ýð¢’c#Ç„…Ÿj50(/\n¦=#ù\ëaŽ1´\èxô0Ã·gKµ\é9µx%H®ù½\á‚YÅ£e\Éa2tñZ\à\ØÅž\Ñ\ÖC\Ý\ém>»,Ý†6}\æ\Ãf\Æ{:\ÕkC\Þ(7y%LÌ˜e\Õ\çÇ¨&ŽÔš–!õZœ\äÀ¦Î¡©’n6\Ü\Óa¡=•RŸXƒ=RAgw»•ZV`òfök,a˜ZnÍ°[CµðøÚž^{©\ÜÀggð,¶M(L¡Þ£iñÈ™¯Hõ¥\nó‘O7Ž[õ|)Nž\Õfú\ïY:ˆH	>õ.I\ÆÑ»À¥ˆ<þ­‹ü\Þ.\ÝB\Úð“\ÙÂ»PM‰™ð\äkBY5L;þªš\Ì`\Õ\Ú¿$} j<2]ø±k ¦\ç\Ý÷‚¥\\Šû²®°.E\n¼W¸^\×\ÂöU7ƒ`C\Ò÷ˆ¦\Ò.\Ó¥J™!põÇ­’\íÌžh\ZWg\Ý{î´‹\í\ç8Ÿ/¨O½ÝŠ\î¸r˜U\ÎeTSQ\åE\Ür\Ñ\ä/iº—.\é°\ï\Õ*&_ƒz/‘‘¶püwšt©¤~l$Š^\Ñvþ\ØTY^\Ð\È\Î.i\Î\Ì\äKz­÷V\ì9bz¼]{\ß\â\Î\ïQerqÇ¾\Åõs£n ¤­7WKs™\ájOP’ô9\Ñ]S##\â/R}Q¥xb‹ñ( \í¼»\Õ\Æ\è^…nV\à(˜¼EG¾Ü½ý‘~Lõ‹÷zl\0ñH,\é\ÔZ Cegt‚=%žrº\Ì^\×;¹E™B··,_G¹ðeˆo)õu˜\Å<m™¬\Ã0v\Ï	„4\rxN.›h\ÚR2Qgð\ÉŒÅ¡B{Rf·X´BAgÞº`c\rŽ…¢Ñ§\Ë(\Þ2´µ=„Lº\Âs\nx„ Á`s\ÔT\íe®3<²0ˆZˆF6x3ah\ÝpÅ‚&4cI¤Ï¢R\Âcù\ÙFñ½\Ë\Ó$\Í1¼%”\Ð`Á(–šx«&ÀÞ¹~]\Ê\"\Ùc\èø®\Óú?MGK)‘O#of‘œ&\Ú6›ò„\ÛB¨u…>\ÐÀƒ\Þ2A\ïøpð» N\ïQd´\çÀI÷L­\ÓSgN•M¯¸Yø\\­\nOj\ÙaƒC\Ê\Ïj\Ù\n‚Ÿh*J¥[1–Ã†X³ÁšBf\ãò4‚kEMm\Øm¿Ga\È\r?\á}a‰ú¥\É\áüAR«‚A\îðTi’l%¨KXLðx;ý›\à-ú8þ¾\È»÷«T:B•ªd‡ÿ\0(JM¬û£ˆmÿ\0\n‹?†õ/«\Ø}-\ÕûR¨\ì\Ò#\Â\ì›B1ÿ\0§~®\Ó0\Úv™$ö{Ss“x,û3¦û¹\×\êÀ¼\î\ÊÚ½P&„\ÝS\â Nõ2«(i	²\âƒu}Bò<.þ\Õ\ÍfþÁò\å\ë{Åœ&NðQj¼¯o^§\Ó}\ã{¯ú‡)y}oö’§\å½r/\ÕË;]÷=Þ¥\éy/\r\ê\à7UÊ\é½\á\í3œÿ\0\é±È”\ÏGeþ\æ\Ç..—2þô÷ÌŒ‰\ìñu^*\'ÇœW¤dw–øS\"i`v±¡7w\ÙS}•tXQ}\îÅ”^K\á²pGI\Û\×EûÅ•5ð¾\n,®K¼´—¢E\ïN}­»Áh%Rö~[\ìV\îŠPñO\ëk­ö,`¯uº)Y.­\ßCo¾·‘”‰\Ø\ì¢^i“˜\Ì\èy‡y)´ÈˆŒÍ¤mdM+£p*%\å}\ÉkŠ\ê“O\Ú/S3¢o\ÚLþ@¹O†\Ôòu{tñL¡BÙ»\îË¦üÿ\0\×\Ò2Q\Ã\Ðª\×\ãN˜³§\í’-\0³õ`f3:\È<Ÿ\r\Ù#H]\Ç{\áG\í\'8\ïW}þ®º7w8\É;pÍ¨lùº…žktX:g˜´“$„¤-T¥ g‰†qh=¨lûÊ¯ñv\\€ü²…>¬Í†\ÇQ™¦\nlö[7xôõ\ë\ÚiM„Lœð1\ìôöX›„º¡\à£†\Û+c3’H‚e)\á\å\nt\âh\Ï\àò…)üO\\R´(+.x\Ær\èµÿ\0GtH6r\Ý3Á£ÿ\0\ãùós\ànýa4 Ð§\ÃY$Á~i\âI€È´‘œ™‚g~\ËiW\Ä0\'I\Ð\Ü3\rŸjl\ì\ÐgK²mñva\ÏñqÉª0Í—«D“<]=†>S(S³¤´üû4”&jt°‹B‡~\ëò\î˜J;øz¤¿2]\Û ´{Q\×dÿ\0”ø\Âm\ïc\î\Ò¼8‚T¯&[\Ðõz[Ot¸‚•9ŽMBÎž\Ã\Ýû¤\"\nx{ÁR\\(³0Mö>\Òq\Z\Ülaa`Sx\'µ&H»\Ø}\Ñc\Ú²²\È\Ñgñ):\Äj!\Þ(Oe´ø\î¨Â£ù\ìG6q\ìôû7ü\âa\åfñ~1Gµx\ìÑŸvW¸¢ýQ€\ã›EªÉ°F\nYv\ï\à\ë˜)\ÙöedYd\ëI\Îÿ\0Q\í·J-\âWw@MÙž^\íxK\'•±F(O¬\Ì\n^T\É\Ûÿ\0£º\Ì^;\á\Ä=9K\Èo\ØN\\¢/u<owõ…ý¨iŠ\ÆNt\êU%û&\â7z\ë\Î\í÷\à\æ¿ÿ\0\å\ç\îGuž\ï\åÏ•ž\ê¼|\Ü7	1\Ãw\Ë(\æ\Þ>ÿ\0¼=9“\Î;ð÷½«jðû¤Q89>\Ì’‚²\ì—\ÑaÀ\îÿ\0(…Û¹\é\ÔZªî­½\n\Û²ž=\æ\Ê;\Õ*Mö©¨m\È}ªð-¡*·’E\Ïw‚\éÞ®\ì\Ù\ÂnXò¥\ÞoGÒ¤D½øøað»ž\èýx)â°™¤\\¹÷\Ýù3µ\ÙN\ä\Ò]\Î\Õ´/K¿Yx(5ýAüþ\"ó\nñ\Þö\ÑiQ\"*4XDÆL»®#f<™>wK\îÞ„³J$ùŽp\î\â½·M\rw\ëFš4\ä‰p\Ã0SaŒpw~\Õv\îB\í»õ\îdq7]\Þ^\Íå“\Ót˜_[ÿ\0X[ˆ)Þ¬\Ò\Î-ˆ0mûW¨\ë\í\ë\îÿ\0b5¡na%«£´z¤q÷‹Fë‹§\0è„£\âLyð\Â ¡\ÔiÊ–\ÄG9JQ\ã6‰l\Ì\Âb\Ï>iD‡¥&D—dŠ\r\È,û+|¬\È-L5K¾Ï½žŒA2ý\n7|f!òž\Ùt\Ú5qb#õLý¡Tö¼x:D:Åº{‡ñµùCù\Ú\ÙÇ¼&\×Ù¨Z6­û\Ôqh’ ¦Â›;\Ã{³ú§³\á€&Oh²¥Ñ¨)P£e±··8Lœ\Ô*³vt‹FÕµ\Ë\'Xð¿!ú\×<ÁOŠSng— ³µ-¦\Ý	†\ïò3jžPi\Ô\'³|°<«\Ûj\éÁ”&öz]ûOhRðN-¥.`˜\Ô\'µøõ\Ð\Ä\ì\æ–É¸³?-<¬\Ús1¬\ìz…\\&ú·\È\rß²¥L‘«\Ð÷….ô\êl¸ôsBjûFÒ®fe\ÖÀN÷z‚J›LÝ2\ê\É\êSJRE€q\r–\Ì\Ë\0õU)a[0öz{*cdž·¸¢\îcGxlªRnKY\î\éf\Ä6\ê«\äS;°j\ÕT©JFO\å‘\Þ\ïPI^wzõ[\Í><1·\ÚI6È²\ï\î	\ÓÇ²ô_\ËõüQ\çr\ï°n3D»\Ý\î\ëú`\íº\î\âök¥û3\Å\ï)ˆ¤\ßä•¾P§•÷\Ùjo·1žÿ\0j¯?½W3—\\xšþ¼\Z\Ðÿ\0\é™÷T©N\è\ä¿#‘\Ñxó\îô¸\é\Z|Á\æEó‰\ÉF•\ZDwŽ\"7ñ”†Nç‚…J¬—VÞ‡aÑ¬9<\rWWq\Þû/jj’Atžû/Ù¿°Î‹\n)\"ú‡\0k\á©^I/U¾\Ä\æ]/a\ÆÜ‹‘wþ\Ôsc™·©\î\á¹a¿¼/vDþÿ\0›79G(ný\Ã>ô\ÊAF†ÁD¨Þ‚\æ!Qcþý\Þ\"*?\è\Ò\çù­p“iL\ÚffWþ½U\ç¼Ws\Ýû}¯*\Óö«Á\í°“˜v\Þô¼4¸²\ËZ9¡w\ÔmI•¸\í\èt30+D2\â\n-\\6Ý·D@‡@~\ÄV\Èg\Z\â\ÎS<?j}½¶\Z/\Öò\Ä¾1¦t¡{\Þ\ÛÔ¶X¿x\ï˜\Ç2/ÂƒT«\íe\é{¯¶þ¨\ÊÁ\ê¶O\ZM\Òú±D…½XF9sŒø\åÀ\r?­\áž.–!\Ó	\Û&Q6“\nr—A\ãi4À,\ê\ZS\äò;v”† ]\âoLmC<$\Ùq\ÃÁ»\ÙlhMiµl…4#0¦\ÑjK§\È6t\ê•¼;¦ÀM\å\ÊaO\Êûp\Ø¼e†Q1\Ì!üüP¥8M\ßó1·<™\Í3K8´tjšQg\ÙU®ùeˆe\ê\Ð\Ñ\á·q\ÆÇ™>M\0ø¨\â&@\Âd\êa^G\Ûy£³¾Q³Ú•z\èLiì¥·\ZøO0\â„¬‹S&úð—¼nÿ\0>Û°\ÉØ©*d›}¶,BÎNÒ­w¨v0òPï²ªR®\r\r\á\ém*ö\r“D]‘0{A\ßeMªF„\ÎwzŽ\íI2/¤`Á\Z‹U®DCŒ(\ÙOp]ú»¦Qh\Ýl™{¤	“¨Oe\ëÁ¤q\rª\Í´I‹FIdþ$ZZ­)<FH‡É•\íú\ä\Ê0Z÷\æD\È5\é\Óür\Ò]\Ò7x\Ûà¡Œ)wú§—y¹\Ô\ï\Õ\É\í{º\Ì5\àw{±_¿3™Bg‚u«^\ãœƒˆ<{6+w”°\í\Î©U\Üt®+¥Ë„_W:>¾`\Ù\ê-EM!\ÌÃÁö¢ÿ\0«º¯g\r\ÕrŸ\Ò7ºñ~\Î]\í!\Û÷y¹\nW\Ç\ï\å÷®w¹–óO˜+(‘.\Ü÷‚šÿ\0~‘Q\"/³7=žÁ9L\Úf\Óh4\é\Þ*ž–´7¹}µo\Ò/vûþðœ\á\âG‹º¯Œ|=¤\Ø\ç”\\—E¡SU\ÝGº\âÕ¥\ì©\ÔŽ÷{Ã…©t¡{±ß£¢h½Ï‹\ÓjKv\Ý6(ž·‹õ\r\ßd_i\ïQ÷÷û\Ø&\â¼\ã¼7U·#—\ëWw}¢\"ÿ\0GÜ¦»÷~/\Úbú\0\æ\Ï7ùÀ\ïMöúûGbr°\ÝW6\é4¾\Ï\ÜK¿ŠL„egö’¤%¢8zˆ“q\Ë}‰²=ðcm2…^Ë«`\\xLñe\Öc\î\Ë(y9ž\röNÞ‡\"‹8x“\Ãe²C,¡M\çPj•95#úxsjðmI^W³„r\Ñ\Æ_­\ïBg~J8|Vf\í\Ì\Ô?Œ3\ã—ôójÃŽQhPS\æ;\Ï\ã²[H²²q»\Âa1\Ì-6Ÿ\Ñ?VŒZ>’H\ÞØ†\Ñ\Û/@†\nlðÁ\Ò-\r\Ñ\'X³Zq6|‚\ÐJ#Š‡†Õ£@L£e‡x\Ú4ä“ bŸH´2\ÊÉ¤\×<ƒgÝ²…>\É\Ø}A7Šg{gYg\Ð<ƒ\Ý\ê¤\ëj\Ã<-\nlò+\ï\Úa&@§gUÛ›(Mh”üh\Ù\ÓÁ“þa\nvƒ;Q\Ìp`\Ý÷H\ãg²¥Û¼nFd\ZY\Ð]!I\Ú\Ì,õôª›\Ñ\ä0¥C¿Å³³(Shõ‡¡²ÿ\0[l	”m*”£Š-\r‡p³\ÚÙ’!õ\Â\Î\ï=šUÀ\Ü\éö¤\Éaò„\ÏÇŽlš\Ú2\Ë\ã\Ð(Ý¼pM\ë)7\ì“\Æ,ö}«¶ôg\í_\" o\Û*TŒ·wù3w\ÝQG„pû>Í©\Ý>!\ÃÛº@ºFñ\ì\ß‰n<øÁ²»¼\n\Ü=\Ãx\ÚRŒzE\Òx(Qº?,\àŒNž\Ã	j?ª/e\Çaý\\ö\Æ9\Ý\ê,¯+Ã°\"„\á\ÛP9\Zd…	c˜)\Ù\Òô@ƒËžÀ¨µ\'»Ë¸}\Çr\Êõ¾|\Å?\Ý\çY…\í\ç4\nžœ\Ð\æ\r\ê\'õ\é}.ú?üq]òÿ\0&npy)Pjž–»ª\Ä8\Ç\Îq{núŸ¢ysn\\ŠwsÝ±·gxm)P\í\Û¼rM!\ïºñ\'O·¸ý\Ñq\ã\ÎBñýûþñö[›È®N]oµÜ‘sss.³\Å\ïwxy\ïxnþ_p\'4T=\ßÊ¹;\Ë\Û\Þ\èò>\åØŒ¸ƒ¢Oô³x.÷ù\ä\ÑÍ«ðøN•Ö¥\"\à¬^ùñ˜y>/E•WÚ½\Ån?¨5‡“¹B}¥ò\ZŒ‡%/B{V\Éz\ì±³±§”²L¡G\Ïz´N8Çªx-y\Ç\Ùûž£Ùªýùb„Q\ÉÓ»\ážQ÷pû»§e™\'\æ\Õ\êEúÜ¿g.öah\Ñ\× \Ç­ÅžA³\ÃF	a˜[4\"œŠœbW˜c\Ë,óF\í3\r½F\Ò\ãg“×–\Ë/X‹jL“£ Y\ã‡[iµv‹CË‡6–B}\æYª\âˆ\ÔYvötJ‰‰a.h³Ú¬™FÐžN¹I÷³)\Ú<RU9p`˜Yö¬½\ãi×­ŒŒ2°a\Ñ	Gò\Zû†9!<¡64z9Ž9¥.ól¹\Ù\ähL\Ç|™…£\Ö\ÎX»J«É¤&³¨=xH)ñM\ßiW·ö\ß{“n”Z#³3a\èŒmO)\Ï Mò¸I)\Ý}B.\à§uK·E\Ú6Y\Âm¢+s,P6F\êÉ˜\ØJx¢W/\ëÁ\Ã\ËeM\ãŽ\Ã\î\ì\á7µ%˜¤2ûD&N\ïO³*Ã„~ŸzI°·\È6}\äÛ¶­?d\é¶§O\î;R©I¸\ÛYŒ\Z}\Ö\Ö\Õ\è[‚”\ïUZ=\áe5#‡\íX-«b\ì	¼-³¡šÐ¡Q©HV/¤c›™\'	\ÃôˆM’×ªVö{m6\í`S¶üy\Å\Û|ú\Ú_	G‘’E€~\Ð>=8NÀ†\Ûôtš2Yˆ\ÚY‹ }\ÛùnI\íO$—¥\ï2ùE\Üb{Re|^\Ýl÷«¼ð„\Å\Ã\ì¶EÎ„‘}]\Ö/#¾\Ð[[ŽÁ0\íw¾\n•%tÜ‡;ø¾\Ìdœ¢ý§¾_T\'z]~@òöõþ\Æ^u¨}«x¼w{”·~´÷\ËúÀq»½+‡“¼’[t®—?_Wauó\ìôW{”\×ü×¹§\ïñv”p‡£„\Þ\Ü]\à¹l·U\Ü_P‡m\Ïx;Òº\Ç\"‰¯t˜R¤\Üsa[a÷w\Ù\Ýÿ\0 »\ïªÜ·8\ìhYˆq†=-.•\ÖùÍŸgd,b\à\ßò†\êº\æŒ)/—K\ë\Êa\ä¢\Îvn9¡¸b\í*U%£H\ç­\ïw\íWJ\ä.ÿ\0F—Wþ\Îþ\ÎIN]\ÊN£Lv|\Í\éh³3[\Z,\ãxƒ:\Ç\É[¯¥¡J”|¦g\ê\É4É‹Â›DrH6„ó2)\"‘J&¢m%˜zÒ–·eß³vŸ§\Ý\à\Þ	Ó“b%\Ò\ä0\Û@lcw›¯@³Íš!g,\Í\Å\Ô~ƒfK··6x†\íýxM—¬z\ÏNg\ì„\á˜\àØ˜\'I³ C.F\ã^\Ð\íQ&¼¿\ÂA³§Uf›¦0•=T:#\é\Æ8… \Ûal³\áV\ã,#	¶§N\á)·»8ù¦Œ˜&õ•x‚eKgˆ)Qêˆ¶”)ShT–hµ\ÍðŒ<\r	“Èš\Ü\Õ\Ý\Ó:©RB°Bo‘ø\ØF=Ÿd´«?\è\ÝÁùmúG#q\Ãø…©?‚‹\è\ê©|\r‹L\ÌF\Õk\ØÏ› \ÐT(5_ôs\Ü)´{\ÉÓ¿\Ï)3r‘\êñ\Õ\âù±hxn\ê\å\Ô<¦²ø%\ncð\'\ÑZ˜=:{SRbö®hs\î\Ê\ÛnXr6\\aÚ£\Ã+\Ø$\Ê.Ÿ\É\á–!.ƒœý#ò@ƒ´\Ê9ôg¡\åuÓ¨‹–W\è¸lSO‰¬Ÿˆ\ì\ìK–Û¸\\Áö¢\Ñ\àmÿ\0Zqþ\Î\æA\áj\Ú\Ð\Ø-±{9¸Z¿wþP{wœ\Ù\\\èw\ÝU\È\Ïþ\î\î•ÞŠð_\ËÀ\Ö6\ì\Üë³¬]?þtzI\Õ}ã¹¯q\Íu\é\æÅ¸ž—¢\îý¡e`órÿ\0\ÄT¾\Ô_\ÉÀG\ÔA\È\ïL÷2Mö[n}>}\êð{›øÿ\0÷œ]®_»\Ý\ïK\Ð\äI·m¯È‰\î\Æ“x¨ökÛ‹ Cý\äý\ã\Ãø§\Ù\å\Üb?e~\Ñ7\ÛÃ‡ w¥Jòt®\ßQý.IÃ»’·»üS˜ü\Â~[Ð®C\î§{£úÀý¼\æ\Í\Í\"\Ô?\Ñ{½E©7)ŸŸd¶\Ò\Î§\Î\ÙYŒ\ãŽ)Äž8âŽrs¡\à¦\ËþyV÷\\‹ú_ú¼>Ð¾6§‹\Ùw\\ß­\ïL#\å;ü2*?¼`XG\Êed¹r	¤\ÌD,\æÔ²6­Y4]£\Ömy\ÆöR£\Ë>Q¼m;‚Lƒ# S\í3Aƒx“Tc\éF\Ìò„yG\ÊUø\Ó\ÐY‚•$V,bÐ–e\â\î“\ÄI\"†aL“”\Ø|n ¤ýoÀÅŸe\Ú\ÐW@KºHg.‚\n[’kpM\ß\Ú6¤\É%\îŽ`PÀm\Z\å\í\nSžxJBY%\È,óÁ¢\Çƒ¢\ë6S\ê\Â3˜¯\Ë\ÖCùðþzCG@Só\è\î\'–}a6R\ér@Oó\ãþÔ‚ŸžŸAÏ‹ûbÿ\0ŸXžI¥”(ùÿ\0h<aL?‚üÇ°)\Êa\Ûý	\×D?(ƒ·\ç†3ö…?2 ¦Y·¼\áG\Ïû_˜\Ó	²u‡g\ÌA\çý4\è\Ï\'¯vÿ\0Nõ‡ä¿½%\×(QœW\å\ì\Z:ƒ“\çîŽ÷™üÞ·Oü,òb?v{ô²K\Òe{u²z\Ï\Ý?\Ý>Fþe÷\ïÑŸÿ\0Va\Æ>ó½÷÷Uÿ\0zŸ½\âÿ\0~ÿ\0ú\×\Õ\Âi=\Äö“)ÿ\0!ŒŸ¸÷·\ß\ÐŒ;½×¿M\'ø,sGþ´ÿ\0ùY‡\äþô½ò{ƒûQ÷µý\Ñÿ\0»·O¿?yýùxý\Íþo\á\Ì>ó½ÿ\0\Ó<\Å÷\Þý\ï\ë\Ç(SóÀ«0¯ù÷û‘\ÏOzûÛ—~\è\Éþýˆg\ë §\æF\ä!ü\ÈúFs\è”ºC\0SºÁ|Èº‚œ…\Ðb¦BŸ\éGI\çÁã—°h\è‹¤h<\Ýü\Ä<²ŸA\æ=`\á„0\rNn_>\ë _>¤?\Â&R\ê\Ìò†sÏ )„Á\ç	ˆüÿ\0lCÿ\Ù',1),(3,'0011677737','Magoliman, Joanna Mae C.',2,'1999-05-01',20,'Santa Cruz',6,'123','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0V\0\0\0\0\0\0@\\«•\0\0\0sRGB\0®\Î\é\0\0\0gAMA\0\0±üa\0\0\0	pHYs\0\0\Ã\0\0\Ã\Ço¨d\0\0ÿ¥IDATx^\ìýwxWž\ïrÿ¸Ï½\Ïsÿ8\ç=3\ç¼gÞ™3\çÌ™9Óž™ž\é\î\éö´›v·¡ƒ\ínp`‚eŒŒEÎ @\0E´	“Ad„B(\0@$$H!‰òý­Z«ªV­\n»v´7ú~ž¯‹ª•jÕª½\Ë\ëû\Ûkouú\0\0\0\0\0\0\0\0\0\0„\0\0\0\0\0\0\0\0\0€B\0\0\0\0\0\0\0\0\0@‡@„\0ŽV]wÁ\á\ç¦\ï(*F…y-\0\0\0\0\0\0\0\0\0\Ä\n\"ðþ‚C¿³ö\×Ã—ÿzøŠ\ÎÃ–{ˆŠQa^\0\0\0\0\0\0\0\0\0±‚ü!y\ç¯–m+ª\Úy²zõ\áò?M\\M‡n¢Â¼\0\0\0\0\0\0\0\0\0bø}b\æS_-^ŸWþôÐ¥}fl\Úrô<iu\Î\é7’\×Rº\"*\Ìk\0\0\0\0\0\0\0\0 V!€®6=98\ã\í\ä\ï\î.¢\ß\r_\ÚyÈ¢×“\Öl,¨˜¹µ\à?\â3(\Ñ\æµ$2\ã:u\ê§†\ÊS;w\ê\Ô9µ\\ªh•4ÌšZ3™Š:·C\Òi­Å¬y\î\Øw=]HD¶5\0\0\0\0\0\0\0\0 D\à™±\ë~1hiÎ¶‚?ý¦\Û\È%£—gñ”±+÷m\Ì/ÿUü|~H¢Â¼–s¹„\ÍH.\î—y}Ý —§¦j{šÿ·ø~ý\È\ÝESŽQ\Ã\Zr #\Î\ÛÞ¸û\éB!²­\0\0\0\0\0\0\0\0¡ B\0OZý³3I¯ŽÿfÆ¦\Ã|\ß\Ð\à™Žœ1©0¯%Á\\n\\œ\Õr3s\çeÝ•9( 0\\¼»‹–Œ>\íÆ¥\Ò¼\r\ß\0‡\Æ\ÝO\n‘m\r\0\0\0\0\0\0\0@k¡­Hw@d·	tº‚‚q A‰aöDTþõ°\å?ýd:\×\Ê\ì\Í2¹flÈ™¼*‹\ïSa^K‚»\\\ÚÊŸ\Èó\ÚÒ¾õ\Ã}\æˆ\é«3–këˆ²Æ¿V\ß8#oEjŽ_ \'±\ã\âø¢£q\Ú\á%´”LQ\Ë<±ÙŽqŠÎ©©\â\ëRÿ”r.­\0\0\0\0\0\0\0ˆ2Èµ‰=	\Ç\ÄÖ£  \àÿýÿùÿ\ÒVk8&‹¸Œ_\rYòoq\É\\¾`Î–\Ã\Æ!\×O?žr\ètÍ¯¦\Ò>\æµ$„‹¦„\Ç&,4\ÏkfÈ»Tˆ¹b~\ÈôÑŒÑŽzƒ™q¢¨rF\Ú\Ów\Ù9x;,Qo‘7.ŸŸ\åŠlK³†¶§\ãu\Ø.\ß3+\èH­™\Å\0\0\0\0\0\0\0\0DÌ:Á³x™6£Àjø•Ã—ñƒ3þ¥\Ï$®¿<g½qhh\Ä\â­\Ó\×\î£*\ÌkI\èö˜ü¯nŽ5§«§	´cõÇše\ÖòŒ\"R{J5	^Q¯Î«\èyûf»z)¹A¶\ß\Ù\â\Û\å\\½Š\ÖO–¤6\Âö­§\Óp*\0\0\0\0\0\0\0 š Ÿ\'ö$x¢cVkS \Û~cGd„¸Œ_|>\ç‰^c¹&¯\Üù»/SCC?\î3þpù\Åÿp\æµ$g[Î¬w¦\á¿MÇ«eH\Î\\‚™kÿ\È\Å=³VŠ\Î)*\Ó!ûI\0½¼µYjH;¤}-`)e\ä\êõ­\íh(hû>‹\0\0\0\0\0\0\0ˆ&¢-@h\æ?RþŸ—ñ³\Ïfþè½‘\\SV\ï\î2 e\ìÒ­þz†‘\È5~ifòªT˜×’œ-\íªk\ìµ]ò\Æò/f¦\êN˜™fžÊª\êù<]w\Ó\Þ\ÎY+i\Ðz`úpv(XA¾+7(ö¥$VE\ì[ª˜u4\Z‘/GÇ±\0\0\0\0\0\0\0\03p\îˆB­\ã¹xb[vC¦ •B\0?ùx\Ú?¼ÀõQò’Ï¦/_´-\ç«ô\ÕF\"×¿¼?bO\ÑY*\ÌkI\ÈÎ–<°l¿M\ÇK¦1×Žf¢pó:²s6±{h\Åv[O$7*7h\ß\×Ê±]–¢ýX \ÃlI\îKul„\ï´ºn\Å\0\0\0\0\0\0\0\0D\ä\àÄžOt\Ìjm\nZ\ï‹\0ÿöa\Òß¿\ÏõoYw°hø¼\ïÿ£\Ï\èwF\Ï6\ÒE\î_Qa^+X\Èþ\Ê\Æ<0\å\Ür\Ã3\0\0\0\0\0\0\0h]\ÜB\0q\ÜV(¶?RQ\0q\Ï™õo~ý¿{|a\×?¼>\Ørø\æ\×T˜\×\nòóðò\0\0\0\0\0\0\0\0¢GŸ\ßö\æŸp4ü‰ˆ‹9x²\â™Ï§ýs¯qEÅ¨0¯\årÿ4n\0\0\0\0\0\0\0\0\0ˆR\ØgýNˆ\ì6„N\êhõ)1\Ìþ´\Ã\Å\0\0\0\0\0\0\0\0\0 \íA\0\0\0\0\0\0\0\0\0\è \0\0\0\0\0\0\0\0\0t\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0\0\0\0„\0\0\0\0\0\0\0\0\0€B\0\0\0\0\0\0\0\0\0@‡€…\0=zt\ï\Þý»w\ïÞ¹yÝ½{\Zð\àaKK?¥e55\Ýnhhºq£1:\Õ\Ø\ØL=¤kyô\Èù\0\0\0\0\0\0\0\0€\è§ùÙ±·ª>|(N«Cþ_ñ\ÛÑ¬††\Æ{÷î‹®\0\0\0\0\0\0\0\01E\'ò´ŠQ÷¯S§N;V¤$zK‰45\ÝRlvôQ\0\0\0\0\0\0\0\0\0±H\'Å¢ûùÿ\ÎÏ¾ý\Ëß½•—WðÇ—ûü\ÓS\Ý\ÇL˜¢”q”hhP\rvô‹ú|ÿþq\0\0\0\0\0\0\0\0@ŒbÀðÿ´ý÷g\ÞZ½fýo_\ì\é3@2¢\0Š»Ž!\n\0\0\0\0\0\0\0\0 \æ%Àý?9ÿ¼¼‚“\'‹Ÿú\Ã[?\ïò\Æ\Úõ›–¯\\­”ô(\Ö:†\Ô\Ð\Ðø\àú\Ó\0\0\0\0\0\0\0\0@\Ôt€ûòü‡r›8upÂ¸cÇŠ~ù»·~ò\Û\×ö8¤ö^ñ\ÕU<ÿõ\×\ç—‡Û‡>a0t;O\Ü\ÉÒ†\î4\ÊP•\'žx}~±8Œ \Z\Zš\ì?p\0\0\0\0\0\0\0\0D\'Á…\0¸ÿ\çnbbêŸ~ó\ÇO¿õ\Å\×c\n\ãQ€¬}û•*¢\Ó+¦: \ä\0óÿ¦\Õ/#§¯Ev}\âõ\×_¾]Jo¥\0	Q\0\0\0\0\0\0\0\0\0±B!\0\áÿ;w\'Ÿ?9%\ÌÿOº¼ÿÓ®=ÿõ7oþ\Õè¼¼‚\æ-\ÊÝ¹kR\ÑMtz\ÅQ”(\ÎxýõŒbk®¦CŸ>t¨¾(€>”*¹‡\0ŠŠŠ\rúòÄ‰#¥°ð8¥”•6R<tófÓ£Gøh\0\0\0\0\0\0\0\0Q‹\ß€\áÿw\ï\ÙGþŸlÿ\Ï~÷Á¿ÿ¾7×¿=ó\î€Á£rsó~\Þ\å\r*³%s»R\ÝQtz\ÅN”`\Ëû¥\Õþ’X`ûö\á<W+¿“m\ÜC\0\ä\ásrr¿ür0ÿ§ý\Â\Âc\r\rMr1Ý¼ÙŒ(\0\0\0\0\0\0\0\0€(\ÇW€ûÿyºûö»’§\Îú·ß¾ûó?ôù\Åûý\â}\Éÿk;ý~\Ú\åýƒG\í?p\è\ç]\Þ\à%•F\ì¢\Ó+^: \ä€ü£\0’´€Ø–i\æŸo•b‘‡\çQ€-[2¹ÿ§¥Œ·\0\0\0\0\0\0\0\0\åø\nÜ¸\ÑðñÀa›·dN™žþ“g\Þ%\Ãÿ\äsq´ó“\ÎÝŸy±\ç¿ýö:$ý´k\Ïþ_\ËÚ·ÿ½~_\Ö\Ö\Ö*\ØE§WŒt@ù]À~)€lÿÎ¡\ì\ËC\0$òð\ëÖ­ÿè£33·\ëÿ¹\Zoµ´´ða\0\0\0\0\0\0\0\0¢ ~\àÊ•ºþU²ú¿|þ“ÿ\èöñÏ»¼A)”þ\Ú{Ÿý\â})‘ô\ã§\ßôÿ‹€tz\ÅE»i»þ\Ý~ó\Ã\Ï\ß`¿¸}ø\ë+\ì+PXxüó\Ï­Zµú‹/,¿”\0\0\0\0\0\0\0\0µx\ê\ÅOIÿñü\ÇO?÷Oÿxà°Ÿÿ¡Oÿ×§\ßj€\áüX\0\ßwù‹\0ü\Ï\ÐwþC\0ùùG\rú¢°ðXS\Ó-ùwB\àc\0\0\0\0\0\0\0\0DÁ†\0^ûÕŸ~ùB#ð^¿/ñ\ì‡<ý_\Ó*!\0ýoû=ñ„õ“\Ð\ÑCFÀP€À…‡\ra|ÿŸ¶99¹£F®­½\"ó¯\æ\æÛˆ\0\0\0\0\0\0\0\0ˆ6‚t~\és\ÒS/~&‡\0ž\ì\Ç\Óÿõ7o·N Æ„(\0\0\0\0\0\0\0\0€h#¸À?=\ÕÝ\Ó\àjn¾Í‡\0\0\0\0\0\0\0\0ˆ‚D\\tz\Å6?fºu\ëe\0\0\0\0\0\0\0\0 \ÝA u…(\0\0\0\0\0\0\0\0€(!€V×;÷øX\0\0\0\0\0\0\0\0\íB\0m!~±\0\0\0\0\0\0\0\0@;\ÒIü\ÛN(Vù1¢\0\0\0\0\0\0\0\0\0Ú—N·nÝ ‚ ‚ ‚ \è±B\0AAA\Ô!„\0AAAu!\0AAAAB@AAAP‡B\0AAA\Ô!„\0AAAuy„\0v\'ü­L÷§\ï\Ü\Ú5ôo_]xšr\ÈH9\×\ßþm\Ân¹À®„¿M\Ø©“Ò¹´k1S\Ê¼ú·		‘½\"Y.ö\Õ\å¶m)\ë\È[‡Ý¯\"übR§¾*zjÿ#/öŠRð{£#;˜ÁŽŸ³·ú\í¦\×\ä\Ð]®‡’\Ú÷…AAA1(\ï€\ËÌ›\áÉ·ç¹Œ€‘B\Æ&Œ³Ÿ^\Ð\Ý\â\Ç\Âk-Hi\á\éZ\ÔKkkYFž:\ãj=F©=õ\ß\èxõ¿]\ÂK+’ƒ\ÑÁi»·‰ò4p8 \0AAAAª#†\0”\êjD Ue\ïy\Û9+G)#_¾\àUe‰„.~¶£k\ç\Ñ¤ºÁÁŒ\ì\à´\ÝP#\0AAA­¥ C\0Æœ[š|“…+CŸŽ;\Ïò\Ù\ç–:\ÒôUÖ¡ŸN6ºú¾\ëQ\ßDaósT²Cn¶\ÄSN\áýÚ©ú‡´F\ÈC[\Ö\É\î\ì\êÊ«	¨|¨Qu\äÅ©\éDÊ˜«YR¯\äž\ÂN$0º¡WŽCõ`\ÇÍ½|xk\nl¶\Ù<‘Þ²š\ÂNÍ«8ŒX\n48\æõ‹5\În$,\Åú0\ËM0Òµ\Æ\Ù{D\'ŒnË¯Ió\Ð\é69öÖ¨AAAE¾@ñ\'òŽdf\Â0¢„³yf?,)a iv\Õh\ÊýŠh«™\Í\éeB»R§!\ÒŽt^Ó‡+cK)†;2s\Ë”Ôº\â\Ôö§17û)EI”\äeœ<¯&:…À­e\ïqó.Ž”A£fõC1P\î)#’\Ç~FypŒb\Ê=u|§He\Ä+A4®¿g\Ù~°RŸ¢{Ô¸ý6¹õV4AAAE\á®0\rGŸ£)‡sÉ¶P5\á™\"M»´Ì³x\\N\ß\îJ`Nƒo­\rú’|QBÌ½¨‡_¯COŒ`2lžGy1\Ô\Öq`)Ò˜«Yr¯ô«p(c\ì\Û\Za\è\×ŽX›\ì‰&\Æ-Pù0d}¡Ò‰\Ì;¥\r”=\Å<5\íð\î\è#¦ŒÁqxÊ·\Ï8»œH3®Å©5Kýtx\ÏjûAJyMŠC\Öe¬”ÞŠºAAY€\ê(B‘Ã¹d!ö³[Uh\Òl|¹ù\0¯+bñ‚]š½\ÑL\Î\î¯\ÚFÆ§äž³3j«—y\n\êÖ…_¯COŒ\ÐDÑŠ…\Ðd·[¬5jY\éŒ\Ñs‡,¹W\ÚU8”\á¹b=¹pt‘x\åX¥urA\ãpœC—õ…j9‘6PöÛ©\Í\ÓSB•ŸÁ1ö•D\ê˜q-Neø]\æ[Þ¬¼¤\ì¯I—ŒGoù>AAAV…ý[\0´£“_ò<ËµZM«³\nQ»†¾š0\Ôl\ÇóŠ\È.¾Êƒ\ì\Ô\ÝÙ¢\0^+h1Gg8Ö¾ñ1¯yQ\Òõ*=1\ÇD¯’0”/g)A\Ë2ò\ä²øõ\Ò\éôN\ê+ºõ\î9dI½\â>\Í^Fòoú\Æ9X±Š\Òå‹³;nË‡,óžj’š5»\ê’\â0bA\Êup\Üû`\îÛ‹\×\âR\ÆúJ\Ð_\ÃZnR®\×ý\ã\Ò}\Ü ‚ ‚ R=?hEkŠfó\Zd¿†\áBk\Ät)\ÞWd\æê¾—§‡\"\Û\Å\n÷\ËZ\Öš ‚ªöD\ê¤Q%<\Ãc\íŒ\é\Ã-\éZgŒ1·eQ¯Dn\ÕF‡#ñÊ‘\Z!ôþ;nÊ‡*% Ÿ\È\ÞUžbž\ÚaÄ‚U€ÁQ\Ï(\íÓŽ¨¨¿\0\ä2zE0ß³\æk8xÑ‰ä·¶y\èz›zAAAƒ<B\0PÛˆ\ìh\È+ù³A’d\ïCR8¯\ê\àno!‚ ‚ ¨£!€˜•ö\É\'\Ö<C­¢Lµ¼\è M_™@AA?!\0AAAAB@AAAP‡B\0AAA\Ô!„\0AAAu!\0AAAAB@AAAP‡B\0AAA\Ô!„\0AAAu!\0AAAAB@AAAP‡P(!€?Ï“^½z;V\Ô\Ü|[©\è¡\Öh\ÓMÇŸHI™2zô˜1c\Æ&\'§\ä\ç*\"«ŠŠsK—~3n\ÜøøøøAƒ¾HHHHJJÞ¶m\ÇÕ«×•’AAAP\Äu\íÚ7n*‰Sf`üŒ\åÆ¾·þü\ç?ß¾}»¡¡F‘o‰\ë:W¯^­­­%\ÇKŽ½©\é–R\×M­Ñ¦£¨‘5k\ÖÜ¼yó¦¦¦\r6|ù\å`¥XD4þ‚.Y²$//¯¦¦¦¹¹™ºNg¬¬¬\Ì\ÎÎž={v¿~ýö\ï? \ÔrÔ›\ï¼¬”\ìR\Êû‘Ò‚]Jy?RZ°K)\ïGJ\ÞR\êú‘\ÒB\È:p0gèˆ‘““S\Òf\Î\"MNJ>jL~ÁQ¥AAAÁŠ;\Ç\å\ËWœ;wþû\ï\×nÙ²µ´ô\íYS¡¬ »\Þ\Ø\Ø8zô\èþýûýõ\×W®\\™:u\ê{ï½·r\åÊ³gÏ¾üò\Ë\å\å\åd\ã‡qô\èqŸƒ\Û\Zm:ªoß¾UUU\Üÿs.]ºD\'ºq£A)¦Žß´i\Ù~…Û·oß¹s\çÞ½{÷\ïß§ý”””eË¾Q\êÚ¥XP?RZ°K)\ïGJv)\åýHiÁ.¥¼)-xK©\ëGJ¡ifúœ}û÷?zôH¼5>|¸k÷žyó*…!‚ ‚ \nJ³f¥\ïÙ³wÔ¨Q}ôQ\ïÞ½ûô\é7n\ÜømÛ¶Ï›7_)Pƒ†\í÷EI\Ü\à³\r>ÿ\Ñ\à³~qª\ï\ç\Ç?p¸Wÿý\ï’eW\Ïþûz}º¿gÿ\ìa\ãóxƒ\î\×\ï\Ã4zô˜Hµ@\nq@SSÓ³\Ï>›••U__Oú\ÕW_­¨¨x÷\ÝwÏ;÷\Ç?þñøñ\ã\äu)\ë\ë¯ŠŠN466+-\Ø\Õ\Zm:j\ëÖ­\ë×¯OOOŸ?þ‚\æÌ™³v\í\Ú-[¶\\¿\áÀ€4\Ë\ï€¸{÷n·n\Ï+u\í\"Û¹-ü\ØÔŽÜ¦¬\Ön\ßM\'\'	\ßocô¸	Ja‚ ‚ ‚|\ê\àÁœüü‚iÓ¦½\ãÂ¬Y\é99‡IJEý¾G\ÞS¯—=ý^õoÞ¿ôô»žzõt\ßA§6m¯Þ¸­jc\æym«Ü´­jJúÉ—\ß\Û\Í[x\íµ\×/^¼e\ËÖ ”ž>›<|P-ô\íÛ—üuw—^z\Éh\â*\0ò±;vì 	&œ9s†‘\Ìùó\Ï?þüy²\ë<¸\ïnSc\ãð\á\Ã\Ë\ÊN+-\Ø©62Æ/l–D|||P!\0?\áº=eeeš\åw€-c¸s‡üÿÎ;Ÿ{\î9¹¢£\ÈvÞ¹\Õ\ä_~ljGk\Ó\í®E¶\ÏþCi³fÏ™;Á\é\Óg<xÀ_‡÷\ï\ß?}¦<c\Ñ\â)Ó§+…!‚ ‚ ò©³gÏ“|[#..n\á\ÂEŸk\Ðòôw\ß}÷Â…\Z¥¢\"ynÿì›¥¿\ísñ÷Ÿ5ýa\à\ßõ¿ùô;\Õ#“.’¥óV\ÖÁš—\ß\ß\Ã[xÿý÷\É\Æ*\êÈ‘¼\Ï>T#FŒ «\ë«CµŒHaýÀ…hÿÐ¡C¯¾ú*\í¿õ\Ö[UUUd×;¶k×®\Ì\Ì\Ì÷\î\Ý[iÁ®\Öh\ÓQ\ãÆ£¦ZZZ\Èqý\Î¥b°\êß¿ÿô\é\ÓSSS=zó\æMaýu\ê\ë\ë÷\î\ÝKY¾|ù›o¾¥Ôµ‹\ÛTj“Ã½¨8p:ô¶©\\¼\Í\ëW\ëh\Ç.Þ¦,JTZ°Ë¨h´c¤\\¹\\;köl\ÚòC.\ÊUZ°\ËhÁ§ü´)‹·/\Æ.Bc\ëG‹—,»}\çÎž¬¬)\ÓR\ÇOš<a\Ò\äi©iY\Ù\Ùw\ïÝ›=wžR‚ ‚ ‚ ?JMM›4i2Ib\æ\ÌY×®Ý Ä‘\Z´sýz%ò\ÜÉ“\Ó\Òf½õ\ÜÛ§»|Xÿ\ÇA÷žýò\Ñ\Þþ\Í{µ#DH{÷W¿üþ.¾ÿ\Þ{ï••2²|\êð\á\ÜO?ýŒ\ïûlaøð\ï¼óNŸ>}\ÈÿÓ–j-B\\@vý\ÓO?>|85z\éÒ¥”””>ø`Á‚\Õ\Õ\Õ\Ï?ÿü_|1`À€ýû÷Ÿ8q¢¦¦\æ7\ÞTZ°+Rmd¬_¿>99ùë¯¿?~üØ±cÏ¸0yòd¥¢,?\á’\Ï>ûŒ®¨®®nÓ¦MS¦L™ 1q\âD:/5>{ö\ì455Qÿ!\0ÿòcSy›×¯\Ö\røü‹eV(En\Ë›¼°¼s\å\ÒÅ…\Õ]¹D[9\nT›\\«¿[¹(cœ¢È­M·»¦´P\Þ}öJ›•>‡øogÊ´T¥0AAA~tô\è±74RS\Óø_”»q\ã\æ—_&ñ¥ß”HY¼Ì‰\ÅFE»\ä¹=\Ä\Õÿñ‹{\Ï~ô‡\Ïoýæ½š\á‰\ÕF®›ö\ì¿ð\Ò{;ù~‡\0ø\Ï\Ðö\Ýw\ßuø·.d\×\ïÜ¹Cö•ümcc\ãÍ›7\Z\Z\Ê\Ë\ËGŽIæ¹¾¾þò\å\Ë\ä\Û+++«ªª®^½\ê\Ç\â¶F›Žš6m\ZY,jœ\Zù\î»\ïö\ìÙ³e\ËJÙ®A;tH‰d×•ŠÁŠ‡\0ü\Ð\î«\0&%&ò\ÙSHþ\Ûä…	CgÍžMþŸi›>{\Ï\â¹JvMq\ršÀw\Z®¯Z¹‚v\Ö~¿úZýžHòÓ¦,Þ¾;}0+\ÌX0Ÿ\Þ0/½ôRß¾}—,Y\\X÷\å—_†Ð¾›IX²ì›ªª>d¾_û-Àó\ç+\ç-Xøõ°\áJa‚ ‚ ‚j\é\Òe_}õ\Õë¯¿þþû\ï_¹RO)G\'\'L–ø­·Þ¢‰=÷üuuW©\02d\È7\ß|kT÷\Ðs\ïœ\îòQý\ß}ö«‡ø\â\Öozú¼/B\0d\ÅCô\ïÿ)\ß÷\ÙÂ°a\Ã\ß~û\ít¨–\Ñ)\ÄU\0w\ï\Þmnn&\ÇNc7L;aü1¿k×®‘Í¦,Ÿ!€ˆ´\é\Èhhh\ìÚµk÷\î\ÝÿE\ã¿ø\Å\âÅ‹\ïß¿\Ï\r˜\Ì\èÑ£•º²ü„KZ#\à_~l*oSx)€v”\ì’¢CsÀ¢E´\Ï\ËðbJvñ¸6m\Üð\Ê\Ë/¯Yý\í/ÿö›Se%´s¡ò\Üüys2nmº\Ý5¹}®\×\ê|öÙŸ4^{\í5¾?xp\Ó\Í”\ë\Ýgÿ¡´©\Ó\Ó\è%½}\Ç\Î\ÅK—\Î[A\ÎÑ’¥;w\ï¡W{brŠR‚ ‚ ‚ €ª¯¿FFŒ\æðIIIt\Ø\Ø\Øü\á‡&\'\'_¿\Þp\íÚ”””?þø\æ\Í&Ê¢}*ö\Å_^½zÍ¨®HžÛ³À\'u\Ï~u÷¹¯það­\ßôªžtÁ\Èu“x\çwB\ä\äþ\ä“þ|\ßgC‡{ë­·z\é¼ýö\ÛF¤WÜ¿¼\ë­[·´/¶3\ßn˜v\î\ÛÙŸõ\×|;eùD¼ME\ç\ÎU¾ð\Âÿü\Ïÿü\ïÿþ\ïÿ¡A;tø\ë_ÿúÒ¥K4\Èü¯Y³f\ëÖ­Ã†\rSª«O?ýT3ø +õŸS·\Ú*\0\ãKòWŒ/øo\ÓQ\äü\ÙoHþŸB›C¾\æ;‰“\'‰ò¾Ÿ6eñö\Å\Øi£7þ<òü_~ñ\Åù³\åtx¢\è\Ø|@)Ë¿YBûn\ÊX´˜Ç›\ì\ÌJŸ£† ‚ ‚ \È[\ä\í—,Yú\î»\ïu\ïÞ¶_\\\\Jû••Â«\ÓR\"\íû\ír\Úÿý÷-Z\Ìs½\Õ\í\Ý\Ó]?­{ö\ë»\Ï\r}øÇ¯nýöƒš~B\0.¼\ÔK„\0ÈŠ—––Y>•“sø\ã?\áû>[:tØ›o¾\ÙSç­·\Þ2Z ½\n ¼ü\ì\Ïþöµ‰\×_?~üÙŠ\nÃµ“3\ç¾]6\í~,.7\äw\È‡Ú¦[ \ãÆ›\Ï?ÿ\Â\Ï~ö32ü\Ï<ó9½\ë×¯\'%%\Ñ!%¾ø\â‹w\ï\ÞöKã«¯†(-\Èò—\ÐøŒ7þõ\×_ÿ\ÉO~òõ\×_W\Ðøx²nÝº‘#G)(¢6Ÿ\êü\ë\×_4~\ÜØ³\å§Éˆz+ M5\Ú\ìÑ½ûK/¿\Ì\Û4\ÂòŒ}ÿmºõs@\ÂP%%„6@r’\ÙI?!\0·»Fåº\\ô  \Ã¡òœ‘’µ—R>ùøc\Ú÷\î³ÿPÚ´\éiû4¾Àyð\àAÖ¾ì™³f+…!‚ ‚ òVSÓ­ƒõ\é\Ó\ç\ÕW_]¼x	¥TTœ¥}\îùI%%e\Úßž?KûK–,¥ý~ýú8p*òŠ\ä¹}·÷Nwý¬î¹¡w»\røÇ¯›Û§zDrp!\0²\âa†\0|¶0”\é{:o¾ù¦sÀuÙº5ó_5~ó›\ß<ýôÓ´ó\ãÿxÛ¶mÂ´k¶\Ý0\íÜ·S¢Ÿ€ö?ƒö\ï‘¿s\'\Ì6Í™3¬>u»K—.]»výè£\ê\ê\ê&OžL‡”HYƒ\r’W|ù\å—J~dŸú§úö\Ûo5³o®\"77wÔ¨QÝ»wOIñZõmoóG?úÑ¶­[È‹òO­	nSÅU\0ö6Ÿx\â‰~~8z\ì¸~q?\á\ÓŸó6I>C\0Î¯\r­ŸFuCr¢ÒŽ,\Ç6{¾/ªË¶\Ò\Ä	Æ¾w›vñþˆ±\ë\ßÿvs#¹}z\Ï\r’*Ï5ƒmŸ«¶öò A_\Ô\Õ\Õgg\ïŸ?Á\å\Ëu7o6-Z²\ìóA_Ž;ŽüË¯¾9z\ìÀ/¾\\ö\Íò\Æ\Æf¥:AAAUTt²OŸ>¯¼òÊˆ\ì÷ÿ¯]»þö\Û\ï0ðÐ¡\í¼ñ\Æ\Õ\Õ)‹\nP±~ýúQ£º‡ºõ<õ»Ï¯<7\âN·Qž\Öô\Û~F¤ø|°ƒ\ï‡øè£ù¾\Ï¾þ:\áµ\×^{W‡.\Ùh\Ä*€òò³?ý\éOŸ|ò\É_ý\êW555gÎœ¡:¤\Äó\ç\ÎÞ“\\»l\Ú))\Ø€BPmº2^z\ée\ê\í3\Ï<Cžÿ«¯¾Ú±cGRR\í”HY/¿ü2ÿ–3`€ù‡\ír<‹\ÛøüË¿ü\Ë\Ûo¿M¯-â£>Š‹‹\ëÛ·/\í\'\'\'9r\äúõ\ë\ï¼óŽÒ”!1¯ð\\\àaS=\Ú,>Y$þ\Ï\å\'à§Ÿ\Üi\Ë;|_iÊ[›?ù\ÉOx›\É\ÉI\r\ì\Ëù·š\Z\'Oš°M·×†\Ü®ž={’\á/+)6R2·n¦”þŸ|Bû}&9ž¥¡¡ñ“OúSÿiK\æÒ¤\Éô¸¡¤¬›7›*+/\Ä}\Ò\âä¤ššZ¹AAAAi\ç\Î]dô\È\Ü\Ñ|›¼ý!C^}õU\Ú\Ò!%’\í\'?üñ\Ç\ç\æ\á)\É\É)Û¶mW\Z1$\Ï\íY\à‹+\ÝF\Ýy~ÌƒgG4ý6.\èÀ›o¾B\àÐ¡œ¸¸ø¾\Ï¾þ:¡GdB9¯½öš\Ñ)ˆU\0\ã\ÇOø\Å/~ñ\Û\ßþö×¿þõÉ“\'óòòh‡)q\â„	\îß»\ïî½»w\î²@€±¿ù\Î\êh!\0\Ê\n­ME\Ô\Îo~órûŸ}öÙ†\r¨…¢¢\":\äP\Ö\Ïþs\ã/\ìÝ»·ó÷|\Êc|ÆŽ\Ë\ãŽx\\‹G›\ãÇ\åŸZÜ¦Šƒ@«\0<\Ú=jdh!\0\ï~\ZÕ•¾¯4e(`›\Å\'Šø_Ø¸~]\î\áC~\Út\ï;mô2\Ì\'\Ãß¯_¿\Ã9‡.\×^Ü±}½\Ù(å›¥KBhŸD\Ï\Zòÿòÿ\ÍÍ·?ø\àƒ÷\Þ{\ïÚµ†\ÓgÊ©A®Á_%(!‚ ‚ \nJ;v\ìü³7ùtH‰õõ×®]»A;ùù…d‰_z\é%^&++Û¨\è­n½Nýnð•nc\î<?\îÁs£šžù\èÂˆ)C\0{^x¹·h_¦\ã­ \é\Ñ\ãµ?Œ3Zð2\ä\ëW_}•,§GF¤ V¼ûî»¿ü\å//^¼XSSSQQqö\ìYÚ¡CJ|\ï½w=|ð\èÁý‡f @¬	¸{÷n˜!€ \ÚtdP\'Ÿ~úi²úø\Ã¦NJ--Y²„9”E\ÆrÔ¨Q£uh˜”d9ž\Åc|\Þ~ûma÷ð6\ßy\çm\îx\åaS=\Ú|\ë­7?ðù¸ñd_\n­M£Ÿ†\Ñ%ñ”ðÛ¬<w\Ö\Ø\Zrk\Ó\íµ!÷‡«\áúÕ\çWøð\Ã/VWyô™\äx–\ßý\îw\"\0 qòdñüùhg\ìøñ½ú|H\r:êƒ¾\æ‚ ‚ ‚ ?Zºt\ÙÂ…‹ø¾W¯^\Ê:ÿ\ã\ÇO\Ä\Å\Åñ\ÜÅ‹—ðŸp“<·\ïöÁ©\ß}u¥Û¸;/L¸ÿÜ˜¦g>¹0bª¿@xýõ×Ÿþù‚¤[·n†§ü„\0¾úŠ­zxC§{÷\î!†\0\Þ{\ï½\'Ÿ|’œA–Œ»2‚\ßÿýGŒ‡=xôðþ\Ã÷Ü»Ç¿\Òÿ\Þ=‹Km’\Éw$//‡\0‚m\ÓQ¯¾\Úý×¿þ5Y}¢  \à\Îvj~\Èyù\å—\ïÜ¹g\èÞ½ûJ\å1>\äf…Ý·\Ñ\èùG=\Ú|ýuG7®\â \Ð*\0\ï6ySŽz\Út•§Zb\ìôÁ<~´p\É\âE}û²Ÿ!\ç¿t\É\âÞ½{\Óc‚RR¦LQZð£Y³\Ò\Éó?7J;t8}z\ê±\ã\'©\\X\0AAA\á\ëÈ‘¼=z¼¨Ó¿ÿ§IIÉ¤O>\é/’^|‘\nS*z¨[\ïS¿r\åù	·_˜tÿ¹qM\Ïô¿0bZp!€\×^{\Ü8\Ùø  3ß¯ß‡F%%\â§\r=ô\ÕWC\ÈÞŠú\ÖHA„\0&MšôóŸÿü_ÿõ_ÿñÿ±¨¨(\'\'‡v\èµ\0\Ç\Üpÿm=,\îªU\ßq\Ãog\ìØ±z ˆ6\Ý>\éMOŸMŽ\ë×¿þu·n\Ýnß¾]ZZ:{ö\ì?ÿùÏ”BP\ÖÌ™³”*r<‹\ÇøŒ?^8~+V¬ðø‹\0mNœ0ž›UGy\Ø\àÛ¦ÿU\0ŽºPyžüÿŸþô§Þ½{Wž?¯4b\È\í,G\ée6þ‚“\'‹iG\Æ\Ï\Û‚ ‚ ‚ Ÿ:~üDm\í\å\é\ÓS\Å\'\é6\Ò\Ó\Ó++/œ8Q¬TTdY\Ðû\Ôï¾¾üü\Ä\Û/$\Þ\ë6¾\é™O«GN«6rÝ´÷\à…Wú\î\âû=zôxõ\ÕWid\æûö\íg´\à\Ç;\Ä\Çõ\ÒK/ñ\ê„\Ü)ˆÀ™3O?ýô“\Úï±8q\"77—v\è°s\ç\ÎUUUšQ—\á¦ýA\ËÃ‡!€«W¯?ó\Ì3\Üó+Pzmm-\íˆö¾\ÚtT}ý52ü\Ô\ÕgŸ}¶¢¢‚:<j\Ô(:\äÐ¨¯¿ªT	Vn\ãó\ÔSO\å\å\å	Ç¯\Ñ\Ð\Ðp\êÔ©\r6|ö\ÙgŸ|Ò¿®®^iÊ[›Ä«=^\'\ï\ê!¥)C¹MG)u=4oÞ¼?üðOú\Óôº|¹Ni\' üüƒ>hn¾=a\ÂD\áþõ+þS¥AAEVó\ç/8u\êôð\á#\r\ZÔ³g\Ï>}ú|ú\é§cÇŽ%çŸ‘±P)P\Ïõ.\îúÕ…\ç\Æ7t›\Øô\ì\Øk\Ï|V5rºÀ¡\êWú\í\æû\ä\Æ_y\ån\ËýCf¾OŸ¾F~B\0ƒÇ“ù\å\Õ	¹R!\0Rf\æö\ßþö·\äÁ~¬A;t¸s\ç\ÎW\Ñ\Þv}üø	\Üó\Ûùö\Ûoi\Ë’Ü¦£h°\È\ê\ã%A·!„ft”}|\È\Äö\í\Û÷­·\Þ~Aû\Çó\Ï?ÿ§?ýù\Å_¤\×_RRr^^Ò‚]Žc¾eK¦R,(u\ä6\Ã\ÔÅšš>ú\Èû+Cnª­½üö\Û\ïLžœxùrÿüICC£R‚ ‚ ‚ Hi\í\ÚuuuW×­[¿m\Ûö\êê‹›6mV\nø\Ô\Þ?òt\\I—AU]¿¬\é2¨ò\×}\Êú-[¿½rÝ¶s\ë¶U8\é,e¥\Ì-z¥ŸXÐ½{wr‚\ìG‚Œ¤aà©…2Ö­\Û\à­^½>ÐŒ§@n\\€tútù³\Ï>ûK\ßþöº²\Ð\Þ0PiDÖ±cE\Üð\Ûy÷\Ýwi+Z±\âÝ¦›®\\©Ÿ5+\Ý\Ð\ÎÌ™³(Q)Žh|&Nœ\Äÿú\íœ:uF)‚\Ðfd\ÛSW¯^WRü‹\êÒ›vÿþuuõŸ>¨¶ö²R\0‚ ‚ ‚ (\Ô\ã~4¢´ÿ\è³ýÇœÿdô¹GžþpXQß¯ôŽ?\Ð{ð>\'\ígYñûG¤\äñF\Zõå—ƒCPrr²\ÑBß¾ý>ø ··\È,»µ@\n:\0AAAAJw\ïÞ»{÷~Hº=-€ ‚ ‚ ‚ !„\0 ‚ ‚ ‚ ¨C!\0‚ ‚ ‚ \ê\êt\ãF#AAAA½€ ‚ ‚ ‚ !„\0 ‚ ‚ ‚ ¨C!\0‚ ‚ ‚ \êB\0‚ ‚ ‚ ‚:„€ ‚ ‚ ‚ !‡À¥K—!‚‚•ò$!ý¿ŽC²”ƒ ‚ ‚ V•2?\'!\0APd¤<IHŠ†”ƒ ‚ ‚ V•2?\'!\0APd¤<IHŠ†”ƒ ‚ ‚ V•2?\'!\0APd¤<IHŠ†”ƒ ‚ ‚ V•2?\'!\0APd¤<IHŠVµº\á‡ú\ËÝ¼S\ÂV|\éY«\Õ\Äö’2bª6\ry¢\Ç\ìBï”°EMÙ¤&BAA¥”ù9	!\0‚\"#\åIBR°ÐŒË•\Ü\ç‡0\ÚñT!\0\r†#eÄ„\ng÷\à>?\Ì€ÑŽ§‚øk‚ ‚ ŠZ)ós’\ï@ñšQýúõK\ßgŽZSl\äzk_z?ÿ…IA5APtHy’,„€\"„\0 ‚ ‚ Ö‘2?\' ˜•7[Í¥#\0A1(\åIBR°¦\Óõ?0\Èl3\Ã·R;\Î\ß+P™\ÅKþÀ-½µ\ÒJ^\Ì0ü´cÀSº\í»+Ž\Ís5d\È\rª\çò\Ò\ß%•NÎºò¿K”ÿ“RF)=©\ÄH1¤Œ˜¦£³{<Á ³\Í~$œ¿W`ó^ò	n\é­\í\ÙÌ‹†Ÿvx\n|qlžk\È£¹Aõ\\AAPlH™Ÿ“‚\n¬Ù·f”X ¹ô}\éýZ\å‹(+}Ÿb\é\Í\â\Æ\Ò\0k¬q.ó˜·–ž.\Ö$°\êó\æ\Í\ÓZ\Æ>ö±\ß>û\\Ê“„¤`!yÀw3f°Dr\ì•ûN{„\0\ÈÀ³´oT—\ÛQB\0f;\ÌØ‹½Œh\ÊzvVFo\Ð\á\\žúY\Úi#\nÀýÿ?O;%0¤Œ˜¼\n€n–\Èüø\ì£!\0­\ÒQ¶oT—\ÛQB\0f;\ÌØ‹½ŒhŠR¤³³2zƒ\ç‚ ‚ ‚bA\Êüœ\\ X³\ã6W\ÏÅ—ûón\Îõ³°^Ý’hHoÁ’e4«\Ø?\"‚ \è‘ò$!)XH¶\î†Á\æ]NQ\Ä»õcy÷€\é\áõ\ÚZ°žK	8œ+x Ë¼\nÿORFLH¶\î†Á\æ]NQ\Ä»õcy¹kÀôðzŠ^[\Çz.^\Æ\Ò /eœ‚ ‚ Š)ósR°!\0ý‹ý²K§p\æšõ\×\ÒÉ±\Ëu\åZ-¸\ãûrŠ¤p>\Ã\Ä>ö±Ú¾,\åIBR°Ph!\0!¾\\¿!žö\ÝC\0\Â\Ò[SŒ €t.5 $Ë‡^X|6\íPý\ï\æW(é²”\n- Ä—\ë\ÙDû\î!\0¾URŒ €–\Ä\Ï%\Ê\r\nI\ç‚ ‚ ‚bA\Êüœ|€\íõK_£jG\Úgþ¼„VX3ÿ\" \×5±&*-83ö\å‚¢FÊ“„¤`!§€°\è\î!\0\É\ÃWf)!\0Óº³\ïð33o¶#¥\èfžý(€\ç*\0‡s\ÒÿI)K\Üw\å\å¥\çŒo8J1!§€°\èRŠ\"Q€\íof†vŒvL\ëÎ¾\Ã\ÏÌ¼ÙŽ”¢›y*\î½\nÀ\á\\AAP,H™Ÿ“B\è\ÚóC#v\ÌõùZ	£¼Y—\Òõ2rEcÇ¾\n@ª\Âòù\Ì\\¦p>\Ã\Ä>ö±þ>—ò$!)Xÿ±½†xf\Ëuø\Çø\î!\0½Cò\çYtý—ü~h\È\Ò?ÿ\'¯q·’ÿ€ó\ÏZC\0fƒösy\éGS˜ÿ\ç\ëÿ\å\ß°K1]ü\Çö†lb¶\\‡Œ/\Ùr›x-†\ä\Ï	²\èú/ù=1d7óš\×`¿7\ÈS˜ói\Ú)¤sÑ®V\Æh\Ð~.‚ ‚ (¤\Ì\ÏI!…\0øø\é‡< ÐýDŸð\ê<‘\åóòr]QZÃµfö\Æ÷´#\é\ç\0Íž@%Rž$$\Å\0?–úO£OŽ\ÚyIþþÿ\Ï\ÒN\Û^ûÿy\ÂH1¤ŒAAµª”ù9\Éw \â\"\ß\Ï>A…”\'	I1À¾e~¯#~º?Ö¥Œ˜o™\Â\ëô\à?\ÝAAAR\æç¤¶H‹\0ø÷ÿ!zL¤<IHŠ†”ƒ ‚ ‚ V•2?\'µ\ß*\0‚/)O’b€!e\Ä ‚ ‚ ¨U¥\Ì\ÏI@)O’b€!e\Ä ‚ ‚ ¨U¥\Ì\ÏI@)O’b€!e\Ä ‚ ‚ ¨U¥\Ì\ÏI@)O’b€!‚ ‚ jK)ósB\0EFÊ“„¤<€ ‚ ‚ jK)ós’C@ü.\0\0\åIBºu\ëAAA\í%e~NB\0\0”\'	Iy\0AAAÔ–R\æ\ç$„\0\0\0‘Ay’”AAAm)e~NB\0\0”\'	Iy\0AÔ¾\ïU\Ðú(#AA\í%e~NB\0\0”\'	Iy\0AÔ¾\ïU\r 2\Ê\ÈCAP{I™Ÿ“\0\àñ\çú\Í&±\ç\Ò\Ó\å|§¥¥…\ïøAy’”\Ðc¬×®\Îù‡•iØ•ô\é?gmHU\ÊTcc\ã¼1Ý”¦¸Rþd\Ûò\ÑJyQSó\Ç<¯4\ÂEMe~;J)\ïG§OŸÙ¹s—¡\í\Z™™Ûª«k”’A©±±ùÐ¡œ+V,\rÄªU«Ž=¦TV7n4\ä\çRÿ·mÛ¶c\ÇNº\Ú/,<\Ö\Ð\âK—*=zœ\Z\É\ÌÌ¤i@h?/¯\àúõ¥¤‡¨‘+V<¸ †²e\Ë\Ö\æ\æ\ÛJ\ïU\Â\è»Ce”‘‡\Üñw}?F ‚¢_\Êüœ„\0\0-\Ë\Ö\í¦\í‚U\Ûú&¤~6zvóm¿`\à1%§Î¤\ÎY<fr\ê£GDj ”\'	Iy\0ykw^É°ŒÍ†¶:¡h/Ÿ±\\I±k\ïú©gKvÞ¿sA\Ñ\Ñ\ìŒ\ìÍ³•\Â~txç¢’¼5Jk¤Ò¼U;WOV\n{‹š*>²š\ê6\Þ(?Z°g\ß\ÞMy»®fM}7I)\ìG\äÿw\ï\Þs\ì\Øñ\Ü\Ü#……Gsr\Ó4šD)\ä¢/\\¨V\Ê;\ÊqT÷\ï?p\äÈ‘;w\îÐ«Î›\Æ\ÆÆœœò\ÛJ²¼o\\iiõ–ú\\Tt‚¶¼ÿ|Ÿ\ÒKJJ•òu\ê\ÔrþöI\Ô m•ònZ¾|Å¸q\ã-ZDf­;6l˜?þØ±c·oß©´ Kñ^\á!Œ¾;TFv’Ÿ\Ç\×\í\ÛW”ŸòŠH\éÚµ\ëyyù{ö\ì\Í\ÍÍ«¯¿¦\äúTd\ßõ¤ˆ7A\ëR\æ\ç$¿!€£\Ë\Æô$4\ï„H¼´sŽ‘8jgý—÷\â;f\îœ-—i·tž^L”4R’÷_\â¥\Í\Ö\Ö	?ð)\Ñ8#\á\Ø\0€Ì½{÷Oœÿñˆtòÿt8ó›mŸõÁWSo6\Ý\â¼I;e\â´y\ãRf§\ÍY,’| <IH\Ê\È[\ÓVî˜»«\ÈÐ¸E•Áª\ë\ç)~¤Ô²+\àÄº\áÆe)o\ßm<z\ç\ÆYEû§Ìœ§ö£¦Æ¦¥‰¯\ßm<®4x:oîžµ;,‹šZ’ôú­G¿_5k\àÀŸ|ò\É_¢\ígŸ}:-q\èMzAØªx‹üÿ®]»\ÎÝº5óÀƒÛ¶m\'°}û:¤­¶¿½ª*pÀqT—,Yr\ï\Þ=z\é|7qRB\çÎŸüý\ß\æ™\Í3f+¢t™û÷\ï_½zu\í\ÚuJ²<n\\~~už,:u87÷ˆ,J¡tÊ¥2J-‘‹\È\Î\Þ\ï\Ñ`N\Îa’R\ËQ_}õÕºu\ëv\ìØ±oß¾\ìØ²faòK§\Çq-J\éóíœ¡………û\Ï*((ø\æ›o’’’•d)ƒ Þ« <„\Ñw‡\Ê\È\ÃNò\íÏ›o5•\ì˜Ó­þ\â[V\0ù>…ƒ\ÊO™ö\éS\Ã_¬¿\ä+„\×\ØØ¼f\Í÷\Ô)_h”\ÏV¬X\Â#…¿\ë9×®]\Ë\È\È6l\Ø‰›7oò\\?\ïz’Ü 7>„ Šu)ós’¿À‰µ¦ß¾¼‹¶£Yq\îð‰\Ò-C\0\ËJyº†0[\ÐS\Ì€b0\ê:õ\0 8wuÜˆ9\',úd\Ô\ì\åö>|ô¨OB\ÚG£\æOJ_%Jx2|\Âô)\éK\'N›_p\ì¤Hòò$!) -\Ûvø\ÍQó¿\ßo\è\Õa³¿\Ýî¨­þ½ÿnÿ1\Ú<q¦òR½,J1r•ZvœXgmH++X}ûz–¬\ÒÜ™9\Û3”’>ud÷Ò£Ù‹”+Žedm˜®”¨¼=\Ë\n÷-LŸ1‘<ÿ¦\ß5Þ¨zH“\Þ\Ëg\Ö}¿|À€Ó¦Mj\Ê~\æL9ù²µ›7oÙ¹s\×\å\ËW\È\ßÒ–ö\ÉÿsQŠŸ(€\ã¨.]²\äVc\ã\Øn\Ý\æüÿ™ý_þ\"ÿ?ÿ\ç½ù_gþ\Õ_M\ï\Ù\ëVsó+d´V,÷º5n7®¬\ì49ü‚‚BÙ¨+*,<J–¾´ô”R\×Q\ç¨0U¡Š\Ô2\Éh‡l?e\ÑŽöOž,V\ê\Ú5t\èPrþyyy\äð‰¥\Ó\ân7^xx\ï*\éÞ­K\ë\Æ:°o\éŽo\ßiü_ß®]¾mÛ¶	&(-\ÈRA¼WAxpŸ\ï•‘‡\äÓŸß¾]_]¶ô\àògŽmOT²\Ê\ç)¸ò\î\ÚüÍ¸\Í\Ë&\å\î-?™?}À3‰}œøÁ\ß\ì	\ÜHSÓ­ôô\Ù\äù7m\Ú\Ü\Ø\Øt\ç\Î\Ý\æ\æ[;v\ì\á‘B¢wýƒø›zÑ¢E\â[.ýû\×\Ö\ÖR\n\íÜ¸qƒ\ç4¶\Þ\ïz’\Ü`@ü4A\ëR\æ\ç$_!\0n\Å-¹\ËV\Ü \Ø@ò³<kpÎ¨d9Àk\í\ß\"%:ô\0`eùÆ¬F¤<zþ\×)\ß~2fÁ_M¥\Ä\ä?·°\Ï\×\Ó\Ë*ªy1Ÿ4|\Âô„±Ss²\ä”H\r„ò$!) ½5~\Ñ\ás\×}\ê³i+”\êŽ\"{¿lo!m\Éó‹.\êPŠ‘«Ô²\Ë{b\Ýp\ãÆ¢\É\Ýj\××™\ÆU_žV~4}ùô÷³Wª­òû™^SSó¢I¯6\\\Ú$58½²xÁ\Ò\ä\×\å«ÏT*\ÚÅ›Ú¶i&ùÿ²“Y\î\\º\\_wº\êJEeÕ­æ†²\â\ãX8gªŸ¦H†ÿß¶mûÅ‹µ\äx\Éü“³¥-%\Ö\Ö^\n*\n\à8ªd\0\ÖLžLþÿ\Æ\Þ}g\Ì:úY÷ý\Ú\ê\ä)©õÿ\ì\\´¨Y\âÖ­[×¯_ÿ\æ›o\ä\êŠO\Ñ\ÐÐ˜™™I?|8\×Qd\àw\ï\ÞC;GÛ²eK@?\Ó\ØØ¼yó*\Ì\ë’Ï§Ñ :<t(‡‡hK‡´³u\ë\Ö\ë\×o(-(\Z5jTaa\á1ƒû¶\í]7ñöý·¯\ïkªß½a\ágy¹”N?ü+\Ú\îß¿?))IiA–2\â\rÀ)O\í\ÜÉ s\\¦ø?P\ÕÎ©N\å]3+4›\ï•‘‡\äÓŸß¹Su|û\Ç‹>\Ù4\å—JV@ù<E\ã\Í\Æü\ísW\Ï¿û»qEû\îZ•4g\ìIqÿ‘\Ø÷\Ç3?\ê\âùÀa¯;v’Û§Â£G\î\ßpüøñ»w\ï\Ò~UÕ…nÚ´Y)\ï-zß»w¿¯©zœNuu5¥\Ð\ÎÕ«Wy®Ÿw=In\ÐŸ\rBÅº”ù9\É\ß*\0}A¾ÕŠ\à\ë˜\ÅI!\0]š—\ì½ö]\0¶¦ yÿ¶²@\èQ‹\í·õ\0`\çÜ…\Ë}\Ò\'.8g-~<|\æ§cŒžñÝ€q?3wÁªí¼˜Aq\é\éCÆ’\ç\'\çOþ_¤‰ò$!) ½6z~ö™:ŸŠK\\ªTw\Ùû;ò<B\0<W©e—÷\Äzÿ–YE‡Wþ \"ûU®+§’kNw\áÌ¾\åûIG÷/Y>­g\ãÍ›JE7\åg-?²+½*/Žš:³\ï•\ìU\ÏÕž_xpve\Ù\Þ\à\É\ÜUK_k¸q]©hkj\ç¬a_¶l\Ñô{\Í5\î]/9ùb}\Ãñòú‡\î>¸wkÕŠeƒ~zãš¯/ñ\îÝ»—û\ÙþcÇŽ«\0(¶F€G<¤´ \ËqT,Xðõ¯ž\Êþ/Q=-•nÓ­\Óg~hi97(~\ç¼g\é\ÒF‰¦¦¦k×®-Y²DiA–\ã)Nœ8I½\å\Ëò\í\âŸØ“·\É\Ê\ÚG¦ö‹‹K”•–ž¢ŠT˜¶t\Õ/\Ö\Ö\Ö^¢ŠûöeSk55ùXñö©\0¹{¥E\ãÇ/\Òù&í“‹\Å)Uù_(P–;e\ïº	û6M_”ôn\Þ\áý………T \'\'g\êÔ©J²”A\à¯l\×\Ë3S;wòo\ÞYÕ¸8·¯„\0¼#<×»LT\"Œ¾;TFv’~ûvcS\Ãñ}K~ó\à\Úø\íi?®)\ÏU\nx+\à)š\Z›N\æ\íú6õ\Ó=\Ë\ÝÈŸ°\ë»	›–Œ\Î\Þ<gÍ¢±‰ƒ»\Ïøâ™šs^\í\\#GŽ\\±bÅ£G-D]]\ÝÉ“\'kjjhŸRÖ­[ÿ\ÕW_õ•ô®¿{÷._ü\ÑG}z÷æªªª¢Ú©»r…\çúy×“\ä\Ø0i\ÇgƒA±.e~Nòÿs€õÚ§ñ\Â\Ã[¿ \ì*€e¥zvHµf…·7÷¹\í7«[z\0pd\è´Ã§¯üph\Z\í/ú~\ïÀñ‹&\Ï[?pÂ¢ø¤e¼€B\áñ\â‰\Ó\æOI_:|\Ât‘$Ê“„¤<€<ôÚ¨ù;Jj}\Ê`\æ\æÚž­¹B“U\Ñ\Ë~ y*¥¹J-»<&\Ö7\Z2\Æý\éj\Å\Üò=\Ý\ìª<Ü§ª8cuzœÿ\ß\Ü|+cüŸ¯ž[J\ÕO\ï~\î¥?ü=÷òÿö“\Þ]iÿ\ìÁwk\Ê¯J{ßÿ×šz\éü‰Ÿ|òIa\Î\ê\ækGo^>ðýöi«ö¯\È\Ü\ÝXwøvcÕ¡}›)÷üùJ¹¢›v\ï\ÞC\æ\ë\ÖL’\à[žÅµ}ûŽ*-\ÈrÕ¹s\ç~ò÷ŸÿŸÿóÑ¿ø\Ë\æ\Ò2ºY\×÷\ì-z\â_ŠÆOý\É_û\ä[þ\ä[û\Ôÿ\æ\Å\Îuµ¯^½ºh\Ñ\"¥YŽ§Ø¹sWAA!õ‹\\:‰\ï“i\'\ëNžDÎŸR¨$]µÒ‚¢½{³\nò¨zE\ÅY\Þ%rÿO\Ãkœ‘ŠFFiAQbbb‰F^\ÎÞ¬\ï\Ê÷ý¹<\ëO\åû^>»ÿõª¼þ{¾|p\ï&^€\È\Ë\ËKKKSZ¥‚²\ë\n™qq©N\åCðó8pûöµ†k\åWªq\Õ]\È.\ÏK>“õÖ£úQg³\ß\Ì\Û8§×ž;\\{.7\à¯8ž\âÊ¥‹/œ?]\\°k\Ý\Ü\Ôo\ÏófÉ–Áu‡F\ì\Ëè•·\âã¬µ\ÓW¦\\³01=)~\éüiJ]G\Õ\Ö^¦‡\ÆÉ“\Å>zøð\á\æÍ›Ïž=û\í·\ß\Ò>Q^^\áÿ‘\ÂE\ïú;whzÊ˜?þ{:\çÎ£Ú©­­\å¹4°\ßõ$¹Á/lðô?þ˜¶>„ Šu)ós’ÿ€†\á\Æ#òE\0J\áU’EI) °\Èú±¿\Z\0\0X¸z£±ß°ô/&/\áŸù\Ïúvû—“—ö:«©\ÙùûÀisK™=qÚ¼„±SDR(O’ò\0ò\Ðk£\æo8Z\åSþC\0)k÷ýnÐ”­9\Ç\ÉóW\ê?@û”òû/¦Pn˜!€[\ç\ä\ïI¿trTu\áÀ\ê‚gvý\Ñ\ÐùƒoŸ?6\å»Y}ýûRÁ¾U6\'].G\rž\Ëý´ûówpß–»wo\ï\Ì\\\Õýùÿs\îXÊª\ÔwüøRAöw\ÔTñÁ\Ñ4#?}rGv\î\Þmûv\ç\åmi¼œ}\âø\Î\í‡\n\×\ï8pñ\âE\Ê-+;­\Ôu\Ô\îÝ»\É\ÛoÞ¼…DÎ¶´´Œ¶\äh[Tt‚¶”¾~ý†7\ÑNh!€Ù³gû\ío³þ\ëÿ]÷ý\ÚZZ®\íd\Ò\â\â®]ÿí¿—¾þ\Ïùýº|ö§S\ïüør\Ï[û\ÒÓµU•(-\Èr<Å–-[È¨sCNž?+kðý¹{?s¦<\'\ç0 ’t\ÉJŠ¨€\Ñ ‰\Z9{öWU\Õ²ýr.Y&¥ES§N=¥±&cø’¤WV¤<{>§\'½¢ò6½1nâ˜‰3\×M·1+û0/SXXHƒ¦´ KþV¨\Þ;3®S\\&ý[ž\ZÇ¿!\ÐYv\îgM\â©<Á\êÞ•6ù¡\ÖBœ\ÖB\ç\ÔL­)\í{<Ý±\èF³ù­\ë&\"5ˆ@\Ýù\ã³¯\ìzdõ¸\Îd½~\ë\Ü\ç/~õ ê‹Š]/\ïšñ\ã­I¿%ñ\ï6NüŸû¿\í«TW\äxŠšªsS‡¿;¦ÿ\ï\æŒx\é\Ð7_\ÌJØ¿¸×ª\É>½õóë¹£‹\×~¾\ë»i\Ë\çŽÚ¸l\Ê\Ð\Ï{UT”+\Õ\í\"{Os\çÎ“\á\'óO¯\çcÇŽgddTW\×P\n½}ü?R¸´ð-²\âD}}=58t\è\Ð7\ß|óÌ™3”B;\Õ\Õ\Õ<÷ÚµkTÀû]O’t£O\ïÞ´õ\Ù AP¬K™Ÿ“|þÀZñ¿\æü5“\Ï-ºa\ËCú9@–¢¤o|€·ižˆÁ¿@‡N=\08s\íFSß¡3>\Z‘>gùÖ––f¯\Ø!2l´´´ŒMLK³¨¸\ì\ÌÀ!cDj(O’ò\0òP‘óV®ð)ÿ!€q\Ëwö›²ü÷ƒ¦Ð¾,J¡tÊ¥}¥–]ŽkRSc\ÓÌ„Î«R__>õ…\å)\Ý\êÎ¤”\ï~–\ëÜ7\ÏNúnfŸ üsó\ícŸ[>½ÇŠ©/,MüC}ù´ÌŒÎ¯?ÿ×·š\ßxñ\ïlýzE\ê[>ý?‰7õMÊ‹Ÿ~ú\Éþ½ë¦¯\ÈÞ›_²5kOSÝ¡#E\ÇWl;1gSùÑ£G?ýôÓºº«J]G)!\0»Ö­[Of€<€ö7öC	Ìš9scÚŒô¿ùu«×œ\ì¿ý·†œ\Ã\ßüò\ï\ë^{¢8iðÅƒ;k\î,›1üFßŸ]\éõo[_ý\í¼y^pÁñ[¶l\á_\Ñ\'‘Ï¯©¹xñb-ùÚ—ý¿Q€\Ê+-(Ú²e«QžDMQûÆ˜Ð€\ìÞ½\ÇÈ¥,\Z=¥E3g\Î,—X¿\à\ãò¬\×/ë“¶þôôm‰›oN\ÉlL\Ûxö›5;)÷øñ\ã‚‰ƒˆ÷*G±\ë¦_\ï\Ä€\ïiÿ\è¿)-þW«k(‰üPk¥\Ê;<\ÝØŠ\n±0ú\Z\ÂýKþŸ 2ò°“\Ü#\ÍMõ¥ûG\ßôü\Õ\ã}\\ô \êó\ç<8\Ó\ïþ\Éw\îóþ±\×oxñ\à\ìÞ½\àµõ•ºŠ\ÜNA:±Õ®9\ï-Ÿðü¬ÁO\ï\Íx¯!L\Õ\Î!û\æõ9½\é‹{FnZž²|\ÎØ¤QŸ9\ìõ\å®7n0\àÐ¡Cdø¹ÿ\'\íÜ¹sÿþý”\Ô#…‹\ÞõMMMW¬¼ú\ê«eee|§²²’\'\Ö\Õ\Õ\Ñ\Öû]Orl(**š<y2\ß\ç\í·i\ë³A‚ X—2?\'ñs€B¦“7ä“˜÷b-HA\É\Ì\ë!\0\Þ2¯«Á?óO\ÞÔ¹\'\0\0Wj¯\\{þ8u\æ¬\Ø\åIBR@\ê1r\Þ\Â\ì2Ÿòºx\ë\Ø\å»\ÜD¹\á„\0dm_>¤\æ\Ø\çY\"Uz§¢`\Ìw³z\åÿm_1ôb\ÑW\Ô\Ú/ü\Ï[Ío¾úóÓƒðÿ²ÆŽ4aüˆô5Y©«²÷\çe7\ß(\É:p`\Æ\Ú\Óó6Ÿ2e\Ê\Ô)G€+` ¸¸„¶§N¦Û¶m!–šz\ãÚµ¤7\ßLû«ÿgó_þeö_ýÍ‰	ýò¯®üùÿ\\Ü¿£6gÓ¡]\ç\Þþqõ{ÿzø?\'˜À¹¨oÔ±}û²Id\ÝÏŸ¯¤>\×\Ô\\4ü¿‘K\"\Ç\îg\0µ\Ã\Ë\ïÝ›E†¿ºº†Ú¬ªºÀÛ¤)‘ ýM›6)-(\"CrN\çXÞ¾‚\íƒ\Ï\ìo\ì’#\ã\Ö^³\æ\ÊØµW¿˜s\ìë¹‡’Öœ*<v²¸¸8¨D\ïUŽê½µU\0r¢Ý¢»\í(‰JÊŽ’;£¯£ø‚\Ê\È\ÃNò|Œ4W›½¬keV÷û§z\ß+\ìq/\ï¥{Gþt\ïð\ç\ÖþrGò\ßn›\Ô\Ü\Ôl«¥\Ê\ã«*¶;>wù\Çu†Ÿ\Ùú\å–\Ôw6N}«z\ÏÐ“\â\×O\ëwl\Í\à\ï&\îÿ\î¥K—”ŠŽš5+}\âÄ‰ô\"ç¶Ÿ¸q£!##\ãÁƒA=R¸\è]\ß\Ø\ØXk\å\Å_¤\×6\ß9{ö,O¤\î]¾t\Éû]O²7x\æÌ™\éÓ§÷\è\Ñ\ãw\Þ\á)¯¾ú*m}6A\ëR\æ\ç¤ ¿\0\0\0.(O’ò\0òP‘s\ç\ì:\éSþC\0_\Ìß°x\ë\ë£\ætþpÌ¯ú\æ¢}J¡tÊH \æ|iÞ®\äªÜž\ç¾Qu\äƒò¼\ß\Í\Ëÿ\×_®Þ¿ilU^jðÍ—þ\áVsS—_þ\ï\Ðü?5µe\ÅÈ>Í˜›\ÒpùPó“•e‡\Üg{\åŠŸ}ú\é®\ï\Ón\\½¢\Ôr” \É3\0»\È÷’\Ý\r90m\êT²Oªª\ÖÍ˜1ñ•WFtíš½j\ÕÁŸý\×K¿ÿ_—\ì¿s­þvý•+…9G¾\îu1¾{\î\ïÿ×¬™3•d9ž‚ºGŽ=+k\×\áÃ¹<\n@W\Äý¿‘E¢’T^iA/\Æ\Ëgg\ï§ Ö¨Í¼¼|jš%\ÑYxC‡rþÀÂ…«t\Ö.^]42u\Òû\Ö]Ž_|®\ß\ämM\ÍY¿ÿ\Ìñ\Ó5c¿¿<g\ÙÖ²²²\åÁüeDñ^\å(\Þ\Ûn\È\ÝR\ìûJ¢Ò‚²£\ä\Æ\Ü\ç{@e\äa\'zŒÜ¾v){ï¢®\r{»\Þ=ðû»\Ù]\ï\î{\æ\Î\Þß®\ZñÿôõDŸ\Ñÿ\Ôg\Ô?õýO¶ZyŸ¢¹\éÖ¦Œ‘©_üqÆ—\Ìù&®6{\Ä\Æ\Ô>\Ë\'¾wfküÁoLþ\îñü¥Š›Îž=÷ù\çŸ/^¼ø\îÝ»<@\\»v=\ØG\n\×W[yö,:~œï\ç‰l\ÅNm­÷»ž¤4H\ï‘÷\Þ{¯›9¾CP–\Ï!‚b]\Êüœ„\0\0 2(O’ò\0òP‘sS·ó)ÿ!€Og­ýb\ÞFòü\ß\ï:”_TZx²l]\æÚ§J§Üˆ„\0v~7ñÒ™ôª#½.Ä•\ç}ý\Ý\Ì\Âñÿ¤\ì\Í3«K\çj\r~ø\æ«ÿ\Ö\Ô\Ô\Øóý÷•2>EM](™“µ¶\ï\ç?6ô«¥‹\Ò÷\íÛ·a\ÃÆ‘#G\r0`\é”Ow­ž>q\Ìð‹ú·g\Ï^\îÿ7n\Ü\Ä@Quu\r™aþ[\0ü³q¥YŽ£š’œ|\ãÆ>ú¨R\ãøñ\ã´\Íù—ÿ«¶ó_\×\Ú\Ç_f÷šn^:[~\å\Ã.y\ÏüÏ ~	‹zNVœ\\Ï•›{„;\Ùu2ðF\"‰—)-\rð7\Ò\Ê\Ë\Ï\îÜ¹‹Ú¤Â´=u\ê4µFžŸ©Aj–ü_@\r\îÛ—]TtBiAÑ²e\ËÈ™0jj–$½¶}\ék3\ç/²ü\Â\È••¯n\Ë=[ZQ=je\åà¥•S3¶–——÷\ÝwJ²”A\àc(½w9û‹\0úWÿm_0‹¹\ì(‰ü\ÐHTv”\Ü\ØA³ù^Py\ØI#Í·šO}?\î7m\ê\Î\Î_\Þ\Ùñ\ä\í?¿“ù\ï[\'üu\ïQO\\¼¦öþ™0C\0¤‹U\çŽ\î[{jÛ°u\Óz%ø\Ó\Öô¾—²G¬N\í3\î\Ë¥yÛ•\Â\Þ*,<:hÐ aÃ†¯[·>;;;´G\n\×ó·¼A—.]\nùyxžx\áÂ…šš\Z\ïw=\É\Þ\àÉ“\'Çÿû\ßÿþù\çŸI\Z>„ Šu)ósB\0\0€È <IH\Ê\ÈC=F\ÌMÚ\ïSþC\0§­0{ý¯ú&ÿ_Ks\Ò\ÚÚ©s—\Ð>¥P:\åF$°2­\×\å²\á5\Ç>=“ÿÝŒpý?ieZ\ï+§G\×\ë¾ð\ë.ÿñw·n\Ý\ê\Õ\ë¥ŒOiM¥¦Žg5ö\ë¾#GŽüò\ËÁ#FŒX²diUUõ©c^ú\ÓóÃ†\r;vluu€o\Z\×\Ô\Ô\Z!\0òºü\ãn®\Ú\ÚK\ä{\ÉKsÿOÚ±cg}½\×\ß\Zt\Õ\Ä\Ä\Ä\ë×¯ô\ÑG|üÀw\ìØ±\å©ªù\Ù_žŸ™HÎª©©\ébõ…\ê!Ô¾ð\ÙÝŸ™>}ºÒ‚,\ÇS45\ÝZ¿~ƒ\âös´/ó\Ë)$J¡Ë¡òJŠš›ooÚ´™›|Œ±\Ï1Z¦rJ7oR‹j#²V®\\yI£ü\ÔñoSû,\Ì>˜{l\à\ÂSqé§—\í:[|¦jÈ’r\Ú¸¨|\í–ýgÏž]·nÒ‚,e\Ä{•CÞ›‹¡\Û_K·üDŸl\Ñ-vE\r:ñ¸¥Mjpl\'º\á>\ß*#;\Éû1rûöµó\'\Ö\ïJú·6ý\ë\Ù%ÿgO\Ò\ßT,ú\ß\äùI½G=qúv\Î\éÛ‡øB€>î€€O*\Ò\ÅU“¼¶l\â;\çv}}b\Ó\àqƒ^Núú\êò£J1?¢\'Æ²eßŒ\Z5*\äG\n\×ó·¼Á\ÓO?ŸŸ\ÏwŠ‹‹y\"™ö\ê\êj\ïw=É±A\âÀ\Z>„ Šu)ósB\0\0€È <IH\Ê\ÈC=FÌð}®OùÄ¥­ùtö2ü™òO–Ÿš:w	\íSÊ§\éz¥¬?p\æÄ¬µC/|\æ\È\ç«fô\ßÿWŸ;™ù\ÍÀK\Åñg¿ú\Ñ3o¼þú;w\Þ¿\ç®]V¤\Û%7µ|\ê\ëŽ_%Øµk÷s\Ï=7R£²ò‚’+‹\Ìð…5F€ŒnE\ÅYrþ¤S§N“õ¥DØ¹s\×\å\Ëu\Þ\ÜqT\'Mštõ\êÕ$>þø\ãÝ™[·ý\Ç~úW\çRÆž_<§úýn\ÕOÿMÖŸ~}¾ü\Ì\Ô)S”d¹\Ý8\êð–-[©\Ã\ÔO7Q.û\Ê\Ê*¥®£jjj7nÜ¸o_¶Òˆ,jF\æ\ì\ÙóJ]»¾ÿþû:ŸL^\ÛgVI¯\é\'\ãfÓ¶÷Œ\â\Þ6\\¾r¥ªª\Êû\Ç”A\ïU\Â\è»Ce\äa\'y?Fnß¾¾y\\ñ\ìÿqh\ê_ošò«Š£v\Í{‰\Þ\Í\ÕGn®¦-\ß!õõ„R×÷)\Ñù\\IÎ¬\Ño|òV—35\Þ\â§ûü\Èÿ#…‹¿\ëµß¾4yê©§rssùNQQO<{ö\ì…¼\ßõ$\Çñ\Ù AP¬K™Ÿ“\0\0D\åIBR@šú\Í\æÁÓ¿õ©kw)\Õ5zþ÷\äðIdø\í¢ô\ß\rJ™½:ðòW\ï‰õ†Œ/\Î\Í8}è³ˆøÒ¶cNå§ž-ø\"c\Ò+ýúö«¬¬,,,<u\ê\Ô[o½ðiE\ÔTÙ‘i\Ô\Ôò©¯yü”@vöþ^xaô\è\ÑcÇŽU²Qª«/’6\Üþ\î\Ý{\È\ßòCž²c\Ç\ÎK—®xû’ã¨Ž7\îò\å\Ëg4\r\Z´}ûvºö‚œƒÛžú\çœüÏ¹ÿô\åþ\Ë_\î\ìö«G–””\Ìþ·\0¸\Ê\ÊNQW\ÝL;¥ÓµP¥–‡\ÈM÷hpÓ¦\Í\Å\Å%J-GmÜ¸ñÊ•+\äad.T_ütÒš÷§\å}0óD\Ï\é}\Ç_^qž\Ò\É\Ã\ìÜ¹SiA–2\â½\n\ÂC}w¨Œ<\ì$\Ï\Ç\È\í[\Í\rßû\Ç\Ìqÿw\Þ\Æ\á\r7x:¹ý]×¦ïº–ºûzª±\r?@ª:vvòW¥…AG}\Êÿ#…¤¼\ë9O>ù\ä\áÃ‡ù\Îñ\ã\Çy\"½\Ú\Ë\ÊÊ¼\ßõ$\Çñ\Ù AP¬K™Ÿ“\0\0D\åIBR@\"cyö\ìyŸª­½¬Tw;s†f^ºr¥^©e—\Ç\ÄúüùóÓ¾|ò\Ø\îÏ–$¿qª\ìTEÅ¹\Ê\Êt-—.]®«»zýz\ÃÍ›MÍ°¬š\ê‹\ÓÿGQ\Ö\àE“þ\\Z\\¼lÙ·ü\Éð\á#Ž\'\ãTƒfS“YS4n¼o—/_±÷\íÀƒýú}x\áBQ\ÝM\ì#\Äs\ç\É?Ë¶Ÿ‹ö·m\Û^UU\Ý\Øâ¯—¯[·ž Q­\Ñ “O[š©;z$ÿ\È\á#¹9‡shKû´³lÙ²C‡¼~À\Ì\ÛUU] >oß¾#Kÿi\0\Ú\Ò>¥]§\\¥|@\Õ\Ô\ÔnÝšI# 4¸c\ÇNjðüùJ¥¼›\n\æ\ç\ç_ºt‰þÏ¹xñ\"y•ƒ‡r¿ß°=+ûLuu5\rÙ¤Ó§\Ï(-\ÈRA¼WAx£\ï•‘‡\äùj¼uó\ÆÕ¬%\ïU[¢9}´/\Ðvó•‘$ö£€ZŠ\\F–÷ž\Þ\ì\r\rW¯^§·ÿ•+u†\è~?\Å.jjÑ“„Z \'=[\è	C\Ï@z®ž>]¾~ý†^½>ø\Ë$\å]\ïAyyùªU«¼\ßõ¤ˆ7A\ëR\æ\ç$„\0\0\0‘Ay’”\Ð\ã§\ì\Ý[&÷Z2ý“C\æ\æ)((,*:YVvšü6\Â+W\êoÜ¸\ÔG÷‡ög-L\î³0¥\ïÁûyƒÇŸ(-=E\r\Ò›\Z¤	·\Ïsì“›\"c\Éûv\î\\%õf\íJ\ß|F\ê\ë¯Qõ\â\â\Ò\ì\ìýûô?žGÚ¿ÿ\à©}\ê\'5®\Ôò©Ã‡,^¼d\ìØ±#GŽò\Öøñ\ã—/_‘——¯´\àGt¥—/\×q\ÇB\ÃB}\ã\ÆMdÈ¨\ïÜ¹\ë\è\Ñc”~\áBŸµ†\è\ÖPƒUU\Õ\Ú\ßHg\Ë\"¨A\Únß¾ƒn\"5HYµµ—ýÜ»ªO:µgÏž\È\Ê\Ê\"ŸS]]­´\à!ñ^\á!Œ¾;TFùEžÝ¥k/\rð0ÿ\"“Ooyzc\ÒÛŸ&:q¢˜¬;½Œý„ðHôb¦g½ò\é@(~\nzµ\ÓÓ†\ÞÈ¤œœ\\?\ïÐˆ¿\ë\Û\æ1ACR\æ\ç$„\0\0\0‘Ay’”\Ðã§›7›\Ès]½zt\í\Ú\rš744RM‘ý{H.š|GªA¥)j\çúõ†pú&‹\ê^»v\ÝhŸ‹RüX\\‘U&\â_ä«•|ŠúO\ãpýú\r\êv]\ÝUE4\\J|$ \"\Ø\à\å\ËuT\Î?~V²\ïU\Â\è»Ce”‘Y\äü{z‚o•,Ÿ¢÷;½\éurùò•‹/‘cWD‰—.]¦ô”öeO\å©}zñ\Ó+œªÓ‰H\Æ3²”*vEü]\ßf‚ X‘2?\'E>0\0\Ðox	\åIBR@µ¯\Ä{´>\Ê\ÈCAP{I™Ÿ“Z% ö\0\0)@AAPôK™Ÿ“\0\0\rB\0AAýR\æ\ç$„\0\0\0Aƒ\0AAE¿”ù9	!\0\0@\ÐøT\Æ>t]üÇ½üo\0\0\0\0\0ˆ”ù9\ÉW\àJ\Ý\ÕÙ‹V\r3uü\Ôy\Ûvxøð¡\Èp\"@\àòŽÉ“w\\\áÁ¦\0\0Á\ÐqB\0\Þnß¾\0\0\0\0\0 zP\æ\ç¤À!€KW\êL0‰ü\Â\Øi´³pù:‘\ç„\á\r&YR\Ä»\á\Û\Ã7ðŽ-øo6ü\0\ÐQÁ*\0-\0\0\0\0\0\0Q‚2?\',Y¹‘lNþqÚ¿{÷Þ´\ÙK\é°ò\ÂEžk\Ç8\Zl\Ãx‡\ïÀ\Ãl!\0\0B«\0Ü¶\0\0ðø\×).S\ì‚\ÊvN-\0\0\0¢e~N\nHL[8hx’8ø\á‡ìœ‚	“rNˆc®!\0n¹…ñ¦\Äò\0û/¹c	.)•5\ÌbZ:+¶d‰H\Ò*±:|Wm“Á³Úš±O\Ùe\0\î`€\Ç6Š\ÈOùÎF¾“P\"Žc˜’ôL\ß+Ú’\Ð\Æð1\Zùˆ\Ón·²ýˆ’K¶t\Ã\ÏK”<}P¦¾<µs\'ÿ\0\0\0m„2?\'\Ì]²Zþ\ØñŠõtXzú,?´c†\0„«\æx|€œ¹nõ2ªû\'˜\ç‰,Ÿö\Ø?¢	s—·`oS¯d\"Ò\æEK,E\0\0ŽDy 7½g—.]º[/Ž\ÃÀ\Û\íÛ·Í©\éYFÅ•ŠTN\æ\Z–\Ø9»Ys\ê+;\ÎK­G<²Á\æý\ïtÏ®‡\íóaù\áÈ˜¨P»\Ú¶\á\È\ï]\Í\ìœ\Ð\ê|‘\Z\0÷Ñ¨\Û\Ø\ÝhMm0ºo¥6\æ’|Ÿ\èñ¹\äw~4k\ãy‘g\Å\Þ\r­®\ÛK\Ô9\0p?û§\rK¸Þº£<óV	A\0\0\0ˆ.”ù9)p ülyþ!c¦®ø~kúÂ•´?.eŽ\Ç/ú[ 8p=X U2‘Yk1ž\Âw(‘\Ê8µi¦ð\Õ0ÿ\0ø%ŠC\0\ë‡u\í\Ú3=¶~B\0\åg\Ï¶¬\à¿\ÙK¢::t]Þžß¾Õ¨‹#ç¿¦N1\Ï_\"M‹)7/5»¤Sz¥e~\Ý:!€¨ ºMTl\Ã.Jv}\ç³ü]£—¥to!ºo¥µqqó\Ã21}É‚ÚŒY\âMAu\Ã1\0ð°è­†\ì}\æ¾C\0+\0\0 \êP\æ\ç¤À!\0¢°¨tÈ˜©dþI\ã§\Îû|\Øä¥«6¸EB	8–:r\"\ílSMA \0\0¿Dm`ý0nüY ÀO\à“¥Fž\ê4\ã^§´»´C‡\"C\Ç\Û\íÛ·ö!¿b\ïeJ¹ùga\Ë\ê\0„\0\Üi“\áudœG#mŽ\î[©4\î\ï\\±}É‚‡\0||šß°¸q\ÉOoU‰#,\0\0€(C™Ÿ“|…\08—®\Ô75ßºÿÁ\ìE«$Lš¿lc ˆ€ð\Û\æ\nÝ®3œ¾ 3‰¶6¥\"#\áòŽ%f3\'\0(Dñ*\0Ž\ßÀ¼‡ùÿ\Ù?0Í¸G‡\"C‡®\Ë\ÛóÛ·|	€º\È_\"s\Èe‘i¥@›‡\04÷\è´xØº(Ú¯ùq¬¥¬¯\æ2\ÎÀ°1\Ï#UtË²¶@³vD®¯n¡]rh¸Ë­ó^°qð4~N\å9\ZüU\ápê˜¸•–ó2W¬/\é—÷9\æ\Ð\Åö%\ÜB\0\ÝðÀw¸TÖ–\à÷\0 P\æ\ç¤ B\0>œ¿tÍ€„I[w\íI~C\0ú\Ç\îìˆ¹qkf1a\Ý-µŒ2|ßž+¥ðX€\Þ\í—5O\0P\è8!\0o·o\ß2˜]W¿ü/¡}€›ùÒ’N£¥/´i@ûö¸£`žÁ‡ùTð®\å’\ëa¢4\ÛcVqÏ²|.\ì“8´}º\ë\Ö\É\Ð.94\Ü\Ïeí¼¯÷•QRð(†kO´\×“›¥t¨%·R\Ô\Ò%WaY	F\ÈM\îFL_²À)\à\Ñ\ro˜]d\Ö]¾@8\×F\0\0\0\Úe~N\n%@<xðpwö\áû÷ˆc	Go\Ðv­‡ •ylB\0\æH#Oõ[”/2tèº¼=¿}  ¾ ¡”l\Ã\0ó’²Àœ†ïŸ”3ð®´‰bþGnM\Êb®\É\Í\Z¹7¨\áf¢B»\ä\Ðp?—\ß\ÞJ\ÈO\Û\ç>–§x\r#@ûš;µ»b—Z\î#ß¦·\ÒZL3ö\Æ!«¢_‹óg\æ1y\É‡+ò\èF\0‡\0ªF6,ùic{B\Úð@\0\0\0\Ðv(ósRˆ!\0\Ú/`®*\0\0´*M ü\ìy²ýÿ5~/‰v\ì?\è\íö\í[†gÀºø_û«\Æa†\0˜m\Õ4÷“»\âG­`M”Ö”‹{\Ñ|ª°MTh—\Z.\çr\ê­Ý¦Z±—1¯\Ñk £a¢¹b9Z\äR\Ëu\ä\ÛöVz3\í7—\È\Å,\Ä\Ø%\ØI­¯¯n €‰\×ü¿ñ»€6\0\0€\èB™Ÿ“§\0\0 xlB\0¡\ëòöüö­0ö\Î?\È~&ÀøKºô\ï´qÀm€Œ\æ\"‚¶\ÄöZÁš(¯0\Õ,÷5¼M\'´K\r\ë¹B\é­6\Z.C\í5P_í«‹É£üV(F‡\ìeO\çõŠ­\Ä\Ö%\Øk)b«\0¼~@û	\0wÿO\à÷\0\0 ºP\æ\ç$„\0\0\0A\ÓqB\0\Þnß¾°/ù;ýQ@\å\Ëÿ„¼d \rC\0¾®mÝ²/lµ´\ÓÙìµ˜?yÇ´(\ìP)´Oe¥,Õ¡I0Q.Ý°\Ü%3»ú7œ-\ç²ö–ù7?\Ý\ÐFCº(\É(z\Ã\×h°nø\Ã(¹•Æu`uz‚¥)•»d\ËU\ã\Z\Ý„‹\ìÿ]«ò\ß@l\0\0\0\Úe~NB\0\04Q\ÈM\ï\Ù\ÅJ×ž\é¹\"3èº¼=¿}«cùÀŸ›|õO\00¤\ïh\á\0£\n“õWœ³BFs\Ìh2œ’fQÒ½	XK. \åjv‹+}/+cZ3‹\Ê[³\Ô\ÓYL”K7”\Ö|^2‡‡\0üs±\ÞJYÌ¹„õV\Ê\Óm 8N£!\ÝKº‰\ãFÉ­8†¼–5ý±ºd9Ë»Þ°¶\ZÙª¼³ñ§\ì+\0¼/r9š\Ów|; \0\0\0\í„2?\'!\0\0š¨_1¼Ý¾}@\È\Ø-ˆ8\Ì‹Æ7NA€€¸,\Ð\à1\0„\0\0\0 ­Q\æ\ç¤V	\0\0{\Ä^By’„Žeèº¼=¿}@h \Ð\êx¯¥\n\Ú— ,»û\n\0†\Ö\Z~&\0\0\Úe~NŠ|\0\0\Ð1Qž$$a£co·o\ß>¾¨‹¥M\á3\Õ\áÀ\ÈG\0c	=üP0S\ï;@\ß\Å\á\ã;\0\0\0Ðž(ósB\0\0€È <IH\ÂF\Ç2t]Þžß¾\0\0\0\0\0 JP\æ\ç$„\0\0\0‘Ay’„Že¼Ý¾}\0\0\0\0\0@ô \Ì\ÏI\0\0\"ƒò$!	\Ë\Ðuy{~û\0\0\0\0\0€(A™Ÿ“\0\0D\åIB6:–ñvûö-\0\0\0\0\0\0Ñƒ2?\'µJ\àÑ£G\Í\Í\Íe§+Ž\å9z0·ðPn\á‰\âS7)K\0D7\äiƒBy’„Žeø8µ\0€Çƒkó!HT\0\0(ósR\äC\0MM\ÍÇŠ\ÏW\Õ\Ô_½\Ñ\Øt«©ù6‰v\êê¯Ÿ®¨\Ì>”wó&\Z\0¡\r\n\åIB6:–¡\ë\âC\ás\0\0\rŠ·÷)Q\0\0@t \Ì\ÏI<zô\èØ‰Ò›\Í\×n4\Ö]m¸R\ãr\Ýu\í\Ð\áµë”u(·ð\áÃ‡¢\0 Z!OÊ“„$ltÛ²~X\×.\Z]»öL\Ï‰!\Ã\Ç!¨-\0\0<(\ÞÞ§De\0\0\0Ñ2?\'E>Pp¬¸öòU\îü\íºx©>\ë`®ó\×*3ºu\Ë`3\î\Ðð¨Î³\Âl€Ú Pž$$a£Û\Üôž]‡­7÷ÃŽ\Ðuñ¡ð¹\0\0\0\0\0 zP\æ\ç$¿!€1i«Ê«.‰OŽž(;~¢\ìdiù¹\Ê\Z2ü\Üù\×\\ª¯8W]p¼$¯ð\ÄþœQT!\0\0¢	ò´A¡<IH\ÂF·Z@„‡ ¶\0\0\0\0\0\0D	\Êüœ\ä7Ð£\Ê½\'¤-\Ù\Ú\Øt[$¹p¢\ä9ÿ‹—\ê\Ê\ÏV?Yv¤€ý\"`nþñ£E¥g\ÏW\ßhh\Ê\É;.Š* \0@4A†6(”\'	I\Ø\èö\"!\0º.>>·\0\0\0\0\0\0D\Êüœ\\€D;\ë¶\å\Þ\àúe~¸z­¡\áf3þ«\×nòU\0j®\Ô\Ô\ÖQ\â¡#!€øøn4$³N\é<­S|–HrJ4~V¼H5\Ëhí¹µ\0p‚<­>ø@\ì\ÙPž$$a£Û‰ˆ|€CP[\0\0\0\0\0\0¢e~N\n:À7|nþ‰r‘g¥\àX	Y}·Àõ{öE˜c×9\Ùx±k\î±|\á÷™\Ã\×|¾y¬7³D-©\0€3dh\ÈÿsÄ±\åIB6º]X?¬K—.\áÿ ]\nŸ[\0\0\0\0\0\0¢e~N\n1Àµr\ã‘-q´¨´\àXIÅ¹W\È\ï74Š@m]ù¹\ê¢\â\Ó{ö\ç\î\Î>,Š*p£.È£kþ]N4ö\Ý\Ù\Çû\Âõ;”‘SŒö\0.§•\î_G¤J(O’°\Ñm\æÿ\Ãý€‡ ¶\0\0\0\0\0\0D	\Êüœb ×—iY9\'Dž•cÅ§ª/Ö=_S\\V‘¬8·\àÄ¡#\Ç\ä=œ_t¢\äÌµ\ë7³sòEQG‹nwòž‰Y\Æ\'ýö2r\nB\0\0‚­ðýšó{¶(€ò$!	\Ý\Æh_\0ˆˆÿ\'\èºøPø\Ü\0\0\0\0\0=(ósR\Ð!€W>L\\¹ñÀ\Ý{÷D†%\åÞ¿\à\ë\ç\0Í…ú\æ\å\ë¶\Ý)Q¯®\ç™eÄ®sû\0\0g\È\Ó\Z(ž_9\ä(O’°\ÑmIDý?Á\Ç!¨-\0\0\0\0\0\0Q‚2?\'Hš»\î\Ê\Õ\0sÜ‚\ã¥Þ¿u0OU`n\Þ@úˆ\ÞL÷L4¾–G\É\äó9\Ýþ[\0RS\0\0\'\È\Ð\Z\Ø\rT†\0X\0 ‹•0\ãt]|(|n\0\0\0\0\0ˆ”ù9\Éo`X\ÊòS5\âÀ“ª\ê\ÚÜ‚¢Šó\Õuõ–\ß¨8W]Trfwö\á³\ç«EQ\0@Cž6(”\'	I\Ø\èX†CP[\0\0\0\0\0\0¢e~NòŠ›MÇ‹Oe\ç\ä\ïÚ—³3+g\ÇÞƒ\ÛvØ[XTz³±Y\0D7dhƒBy’„Že\èºøPø\Ü\0\0\0\0\0=(ósR«„\0\0\0\äiƒBy’„Žeø8µ\0\0\0\0\0 JP\æ\ç$„\0\0\0Î¡\r\n\åIB6:–¡\ë\âC\ás\0\0\0\0\0@ô \Ì\ÏI­xô\èQsss\Ù\éŠ#…E9GŽ\Ì-<”[x¢ø\Ô\Í\ÆF\Ê…\0\0\Ñ\ryÚ Pž$$a£c>Am\0\0\0\0\0ˆ”ù9)ò!€¦¦\æ‚c\Å\ç«j\ê¯\Þhlº\Õ\Ô|›D;uõ\×OWTfÊ»y\r\0ˆ\nƒÜ¯ò$!	Ë¸ù|·-\0\0\0\0\0\0Ñƒ2?\'E8ð\èÑ£c\'\Øoþ]»\ÑXwµ\áJý\Ëu\×I´C‡×®7RÖ¡\ÜÂ‡Š\n\0€hE˜{Vž$$a£c\Z7·\ï¶\0\0\0\0\0 JP\æ\ç¤È‡\0\nŽ\×^¾Ê¿]/\Õg\Ìõõu\0ó\ïü\0\Úa\îýA\îWy’„Že\Ü|¾\Û\0\0\0\0\0€\èA™Ÿ“ü†\0Æ¤­*¯º$<9z¢\ìø‰²“¥\å\ç*k\Èðs\ç_s©¾\â\\uÁñ’¼\Âûs\nDQoŒ@V|\'·X€GV,\Ò\ZQDR@¨s\ï2ÀÊ“„$lt,C\ã\à\æöÝ¶\0\0\0\0\0\0D	\Êüœ\ä7Ð£\Ê½\'¤-\Ù\Ú\Øt[$¹p¢\ä9ÿ‹—\ê\Ê\ÏV?Yv¤€ý\"`nþñ£E¥g\ÏW\ßhh\Ê\É;.Šz\Ó½+B\0 š\æ\Þ\ä~•\'	I\Ø\è6$7½g‰a\ëEzÈ¸ù|·-\0\0\0\0\0\0Ñƒ2?\' \ÑÎºm¹÷¸~™Ÿ‡\0®^kh¸\ÙL†ÿêµ›|À…š+5µu”x\èˆ{ +¾‡\\«\á]-;ññÝ´ñY¬¼\ìoÕºfI‘£—4\nJX›µ—a˜i\æ\Òª+§xž×»°”-ŸTF)Àõ‚Æ¾C/j$ø\é0\è\Øs\ï2ÀÊ“„$lt{±~X×®=\Ós\ÅQh\Ð8¸¹}·-\0\0\0\0\0\0Q‚2?\'\àŠ>7ÿD¹È³Rp¬„¬¾[\àú\Æ=ûˆ¢*\ä@%÷\ÉÜ©aSõQ€J\ê†WÔ°\Õ5KªEuô*öfMŒfY!‘g¶D{\"MÔ´4¥œ×»°µ¬#z)V.\ÞRÏ¬h/ciÓ»~::\Â\ÜûƒÜ¯ò$!	\Ýn°@˜\Ü|¾\Û\0\0\0\0\0€\èA™Ÿ“Bp­\Üx@dK-*-8VRq\î\Âòû\r\"P[W~®º¨øôžý¹»³‹¢\ndBe\ïiXQûŽ±g¤¸\Õuª¬¹]Ž–\âPØ£ŒµIQ†Á\Òš\Òwü6Sœ\à-X\nˆË¶´¤”‘\Û\ä¹:¶š|O®\0:4\Â\Üûƒ°ò$!	\ÝN\ä¦÷{\0{\'¸¹}·-\0\0\0\0\0\0Q‚2?\'…\èõeZV\Î	‘g\åXñ©\ê‹ug\Ï\×—U\ä+\Î-8q\èÈ±¹G\ç(9s\íú\Í\ìœ|QT¡mB\0ô¯òÑ¹½°Wi_N\ä˜)¶B~\n\Û\ËØ¡2Â¾‹£nYj5¹ŒÜ¦½}3\ÅØ³a\îýA\îWy’„n[ŒŸÿ[\0„›\Ïw\Û\0\0\0\0\0=(ósR\Ð!€W>L\\¹ñÀ\Ý{÷D†%\åÞ¿\àþs€Vo÷¤v¿j¦¸ÔµW–x{a{¹}³<%š\ë\î3øºz‘%7a´¨°™\âDV¼Q\Ý,Fû\äöE†SK›Autt„¹÷`\åIB6º½`\Ë\0\Â\r\Ð8¸¹}·-\0\0\0\0\0\0Q‚2?\'Hš»\î\Ê\Õ\0sÜ‚\ã¥Þ¿u0Oµ\Ã,ª™P»\'µûUÙ®:\Öuª,\n²ŸÁ\ÓR\n\ÛÊ˜I\Zz\Z«!’4k\íÐ”™ä¯°‘mC©.`©\æ¡Ck›J:ô\è0\è\Øs\ïr¿Ê“„$ltûþw\Ü|¾\Û\0\0\0\0\0€\èA™Ÿ“ü†\0†¥,?UQ#<©ª®\Í-(ª8_]Woù-€Šs\ÕE%gvg>{¾ZQ²ŒŸÜ‹`\ØA«!Ì½?\È\0+O’°\Ñ\íGø¿H\ã\à\æöÝ¶\0\0\0\0\0\0D	\Êüœ\ä77›ŽŸ\Ê\Î\Éßµ/ggVÎŽ½·\í>°;;·°¨ôfc³(kH‹\0\Ú \0 /9\à8}*‡\0h%„¹÷¹_\åIB6º½ˆ\Ätóùn[\0\0\0\0\0\0¢e~Nj•\0\0\à1@˜{Vž$$a£\Ûrýü·\0‰°ÿ  ƒ\ÆÁ\Í\í»m\0\0\0\0\0ˆ”ù9	!\0\0€3\Â\ÜûƒÜ¯ò$!	Ë¸ù|·-\0\0\0\0\0\0Ñƒ2?\'µJ\àÁƒW\ê\ê\Öo\Þ1kÁ7Sf.LJŸ’6ÿ\Û\Õj.\ÖR–(\0ˆn„¹÷`\åIB6:–¡qpsûn[\0\0\0\0\0\0¢e~NŠ|\à\Ò\å+ó—u\àHÙ™ó/]½\\wT{ùjÉ©³[vdON¿P}Q\0D1\Â\ÜûƒÜ¯ò$!	Ë¸ù|·-\0\0\0\0\0\0Ñƒ2?\'E8ð\àÁƒ%ß®­®­«8±ôL\ÕÉ²ó\'JÏ‘h§ôtUù¹‹\Õ\ëR\ÒÜ»wOT\0\0D+\Â\Üûƒ°ò$!	\Ë\Ð8¸¹}·-\0\0\0\0\0\0Q‚2?\'E8ðð\á\ÃùKV\æ\Îß®‚\ã§\Æ$ÍˆŠ¯\à\Ï\é\à‰0÷þ ÷«<IH\ÂF\Ç2n>\ßm\0\0\0\0\0@ô \Ì\ÏI~C\0\ÃR–÷\èŸb×˜´U¢„Î¢o\×/]±~Õºm{²óò•q\çŸw¬l\Ç\Þ\Ãó—®™±|Ò´ù¢hk\à\ß\Ø@¼\0t<„¹÷`\åIB6:–¡qpsûn[\0\0\0\0\0\0¢e~Nò8UQóB\ï	v•W]%t¾]³•œÁ±’m»,[¹~\æüo¦\Í\\˜6g\é\Âo\×\îÞ—[y\á\Ò\Ô\ÙKE\Ñ\Ö\0!\0\0\"„0÷þ ÷«<IH\ÂF\Ç2n>\ßm\0\0\0\0\0@ô \Ì\ÏIA| i\î:\Åÿ§-\Ù*ò$¾]½µ\àø©\Ó.\Ô\\!\Ã¦¢úD\ÉÙ¼ce‡òN\æ-¥\Ä)³\ÜC\0Yñ8\Ìo“\íG\â³D¥Œõ\Ðôí’ƒ—Šhg±&òV<>ž\'©\ÍfX\ÏÀc‹0÷þ ¬<IH\ÂF\Ç24nn\ßm\\ÉŒ\ë\Ô9µ\\Xñ\È\0\0\0\0\0¡¢\Ì\ÏIA„\0®\\mx\å\ÃD\Ãÿ÷\èŸ\Ò\Øt[\äI\Ì]¼\æHa‰[\à\ìù‹#&\ÍEU²\âMS®	]™o&[°—‘Ì¾´o\ì13oÔrEšh•\âyú	Œ\Â~zÀc0÷þ ÷«<IH\ÂF\Ç2n>\ßm<(O\í\Ü).SXñ\È\0\0\0\0\0!£\Ì\ÏIÁý\àÊŒÀºm¹\"\Õ\Ê\Âo\×\Î[²f\ÇÞœ“\ä÷«jy\à\È\Ñ\Òm{³zËˆI3\ÆOE\È]O®Á|¸ôA½#ö2†W·\ì\ë{Ž¹´£}¨\Ïaiya‘À\ãŒ0÷þ ¬<IH\ÂF·¹\é=»t\é\Òu\Øzq*4nn\ßmûC}j\çÑ:™\êœZÏ’¥qRS\çlý\ÃoV\ÑZX\'s¥ŠT+3ŽÓ\Ï\Ï\ËS\Ó)W˜i\×Zj¹ôS»÷Pi\Ð\ìy 2\ãøóU ›},\0\0\0\0\0&\Êüœ\\\à\î½{½¾L#ÿ7|\îýEª•Å«6\å”\ì\Úwdõ†s¯N›·|Ê¬%‰iS\ç~³\âû\Ìò³\Õ¦\ÎE”\0Ç\å–\Ë^Ý²¯\ï9\æÊ‰\ïŠ\ì\01Ž0÷þ ÷«<IH\ÂF·=¹\é=»ö\ìÙ³kø!\07Ÿ\ï¶eh;®TqGmºev\è\âs\ÝC\0{a\æõD\å\ãÑ¬c–{Y`ž£\ËO€™|m‘?\í(\ízd\0\0\0\0€ðQ\æ\ç¤\àB\0DVÎ‰zO\È?\á:\í[þ}¦÷oLM_&ŠªXc\0Yñ¶û6\ìe\ä\ÂÌ¨\ë\ËøE\Ë\Ò)\Ì]\Ú3W÷gÐŽÙˆ¾g¤ø\é\0\Â\Üûƒ°ò$!	\Ý\Öh€ô\Üõ\Ã\" qpsûn[\î\ÍÀ?”gw6Mu\äC\0q©Ù¹§Å•fÆµM€¯80\Ý0l¾}±¿G\0\0\0\0\0ˆ\0\Êüœt€X¹ñ€\Øsbþ²µdõ\ÝB\0\ç*/ŽIœ%Š\Úaf\\ƒ\Ü5ó\í\áº\í8”Ñ“´c\Ñûm?Ý¯›§ t¯´c\Ú{cO/A•´	\×^ðX Ì½?\Èý*O’°\Ñm\0h\Ö?\"!\07Ÿ\ï¶e0_m	XRZ!I[f\ÅÉ“S\Ëm`Å¬—\é³÷\Ú2ü\Ê/þyd\0\0\0\0€ \Ì\ÏI¡„\0¼9{4mÞ·;³—œ:\'ÿÀö½¹ß®\Ù:|BÚ®}‡EQ\0@#Ì½?\È\0+O’°\ÑmŠiü£g\0û¸\ÛX3¯9gYfI¯Î±`)d¡5óOûÌŸG$\à\ÜC\ëo8‡	œ`Ÿök\Ø}¾G\0\0\0\0\0e~NŠ|€¨¾xi\éw\ÇOûõ\ØiC\ÆL<2yÐ°\Äa\Ò2–}_}ñ²(4\Æ\Ç÷Æ‡ø\0€\È#Ì½?\Èý*O’°\Ñmˆlû£h€\Zp1\Ï^c/@­i¿XžÝ¹szg\í¤\ì\\–³‡pî¡¹\nÀ\ã*\Ü0Ì¾\Ý\í{d\0\0\0\0€0P\æ\ç¤V	\0\0„¹÷`\åIB6ºÍ°šþ(Z §´N@\Ë\âÍ¶I@\Û÷ó[€&\äóY«\Ú\â\Å\é{d\0\0\0\0€0P\æ\ç$„\0\0\0\Îs\ïr¿Ê“„$lt[Až¿‹=\ÓsE‰\àqóùn[ó\ÕÞŠ?h„\0LØ¯ôµAÀ\ëBœ \ÏÝ½fô-=²\0\0\0\0\0@8(ósRT„\0¦¦/ýbx²]‰iE	\0@›#Ì½?\È\0+O’°\Ñ\íD”¬\Ðü¿\ä\É#\Z`;…\0,ŸÏ·RÀ~\"O2\Å/þi‹þ­\Í{d\0\0\0\0€pP\æç¤¨$Œ:xD¢]”.J\0\0\Úa\îýA\îWy’„n\'\Ú÷·\0\\6l9Wr\Ñj\ÅN†½g\ÞÛš\Åky‡\0\Üj™¸†\0œkYC\0¢¤eÅ\í“}s¥¿G\0\0\0\0\0ˆ\Êüœ!€IS\ç/­ØŸ{¼ \è4móŽ—\Ñv\Â\ÔùÊ¢\0.,\r\0 m\æ\Þd€•\'	I\Ø\èX†\ÆÁ\Í\í»mú\'ýxd\0\0\0\0€°P\æç¤¨$¦Î·‡\0\"¼4ÀüSÿŽ‰\0\0\ra\îýA\îWy’„Že\Ü|¾\Û¸@>\ßm‰¿G\0\0\0\0\0e~NjõÀ°”\å=ú§\Ø5&m•(ñ\Ã\É32ò‹Ne\î>t(ÿ$m)Úº\ë \ã\Ò\0J›8ST‹H\r|=B\0\0‰0÷þ ¬<IH\ÂF\Ç24nn\ßm\0\0\0\0\0@” \Ì\ÏI­8UQóB\ï	v•W]%~øa\ÊÌ…\ÜíŸ\â¼øT\âl#0>%]TSðöó\0$\Â\ÜûƒÜ¯ò$!	Ë¸ù|·-\0\0\0\0\0\0Ñƒ2?\'µ\Å’\æ®SüÚ’­\"Ocê¬…|€\Ç\âÿGŠ¨\0›8uŽ¨¦`õóYñbE@§ø,v\Ìr\ã\ã\Åz½œ\\…ö-™Æ±\Þ\0a\îýAXy’„Žeh\ÜÜ¾Û¶þ~AAµ»hjª\Ì\ÏIm¸rµ\á•\rÿß£Jc\Óm‘§1-}\ÑñÒŠ\ì\Ã\Ç<ÿû“§\Í\Õ¬!\0¬x\îé™£×³õ4©\n\í	£O™lOüCTf\ÄÛ›\àñG˜{ûUž$$a£c7Ÿ\ï¶%”\'/AAµ‹hjª\Ì\ÏImôs€+70B\0\ë¶\åŠT\Ô9K“\Ó$¥\Îwü]@JŸ’n¬Hœ>OTSPB\0\æ2\0=`\æ\êþ\ÞH¤Q˜Á\ÒxŠ\Ü \0a\îýAXy’„Žeh\ÜÜ¾\ÛVyòBAAP»ˆ¦¦\Êüœ\ÔF!€»÷\îõú2ü\Üð¹÷<©VZZZ\ì¿h,þ7\ÂI©óE\Ù\ä3\Ï?\Ä\×S\å\\\Ç€£\Ûg\í \0:(\Â\ÜûƒÜ¯ò$!	Ë¸ù|·-¡<y!‚ ¨µ\í‹Nv©‰L«üÅ“³\Î*‰ôØ‹¦¦\Êüœ\ÔF!\0\"+\ç\Ä½\'\äŸpý\ë\Ï---\Æ\ï*«\0&O››œ¶€+u\ÎRQAA¶ñ²··¯È²€­0þg\ÐNV¼q\è\0\àqG˜{Vž$$a£c\Z7·\ï¶Už¼P´(o\Ü\à>¿\Üg\ÜA%½¨4I\íôŸ¸¾Xe¤»Öª\Ú4Š\Ò\å¬ýûü2qSÛ’KŽia\Ýup\î/\ÏÝ¯$>ÞŠ’K¶t\Ã\ÏK”üÿ\ê6ñ´-=úU\\\ÖiÂ\'³›\Õô\Ðtz\î“ÿ\é/zn³¥C\Ðc-šš*ósRÛ…\0ˆ•ˆ=\'ZZZŒ\ßTV¸.þ—±zuñ=\0ö€Z*‹wo©\"`\Ù\Ê!\0a\îýA\îWy’„nCr\Ó{v‘\èÚµgz®\È\n\r7Ÿ\ï¶%ôgnóÄ¹h\î\ÂÕ³X<ˆW­5I–™6\×q\Í\Õ\ëZ/W=i­¢©p\âe-7PƒRÔ›\âòh\Ð=K¹d)«¾\';,3.kD?ô\Ý`\à‹’Ä¦\Î}zmªV\Ó#/6/w”»t\ã\ì\Ä?ü…ùI›µKQ\0§Z§6õ\Z<\ê›S’%°x—Z\ÞR\ï\×\Úz·,u\ä\å[&\Õ\Ò\äüvp½\Ë¯C-\ËlA¤ˆ^=tET°c†XGstLó”\\¹¿\Ø\Ø+Ä­AÏ—¨\Ù_l¡È¥Ú˜Kò}¢\Çç’XžMönhu\Ý^¢»zþ\'õ\Ó\ï\Ë\î’b—BâŒš\ë–ÒƒŒDho[ÿoU&\ïÛž«ôØ‹¦¦\ÊüœÔ¦!\0oZZZø\ï\ÚW¸.þ\0´\Z\Â\Üûƒ°ò$!	Ý†\ä¦÷\Êõ—Ÿ=ÿÙ²‚ÿ>d/‰v\èPd\è\Ð8¸¹}·­öÀ\ÕfQ\ï$f$l\âe¤kfÆœ\Ü˜iQ›…³\Ë:Í­\ÊS³,.È”¿©›EŠ¿R¦_\r<—C\Ù(=9·Ð¹}÷½\Æ0z¼\Ù`sh\ëJÝ€\ËVi\Þ\ÏM³=d	\Âv8$\ËðòW²þ’óù¼\ìB\é~)¯×·ƒ\ë]öx*Y\"E\n¸½6¾D\Û]\ìöÉ®¯j\Ó(w\Ó\ËRº·ö«\ÅnDC‘G\ç\ÍÆ¥µ-žŠ\éKªþ&1P¼)¨n°\Ë\æ:ü_ƒ$½wty>–Š~«\ÉW>xg¼•W\ã\è°5\Ò\nA@45U\æ\ç¤(\nüw\ír]ü\0h5„¹÷¹_\åIB6º\r	6ð\ÉÒ‚N#Oušq¯S\Ú]Ú¡C‘¡\ã\æóÝ¶=m™q4\êŠE\á\Z‡\Þ\Êem²ù™\Åÿp9\Ì\äBò<6e±v\r<—\Ë\\³g1m\Úwo\Ðk£GA›]=íŸúú®¼\n q\ÓþM£|n\ì.\ëðò\ád°å‘·½l\ä\Û\íñvp½\Ë¯Ã€\çr{m|‰¶³´\ït„f/_llstûa¥q\çŠ\íKŠp€-p]ú.½wty>–*`€\ÞË³ºµ\î\çð;Œ…\0PMM•ù9)ºB\0\0€\èA˜{Vž$$a£Û`C\0ÿeð\æÿgÿÀ4\ãŠ\Z7·\ï¶Ÿ¢¸|.m±(l¦\"™Ï‰U\ämZMŽ.‡™\\Hž\Ç\Ù_\é)\r<—\ë\\“]‘Cû\î\rzah¢93\Ò\æ\Zl\ÙH[\Ök~\Û;KY‡\ÌðL6-\ÖÜ¾¹žösóhª\êöñ\Þ\çQ\ß\ä\ÔAK}I7\Âu\än–ñ.ðz;¸\Þe×¡s–S@ym¸+Y\ïµi\êÈ¡\Ñg>Í–\å*f=+ 7¨\ßh\Ïÿ‡S{¿D{©ºM¹$·,kŽ£D7˜+\Öß•ò>—9t±}\ÉBn!\0nx\È\Û\îûX(!\0‡Gi\ï_.\Ëû]{›\Ó#…½\ÙE\Ñ=-Ph$\n9=|<\Ã\"ôØ‰¦¦\Êüœ„\0\0Àa\îýA\îWy’„nC”\ß¶^¤»0\à\æóÝ¶„ƒE‘$\ÍZH\Öy•4\ã\á’\Z¡i™>Qsœ9\Ì\ä¼t‘C\ç%\çÑ c¯d¹\Ï5Yÿ”Xn\Äý\\\îc\È&vú7N%#mp‘˜[‹i·6MSvmo8\n\Í`\èV\ß#‹‰µ\é`E\ÜDÎŸMIõùºøR@\à€.f‚8‡\Øðš!\0vŒC·‘g3oõs~ö	<{\Ùx¾\\\ï²\Ç\ëÐž%½´B}…$÷[,¼Ÿ0i¾>Þ—_uvYsm\rºöÄˆj¹YJ‡Z¬óV7k*tÏ²ô\Ð:\Z¶\ê=º!:\Ï$WaY\Ò{M\îFL_²SÀ£\Þb±Egˆô\Þ\Ñ\åùX(?!\0\íA\íû»\0z¤Dñ6\Ï%ý\É`\Üaö]€\Öý2E“hjª\Ì\ÏI1H_¸r\Ø\Ä4o¥\ÎûF”\0øF˜{Vž$$a£Û‹õÃºt\é\â½&\à\ã‹\0¤‘§ú-\Ê:4nn\ßm\ë\ä^L™þ\Ê>Mñ˜¸P–a±\Ûw˜\É9u\ãrh\\š`y÷\Ð\â¯lq\è¡1·#»¨e\Éí»Ÿ\ËkC›‘Ksnc\nnÿ¼\ÑO?ôžå«¢))›7\ë_þ\×g¨\Û|þ/f?\æi&\Ä\Íüø–\ÕE[^n#^À\éz¼\íY\ÒK+\Ä÷Whb·\Øú\ZÐ¥:4/\Ù\ãiûüVòvg½<d€ö]^.µ”\ÎK‡\Ì\Ê\Ê\×+eyõÐ½Aµ¤,k1\Í\Ø‡¬Š~-\ÊûN(&/Y\È\áŠ<º@¡‡\0\Ë\Õf!\0\áÿ}t!\0¨c‰¦¦\Êüœó!€ñSæŽš<\Ã[TF”\0øF˜{ûUž$$a£ÛõÃºvõ\\	P~ö<\Ùþÿ\Z¿—D;öŸtóùn[\Â\ÛóÈ“\Ú÷ùÙ…uŠcý†3—\ÃL.$\Ï\ã\ì¯ôž\Ëk®©U§+’qo\ÐkC“ÛŒ\Üc.pš\î=\ËW\ÅC\0\Æ\ÄT_§\ê/À\ã¨oN\ÑµFý\ÛGY_l¹¼\å#„ô›\ëùvp½\Ë¯C\ç,[Àþ\Úø\rA\ìeÀ­¦\ícj\Õò\ÙmªUö2\æKH3Àª¤W—¯›\æŠ},Tqµ¯\ÚÅºQ¯º6\È\å¯\Öb¦ýf/~¹˜E1v\ÉBög‹W7(Œ€\Óc9 ü„\0‚B\0‚\ÂMM•ù9)¶C\0---§\Î=sþ¢·\Æ$\Î\0\0¾\æ\Þd€•\'	I\Ø\èvƒý2€w  4nn\ßm+,ºú¡¨e²¢\ÌT\\\'.l$0«\ÉZ\Òa&’\ç±ù+‹»óh0à¹¼\çšl¿l•Üˆ{ƒ\îc\Îœfä¶™·9;÷\È\â‡Þ³|U\Ôs)À¾ ž(\ë\ç5¼ˆ(\Å|KOKry\Û\ËF\Ë\å·\Û\ë\í\àz—½^‡6K 5\Òû+\Ò^F 8\Ë\'\Ä,¥Ë§\Ê\Ö\è’]þ^l\Ú\â©˜K-wûªv\Ã#K–{ƒšüuC-F‡\ìENçµºe«bë’…”\'	“G7Iÿn‘š\Î\ìc9 |„\0‚ü9@\Ûû\ÝöŒRY;¬\ÇX\Õtz<ESSe~NŠùÀ¤ióv\ï\ÏO›·œ´>3k\Ùw[øþ¶½‡ù\ÎÁ¼c“f‰\nTft\ë–Á\æû2Ž‰¤µ\Û „¹÷¹_\åIB6º\Ð\0Áü6 n>\ßmK°.›‚(s\'‹b,–\æ‡n{º\Ýq9\Ì\äBò<Ö–5\ß%È£Á€\ç\n0\×d\çzr®¯pƒ\×†&÷9›j›YÚ‡Šú\Ì\Û#‹\É#ð_À\'\Ç,l±Š\ï^`ý8´\rW(#Ï²\Ìû\Å\î¬õ…\íüvp½Ëž¯Cv.3¦ …ôÆ½^_¢aÉ¼$\ë-`þ\Í\â\í]¤ùU\é5#½,U+«\È×‹u\Ã\ÏKT>—ö\"·¾\æEtI{ÁKY=T^\ê\ëÓ¥Æu`\á\Üq–¦T\Å\Ø%±\\5®\áÑ@ò´»Á>–*P€?â‚±\ßÁ‡\0¬Oy‡E \è±MM•ù9)zC\0c\ÒV•W].´´´$NŸ¯|\æo\×ø\ätQAAv\à\0`E˜{Vž$$a£ÛõÃºò$Â¶ÿ\Z7·\ï¶ÕŸ¹l\â¢}\\\Ïdq/òdEsG\"—;%IÜ½¨U˜,¶‡\Éa&\çÚ —´É“T\Å:óóh\Ð\Ý_±þ;\×R\æv|\ÄôF\Ü\Ï\å5†¡\ÉóC9a	¸¬\Ón,’\æDn@\è\ë›$c@Ò½ûµø‘\Ó\ëM\È{\ä\åm»\Îo×»\ìý:´žK\î’W\Ý_Q¡I¾¿\Ê-¶¼0›sIš9”êš·R9òzsz±iX’ýE\èò•*\Î\Ý\ÏÊ˜\ç2³¨¼5Ëµ‡l4¤b\Ê!É±Ç×²¦?V—,gyw\Ã[\ì·Em‹¡,\ï \Ë\ÛÁó±\ì.vc\í•&±\Ò^H\é~½·½‡\Æ[[y›«\ïz=h\Èe{›³\ÅVþ~c‚\Ñ\ÔT™Ÿ“¢7Ð£\Ê½\'¤-\Ù\Ú\Øt[$\ÙhiiIJ]°e\×ÁÑ‰\é¤o¿Ïœ•±Š\ï¯\Ï\Ì\â;Y‡ŽNH™-*( \0€;\Â\ÜûƒÜ¯ò$!	Ë¸ù|·-¡<y!ÈØ‡c˜•>.²[>(\âb6ØŒAbð\Õw!,€:žhjª\Ì\ÏI\Ñ \ÑÎºm¹÷<---\Éi\ÊgþvMœ2GT°@þ»“ >Ks\ãññ\"E÷\å,zV</NÅŒVyŠ\Ü,…#\ÙG\ÅnÝŒ\ÒF\0´>\Â\Üûƒ°ò$!	\Ë\Ð8¸¹}·­ò\ä… ²N\ÓO\Ï\í‰){\Ì\n!€V—÷ZzHó½øö»\Ã@PGMM•ù9)B\0\\q\Ã\ç\æŸ(y:---)32®˜4\Õ1Àm¶\ìÀõ²ö¦\×¨°\nÂ’›\ÅhO¤Ql\ÏlV$]Ñ¨GIñn òs\ïr¿Ê“„$lt,\ã\æóÝ¶„ò\ä… \ßbQ\0}¹¬õû´PL\É% .S7…O³}\ËXBÿ”°Îˆ¤ÿ\ÕU5‚o\Ñ\ÔT™Ÿ“b&Àµr\ã‘­\Ñ\Ò\Ò2e\æB\å3»&Osù£€¦·\î¶Û’hÅ±.\íˆ\Ï\ë,\Í,¦\ï[‘gU\0h+„¹÷`\åIB6:–¡qpsûn[\å\ÉAAA\í\"šš*ósRÌ„\0z}™–•sB\äé´´´Lµ0\à*€\Ä\éóDG7\Î# ”7Sô½ +j\Ð! m\æ\Þ\ä~•\'	I\Ø\èX\Æ\Í\ç»m\0\0\0\0\0ˆ”ù9)B\0¯|˜¸rã»÷\î‰	-°Hù\Ìß®\Ä\éóEG7Ndùù\"€QH.F‰\æ²ý¾ž_d{REs×½bV¼‘\î\Þ\0\"0÷þ ¬<IH\ÂF\Ç24nn\ßm\0\0\0\0\0@” \Ì\ÏI\ÑHš»\î\ÊU\×YuKKË´ôEW$¥º„\0˜«\ÖVÞ“\É\Öw5„\éàº™m\×1ŠI\í°V\Ì¤¶ŒŠÝˆ@•t\0\Ú\na\îýA\îWy’„Že\Ü|¾\Û\0\0\0\0\0€\èA™Ÿ“¢70,eù©Š\Zq\à\Ì^¬|\æoWR\ÚQ¡• Kw;„¹÷`\åIB6:–¡q K\ë\âD\0\0\0D?\×þ\æ:šÄ•\Ð!Q\æ\ç¤\è\rø$u\Î\Ò\ä´Þ¢2¢tˆ\È÷s\ØôR*\0\à1D˜{<®!\0\î\ê\É\Þó1ñÀO\0\0\0 \ÝQ\ìqG¸r\0:$\Êüœó!\0\0@+!Ì½?¢+°~˜ö©<c\Øz‘\Z4|\0¨Œ±\n sMV§Ñ’\Ö\ÔñtFi‰%ktV\ç\ìf‘Å¨‹“²\âJEªÚ Y‹—/\É\Ô¬}\é\0\0\0°¢\Ø\ãŽ q\å\0tH”ù9	!\0\0€3\Â\Üû#jB\0¹\é=»v\í\Z¦ñ7	m\0s\ì¦\íg.\Ýôù]‹H\æ\Ôtk\Éú\ÊÎ£óR\ëÅ‘†\Öxzž¯ö\0\0\0\0@C™Ÿ“b>¾på°‰i\ÞJ÷(\r\0ð0÷þˆ–Àúa]{¦çŠƒ@\ã\â*\0\é“Ë¡«E\'\Ão]/`\Ç%WJ[½M„\0\0\0\0\0\0€Ž2?\'\Å|`ü”¹£&\Ïð•¥\0¾\æ\ÞQˆt «\0˜o7—ô»Zt–®\Ø{®!\0vFq\n„\0\0\0\0\0\0€Ž2?\'\Åv ¥¥e\âÔ¹\Ê\ïÿ\Û5&q¦¨\0\0ð0÷þˆŽ\0ûÀ°õ\ë‡u\íJ†œÿ4\Æ*\0Þ¦#<×²\nÀ\á{û\ZÌ¢[r¹u/\Ï\Îl\Ý\ÝC\0,+½²œ\0\0\0\0\0\0:\Êüœó!€I\Ó\æ\íÞŸŸ6o9i}fÖ²\ï¶ðým{óƒy\'\Æ&\Í<þl¿‰cbø´R³\0Da\îý!\0fþe\ÛÏŽ\Ã[U\0šKøE\09 \íó\0µ¤G€}@\ËB\0\0\0\0\0\0\è(ósRô†\0Æ¤­*¯º$\\hiiIœ>_ù\Ìß®ñ\Éé¢‚‚l\Å\Ãø/\Ü\Z%ˆ4\Â\Üû#zB\0–\ÏýÙ²€°b\04\Æ*\0o\ÔU\0ò·úe[\îf\ÑYº\Õ\Þ\ÛKz…\0´òtR·ö\0\0\0\0@\ÇC™Ÿ“¢7Ð£\Ê½\'¤-\Ù\Ú\Øt[$\ÙhiiIJ]°e\×ÁÑ‰\é¤o¿Ïœ•±Š\ï¯\Ï\Ì\â;Y‡ŽNH™-*(\È\Û\Ñl\åÀ[\Ã\Ø\Õ\0\"Š0÷þˆŽ€\Íñ‡½ «\0ü…\043oû\Ê@0!\0¶_’‰\0\0\0\0\0\0\ÐQ\æ\ç¤hhgÝ¶\ÜûŠ‰–––\ä´\å3»&N™#*X {\ÝIŸ¥™\íøx‘¢\Ûn/n­\î\Ð\Z¯(5!1\Î`&òV\\\ïF|†Ô¦¼O§ \Õ\æ\Þ\ÑP<¿ö\Ãû5\0\Z‡°WX½½»E\ç\ëÿu?B€µ\Ð9\Ý\Ço\n\0\0\0\0\0€Ž2?\'\Å@€+nø\Üüì·®dZZZRfd\\0iªcÀb\Ï5+®d\ÅK†\\/ @e„¯Ìˆ·6÷=v£†”+\ÒD{¬\Ï\ÓŒ’ö\Ó\Ð\Ês\ïh	h¾Ÿ\Ü8\'¼\ß`„¾\n@ÿµ?‹«\'˜±·\äZ>ùg&_\Îf^i¤×²„\0ø!B\0\0\0\0\0\0€£\Ì\ÏI1\àZ¹ñ€\È\Öhii™2s¡ò™¿]“§¹üQ@ÓŠ[÷\r\ÃmI´Â¼ºôa>\áÜš¾\ç˜K;üƒ}\r–¦TÌ²–4Z\0 õ\æ\Þ\Ñˆ,4|€ŒU\0\0\0\0\0\0\0D\Êüœ3!€^_¦e\åœy:---Sg-¸\n qú<QAÁô\Û\Ö}?!\0Ž\ìÌ[\Ó÷s\åDŽR\Ñp(\r\0\ÐVs\ï\Ç5À]½}K†\ß1\0\0\0\0\0€\èA™Ÿ“b ðÊ‡‰+7¸{\ïžÈ\ÐB\0‹”\Ïü\íJœ>_TP¸¼Ÿ\å\ë‹\0\Æ\Â|QFi\Í\"ˆ¶ŒF\å]\Ú3øgÐŽÙˆ¶g„\0\ì§ •\æ\Þd€•\'	I\Ø\èX†\ÆÁ\îóik|\æo\ß\0\0\0\0\0%(ósR´‡\0’æ®»r\ÕuV\Ý\Ò\Ò2-}QÀU\0I©.!\0Í 3\È^\ë»\Z\Ân{ùm©¼T\Ú<f\æž`¿\í§7!’(‘Ð›U\Ú1\Ï\È÷ôlª¡ýK\è§ u\æ\Þ\ä~•\'	I\Ø\èX\Æ\Í\çc\0\0\0\0\0\0ˆ~”ù9)zC\0\ÃR–Ÿª¨.°À\ì\Å\Êgþv%¥-\0\0¾\æ\Þd€•\'	I\Ø\èX†\ÆÁ\îói‹U\0\0\0\0\0\0 úQ\æ\ç¤\è\rø$u\Î\Ò\ä´Þ¢2¢tˆ\ß¸­\r\0\àñA˜{ûUž$$a£c7ŸU\0\0\0\0\0\0 úQ\æç¤˜\0\0Z	a\îýAXy’„Žeh\ì>Ÿ¶X\0\0\0\0\0\0¢e~NB\0\0\àŒ0÷þ ÷«<IH\ÂF\Ç2n>«\0\0\0\0\0\0@ô£\Ì\ÏI1H_¸r\Ø\Ä4o¥\ÎûF”\0øF˜{Vž$$a£c\Z»Ï§-V\0\0\0\0\0€\èG™Ÿ“b>0~\Ê\ÜQ“gx‹Êˆ\Ò\0\0\ßs\ïr¿Ê“„$ltÛ±~X×®d\ÎeºöL\Ï¹¡\à\æó©e\Çôv¡<;¯\Ó\è,Cq¥\"ý‡\Ò9\Ô9»Yd\ÕWv—Z/Ž,x\Ôb4§¦›Y\â\\¬53Q—Kû\0\0\0\0\0 ­P\æ\ç¤\Ø´´´Lœ:Wùý»\Æ$\Î\0\0¾\æ\Þd€•\'	I\Ø\èv#7½g×®\ÃÖ‹£ q°û|\Úv‰šU\0™k\Èl—dŠ#+\ÌÌ»d¸\Ôú¡.Ž¼ýš:q\Ä\În-\é\Ñ,\0\0\0\0\0hs”ù9)\æC\0“¦\ÍÛ½??m\Þr\ÒúÌ¬e\ßm\áû\Ûö\æ;óNŒMš%*x`þA~	\ÇD\0:\Â\ÜûƒÜ¯ò$!	\Ý^°5\á­ˆU\0Ì“[?¥—ˆt€…\Ò+\ËÅ‘\0\0\0\0\0D\Êüœ½!€1i«Ê«.‰ZZZ§\ÏW>ó·k|rº¨  ;|„\0\0°\"Ì½?\È\0+O’°\Ñ\íC–\04vŸOÛ¨YÀ—\å»øü‡\0<\Ã\r„\0\0\0\0\0\0¢	e~NŠ\Þ@þ)/ôž¶dkc\Óm‘d£¥¥%)uÁ–]G\'¦“¾ý>sV\Æ*¾¿>3‹\ïd::!e¶¨ €\0\0\îs\ïr¿Ê“„$lt»‰%\0„›Ï¦\ß\Ð\ç;~÷ž™yž%dþL@€€S-VEjÁ„\0\0\0\0\0\0¢	e~NŠö\0‰v\ÖmË½ÿ\à¡ÈhiiIN\ËP>ó·k\â”9¢‚ò÷ñYšÛ)º\ï÷˜YÆžµAŽ‘fg\é\Ö\Í^€hB˜{Vž$$a£Û\È, h\ì>Ÿ¶\Ñó[\0:Æ¯ôI<²«\0\0\0\0\0\0ˆ5”ù9)B\0\\q\Ã\ç\æŸP¿‚\Ú\ÒÒ’2##\à*€ISC\0²\ç^]?ÈŠ—»^@Á\Ì\Ò÷¨–0ó•ñF–H™\ÆY\n]s\ïr¿Ê“„$lt\Û\Ã\"\0X@¸ùühZ £Œ¯\ë#\0\0\0\0\0Ð±Q\æç¤˜	p­\Üx@dk´´´L™¹Pù\Ìß®\É\Ó\\þ( \ìð\å}Ã [­˜Yúý\Û\É\\@À\à):,Ç¨e/@”!Ì½?\È\0+O’°\ÑmN„¾À q°û|\ÚF\ß*\0öu\Ù€_p!\0\0\0\0\0€hB™Ÿ“b&\Ð\ëË´¬œ\"O§¥¥eê¬…W$NŸ\'*(†\\\Ù-À¡#\Ã\ÛÛ«+)ra\0¢a\îýA\îWy’„nc\"ö%\0†›Ï\ÖU\0\Ö?\Ú\á\0\Ï\Â\0\0\0\0ˆ”ù9)B\0¯|˜¸rã»÷\î‰	-°Hù\Ìß®\Ä\éóEÙ\ËûYþ¾`„	x\é¬xci¿^‹\Z2\×ûgÐŽ‘\åP€\èB˜{Vž$$a£\Û-\0¡%\0ƒ\Ý\ç\Ó6jV¿(dù\Å~\î\Øs™W·dY¿>`É²þ\0\Ë\Õ\ï \0\0\0\0\0M(ósR´‡\0’æ®»r\ÕuV\Ý\Ò\Ò2-}QÀU\0I©.!\0Í¾3ÈŽ\ë»\ZÂž{ûs\æ\ï	öó~Z!©½¾-\ÑhÐ±0\0Ñ„0÷þ ÷«<IH\ÂF\Ç2n>?ZW\0\0\0\0\0\0`¢\Ì\ÏI\Ñ–²üTE8p…\0f/V>ó·+)m¨\0\0ð0÷þ ¬<IH\ÂF\Ç24vŸOÛ¨ý-\0\0\0\0\0\0\0”ù9)zC\0>I³49m·¨Œ(\"\âó~	¬\Ý?\Â\ÜûƒÜ¯ò$!	Ë¸ù|¬\0\0\0\0\0\0Ñ2?\'\Å|\0\0\ÐJs\ï2ÀÊ“„$lt,C\ã`÷ù´\Å*\0\0\0\0\0\0ý(ósB\0\0\0g„¹÷¹_\åIB6:–qóùX\0\0\0\0\0\0¢e~NŠŠÀ\Ôô¥_O¶+1m¡(\0hs„¹÷`\åIB6:–¡q°û|\Úb\0\0\0\0\0\0ˆ~”ù9)*B\0	c§‘h¥‹\0€6G˜{ûUž$$a£c7ŸU\0\0\0\0\0\0 úQ\æç¤¨Lš:Wù\rÒ¤\éÊ¢\0.,\r\0 m\æ\Þd€•\'	I\Ø\èX†\ÆÁ\îói‹U\0\0\0\0\0\0 úQ\æç¤¨$¦\Î/(:½hù®Cù\'Ïœ¿ˆ¥\0´/\Â\ÜûƒÜ¯ò$!	Ë¸ùüº\n ?a\ä;?\ZùNB‰8ŽaJ\Ò42}¯8hKBÃjy]£hiu¾Hkw:\ÂMQ°\\r$\ZŒ\0QÒ\è\0ˆ”ù9©\ÕC\0c\ÒV•W].$\Ï\È\à!€²Š´]¾v\Ûwv:.\r Mœ)ª	*3ºYþD_V¼ö\'û\Ä?\0€\æ\Þd€•\'	I\Ø\è¶eý°®\ä\Ï9]{¦\çŠ\ä¡q°û|\ÚR\ãŽ\é´}\ìa¦\å\îÙµ\â°}`“\ï\ÈY¯	µ¡¡k-—nø¸Æ½«#ÀM\Ñ\Ñ-šµñ¼È³b¿\äÐº‘¹&«\Ó\è¬\Î\Ù\Í\âX§<;\Ò\rÅ•Šô€¸u£ncwùºÄ‹§6c–”¨K«®eY^c,\Å\ÌR\Ë°û(\ç\Zc\È^´–[l\Üqnx\âz¿¼{¨\Úý\0€¶D™Ÿ“Z=Ð£\Ê½\'¤-\Ù\Ú\Øt[$Ù˜2s\á±\âò\Õw˜8SYöÏ•0.•/\r OI\Õt¬1\0X\0\"ƒ0÷þ ÷«<IH\ÂF·!\äÿ%ÛŸ›Þ³k\×a\ë\ÅQH¸ùü.ø-€ö%\Æ\Ýf„qé†kD 51¼®;‘¹\ä\ê\âF\ç¥f—tJ¯,)-.P’)Ž\"€fw=\Ç\Ö~Éš‹ö˜Y\ì\ÆI±\×û\È^´³º{•ô1ò\ì¼\ÒC\0\0ˆ”ù9©B\0$\ÚY·-÷þƒ‡\"Cbê¬…\Ü\Þ{,þ_¾v\Ûê»Š\Ê\ÎNœ:GT3c\0F@N¤ýN\ZZ\n‰\ÏÉ¢ˆ\Ø3\Êu%\0\èÀs\ï2ÀÊ“„$ltÛ¡z~v\ÞB\0\Z»Ï§mG^„mó\Ð@ 5ñaD#sÉ¥\Üü\×\ÅY>\çg‡öua yoo\ÐEF[–¶\Ä@¿w®÷‘¿hi\ë^\Ò\Ç\È;\à£ó–\0@Œ \Ì\ÏIm\àŠ>7ÿ„¤fLK_Dþÿô¹\Z\Åÿ\'O_´|Ã±’Š\É\Ó\æŠj&¦—7\ì½\Õß‹4ž«\ç°»\Åke²\âYŠ\\™§Ð\æ\Þ\ä~•\'	I\Ø\è¶dý0¶þŸG´ýð`@Pœ\ÏN0V\ÌZ¬‚uñ°\ß	´c-e2—q.\ÅP©þŠY©¢[–µjœµ#r}uƒí’ƒ\Å\ÏhHe\ì\Ý:\àx]~ºÁ÷‰\Çþ¦˜¸QK‰\Ì5\Âê³ý\×\Ôñ\Ä~hNM\ì*\0þ÷7.\Ú,ãœ¥§°Qr<—x\Ñ\ÒÀµ¤½~°\×ò\î!\0\0\Ä\Êüœ\Ô\Ö!\0®•ˆl\Ô9K“\Ó$¥\Îwü]@\Òø”ô\ÕwñU\0‰\Ó\ç‰jº«7M¼‘\Äv\Ä\'û–&²²\â\ã³h—X5^’\× \Ã#Ì½?\È\0+O’°\Ñm\rû6\0„ù\0\r\Z»Ï§-V\Ø`órg3\ã:•÷Ä»–K®‡\Û\Ô\ìŸY\Å=Kó9z–ð™\â]£l)];\Ú%‡Œ\Çh˜·\\—N!\0Ü” p2¢—*Ú·\0\êµ\Ý\Ò«\çg´_\Ð„‹ö6gr1\Ø~]´V\ÆÁNKw“\Ý/~.!½¤þ¢¥\ê	,\àa¿³önøÁ^Ë»‡\0\0#(ósR[‡\0z}™–•sB\äYiii±ÿ. ±ø\ßX”:_T\á®^Š\0\è>_\Ú1\Ñ\ÊñOþ™û\Ï0–	0\0@C˜{ûUž$$a£\Û\í«\0|\í?ÿ]@¬h˜±\á\Óq;\ÚT\Þ:öw-;\ç\î6uÛ #e1{\é\æ!\Ý\Ôp\éFˆ—2þFÃ©˜:,ð¾.Ý\ë›B8QKñ-\0ú\Ê\Î¿ùÇ—D0 Ed~\\´Q\Æ\Û`»\ÝGs©Z;ö’#\ï?—{\0\01‚2?\'µ]\à•Wn<p÷\Þ=‘a£¥¥\Åø]ÀU\ëw,Z¾A^üŸœ¶€+u\ÎRQÁ3úÝº™\0\Éù“\á7øgh;dÿ	-›\åŠl¶,€ý+\Õ \ã\"Ì½?\È\0+O’°\Ñm‡ú[\0l=@xkh\ì>Ÿ¶X À\Éh3i\Í33{ö¨\åb\\Í¡m*/•dsz~I\á¹M\"´K\r£¡S|‘\êHƒ›\âvº\0–R\í|ð8,þ7e´,\ë\ï†‡P>.\Ù,ãœ¥§¸\ÞG\éEKehô\ì%\í\Ýðƒ½–w\0 FP\æ\ç¤6\n$\Í]w\åj€\ÉqKK‹ñ»€Eegù\Ê\Åÿ\nÚ‡÷\Öó\r¯\åqD	2þz®¹k/@F˜{ûUž$$a£\Û\ë XBX!\07ŸU\0\n\ÌÉ¸­\Ñ&\ÐA»/{­`Ý¦\Í\ëzdÉ¸7¨\á\á6\rB»\ä ð7\ZNÅ‚\à¦„E1¢—\Z\ÆRY\Î\ßÿ\×þ@`$ÿ@€ò¥†K6ov\ä,Kƒ®÷QnöJ\ì%º\á{-\ï\0@Œ \Ì\ÏI­–²üTE8ð¤¥¥…ÿ. ]Î‹ÿ\0­‰0÷þ ¬<IH\ÂF·\Ú*\0\ÓóK\ß\n\Z»Ï§-V¨hsežÊ¶À\Û¶Z¶©9Gž 3sõŽ\é¯Ø¡R\èË˜õ,i}\0·\é\Ò\r+Á]rfCwN\r\æ\ÃZ—nX{ËŒ“­6{¸)`=Q¨\Ç%‡‚ú\å·\ïZ°Ày@h°\Úù\0—LhW\ÍkY\ï”vÇ¥\ç+Àj\ÍJ°½Tœº{-\ï\"Ä—\r\0\0D\Ze~Njõ@Pð\ß´\Ëeñ?\0 \æ\Þ\ä~•\'	I\Ø\è6…\Ù~ò\çœð\Ð\Í\çS\ãŽ\é\Zmº\Ì,&\Ã_ñy³=Ý›€µ\äR®fK¸ø\á›\ÅÌ¢ò\Ö,õtFV\0·\é\Ò\r¥5Ÿ—\Ìá¶¡S\\p\Öú\é†l]Ø…HYL\Ö\ër$\àu9v£\Þûð:Ž†ý’ƒ\Åú-\0Žñ]\0u@\Ø PºzÿEŽ‹÷¶ˆq½\Ö\'†j\ãY@\Î5NÇº!½˜y¯\Â\n¸\Þ/\ï1\0\0@t \Ì\ÏI\Ñ\0\0D\Â\Üûƒ°ò$!	\Ë\Ð8\Ø}>m»`\0\0\0\0/´\0B\0\0€öF™Ÿ“\0\08#Ì½?\Èý*O’°Ñ±Œ›\Ï\Ç*\0\0\0\0”§vf\í\0\0´\Êüœ!€©\éK¿žlWb\ÚBQ\0\Ð\æs\ï2ÀÊ“„$lt,C\ã`÷ù´\Å*€°Q›òó³‚ UÀM \"\à;\0\0€(B™Ÿ“¢\"0v\ê\à‰vQº(\0hs„¹÷¹_\åIB6:–qóùX\0\0\0\0\0\0¢e~NŠŠÀ¤©sù/ÿ\Ê?™¹û\Ð\á\ÂbÚŸ4=CYÀ…¥\0´\r\Â\Üûƒ°ò$!	\Ë\Ð8\Ø}>m±\n\0\0\0\0\0\0D?\Êüœ!€\Ä\Ôù<°mONYÅ…\ÙGh?Z–Tft\ë–Á|@\Û\ÐÆ§Àa\îýA\îWy’„Že\Ü|>V\0\0\0\0\0€\èG™Ÿ“Z=0,eyþ)vI[%JüðCòŒòü§\ÏÕ¬\\·}\Ë\Î«\Ö\ï(-¯r\\\Z@\Z›8ST“ÉŠgßº\â\ÄgE\ÒH+MÑ¡8\rAgŠ4€¨A˜{Vž$$a£c\Z»Ï§-V\0\0\0\0\0€\èG™Ÿ“Z=pª¢\æ…\Þ\ì*¯º$JüðÃ”™\É\çoØ¶o\ä\äte\Ù?×¸”¹|i\0i|Jº¨fÀl¹\áÆ³\â\ÉB·j@?´œ6RD°\ç\0„‡0÷þ ÷«<IH\ÂF\Ç2n>«\0\0\0\0\0\0@ô£\Ì\ÏImñE€¤¹\ëÿŸ¶d«\ÈÓ˜:k!ÿ\n€\Ç\âÿU\ëwP3\ç/Nœ:GT3Pm3ó\æn\Ñ\ÍÝ²³*ññ,UK1\n\íHm˜‰«(•¡}·¦\äð€±H\×5\ÊxœŽ7.ò´=ö¯GŸ¥&¤32\Â\Üûƒ°ò$!	\Ë\Ð8\Ø}>m;\è*€ü\í÷\áJ\ÄqS’þ£‘\é{\ÅA[\Ú†T\Ë\ë\ZEƒL«óEZ»\Ón\ÊcK”ŒnŠF\0 ¡\Ì\ÏIm¸rµ\á•\rÿß£Jc\Óm‘§1-}Ñ¡ü“[wôXü¿q[ö\Ú-{(eò´¹¢š‰\î~\rë«»f\ròß’K\æeØžQ‚DM*j\Øk‘di\Êr(\n±ŒN\ç’5(\Ç\Ç\éŒc•2Ú¡k#z[,+^:\0¡\"Ì½?\Èý*O’°\ÑmKnzOò\çœa\ëEbÈ¸ù|j\Ü1½#À|\Ú;Ý³k\ÅaûÀ¦¶a\Ík#\ã6C\íFhc\èZË¥>®‘ýÀˆ…\0pSj3fEü=ôuñ?ñ(U	û$´1\Ì\\“\ÕitV\ç\ìfq¬SžG\é†\âJEz@B»)Z­\Í\Úx^\ë\Ôm\ì®i!ñ~a­™‰º^{\à›\â\Ô\r­–ù‡9\Ïg\'H°øÙ…”K\í¦\0\0\'”ù9©~p\å\ÆF`Ý¶\\‘ª“:girÚ‚¤\ÔùŽ¿H\ZŸ’n¤$NŸ\'ª\Ù`™Lÿl:hË¾’¨8,Ù­:!\æ–Û­°±o\0ˆú–\ãX\ËL\Ô÷”b¢K\æ)F\0\ÂF˜{Vž$$a£ÛõÃºví™ž\Ër\Ó{v\í\Zf€\ÆÁ\îói\Û¿Ð¾„mfØ´¸ý\Üf„qé†kD uˆšÀ¬„\î¦!Œ’—«J]\Ü\è¼\Ô\ì’N\é•ò\Ñ\×\â%™\â(¸)4\\Ý³7&HN›¡ùg\ÏA\î^¼)N\Ý\áý,\Êa”\ÞV\0@¡\Ì\ÏIm¸{\ï^¯/\Ó\Èÿ\Ç\rŸ{ÿÁC‘j¥¥¥\Åþ»€\Æ\âc]@R\ê|QÁ\í\Óp\Å-\Û÷\Ý\np<rý6ö\í!\0?-˜‰úžc1JG \0Da\îýA\îWy’„n3lžŸ%„póùy@Tö¬!\0\r„\0Z‡¨	¬Î§­^+J^®\n¥\Üü\×\ÅY>\çg‡öua\á}Shp˜\ëV\Þ\ìÐ¾.ÀBð!\0¯›\â\Ø\rvŠ„\ì\"pP·±»\ÖB\0\0\0¿(ósR…\0ˆ¬œ/ôžBòZhii1~p}\æ>rþò\âÿ\ä´\\©s–Š\n\Ú/\0Š}\î-Ù´\à\Ì \Û?ºg\ÌEôlGr\íAx\Çs©Mø;QŸ\íhIê‰¬d\Å‡j	a\îýAXy’„n3˜\ã7\Ö\0h°Ua\Å\0h\ì>Ÿ¶X\à_ž*$Ï›­+iý\ÎVk)‹r¹Œs)Rµ”l®,UtË²¶@³vD®¯n¡]r°ø\r©Œ½V§\á\Ç\ëò\Ó\r¾O<ö7…\Ðm\ZÝ°~\æ\Âðº#n.\r”¸\Å\ì¼\ÒU;vCw›\"Q”q©%ß¬P\É\\#¬>û\Ø1Í©\émº\n€¿¨øŽt]\Ö%÷Ž„p½)\Î\Ý\ÐnJ	mY\nu‰\Ê#\0\0e~Nj»\0±r\ã±\çDKK‹ñ»€ü+\0~ÿk0?¬c\Zh·\Åú‘\ášUŸl\ÐKMv#¬%ƒ\íÚ”~.\Âl\Í\Ò;\Â\ãt\"ý –\äz\"­{›\0„‡0÷þ ÷«<IH\ÂF·\Öe\0\ÚQ˜!\07ŸU\06\Ø\Ô\Ö\Ù„6Cõ®\å’k¾[5eVq\Ï\Ò&ýz+f^»F‹õr\ëdO\Ê=F\Ã\ì¼\åºt„!ñnŠO<l¡0r\ë»&¤\áuG¿¹tF\îð\åÜºÁz®™cGz‘xÜ”PÑ¾P¯í––X=?[ ý\n€^ L\Ø¹yuºF7G­\r“û\rumÖŽ\çMq\ë;\ík\æŸöÙ˜+%y…‚xG\0:\ÊüœÔ¦!\0oZZZø\ï\Z?\è{ñ?\0 òs\ï2ÀÊ“„$lt›\Â>÷\'Ntí™¾^ýf@\Ð\Ð8\Ø}>m©}\Çt\ÚvL˜7\à3Z;\Ú5\èY©w-Ë¼\Ù\Ä\Ým\ê3o)‹97\éÞ †K7B¼\äñ7\ZN\Å\Ôa	€÷uù\ë†tøø\Þß¶\Ð\Òù†\×cxi0µÎ¸·`v\Ã\è9\Û\á\Õ\åvüE[ü#¾ Q_\Ù\Ù\á7ÿør€H<n\n]ˆñø2/\\†];\Ý‡@€\ï{­\áySÜº¡§\ÓcvVBw\ëM‰\Ä]\0\0<\î(ósR…\0þ»€v9,þ\0´2\Â\ÜûƒÜ¯ò$!	\Ý~\à·\0\ÚÕ†)h\ÓYmmµ\Þx\Ôr™õºšCÛ´^*\É&\Óü,’D\ã®\rr<&ß¡]rhø\r­˜\âU$#\á\Ü?°¹\ÙB\ÃL\ê’;üðºcu‰tK.\Ý0zn\Þ£¯›\Z‹ÿ\ÍC-\Ëú{A\ã~S¬/!md\ä›b¢e)±N¯{m\Çë¦¸vƒ\Êð“²sñ\Â\ÖvÂ»\0€\Çe~NŠ®\0\0 z\æ\Þd€•\'	I\Ø\èv#\ì_À*\0ß°É«23vDóA»/{-—Y¯»9”f\Ì\ZY2\î\rjø™|‡v\ÉA\áo4œŠy]{\0pS<`\í;\ÚB\ÕCª7ð=¼\î\ÈcHû	%f\î\Ý0z®u@«n´\ãuSB\ÂX\ê/\Ëùûÿ\Ú\ï§\\o\n».Ÿ¡\r\å«+\×fñ¸)\îÝ 2\êÓ•\ÝA\ÑN\Ð/\0@‡C™Ÿ“\0\08#Ì½?\Èý*O’°\Ñ\íÿ!€0\0X\à»cq†\Í\\ƒ·^¶Z¦?± OÐ™«¡9´\î¯Ø¡˜FkþG\Êr˜\Ö\ë(M5l.Ý°\Ü%gÆ±Ÿt\éœ\Z\Ì\ç.Ý°ö–[7dC,¸)\î°>¸‡\0Œ\Þ2ófí¼‰\ß\áu\Çrsi<g%C\ê\Þ\r£\ç\æ\é\Ìv<nJ(¨_þwû.\0¡œø\Æ\í¦\Ø-´\ëPk.]¹_n\Í:\ã~SÜ»Á†\Ý) ^a„\0By\Ú\0\0be~NŠù@úÂ•\Ã&¦y+u\Þ7¢4\0À7\Â\Üûƒ°ò$!	Ý†ñ\'sNtUþ4@¨\Ð8\Ø}>m\éŽ\é´\í¸hV\æ%4\îE³\r\é\Þ¬%rµ9:ÿ1|s¾nfQyk–z:#+€\Ût\é†Òš\ÏK\æðIy§¸\à>\ïô\Ó\r\ÙÒ°‘²˜¬\×\åHÀ\ër\ìFG¼)\Ö÷“a\áä¬„Œ\é’ö\ÐñºÜ±¸M}¨u¯\è\Ö\r–\î\Z \ÜnJX¿À1¾ .ˆÀt¹)ö×\"‘^ºš†\Ý1_¸\Þn°1\ÔI7\0 c \Ì\ÏI1?e\î¨\É3¼EeDi\0€o„¹÷¹_\åIB6:–qóù]°\n\0\0\0@l£\Å\0\0\àqG™Ÿ“b;\Ð\Ò\Ò2q\ê\Ü3\ç/zkL\âLQ\0\àa\îýAXy’„Žeh\ì>Ÿ¶X\0\0\0 ¦)O\í\Ô\ê\0@Œ¢\Ì\ÏI1˜4mžaõ\Ë*.,Z¾\ËH$Mš%*´=\Êó¼\éP\Û\æ\Þ\ä~•\'	I\Ø\èX\Æ\Í\çc@Ø¨+lM©K^A››[\à~Áw\0\0\è@(ósRÌ‡\0§\Ï7¬~YÅ…\ï7\ï¡¾54>9]Tˆ\äuÙ£“\ã\éz=\\±·a¶œ\Â\é$Yñ®g–[ö(\æU1ˆ\Ï\n\ÐOŸ%ý7\Úa\îýAXy’„Žeh\ì>Ÿ¶X\0\0\0\0\0\0¢e~NŠù@R\ê\Ã\ê—U\\Xºjóê»hk$’&¤\Ì\"…lbi_s\Ê\Îx\Ø]o\'ŽO³®y5YñÔŽÿ\Ö|–§{ \r\æ\Þ\ä~•\'	I\Ø\èX\Æ\Í\çc\0\0\0\0\0\0ˆ~”ù9)\æC\0\Éi†\Õ\Ï/:µb\Ýö£\'\Ï|¿yONA±‘>q\ÊQA…ù]·½Ì\ÆÇ‹DwŸª˜Xù\Ðh’§¸fÒ©ù¡½\"ƒ}4/\Øn|–Y@i\Êzhc;ú¥_þ\Ä\ßù¼.­\É\å¤\"z¥DJaeSgX{¢a\îýAXy’„Žeh\ì>Ÿ¶X\0\0\0\0\0\0¢e~NŠù@\Ê3@\Î?ûð1\Ú\É=Zº\ì»-\Åg*yú¤©.!\0ò¿Â…Vf\Ä\ë\Øp±”kZ\Éÿj\rQ†hQ$™%=²§\\a”¬ K¡½[Fu\ã\ä”d\\…Ñ²±Ïª+D‹bWTa‰‘!g)\Å\Ìv\Zi\ìd\Ìõó\í\Ôf1\Õs\ïr¿Ê“„$lt,\ã\æó±\n\0\0\0\0\0\0D?\Êüœó!€)3\Ê\ëÿOŸ«!\ÏO)KVn2¾0yš\Ëd\îUú\àš°¸S\Ó[«¨&V/\É\ÔaEŒ’Ysux)‘l°¤j\Èu\åbJM\Çb:”ÀºB—\å\\L\ßsÌ¥VYÀV\0Èµ²¤* Š\æ\Þd€•\'	I\Ø\èX†\ÆÁ\îói‹U\0\0\0\0\0\0 úQ\æç¤˜L\ÅB\0Ê¯\0RÊª\r;”\Ä\éóDG¸_5¼«\éN}‡\0ŒC%ð“¥\ìs\ì)Zš\ÑSµ€œ\'gûf¢¾\çXÌ‚\íC{ŸÈ‰„R!€A˜{ûUž$$a£c7Ÿ\ßAW\ä\'h¿7žP\"Žc˜’ôL\ß+Ú’\Ð\Æ0¤Z^\×(\ZdZ/\ÒÚŽpSZ\ÝYÏ‹C\'<FÃ’•·\Ò/\áŒa‰’n\Ä4C\0¢e~NzB\0‹\Èð+PIIœ>_TPÈŠ\ßÉ»Ò®[@.¦•3\n’g\Ö÷+32h\Ç,\é‘Ex\çj°Q*©e<¯\Â)Qªi,\Òô$=Ñ¬¨¥ðn²½‚Ñˆ¹k½œ\ë©ˆ„¹÷`\åIB6ºu\ÈM\ïI>¼\ë°õ\â\Ø`ý0J\çôL\Ï‰¡B\ã`÷ù´¥\Æ\Óiû\Ø\Ã\ì\Ç;Ý³k\ÅaûÀ¦›a\Í5#\ã6C\íFhc\èZË¥>®‘ýU¹ˆùF\Üö·ú\Ì?\Ëw>;\ÊX»\Ä:¡€ R·’ÿ¡A©·a\ßÖ€„6ò™k²:\Î\êœ\Ý,ŽuÊ³ó(\ÝP\\©HH°·R+o‘¸¡µ³,\éR›Y\Ëu\í#\ËûÅ£øVòK°6\åù\ê\rÔ\Ðn%\0 µQ\æç¤˜LK_\Äm¿‡’R]B\0\Ì\Ç\nL-¬K\ë\äbJ9¥M\ÍóŠ|õtú1?·½¢8\Ò\èÖ¥‚Ò‡óJE£?–‹‰ž˜{šU\×iö$©5#[Z\ÜoÖ N\êiF%‚ý€Hç§¶4¢a\îýA\îWy’„Ž<\ë‡u\í\Ú3=¶j€\çpãŸ›\Þ\Ó<7Ÿ\ß¿Ð¾„mK\ØTµý\Üf„qé†kŒ”o\ÔÀM\á›§!\å\Ð7£\á”©[\ÉÚ™•\ÐÝ´vQò\"W©‹—š]\Ò)½Rþ\ÃöZ\\ $S…Ÿ[i÷\íZ1ó^°´Dœ³{S¡Ü…€·’\nt\ÏÞ˜ ~\Û5*‡Qúb\0\0@™Ÿ“b?0{±bø\íJJ[ *Dr\Ç²ñ0\äÀŠ0÷þ ¬<IH\ÂFG\Z²ùšñgv\ß\Z`¦_öüZÀ¾N h\ì>Ÿ¶y@TöL!\0\r„\0Z\æš²7\n\ëU·±û\ê|\Ík9Z;w\Ú1 uX\Ã(y‘+”ró_gùœŸ\Ú\×„ŽŸ[i÷\íšm–\ïUc\è‘EØ›2\å.º•t\È\Ì?/&\Ò\\rt¾\0\0P\æ\ç¤\Ø©s–&§-ð•¥\â?\ç<>A\é\Ú\0\0*\Â\ÜûƒÜ¯ò$!	\ÝZ\ØB\0J@\0„¹À\Í\çc€|É¨ùÑ“˜\æ\ZY~gŽµ¬‰BÆ¹k¤:%6•*ºeY[ \ÆY;\"\×W7ˆ\Ð.9XüŒ†T\Æ\Þ\r\ë\ì\ßŽ\×\å§|Ÿx\ìo\n7Q%´e}¦7H1Q¢#\ïs4”,†Ë­tCwD;4¼¢5Ö‚4VrƒÆ§Çºo‰¢ŒK-_\Ý@\æ\Zaõ\Ù\ÇþkŒÏ°›S\Ó#¾\nÀýVrX™\0!\03\Å#K\ìG<\àz+ùûˆ\ï˜7…õÁû\Õl7\0\0\í2?\'\Å|\0\0\ÐJs\ï2ÀÊ“„$ltkaH\ß\Ðòz¦¯w\0ƒ\Ý\ç\Ó«\0l°\é¦ó\ä>´Y£w-—\\\Ë\\\Öz¨\Ù?³Š{–\ÈÐ³X1óº\Ø5Ê–Òµ“m<Qö\r³ó–\ë\Ò&Á/¸)~\à&Š\Û\'a¥$%pyß£¡©FÀ_\0vôv¨\ç\Ü\á\Ë\ã&.‡\ÃJŠ\Ù%k\æ\ßØ‘úR7¼Ñ¾P¯í––X=?[ ý\n€^ \Ø\åP\Ï=o%+( {•zdö¦\Ø]\Ðc(š”{\í„~¨Yû­”/D¹\Å—J7\0\0\í2?\'!\0\0pF˜{ûUž$$a£[—€fûEz\Ø\ßpóùX Àfù|–iG›5=Sô®e™Ëš(\ÖH:\Ôg\Ã:Ró$nÒ½A\r—n„x\É!\ão4œŠ©\Ã\0\ï\ëò\×\r\éð1½)t\"\í½@oŠY	Ýµ3\Ú\Ç9pŠ¿2°7\è5†\î\íPu\Íø¹\×2»axW¶Ã«\Ë\í„\Ð\rOÄ·\04\ê+;;ü\æ_v ÀÏ­4®\ÝÀV‹\r‚Gao\Ê ”Aó¼•ú¥1\ä^y_r(\Ý\0\0´?\Êüœó!€ô…+‡MLóV\ê¼oDi\0€o„¹÷`\åIB6ºµ°…\0\ì+ÿ•¯ƒ\Ý\ç\Ó«\0œ<‰„6\Å$F²˜o<j¹\ÌD•nX-Še\æ-•d\\~I¢q\×9\â\Ð.94ü†VL1\Ò\ä\Þ\'¸)¡ps\ÅN\Ç{bg[Š\Çhx\r”ó)¤\Ñ\ãr©º:‹e<™Ÿ·4hö\Ð-Z7¼pXüo\ÊhY\Ö\ß?·Ò¸v\Ûý2S<²\Ä~k„\0n¥õ%¤\ÝV~\è}É¡t\0\Ðþ(ósRÌ‡\0\ÆO™;jòoQQ\Z\0\àa\îýA\îWy’„n-l!\0±ÀtüaG\0°\nÀ/lBi|¦\ä6\ß\r\Ú}\Ùk¹\ÌDk$ªw,÷5üLˆC»\ä ð7\ZNÅ¼®=\0¸)nP\Ô÷³X\ÖË±_`£¡^2#pƒþk\Ñ~B‰9žšQ”.\Í\ìO¯@ð\ÝðÀX\ê/\Ëùûÿ\Ú\ã§ü\ÜJ\ã\Ú\r\ÌA˜_…ð\È\"\ìMøyU«x\ÜJ–\å—ñ¾\äPº\0h”ù9)¶C\0---§\ÎU~ÿß®1‰3E\0€o„¹÷`\åIB6ºµ°‡\0ø:\0\Ýô‡ý-\0‚\ÆÁ\îói‹U\0*\Ú\ÔÖ‡§b³\Éà­—­–m&Í‘\ç\ÓÌŸÐ¼VwJ\ìPLm5\'#eYf\áV¯¥Z/—nX	\î’3\ã\Ø´vN\r\æ“K—nX{\Ë&ý¶n„c\ÏpSœa=w2Q\Ö\Ó9Œ¼\Çhxd\é84\è1†\îXÚ¡f%h§6\Î\ËÜ ~\È\Æ\Ü-Z7\ÜQ¿ü\ïö]\0B8/ð…¯[i\\»õ¨]¾~\è‘EØ›27`½•ö\ÖôŽ¸\ä0B\0¡<\Ù\0\0B™Ÿ“b>0i\Ú<\Ã\ê—U\\X´|—‘H\Z›4KTˆ]:\ì_+\í‡0÷þ ÷«<IH\ÂFG\Z²ö\äÀe”µÿ\"µK—0ý?\á\æó©q\Çô6‰d®@“1K\æ\Ó\\{º7k\É¤\\6\ë\éü\ÇðM§dfQyk–z:#+€\Ût\é†Òš\ÏK\æð‰r§¸\à>¹ô\Ó\r\Óið‘²˜¬\×\åHÀ\ër\ìFG»)\ìD\î&\Ês\ä=F\Ã5\ËûV*W-g¹ÀN$½Tøyu\×\'¿\Ç2JŒn\ÞUw’J;Áw\Ã\ë·\08\Æw\ÔaþÀ`o¥xQYŸ„\Ï\ì‘E¨¹l\Å\ÙyÀE’8—®·\Òþ–1\â;Þ—R7t\0 ýP\æç¤˜$NŸoXý²Š\ßo\ÞC;|kh|rº¨QÈ•k“†«=W¬»üã³‚0öA…\0\ä\Âr/=þô_P\í\ØOdœ ´A4!Ì½?\È\0+O’°Ñ±ƒ\Ý\çÓ¶V\0\0\0\0~\Ñb\0\0\Ð(ósRÌ‡\0’RV¿¬\â\Â\ÒU›Wo\ÜE[#‘4!e¶¨9˜\á5-neF¼‹\ÝUM²a‘³\â)Ý¿O\ÊQ+\'u\ÜWª}µñnæ „\Ö ˆ&„¹÷¹_\åIB6:–qóùX\0\0\0\0ø¤<µs§ —7\0\"ƒ2?\'\Å| 9-Ã°úùE§V¬\Û~ô\ä™\ï7\ï\É)(6\Ò\'N™#*¨OeŸ3¸7g\Æ5>^$zXØ¬x·\\£I–om_u\Ån¹R9©ˆyB#‘§°\âzŸ\ÙUHu”“R¯õ\ì_†¾/\Ó1—,ˆ\ÒÖ–•C­…,£i½AK#,\Ñ\ìª\È2®B;rW\Ðös\ï2ÀÊ“„$lt,C\ã`÷ù´\Å*€°\á«R¤.CmnJG\0w´1ø\0\0\íŒ2?\'\Å| e† \çŸ}ø\í\ä-]öÝ–\â3•<}\ÒT—€°Ä„þ1>3¢º¥\\7;ªû[”!Zm[J\ê6W±\æšû\Æ+otPÊµBtT¿³0\Ï5\ÐS7J\ÊUTô0jQic¸\ä±}v>\Ñ+KƒZ#,BÀS\éP\î+mE\Ó\æI@{#Ì½?\Èý*O’°Ñ±Œ›\Ï\Ç*\0\0\0\0\0\0ý(ósRÌ‡\0¦\Ì\\(¯ÿ?}®†<?¥,Y¹\ÉøFÀ\äi.\ÙU\ë\Ç\Î\ã\ê\îF\Íb¼	\ÛG\Ù\Z,\ÍÒ @”¢¶\å\\s_\ßsÌ¥­qKóY‘¡ùpv v\ìU-0Ÿ\Î\Ñò¨Œ¾+p<o[>h!\0Q\Þ\È\ÖvXhÀD\í0÷þ ¬<IH\ÂF\Ç24vŸO[¬\0\0\0\0\0\0Ñ2?\'\Å|`\ê,P~RVm\Øi¤$NŸ\'*8B&\Ôð†3eyuû@ZXh\Õ\Ï\Z\É{Š@k\\\Î5÷õ=\Ç\\9‘ã³¢õ@\Û3¹µ˜¥ˆË·\æ±t§\á2÷µšÚ¡¶k6\â0\ÚQƒ0÷þ ÷«<IH\ÂF\Ç2n>«\0\0\0\0\0\0@ô£\Ì\ÏIA`~\åo*)‰\Ó\ç‹\n\nYñ\Â\â[\r)÷¢´\ë\Zà¹†k5k±¼63hGj2]‘.\ç²µªl‡§Js\×\ãúžÒ¬¼o\\\ÛwùJ\ÇHa%µ=\Ï\á²\ì³>ja¥·@¥\í¢@ Ì½?\È\0+O’°Ñ±ƒ\Ý\ç\Ó«\0\0\0\0\0\0@ô£\Ì\ÏI1˜–¾ˆ\Û~%¥º„\0˜/˜\æV$^\î\\VmS?f\Üs¬iEE6ûÁ<½=£ûµ}ý\Ê)\èPd{R³Ra\ë%±\í´\Z–b¢œ\Ú©Œ^\Ñz\"©yVW;´4\â\Zpl´3\Â\ÜûƒÜ¯ò$!	Ë¸ù|¬\0\0\0\0\0\0Ñ2?\'\Å~`öb\ÅðÛ•”¶@Tˆ\Õ\Ç>\Îtœ+¡\"Ì½?\È\0+O’°Ñ±ƒ\Ý\çÓ¶ƒ®\ÈO\Ð~9<¡D\Ç0%\é?\Z™¾W´%¡aHµ¼®Q4È´:_¤µ;\á¦´º³6ž‡7\áT‰’nD?(\0;”ù9)¶C\0Dêœ¥\Éi¼EeD\é€8c\ãƒxƒ\ÇÁ:\ÓU!\0¼\æ\Þ\ä~•\'	I\Ø\è\Ö!7½\'ùð®\ÃÖ‹c	¬`qóùy\0ói\ïtÏ®‡\í›¤†5CŒ\Ûµ¡¡k-—nø¸Fö÷\á\"ÀM±`ù\Û{\ê ³N¶c€÷M\Z¥°\ï]@B\Þ\Ì5YFgu\În\Ç:\å\Ùy”n(®T¤$\Øû¥•·ˆ\ß5-]1–\Èÿ°¢v\íµBùÀµx?­¯(­–ù‡\Ïg\'H¸öP\à>P\0€\ØC™Ÿ“b>\0\0h%„¹÷`\åIB6:ò¬Öµk\Ïôt\Ú\Ú|¾GV(\Ð8\Ø}>m;\è*€\è!l\Ç\Â&¸\í\ç6#ŒK7|\\#3	D\Ö\ÙS‘ûŠ‚×‰	»\ï³º›=Œ’W²J]\Ü\è¼\Ô\ì’N\é•ò_”\×\â%™\â(¼_µ³?Ìª(Yz7¹Žgh#°èž½1A2ü¼Ï’W}\0ð˜ \Ì\ÏI\0\0œ\æ\Þ\ä~•\'	I\Ø\èHC._s÷\Ì\í+>\ß#+4\Ü|~G^„=E@C2-áƒ›\"\Ð>n\rÿBZ~\ßi«T”¼’J¹ù¯‹³|\Î\Ï\í\ë\ÂÀ\Çý²‡\0¸-7£\Ö1t\Ï\ÐF>P-:d\æŸiZŸ²7ŠÀA\Ý\Æ\îZ\0\ÐQ\æ\ç$\ç@MMÍ¹a\Ú\ì%\Ã&¦y+e\Ö\"Q\Z\0\àƒ.\Ðs@˜{Vž$$a£[Ÿ±\0ƒ\Ý\ç\Ó«\0œ\àM…\ä\É1\Í>tÿóN\ÇZ\ÖD!\ã\\Š‡T-%›õJÝ²¬-P\ã¬‘\ë«Dh—,~FC*c\ï†\Õ3øÀñºütƒ\ïýMÑº­\ØE	\é¢,#¯}HkIQ\Ú	r4<÷j‰3²Æ¥Šò¹Œ–uK)E—Zò}•\Ì5\Âê³ý\×o7§¦Gt\0\ë¶ûý\â8„\0´W²ô©;;4®ZO“@#\ïL€Z”\Î_\ç–>h÷«„¶,…¯k@\0€Š2?\'9‡\0\ÈÜ‰\ÆO™;jòoQQ\Z\0\àz\Ðs@˜{ûUž$$a£[‹¶¸ù|¬°Á&©\Îóþ\Ð\æšÞµ\\r-3`\ë¡fÿ\Ì*\îY–Y1óº\Ø5Ê–Òµ“m<½ö\r³óŽu\nk\á\Ü(\å‚\ÃÈ³\ë2-¥\å’C\rgô³“?\äg”G˜F+)\Zg–Rë¡±#]…GCEû@½¶[Zbõül!€ö+\0z0ðu¿\Ø%\Û\ÂlÐŒD\ë\reY\Ú}Ñ¥gyŽ¼+Þµ(\×\ÉØ³>\Ó>\Ý# ”t\ì!\0\à1D™Ÿ“b;pûö\í‰S\ç*¿ÿo×˜Ä™¢\0À\Ð8\Ø}>m±\n@M£ù\ÜÔŽ6\×z~\é]\Ë26‘=$!Z\'\è–,fW\Ü<¤{ƒ\Z.\Ýñ’C\Æ\ßh8S‡%\0\Þ\×\å¯\Ò\á\ãySdK©\ís‹\åc\äYu‡fñœaŒ†3\ÆÙ©e\í,nƒ&7ht‰\íð\êr;þ1þ\ßÐ¨¯\ì\ìð›|9@¸\0_÷\Ër;\Øå‹«V®\×õòƒy	\ÏZ´o<{\Í[c¦\ÓE\ÍJ\èn½_>\Ï\0xLP\æç¤˜Lš6Ï°úe-\ßÀe$’\Æ&\Íb—\Ósþø\Ç9§\ÅA”Á¾Eóev$0póùX ÀxhS>·¶øo<j¹\Ì_]\í<3ÖJ²i1?‹$Ñ¸kƒith—\ZþFC+¦\Ø\Éø7% öqv\è’\ãÈ›FšyQ3¦\Æh8#úF\å-=dÝ°œ‹7\ÈFO».ó\Æ\íxõ04ÿ›‡2Z–õ÷ƒ\Ã\Ïý2®\Ý\nm\í6ù~z¼^µ¬§\Ö\î?¤2ü%\Ä:\Ï[\Û	|^\0Àc‚2?\'\Å| qú|\Ã\ê—U\\ø~ó\Ú\á[C\ã“\ÓE…ˆBvUü•ÀN\\}«\âiwˆA;‚p¼Ayc¹°\ÜKíœ®´qßŒŽ\Éuƒj\n´\Z\Ð8\Ø}>m±\n@Á˜\n@3A»/{-—ù«2—¥¹¯†G–Œ{ƒ\Z~¦Ñ¡]rPø\r§b^\×\0\ÜWX\çŒ\ËŠ’Jn£\áŒ\Ü \í\'”˜=\Ô<¤ô^6dƒ\æp\ëaHKýe9ÿ_û\áü4\0\ë|€ûe\\»+I\é¶\Ëw¸\ã¹$\í\Ë#\ïG-–\å|¡2\ê3™\Ý\\ÑŽ¯ó\0”ù9)\æC\0I©«_Vqa\éªÍ«7î¢­‘Hš2[Tˆ\ÌÀšfõôœA.\ÆUö´¬Ž\áÁw¢tÿŽ7(o¬œ\Ôq_²Ú·oœ š­B\0n>«\0Tüz*ós\Î`°\Õ2MˆyM/³.4\Ö\í;b\Í\äHYr-…\0þÊ¥V‚»\ä\Ì8\Z\íœ\ZÌ‡š.Ý°ö–Y[7dk,¸)®h—ú\à`·\ÜF^KOW\Í[\è£\áŒ\å\ì\Ôø¬£}\íF-°ž\ë‡l`\ÝB\0^=õ\Ëÿn\ß ´`ó¿¾_Æµ«°FO\Ç\Õ`{Œ¼îµœ»\Ê\n³‹r\nˆ—½k\Ê3\n\0Ð®(ósRÌ‡\0’\Ó2«Ÿ_tjÅº\íGOžù~óžœ‚b#}\â”9¢‚\n9Nö cpÿ\Ë,\è AO+\ì\ä–k4\Éò­\í«þ\Ö-W*\'1Oh$òV\\\ï3»\n©ŽrR\êµ^€ý\Ë\Ð÷\åb·F¤rR‘pû\æ\Øh?¢<›Þ“¸L×žé¹²Bƒ\ÆÁ\îóiK-;¦Ó¶\ã¢M=™a\Ðdø+>½¶§{°–\\@\Êese‘\Îß´Cf•·f©§3²ú+\Çn(­ù¼dŸ^wŠ\îCM?\Ý0¿)‹\Éz]Ž¼.\ÇntÐ›b};v+\à\Èó~z­\\+\àh8a±”ú]\Ð\r¡\Üó„Œ:/oÐ°Áº\ÉT\Úq\ëaX¿À1¾ .ˆ\Ìô}¿”[#\n(\ËC\'µ<G\Þ\×ZN·[q\Ø\í0»\'õ\Ðˆ\0k(ósRÌ‡\0Rf˜!\0rþÙ‡\ÑN\î\Ñ\Òe\ßm)>S\É\Ó\'Mu	KL\è\ã3/ª{Pw›ozW\Ê-šv\Û,©;]QÄšk\î{¬¼\ÑA)\×v\n\ÑQýz\Ì\Â<\×@O5.\ÜÒ¬VD´mk\Ä,\Æ÷XyQÖ’+\Òüö\í³B¶¦@{#«\0\Ú7Ÿ\ß«\0\0\0\0tD´\0B\0\0\Ä\Êüœó!€)3\Ê\ëÿOŸ«!\ÏO)KVn2¾0yš\Ëd\Þ\Óú±³Å‚\ZFÙ†YŒ7!}\è­qXš¥A(EmË¹æ¾¾\ç˜K;Z\ã–\æ³\"\ãÿ\ÏÞ™€WQ}œ\ÚÚ¯_YDp_q\×jiµ@k‹K«‚»-j«ik[\í’*_¬U\ë†\âJ5n­Š\â‚UÁ–BBHHÂ’@¶„hE‰|\ï™óÞ™3g–;sso2Cþ¿\ç}†3g›sÎ½9œÿ;g\æR\ä	l‰#\ê\íÊ¶9cdtp˜\Ð88u>±\0\0\0@¤f\â0Z\ã…Ü¨\0\èN´õ9Y\ì]\0M.\0\í-€ó\Ê\ë\ï™1\ãy’¸B²“«&A½]\0––60K9¬§¦5*WS­p\"äšªFJ´Ÿ¡w\Õ4…®m›3F†A÷€‰—\Î\Ç.€N#÷²º™¾ytøPvðQ‚L€g\0\0ˆ%\Úúœl7p<K‚_û-@-fü#Oqwÿ \ï?W$(==\02\ÕE¸’xNZù\ÄP*¤D3\Èñjª¨\Ñ(*2Vq4XAŸK$BZµj\Ø\ì’+\Ûþ»³m®U\î.\0\Z§Î§#v\0\0\0\0\0€è£­\Ï\Éb\ïx8÷Y)û}\ìþ‰.\0!hS¸Z[Ù“iQ÷¼z‰sq\"rYBMM$‹÷\ç)’Xr6‘¸†v	:\å$3¤T«d¶wI$—•tyÛ¨ñ¯¸škU û€À\ÄK\çc\0\0\0\0\0\0ˆ>\Úúœ,þ.€ÇŸ\Ó¿\Ó\îŸô4HŠ%YwwzNOAx\à0¡qp\ê|:b\0\0\0\0\0\0ˆ>\Úúœ,\Þ.\0b\â/<0\éi£<œ;).\ÂX½=.\Ù¤3õ\n\0\à\\\0&^:»\0\0\0\0\0\0@ô\Ñ\Ö\çd±w\ì\ç\0\0.\0\Z§Î§#v\0\0\0\0\0€è£­\Ï\É\Ü]\0´ð%\r\0\0\è™H\é\Ë\â>¤~µ™„\Ì\Ññ\ÆK\ç÷\Ð]\0‹\Ç/W\Å\ç1¦*÷\è\Ûr?\à“®$µ1L©”_¹Ba¯.\æ¸n\'³JŽ|ZH\Ãht_\ãmD¤©\ë\Æ\0€¶>\'swÄˆ\Üg¦\æ\Ü3\É\ß&>ùO\Î\r\0‹û`\0\Öf2–Ñ™¡(w,\éð93ø<ÁŒœ/’FŒ\Í-\âÈ”¡qp\ê|:Rý®ñt\Ü\í\Ê\ä\Ê\Ñ\ëù´{\ëòN-\ÊÓ£6SmFjc\èYÊ£ú(~:®§¸\0\Ò<òö\ß\ÞK\ïH¦k4R\ëò¬iù½n\ÏV\Ð\Î\ç	j\nŠ)Þ´¬jŽOJ\è1d\ím\Ù\ä™õF‚Ì¯|\á\Í\ïÿú¼É¶\"ö\ËyV(\Û\æo’\Ú\0@D\Ð\Ö\çd±w\Üõ\à”¿\Ý÷¨¿Q\Î\r\0‹û`ú\Õf2–\Ñ\é‡d>\éû\\:j.€¢Ü±fŒw\Ú\à¥ó‡\ã]\0\ÝKª\Ú\Û$=úª\Ó\ÍH\Í\Ð\Ç\çH\'†¤T\äb}Á¸t~ºu4š³n/žXP\Õ+·Aýx\Ã/P5‹\ÏÒ\Ïzþq‰/\í\äq£­RfN\Ã 9\\²9°\rµQ‰\Ó\0\0\0ñE[Ÿ“\Å\Ûð\Å_\Üó\Ð\íýÿN»cüc\\\0\0÷Á ¬\Í$d,£\ÓÍŒ)ó…#À¹À\Âðø¤\ÆÁ©ó\éØ“wD\ï\Õ|@\à0€ eH¬f¶µ\Ý9\Z\ÕRü7g\Ù\îó‹Sç¾€N\à;†ž\\òKK\ÇDª™SsP‹gŽ¶*ñþkµu\Æ?Y\0\0\èb´õ9Y\ì]\0÷>ü¤)õ—×®}ö¥×¥™‘dw\Þ?™\0\ZòF\Ê¢€¼ +\\\0^:»\0\Ü0–\În›i…¸™\ä¾\nw\âZ\Ê\Éf^KSMºˆ\Z@)\è•d¯*õpj f©u9,AFC\É\ãlFh€óŠ\ÚMW¶\0cÈ„ÿPDü¸¼f£ñ2Õ¡ú¥26òF\Û|w†Gc4Rc\Ö4–ú\â¶ÿ´f¹kWû\ÄÜ´\îðC‘\êúññ—–Æ{j\æt¸\0l1žò_\nŸˆliC\0\0ˆ\Úúœ,ö.€ñ<eJý\åµk_{s\äÑ´»\È\åé‚¤²ü}À´fUxËš³ó\åYŠš<?[¶N@U¯$\Ô\åRkˆ,\îƒAX›I\ÈXFgŠ$.€´<@\ã\à\Ôùt\Ä.\0†Q•‰‰÷\Ê\ÛÿR©¶¥¼ý\ÔP†V\ï$\Û=@‘\Í\ê—è£ªó=™Z—S\Æg4¬Æ»\Þ\Ûd5\Û@‰‹ZeS\Ã\Ô>yiS=:ZeU˜9´–kDe4R\Äx\n \ÅVW\Ù5¿\Ø`¼ ‘¡$i*÷Ë²Ä—-ñ¥%y/|Ê‡\ît¨#\ìYa\âCa\ë\ä\è\0@\ä\Ð\Ö\çd±w\Ü?ñiS\ê/¯]û\Â+o¾:ó}:š‘dwOxœ¤‘4\n`µ*5\Êt-¤p*b¹ò³©xðJB].…¶XÁ\â>¤~µ™„Œet¦ðu\Ì\È!•\Þù÷z\é|\ì\Ð«y¹wb¬¼\í\ëò\0ø—2ývT\ÕD(§º\ÖU’„ òö\Þ\Zx4#\Å.§L°\ÑpË¦‹?ö\n\ÕqKmSüPŒ°r÷X¿Ä©HêŠ‘W\å«V\ÕcdF#5ø)\0ƒ–†a.\ïü“\Û:\ëðC{m˜E\Ãbô\ÔÌ™\Ü\àZ¡2\Ô\Þy\0\0 ¾h\ës²Ø»\0˜”gJý\Å\å+^žþŸ%\ËV½ö\æœÂ’J3þžŸ\à:B.3R5Y›\ä¿)€\Õ\",½Õªqz)¡ø™\Äû|S\Å§\Ü\n{\rùÙŽ,2¤˜Å´J>%‹\Õi3RÆˆ\ìj7•2²`·ƒ\Å}0H\0k3	\Ë\èL\á\í0ôgŸ0 qp\ê|:b€†&ltŒ¥¹\\\âÛ”Œ?>¥<V\êžúÊ¡\r”œB$È«(Æ•{V(ñ©u95‚†‘M‡º\ìôG\ÕlFmfÙ”\Æ0\Õ\ÅoØ‰®y\ç`Z­Š\Òh„\Çeó¿uªb$\Ù\ß¿1ô\é—ò¥¥<4DfN\Ç\Úb<+´}(\Îø,\0\0t-\Úúœ,ö.€	Z.\0Rþ\Ë(P´¤úÿz«rUƒŒ¿÷!€)£I\Ðf\'„®)‚)\Õ\Ô\ÃN„$ÖŠ$ªsV+2q\'ª2«²\Â\"™³q…l5$RÄ¿£\äUŒ[þFŒ]™[•hÊ\È\Ïym©¶\Ë¹dZ¢{Vf°{\Â\â>¤~µ™„Œet¦ðp\0¤Eÿ^:»\04\Ä\Z\Úk€Š±\"½\Âv–òXÍ«KyBQ>ú\Ê&¼+4ð©u9ÁF\Ã-›_ß(·j…)S\Ã?”@\ÃNdv\äE=¾“‘ ˜[ýUsþ\ßøÀÎ¼\ZÀg}ú¥Ž…\ÇU™9UÁo\àpZ¹”\íCIóx\0@÷£­\Ï\Éb\ïxð±g\Ôýÿ+\ëšHóS\ÌóS\ß0Ÿ¸\ïa²V¹\ïM\Ød­%\å]0sZE!\×j\rU.)V)µ%L§€y\êYC~vv>©¡òh\Â%d‚¬D\Ær8rM¥€q!‰ˆó/vGX\Üƒ°6“±Œ\În.€´\ê‚\ÆÁ©ó\éˆ]\0:A\å–cKs ¥k}‰º\â\ËzRª‰•½8e\'…¨MM²\é;6m\à8õj†p]ž•%f\Ýa\Ã\Ü[õh†½µ¹%ðÕ–:¢#^™SCÿ¡i™y£…Ê€(­Š\ähCø\ß\ëY\0\Âp¸oŠ\Ïz÷\Ëö¥¥\Z&KŽýÁ¯r;ö%ó°\0\0Ðµh\ës²Ø»\0š,\\\0\Ú[\0)\æ•\×\ß3c\Æ?ò$pE\Ê]SúZ²6U€Ä³Z5\Æ=,\Êg\ç%N5\È\æ\É;ÿ”*²:[k\äñ¬\ß¹¦ª‘ÿ‚`w„\Å}0Hýj3	\Ë\ètC2Ÿ¸J\â­\ÂÀQ	:\éð\ÒùT³k|\ÆX\Ýb˜¹†–qg¼?IK©”T!8^¾\ßZ\Ù[I”ßž¤_\ÎLòl\×fhµ\ì²D*Š^Y\á\î­i†¥…dG”$aö~¹#D”g©”\Æ0•\ÅG\ËiE2>òö\ï¼Úª(ŒF\nØŸ˜\Ï\è\Òó^c\èø²%>M› 1hF)\ïC\àY¡þ¡Èœ\êß‹ð\0\0\"¶>\'\Û\r\\\0Ï’\à\×~P‹ÿ\ÈS\\@C\ÜA7nÒ—‚>\0·\"‰³Z!\Å•5\ä\åQÀJò‹B	\'‚³%^h$Ye2?` k\Ó\ê—ùDÀ,›H¶‚Ž\ËY•$Bjµ`w„\Å}0H\0k3	\Ë\è8C\ã\à\ÔùtŽ]\0 Ç¡I/ý¦+\0=\Ã\0\0\0 \Âh\ës²Ø»\0\Î}V\Ê~»¢‡@\È`Æ”»\Öx}kf£<–N„œ\ÕZ¤UJI£[¼!\Ä\ÍSgµ®\â\Ý(”@\Æ)õ›\É\â\Ý~Ž¦K\Ð.g5\ÌÙª»,\îƒA\êW›I\ÈXF\Ç/]\0 \Ç\áü\Æ}\éÎ½|€˜S3q­ƒB\î\Ú\0€.E[Ÿ“\Å\ßðøsš\àw\Úý“ž\æI±„.\0=÷Á ¬\Í$d,£\ãƒS\ç\Ó»\0:µ\çY· ¯!Ù‡¢o¥N\Ûþs\0bž\0\0\Äm}No\01ñ‰˜ô´¿QÎ€zS]\'\è°¸©_m&!cg¼t>v\0\0\0\0\0€è£­\Ï\Éb\ï\0\0d÷Á ¬\Í$d,£\ãƒS\ç\Ó»\0\0\0\0\0\0@ô\Ñ\Ö\çdp\0\0\ÜaqR¿\ÚLB\Æ2:\Îx\é|\ì\0\0\0\0\0\0\ÑG[Ÿ“\Å\Þû\ÌÔœ{&ù\Û\Ä\'ÿÉ¹\0aqÀ\ÚLB\Æ2:\Î\Ð88u>±\0\0\0\0\0\0Dm}N{À]Nù\Û}ú\å\á\Ü\0€À°¸©_m&!cg¼t>v\0\0\0\0\0€è£­\Ï\É\â\íø\â‹/\îyhŠöþ§\Ý1þ1.\0\0‹û`\0\Öf2–\Ñq†\ÆÁ©ó\é\ØCwð\áw‡÷ÀW\å}[\î|Ò•¤6†)•ò\ë£ònÿ\èü°OøP¢†ó\Ä7aò\ÌzŽMcL\ÒPO oowünñˆ%y\0B¢­\Ï\Éb\ï¸÷\á\'M©¿¼v\í³/½.ÍŒ$»óþ\É\\\0\0÷Á õ«\Í$d,£3CQ\îX\Ò\á#rfð¹Œ4±\'¦‚—Î§\Ê]\ã{†f\è\î_ƒKÀN­ÿÒ£6SmFjc\èYÊ£ú(~0m.\0|(’õy“¢Ú°0uvzC\Ñ<st¨\ËU\Ìùa‰ö‡t¤ú\íM\íóš5-¿\×\íù\Ã\n\Úù<AMA1Å›–U\ÍñII\í G\Ò6Pz)i‰²\ÆÀªtÕ‚\êx¦T¡\Ï@OR*Ô’¬ùt\ÙH²MM¢Á¶‘ty\0€\Úúœ,ö.€ñ<eJý\åµk_{s\äÑ´»\È\å\é¢!oT\ZPý%BYsv¾<sû‘\ÂdhER¨\0÷Á ¬\Í$d,£\ÓÏŒœ#\Æ\æ\æ\ÒQsØ¹Šø,5hœ:ŸŽ\Ãñ.€\î\ÅC6G,»Om¦f\è#\\\0@S/¢=¡[\×5>\ì€\Ûó‹/O\Ð~ùú·7š³n/žXP\Õ+·Aý-\Ã/P5‹\Ï:Mò/\0\r\Ýè‚™\ãn—\×\Ì1\n¢¸CÙ¦ôÅ°»x\Ä\çe\riJ&ÿ¸5\ÞV\Êœä¥´1$Dƒ!øHm}N{ÀýŸ6¥þòÚµ/¼ò\æ«3ß§£Iv÷„Ç¹@\ZI£´V«\áQ£L\×B\nWÑŠ¤± ‡Á\â>¤~µ™„Œetº!io!ñý\\\0F†Nnð\Òù=y@$Hiýª’\Ñ\éf¤f\è#\\\0À¡^B\Ül\ï\Ò\Æ\×Œ7\à\Ú”\Ñ\Ï+=•kTKñßœe»\Ï/NûR\'\é€º,Ä¿\Ç_ŸS)|1œ*Z­9¥oZò/€[\ã\í\ÙÜ¾u\ÎR\ÎÆ‹\Ã\0@Šh\ës²Ø»\0˜”gJý\Å\å+^žþŸ%\ËV½ö\æœÂ’J3þžŸ\à:¤\å\ÝüÄw!˜³³ƒ\Ü\â7¥µZ„\ï\Þ;ªU\ãôRBñ3”Ù¨6ŸòZ\íI´\Â^C~¶#‹©E[²,¯tVžr)\Ù³Å §\Ã\â>$€µ™„Œet¦H\â(\Ê\Û\éM\0\âOÇ©ó\éˆ]\0nk»\Ä~Nõ>±6“‚®;]K\Ù#\Ù\Ìk%Y¡ŠE¤R\Ð+\É^U.\ê\á\Ô@\Í R\ërX‚Œ†’\ÇÙŒ\Ð.\0\×~i†»ý‡\â!½”µ_‰ûÀI\ï5\ZþØª5\ï9kcÎ–|@lŸw§ôo%%¯š!\È\×\Æ\Ê\ãz\Ã<$³¦±\Ô·ý§™õµO\Ì\Í\ä.\0\Â#¿À2\àòQŠ\Ì\ép¸Q\îÛ§P¡ÿ@\â\Öx[)\ã{’¼”³rQ.\0\0RD[Ÿ“\Å\Þ0\áQ\Ë@Ê¿`aŠ–Tÿ\ã_oU®jñ÷>\ä\á0e4©\álC\'UœÐ”ªji\rSZ[E\Õ9«™8Š\Õ™UYa‘\Ì\Ù8‰B¶\Z)\â\ßQò*ù\Ù\\Ô¬0OõV\Ù+\ÌS\Ú€‹û`ú\Õf2–Ñ™\Â\Ý`¾ óO^:Ÿ\êw\ïÁ\ë{We’\ÒZ3I)TmI­ž\ZZ\Â*\âd»I%²YýR\Ð¯F¦\Ö\å”ñ\r«ñ®·|Cº\0ð¡ÁE\Z)¤Tk45ô\rŒ²—²	\é õ˜ð\È\'\Ì6\ìŒ\Û7JtŠò³~\Ó>t¿¯58ŽO9Œ§\0ZŒ`u•]ó‹\0\Æ[\0:ƒÿ@„RÖµ\ïN=LðZ–ô\ÏVŒ³\î7Ÿ87\Ãc\ØýIþpk¼½”\ÛE¥Œ1TJIs\0 \Úúœ,ö.€{F\Ýÿ¿²®‰4?\Å<?õ\ró‰€ûöøQ@RÁò8Ÿ+‚Y`‰fÌœV‘DÈµZq·)V)µ%L§€y\êYC~vv>¥S@4\×,\"1O)À%ñ².±@-@üw\Û\0:\ë qp\ê|:\Ç.\0;n\Ë\Í\Æ\â5„Î”ø—òX¿Šµ¦\"i”S]™(IÊ²X¢T\î]¡\×2:µ.§L°\Ñp\Ë\æ&\Ø|ð\ïW°f(§»é‡’D\Ú\Öx¿\Ñð\Ä\Ù]h¥\ä°ò‹N9Š»}£Dk•\ëj\Íð\èK’O9ø)\0ƒ–†a.\ïü“\Û:\íðÿPÍ©\Ò%§óc2ò‰\Û	\à­®“\Ü\Zo•òê…³”sdD\Ù@\08\Ñ\Ö\çd±w<4ù\ç[\0)\æ•\×\ß3c\Æ?ò$pE\Õ\Æ6ýœª@\âY­\Z\ã\å\Å\Íy¯\Zdó\Ì;ÿ\"«\ÑZ-§óT¶\Ê?\0» \Ïx\é|\ì\ÐH²@7\Ösr­\é*„\Üñ)å±”ô”\rŽ¥’\ÓX\È\êÆ•{V(ñY—§\Ö\å\Ô6\Znkh7Á\æ>”¤8úe1„·Õ© ÷\rO\ÄEý?\îNº\0\\[\ëöòùDˆ°_›Tq\ÙüoªIö÷†\Ã÷`\ïˆ\ÛG\àòÁ%C7ô\Ý\å\Ó	_!‘ü\à\Öxµ…]þôœ¥œc(®\å\0@0´õ9\Ùn\àx–¿ö[€Z\ÌøGž\â\Z\âº0°¢„…Xöö\0¸I„œ\Õ\n¹nm\ÃÏ£€•\ä…\ÌûöŽ\ZD”xu ‘ldu\\• ³{º½B\Ó\×\0@÷Á ¬\Í$d,£3Er€\È\á›!)4NOG\ì\Ð‹<¯]\0*\Æ\Â.´úr–\n-teâ“¤\â]¡Aetj]E°\Ñp\Ë\æ\×÷$\àCñÂ¨\\m¼\"\ÆÉ§ü¥k|J“£FŒ*¢z”À\Üê¯šûóÿ\Æv\â\Õ\0~_\01>I¼9ú\Çd\ä[­\áüˆJ5§Pa/€[\ãm¥\\¯\ë,\å\ßx\0@H´õ9Y\ì]\0\ç>+e¿\Ý?\Ñ\Ã@bXˆl%9\Â\Ô\Þn˜\Ù(¥¸!gµ„i•R\Ò(Áo\Ètó\ÔY­¥\ïÕ -§\Õgq5.\0\à€\Å}0Hýj3	\Ë\èL‘\Ì \Ò;û:\0/]\0:ÆŠ-€¦ª#¼ôr”r.\r\Ô_b\ÝI\Ë\ë\Ä\ÒSœ²ô2”’\äv»ŒÑ–¼ú\nØ£v\ÂuyV–˜“‡MsÒ£ö\Ö\n\í\áhFJÚ’Á‡â½FG\ÌS£›fk…ª	\ÔxŸ\ÑðÁm³”ý\ÒgL\ìCø\å¯6}{ŸrXô‡ÿ½ž gû`ø|\Ü5³½û\"&.\0ý`ÿ¼R®\Ðÿ\à\Öx{)·?=g)ç°ˆu¤2‹°[£­\Ï\É\â\ïxü9Mð;\íþIOs¤\Ø8\0=÷Á ¬\Í$d,£Óù\Â?S\é“\ê\ç(ñ:À\Îm\00 qp\ê|:Rý®ñt\ì¹‹6!i3yr\ìŒ÷\'i)5ƒ’*V¥/_\'n_°šù\íIú\åÌ¤¤:ÄµZm»,‘‹\×^Y\á\îAi†ºž6´\Ý\ìýr%i¿\\›\Ñ\ã>û‚«\ä\ã¤qyUö.®\'¼F\Ã\Û­I\É`\Öü•Lmºv9\é§\nûS\0óY\0}ƒ@g \Ðû\à\ÖÇ§ Š»º\0\Ô:ƒ~\Õ\ÏÅ¡¨Sr(mðÿx}”²/¶\Æ8»lŒ¡£ÁA]\0ð\0 ¡­\Ï\É\â\í &>ñ\Â“žö7\ÊÃ¹“\â\âw\â\íÀI\0z,\îƒA\êW›I\ÈXF\Ç/?»\0\0\0\0€(bø\0\à\0 ¶>\'‹½\0\0!X\Üƒ°6“±ŒŽ34NOG\ì\0\0\0\0\"H\Í\Äa½Bo¥`wF[Ÿ“Á\0\0p‡\Å}0Hýj3	\Ë\è8\ã¥ó± \Ó(›\Ã5òZAð¡Ä‹´^ø€¸ƒg\0\0pA[Ÿ“\Å\Þû\ÌÔœ{&ù\Û\Ä\'ÿÉ¹\0aqÀ\ÚLB\Æ2:\Î\Ð88u>±\0\0\0\0\0\0Dm}N{À]Nù\Û}ú\å\á\Ü\0€À°¸©_m&!cg¼t>v\0\0\0\0\0€è£­\Ï\É\â\íø\â‹/\îyhŠöþ§\Ý1þ1.\0\0‹û`\0\Öf2–\Ñq†\ÆÁ©ó\éˆ]\0\0\0\0\0\0 úh\ës²Ø»\0\î}øIS\ê/¯]û\ìK¯K3#\É\î¼2\èvzÎ\â\ç\ã‹û`ú\Õf2–\Ñq\ÆK\çc\0\0\0\0\0\0ˆ>\Úúœ,ö.€ñ<eJý\åµk_{s\äÑ´»\È\å\éBÓ·Á\å®ONÿJ(U¼\à$3g~¶\çª5ûdóBýU\Ä\ìü \r’-`U ›`qÀ\ÚLB\Æ2:\Î\Ð88u>±\0\0\0\0\0\0Dm}N{ÀýŸ6¥þòÚµ/¼ò\æ«3ß§£Iv÷„Ç¹@ºÐ´kp)\ë“Ó¿’Î¨\åN–º_’ŸMõ¬-H¶\Î4d÷Á õ«\Í$d,£ãŒ—\Îï¡»\03^>®Š\ÏcLU\îÑ·\å~À\']Ijc˜R)¿>r…\Â^]\Ìq\ÝNOøPR¤+¯\åC\ì2\0\0\Äm}N{À“òL©¿¸|\Å\Ë\Óÿ³dÙª\×ÞœSXRi\Æ\ßó\à\\@G\\F\ê\\!J³³9\Ò[žj\Ú\Õ<õ*®\\ÇŒ¶n®‹K+9Ì–\ÈS«f\åŠFiŽÁ\ì|+ƒV•ý\Ô\Ì&‰¦\Ê+\n”;þ\î\×õ¨\Í)\éV\r\æ©\Èe^4\Ï\ÞN9X\Üƒ°6“±Œ\ÎE¹cI‡È™Á\çvüSƒC\ã\à\Ôùt\ìÉ»\0„N»rtÁz>\í„<\è”6H\ÚLµ©¡g)f\è£ø¸´¹\0ð¡\Ø1’Žž<³ž\Ï;Mj-œ5-¿\×\íù\Ã\n\Úù<AMA1Å›–U\ÍñII©Ë¶Ÿ´¾r\âÃ²\âÉ´²©u\0\0€Š¶>\'‹½`Â£–€”Á\Â2\n-©þÇ¿Þª\\\Õ \ã\ï}\È\Ã@‚—\ÅgC^¶©W’—RA„\àe\ÌS÷\â\"Ö¼Ž]Q‰|¶$:\á\ÜFQ‡…\ÈÈµ:ŠsB\é”Y³Åµ\\#¹ˆˆp‚š¤e£\Èl¯þ\áq¡úe\ã¢VqEX\ÜƒÔ¯6“±ŒN?3rFŒ››KGw‘_”;v\ÄØ±c=R\Ã\à¥ó{\è.€\èsµ™f<š pd\Z\Û\Ñ3\Çu÷/\ê7g\Ý^<± ªWnƒúC\é†_ jŸ¥.‹OD\Õöõ\ãPT>,\0\0Ø\Ñ\Ö\çd±w<ø\Ø3\êþÿ•uM¤ù)\æù©o˜O\Ü÷°Ç\n\Åj\ÞL7°‰RKL\ëh\Ú\Õ<u-®FªaJgŒ(-\'	D´­fF\æ\âh3ƒ-\Ö@-«f\ÓJºfK@¢)\Ô!÷lF(ß‘\Ä\Å±À+?ˆ,\îƒAX›I\ÈXF§›9R\ÚG€›\È7\0¹E\"»\0vW 6U<š@wB\ÍJ8­#œ\ÕRü7g\Ù\îó‹Sç¾€\Î\â\Þeü\ÞkD>,\0\0Ø­\Ñ\Ö\çd±w<4Y¸\0´·\0R\Ì+¯¿gÆŒ\äI.\àŠ”©R‹J\á*\ã3\ê \0Wžˆr\ÍfâŒ‘u8]\05MM2\ÃVd\"\äšÍ†\Ñ#÷lF\È\Õ \Ö\ã“D÷Á õ«\Í$d,£3…»@8\0ŒØ´¸\0¼t>v¸a¬õ\Ý6ô6\Ïm\Æ_ñ»–²G²™\×\Ò4¤.)…\ÞP\nz%\Ùk \ÊE=œ\Z¨Dj]K\ÑPò8›Z ºö+H3d˜\Ø\í?‰l¤\Ø:\å\ÖN\ë#ð\èr\ÊÌš\ÆR_\ÜöŸfÞ›oŸ˜›þ]\0\î]=ò\Þ\É/R3ûA\0\0\0\Ð\Ö\çd»\àYü\Úoj1\ãyŠh\äg³\Ä7¥©\"Y)\è\å°\å3”±*lÅ­t+h\æùŒ^e¢tC^l©|Df\ßN¹E*%\Ív*q‰¨D¤UÐˆ‘\ÍŠuö\ÔÞ‘<ûE\áˆ6,\îƒAX›I\ÈXFg\nW€%ü± kb\Ò]´¤¶\Ê÷/å‘ª\É-õ\Ô\Ð]V\ï$\ÛMK‘\Í\ê—\è£*)=\Ù\Å\Â\Æg4¬Æ»ÞŒ\r\éÀ‡jUB÷Ú¯k\ë—H²\Æß§Ë©b<\Ðb««\ìš_l0\Þ\È\ÐYÜ»¬}\Ä:\Æ¨\Ê!\0\0 \Úúœ,ö.€‡sŸ•²\ß\Ç\îŸ\è\áÂ•±d3G\Ø÷\Ò;Qsra\ï\âB\ËH‚\ã9\Î\ÚŸ(,k\ÓÚ¦\ÖLP5¶Œ\Ê\Íy­ ™Ež«Ù¸%V\Èj\'Áq\Î(¥6g/œ=Md\'Ä»\0¸ZyQ[U j°¸©_m&!c)\\\\\0ª\ìO‹ÀK\çc€†X\è{=ól\×9Añ/¥hoµ©k]%Ih-/\r\é]¡G3R\ìr\Ê\r·l)¸\0ð¡€®eþ9¬Ï›¬\\\×\ÞZµ›~]N~\nÀ ¥a˜\Ë;ÿ\äv€t8<º¬º\0Œ°”ú‰~u¾\0\0\0’¡­\Ï\É\â\ïxü9Mð;\íþIOs¤(r8:Y<:’‡,\ïñ°¸	`m&!c).\0»\èO‹€\ÆÁ©ó\éˆ]\0\Zº\Ó0$\\ý\ÛDŽ?>¥<”ƒ§8´\Ë0B\É)„¨¼Šb\\¹g…“Z—S#\ØhÙ´-\Ù!]\0>”\0Ø›d»Ÿo»+.šjŽ€_—S\Ãeó¿uªb$\Ù\ß\Ï.;¿u\ê\äóa\0\0H\Úúœ,\Þ.\0b\â/<0\éi£<œ;).\Z^½\r.ñVù1w(]…\0\Ä\Ï@\ç¤ÌŒ\Í-\â\áñ\ÒùT­k|E\0¯]\0*†­¾œ¥<”ƒ·8ô¹\á\ì\'ƒ½+4\"`R\ër(‚†[¶ð.\0|(žˆ\Æ{‰y\åN¸0¥ø,\Ü1·ú«\æþü¿ñy5€O—E’\ç÷$È‡\0\0 sh\ës²Ø»\0\0\0‚\Å}0H\0k3	\Ë\èL\á\Ø`»\0º” šÊ±\Û9ŽR\Æ\åœzI½\Å*”!é„8§\ì¤0nQ*I¶³v’¨Mf\Ø	\×\åYY\Â;lb˜;²Í°·Ö¡\Ä‘øP<p\ÊZ«I\âº^mó\ér*\èÿ{=@\Î÷\rÁð\ë²\ì—\Ò\ë4¹\0RùK\0€‰¶>\'ƒ\0\0\à‹û`ú\Õf2–\Ñ\é¦(w¬qw\ßBü \'Z¤\Å\à¥óé¢®ñ=\Zc\Ñ/Tœa¦¾’À\ïO\ÒRj%U¹)_†o\×Àf~{’~93)‰\Úôh†V[À.K¤°\é•\îŽlf¨\ÊStDIf\ï—+Iû\åÚŒžö¡8\Û\Ã)D¯\ÕaJf¯.§€ý)\0‰ù,€¾A “?˜¤Ë„}r°»\0\Ôø0Ÿ|\0\0\0m}N	ÀC¹/üñ\Öœ6~\Ò3œ\0\Ðå°¸	`m&!cghœ:ŸŽÃ±\0\0\ZÇ¶‹@{€+†\0.\0\0\0H†¶>\'‹„`Üýù¯\ãFñœ\0\Ðå°¸©_m&!cg¼t>v\0\0B\ãü\Æm\ïŸ\Í\Þ\ÔLxg\0\0ôh´õ9Y$\\\0÷>4E¾ºÁ\âe³f/XXZI\á{\É\Ó6H\Ã\Ö\0\0º÷Á ¬\Í$d,£\ãƒS\ç\Ó»\0:²9\\³ ¯J\æÑ·¾§\ï\áÿž\0\0€h\ës²H¸\0\ÆO|Jº\0Þ™S¸¼v\í{‹(Œ­\0t/,\îƒA\êW›I\ÈXF\Ç/]\0\0\0\0\0\0 úh\ës²H¸\0x44ÿÊº¦©\Óÿó\Ö{ó^™ñnu\Í\Z×­dwŽŒ‹™4\äþ\à©ýžú{~ù\Ù>?ü@\Å}0H\0k3	\Ë\è8C\ã\à\Ôùt\Ä.\0\0\0\0\0\0}´õ9Y$\\\0>ö\éü\×\ßùð¶ûrµmÿ\Òþ>aŠ\Ü\Z@v×„\\.f’–_\ãùOúvX\ÜƒÔ¯6“±ŒŽ3^:»\0\0\0\0\0\0@ô\Ñ\Ö\çd‘p<4ùù€\Ï\æÿWf¼KVÕ¯»\ç¡\'¸˜‰S½[1‰ø7;[\î0·	\äg\ç½z™I¥ªR\ØJH\Ä\èUY™RÜƒ\0@ô`qÀ\ÚLB\Æ2:\Î\Ð88u>±\0\0\0\0\0\0Dm}N	ÀÃ¹\Ï.X¼\ì\í÷\çûlþŸùNÁ¿ßšC1÷=<…‹™(œ\â\Ý\Òð‰\È#£H÷K™n\ß\îoQ\ÃVQ,\ç¬Ê¬’Ò²­*ˆ5,\îƒA\êW›I\ÈXF\Ç/]\0\0\0\0\0\0 úh\ës²H¸\0&>ñ\Â“ž¾\âS®\ï$»kB®3þ‘\'¹˜‰ª\Þ%VL\"äŒ±{\0l•˜\á$‘‰ýË¾\0vX\Üƒ°6“±ŒŽ34NO\Çº€_f¾;¼Ã¼*÷\è\Ûr?\à“®$µ1L©”_•÷\ÒG\çG\é{Â‡¢\á\Óå˜FÚ‰H3\Ò\Î\î\Ú/\0@„\Ñ\Ö\çd‘pH¾ø\â\ç{\Í\Íÿæ¾€û\'>\ÅLT¡.qU\éZL\Z]\0:ƒ#\0\ìF°¸©_m&!cŠrÇ’‘3ƒ\Ï\rd¤Éˆcs‹8)5¼t>U\î\Z\ßÊ¤\Û\É\\,£3%½Bj3RC\ÏR\Í\ÐGñ+€is\àC±c$=yf=Ÿ»\á\Ó\åôŒFª¤6\Z³¦\å÷º=XA;Ÿ\'¨)(¦xÓ²ª9>)\á†w}\Þd¡®MS\nú$%ª2\ÍV§ø:y¦6\Ï­&©J>IDj\Ã\0\0©¡­\ÏÉ¢\å0\ß8cÖ‡¤ü\Õ\ÍÿLzZ\Ú\Ä\'^\à&v%.j\ÜØš/Fš•\Ç\Ù}\0j%V\Ø\Ê#j2°\âŒP~¶ù€U	\01‡\Å}0H\0k3	\Ë\èô3#Gˆû\\::]\0Vý6hœ:ŸŽ\Ãñ.€\î%\æj3\Íx4#@\á\È4¶£fŽ»m\\^3Ç¸\à\Ó\åôŒF—Òœu{ñÄ‚ª^¹\r\êö~ªY|–.Ü†\×\Ðù\Ö÷Y|Š\Ý\'Ij#§¥ó½¿N¢Tø$\0\0\èz´õ9Y´\\\0\æ{\å#\0~›ÿUÜ„7iw\ã\Å\0\Ù\Ù2Í©Û­L\æûŒ0©yµ\ÂD´ýu€öª¬<f&\0b‹û`ú\Õf2–\Ñ\éfFŽþ\Âi€—\Î\ïÉ»\0\"Ô¦ŠG3ô.€ŒA\Í\ê4\Éût9=£Ñ•TKñßœe»\Ï/Nû:‹\ëðj:Ÿo\Å_Ÿ$}¨\ë\Æ)§ž_\'qi\Û~Ÿ$\0\0\è´õ9Y´\\\0ò½€\æ‹\0ý6ÿ\02‹û`\0\Öf2–Ñ™¢+\\\04NOG\ìp\ÃX:\'6¾ª+`ûžØ òÌµ”¶½Všû\Ý<§ˆ«y¥ W’½ª\\\ÔÃ©šA¤\Ö\å°\r%³¡]\0®ý\n\Ò&vûE\")¶N»¬&Q|Bñ\Ê$Û§\æ1P„O—\Ó>\Z³¦±\Ô·ý§™÷\æ\Û\'\æ¦€ûð:t¾ã“¤Ub¦•SœºŽœ\î\Â&\0@7 ­\Ï\É\"\ä \ä{\æ²ù\0aX\ÜƒÔ¯6“±Œ\Î\î.\0\ç&ö\ÄTð\ÒùT¹k|\Æ\'vùÁx®¡}ñ/å‘ª\É-õ\Ô<V\ï$\Û=@‘\Í\ê—\ã\æžW#S\ër\ÊøŒ†\Õxû½M&¤\0JP¨U‰\'½\í\×\r\Üeû¸‰J¨\×\\§š\Óg üºœþ\Ñ0žh1‚\ÕUv\Í/6oHd\è,\Ã\ë\Ôù\æ\×\Ã\'\ÉüF±Ù‡…G\Þ2¥Qƒ\é|ª\ß\'	\0\0º\Zm}N-\0\0 :°¸	`m&!c)\\\\\06f\äP\ï\äž\0\Z§Î§#\Õ\ì\ZOÇž‰\Ð!^\Ï<k\è:S\â_\ÊCÀ\ØT“\íT¬\È\ÕÚ”$¡š¼4¤w…\ÍH±\Ë)l4Ü²\éÃ’ÿ~k†rºû~(t-ó\ÏÁ&>}º\ì“$¯ˆIQ§<õ(¿.§}4ø)\0ƒ–†a.\ïü“\Û\Ò\áð\Z\ÞÎ¸\0\äP«£\'q\Æ\ènwµ\ï“\0\0]‡¶>\'ƒ\0\0\à‹û`ú\Õf2–Ñ™\"™@\æ\è\ÜN\0/]\0\Zº\Ó0\Ö\ß\ÆR\Ø.Wüñ)\å±.×ša:€’S(yÅ¸r\Ï\n%>ò µ.§F°\Ñ0²iRD—\ÉÁ‡\0{“˜´\Ë~£\á\Ó)¿øt9­£\á²ù\ß:U1’\ì\ïKð\áµb|’\ìR\Ø6\Z>_\'F3\ÜÝ >I\0\0\Ðh\ës²Œ¸\0:::\Ú\ÛÛ—¯¬]TZ^¸h\Éü¢\ÒE¥•+Z\Û\Ú(‰3\0¢\r‹û`\0\Öf2–Ñ™\"©@¼ “.\0\Z§Î§#vhˆ5t5®±\ì­7œ¥ÂªM‡\ÖõIRñ®\Ð ˆ<H­Ë¡6\Zn\ÙÂ»\0Lð¡x\"\Z/¥µb²I!ºl\ë—g§üÊ†O—\Ó0\Z\æV\ÕÜŸÿ7~ °3¯ð^£#\êhXOIø$ùu¯“ý‰>I\0\0\Ðh\ës²ô»\0¶oo/)«¬_\ÓÔ²ik\Ûö··BF\æ–-+k\n·¶b£\01€\Å}0Hýj3	\Ë\èL‘\Ä`8\0:ûn@/]\0:AU„¸!^l8J9ô}YO\Ú ±²§\ì¤0n\Ê)I>t›6pœz5\ÃN¸.\Ï\Ê?.3lb˜»¤Í°·V\'G3Hð¡x\àJ“|º\ì“\ä#D\ËKŸ.‡\rô‡ÿ½ž gû`ø¯ý£7F&qê“¤…\ì£\Ô`8&\Ôï¡…O’©\Ì\0\0\0\à‹¶>\'K³ £££¬¢ºµ­}óÖ¶\æM\Û6¶lý¨y\ètó–6JZPTºs\çN.\0\0ˆ*,\îƒAX›I\ÈXF§\í„©ôg\äŒ\à(%²3\Ð88u>©~\×x:ö\\ŒE¶\Ð-†™kh¹\Úv\Æû“´”šAIU\îÊ—\á[+o+‰òÛ“ôË™IIÔ¦G3´\ÚvY\"@¯¬pwIƒ4\Ã<„èˆ’$\Ì\Þ/W’öËµ=\íCq¶‡%=Gút\Ù;\ÉWˆz\r”O—;3\ZN\ìOH\Ìgô\rü@¿\áµOA¶óIr\Ö)F;ñ÷b„UKŒ•ò­¶\Å>I€\0\0n´õ9Yú]\0%e•\ë?\Ú$•¿\Ó\ÖmhÉŸ_„\Ç\0ˆ>,\îƒA\êW›I\ÈXF\Ç/?»\0\0\0\0¤\Ã\0\0\0 }h\ës² .€;&½R³fŸø²¤bùÒŠ\åËªk\ê\ZšHðK\åß´¡¥¶®±diUqi\Å\Ü\Â\Î\Ú\äg÷\Z•\'n\äu’†¼Qf=\éª€h\Ã\â>$€µ™„Œetœ¡qp\ê|:b\0\0\0€´S3qX\à\'\0\0m}N\Ô0\æ†	\ç^{÷¤\ç\ßn\Ûþ	GyPQµŠ”ÿº\r\Í5«\×,]¶|Q‰x#`\Ñ\â¥KÊ«W\×7nÝ¶½°x)gª\0€ž‹û`ú\Õf2–\Ñq\ÆK\çc@§\Ñ÷\ÊZäµ‚ #\àC Á3\0\0€Œ ­\Ï\ÉÂ¹\0\È(0ý¢\Ï>÷|˜_º\06mÞ¶­µÿ¦Í­rÀÚ¦M\ë›)rÁ\"o\0)m1ýõ2n³\çg\Ë	\Ì\Î:<;[\ÉÁ\ØJI¹.³\É\"Z¤ˆõfž5ˆ\ÌJ²q\êQ§QÁu\Ìúˆ!,\îƒAX›I\ÈXF\Ç\Z§Î§#v\0\0\0\0\0€è£­\Ï\ÉB»\0¤e\Ý:eq…»—²¤¬Š¤¾—`\ËÖ¶9sqV’Ô¬¤IF\'¤7ýKg†˜§	Uˆó(•\ÈFa´\"…D7\n¨i^5p„•W\r;³Q\\—Z€\Â\â>¤~µ™„Œetœñ\Òù\Ø\0\0\0\0\0\0¢¶>\'K\Ñ m\ê\Ìyœ¬°¤¼º¤¬ª¶n\íF\Òû\Û\Ú\Ø°¾¹¦®±¼råœ¹E³rV\r!Ÿ-,•m\ÞM·‰jEœ\Ë\"]\Íf†­HGýË¥\"Ê™ÙŠq© I6\0\â	‹û`\0\Öf2–\Ñq†\ÆÁ©ó\éˆ]\0\0\0\0\0\0 úh\ës²]\0WÿiR~a§\Ù)«\\Ñ¸®yu}S\åò\Ú\Åe•E%•\Í+Z²pqyEÕª\Í[Z\n•&Rq\Ó\ÌÇ²\\žX\Ü\î\ÏK\Ô3lE:¢\Ôügf5˜\r€x\Â\â>¤~µ™„Œetœñ\Òù\Ø\0\0\0\0\0\0¢¶>\'\í¸ðúñSg\Îût\ÇNpPQU\ãÿ.\0\ï\×’ª·v\Ñ\çQ€T´ˆ x]`sŠÀ­”S‡[‘\Î(Ÿ\Z!+F	;³™MU\ã\0ˆ\',\îƒAX›I\ÈXF\Ç\Z§Î§#v\0\0\0\0\0€è£­\Ï\ÉÂ¹\0\îŸ2}\ã¦$kÜ’¥\Õþ\ïÈŸ_\ÌYl–\Ûñ…&·”¹m¼ÛÍ¶Rv\ím†­H—(\ä\n´\Z\ÔÌ‰d5N\Ï&ý		q\0\Ä÷Á õ«\Í$d,£ãŒ—\Îï¡»\03\Þ?®Š\ÏcLU\îÑ·\å~À\']Ijc˜R)¿>r…\Â^õØ™\×õôô%\í¤Ö¯´ƒ\0€nE[Ÿ“u\äLxiEmŸø²¦q}QIym}cs‹\í]\0µu\åU«f,\\]\ß\ÈYÃ¢\íŸxE \0ñ„\Å}0H\0k3	\Ë\è\ÌP”;–tøˆœ|®2#‡’$®\éÁ¡qp\ê|:RÍ®ñt\Ü\íKó+G¬\ç\Ó\îA,\Ù;µ^OÀHµ©¡g)f\è£øÀ´¹\0ð¡$0\"S:•z»¶_³¦\å÷º=XA;Ÿ\'¨)(¦xÓ²ª9>)a›—\0€è£­\ÏÉ‚º\0B\ÑÚ¶}iåŠ‚\Â\Å\ïXø^~\á»\Ìgö¼\ÙE¥\åÕ­mú\'!ˆƒ@\Ù\0\0ˆ7,\îƒA\êW›I\ÈXF§Ÿ9#FŒ\ÍÍ¥£\ÃP”;\Ö%6e¼tþp¼ {‰¹\ÚL3\Í\ÐG¸\02‚½#bo—\×lœ¤\Þ\Ç.\íWs\Ö\í\Åªz\å6¨?þdøªfñYf‰\É@\0@\Ð\Ö\çdq\0\0vX\Üƒ°6“±ŒN73r¤\ÄŽ\0]\ìS\Ü\Ø\Ü\">I4NOÇž¼ @mªx4#@\á\ÈzGD“øör<”mµÿ\ÍY¶ûü\âÔ¹/ C\Äc \0\0 h\ës2¸\0\0\0î°¸©_m&!c)\\\\\0\éö\0`@(\ê\Æ%v>_yô\ä™õM\Òa\æh3>ø\êÜµ”=’Í¼–&Ü”˜R\Ð+\É^U.\ê\á\Ô@\Í R\ërX‚Œ†’\ÇÙŒ\Ð.\0\×~i†»ý‡B¸õ‘/\'“¬–$vHl-L$…ë—½\ÂÔ˜5¥¾¸\í?Í¬¯}bnšwx}”D,\n\0\0b¶>\'Ëˆ £££½½}ù\Ê\ÚE¥å…‹–\Ì/*]PTZQ¹¢µ­’8\0 Ú°¸	`m&!c)œ.\0ñ@\ÎO\èü4NOGª\Ü5žŽ=c·³*{LýÿR©šôROÕ¿.0dØžd82I,NøTôQUžL­\Ë)\ã3\ZV\ãmýJ\Ò€%ö.\Ûþ4|\Zo$Ù»¬\ÊT¿OÙ»T*O´Á\ê*»\æŒ·\0$2tûhý”#3P\0\0´õ9Yú]\0Û··—”UÖ¯ijÙ´µmû\Ç\Û\Û?!£@sË–•µ\rŠ[[±\Ñ\0€À\â>¤~µ™„Œet¦pº\0Œ%JœwnW€—\ÎŽ]\0v„`óZO‹yø\Ý\æþ¥|Vù		A(§º\ÖU’„ðÒ\Þ\Zx4#\Å.§L°\ÑpË¦Küû¬\Ê\énû¡ˆ&‘|M˜G\Ö\éú¼\ÉZóDŒòv:\×~%-•ü€AK\Ã0—wþ\É\í\0ipø|v1(\0\0ˆ	\Úúœ,\Í.€ŽŽŽ²\nñÎ¿\Í[Ûš7m\ÛØ²õ£\æ-d \Ó\Í[\Ú(iAQ\éÎ;¹\0\0 ª°¸	`m&!c)\Ü]\0Žmò\Ð88u>±@C_\Êk\ëo)‡lº\ÎŸR2/¸lPr\n!*¯¢X2\"ñh† µ.§F°\Ñ0²iš\'¤€À‡\0½I\nžmóýt\\û•´Tx\\6ÿ[§*F’ý}aqû\ì¸;\Ñ(\0\0ˆ\Úúœ,ý.€’²\Êõm’\Ê\ßi\ë6´\ä\Ï/\Â\ã\0\0D÷Á õ«\Í$d,£3…\Ó\àPü\Þ\à¥ó±@C,Ðƒ\ìª54Xhõ\å,Vm:–û>I*\Þ\Zø¨M“ÔºŠ`£á–­*Š7z“<o4\É\Öe£¨V\×~%-\Zs«¿j\î\Ïÿ?Ø©Wø|v‘(\0\0ˆ\r\Úúœ,¨\àŽI¯Ô¬\ÙÀ\'¾,©X¾´bù²êšº†&üRù7mh©­k,YZU\\Z1·°„³\ê\äg÷\êÄþ\Å\á\'ˆ,\îƒAX›I\ÈXFg\n§@\Óü\ÆjBB\ã\à\Ôùt\Ä.\0c…@S96x\ÂQÊ¹ 7P š\áJKEˆSvR+I\Ú\é*ž:D\â\Ñ;\áº<+Kü¨ì°‰a\î­z4\Ã\ÞZ!ª\Í\è„\0Š7z“|\Z/\ÂV—	Ð¯$¥Â¢?ü\ïõ,\0a8\Ü7\Å>\Z¶¯h\Ô\n\0\0âƒ¶>\'\êsÃ„s¯½{\Òóo·mÿ„£<¨¨ZE\ÊÝ†\æš\Õk–.[¾¨D¼°hñ\Ò%\åÕ«\ë·n\Û^X¼”³¦¸\0\0H+,\îƒA\êW›I\ÈXF§Rö¤ÀU\Ô;ýjj§6\0x\é|ª\Ü5¾Gc¬¼…Š3\Ì\\\ÊZ\Î%ÞŸ¤¥\ÔJªP/_\'nf~{’~93\ÉG‡H\\›¡\Õ°\Ë©6{e…»·\Z¤ª(2\ä\Ý\ìýr%i¿\\›\Ñ?g“Lü/N\ÍF:jp\í\á_*ö§\0$\æ³\0ú\Îÿ@ ­\åÎ¯h„\n\0\0b„¶>\'\ç £ÀôwŠ>û\Üóa~\éØ´yÛ¶\Övü›6·\Ê]\0k›66­o¦\È‹\\]\0ù\Ù\â?XñòDO§¤\îe@&É =\È\ÂÐ©pdg‹˜Q£¬¢j5\0€$°¸	`m&!cghœ:ŸŽÃ±\0\0\0:‡&\ì\0\0dm}N\Ú -\ë\Ö)‹+\ÜwÄ•”U‘\Ô÷rl\Ù\Ú6g\î\"Îªã¼o>\Z \nM\Å\'ò¨¥…\ØOœ˜%œ\Õ\0¼aqR¿\ÚLB\Æ2:\Îx\é|\ì\0\0€N\0\0\0t\Úúœ,E€´©3\çq²Â’òê’²ªÚºµI\ïokcÀúæšº\ÆòÊ•s\æ\Í.X\ÈYuNº\áòª@Ë£¹\0,µOù\Ä	<\0\0„‚\Å}0H\0k3	\Ë\è8C\ã\à\Ôùt\Ä.€N£l\×?\Ö\Ým\àC]\n\\\0\0\0\Ðh\ës²]\0WÿiR~a§\Ù)«\\Ñ¸®yu}S\åò\Ú\Åe•E%•\Í+Z²pqyEÕª\Í[Z\n½\ÞÒ“\éô¯óÆ½!þ-€3’\×\æ³|[\0 ,\îƒA\êW›I\ÈXF\Ç/]\0\0\0\0\0\0 úh\ës²\Ð.€¯?u\æ¼Ow\ì\àU5þ\ïð~ C\ÌSÀ\Ü\Ï/oú›g\Î<fŒš*yøµ\0€€°¸	`m&!cghœ:ŸŽ\Ø\0\0\0\0\0\0¢¶>\'\ç¸\Êô›’¬qK–Vû¿ ~1gÕ±„;\ïñ¯ô³¤<o\èO\à\È#…¾ù:@%«‘\0\0¡`qR¿\ÚLB\Æ2:\Îx\é|\ì\0\0\0\0\0\0\ÑG[Ÿ“u\äLxiEmŸø²¦q}QIym}cs‹\í]\0µu\åU«f,\\]\ß\ÈYu¬mþiF÷\0\0’\Ã\â>$€µ™„Œetœ¡qp\ê|:b\0\0\0\0\0\0ˆ>\Úúœ,¨ ­mÛ—V®((\\üþ‡…\ï\å¾ûÁüwfÏ›]PTZ^\Ý\Ú\æú+²|?C:]\Û>\0\0‹û`ú\Õf2–\Ñq\ÆK\çc\0\0\0\0\0\0ˆ>\Úúœ,#.\0\0Àn\0‹û`\0\Öf2–\Ñq†\ÆÁ©ó\éˆ]\0\0\0\0\0\0 úh\ës2¸\0\0\0î°¸©_m&!cŠrÇ’‘3ƒ\Ï3rFŒ H•cs‹85¼t>\Õ\ì\Z\ß\rTWõº=_µa¼\Ùj\Ö4÷xF-8\ÍüÅ·\æ,:\Ím¨\á\Óö‰¹”¡jŸ\0\0\0\0€8¡­\Ï\É2\â\è\è\èhoo_¾²vQiy\á¢%ó‹J•VT®hmk£$\Î\0ˆ6,\îƒAX›I\ÈXF§!õ\Ç\æ\æ\Ò\Ñ\î\Ð(\Ê\ëŸ!94NO\Ç\á\Ñ\Ù ”¼»D.\0SÛ·4S¼\05\ÅJ)CöËœF¶^·Ol1R´S\0\0\0\0\0+´õ9Yú]\0Û··—”UÖ¯ijÙ´µmû\Ç\Û\Û?!£@sË–•µ\rŠ[[±\Ñ\0€À\â>¤~µ™„Œetº™‘#u½pø)|\é(\è\Ì€\Ø\ì\à÷óŸUmDKDŒ¡óE jbA±t\ÔgU7gÁ\0\0\0\0\0O´õ9Yš]\0e\â›·¶5oÚ¶±e\ëG\Í[\È(@§›·´QÒ‚¢Ò;wr\0@TaqÀ\ÚLB\Æ2:Sø»\0Ò°€ qp\ê|:\Æo€±\íŸe¿K±@\È~\Ã0‹Ž¢`û\Ä\\\Ê\0\0\0\0\0@\\\Ñ\Ö\çd\éw””U®ÿh“TþN[·¡%~Q7?Ð™\ß\ì\â\ßLùrøD\ÐiX\ÜƒÔ¯6“±Œ\Î¾.€tl ¼t~lvˆmüÒ¬<\â)\0\ëi‰\Ø#`¹\0¤øgG\0\\\0\0\0\0\0\0qE[Ÿ“u\Ü1é•š5øÄ—%Ë—V,_V]S\×\ÐD‚_*ÿ¦\r-µu%K«ŠK+\æ–p\Ö\îb÷pø·.\0\ÐiX\Üƒ°6“±Œ\Î>.€ôl hœ:ŸŽ\Û J}K®[»\0\ìn?\0\å4’(Ï°\Übc×€\Ø `{j\0\0\0\0\0\0\Äm}N\Ô0\æ†	\ç^{÷¤\ç\ßn\Ûþ	GyPQµŠ”ÿº\r\Í5«\×,]¶|Q‰x#`\Ñ\â¥KÊ«W\×7nÝ¶½°x)g\í.\à\0 \0,\îƒA\êW›I\ÈXFg\no€ð\0¤a\0\á¥óc÷.\0\n{¼P’\Ðù	@b;€’\0\0\0\0\0â†¶>\'\ç £ÀôwŠ>û\Üóa~\éØ´yÛ¶\Övü›6·\Ê]\0k›66­o¦\È‹<\\\0Bµfg\ê%\È\Î\Ï\Ï6	Ë§Dv¾AXqœ\Í^ƒ\Ì$\"+\Ê-›^¿•\Ç8·*\ákQ~+£lc\"´ªD\×\\p\\Ž°W«\ä0jõ¾(a]É¿’@m=÷Á ¬\Í$d,£3…§ Mhœ:ŸŽñ|@\"›÷vU/R\í¦ÀBl€\0\0\0\0\0 Žh\ës²\Ð.\0iY·NY\\a_%&()«\"©\ï\åØ²µm\Î\ÜEœUC\èO)=…P54©²v1JI2Fä–º\Õ\Êe«A&šù•.\ÙLù­<„UT\éæ¿£²š{ø¾\0\0·|IDAT¹2³€WU\\“ó\Ú	D\ír\nJµz\áv\ÑDœ‚•g¶ !Ot!H\Û@‚\Å}0Hýj3	\Ë\èL\á\áH\ÛC\0/»]\0\ÖV‘d•÷ùe’\ß3\0\0\0\0\0 nh\ës²]\0Ò¦Îœ\Ç\É\nKÊ«KÊªj\ë\Ön$½¿­]\0\ë›k\ê\Z\Ë+WÎ™[4»`!gÕ°4­Rd.©RÆˆQRÜ²\'B³A\êW\Ã\È\Ï\ÎÎ§ 	fyøW\ÅI3Ú†–\ßûTKø¥RZBÑ«\ÙòÆ˜Ù‚´\rô$X\Üƒ°6“±ŒN7¤ñI«(÷ü\r@š¶\04NOGº¨k<»š .\0™ÓºŸox\Ø\ÌH¸\0\0\0\0\0\0v\'´õ9YŠ.€«ÿ4)¿°‚\Ó\ì”U®h\\×¼º¾©ry\í\â²Ê¢’Š‹\Ê\æ-Y¸¸¼¢j\Õ\æ-­…‹9«†¥Z\ÍP\" Ô©±JŒ)R\ÙS\É¤~[\Ø\Ð\Õò\Î?Ef\ç±€\Â«ò\Â5?ü«õI5]\0\Îli(~[\0¢¿ +ð\ÒùÃ£³\0\0\0\0\0\0\0´õ9YhÀ…×Ÿ:sÞ§;vp‚ƒŠª\Zÿwx¾Ð’ f(P#øþ4\ÉZ\Î\íÌ®„¬l¢¨®!3Fd²\Ç”kÙ‚£\ã„bÕ‡ð8Ïª8#\Å\çÉ€Ž\Û\åü«õOõª$/\Ûl‰¤m Á\â>$€µ™„Œetœ¡qp\ê|:Fh\0\0\0\0\0\0\0h\ës²p.€û§Lß¸)\É\Z·diµÿ»\0ò\çsV\rKµªR•£„<7«³IwË˜D”ž\Ý\n‰ gby\ëšM¯_©@`^\ËTý22V‚Éª²\Úc6È\Û\åôjÍŠŒZ\\.jDX×±e“˜\Ê?y\Û@\Å}0Hýj3	\Ë\è8\ã¥ó±\0\0\0\0\0\0Dm}N\Ô3\á¥µM|\âËš\ÆõE%\åµõ\Í-¶w\Ô\Ö5–W­š]°pu}#gM¤k!XH7,\îƒAX›I\ÈXF\Ç\Z§Î§#v\0\0\0\0\0€è£­\ÏÉ‚º\0B\ÑÚ¶}iåŠ‚\Â\Å\ïXø^~\á»\Ìgö¼\ÙE¥\åÕ­mi{§”y§<\Îw¬•N0\ê†\0º÷Á õ«\Í$d,£ãŒ—\Î\Ç.\0\0\0\0\0\0}´õ9YF\\\0\0€\Ý\0÷Á ¬\Í$d,£\ãƒS\ç\Ó»\0\0\0\0\0\0@ô\Ñ\Ö\çdp\0\0\ÜaqR¿\ÚLB\Æ2:\Îx\é|\ì\0\0\0\0\0\0\ÑG[Ÿ“e\Äðù\çŸolnžñæ»“Ÿþçƒ=sÿÄ§&Lz\ê\ÅW_oZ·ž’8\0 Ú°¸	`m&!cgh¨k$øƒÐ³¼\0³²ze\Í\â0\0\0\0\0\0ˆ$\Úúœ,ý.€\rm|\ê¹\å\Ï[´|Uýº\r›>j\ÞB¶þ£MU+V¿õnÁ]\ä®m\\\ÇY\0†\Å}0vW€Tõ$\ï\å˜ø$\Ï\î\éÿ^\Ã&\Öð™`ñ¸Û®<ú¶+\ÇUñyŒ©\Ê=ú¶\Üø¤+ImS*\å\×G®PØ«‹9®Û‰Ù‡\0\0\0Dm}N–fÀ\çŸþü‹ÿn\\\ß\\[¿®zÕše\Ë\ë+ª\ë\È(P½rMMÝº\Æu\Í&=½c\Ç.\0\0ˆ*,\îƒ\Ñõ.€¢Ü±¤ºG\ä\Ì\àó3rFˆ;ò#\Æ\æqtŠ\Ð8\È]\0rL| <=f€\ÓÀv\å\è‚õ|\Ú=\Í\Ö)Á–µ™j3RC\ÏR\Í\Ð\Ç^M£ G~(\0\0\0@\Ð\Ö\çdiv\ìÜ¹ó©\ç_--_)•¿\ÓJ–®¸\ãþG»\çq\0ùöýQy\rf€\0\0.°¸F×º\0Hæ“ºÏ¥£\æ		\Ù_”;V\Ï\ìp\â\é\0ˆ1W›i.\0•ˆ|(\0\0\0@¢­\ÏÉ‚º\0\î˜ôJÍš\r|\âË³/\Îx\á\å¯LgNAñ\â²\åRù—-÷ƒ…O½0\íñ¼—\î}ø)\Î\Ú\Åd\ÔÐ7\nn°{Á\â>]\é o\èz¡÷\í\n_\×ü\â¼sh°ÀŽð\0Dú%\0P›*p¨À\0\0\0 ç¡­\ÏÉ‚º\0\Æ\Ü0\á\Ük\ïžôü\Ûm\Û?\á(^œö6)ÿ’²ªwÞŸ÷©3{\êŸ?öÌ¤\'^x\æ\Å\Ïþ°¨aí†‡³v1p\0÷Á\è\Ú]\0§@Ä‘\çH#¬¥‡»\0tRô\0\ÔŒ;\Ú|\Â|ò\ÌzŽÞµ«y\æh3>¸<s-ed3¯¥iH]R\nq¨ôJ²\×@•‹z85P3ˆÔº– £¡\äq6#´Àµ_Aš!\Ã\Änÿ¡\0\0\0\0]¶>\'\ç £ÀôwŠ>û|\'\'8xñÕ·K–®XY»vm\ÓFü«j+ªV—-_P¼¬xI5E>8\Ù\Ã •¹‰”\ÓRZ3j”=œ\'U}v6\Z)j¹\ì|Q}`€\í’\Ùùn—kp\ÍÃ¨Y%|)¾\î(N•—Ÿ\È\ã\Ù\0º÷ÁˆŠ@ \â…#À--,4\æ.\0:z!S{\Â.€š‰\Ã\Â? Ä¤M¿™¤vWÖ¿”Gª\Ú4\äŸU\Ä;\Épd$’Xgò©\è£*)=™Z—S\Æg4¬\Æ\Ûú• ¤\0\n\0\0\0I´õ9Yh€´¬[§,®p_NynÚ¢\Ò*/À\êúu½÷1Îª¡(s7‘n\ÄQ–(—!’ø²€„\ÜòZ•º\ÕnbViâ¼œ3z\Õ\0%h]W\æV‚fA\0\"‹û`D\Å`<\n ÷þS2\Ér\ìH/)¸\0„`—\×\Ìgv„ô\n¿\ÛÜ¿Thµ©k]%I\ÈK/\r\é]¡—ªL­\Ë)l4Ü²¥\àÀ‡\0\0\0Dm}N–¢@\ÚÔ™ó8Y\á™ÿý\äó\Ó\Þý p\éý5\ë¥`Ñ’\êw\æ,ü\ç«oýõ\ÞG\Ç\Ýõg\ÕP•¹\"[–\Ê,«\å]t‘K-k+­Hl3=³«sƒ„\È\×/\ç’Ç®\ä\åT¬F\ZÜƒ\0D	÷Áˆ†@€\×>\à\Ð8˜»\0üÁ.\0/t¦±>o²\Øz-Ì¦\ëüñ)Vm\ZUy¨M!D\åU\ëœ\Ú$R\ërj\r#›ö\Æû.\0\n\0\0\0=´õ9YŠ.€«ÿ4)¿°‚\Ó\ì<÷\ÊE%U\ï¸\è\Õ\×ßòÜ«“ž|\éÁ\ÉÏŸô\Ì\Ä)ÿ|ùµY5«\ï~h\ngÕZXª\è„.VâŒ Mc\Ë-õŠŽ¶+p©ªÃº\0U\á\Ë\\ú\åœy\Ü\\\0º¬WbÝƒ\0D	÷Áˆ†@\Ä\Ø^ÿ\'\":\åÀ.\0ð\ï2\Ìk€Š¡ÁB«/g©°j\Óï†³Ÿö®\ÐÀGmš¤\Ö\åP\r·l\á]\0&øP\0\0\0€È ­\Ï\ÉB»\0.¼~üÔ™ó>õþaÿ—^›\åÿ.€‡rÿÁY5¤6T´)‹u©l\êv™@Hí¬”5O3Eš›y´\Ì\ØD½v¹V»@oDFZqˆ,\îƒ¡]\0V”òT@ª\Ð8`€ð>€ šÊ±Á;ŽR\Æ\åœQ}€\\(\Ã+-q(N\ÙIa<X®$iO¤«$Q›Í°®\Ëb\è\Ãþ £G3\ì­¢\ÚÑŒN¸\0zÒ‡\0\0\0Dm}N\Îpÿ”\é7%Y\ã>õ“\Ô÷r\Ô5¬»cüdÎªa\Êl–\ÏRZ›X¢Ú®¹’[-\Çò\Ú\Ì\ãÈ¬bk…%\Ìm—s\ÍcFºe2\âdŒ®û• \0Q‚\Å}0º\Ò@Êžô¶Š¢ó…\ì\çXó§:v8B4\ì\r\é%Tœa¦¾2´œK¼?IK©”T¡i9^¾ß®\Íüö$ýrfRµ\é\Ñ­¶€]–H@\Ød\ÒU‹Ž(I\Â\ìýr%i¿\\›±|(\0\0\0@\Ä\Ñ\Ö\çdA]\09^ZQ\Û\Ä\'¾\Ì+Z2\é\É\ß\Ë_Xµ¢N}À>(zq\ÚÛ·\Þ=\éýrV\r©…=”¹Žv\×=\Ótñ\å\0ˆ\0,\îƒ\Ñ»\0º\Z¹ =c\0‘Š\0\0\0\0\0\0t=\Úúœ,¨ \ë6¼ð¯™w=4\å–;¾ùŽ‡þ|\Û\ÈŸs÷¤¼¼Ö¸\î#\Î\ä$Œ ’\\^OÃ½Jx\0@„\Å}0vW€Tõ\Î#	~\×øž‚q?:\ä\Ýh\0\0\0\0\0\Ð\Õh\ës²Œ¸\0\0\0»,\îƒAX›I\ÈXF\Ç\Z§Î§£y\Ï\ßy\ì!ˆŸÈ”@\Ù®Y\×\n‚Œ€\0\0\0ˆ%\Úúœ.\0\0€;,\îƒA\êW›I\ÈXF\Ç/\ß\Ów\0\0\0\0\0€8 ­\Ï\É2\â\è\è\èhoo_¾²vQiy\á¢%ó‹J•VT®hmk£$\Î\0ˆ6,\îƒAX›I\ÈXF\Ç\Z§Î§#v\0\0\0\0\0€è£­\Ï\É\Ò\ïØ¾½½¤¬²~MSË¦­m\Û?\Þ\Þþ	š[¶¬¬m(XP\ÜÚŠ\0\Ä\0÷Á õ«\Í$d,£ãŒ—\Î\Ç.\0\0\0\0\0\0}´õ9Yš]\0eÕ­mí›·¶5oÚ¶±e\ëG\Í[\È(@§›·´QÒ‚¢Ò;wr\0@TaqÀ\ÚLB\Æ2:\Î\Ð88u>±\0\0\0\0\0\0Dm}N–~@IY\åú6I\å\ï´uZò\ç\Åøq€†¼Qò‡\Ì\0\0»),\îƒA\êW›I\ÈXF\Ç/]\0\0€Ý„YYž¯öôI\0\0´õ9YPÀ“^©Y³O|YR±|i\Åòe\Õ5u\rM$ø¥òo\Ú\ÐR[\×X²´ª¸´bna	g\íbò³\Óð³~p€‹û`\0\Öf2–\Ñq†\ÆÁ©ó\éˆ]\0\Ý\É\âqÆ»\è\ÇUñyŒ©\Ê=ú¶\Üø¤+ImS*\å\×G®PØ«‹9®\Û\É\ì‡µo¯ø\ÏakøÌ†3	zz\Þô„%-t\Û@Ù±5£+G£ûF>\ít\ÙG©­\ÏÉ‚º\0\Æ\Ü0\á\Ük\ïžôü\Ûm\Û?\á(*ªV‘ò_·¡¹fõš¥Ë–/*o,Z¼tIyõ\êúÆ­Û¶/\å¬q.\0\Ðc`qR¿\ÚLB\Æ2:3\åŽ%>\"gŸ\'ñGbh¼t>U\î\Z¿{SSP\Ü\ëö|Åªl÷««¬¤i\Ö\ï\ÄÍšf\ægV\Ðn¤4g‰S¥Qƒ½No\ÄœWŽ.XÏ§ÝƒXˆtj’žÿþSmFjc\èYÊ£ú(~q°G\éTF\Þý\ï«SD!\0Lj_›4ƒ?=•ˆü\é\áC±aû!\Õô\Îo\é(Œ\Ùlò\ÌzN³\ãlFjc˜\Z]y-O\âó\×\Ö\çd\á\\\0d˜þN\ÑgŸ{>\Ì/]\0›6o\Û\Ö\ÚN‚\Ó\æV¹`m\ÓÆ¦õ\Í¹`‘‡@ˆ\ê\ì\ìQ½zõ\Ê\Î\Ë\Õ+;_F\çg\'‚”	K„\ËüT\"Ÿ²	œI\æ­S´+kÕºb\æ!|.Àn‹û`\0\Öf2–\Ñ\égFÎˆcssé¨¹\0dB‘<)\Ê«§‡†\ÆÁ©ó\é8¼\Ç\ï0\Ü–Ò°Ÿ\Z²DñZ\Z†\Ý^<±…\ÏD¶a¹\Å	@Xõb¾\äM3\Í\Ð\Ç\ç‹÷\ßW§þˆRq\0Dü\é©D\äOŠ‰hƒªœ\ëÆ¥³I]1G­Ï›œL`Gpª\ìj\âó\×\Ö\çd¡]\0Ò²n²¸\Âý¿†’²*’ú^.€-[\Û\æ\Ì]\ÄY5„\Ì6µ´)ü\Í\0%³+€£¬üBþ\'Ô¼£VE‰2˜H´¥Š{µ.ˆœ\äZ‰y	\0v#X\ÜƒÔ¯6“±ŒN7¤ó\ra/ô¾M\â;4¿ˆ\èœÀK\ç÷\Ì]\0*6M\"\ä}~Vµ<1p\n~@V5õÀ\ZQXò\Í\ÐG¸\0|ñûû\ê\Ì‘ùOúû$Eü\é©D\äO\nC‚?³sHW\ÌQp!>\ßym}N–¢@\ÚÔ™ó8YaIyuIYUm\ÝÚ¤÷·µ±`}sM]cy\å\Ê9s‹f,\ä¬\Z¦º6`An\êr!¹-DF+¿ªË€­ªDŽ\\\ns•«Š–\ßY‰÷\0€\Ø\Â\â>$€µ™„Œet¦pu˜{\0D–Nù\0hœ:ŸŽ\Ø`s¸¨\ã\æ¤yg’ðtˆ\'XÞ¤\Ç`,¿\Üv06\Ïm\ÆÿoÛµ”=’Í¼–öŸºþ¼ø\ßZ)\è•d¯*õpj f©u9,AFC\É\ãlFhâ¼¢U<\ä2\á??.¯\Ùh¼LU»Î‘÷ûû\ê\ÄQú=\0ø\Ó\ãf\éüxd4”<\ÎftòOŠ¢Ù¾\â9d¿˜ð%\â½\ç¨$x¹\0|š0q3™\Úúœ,EÀ\Õš”_XÁiv\Ê*W4®k^]\ßT¹¼vqYeQIÅ‚EeóŠ–,\\\\^Qµjó–Ö‚B/ MT³¬¶´µ–JX1]nËœ\Ì`\åôÀ5¿­ \\\0`7„\Å}0Hýj3	\Ë\èL\áph\Û\0Œ³Nº\0¼tþp7(¾ç º\0D8·Á¾1¬}bnP€H’\Å\Ó\à0\Ö:®‹ñ?kø5Ÿ)TŸÿþÿ­\"\ÞI¶ûHü?ŸŠ>ªÿ\Ç{62µ.§Œ\ÏhXw½?N‡\ØJ\\\Ô*›\Ú¦ö¡\ÈK›k}G«¬\n;‰\ï\ßW\êD5‡ymõ÷Iòz\niý$\Çg4\Òú§‡%Z§4R\ëWjet\ÙcŽJŠ›À§)!|:}þ‘‚¯­\Ï\ÉB»\0.¼~üÔ™ó>Ý±ƒTT\Õø¿Àóu€º\Z\']­Þ—§¦; V~‡.Wª¢ s\ä2pT\ë\åI0ƒj%J:\0»\r,\îƒ\r\0!\"¥ 16w†þd@hh\\½\0T¿k<{\étˆ\ÌFR§]\0\âPq\Ó\Ã\rña¸û]ÿR¡ÿû\×\ÜJ’øÿ\Þ\ë?u\ï\n\r<š‘b—S&\Øh¸eÓ‡\Å{…ê¸¥6†)~(FXY\"«+f‘”¶‘\äÿG”^\0þôl¤\Ö\å”	6\Zn\Ù\Âý\é%\éW°f(§»ç‡¢\n9#lˆ7Ž‰\Ì•—\Ì>Íˆ\n˜ˆl(\×\Ö\çd\á\\\0÷O™¾qS’5n\É\Òjÿw\ä\Ï/\æ¬\Z6e.Ð•µPóŒ\íV~3”(9­*¹%³\ç­|\á(0E$*\á(Â³\0ñ…\Å}0Hýj3	\Ë\èL\á\ê°wd\Ý «S™$ðsºeZs\ç]\0úÿ‹\ZbM#Wcöÿhýñ)ö¿£*ÿþ\Å\Ê@^E±\Îý÷O¤\Ö\å\Ô6\ZF¶$+K\Ô¶º\ÄIqSýPü†H\ß\Èûþ}¥þG”^€þ)k¤6\Z>¥‚}\Ù:ÿ){V(ñù¤\ïœ`£ad\ëÔŸž\0JRœ\ãl5)Js”?\â¢ö^ø5#*$iRj_\0ŸR1ù\ÎÓ¿\Úúœ,¨ g\ÂK+j›øÄ—5\ë‹J\Êk\ë›[l\ï¨­k,¯Z5»`\á\êúFÎš94‘\0‹û`\0\Öf2–Ñ™\"©@d\èœ@\Ì\"NOG\ì°Ý™ò\Þ.ø…±~€W\ÍJ‹À\ë€ŠñŸb\è% ³T\ØÿþnŸ$\ï\n\r‚¬óR\ër(‚†[6¿¾;Qn¬	S\n¦6†)~(†\èü\Èûý}u\â(­\ïƒ†?=Wv£?=øP<÷™\Ôú•\â@\Z\n/\Äez@úM\ÂDä†¶>\'\êEk\Ûö¥•+\n\n¿ÿa\á{ù…\ï~0ÿ\Ùóf•–W·¶)ûB3G\ê.\0óv¿	|	 ‡\Â\â>¤~µ™„Œet¦ðu\Èt\Ò€]\0vj\nª\Z^uŸ¿ñ\ãÿ¦ð\ÐSI\\\0Â§0,\×y·3$Aÿ_w\ì¸„£”q9\çÿ\Ù\êmjñ_5)\Õ\Äÿ\Ö\â”(¢65\Évs\ÛN’ÿþ=ša\'\\—\å\Ò,\ÜbÌ£öÖŠUŽ£¾«X\Ñ¯Ì©¡‡ÿP/¯Ã¼+\Þ_ù#J«\0zž„\ër„ÿô4ð¡xb4^iƒ2W¤Ö¯\Ô*\Ý.\0¿fD\ã\ÓðÉ†û$p”Š\Ïw^[Ÿ“e\Ä\0\0\Ø\r`qÀ\ÚLB\Æ2:Ýº\'®bþ€™4Bûi€T¡qp\ê|:\Ò%\\\ã\é¸[#ôF/i\Ú\Ïþ³JaS\ïXªñ\Ò\\\ÕK¢òÎ¹\0\ãÿBñßªa\æÿ\ÖrM\æŒ÷\'i)5ƒ’*\Ö/\ß\Èmýom%Q~{’~93)\Éÿ\Í\Ðj\Øe‰\\ò†}+|f¨\Ë\Ñ%I˜½_\îˆu­g©”\Æ0•\Ågy­	5ò^xü}u\êH|\Ê²\Æ\'\Éü\éu®Ë’(ÿ\é%\í—k3z\è‡bÿsPçŠ”ú•\æ9\Ê\çw\Ãõ£t6#*`\"rt™\Â\Úúœ.\0\0€;,\îƒA\êW›I\ÈXF\Ç/?¼Ç¿\0€nB¬Ÿl·;\Ü\0¤\Ù	\0\0\0 ‚h\ës²Œ¸\0:::\Ú\ÛÛ—¯¬]TZ^¸h\Éü¢\ÒE¥•+Z\Û\Ú(‰3\0¢\r‹û`\0\Öf2–\Ñq†\ÆÁ©ó\é\ØSw\0\Ð\Ý8¿q£Cß°\n‚b\Ü\ßt¿»\é“\0\0 >h\ës²ô»\0¶oo/)«¬_\ÓÔ²ik\Ûö··BF\æ–-+k\n·¶b£\01€\Å}0Hýj3	\Ë\è8\ã¥ó±`wAÙ­§?­ºždŠþ @è®@E¼ÿ\ßC\èû$u\Zü\éE|(=|\Ê*=e4´õ9Yš]\0e\â›·¶5oÚ¶±e\ëG\Í[\È(@§›·´QÒ‚¢Ò;wr\0@TaqÀ\ÚLB\Æ2:\Î\Ð88u>±\0\0\0\0\0\0Dm}N–~@IY\åú6I\å\ï´uZò\çeüq€Lü( ~hô0X\ÜƒÔ¯6“±ŒŽ3^:»\0\0\0\0\0\0@ô\Ñ\Ö\çdA]\0wLz¥f\Í>ñeI\Åò¥Ë—U\×\Ô54‘\à—Ê¿iCKm]c\ÉÒª\âÒŠ¹…%œ5)ù\Ù)þ$_]\0ù\Ùð €XÁ\â>$€µ™„Œetœ¡qp\ê|:b\0\0\0\0\0\0ˆ>\Úúœ,¨`\Ì\rÎ½ö\îIÏ¿Ý¶ýŽò ¢j)ÿuškV¯Yºlù¢ñFÀ¢\ÅK—”W¯®oÜºm{añRÎš9\"\æ ¢\â\×D\à\0±‚\Å}0Hýj3	\Ë\è8\ã¥ó±\0\0\0\0\0\0Dm}N\Î@F\é\ï}ö¹\ç\Ãü\Ò°ió¶m­\í$ø7mn•»\0\Ö6mlZ\ßL‘y¹\0X)²ó9B\Êf\ÈÎ–©\Ùùù\ÙFÀ™dŠl³ \Û\Å\æ3\Æ*žo•RÊ›\Å	#ND\È\æ5q\Ð\Ì&Ë‰\n\Õ\Z\éj•\0\Ä÷Á ¬\Í$d,£\ãƒS\ç\Ó»\0\0\0\0\0\0@ô\Ñ\Ö\çd¡]\0Ò²n²¸\Âý\×bKÊªH\ê{¹\0¶lm›3wg\ÕPõt¶)¤\Ö\ÖB¾¹iV’‘h\æ\ç8\nq¥‰\ê\ÍLjq[)³\"E\äsª\ÙP3@iö«ˆr\ÊU«8\0ñ€\Å}0Hýj3	\Ë\è8\ã¥ó±\0\0\0\0\0\0Dm}N–¢@\ÚÔ™ó8YaIyuIYUm\ÝÚ¤÷·µ±`}sM]cy\å\Ê9s‹f,\ä¬\ZB6+÷\ê	S6[ú\Ùe%	M®\æ2\î\ÍKDœ\Ý`+n…!÷\Ô\ÄeT\0_A r©%\Î\0¢\r‹û`\0\Öf2–\Ñ`F\Î\áÄˆcs‹8’™‘#“GZhhœ:ŸŽT¹k<»’Y\Óò{\å6h\îX9­yWKÃ°\Ûó³ª9RP]\Õ\ëö\â‰-f8_µa\íF‚Q\Ü-^\à]\n\0\0\0\0\0Dm}N–¢\à\ê?M\Ê/¬\à4;e•+\Z\×5¯®oª\\^»¸¬²¨¤bÁ¢²yEK..¯¨ZµyKkA\áb\ÎêŠ”\ÓR-›²\Ù\ÒÏŽ(+‰psX©\ép\È\ë˜\0[’$H\0Ñ†\Å}0Hýj3	\Ë\ètS”;vD\Î+¬zf\äX§zZ*x\éü\á\Ñ\ØPSP\ì\ê\Ê<¹ \Êõ÷¾Ùƒ 1*±t¾w)\0\0\0\0\0A´õ9YhÀ…×Ÿ:sÞ§;vp‚ƒŠª\Zÿwx¾0?[W\ÔÎ€3\ÊJA\ë¶<G’N·„zž\Ø}\0Jq«¼\ÈX%³­œ¨V;µ]E­V\âŒ Ú°¸	`m&!cQ¯:T\ÍoKL	\Z§Î§cDvd\Ü°«}b®r\n\0\0\0\0\0@¬\Ð\Ö\çd\á\\\0÷O™¾qS’5n\É\Òjÿw\ä\Ï/\æ¬\ZBx3ž¾\0g”R\Ê\Ò\äV~[®\Ö\Ð\ïÊ£\æ4SÄ›ü±VfÂ–S9s\\\Å^­’˜h\0‘‡\Å}0Hýj3	\ËèŒ¢ª|\Í`$ur€—Î\È.\0K“Á/\å½\íisˆlJ%p\0\0\0\0\0\Ä\nm}N\Ô3\á¥µM|\âËš\ÆõE%\åµõ\Í-¶w\Ô\Ö5–W­š]°pu}#gMv±\r\0H,\îƒAX›I\ÈXFgC\æ\'D¾ò€RxFg·\Ð88u>#²À\Ò\ä†V7v\ì€\í†À|h?až\ï0u¾pXñvÁ\ï]\n\0\0\0\0\0Dm}N\ÔŠÖ¶\íK+W.~ÿ\Ã\Â÷ò\ßý`þ;³\ç\Í.(*-¯nmK÷»£\à\0 3°¸©_m&!c9Œ7ÿYwù¥Àý¬û;ý$€—Î\Ê.\0¡ó…JŸ5­xbA•ñP€\Í`“\èBÀ‡\Ù\à\Ì\ã]\n\0\0\0\0\0Dm}N–\0\0`7€\Å}0H\0k3	\Ë\èa\è›¾w\îü\×\rƒS\ç\Ó1*»\0xÿs–P\æ\æ\Ñ\Ðù\éx€\ÂÖ»\0	¸\0\0\0\0\0\0b…¶>\'ƒ\0\0\à‹û`ú\Õf2–Ñ™@ª}ýþ¾ú{\0‚N{\0b±À¸ÿoˆvR\ìY\Õ\ét\è\Ù\à\0\0\0\0\0ˆ\Úúœ,#.€ŽŽŽööö\å+k•–.Z2¿¨tAQiE\åŠÖ¶6J\âL\0€h\Ã\â>$€µ™„Œet\Úq\×ÿ#%!ú“\Î<@\Ð88u>£²@\ÜóWž\É\'‰ž[\Ì\ïL‹À|¹ .\0\0\0\0\0€X¡­\Ï\É\Ò\ïØ¾½½¤¬²~MSË¦­m\Û?\Þ\Þþ	š[¶¬¬m(XP\ÜÚŠ\0\Ä\0÷Á õ«\Í$d,£ÓŒPö¤ÀUT¥O\É;|x\'õ?\á¥ó©r\×ø.Gº\0ÂžO\r•ž\ÜÀ¯ô“f\ê|»€sZ.R\0\0\0\0\0 ‚h\ës²4»\0:::\Ê*\Ä;ÿ6omkÞ´mc\ËÖš·Q€N7oi£¤E¥;w\î\ä\0€¨\Â\â>$€µ™„Œetœ¡qp\ê|:\Ê.\0\0\0\0\0\0\0<\Ñ\Ö\çd\éw””U®ÿh“TþN[·¡%~Q\Æ\È\Ä\Ï\à§@ƒ\Å}0Hýj3	\Ë\è8\ã¥ó#³\0\0\0\0\0\0\0O´õ9YPÀ“^©Y³O|YR±|i\Åòe\Õ5u\rM$ø¥òo\Ú\ÐR[\×X²´ª¸´bna	gMJ~v¯\ÔTw¤\\\0T°ˆ,\îƒAX›I\ÈXF\Ç\Z§Î§#v\0\0\0\0\0€è£­\ÏÉ‚º\0\Æ\Ü0\á\Ük\ïžôü\Ûm\Û?\á(*ªV‘ò_·¡¹fõš¥Ë–/*o,Z¼tIyõ\êúÆ­Û¶/å¬™#R.€ü\ì\ìüDN\0X\ÜƒÔ¯6“±ŒŽ3^:»\0\0\0\0\0\0@ô\Ñ\Ö\çd\á\\\0d˜þN\ÑgŸ{>\Ì/]\0›6o\Û\Ö\ÚN‚\Ó\æV¹`m\ÓÆ¦õ\Í¹`‘—@¹].E³©ºE ;[¦fç“’8“L­\Êu³V3†\Ë1Vñ\ì|«”R\Þ,Nq\"B\Ñô4³\Ér¢‚DµFºR-\0‘‡\Å}0H\0k3	\Ë\è8C\ã\à\Ôùt\Ä.\0\0\0\0\0\0}´õ9Yh€´¬[§,®¨\á4;%eU$õ½\\\0[¶¶Í™»ˆ³j¨z:\ÛÒ‰\0kk!ß\\‰4+I¹\Ënim\nq¥‰\ê\ÍLjq[)³\"E\äsª\ÙP3@iö«ˆr\ÊU$V\r\0\Ä\0÷Á õ«\Í$d,£ãŒ—\Î\Ç.\0\0\0\0\0\0}´õ9YŠ.\0iSg\Î\ãd…%\å\Õ%eUµuk7’\Þ\ß\Ö\Æ.€õ\Í5u\å•+\ç\Ì-š]°³jÙ¬Ü«\'L\Íl‰gG”•D$4¹šË¸7/qv€­¸N„\ÜS—Q=\0|È¥d´uX\Üƒ°6“±ŒŽ34NOG\ì\0\0\0\0\0\0\ÑG[Ÿ“¥\è¸úO“ò+8\ÍNY\åŠ\ÆuÍ«\ë›*—\×..«,*©X°¨l^Ñ’…‹\Ë+ªVm\Þ\ÒZP¸˜³º\"\å´Ë¦¶µ#\ÊJ\"\Ü\\\0VªA:\\\0ò:¦À–$\Ñc ÿAü`qR¿\ÚLB\Æ2:\Îx\é|\ì\Ø5+«W\Ö,\0@º¡9f\ØD÷\r§\0\0\0‚£­\Ï\ÉB»\0.¼~üÔ™ó>Ý±ƒTT\Õø¿Àóu€\ækóLý\ì8£¬$´n\Ës$ioK¨ç‰€]+Å­ò\" c•Ì¶r¢Z\í\Ôv½Z++\0q\Å}0H\0k3	\Ë\è8C\ã\à\Ôùt\ì\é»\0hm®-\Î»\íÊ£o»r\\ŸÇ˜ªÜ£o\Ëý€Oº’\Ô\Æ0¥R~}\ä\n…½\ê\ë±\ïJzÂ‡¢a\ër:*Œ5‡õ‚§\0\0:‹¶>\'\ç¸\Êô›’¬qK–Vû¿ ~1g\ÕR™ñô8£”R–Ð¶ò\Û2pµ†~P5§™\"\Þä—ˆµ2¶œÊ™\ã*JµJŠÀV\n€\Ã\â>¤~µ™„Œet˜‘3‚D81b\Ä\Ø\Ü\"Ž4)\Ê+’rfðy\'ð\ÒùT¿k|\ÏÀ\é\0`„h¹rtÁz>\í„XJŸôJ™T›‘\Úz–òhF€>~ðj\Z]\0øP‘6›<³ž\Ó\ì8»º-\r\Ãn/ž\Ø\Âg*³¦\å÷º\Ýf\Ã\nÚ­¤i\Í2¼kWs¥\æ6ð_{u•W)\Ä|a‡gC\á+¸M*¢0œ\0\0\0\Ð)´õ9YP@Î„—V\Ô6ñ‰/k\Z\×•”\×\Ö76·\Ø\ÞP[\×X^µjvÁ\Â\Õõœ5-\Ø5<\0 ]°¸	`m&!cnH\á›ò^„m^€9\â<—Žiq\Ð88u>‡÷\à]\0ž€ˆsµ™f\àP‰È‡B¬Ï›œLÌ§¡\Ë\Þ.\0\Æ-ƒ\êaSÿ\ÂP•¢ ‚\ß>qh7ù\rWcjÁN\0\0\0\è,\Úúœ,¨ ­mÛ—V®((\\üþ‡…\ï\å¾ûÁüwfÏ›]PTZ^\ÝÚ–\Üa¸\0\0\È,\îƒA\êW›I\ÈXFg\Ã`Šý92,\Ø\"WjS.\0¸\04|]\05Åº\àÏ¨ÀK\îc#\0\0\0tm}N–\0\0`7€\Å}0H\0k3	\Ë\èŒbw$H›€\ÆÁ©ó\é\Øsw¤¸¯/\ç¾ó¹y\æh3>¸<s-ed3¯¥	*]_	q¨ôJ²\×@•‹z85P3ˆÔº– £¡\äq6#´Àµ_Aš!\Ã\Änÿ¡Xx¹\0|ºœq¸–Í°\0>\0\0\0\È\Úúœ.\0\0€;,\îƒA\êW›I\ÈXFgÇƒ\0\ì\È\Îe|\0„˜t3Bð„—[þ¥<R}Ô¦!ÿ¬\"\ÞI†##‘\Ä:“OEUI\é\Ù\ÈÔºœ2>£a5\ÞÖ¯!]\0øPB\á\æð\érŠ¤\îh˜˜›ŸU\Í1Žw¸\äñ\"ˆÀPû®\Ï„žu\0\0\0$\Ð\Ö\çdqttt´··/_Y»¨´¼pÑ’ùE¥ŠJ+*W´¶µQg\0D÷Á ¬\Í$d,£3ÇŒ’\â.\ï\Ä.€Œ‘\Âb\\›qy\æ\ë\Ål\é~·¹©\ÐjS×ºJ’—^\ZÒ»B/U™Z—S&\Øh¸eKÁ€%0..\0Ÿ.§J\Ê.\0¯Wýez\0\\\0\0\0´õ9Yú]\0Û··—”UÖ¯ijÙ´µmû\Ç\Û\Û?!£@sË–•µ\rŠ[[±\Ñ\0€À\â>¤~µ™„Œet†0ô¿‡\Î\Ç.€L‘\Âb<‰’Zˆ·=\Ût?>¥ÂªM£*\é%T™¼ŠbS›Dj]N`£adK¢H“ƒ%8\ârö÷\ërª¤¾ Y\Þð\×oòwÏƒ\0p\0\0@§\Ð\Ö\çdivttt”Uˆwþm\Þ\ÚÖ¼i\ÛÆ–­5o!£\0n\Þ\ÒFIŠJw\î\Ü\É\0\0Q…\Å}0H\0k3	\Ë\èL`<\0\à-ò± c„,W(¯]\0*†\n­¾œ¥ÂªM¿»¯~2Ø»Bµi’Z—Cl4Ü²…w˜\àCIŠ¸J„wX¯´§f\Ø\à\îÀ»\0\0\0 sh\ës²ô»\0J\Ê*\×´I*§­\ÛÐ’?¿\0}X\ÜƒÔ¯6“±ŒN;Iô?]\0™#ür<¨¦rlð„£”q9§DT´\â\êJK_‰SvR–+I\Ú\ã\Ù*IÔ¦G3\ì„\ë²ú°?\È\è\Ñ{k…øt4£.\0|(I-\Ñ\ß\à\Ó\å\éœ€Ãª\æÏ¤À8s›[\à\0\0€Î¡­\ÏÉ‚º\0\î˜ôJÍš\r|\âË’Š\åK+–/«®©kh\"Á/•Ó†–ÚºÆ’¥UÅ¥sK8kRðƒ\0t,\îƒAX›I\ÈXF§\á\0 ®b\Ê}J\ã¨.\ï\nƒS\çÓ‘jv§\ãnX‡U<†ô’\Æ0S_Z\Î%ÞŸ¤¥\ÔJªÐ´/_†o\é++‰òÛ“ôË™IIÔ¦G3´\ÚvY\"\ÕfX5¤ª*Q’„\Ùû\åJ\Ò~¹6£~(\Î\áu\rg—SA(|~°Ÿ-ñ#ÿ\æÿ¦™Oþ«.\0\Z›,‘šý\Æ\Ó®¥|\à!R\àùCŠ~\×Aô\Ø\0\0\0 0\Úúœ,¨`\Ì\rÎ½ö\îIÏ¿Ý¶ýŽò ¢j)ÿuškV¯Yºlù¢ñFÀ¢\ÅK—”W¯®oÜºm{añRÎš¸\0\0\è>X\ÜƒÔ¯6“±ŒŽ3^:x\Ï\Ý@¤\â\0\0€Ðˆ\É\0\0\0\è\Úúœ,œ€Œ\Ó\ß)ú\ìsÏ‡ù¥`\Ó\æm\ÛZ\ÛIðo\Ú\Ü*w¬m\ÚØ´¾™\",òr\âgWp¯\ì|Ç©\Z!Ï¥ ;[\Ä\Z1f8\0\è4,\îƒAX›I\ÈXF\Ç\Z§Î§cO\Þ 0\î\ëaa\0\È \Ø\0\0\0\é@[Ÿ“…vHËºu\Ê\â\n÷[@%eU$õ½\\\0[¶¶Í™»ˆ³j\äg\'¤}C^¶¡\á…\Â7\Å<%ó‰Pú–SÀ\ÌA\'\\Þª	\0*,\îƒA\êW›I\ÈXF\Ç/ß³w\Ä\â<Skses¸fA^+2>\Ð\Õ\Ì\Ê\Ân#\0\0H\Úúœ,E€´©3\çq²Â’òê’²ªÚºµI\ïokcÀúæšº\ÆòÊ•s\æ\Í.X\ÈY5\ä=|õ¾\êp\rk‘\Æ\0‰Z\r\0 X\Üƒ°6“±ŒŽ34NOÇž¾\0\0\0\0\0\0\Äm}N–¢\à\ê?M\Ê/¬\à4;e•+\Z\×5¯®oª\\^»¸¬²¨¤bÁ¢²yEK..¯¨ZµyKkA¡\ï\Ûx¥’wUøÎ°W\0@§aqR¿\ÚLB\Æ2:\Îx\é|\ì\0\0\0\0\0\0\ÑG[Ÿ“…v\\xýø©3\ç}ºc\'8¨¨ªñ€\ç\ë\0ó³\Í\ç\0\\¾×ƒ\0¶Ö“yx\0€\ÎÁ\â>$€µ™„Œetœ¡qp\ê|:b\0\0\0\0\0\0ˆ>\Úúœ,œ\àþ)\Ó7nJ²\Æ-YZ\íÿ.€üùÅœUC({&ñ$\"\ÊüÆ™ýu€Ê—\Z\0\0)\Â\â>¤~µ™„Œetœñ\Òù\Ø\0\0\0\0\0\0¢¶>\'\êÈ™ðÒŠ\Ú&>ñeM\ãú¢’ò\Úú\Æ\æÛ»\0j\ë\ZË«V\Í.X¸º¾‘³\0\"‹û`\0\Öf2–\Ñq†\ÆÁ©ó\éˆ]\0\0\0\0\0\0 úh\ës² .€P´¶m_Z¹¢ pñû¾—_ø\îóß™=ovAQiyuk[;g\0D÷Á õ«\Í$d,£ãŒ—\Î\Ç.€\îdñ8\ã]ô\ãªø<\ÆT\å}[\î|Ò•¤6†)•ò\ë#W(\ìU\ß\×u%=\áCÑ°u9\0\0ˆ\Úúœ,#.\0\0Àn\0‹û`\0\Öf2–\Ñ`F\Î\áÄˆcs‹8Râ“”4NOGª\ß5žŽ\Ý@uU¯\ÛóÙ¦Y?\Ð6kZ\"Ò°a	lK\Ã0%¾\×\í\Å[8E \Öf˜YÐ³B_´R‰¶OÌ¥\Ó*û\ï\n6gQ†Ü† ¿&DË•£\Öói÷ \ÄRú¤WÊ¤ÚŒ\Ô\ÆÐ³”G3ôQü\â`\Ú\\\0øP‘6›<³ž\Ó\ì8»œZ3\0\0\0Dm}N\0\0À÷Á õ«\Í$d,£\ÓMQ\î\Ø93¬°\"õ}’R\ÃK\ç\Ì.€š‚bEH:\á\Ú\Ûô²ŸE»Îª6\â	Có[z^œjÊœñ¬\Ð[)£…‰R¶\Öö¾Ä˜«\Í4€JD>b}\Þ\ädb>=]\0\0I´õ9YF\\\0\í\í\í\ËW\Ö.*-/\\´d~Qé‚¢ÒŠ\Ê­mm”Ä™\0\0Ñ†\Å}0H\0k3	\Ë\èŒbý„\ê·\ã“\Z§Î§cTvhbž1|Wß®½»\îò\ÔQÊ¦½º\0\Ô\n}±—²\Z\×M\ìApö%ú@mªÀ \0\0\0€h ­\Ï\É\Ò\ïØ¾½½¤¬²~MSË¦­m\Û?\Þ\Þþ	š[¶¬¬m(XP\ÜÚŠ\0\Ä\0÷Á õ«\Í$d,£3J†]\0^:?*»\0\\\äºu›Ý¦½[ý,°\Ý‰˜€.\0µB_l¥ôK~±ó?¨C!\0õ\ã\Üw>7\Ïm\Æ—g®¥\ì‘l\æµ4A¥\ë+!•‚^Iö\Z¨rQ§j‘Z—\Ãd4”<\Îf„v¸ö+H3d˜\Ø\í?/€O—}©™8¬W¯^\Ã&y^\0\0@÷£­\Ï\É\Ò\ì\è\è\è(«\ïüÛ¼µ­yÓ¶-[?j\ÞBF:Ý¼¥’•\îÜ¹“\0\0¢\n‹û`\0\Öf2–Ñ™\Äg·¿ORphœ:ŸŽ\Ù \î¢\ëO\Î-m¹\0\ä\ã÷\ÂU\ïr¿]ÙŸoh{\ÕÌœžúb/\åxv@6f\Z]\ÔþJ‚b\Ò]\ÌÁ^nù—òHõQ›†ü³Šx\'ŽŒD\ëL>}T%¥g#S\ër\ÊøŒ†\Õx[¿„t\àC	…›À§\ËI\0\0\0â…¶>\'K¿ ¤¬rýG›¤òwÚº\r-ùó‹ð8\0\0Ñ‡\Å}0Hýj3	\Ë\è\Ì1#‡¤¸»\Ê÷I\nƒ—Î\È.€\ä.\0y_]»±Ÿ\Ül€w\'V)þü?a<\àp\r¤„6\ãò\Ü÷\é~·¹©\ÐjS×ºJ’—^\ZÒ»B/U™Z—S&\Øh¸eKÁ€%0..\0Ÿ.\0\0\Ø\Ý\Ð\Ö\çdA]\0wLz¥f\Í>ñeI\Åò¥Ë—U\×\Ô54‘\à—Ê¿iCKm]c\ÉÒª\âÒŠ¹…%œ5)\ry£F\å‰\Ûp\0€.‡\Å}0H\0k3	\Ë\èaˆ|÷þ>I!¡qp\ê|:Rý®ñt\ìJl\Ïð3BcKy¯jo\n[\Z\Û\éPc‚¸\0´\n}±»\0\Ü\êWO\Ë€dJFh!\Þöl\Óuþø”\n«6ª<¤—Peò*ŠuNm©u95‚†‘-‰\"M>”\àˆ\Ë\ÙÜ¯\Ë\0\0\0v7´õ9YPÀ˜&œ{\íÝ“ž»mû\'\åAE\Õ*Rþ\ë64×¬^³t\ÙòE%â€E‹—.)¯^]ß¸u\Ûö\Ââ¥œ5)p\0\Ð}°¸©_m&!c	Œ]þ\î\"\ß\')<^:?\"»\0\\Ä¼\Øn¯T…·£”Í•\Ì\à“M£«]\0^»\0T	Z}9K…U›~w_ýd°w…>j\Ó$µ.‡\"\Øh¸e\ï0Á‡’q\ì\0\0€ž‹¶>\'\ç £ÀôwŠ>û\Üóa~\éØ´yÛ¶\Övü›6·\Ê]\0k›66­o¦\È‹¼\\\0¤ø{1\ÙùŽS5BžKAv¶ˆ5b\Ì\Âq\à(\0‹û`\0\Öf2–\Ñi§«ô?A\ã\à\ÔùtŒ\È.\0BlKQ+ûùu\ím=  ¹\0\ä>|\Ë#\Ð Vè‹½”­…Lú\\\05•cƒw ¥Œ\Ë9%¢ú µWWZúJœ²“\Âx°\\I\Ò\ÏVI¢6=ša\'\\—ge‰ÿ<\Ã=\ï\í\Ñ{k…øt4£.\0|(I-\Ñ\ß\à\Ó\å¤\Èwô\Ê\n\â\0\0\0\Ðýh\ës²\Ð.\0iY·NY\\\áþŸPIYI}/À–­ms\æ.\â¬\Zù\Ù	­Þ—m\Üü\n\ß\Ü@\É|\"Ä½\å0s\Ð	—5e;j\0„m(´™„Œetš*Ÿ¸JBôû$¥õK…v¤š]\ã»\ÃÀ¦\ÞÛ·ko©\í†À,¢~#›j>¥B_\Ô\æ¹\çO£€0¤—4†™ú\Ê\Ðr.ñþ$-¥fPR…¦\åxù2|K_YI”ßž¤_\ÎLJ¢6=š¡\Õ°\Ë©6\ÃÊ¼ \ÍPU±èˆ’$\Ì\Þ/W’öËµ=ðCq¯\ëh8»œø\0\0\0 Vh\ës²]\0Ò¦Îœ\Ç\É\nKÊ«KÊªj\ë\Ön$½¿­]\0\ë›k\ê\Z\Ë+WÎ™[4»`!gÕ·\íÕÿªÀ5¬EŠÿ“\Þ \Ö\0i\ÚPh3	\Ë\è8#\ÇÁy™]\0\0\0ÐµH\0\\\0\0\0´õ9YŠ.€«ÿ4)¿°‚\Ó\ì”U®h\\×¼º¾©ry\í\â²Ê¢’Š‹\Ê\æ-Y¸¸¼¢j\Õ\æ-­…¾ã¤’wUøÎ°WŠ„#\0€” A\nm&!cg¨_r(´c¤v\0\0@\×a\ìFÀ\0@\\\Ð\Ö\çd¡]\0^?~\ê\ÌyŸ\î\ØÁ	*ªjü\ß\àù:Àülsç¾‹\Â÷zÀ–Á\ÚûŸ—\í¨\r\0Ò´¡\Ðf2–\ÑqFŽƒóˆ]\0»\Ê\æpÍ‚¼Vd|(‘\Ï\0\0\0@ü\Ð\Ö\çd\á\\\0÷O™¾qS’5n\É\Òjÿw\ä\Ï/\æ¬\ZB\Ù3¬\Þ\Í(Sðg¶tUÞ«5\ä9k\0„€m(´™„Œetœ¡~É¡ÐŽ\Ø\0\0\0\0\0\0¢¶>\'\êÈ™ðÒŠ\Ú&>ñeM\ãú¢’ò\Úú\Æ\æÛ»\0j\ë\ZË«V\Í.X¸º¾‘³\0\"i\ÚPh3	\Ë\è8#\ÇÁy\Ä.\0\0\0\0\0\0}´õ9YP@(ZÛ¶/­\\QP¸øý\ß\Ë/|÷ƒù\ïÌž7» ¨´¼ºµ-ù/H\0¢\0	\ÚPh3	\Ë\è8Cý’C¡±\0\0\0\0\0\0Dm}N–\0\0`7€4m(´™„Œetœ‘\ã\à<b\0\0\0\0\0\0ˆ>\Úúœ.\0\0€;$hC¡\Í$d,£\ãõK…v\ì¶]\0³²<\ß\Ä\í“\0\0\0\0\0z$\Úúœ,#.€ŽŽŽööö\å+k•–.Z2¿¨tAQiE\åŠÖ¶6J\âL\0€hCš6\ÚLB\Æ2:\Î\Èqp»k€x·\ÇË¸}’\0\0\0\0\0@\ÏD[Ÿ“¥\ß°}{{IYeýš¦–M[Û¶¼½ý2\n4·lYY\ÛP° ¸µ\r\0ˆ$hC¡\Í$d,£3ÀŒœ$Â‰#\Æ\æq$Q”;V\ÆKrfp|\ÊP¿\äPhGª\Ü5ž©®\êu{¾j\Ã\n\äkPš³\Äi•¥\ÔENã´¥a˜­Hñ\Ä™ƒ1~Š\ÛBû>I\0\0\0\0\0 \'£­\Ï\É\Ò\ì\è\è\è(«\ïüÛ¼µ­yÓ¶-[?j\ÞBF:Ý¼¥’•\îÜ¹“\0\0¢\ni\ÚPh3	\Ë\ètC:DBÜ‹°\Ý`1#\Ç3)0rœ\Ç\áþ»\0La¯#\\\0\Ãr‹\ÝU-cÙ‰`f\"\ß\Ø\äOM\áû$\0\0\0\0€Ž¶>\'K¿ ¤¬rýG›¤òwÚº\r-ùó‹\Òÿ8@CÞ¨Qybµ\ÞcIa0hÀ´¡\Ðf2–\Ñ\Åðx\Ü\í>€Nn ~É¡ÐŽvxº\0²ª\é˜Hõr\ì\ÚUSPœ¨Ä”ù\Î\Íþ>I\0\0\0\0\0 §£­\ÏÉ‚º\0\î˜ôJÍš\r|\âË’Š\åK+–/«®©kh\"Á/•Ó†–ÚºÆ’¥UÅ¥sK8kR‚k\ÔPjv·T\Ë>-ôJŠ~§@·Bš6\ÚLB\Æ2:£x»\0DJg7ˆ¿\êšóØ™]\0¤ógMK¨}o€#ä½±ÁŸ¿ö\Æ?Ÿ$\0\0\0\0\0\Ð\Ó\Ñ\Ö\çdA]\0cn˜p\îµwOzþ\í¶\íŸp”U«Hù¯\Û\Ð\\³z\Í\Òe\Ë•ˆ7-^º¤¼zu}\ã\Öm\Û‹—rÖ¤×¨¡\Ôl\n\Ò7újÙ§…^I\Ñ\ï\èVHÐ†B›I\ÈXFg\çƒ\0Cúœ\èüS\0õK…v”—Ð x\Æ\ØÆ¯ZBÛ³@\Èû\Ü!\Ø}\\\0ò©~@\Ü\í7p\ê|Ÿ$\0\0\0\0\0Ð£\Ñ\Ö\çd\á\\\0d˜þN\ÑgŸ{>\Ì/]\0›6o\Û\Ö\ÚN‚\Ó\æV¹`m\ÓÆ¦õ\Í¹`‘—€$)¯d{e\çë§–^U”«’¥—©f\ÍH#²gg\Ë(gµ‚ül>·*±¢\\‹h—\ÐóÛ£d\íT¯Á\Ù*gŒJ® ·%QŠ92‰\Â>eE²‘¸Ø!­\nm&!c9f\äðöúN÷@x\ä8„:\n’\íØµ«}b®ñÂ¿ .\0S\ì;Õ¾O\0\0\0\0\0\è©h\ës²\Ð.\0iY·NY\\\á¾\Ì,)«\"©\ï\åØ²µm\Î\ÜEœUƒ\Ô\'kÝ†¼\ì„N6¥¦6CBš%”TŽ\ãúD.™–¸€•Yž8+1¡\"F”^\Ä~	‹D~+ \ÑN5X%ú\îŒq!…\ÆKŒ¤|sd¬¼	Œó<­\r>»!$hC¡\Í$d,£3„¡ÿýŸõ\ïü³\0\Ô/9Lr€‘gZ³ŸÀC:_<\îolþ×”¾O\0\0\0\0\0\è©h\ës²]\0Ò¦Îœ\Ç\É\nKÊ«KÊªj\ë\Ön$½¿­]\0\ë›k\ê\Z\Ë+WÎ™[4»`!g\Õz\Ö~{YÕ®V8rM¥€¼f \â\ÔÂ¤q·\"œ$\àh-¿¦¨µSg\r2Æ™Gq¢µ\Êû4^M\ÊW\âE‚!\êµÆ¿\Ö%dŠUì¦¦\r…6“±Œ\Î\Æþ¤\ïú\ëüû\0\å8„:\n‚¸\0D¸j–·@y Cú^ª{C\è\Û\Þý\ç“\0\0\0\0\0z,\Úúœ,EÀ\Õš”_XÁiv\Ê*W4®k^]\ßT¹¼vqYeQIÅ‚EeóŠ–,\\\\^Qµjó–Ö‚\ÂÅœ\ÕUúºK\ÜD\È5U”,¨†)À7¹“‘8ókš_;u\Ö õØµµ3FE­\Ç‹\"×’œ.\0gY”mP\â@O€m(´™„Œet\Ú	¦ÿ\Óò£€\Ô/9L €ù\Ãr:\ß\î0ô¿}€q§\ß\ÐùÆ¦»\Ì÷I\0\0\0\0\0=m}N\Úp\áõ\ã§Îœ÷\éŽœà ¢ª\Æÿ]\0ž¯\ÌÏ–\ê\Ó&YM\Í)„¨‘.2V\ÖVB¬b)g¬J!µZµ3^\r\ÈT½ˆ\Ç%\Ìüjµç©½gß1.(ÕšAgc\Ô5Iu\È\âZ†<­\rŽfƒ\Ý\ZÒ´¡\Ðf2–\ÑiF8\0Œ·\ïY˜þ\0Rý¥Dv9¡Ž\á°½0ñH¿\Í OU€RDñ wöU¬þ>I\0\0\0\0\0 Ç£­\Ï\ÉÂ¹\0\îŸ2}\ã¦\Ä\Z×ƒ’¥\Õþ\ïÈŸ_\ÌY5„\ìdXgšQÆ¹ „xƒ]B¹rE	5«\Õ\ÃòU&X7‘¬TBh[×²\Ñ.‘¤mF„vª\Õ\à¨\Ð%\Æ«Zk|\ZoK’ûü¾ˆW†p­»$hC¡\Í$d,£\ãõKEÀc&I\Ü\éwÁ\'	\0\0\0\0\0ô\\´õ9YP@Î„—V\Ô6ñ‰/k\Z\×•”\×\Ö76·\Ø\ÞP[\×X^µjvÁ\Â\Õõœ5jü…® i\ÚPh3	\Ë\è8#\Ç!\Ô1c\Î÷\Ú\â\ï“\0\0\0\0\0z.\Úúœ,¨ ­mÛ—V®((\\üþ‡…\ï\å¾ûÁüwfÏ›]PTZ^\ÝÚ¦üÀU40\ï£GûÆ¶\ÒL&q\Ó€\Ì@‚6\ÚLB\Æ2:\ÎP¿\äP<\0\0\0\0\0´õ9YF\\\0\0€\Ý\0Ò´¡\Ðf2–\ÑqFŽC¨#\0\0\0\0\0\0A[Ÿ“Á\0\0p‡m(´™„Œetœ¡~É¡x\0\0\0\0\0 :h\ës²Œ¸\0:::\Ú\ÛÛ—¯¬]TZ^¸h\Éü¢\ÒE¥•+Z\Û\Ú(‰3\0¢\ri\ÚPh3	\Ë\è8#\Ç!\Ô\0\0\0\0\0€ˆ ­\Ï\É\Ò\ïØ¾½½¤¬²~MSË¦­m\Û?\Þ\Þþ	š[¶¬¬m(XP\ÜÚŠ\0\Ä\0´¡\Ðf2–\Ñq†ú%‡\"\à\0\0\0\0\0€è ­\Ï\É\Ò\ì\è\è\è(«\ïüÛ¼µ­yÓ¶-[?j\ÞBF:Ý¼¥’•\îÜ¹“\0\0¢\ni\ÚPh3	\Ë\è8#\Ç!\Ô\0\0\0\0\0€ˆ ­\Ï\É\Ò\ï()«\\ÿ\Ñ&©ü¶nCKþü\"<\0@ô!A\nm&!cg¨_r(\0\0\0\0\0ˆ\Úúœ,¨\àŽI¯Ô¬\ÙÀ\'¾,©X¾´bù²êšº†&üRù7mh©­k,YZU\\Z1·°„³\0\"i\ÚPh3	\Ë\è0#g\Äpƒ#\Æ\æq¤JQ\îX‘š3ƒ\ÏSEŽC¨ã®–‰\Ãn\ï\ÕË²a[D4S¥$	VP\ÃI¢ =s‚Y\ÓlE”R³²\è4wb¢Šš‰¹”š5\Ë8ñ,¥·PZ\â\Ò\Þ-\Ô*´Z\0\0\0\0\0\"‰¶>\'\êsÃ„s¯½{\Òóo·mÿ„£<¨¨ZE\ÊÝ†\æš\Õk–.[¾¨D¼°hñ\Ò%\åÕ«\ë·n\Û^X¼”³\0\"	\ÚPh3	\Ë\ètCò\Þ\Ôö\"\ìôˆØ±c)¥\Ó.\0\ê—Š€G!°³ªùL*jK-‹S–\è:\Þ.\0Æ™\Å|\"R;•øT\ëš\ä\ÝB\á˜–H1®/\0\0\0\0\0@”\Ñ\Ö\çd\á\\\0d˜þN\ÑgŸ{>\Ì/]\0›6o\Û\Ö\ÚN‚\Ó\æV¹`m\ÓÆ¦õ\Í¹`‘— !oT/&;_žŠIFX\Ë\0\È¤iC¡\Í$d,£3Š\á°+}\Ã[4#\'\r.\09¡ŽR[.€]»j\n†Y¢:ý.€¬‰Ã¤§eU\Ï\Ê\ê\Z€\Üq`\0\0\0\0€È¡­\Ï\ÉB»\0¤e\Ý:eq…ûÍŸ’²*’ú^.€-[\Û\æ\Ì]\ÄY5ò³ª¾!/;O,½\Íþ£\ì1f\0@f A\nm&!cQ.\03\"-.\0\ê—Š€G\Ð\Õ6€-&.€YtRœ49\Õ\ÜU.\0‘\Í\ÞM_j&\ëÕ«\×0ó‘\0\0\0\0\0y´õ9YŠ.\0iSg\Î\ãd…%\å\Õ%eUµuk7’\Þ\ß\Ö\Æ.€õ\Í5u\å•+\ç\Ì-š]°³j\ÈüR\ê3¤øÅ¹\ép\Ë\0\È¤iC¡\Í$d,£3‰!ø\Õ,\á]\0¤³\Ì=ó†rV\Í\Ê\é£\Õ%\Î\"†\äº!þ),ôyZ\\\0\î-´¿ÀÃ‘\á\\\0\0\0\0\0\0]¶>\'K\ÑpõŸ&\åVpš²\Ê\ëšW\×7U.¯]\\VYTR±`QÙ¼¢%—WT­Ú¼¥µ p1gu\Å.ò\rñŸoz\08\0\È<$hM®¹\æ\Z%p\Æh3	\Ë\è\Ì1#gøð\á\î€H\í\Ð]\0\é\Û@µ\ï¬)6,w˜qQq-\Û\ÕSq$\Û\à\Ó\0\0\0\0\0´õ9YhÀ…×Ÿ:sÞ§;vp‚ƒŠª\Zÿwx¾0?\Û\Ü\ãoI~©ö\Í\Çþ]ó\0\02\0iZüª\æ\×N%\ÚLB\Æ2:Cú\ß&ò\í¢?B»\0Ô˜Ì¸\0Œ$Ym—¸\0Œ0\Þ\0\0\0\0q´õ9Y8ÀýS¦o\Üd¬q½)YZ\íÿ.€üùÅœUCª}Sò\ËX\ë\Ô=\0 ý 5‘šŸ\Ð\Â*\ÚLB\Æ2:\0h\nŸ4¿ø@\î?\ê—Š€G\Ð\Õ6žÁ\×š.\0ñ–¾.pøu\0\0\0\0\0Dm}N\Ô3\á¥µM|\âËš\ÆõE%\åµõ\Í-¶w\Ô\Ö5–W­š]°pu}#g\r\îö\ÐM¦UaÝŸ€c´™„Œet\Úq\ÓÿN\"²À\ÐÿŠ&O«@T\î\æ°ÝŸÏÀy!_\ä»\0zÁi\0\0\0\0\0Ð…h\ës² .€P´¶m_Z¹¢ pñû¾—_ø\îóß™=ovAQiyuk[;g\n¿\0\Ðå \Õ`õ\ï¦ÿ	m&!cf„€\ï\ï\'p\Õú\Ýû.\0\Ï\×\æ	­¦**Z/\ØË”÷B{Û“d)€W)O€{)»€s\Úvø\0\0\0\0\0\0@—£­\Ï\É2\â\0\0\ì¦u\â¥ÿ	m&!cg\ä8„:¤\0.\0\0\0\0\0€®C[Ÿ“Á\0\0p‡m(´™„Œetœ¡~É¡xž\Ì\Ê\ê…\0\0\0\0\èZ´õ9YF\\\0\í\í\í\ËW\Ö.*-/\\´d~Qé‚¢ÒŠ\Ê­mm”Ä™\0\0Ñ†4m(´™„Œetœ‘\ã\ê\à\0\0\0\0\0€\îA[Ÿ“¥\ß°}{{IYeýš¦–M[Û¶¼½ý2\n4·lYY\ÛP° ¸µ\r\0ˆ$hC¡\Í$d,£\ãõKEÀ#\0\0\0\0\0\0\ÑA[Ÿ“¥\Ù\Ð\Ñ\ÑQV!\Þù·yk[ó¦m[¶~Ô¼…ŒtºyK%-(*Ý¹s\'\0\0DÒ´¡\Ðf2–\ÑqFŽC¨#\0\0\0\0\0\0A[Ÿ“¥\ßPRV¹þ£MRù;mÝ†–üùEx\0€\èC‚6\ÚLB\Æ2:\ÎP¿\äP<\0\0\0\0\0´õ9™‹`Ã†zšñð\Ä\n­0X·›6“±ŒŽ3ô·\æ¯ùG\0\0\0\0\0\0\"‚¶>\'ƒ@O¬Ðº\0ƒu»i3	\Ë\è8\ã¯öG\0\0\0\0\0\0¢ƒ¶>\'ƒ@O¬Ðº\0ƒu»i3	\Ë\è8Ckþš\ßy\0\0\0\0\0 \"h\ës2¸\0„ñð\Ä\n­0X·›6“±Œ\Î\03rF71blnGE¹ce¼DKMµ\ï<\0\0\0\0\0´õ9\\\0\Âxx\ÂÒ¼ö¼	k\Å]\Â\î@\ë\Ö\í¦\Í$d,£\Ó\r\éü93¬°¢ó\ÅigU¿\rú[ó\×ü\Î#\0\0\0\0\0\0A[Ÿ“v”>>fð\à1/I\Ä,‘\ç¥f†h\Z5;@#yxœT.ÿ\æMs¥}\ë\ÅŽ4\0SL›I\ÈXFg\Ãp¤\ß\à¯öG\0\0\0\0\0\0¢ƒ¶>\'\ã \ßü†<}\ã\æÁ\â|·vÂ¿iù‡|\Òr‹S\í\Ã\0ƒ)¦\Í$d,£3J†]\0ô·\æ¯ùG\0\0\0\0\0\0\"‚¶>\'\åxü\rqXbl\à©®ß¸y0só›‰\Ì7\ß<F‰q\æö¦gm( ²jŒ½*®$XfÞª ±.\êb<<\Z®\n?±/\à[”$2,¿e‚}€p$2\ÈS%Ï‡/*I»v\ÉS¥ø\'\Ï\Z9•O´.À`\Ýn\ÚLB\Æ2:“\0Ûƒ\0ü\Z\0\Ó52þj\ßy\0\0\0\0\0 :h\ës²p.€R!\Úo~ƒÂ¤¨9F\ÍF©%•¹ù]óúü\æ7ŒH«*Š\äü¤öEª­*™\ßp@p\r>™$—FºrE·\ÜrS\é³\Í|b¨}yJñr¿\0\á$\ïo©\Ôò1\"R‰ Qm\år\Ëðb’ýZ`°n7m&!c9f\ä\Î÷¼\ë\ïŸ\Zú[ó\×ü\Î#\0\0\0\0\0\0A[Ÿ“…uÈ›ù†\ÌVÕµu‹_K2\åºO%L\Î#;\\ªJ‚d¶büŒ‡Çƒ†9¥\ì ‰®\îwø\åiB\Õ\'¶\0H;o\Î\'.yT€¹§@º\0Œ\â¶Kx£u\ëv\Óf2–\Ñ\ÂPø\Ö3\0n\Ì\ÈQH	µ\ï<\0\0\0\0\0´õ9Yh€\ÈMõjŒ¼\å\î\"¼U¹\î•\Ç^•©%™}\ä½3³3›ñðøa\Ü\ç\â\Ð¼@~s\ï@\Â)@sh]€ÁºÝ´™„Œet&0\0H&\ï\í\ï	H	ú[ó\×ü\Î#\0\0\0\0\0\0A[Ÿ“…w8cÔ€\×.\0g\ë‰\05¿¹\Û_D>.÷ös’\Ã$³\ãg<<\Z•\Ë\Åm|	+yÇƒ\0º¼7wû‹\Ôg\åƒ\0>.\0™$4¿S¹\Ü,›(\å‰\Ö¬\ÛM›I\ÈXF§@ú_M@jø«}\ç\0\0\0\0\0€è ­\Ï\É\Ò\á0_õ\'^Å§	oS®;òPªõh€ñp€Y-GòÞ¥*«\Î`™erø\×\ZzÞ¶QŸ\Ð_¨\É{©\ç¹¿À\Ëx\à·\Äû­¬/Z`°n7m&!cf„´\ïúS0ý3r¬¤´ü4\0ý­ùk~\ç\0\0\0\0\0€ˆ ­\Ï\É»\02jo\Ü\ì/\Ñ3m<<±B\ë\Ö\í¦\Í$d,£ãŒ¿\Úw\0\0\0\0\0ˆ\Úúœ¬;]\0\Ê&\0~±wO¬Ðº\0ƒu»i3	\Ë\è8Ckþš\ßy\0\0\0\0\0 \"h\ës²h\ì\èn\ã\á‰Z`°n7m&!cgüÕ¾ó\0\0\0\0\0@t\Ð\Ö\çdp\ã\á‰Z`°n7m&!cg\èo\Í_ó;\0\0\0\0\0\0Dm}N€0žX¡u\ëv\Óf2–\Ñq\Æ_\í;\0\0\0\0\0\0Dm}N€0žX¡u\ëv\Óf2–\Ñq†þ\Öü5¿ó\0\0\0\0\0@D\Ð\Ö\çd..\0K‹±ŒŽ3þj\ßy\0\0\0\0\0 :h\ës2¸\0`0X¦Œetœ¡y\Ó_ó;\0\0\0\0\0\0Dm}N\0Ë”±ŒŽ3þj\ßy\0\0\0\0\0 :h\ës2¸\0`0X¦Œet˜‘3b¸Áˆcs‹8\ÒbFŽL%rfp\\jÐ¼\é¯ùG\0\0\0\0\0\0\"‚¶>\'ƒ\0ƒe\ÊXF§›¢Ü±#\Ê^„m^\0#\ÂL\î4þj\ßy\0\0\0\0\0 :h\ës2¸\0`0X¦ŒetF1$¿¥øg\ä¸nHš7ý5¿ó\0\0\0\0\0@D\Ð\Ö\çd..\0í‡¾`0,ˆi3	\Ë\èŒbw¤\Û€]\0\0\0\0\0\0 \Æh\ës2¸\0`0XzL›I\ÈXFgûƒ\0\â,gÆŒœ\æ›:ûD\0Í›þš\ßy\0\0\0\0\0 \"h\ës2¸\0`0XzL›I\ÈXFg\ãµ\Êm!þµ\Ç:¹+À_\í;\0\0\0\0\0\0Dm}N\0Ki3	\Ë\èa\èûm~!ùmb[@§|\04oúk~\ç\0\0\0\0\0€ˆ ­\Ï\É\à€Á`\é1m&!c	Œ\0\ÛüŠ¿\Ó\Û\0üÕ¾ó\0\0\0\0\0@t\Ð\Ö\çdisTNû\Ûu‚\ÜI0¬\'˜6“±ŒN;\îú\ßÀ¦ù|®\ÙCó¦¿\æw\0\0\0\0\0ˆ\Úúœ,° !ñ¯ûÛ´J-IØ‡¹ÿt]óŠt÷«\Ã`°\î7m&!cf„°7^ög¡\n}J\æX\ÛkR\Ä_\í;\0\0\0\0\0\0Dm}Nf€ª\Æ5óI\ê¤e®f–V\Óf2–\Ñq†\æM\Í\ï<\0\0\0\0\0´õ9YJ.\0\È\Í57þ‹s#,·\È‘\Ø\Z`\Éý\Ð^ü\Ã\\#\Ðù|J\Øk§¢`\Â\àw	YÖˆLØ“O>‰0\Âg(,M›I\ÈXF\Çµ\ï<\0\0\0\0\0´õ9Yª.\0!\Ù)2±ÿ_\ç¼__„EF©Æ­\"ZqJ§€,o¤j•¨5[aÿK$ZƒÁºÐ´™„Œetœ¡y\Ó_ó;\0\0\0\0\0\0Dm}N–ò.\0)\Åe\ÈK¨»q+nŒþ#Æµ`’H2R\íÖ™ûœ#Œ°3¬š6“±ŒŽ3þj\ßy\0\0\0\0\0 :h\ës²ˆ¹\0\è_¾¯\Ä8&‰”!#ƒu•i3	\Ë\è8Có¦¿\æw\0\0\0\0\0ˆ\Úúœ,.\0¯]úfgqg=H\áA\0N•!£H\Â:sŸa„öK\Óf2–\Ñq\Æ_\í;\0\0\0\0\0\0Dm}N\Ø ¤vb{¾Sl[1ö\Ì\æ3ùjgq+x x±Ÿ™d\ÄPMZ%F´\Û%¬\Ú`0X—™6“±ŒŽ34oúk~\ç\0\0\0\0\0€ˆ ­\Ï\É\Â\ì€Á`0o\Óf2–\Ñq\Æ_\í;\0\0\0\0\0\0Dm}N\0Ki3	\Ë\è8Có¦¿\æw\0\0\0\0\0ˆ\Úúœ.\0–\Óf2–\Ñq\Æ_\í;\0\0\0\0\0\0Dm}N\0Ki3	\Ë\è8Có¦¿\æw\0\0\0\0\0ˆ\Úúœ.\0–\Óf2–\Ñq\Æ_\í;\0\0\0\0\0\0Dm}N\0Ki3	\Ë\è8Có¦¿\æw\0\0\0\0\0ˆ\Úúœ.\0–\Óf2–\Ñq\Æ_\í;\0\0\0\0\0\0Dm}N\æ\â\à¼\0€ž\ri\ÚPh3	\Ë\è8#\Ç!\Ô\0\0\0\0\0€ˆ ­\Ï\É\à\0\0¸C‚6\ÚLB\Æ2:\ÎP¿\äP<\0\0\0\0\0´õ9\\\0\0\0wHÓ†B›I\ÈXF\Ç9¡Ž\0\0\0\0\0\0Dm}N\0\0À´¡\Ðf2–\Ñq†ú%‡\"\à\0\0\0\0\0€è ­\Ï\É\à\0\0¸Cš6\ÚLB\Æ2:\Î\Èqu\0\0\0\0\0 \"h\ës2¸\0\0\0î \r…6“±ŒŽ3\Ô/9\0\0\0\0\0\0Dm}N\0\0ÀÒ´N®¹\æ\Z9\Ðf2–\ÑqFŽC¨#\0\0\0\0\0\0A[Ÿ“Á\0\0p‡­\é	Ÿ\Û\Ñf2–\Ñq†ú%‡\"\à\0\0\0\0\0€è ­\Ï\É\à\0\0¸CšV…\ÕŽU\Ðf2–\ÑqFŽC¨#\0\0\0\0\0\0A[Ÿ“Á\0\0p‡­	\ë~Cùs\È\á\Ðf2–\Ñq†ú%‡\"\à\0\0\0\0\0€è ­\Ï\É\"\ê˜•Õ‹ÈšÅ§\àÝ™}ûŽ\ï{\ãJ>>mp\ìF#¦¦5\Ñ4¿v*\Ñf2–\ÑqFŽC¨#\0\0\0\0\0\0A[Ÿ“…qH]n2lb\r\'¤ŸHº\0jsŸ\Ê\Ó4o	ú\î\"Ã\ïò\é®]+oTž]X\ë’Ç—”D¯ýö6ô}&—\Z\áI\Z,k`³·.€®­‰Sð÷\0õKEÀ#\0\0\0\0\0\0\ÑA[Ÿ“…wH\åŸa=€T§e§›öž©i\ç®V\Ôj3’\Ô‘\î- ‹ M\nm&!cg\ä8„:\0\0\0\0\0´õ9Yª.€š‰\Ãd\ØˆT¡\Ùe„\Ä\Ú( \ËJT\'‚$‘O#Du2\ÊpXA\ÇEµ™YŒŠ)¥‰;Û›r\ÏNœ\nó¾1^[x6q¢\Þ07jP¯B‚6×­¬–\ç]}nÏ–½Ž+r\Ì3gswÜš¡\\Bng8;w“0ª•£ñL\î»i°™-\áp¯d´¡\Ðf2–\Ñq†ú%‡\"\à\0\0\0\0\0€è ­\Ï\ÉRtX›C\ÃÝŸ5\ËU±+E\Ñ,vp„‘*\Â>eµH\í¢nµY-L\à\"\ã¢—¢üD¾]\å\Ú0j\àR†^5\Ân·\ß–¸D€[ô®‘®W”9!m4Õ¯¬«•K\È°®›°nk0¡T\è^9\È$¤iC¡\Í$d,£\ãŒ‡PG\0\0\0\0\0\0\"‚¶>\'\ëÄ»\0Y\ÎjœOTÁn\Ø\"\r¸Š=›Vb­ ý¢®µ)6¤Ä•ÆŠTq\ØÔ¦M\Ð\ÊJ\èT­“M\Ô\à²\ã\ÇMßªB\×»_\Ñ]{^B	›y\äŽ\0³\Íh0\áž\Í™ƒm(´™„Œetœ¡~É¡x\0\0\0\0\0 :h\ës²T0±\ßmWe¼yb‹4°b\ÔlVX‰µ‚öò®µ¹#%¥4–]\0R\Ç&\î‡\ëúÖŒO\à²&\Ö;¥¨õ+Q\Ôj•Ž\Ë\noœ)R\é\Ö\î\Ùla9HÓ†B›I\ÈXF\Ç9¡Ž\0\0\0\0\0\0Dm}N–f€»b·412_µ&×²V¤\ëE½kÓ‘²–„¥¢„“©J©NTjT]\í;¤¬‰¥i\Ýµ½%ªxNrEw©\ì)\Úm²\\‚°\ÄKTº±Á„G›•\" ƒ \r…6“±ŒŽ3\Ô/9\0\0\0\0\0\0Dm}N–n@\"BbE³J7±j>Ž³G±¦w‹t\\\ÔY›3‹Ôl†vUÔ¯a†\ÔôFûQ@û[ô&5ªr­o4ôªi,¼\íyûð-3ô­k¤\Û\Ýµý,\Å&GÀ@1»Ï§	\ë®\Û\ÆM´Ö£r1HÓ†B›I\ÈXF\Ç9¡Ž\0\0\0\0\0\0Dm}N\Æ°û!¥©\"†{$,­¡¨	\ÚPh3	\Ë\è8Cý’Cð\0\0\0\0\0@t\Ð\Ö\çdph.\0¹]3·ò»\rðƒ\0HÓ†B›I\ÈXF\Ç9¡Ž\0\0\0\0\0\0Dm}NÖ³]\0\0\0oHÐ†B›I\ÈXF\Ç\ê—Š€G\0\0\0\0\0\0¢ƒ¶>\'ƒ\0\0\ài\ÚPh3	\Ë\è8#\Ç!\Ô\0\0\0\0\0€ˆ ­\Ï\É\à\0\0¸C‚6\ÚLB\Æ2:\ÎP¿\äP<\0\0\0\0\0´õ9\\\0\0\0wHÓ†B›I\ÈXF\Ç9¡Ž\0\0\0\0\0\0Dm}N\0\0À´¡\Ðf2–\Ñq†ú%‡\"\à\0\0\0\0\0€è ­\Ï\É\à\0\0¸Cš6\ÚLB\Æ2:\Î\Èqu\0\0\0\0\0 \"h\ës2¸\0\0\0î \r…6“±ŒŽ3\Ô/9\0\0\0\0\0\0Dm}N\0\0ÀÒ´¡\Ðf2–\ÑqFŽC¨#\0\0\0\0\0\0A[Ÿ“Á\0\0p‡m(´™„Œetœ¡~É¡x\0\0\0\0\0 :h\ës2¸\0\0\0î¦\r…6“±ŒŽ3rB\0\0\0\0\0ˆ\Úúœ.\0\0€;$hC¡\Í$d,£\ãõKEÀ#\0\0\0\0\0\0\ÑA[Ÿ“Á\0\0p‡4m(´™„Œetœ‘\ã\ê\0\0\0\0\0@D\Ð\Ö\çdp\0\0\Ü!A\nm&!cg¨_r(\0\0\0\0\0ˆ\Úúœ.\0\0€;¤iM®¹\æ\Z%p\Æh3	\Ë\è8#\Ç!\Ô\0\0\0\0\0€ˆ ­\Ï\ÉÂ¸\0feõR6±†ºÙˆ¬Y|\n\0\È$hMHð«š_;•h3	\Ë\è8Cý’Cð\0\0\0\0\0@t\Ð\Ö\çd\á]\0Rùw›‡\0€.‚4­‰\Ôü„V\Ñf2–\ÑqFŽC¨#\0\0\0\0\0\0A[Ÿ“¥\ê¨™8L†e \ï0SE‘¬Y~y†%’²f\Éú	Î‘¸¢ÄˆT#\Ø\àÈ£_Ý‘\ÅL7®\0p‡­\n\ëþ« \Í$d,£\ãõKEÀ#\0\0\0\0\0\0\ÑA[Ÿ“¥\èpS\ÑJœMÞ«w\ìyŒT%\È1cùF¬¶\Ò®yø\"|õ‰òL\æ1\àt%\0\à„4­«7ýOh3	\Ë\è8#\Ç!\Ô\0\0\0\0\0€ˆ ­\Ï\É:ñ.\0›71”5G%rø\äÑƒ–Ä·1õ\Ù\\\0\îy8\Ö%d?\0Á!A\ë\ÄKÿ\ÚLB\Æ2:\ÎP¿\äP<\0\0\0\0\0´õ9Yª$p¨w‡¦Ç‘Áò‰:L\\\\\0zg¬,$\á¢\0€$¦\r…6“±ŒŽ3rB\0\0\0\0\0ˆ\Úúœ¬³.\0%\ÎC\ÓÈ£f·$>\ëvM²[\éÖ™–\Ç~uŸx53\0 B‚6\ÚLB\Æ2:\ÎP¿\äP<\0\0\0\0\0´õ9Yg]\0¦\n§\ã\á{‡¦G\Ín“ø2!Ì \Ä¹œy\Ô\ê´t\Ç\å\0\0^¦\r…6“±ŒŽ3rB\0\0\0\0\0ˆ\Úúœ,Œ\0\0Ð“ A\nm&!cg¨_r(\0\0\0\0\0ˆ\Úúœ.\0\0€;¤iC¡\Í$d,£\ãŒ‡PG\0\0\0\0\0\0\"‚¶>\'\ëA.€\r>‚Á`™3m&!cgüÕ¾ó\0\0\0\0\0@t\Ð\Ö\çdpÀ`°ô˜6“±ŒŽ34uøk~\ç\0\0\0\0\0€ˆ ­\Ï\É\à€Á`\é1m&!\ã¿=\0\0\0\0\0\0@w ­\Ï\É\à€Á`\é1m&!\ÛžR\0\0\0¥¥<\'\0\0\0C[Ÿ“u\ÚÐ¼ö¼	k\Åf\Ù.¤aN\é7ošû­›–\È\Ð\ä\nK¯i3	O<a\à\Å/\0\0ôlxN\0\0\0:‡¶>\'\çøðÅ¹¤½…ü~±…£\Ü]\0-·\ÜTúl3Ÿø\áZœ\"\åUÜTy8ñ/\Ñ\äŠeo\Ü<\Ø\ä\æ7õÔ€F•Œy¼T‹„Áz’i3	O<a\à\Å/\0\0ôlxN\0\0\0:‡¶>\'\áh˜Sj*ÿ_œ{ÞœOD¨“»\0¼ŠûT›\ê5¹\ÂVúø˜Á7¿Á§o\Þƒ¥j\ÚLB\ÆOxñ\0\0=ž\0\0€Î¡­\ÏÉ‚»\0\ì÷\ÞÅz\ãTò\å·L0n\Úó\Êi†eNû-ý\Êå¼• QP„\ÍmS\ç«õ‹<Ÿ<›(bù d\rÉ¶hr…­ôñ1N\Ù/üœ´$qnnpÄ¨õ˜Å¥sA$\Ý|³ŒJy—y\Óf2žx\\“€\Ïxñ\0\0=ž\0\0\0_xUí¶®–h\ës²À.\0S“3	€P\à	µ_¹<¡óI¨\ËH\n°2ÿðÅ¹·TÒ¿ögôj˜ñVý\Ê­\"Vm\ê&W4¹’°„˜·\Ä9\Åð¾€7n&olò7•ÿÍ†\Îw\ÆX.€7GDq\á\n l\âCI\æŽlw3m&!\ã‰\Ç\ÏRó/~\0 g\Ãs\"\0\0\0^[{¬®µõ9Y:\\\06A.\Â <ß´\çûö–›À@¯6oeP\ê4‹x…\Ý\Ð\äŠf|\çž»Å˜Ç—pŒy“Ÿ\Ì5Fžš3l\Å,1B‰\"0\Ø\îe\ÚLB\Æ\ÏO\Þ~J^ü\0@Ï†\çD\0\0\0 \0¼\Âv[ck\ës²´<`\no7€&Ë£\ê0Ì¸K¯jx\Õ(\Þ\Ç`–R‹Ë°\0lw6m&!\ã‰\'\ÏL\ÞúŸ\à\Å/\0\0ôlxN\0\0\0‚Á\ël\ÇJ[[Ÿ“¥õu€.´\Ür“\Üÿ/r>›Úƒ\0Z¶\"Vm)>ð\Æ\Í\â>¿³Vófñ?\Ç<n<`ž²˜w\ÆX:\ß\íA\0N‚\0¶;›6“ñÄ£À3v\0\0€/<\'\0\0\0\àvºw\Ü0±\Ï_y!Ÿ\é°e`_€õ:@Rò”\Ó«\ê=QDdH\âP2«›\Ü\Ð\äJÂ„\àO\Ð\çB»3B\êk§\Î2†u¾šj¾.\0\Ø\îo\ÚLB\ÆžŸ<¼\0¼ø\0€ž\rÏ‰\0\0\0@2xmí±º\Ö\Ö\çd\á\\\0±?5\r4¹ƒÁ\Òk\ÚLB\Æž¥\Ü\æ)^ü\0@Ï†\çD\0\0\0À^U{\ï±\Õ\Ö\çdiwð]}~L Jhrƒ¥×´™„Œ\'ž0ð\â\0\0z6<\'\0\0\0C[Ÿ“eh@\Ñ\ä\nK¯i3	O<a\à\Å/\0\0ôlxN\0\0\0:‡¶>\'ƒ\0ƒ¥Ç´™„Œ\'ž0ð\â\0\0z6<\'\0\0\0C[Ÿ“Á\0ƒÁ\Òc\ÚLB\ÆOxñ\0\0=ž\0\0€Î¡­\Ï\É\à€Á`\é1m&!\ã‰\0\0\0\0\0\0\Ðh\ës2\0ƒÁ`0ƒÁ`°\Ý\Ï\à€Á`0ƒÁ`0¬G\\\00ƒÁ`0ƒõƒ\0ƒÁ`0ƒÁ`°apÀ`0ƒÁ`0\Ö#.\0ƒÁ`0ƒÁz„õ\Ú\'b\\\0\èñðt\0vkN\éBø’\0\0\0‚ñ\ä\èý»\Ìø’\0€Œñ‡?üCQt|\0Ðƒ ‡À\ê¼K\àK\0\0†¦\Ò3j|I\0@Æ€\0\0i\à\è!°:\ïø’\0\0\0‚¡©ôŒ\Z_\01\à\0\0D\Z¸\0z¬Î»¾$\0\0€`h*=£Æ—\0d¸\0\0\0‘.€«ó./	\0\0 šJÏ¨ñ%\0.\0\0@¤ ‡À\ê¼K\àK\0\0†¦\Ò3j|I\0@Æ€\0\0i\à\è!°:\ïø’\0\0\0‚¡©ôŒ\Z_€\0Ì˜1c—B[[\Ûi§&“;ì°ºº:?~üx¹d\ÉCeŒ„JQY™ô\ßÿþ÷¿ø…IEd*k\æ‰)p\0\0\"\r\\\0=V\ç]_\0\0@04•žQ\ãKRæª°\'\ÓM7Q€´zss3R\à¯ý«L¢UÃ«1TI]]\Ýa‡&#×®]«\ålkkƒ ³À\0@.\0¾Ý¯\ß9°í·Ÿ°þý\ÉFõ\ë\'¬o_²÷\é#l\ß}…õ\îý#²}ö¶÷Þ‡q5©Ó»w\ß}÷\Øo¿c0ü€\Ïx\à\ÈþŽ\ï\Ó\ç€Þ½ûqŽ`°:W9õ\Û\'u\î)—üñ”Ÿ\Ý~\Ê\ÏoGûù\'ý\ìö¯üÛ©?¿CœŽþ\í)\ßyò)§rm\n|\É`\ì½÷\Þýû\ì= /ý»7G¥ƒ¡C‡>þø\ã=ö\'OžL:\æ\æ\æ\Ê\0…(@§<ÿüó:\è .f0°_ÿ;†žpFÿýö\åˆT\è»ß¾‡Ÿ2\èð\Ó\\r\ßiW?ó½\ë_<ó\ê¼ac\î9\í\è\ï:\â\äA}t¦\î}\Æö÷\Ëýÿ\ÖIûy\ß[¸º´2bÄˆU«V544<ô\ÐC4¶ôAô\ïßŸÓ‚1h`ÿ§&\\]:\ë–ò÷s*?¸­\ì\Ýÿ[ôÖ¸Ÿ]tzŸ}{\Ë‡rÈ\Ç:p\È‡ž|p¿ý\èt\ß>ûþ\íCûî¢gBh½{÷0`À\á‡NŸÎ‰C†¡\å8}R””Þ¿D‚>¶C{\ï{j\ï¾?\ì\Óÿœ}÷;g\ßþ#ö\í\ê¾ý\êøD3\Ì1G÷ô“\n\ß?\ë\àƒúrTZ9 oŸ\íÿÝƒq\èA\Ã9ð;\r:a\àþû÷	÷7®©ô\ä6\æ \Ü\ËO{\ìªá“¯6\å\âCõT_\ãKvš\íÿý3N<ó\Ô!\Çy\àÀþ}8ì¦2_·nÇ/<\'(I|nlX¾|¹—À\Ë@yy¹\êY úW®\\ifŽ)p\0\0\"\r\\\0>\ÐRø\ßC†|ñ\ïuœ~zÇ·¿½ó\ÔS??ù\ä\ÏN<q\Çñ\Ç:t\è‡ù\ï\àÁu\Ô\ÇG\Ñ~\Øa\Û9¤í ƒ\Ú8`\ÛÀ\Û\ØÚ¿ÿ\åF%\\]Hö\ÝwÿþûŸ0ðÀƒ:÷°£Æœý“~{\Ëý\ç_|\Ó\Ç\\<èŸ\ìÀ\ÈþN\Úw\ßAœ;¬\ÎN:ëœ“²&÷«\'Nþõ\ã§ý\æñSóø	¿\Ê=!\Ë\Ã~õøÁ¿œ|ÑS³&½=\ä×”óñ\ã=\å\ÄkÇŸ|Æ™\\_2G\r\Ú{\âû\åþ¬ÿOO\é=¨\ß7¾õ­~{íµŸ´o|k\ïo~\ë[œ/%H\ÛTVV.^¼˜\Ö%kÖ¬Y´¨X/.¡ÀÚµkKJJ)\ÐÐ°\æ‘G\É\É\É9ê¨£¸\ä>û\\r\ÑewŒ¾\êGCzˆ£\Â@Ÿøi1ú\ï§üú\Õ\á¿{c\äoü\ãû#ÿ4g\ä\ßùû·FRÌ¯þõý\ÑwròyG¤ü\Ý Ÿ=xr\'\í\êþÿ\ÇÕ¥ÿøÇ¤ÿ«\nVýs\Üô\Åo–oi\ÙZUUõ\ïÿûšk®\Ñü,>|÷\Ô#*Ÿh\ß<s\ÇöYŸ¾÷I\ë\Ûo}ó•‰WÜ5\ÆE\Ï9ýg\'}ÿ\Æa?\Ê9‹ôÿywÿ \ßþ}\ÇL>\ï°S–€+òûv\ÄG\\w\Ýuÿù\ÏJJJh]oP]]]\\\\LŸÔ…^ü“\nÂ±½û<\ÔÿùŽª8xû !Ÿ\rú\ÙÀc·\r<võþ\Ç|0\àÈ›ûpp\ïN¹Ã’r\Ø!ýÞœzú\Î-\çý÷£sÿr\ã1}û¦\Ó\íp\Ä~ýo;ý¤W†Ÿ1\ï\Ü\ïWüt\äª\Ï^ñÓ‘K\Îûþ‡g÷Ÿgžò«¡Gwh*\Ýßž¸\ä¨ñ¿\èŽ[\Ýö·•û\ëÒ»ÿòúc?®\åñ1¾d§9q\ÈUÿy¢\ê­ñ\ï=ò‹{\Æ~{\è!ûuOt¤Ì¥Pwº\0(F\Û\Ì\ït\nø¸\0þú×¿š™¥\ï€b\à\È,p\0\ÐÃÀZ1¿6dÈ®aÃŽþ\ÚWÿÃ¾*\ì\è¯\îy\Ôÿ°ù\Õ=øêž‡}õ+‡~õ+‡|õ+)»\0ö\í3hÀþ§:\è\'ƒ¾ððÁ£Ï¿\ä·Ï¾þfÁ\Ê\ê\Âúšyµ+^~÷\ÝË¯ýó‘ÇŒ¦\ÔA‡\\°ß 3(?—ô†Õ¹\Ê\Å7Ÿ5ù„¬Gû^õ\ÐW~r\ßW.Ê¯;9\ë±®\ìx7\ÛÿšI\'ý\æñÒ†M\×>üº\Èó\ËI\'ýö©“z=×¦À—ô†\Æ\ä…_¨»\ç€IWö?d¿¯\Øÿ˜£üñ1‡\\0\ä¥uÐ¹ûŸø\Íoõù\æ7¿\ÉeB\"]\0;v\ìø|\çÎŽŽ\n\ÐQ\r|ö\Ùg\âøù\ç“}´¾¾aüø\ä‚fÈ±\Ç=øØ³·þõž\ÓN8µwx\0u\í;¿8<\ë\å³n˜>ò\ïŽ·x\äßªGþm\Ûm\Õ\"\æ¦wF\Þðï‘¿š:bøõÇ¥ðõ ¢\é ý¿aÃ†õ›\î<{\âo¿õ\Æ!·\ßþƒG\æ<·`\Û\ÆÖ?þxó\æÍœ/\ÃN9¼.ÿ\êO\Z\ï\ß\Ñ6\ãógý·\áÞ–—þ\ãÖ“L@¿ýúôÛ·\ï~}ú\è»oŸ}Iÿ\ï\Ó{Ÿþƒú\íÛ§KHjŸ]wA­\íÓ§\Ï÷¾÷½7\ß|³½½ý‹/¾øüó\ÏIü-^¼˜>8ŠÙ¹sg[[\Û\Ë/¿Lkñ¾üN\Æô°z\à`\Òü»gÚ§û©\Û÷ e{\ï¿lŸýW÷9¤r¿£~¼o¸}\"¡{\ÙaŸoøñ®m\ç\ï\Úzþ\æU?ü\î\é9¡\Óü\ä¨\Ã><ÿ+/ú\Ñ\êÑ†]tö\êHVûÓ‘µ?AVu\Þ÷\ßÿ\Ñw‡\ÈQ«©t{\ä?\Ïùûú[\ïj1\í\ïy3ø^\0¾d§\é\Ûg\ßeo=¸v\îCµo\ÞRò\ä\Ø\É×q\Ð\0\ì\Ø=q\ÞÕ—\Ì0\Þ\à|˜Ÿb\Ôû„\ê\Ð H\Ê?\Þx›\0…\éBgŸ}6\\\0™.\0\0z8±s\Üw\íÿ\Ô\æõjxN7Š¼÷\Úÿ9dP:\å{\íµ×¿9\æ‹\ÓO?n\Ï=Ž\ßs“ö\Ü\ã\ä=÷8%a¦Š§\Ôã¾¶\ÇÐ¯\í1\äk{°#¿¶GxÀ¾}û±ÿ 3:lÌ®q\Î\r¿Ï¹ÿÍ¢\Â\â¦ú¢µu…\r5ÒŠÖ®.Y\×ðŸ%\ÅºýÁ]ðûcO¼’ò4¼oÿ£ö\é\í¹übu®pò•·žtýcý.{\à®\Þk\Ñ\Ê\çf->þ\Ïò\ËI\ÇþrÒ«>þºICv\Üu“†ür\Ò\Ä×‹þ/\ï?Ëš6?4m~\ïŸ?|\âuœð«\'Nºô\Ï\\_Òƒ3Ž\îýþT\ß9\èÚ³ú\r\èwô\ÑŸ7ô°K¼lPÿSöúf_ú ¸p`†º¬²r\Í\Æ\Íuµ¸ZCË–5†Mzô\Ñ7\ÞxcÅŠ=6ù\Û\ß>\å\êK¾s÷7]—•u\àA¡o)\Óg=h\Äÿü\èñý~3ýû™?ò¯\ËF\ÞV\ébŸ]0òw3Fþ\ê¥á§Ž>rŸÞ¡¿´¡\\\0w~÷™Ù\Ï\Î-ž8\æ_w{\æ/\Çp|XÀ±\Ç{\ÅW¨w~T\äþ\Òÿ\ã/|ü×‡\æ¨ö\Ç\ãÿ¾¢p5-9k2†røª\×\ÏÚ²xL[\í¸-E?mzzÏ•ô\ÊûýA¦À•+ž»\è\È\ïtþÉ› ô\Ûo¿ƒ‚\îÁ\év\è›9`À€\ßü\æ7---Ÿ}öYuuõ¤I“®¾ú\êü\à\ßþö·O?ýôQ£Fýò—¿\Ì\Ë\Ëkhh\è\è\èX¹r\åù\çŸß·o\ê\Û\æ\í\Ó{Bÿƒ?\Ý¨©ü;]³ß‘¯«\ïÄ¯~õÉ¯|\åù¯|\å†½¸\çž3¾¾Ï˜}úGNªô\ï\Ûû´Á½û\Z_ób¿þû–¼uÚ®ug\ï\ÚtÎ®\Í\ç\îj\ÕPüý3O\ï¬Þ¿OŸq§¸\â\âQuŸ³zÌYÿKÀ?X}Á\ÈÚŸ\n@\íùß¯=\ï¬E?ú\î\ÅG\Ö\'™KES\éþvwö¿UýOö·Ûª»ê‡”tÏ˜s.»lÖ…W,º\äŠ÷\î¼ø¢)£©¥ñ%\ÓÁ¬\'ÿ\ÜðÁ½«\ß·\ìY\ï\Ýñ“_ÿ`0\'€\ÝR\ã,\à¤\Þ\ÍG÷\éÿ’÷šþ\'Hí›¯¤€¼\çoº\0RþTVúTALÉ”\àøã§\Ùù†n azë­·\æÍ›\'Ç”““²\à\ÒK/>}úºu\ëv\ì\ØAG\nS§\0\âC\n.\0ÿ©FMMaRJÊ“¿ß³.¯—«5L=(ÿ\å«g<u¥—½2ù\Ê\ï~;\Ä…”\çkGµó´\ÓL€©ÿMÀ‰.€£Â»\0úö;üÀC.8\æ„\Ë~Û¤¾óþ\Õ\Ë®YMV\ØP\ë4Š/Z»º`e\ÕK\ï\Îþ\Ó“N<ýª½°\ß~\Ç\ZÞºÀ\ê\\\á\ä+þ\ï”\ë\'}\åœ;_|\ÉU¿\á\ìÛ§¾^Xý\ê\ÜÊ§þ³\ä×¼~ðœø\ËGŽû\Å\Ã\Ç\ZvÌµ_ð·¾¿´vQ\Íúò¦Í½Y<\èg—5Y¼JÀ_Ò_\ì¿ö¾Þ¾iÿ“\ëwÐ€\ï{\èMó;\ì\â#üQ\ï}úV\È\çŽ;î¸ªªªFù7û\Ø\ÚM[>,.™]X$lAQÁ{/½ùÀ€÷\rº\äÜ£\Â\Þ¥ú\Ð¾zò=½\Î|jŸ\Í9\à\æ’3s–Œô´Ò‘·,ù»\×G^÷Üˆ³~>$ŒŸH\Üp\ï\Èj6\îü¼ƒþ?iý´¡l\Ãÿü¸L\n\î8p`NNNEE©\Ç?üp\äÈ‘œÀ\Üÿ\ç\Ù5ý/­ô\íeÁgƒ\ÓO<d\Åkgn]|‰t¬\Ë\Ûs\å\Ä^S~{\àþ¾.\0\Òÿb;@\ç \â€\0®šŽz\Üq\'´ï¾™\ÝÄž¨S}úô!ý¿eË–?þ˜tþ\ÙgŸ}À|\ã\ßø\ÊW¾²‡Áž{\îù\Ío~ó\ÐC½\ä’Kþõ¯\Ñjžñ_|1\äZBBúÿ¿ö›ÿ¯ô9`ø^{ù­o‘þo\Üôo¼òõ¯¿š°—¾ñ­«:\áøý\Ùû®|¨ÿaƒz6¨\Ï}¿8ò€Ä»6.ü\áÀ]Ë‡\íZýý]\ÎÞµñÇ»>úÑ®õg—¿w\Æ÷¿3\è¸!džøó)C«\Æü¨\î’s,€ôþ¿\Ðpý?\\º\0j\Ï=«ô\ìa¿r$ö@S\éþvûÿ\ÍSõ?\Ù_\ïX=\é\ç?¡$©ÿ¥]zÙ¬É£TJ\ãKcÀA‡{öE\ßû‡‘7\Ý÷\Ã??x\æ\rwžz\ÙoŽ\ZvvŸþ\è›œsyÉ‹¿[˜—õö½—þe\Ìi§}\0»$\é\å]z‚Úƒ\0„”\î\éºY€pUõf¤,H³“td\È@ÿ\r…‚‹¥D\Z\\\0gžy&©}\ZÖ—^z‰¤>\Åp»ÜE‚“š\àückk\ë\Ë/¿œ••u\Î9\çÐ‘\Âó§?ý‰s\0\0bB\ì\\\0“µ\çò\Çz9­îŸ‡~²ô\Æ]«þ°k\Ý\í‹¸z\Ì\É\\Q\0h¡ÿ\ê‘G~~ò\É\Ò@šŸŒ\ÂRö5L†‡\ì¹\Ç\à=÷8¦s.€O?ø¨‹²Ÿ^8éƒšie5ó\Z\Ö­­×”¿jbkÀšº7+W<» ò\Ùü¥CO¹lÀ \á^X+œ|\é-Cñ\Ðñ\×<x\Æž~\î­\âoþô®½.\ßû\âñ¿¾\êûK\ëž}gñ\Þ\ç\Üyüµ½öÁc¯!›pô\Ø	û\\|ß·\Ï{deó¶\æ\Ì(<öºGO¹\ä\\_\ÒiŒš»hÀˆ¡û2ð{$\ï‚\ßÝ†z\Ñ^{õ¥“?þxZI\ìøüóP\ÖX:±ö™/\åO\Ø\ãÈƒCß™?ðÌ¯Û—N½¿\×\Ùÿ\îu\î\Û_\ZýŸoþv\î	·,AR\ßË²?ù\ë—G\\ö\ÄÉƒN\äJ\Ð@úýŠ–/¾\Ë“œÓž©Á]\0/¾øâ§Ÿ~ºuÃ¶÷¿Û¶i;ýwù\åô\Õf.¼ðÂ>úH\îÿÿõaºø—\Êp\êqVNýÎ¶„ \é\é=WM\ì5ùW\ì\ß\ßOo_ò\ä\ß@ß±!\'žLÚ˜\ÏÝ <G;ô\Â\Î9õÛ§\Å\Â@|\ï{\ßkii!ýÿð\ÃŸt\ÒI_ÿú×¿ô¥/õr°\Ç{P\ï\Î8\ãŒ\çŸþ³\Ï>£õ\ÔSO\å*\Â0ºÏ€\íxœi¯ö?lÿ½÷V%~ß½öº~¯½\Þ\Øw\ß76£w\ïosb8.8¾\Ï\'\ãû}ñT\ß#\è=\ãº\ãª\ï?\í\à<\r\Þ÷»ƒw•ž²k\Ù»\ê‡\ïjüÁ®¦\îjúAGýˆg\'_ôÖˆ†¦\â8\ã˜CœÖŠ\Ñ?\"ý_wñ(\Ç.\0c€²€¬\æœ3—ýø»\ß?\Ð\ïM¥û\Ûm¿}ò¦[ª\Èþ0®z\Ü\ën»\0*\'_5‚’Lý/m\Â\Å\ÃÔ‚\Òø’\É ñ?\âwwý\æÅ¹/\×Ì¯\ÛX×¼¹±iIU\ÓG\ïW7=6§b\Ì}ÿ<þœKŸ\æ©iy<uó…?<õˆ~!ß€Ø“Y³f\r\é;>‰<š°7]\07\ÝtiuŠ1;%9\nø»\0(Le\é¿	¹}\0.\0—¶ºFš\ÈRÁIÁpé¥—\Òÿ\Ô1>O@1½\0\0Ä‹\Ô\\\0þp¾}ö‘^\Ëô2c\Ê%»jÇ¹X\Í_v­üí®•7ø\Û5cŽ\çŠ \\\0GñÙ‰\'JÀI{\îq}\ï½vžzj\Çgt|ûÛŸŸ|òŽ\ã?ý¾B©k:h\ÅÀý\Ïû\ÆWUÀ–~ýB¹\0ð\Ã¾÷›{þ\Õü\Ä\Ü\ä·LÊ¯©dõ{+\ë\æ\Õ\×-\\SWØ°Ú´ù\r«ç¬ª^¾ò¥\âoW5\Õnû\ï\ÆO?\Ïú\ÓCƒ:\ß\ë—X+œt\É\Í\Ç^ýÀÐ«\ï?òªû|u^ö£ÿ>ô\Òñ^|ï›£n?ø¢»\ïšú\áûe«û\Í\äÁ?\ì\Øû‡Œ½Ÿržü‹	\Ç_ûÀu“f¬li]±aó\É7>y\ê\ÅAw\ì\ßoŸ¿\Ýÿ\ãGz\à\Òôÿö±õ¿´\Ã\Ük¯\ëK\éX»ikCóf²yKÊŸ{î¹·g°ú£\ã´Ú¦úe/©~¢×c¾Æµ¦wß½üùWŽÿk¯\ï=\Õ\ëœ\éšõúÿ\Ù\r¯\ï}\ËÛ‡\Üù\îñ÷\Í>ýþ9\Ã˜ó]Ã†\Ñ\ém\ïp\å\ÛŒxò\ë\Ç\ß\Ö\ë°+¿¼w\ï\ÛTÀ­\'?yÿ9/\Þ|l®#í¡ŸL­_²^\ÓÿD\n.\0*õ\á?‹~?øo$\æ»\æù†ò¦-›·þ\å/9ø\àƒ/»ì²„\Ûþ\ÕB¹\0N:f\à’œ¬>°\ê‘^ÿb\à€~~_€³~{Æ £:»Ã™þZ;\å\Ô\Ó\Îøvÿýö3cLúö\í{\àÁ;ó{—Œ>\ï\ê«.<c\Øû¦z“¼Ë fq\Äo¾ù&Iú¼¼<\Òÿÿû¿ÿ+õÿ¾_þò±ÿó?\Ãþ÷\Ïø\ßÿ=ò«_\Ýk=(’’¾þõ¯Ÿu\ÖY4{wttP‘ý÷7ªCz÷Y5\à(\ãµ\Âv:§ÿ\Ù\ä?s\È>û\äö\ë7g\àÀö\è~û\r¹ûæ¤ƒú¬»\é€]÷\î¿kRß†¿\Üõ\èÐŸð\í#;\ç +\î\Zú\â\Æ\ÌZü\ë\×W=ðÀ¦7®\îX1bW\í÷w\Õ\r\ßUÿƒ]«\Ï^8\ã\Ì9ÿ\Zvð\ávŽ\ì{Ð€a¿øõ†WüdD\ÍEg[.€‹G\Õ]w\å\ê\ßý¢ö\ÆkV^aõUgU_yfõ•\ß[~\åwW\\1l\Å\ßYq\Åÿ<÷\ÄA\Þn,M¥“ý\êycfûØ¹£ß¾\ä\Ê\Ür{\ã­wµ\Üû§Ns0•º\äŠ÷Lýñ\å\ïOs”Z§4¾¤½{÷\Þÿ#~5\î\ÎE‹·nú\ä³\æ?Û¸©\áÓ²›v.ý\í~²±ð/\Ë7n_¶¡u\Ê;…$\Ø\î¹\ç\Þ#\ÔE¿\î+n¸\á¯y\än&H‚¹ön?	Iôÿþ÷¿\âÿ•]»¨GC\ßy*QH\ê8\ì°\Ã\Ê\Ë\Ë\åU\\3wnV`¸XJ\ì†.€\éÓ§¿üò\Ë|b‡\â)•O|÷Z­¯\ã\ätòóG\çg¦\âx\ÐÃ»’“‚ {™‘{Î®\å¿JÙ®sW\0\á8ô\Ð\Çgsœv\Ú\ìÁG\ßÔ¯Ï}÷½±\Ï>\ßùŸ=MÀ9Š\àÈ¯í±¥o\ß\Ë\r\åÀ\Õ%c\à?:ñ\Ì_ÿñ\á¢{_þ\è¡\×[{ÿ“\'|üD\á\Æ\'Ô½º¤\æƒÚºk\ê?\\½zFùŠ‹—¿Uµ¶|ck\ã\Ç;6|¼sus\Û\Üòšk~w\Ïÿ4¸\à„Kþ|\Ì\Ï\ï;\æª{Ž¸\â\î‹n}\æÍ¢\ê½Î¹\í”\ßL<\ä\Ê{Žýù½^v\×Y¿\Ê}»¤ö´_?z\Ü\Ø{¹*a?»÷\Ë\ï\Zö—§.ýû?ÿ\ÅC\'Žù-W§À—´3rhŸÍ´ú®\Ùÿ\àc¹@SøI\í\ØC\Ç\è34ø>\0\é\Øúñ\'›¶’wþù\'N¼\âŠ+ª\ê\ZdŒÓ–Ü¶\â©/½vÛ—?0ô«úù\Ícþð¥“\î\ì5\â½þ2õ\ë+¦<\å–þó?`Í´CW¿r\È\Ûo\Ú=û7þûðª6ù\ÏnýEß©°\â_ÿ\ê\å¯\r¾\×	\ë5øw½úþ¿\\W\0LÀKz·úƒúÍ­³§,\Î9ùIIöøUÓ›\ë¶ò\ÊÀNj.€§~û²©\çoþö}³&\çoi\Ù:w\î\\’ÿ\Îýÿwþh\âoºM\é¤`\å\Ä\ä.€dŸuðqòIªÐŸüˆýðö\Ûo¹\áw¿9{Ô¾3lØµ\×^ý»\ßÿ\ægc¯ö½\ïŒ<{ø\Ï6z\ì\ç_|Áˆ+.>\'.\0’s\×]w]{{{uuõ\ÙgŸm\Þÿÿþ×¿þ\Ú4yä§ƒ|ôÑµ‡þÏOý\ßÿ•^\0*x\íµ\×\Ò|\íÚµgu–¬*$\ï\ïsP\ë€c>0DZó€Á÷ö|Qü\èþý\ç~xq\Â><ôÐ‘a~B²O\ï\ÞÏŽ:pgöa»þv\à®ñû\íš\Ôg\×3}v½<°\ìž\Ó\ÞøÑ’Yg~ô\Þ÷>z\ï»\Þ\Öø\Ö**\ï»wg\ÙY»–Ÿ¹k\å\È]«\Î\ÞQù£¶ª]ö\ÓCBùŽ=\ë\Ð\\÷\Ëq\Í=÷ÌªF\ÊG\0j¯¼`\Ý\ÔÖ”U.nX´´n\Íò\ÅõùÖ¼0²\æ…\ï4¾<lã¿¿»\éõ\ïm~ó»M¯ñ“³<¿¢šJ\'\Ó¿«ýì’»þö\ç~ý—\'.=N–ºó\â‹.5ž ýû\ÅWL}€Y¡i|I\ï\ÇynVQý¦µ­Ûª6\×~Ø”_»¥e\Ë\Êgv\ÖL\èX“\×QxQ\Ý\ë¾»¬©´i\ë\Ô×¦?÷\Üs¿ø\ÛÃ‡	¹‘)n:ôŽ;\î˜3g)\áO?ý”c}‘ú_›÷\èôª«®¢ÀÁ¼mÛ¶¤H	›\Ï\Ï$³eŒz§]SËª,wn\×\ï\á\Èa!ø\Ü\Î^V«\ì†.\0úögeeñ‰Š§T>	†ðdV¡v‰¦n\Ìô\ç|)\à\0I\È\Ü.\0ú\ï\Ât”§\éb\Æ\äQ»–_—²]3f(W\0\Òÿ:\äO‡9î«¼ÿÿº}öúü¤“ž:` …O0\ßø\Õ=\Öt\àŠý˜.€£Rstö‰gý\æ7÷¼{\ëS•wýcÍ½/m¸ÿ\Õ-¹³?}¶d\ç‹¶Lž[—·°\æÙ¢•\ï¬X_¿ý\ÓÍŸw¬oß¹fó\'õ}PRõ\Úì…—\\›3ðsC¸\0.þ\ÓQW\Ý3øÊ»†\\yW¿Ÿ\Ü6½°ê’œ§»øŽ£¯¼kð•?öª»¾\ì\Îzêµ¹½‡;i,\åü»´c¨\ÈUw}ÅC®\âEA]\0g\Ýû¿“ú¿óúŸ4ôœ\Ñ\çd_q\áÿ]qQÎ•£o½jL\ÂF\ßz\åE9—_øÒ®ó3#ž”ù\âóoþþw~¾W\à;\å\Ò\Ðþ\é\Çr‡ÿñ\'œP\\\\|é¥—®ÿh£¹\í_µm-+Š¦ô_ÿ/]w\Þ\×Ruûñµcþ\Ð\ëô‡z•\×kü?÷\Þô\Ú\áƒú|\å©\ß\ï\×:\íˆ5\Ï:ü¸ÿ½\è;\ß\Üøò\áW|ÿ[\ßø\ÚõûJÿ}¾\ÜðÜ¡\ã^ø&\å?õþ^T¶\ß\É_\Ý{Ÿ _\é¸éˆ‡w|òù.\ã>ÿ\Î\Ï;\æ>[6\îx!\ïIÿ·nl±;;\ä»\0$w\Ý8\äö\×|Î¹ÿÿ–\Ó\ï«]Ü}\Ê=fYX@\Ñ3§n.º\Èt,øK®\ä\ï¸\à¡rBŠ.\0úK\'mü-ƒq9·,,Zðú\Ì>|ÿ#“&TV•¯]»f\î\Ü\ï¹û¶\ßÿ\êŠk®:÷²‹F\\t\Þ÷®¼ô\ÜoŸqj\n.€=pB0~s\ÆM\nÆ€þóŸÿ|ñ\Å“&M:\à€¤þ?\ë\ë__q\ØaŸ\r¼S±ƒ.\ÙsO\Êð\å/ù¸\ãŽ{ñ\Åw\î\Ü9nÜ¸\à\ï\Å8¤÷¾\ï÷;¼m¿cL+\é\ä\Ñûx~pö\Ù\çÝ£ŽZ6dˆ´Š!Cþr\àý_nð€>K/=r×G\íº\å\Ð]w ¼\0ö\Ùõl\ß]S¶L¾ðý\ÑoŽ\Üü\Î÷[\ÞûÁ\Ú\r3n\Þøv\Ö\ç\ÚUö½]\å#vUž½«\êœ/Výø‰{Ž\Ûo?¿\ï•J\ïý¸í§‡¾xý)O\\w\éÈ’ó¾¿\ê‚\Ô^uÁ¦²’Ë¶\\ÿtû¥\nû\Ã\Û+WoÞ¶ú\íó~¼sÁˆ/Ž\ÜU<rW\É¾(y\çoŽ\î\çñ«„šJ\'3uþ¶\Öš™I“Gú\Ä%G<9\Æ\ÒùSFš<ú\È\ÇFž<\æ(WýOÆ—t\ã\àcOÎž¾deK{KûŽ¬|ð‰ª¿þµøò©\Ë_Z[WðYÁ\Ù;gŸ\Öñ\ÆÀµÓ¾7kY\Ó\ìŠ\Ú\'ž|ê¡‰=6½\à\Ì\ën\áòƒd3Á\'1&¶@p0ø\íµ\×6m\Úôô\ÓO_~ù\åt\Ú?€—J\êy\ä(Š¡EýQøq\ï…óf¸ŒÙ¸q£¼\ën\Æ\È<tÜºu«™Îœ9”*Ã€0¾!\àb)±º\0>ýô\Ós\Î9‡O\ìŒ\Z5jÇŽ|¸\02\\\0 	©¹\08ä†™j\ÌIyš.fLþÑ®\ê_¤l×Œ\é8\è ÿ|\Ü\×©¿\ç\×\îý­O‡}ãƒ¯\Þû[W\ïý\Í\Ñ\ßü_ÿµ=\Z´|À~£\ì.€\Íû\î\Ê°ÿ#‡ž~Í¯\ïy\ç–\ÜÒ¿>]õ÷\ê\îy©éž—6Œÿ\×\æ\É\ïý÷_+v.Ý²cËŽ[?\ï\Ø\ÐþyÝ¦ö\êµ\ÍE\Õu\ï/ªxk^É¿ÞÁ\Ùû8ªwo÷}­¬\Î†^t\ÓQW\Üyôe·sù.¼õ\Â\ß>ú\Ò\ì%\Ç^ñ÷!—\ß1øòÛ¾üö¡W\Þ9ð\â¿ýó\Ý\Ò{Ÿ{ë›£\Æ\r¹B\Ä¾üJv\Ù\íƒv\Ïq?ù5W§À—´S’3¨u\âƒ\ì3yÒ‹Mk7¶µ¶·µ~Ü¶nÝ¾`þ\Ò\Ã;–«K†t4lZÝ´µš\ì¸ã•.€\ÊÕ…J\ß{\îLŠ4M[–•Ï¾¡\áù¯.\Ê\Ýg\Äw\á*\Âp\ÈE_|c¯\ïL\ìõ\Ý\Çz\Ý÷\ÌÞ›¦¾ï·¾üøoû·N;‚¤þƒ¿vÎ©\ßX:ù\à\Ã÷\ßóW\ç\ì½m\Úó<pó+‡\ßòô7)ÿ÷:ú·½~ÿ+{\í\Ô\ÃÁ.€\Ã\æ¿1\Òù\Â°zQÓ‹~W\Õÿ\í›?™ýxñŠ¹kø¼s.€¿žõ\àƒ—>õ›\Ão•\Âþ‘+ó\Ôýÿ7~\ë\ßGMª_\ÚHùÿrj\ê.€c\Üÿ\Õ;¿ù\èwŠ^¿®ô\Õs\ç\Ü\Õû¥?\îs\ãOöO\ë/º›\ì?fÈŸ^x\áÁ‡6ô¸¡Lz`úô×ž~&\ï\ìýò\Ô^}zCCÃ˜‹\Çü\é\Ï7f]sÁ\Ø\ËtÅ˜‘ÿô¬Ÿ]~þÉ§œœÂ»\0\ä\ï\\\Ê;\í‰mŠ¡6\È#A‘Æ´a›7Þ¿þ\0i·ž½ß¯\Îøý ~A_ºvøá‡—””|þù\çW_}õ7¾ñ\r’÷½¿ü\åW\rúø\è£?<X³mGusŸ>_5\Üýúõ»ñ\Æw\î\Üù\ä“O)\à\ÉûôY\Ú÷ˆ\Íý›ö¯}ñÿ\Ø\î?ì°šN0\í_GüY€3\ê\ßrù±»~5d\×ÿ¾\ë™A»^9h×ŒCw½vð®©wýûÀ\Ï^?i\åƒ÷Nûq\ëôn~\í¬õµO\ßöÅŠ³v-ùÞ®…\ÃwŸ½k\É9»VýxñŒa\nÚ»>ƒ:h\Òå‡¼xÝ¡ÿ¼\î¹\à\íQ\Ã\Ê/üÁº©ÿ ý?ú‘öŸ<(\ìü\ÛÏ›\Ð~\á\Ã\í%+>Ú±ü\Ö]K~¼k	]‹ì‡»JÿÔ·\Ø\ßýršJ\'3u~E\å²\Ï?ÿ¢½ýs6“.¼ô)ù €i¿Ë®7 »òò×µj\Éø’v\Ô%w<¾ì£¶\æö\ë·\ïxqÕƒ>zû\á¥¸\î}e[Ê«\n\êÞ½®vúO\ß~\çùYEek§ý®hòÏž\Ì{ú\Êuw¾Uz\Ðq•šR0a½\0ç–€\ÙT.»\ì2R\×÷\ÜsÏ À?ÿaô@ {A3þüóÏ§ÀK/½$•ÿUW]•ôY\0/€ù\Ú<3†ò\Ði]]\é\Z\0NŒO&\\,%vC\0}½2´@sñj\èj©¯Å©\Ä.¶­xw.5°™Ë–Ç­¬\Ì/\Úb¶\Æÿ2+“h¿R\Ä\Û\Ça•´ªu¿–Z=¯wSe”\ÌcF»´ôp2\ç\È\Ô.€\Ç~¸«\êji_$µJq4ó“]3:¨†$ö\Úk/±V>òH\á0¼\0W\ïõOŽ>ú¿†Q`áƒdR\ÃþûWõ\ëû\ã¯\ïiº\0ÿ\Ú›{÷¾|¯½Â¸\0†=ý\×ÿý­¿<¶\èÿ¦,½-où]ÿ¨?u\Ý}S\×\ßûò†\Éo·\×lúbË§\r›\ÛW­\ß\\V\Û8¿b\å\ì\Å\Ë\Þ)\\òú‡‹^~§`\Ô\èø\ã.€~w\ä¥;ò’¿y\é_‡\\~\ÛW\Îü\ã+sJŽº\â\Îc.»b„]ò\×#F\ßú“?>VZ\×|Ò•?ô\â[’ñ†qÉ­G_q\çq\çequ\n|I;mXuÇ úö½\èœ?½\ìo\×^q\Ç/®ü{@»ö\Ê;)ÿUcn=ä  os4\\\0\ÕKK\Ö|<™l\èñGIÀ‚E³.ýƒs\Îÿþ3/<$s\nþ½ú£»–½<h\íó_šó\Ü9\ß9#•÷Ÿzùƒ\×\ë\Û\ã{þ@¯{¦°`\Ìw¿y\Ï\Õ}ÿzù¾÷\ßóœS¿Q“w\è)GüÏ >_É¹l\ßUO\Òö\ÚÙ¹ß¤üdGýª\×£¾ü­}ü\ÞB§\ât\Ì±¼c§¸\Õ/\Ä_òü\ç\Óoúxù;52’\èŒ\à\á+žnnØœû‹Ty/\í·G\ÝöR\Î\ë[Ö‹¿z¢3.\0\â\Äcz\ì!§v\Ú\àýN>æ Æ­ÚŸÿú–_\Üx\Û\Ï~u3…\Ï<û‚‹¯¹QZÿýR»;ý™¿ôÿ\í	\\L\Ý\Ç\ß7!K\ËÌ´/ÓžV­*Iû¾§E\Ñ&’-\Ù+Ù²“D	\ÑKÙ²†d¢EEhQ$\áMY^Ùšÿ3so\×4M5\Ó\â\ï}\Ý\ï\çù\Ì\ç\ÜsŸs\Î\Ì43\Ý\ß\ïž{\î¡C_¾|		URUuquZ¸pž†¦–þ\Þ\ä\Ýs\æ„\Ì£¡¥=\Ñg|ð$\ç\0ok\Ä˜\è\åØ›¶˜À\É\É	\Êô?<°	¿\È&\ìE|$sÈ!°kŽ‰\Ð$}\í\Éz¬j$UU\ÕGUWW›››C\ç \í\éðNAi\\&“¹i‹Àp\Î\Î\ÎpP—žž\Î\ÊiOc‚@Q¾ž_‹\å¤nÜŠ‰µººXhjJ²\ì8\ØI‰|÷Ô¦ø«S\æ*R-€”³²”ËŠ”\ë*”\Û\ê\ï³\ís\ãSö8·\ì³{¿Ï¼!\Í\åF\Ó%gJ±\åš\å²\åº-\å\å\Ç+Y)\æ3§:Â¯.-±\ËWrÿd¥¿\ÖúZ\Üôq}ZT´»MÿGSõ¿\ÝFjD¤¾o|z±µ\Ð\Óÿµg\r¥:Y}€A¥C`:‰¦\æ\Ïô\â‰ŽÀœˆgô\0C·\è\í\áu\\Wó¦\á\Ã\çºw-µMŸ’nY~\Ç7\ä²C\Ò\Í3wk\ß\Ô5ß¬zs\éAý¹²\åc›R\'V.S8}0\áTÉ‹3e\ÏGMl\'x\Ø\Ñÿðˆ\Ð,€ü¶À#S€¾\Ì\naaað\Å3f²\é\ä\ä´w\ï\Þ\Ê\Ê\ÊÏŸ?#5LaÛŒˆˆ\È\ÈÈ€‚ƒƒ\Ãýû÷¡\0ÿ¤º}JY\0PS\Ðv\ã}¬€l\"™87\Ý\î4‰\Í½µ\0ú›X\0Ç\ïýZ\0TýŠ)d\Ø`Ô·\Ô¢q\Ûö\Ð\Ôl[\êÖ¤]_ˆúE“¨)ô1iK«\Î9Þ¶ƒ•!hõX:$–\Ö~ƒ¾\ßð8¤\Ð\ÙX¾q\Øó¡ï–\ÎðT±‘|\ã\â¨%Z][§ô/¡ÿ,€~\âdœ¥\Ô\â{\ÉÄ¯\Å¾Mh)ôfÞŸ½!\á\Ûý‰Œ´\n§Œv\Ä \rR\Å\Ä>\ÈÈ¨\"\0‡?÷\ØL\"\ér\r„\Ð\Ì	•*\\\ÕB‚¥$\"f\Èsq\Èpq¼\á\ãc\Ë¥Z\0“¦¬8=oë­°\í÷\"w—¬\Øûx\í¡ÚG\ë7©;\Ýt¯¶µ\áŸoO\Z\Þ\Þ{R{«ôÉµ‚—\îŸ\É\ÎOËºu\à\ì53»i¢â–¬[\0*N3\ä\Ü\"\å\Ý\"\Ü#ø:Î‰\Ù|\ì\Z\Ù5\\\Ê5\\\Þ#B\Î-‚º\Ë#‚_/\ää’U‰Ò–Jôq\\¸\Âø\åªöAhwt C¶\ç\Ó6ò\í1#³¬\Ìüúº\×o\Þ45þ\Ý\Ì4þ~\ÓD‹v5/\ëÿ.¸ûpZUû±bd?¹Rù1\nBu¤b\ä?]–rzR\\Ê„²\×+Â£·«K\n\ÇÕ¦p\ä\ÅÿQ’—¦¯¯‡vÁ^‹\í\æ&ømËŒÜ‘µô\Êy¯·\'F¹pøsðÀ?qþ\Éñ\ç¶:ÃšÉ¥/•8óO-\ÙÁO’¤3.@>ÄŒ/›\Écy	¬®A\Ð\ÑX>:©<ûi+\Ý\êeW*W\'/P¢ªý>´\0 \Üò\ás\ì„$z…‘4ûð§÷-´¨ô\Ò\èQ1‰\ÈU›w»\î7=d¿ˆ¨¸ú(\ÃUÛŽ„®ˆ÷œ‹&±	|\Í\ç/\\”~ö¼µ«›¶ž>‘HX½zy\È\ì\éK\"C£££\â·ÅŒ52\Ô\ÑÕ™5\Ã?\È\ßÁ\ß\Ë\Êkœ™‡³‰÷x\'aQVOv±\0\r\Z£ƒÚ‡M\0?ho\Ì0`\0”‡\nD~IŒd†ú\è\n®±Ž¥u\Ó=\Z\Z\Z crssuuu9h\Ú^—‹ë…œ\Üyy¦Q-+K0\0\Ò899MMMA«\\»vMX˜U‡Åœ¿š(WK”\Çb_7Wž[ˆŠ6Œƒ\Å3==–-€`²\"\ÅEŸ\â¥M	P§„(Q\Ö\ÊRŽK<©})*z\ë”›\'¿Šõi‰÷üº\ÃùC¢å«¤±%5{ü(y\Z”«ú”“Ö”J©1¥\ÐVŽe€¤%KN@,\0£\Ø	YA\Þw\î=óŒû¡ÿ1 h×‡\êÊ’\Ö\":À\ì\Ó-SY\É_\Ô +k\ì¾Rø\â]Kýù3/®fV½~_ô\â\Õñü’}Ù…\'\ïV\åÕ¾…¸Y\Óx½ú\ï¬\'¯\Þpz™`viÿ…\ì\Ô\Â\çYO^\Ýó“\Ï²Ÿ]\0ùmG¦ 9\0\Ãf×€œ~þü¹²2õ€Dõ7\Ê\Ë\Ë/^\ß#¡¶µB™\Â0¶)))‰•;:†f¸—>€þŽ\0›\Z€,Ë‡Ý«y\'»¥¹¹¹¬¬,;;;22288\Ø\Î\ÎN@€\Õ_	Œÿ\à,\0gg\ç>¼#@{MM§¤©\Ò\Ý\Ñ>U¾´4º|*tm~ð#»mI\é¬mû|–†`\Èbh\ÒI#&•\ìŽ\Õñ©2\æGN\']\âü\Îô«\Ð/wˆ3¥”NøV\ìõ\éž\ç\ÓÛ³n_	»™–“¹ˆiÜº–›ö<wZKÁxhB)ñ§„v\Ä\ÔÓƒ\"\"ï¥¤@\ä#.€7\×;qñ/\â@@=\ì­ Kxy­¹¨\02@š‹\ã\r/\ïxv,\0aq\ã\ZÞ“Wœš{c\á¶;;\n—þõ`\Õþªõ‡\ë6­ß–Ñœÿ¬õUË·ò¯sVe—_\Î/9w«\àôõ;\Ç3sRÒ¯Œµ\n7#°|S@‡`\Ùq\á2®\å\\ñX\Ì^¹kõ_\ç\Ô\Ü#=\ÃÄ¬\çB¥¬\ë\"xp˜o\æ»\êRÁu·p\Åq‹\ä\ÇQ\ë!d\\\Ê{Dª\ÚMB»£²=Ÿ¶‘³‰j\ÔZ½,iWBÚ¾=‡R2YŒ{\Ï\ï\Ùu:fý;+?´»\î@,€3÷O”¾ó€P)X\09O]r*|³\Êü¡)”4Ž»›Jz’ô\Ç\åcº5µOõG÷\ä\Æd\â6œ¹t\æm\Ó\Û>¼°\ç]š\n‘{@\ÂÁÆ£rU{\Ð\Þ—ƒx{Tv\Ód\î!K¼ˆ*OA>z*5ta(\å5µ;Z\0\ë,÷UÝ­£_ÿ¿\"÷Y\ì¸#•©w\n\è[€\éúÿ\ÛS\Z_4aDŸ[\0¾\Ó\Â@ÿCa]\Ìö\Ä\ÔË³W õ\0ˆÿ\Æ\æ÷rÚ¸úõ\à\â|nnn…JÆ¦\Zº£eyx¸\'¸™/ñZ2>lŽÏŠ\åó£¢\Â\"#¨WŒw5õñ°€G?o{[[s‘^[\0ˆ°±\re\äŠ\0z\0û\é€d$\Î5P]RqÖ˜\Èf· @~~¾žžbhsqU\È\È\Ô\É\É1ii\Í€\çfffVZZzõ\êU\Ö-\0S>þG|2•9,fR¯÷\ï\nG	‰·\Æ\ÆX\Ô\Éð3\É™%®B±Ku\Æ\ëP\ç©|JTJô\ß>\×\îþ\\Ïš…¾¯#ýšVy½vjŠµ¨‹Uúh³?%K•’¡KI¶£œ7§\ÜÛšm/\'É† ¾ÇŸ¼?Bb\ß$ˆˆÍ³ò\ï\Õxnmwþµ\0v¨©,n-r¦·\0\Þ\çÿ²€û¤\Û5\rgN¼?œÔ¸tfuØŒ\âºæ’—\ï nV¿ÙŸú¿\ê\ï\Ì\'¯nh\ÞcYµR5s•\ë\î\ìŠ}÷jÏ•¿;{\Ú›0ül¹\0\Èo<2\É6»@EE\åõ\ë\×Pù\×\Ð\Ð0o\Þ</‡a\Û\ì±€\È{t»}\Íz\Úø\è-\0(Àf\ÇLxÃ»¦¢¢\"::zqššš†††...QQQZZl\ÜR\ZøZ\0¡¡¡oß¾µ\èÐ¡©S§\Ú\Ú\Ú\Â#”¡¾!h\Ë0\ÈVL\Þ\ÒkUeü£‚Ú˜¦\ZøG%¦ˆ;m\Û>Ÿ¥!\Ú?Ej†ú\ÝÔ\Úõ\Ö\åXh6\ÚYÇ§\Úñ©µÏ¡nu|&8¿5ýjô\àG©[N\Æ·{~.po¼\éº\àx®Ù®ªnc\ã©ô\æ\Üq_\n<Z\ï{¸*¢±\0\Õ|G&+\Òt>„\ïðAo\ãy†òGÄ¿2\ì}\Ì\ÃS9|x0u-\0d\n€4\Çkn\îñ\Ü\ÜlX\0¢c•´ý&-=>{\Ó\Õy[o.JÈ\ÜU¼b\ï£5Ÿn8ò\"¡\Í(«}y³\äñÕ‚²·\ÓiS\0Ž\\¸¾÷t¦ž±¿°˜	\ë€]´\Ë|§y²\Îóx¬f»†nØ¼/3ró±õo\Õ\Ý\"$\ç\É8SC\Ñu§fÐ¶#—6&žRv[$ 7MZ9Ï“vš+\ã¦j€vG:d{\Þ\ÆJT®›»mË‘\í[\íÚ–\Îb\ìŒKK\Ørt\íŠ=J#F£\Ýub\ì\ËKºõ\ÆBYM\n±\0.<±Gj°È¹9òA\â÷R†¦\\«©yª¯\ß`A\ä‚\'¼lx\Ù\Ô\Ô\Ô\\ºû]šrÇµ\0\ÊvJ\ÅO¼#‘<O˜\Ä3`\Ódþ\æ\Çiÿ\ìÅ³\ä#\Éü\'°¾\èZG€¦ÿ©òû\ë\çoH\rl¾yÚ”±1\'B}gZ\0\×ÿGb†ü’\î;\ë½DF\é ¡,n<Û€_¨\Ý\'yJ\èòMñI\ë7oO>zqUüQÀ\Zx~\äº\'\Õõ?}KÏ®ž\Ìö²dð\r\å\æ\æ#K‡\áò÷²ž5\Å%dªkH\ë\Ì).\Ó FSMNH€o¬¾š·›E€¯‹Š\Z«Št„\Þ€2@Ÿ<˜þB€AƒA†ŠY\0$\î¡þ:\Þ\ÂüÝœZ\ÇPVV~ð\àA}}½\rŒ\Ú^z\àÀkdr•Œ\ÓHFs\n`\\wwwBiii¬_0š?Gú!\ïX\Ê\Û\Õ\Íð9¹,,°(c(Eb\Õp’ýfhEuœFS<GQ|4\ß.\ÖY\é”hq=Ðµ0hÂ£«\ç{\Ö.µ{º\Ú\èqô¨œ\Êõ\ã(\Ç\Ô()cZ“¬)—õ[¯¿<`+-Î² &%¾s‚ø¾Iˆ`²oVQYñœ”÷öm\Ê\ßv5l6|Xöþ]uZk¡\å\è3$*N–gþÍ \Ò!\Ô~[\0Ó¶{ô\ê\ÃË¿â›·¯{=Å¹\Â\Í\älamqý»\Å\Ï\Ü\"¢-§-^q:ÿFõ›s_¼Hø÷^\ç‚\Å#w§]Ü™Sµû\Î\Ó#…5:>=™†Ó…\Ôg\Ý@~[\à‘)HÀ°\ÙÇŽ‹¥N´\r_P€P†oAXXX~~þ‡hY\ÌaÛ¤¿ ¦¦\n½¼\0\Ê\È\ÅÿIIIH\rC2nt„ú	 n\Óñýû÷³gÏ¢Ò¿m\è\é\éÍ;\×\Û\Û\Ífÿš€\èxtvv>q\â|òZZZ\ê\ê\ê\à?»\çÿu+*–\Û	\×º­‚¹\èe \r\Üi\Ûöù,\r\Ñþ)2iB¿»=\Ô\Ñ\0Z~§cQw´\ë-³òT;yù88mô\Ì\è\Z4\îŸ_rr\ë\Ø\Öb·–»®\r\×\ívl¯\ì6¦¦\\l\Ìqj¹7\Z¸Ž@;bª  \Ð,&\Ât>¨ý	\Ã½!¶‚ˆ$`\ï\Å\áC_²j\'¤\É\Óô?Ä«a\Ã\ÆÎº \"f8Bc‚ÿ’£!/Ï‰\Í^Ÿ±£`\Ù_V¦T¬?ü<\áls^më«–¯\ÅO\ë®=\Ì\Ì+>{ó\î©k¹G/\å:w5\é\Ä}\ã\01c\Ö-\0%›@i\Ç9ÒŽ¡#\\\æQõ?z%ÿä¢´k«v¥“\ÍfJ9PwÁ\ã\ç¹\nna°7³¨bÖ†}§*¹\Î#Û‡È¸,P¶òE»£²=7\Ã\Å>Ä“õ7m\Ø]ûôeË§\Ï_¿~\Ã\âË—¯X\Ð\×#•ÿ|üt;§HB‚\å\0<|sý•3„²šTnqÚ…*—k\r\ÔM,®\Õ\Ú\\\ÛÁU·\ï—\äb³–ö\Ø¥7\ê¯C—¿yó\æmq\"S  Nr„\Ø Þ¡Ã¹8\Ì5†\Ö$K7><ù¹ws“&›³þQ\éh g\ß\\©\Ü\æ}¼©þ=­Ž\Ê\×\Ï\ßòŽ—=Î©E·{g„^O¿þÿ\Î\àôWL—Y<W}eù­J\È\ï ­%iµØˆ_¸ô	[·\ãÄŠ­‡#¢÷J¿v\î\Ú]=CsdWHøºÜ¢ŠWo¿\Ü-ÿ°,ö°¹KOy¹¹¹€\Î8p´¾fø¼À`Ï©þS|\í|=-\ì­ôGª\ÈH‹ó\Ï5\ã™a&0\Ù\Ó\Ôp\ìhQQqh\ÂúŸŒD\ÒCsPþðˆ\0\"¦\06\0€_!$©™¦\ÊO P\ï¾\Ç òòòZ[[\'OžŒ\Ì2\ÎÁ-(ø@Zº¼CIIùñòrÒ–Á3o\Þ<h˜À\ÏòiyU>R\Æpr·‰<¢]?×ƒZZ_ml°¸ £\'\Æò\"‹\ézu[Š‰)\Åz,\ÅÉ€\â¦\Û\Z¬þ—ÿ¢‰cO{\ÛdMp½\í\ïV0Í©xžy\ábÝ¼­G×›P¶k·n1¦¤\êS2ô¾·\È_kAaõ\Õ\ÄE6¹‹¥`!‘°þ\Êþ‚\'o\\b~œÿý\ïó¡ð\Ñó\×s©S\0h«\0 À\Å\íZb\"\Ì_ƒJ‡@D>ým,=SX\ÕøÏ“\êºò%óž\Ú\ë¦LO§Y\0!GóD%ˆü&¡\ë\ÒK\ë®\ç\Ýx»ß¹n³þ\é¸ù±J\ânT%\æ>\Ýxñ¾œ¡5\Ú;477w!òa$ ƒü¶À#S€¾\Üjjjð³L&“	Bnn\îÂ…¡RQQ±¸¸øÂ…ŽŽŽ]/\rˆ\n ¯\nX=rÀ>Y«\Â\'\ZH\ÍÉ“\'‘\ë Œ[\0¡ýe˜C¯ÿw\í\Úuûömø<}úõ\0FŒPUUý\Ëú\\€ÿ”€\ét»/\è [i7¼Km‹m³$h;\ÑÀ¶\í$¿kh\Ï\Z\Í\êØ¤}—hk\Ð\ÙX\í›\ÓeuºƒVrp~kz`°N~”º\å\ä–1­E®-ù\Î\rW\ílY²\0‚’/4f;@hàª€v\Äpð}€Dj‘\Æ`\ÙAòƒPå…ò ‹AFÁ®¶)\0T`\èP¶,\0a19Uÿ\È#37\\\n¹:okNm\"Àò=\åk\Ö$œm¾S\Û\Ú\Ðòµ ¢6\ë^)m\n@Þ‰+·Ž\\¼~ \ã\Ê\î\Ôu½„E\áƒU@\Ñ&@\Ê>D\Òn„ŒC\Èpói\Þ\á[N\åóš\ÍÜ°\ï\Ì÷%’v!R´½dx´9L\ÞWo\ÜÂ˜¤C«w—·%\ÛÎ”vš«d5\íŽt\ÈöXªò~Œ#\'LTW•qW•ñ\ÐTð59o¬úü¶€2ý&5G\Î\×Qœ¢*\ã	ù2\â¦ðv¢\Ýub¬¹¸ôøS»\Î\Ãöô¥÷r%J+4Xv~öÓšj½Y\0j#\Õ\âw\ÇK?ö\âÅ‹7¥›O\ël“v@±9M¹\é¸òý\n’Þ¥)W%\ÈX)}e½\ì«\ÃJ\Í\'\Õ_?:÷\ìÙ³Ci‡¢\ã£G(`ý£‚X\0s\äcŸ¿C\Öÿû\ç]\Ë\Ù\è[\ájTy¿eÜ‘ç¥¯hT¾o\Å\Özc`\nÿÊž›_¿|û»\î-ý= \é®+ºô`¾\æ*¬‚-@@T@F[ŠHbTJ~\Ó#<\ç[Œrˆ,)¯Ê¸vo´‘¥°\àÌÙ§\Î_Ü’|aù–#!\Ëýe•	\ì¯\Õ\ï?ˆd9=]\×Y\Ó&LŸ\â\ä\ï8\Ñ\Þ\Ï\Ë\Æw¼Ÿ\ë\Øp\'rŒ+qºa¤¬°¼¼<4B÷Pþœ4°M¤\Ð\'€’?q\âÄ·oß’’’¤¥¥‘kT\Þ\',|OR²DJ\n‹|I\É-Ý¶\0|‘AN´´´0\Èv!a˜h\îP‰\Üad$Ž\rÁ\Û\é\ßB^@ \ÆÂ¢\Õ\Î‰ovvQ\ÊÊ¬\ßPžWô†˜S«¾5\ÅØŒbiL±Cq\Ñoš§\í¶\Ú\×(\Í\Ëôœ·\å¥\0\Ó+3ô®,\Ñ:u\Óce™6%JŸ?Š’<ŠrHÿk¼C\ÌøQ‚ü,TI\Â\áv¢4ñ/š\âO‹\0…CÓŽ>¸~\íÁ«ˆ\Ô÷A»¨óÿW§½\Ï{R¿\ìð§|[:ýoú-\ßdq?‰ù«cP\éôR\âöW§2j*û\ÐXs¹¼\â\Í\ÇÒ†÷÷ž5¦\Ô¼Yq\åqÃ½\çM\Ë\Î´¯d\â´\'\ëBù\Ëû\ç75t/^©³-õä¦¬\Ç³ž$\åV{l>F\ì\ê\nù~…\Å\ß\ÓV¬Xq\è\Ð!(¸¸¸<|øD\"			Ý¿\íÚµH+`S…š&6o\nˆ­\0ÀW²£°‡Júkþ×¯_f\Óò‘Jô}\é@EEªþi 3§>~üHo\0zzzQQQ,®ðß±\0fÏž\Ý\çú`”÷ˆš\Îi\'™©9?²¨[˜Š¥\í\ÂR\éV\ÍûA§\Z¸“¶\íóY\ZIúÑˆ±	S\Ù~¼-\ãÇˆ\ÌÇ¢\ï€Z\î\äB\0†\æt\ËþÈ¡\ï\n‡Æ¿oÀ–Ñ­…N-y\rY\Ö6‰E\Û+H=vôDØ±´pˆ#\Ç\ÃR-\Âv%ŸoÌ¶m\Éw€†.p\Ô\Î*<<<ûˆ\ÄFAAzµ\Ï4\ëÿ‘%\0°x9x°\'\Ý½\Ý\"$ª+«\ì\á™:}í¹\è\Ës6_[+|\ç½%»KV\í¯L8×œ[\Ó\Ú\Ðò%\ïQÕ¥;\Å9wO^½}4óÆ¡sWSN_\Úy4CE\ÓSXTŸ¯“[p#âœž–¾d\Û\éd›idxœ.i;C\Äjšˆý,\ëi\â!V\ÓWI9†À^It\ït)»6Ë—FoË¸}ÿXV>¯i´\Ãl%so´;:\Ð!Û£¯@¬^+ñ÷f	mY!²\rHz5YO]\åiÆš]„Z\èHY/HV–r!\ÙX€±\0ž\n‰/3\ï,v˜^L‘|¸›3\í Ð¶\ÓY\'|Ÿ\ÖT\ëö\Èœ6gg\Ê\Î·o<¯yR_–^_r¼›(KV[uùú\å\Ä}‰3\ç\Îdý*\0\0±\0 69:½&»\âvmò¬sajÛ‘Jˆ5f)²ª‘\ï#½·\0\Ö\Øo{˜SQ_W\Ç\Äpdüª\Ã=j¯™Ag\n@°e€þ·_m.\Ðù¹Ù‘Ú£\ç­Ú•W\\~õN\éò¥s/\í²Y½*l\ê\Ü\Õ#F\ê‡D\Æ\Î\\–·ï¢¾361\à+\nœ@$ŠIHh\êh›˜[Z›::X¸8[›[›ki©)ˆó¹kÛ´\È7#\ã\Ì\ÒeK“óhû_ø\\’Ç²ðTÿ¤\ä\å\äœ\ÌË›\",|CBâª„\Äv!¡	\Ü\Ü4ý	‚‚‚,hnn~üø±¦¦&\Úkø¸8X\ä*——‹¸r3\Ùð‰_®¢ò\ÉÆ†bo\ÄKKKsqV\ïwùˆù¬\å<)z\ÖCsŠ©)\ÅÊˆ\â0æŸ‰c²¼&­3ß´\Èd÷b\ãÄƒ\æ\Ë;ºÔ¥„jS–hS\Ö\éPbõ¾m0{µ\Ð\ÅQ]\í‹5ø4…ÿòNöIñ\ÇBrÿd\ßK1©¥7.—?¾TþpWþ9·£Ë«o:a\'ÿ >\Ó\ÐT¯\Ó\Ë\"T:ƒ\Úg\Z\ÝZ\0ž\ã3º…@‡lÏ²Œû\å¯Þ—5¼Ï®|±ÿ¢\í´ÅžK¶f<xqùÉ«\Ý9v\\{x²¤\ît\á\ã§\'B^n\ÕOž²:£xU\æ£\èkO–¾«b\åŽöòÿ€ö\Ã\Æhƒ.¹|ù²’““#\"¨?’ðxñ\âE(\Ä\Ä\Ä|øð©yÝ\è†Aas\âÄ‰P””ljjB\æü:`öƒw\0›UUUô÷@A–!À\Ê\Ø\Ô\0\ê™v‚5\é˜Àt\\†n™\æ°\ÒCG\è¯ÿ\Ç`˜€\0?§vvvhw]ò±\0@ÿ766\Â#º\Ýw´\×\Î4:\ÈT\ÈA& ´Ï§\é^f\ê¶+\rÌ¬mû|\Z\Ý\rP[QikÙ¶M…yºú¦cýÈ…*\Ú\ÛA\Û\ÑõSE’\Ú\çP·\èG\ÃÁù®«\×Z`\ßrÇ¶áŠ¥õö»£\ãË‘¨»dñ6\Ûú\Ãm›·lþ¾n›Ø® ¿\Î4^·jÉ³…†.lðQ-\0>¾¿I$PøšŸ>`¯<\Ýü$¤¸8^\ZÄ–  ¤,.\í\ì²yfô\Ù\é\ëÏ‡nÊš¿õÆ¢„;‹W¤<\Ú~®\évMkÃ§/·TœGV¼róð…\ëû\Ò/\ïI¿´j\Ç^²Œ³ ðH\Úq5PuN\Çó‰VÁd\ë©d«¶°ž*iC­‘´³\n–w˜!n„ì’²	\æQ›q«ô\êýJÿEÑº\ÞÅ­‚$\íf*šz¢\ÝÑ\Ù‘oÿ\áq\ä\äIBB#U¤\Ý@Oe†™\Î\n¦1Vc\ÑH9oHƒ1\æ\æfCh!@ða¿¥ùc;‹\èVw\Ï\Ì\ÌM\Ò\ÝrQ6}8õ\Ø\0L-Lcw\Ä&N.{PV\Ã\Z%¥%{\îIØ“ ¤¤„\Ì÷f\Ì€X¤²=R;Yö>Ö˜¥T\æ£\Ð\Ó3\à\Î\É\Â\ÙJ\ËA\Ì\'…n~õŽ|}}A(ššš>þœ\é=\èƒ-€H\"Rõ—–ˆª†ž×Œ•o\Z›³nnY¿y³0UØˆˆŠ»Mš•¸q\ÇQ$“]`x\Û]ú‰$’8YRBJš_@\0ª\Ð)ú<\Ã=<]·mß¾#Á\Ï\ÏOGG‡-\çg¿?d2ùÐ¡Cß¿?räˆ¾¾þÐ¡C`\àŸ\ã\à\à\ã\à\à\å\à\ÊÁ\Ìÿ‡]ð\Z---‹ŠŠ\à\Ãe´/\Ö\å\áM\Z$ta ;	J0û\îª	\Ý71Áô?\Ä!{\Ó7FóÉ—ó}TvkÕµ¥Œ¶¤™Q\ÌM(VF\ß?9\Zt1þ\èjô\ÅÍ€º^\àm\ÊdJˆ.e‘\Þ÷£‚\Ün{\ÛK°ù\êøIB\ë\\„“ý„’}!°‚HŠŸÔ)r§\Ê\î’\Ø\á·\ã”k+u	ÀúŸr\Ï\ä\Ì-AN_ƒJ‡p—\Ê ø\Â\Æ\åd·@¨\ç2†n!\Ð!\Û35\îHa]SjAÍ„ø“’j\ÚD~m\'Ÿ\Ã5g6œ.{y¢¤>µ°\îäœWû\Ý*Wª¬=xnÙ¹²5—\Ç]dº†_¸›þE¼xñBE…z\ÅYee¥®.õ\ßA~~¾££#>þ¿c]¯@O\ÇY\0 hûc½\ä\Þ\0b»®®ú‰°	Rœ\Þ€\ÂÃ‡!YŒ\àÑ£GHC\Ø•K–,C\'X“Ž	P`—i·°‹>‡\Öko?üš››\Í\ÇÃ¨Ð§ú¿£`hhŒ¶\ï’\ÞZ\0ÀØ±c\à³rð\àA\ä\ãO·3&¬ÃŠ\ÐúŸ9?$.J‡\nœ>\ã\ßgl\Öl\Í7k¹mÒihwS?ö>//~\Ì1þšgú\åŽ\éûlc\Ø\ÄvM\Þu¢ñ\êXh\rœ¥ÑŽX\0\Ä@\n/\ïÁzð 1°CpZ\r¢†\å N‹A,¨\ç\äô¤\Ý\Ð\í®;ˆDQ	+	\'¯\ÈÀ\åûgFŸ³9kAü\Íð\íù\Ë÷”m?\×|ûi\ë\Ë¾Ü¸_ž‘“Ÿvõ\Ö\á‹\×S22cöœ¿FNyœ¨„-±ó[p£\êœY³	b–S\Ä-&KXL\éd\Ë)¢\æ?vÁ&Ád’¦[\èÁ\Ì;Q‰G´‚\ÈF“\È6\Ó\äY¶\0\0Tw‹\Õow\×%J\nk«HC\ä½\æˆ\0CE&\ÚKMuVPC{™‘fø(\å`5\ÚüUwYqó\á\Ã	lk¥Z\0x%;\Í\È\Ýiœ\Z½c{|º5²\é°{lo,\0xz^½bwÆ¦¦¥Á\ácTTT¦NÙ”°\É\Ö\ÉD\Úk\Ð[\0]\Ä*£½®Vÿ\Þ\Î\è°mÛ¶×¯_7½zwe\ï­w\ïáµ··G÷ÑŽR\n\n\n:^@lY\0²º\Òn\Û\ì\Å¼÷ºÊ–ñHt6š©o¾À\È9\æ\Ç\Å\Æ\ÂB‚3‚½\\\'G”V¤_¥^€\î\à\ã‘ñ\n\\ \Ü;MM\Ä\0\à¯ e\0ûBACC\Ã\Õ\Õ\n‘š_8n†\ã\éOŸ>%\'\'A\Í\0\Ú	899Aðƒþ?yò\ä×¯_‹ŠŠ\à{„ôÀ£†r\nœ\æ\Âb=—€*ñ\Ç\\\0Ÿ² \àV:ý_gn1F”ý¿\Z\Ä;º’0åƒ²ûwm‡V=Š%e,mF€…1u\0;CŠ\ÃŠ\ãhê’\ãFS¼\r¾û\Zt\×\à\ä\å:‚\Õa1š\ÒqžˆòGB°-öúð\'M0\ß\ãñ6Ï–Aÿ\×]c¨\Í\\{#0¨t¦±\ÚY\Ý\Ô2\Ü\Ä2	3\ë\å>-€°J\ï\Û þÝ½®\ÎôÜ0Nš¡t\Èö\ÈX\ÍX®f\ã	\â6…$e‚bS3\Ô/y‘Zô<\åÞ³]wž^:—ü*NÿH\ìœ\È\Ó\Å\ÑW\Çf=°‹–fcnÝ¯OKKb{\àG\îÿq\Úä”˜˜˜?²8 kjjj~Á)\0Ø‰}øÀN¶C\áÜ¹s\Ø\íP\à7o\ÞD\Ê\0ü¼`Z\Óü\È&C\0K\èl\\ún\é\ë\éË½”uYYYGý0µ\0455###\Ñ\Æ]\Ò\0S\àG\ÙÁÁaÆŒð\Æedd 6\ëÿ_1X±\0?~üóô?³óÔ¸€ƒ\ÓôÀøÿ’´D\îKŽFK¶ú«óª1Y£6\ÞE6ÿ¹®þý–Æ·›\Z®Žl8§Š\í\nL8\ÐxI­\å†ú\Ç\ë\ê–lb\Â!~\n7÷kžvÁ\Íý\nbøpj\Ñ0thÃ!\r\\\\/~9hPýÀ þ_ð‚ƒƒ-\0Ž-A\Ã‹Ž–vV\Òòm\â±kn\Ü\åùqÙ‘»‹¶ŸkºU\ÕZÿñsVA\éñ+9‡.]Û¸\ç\Ç\äp-ƒ\0IY7Q	3?¹³)\0\0ª\Î\é3õ333›\Ä4\ÄÛ—\Å\Í\'	›H›Nš½-5C\Ü\\1‹)òF\îhwt C2CGžt3\\\ìñj±@#’QYI\ÊqTe<\Õ\å&h(øA¨\Ëû¨ÉŽG\êU¤\ÝDFþg\ë$9€X\06;\ÇN<¯\ÓYŒ?®\åuP\Ë÷\Ü(d\Ó Nµº\0\0k{Põ»ö\í:Ÿy¾´¬tWGJJK\Î\\8³3ygt|´¥%/wŽD`\Ñ€X:jWÎbd-€\Æ\ç\Í\×÷†«£\×°n€,<|ø0þFGG+)1\ÞYSEE\å\ìÙ³¯À‚-@P\\@F[’H\"€þ\á‡G1I5	)u\êM–†8\ìk´0úbNÙ•\Ü\ï)è¾Ÿ‹$\r...tû—„@ ÀAcUUÕ—/_\àˆqÒ¤Ijjjðg2d\Èþ6d|y,X\0\ÊôVVÖ˜1cz<»Ár(_2‡À±?D\Ò0±e2òed<¤¥7©«›˜´\Ú\Ùaú¿XoŒMOo²\È\ÏG\n\å5ª Nz-9á³º\ëwm\ÇV];Š¾5\Õ04§.`jJ13¡˜S,Œ[\ÆX5«¯9\ÑOF\Þ´6!+ó\Ç{€\à§þ½ù÷L”Lò:›i\ßú\ã\0\Ðÿ¦\å\'õ-\rºyu*i\Äy¨N\Ü\åt‹\àÙ·¯l ·\0\Ö-]\é\î\Z\å\á¾\Ö\Ý:aœ,CH Cv`±-£¬\ît\Ù\ËCEu{òkwÜ®ŽÏ©|r0ðþV§­§rÖ¿\ï}@\Ó\ÙOHRm‚ó/‡^Zc²‘\îðHo@\Z$ e€©ÀP\É\ÐÀh\Ã2Ž\Ð÷@ŸC_\îNŸ>\ÝQÿL-\0EEÅ¨¨(´e—ô—\ÐW°bü4\ÐI\ìS\Ûq\0§?ù\×Y\0b\Â9I„,™¨¹\ä¬\ÎÚ›HÀ&RO\Ý%I’!±]\ê³v\"{¡^Ÿc>fBÃ†‰\"\Æ\Å\ÕYˆvŒÁƒ‘€½Dv–lƒH\â—·v•Uò4ó\\\ZŸ¶3\'\ál\ã\Í\Ê\ïuÿ9s+_fÖ¤y+”4¼¨\âŸ\ìÀ/ @ t³¨5\"\Î\é‘5ñ5ó3õa-Di!e@4˜À­\áe´X\Ô\"P\Îd\Úè .\Èw0H\èM,y‰“ \0Ÿ².\0\ÓP–r$)rs³­\Ä0\Ø2\Ò<U\ÅP^/Q]S=J¯\Ýq»€dróvÛ”°iK\â–\ÝûwŸ½töî½»em\ä\å\çe\\\È\0ñ¿eç–˜\í1¶N¶=\Ðÿ\0\ë\0\Ä\ÒQ»\Ó\×\Þ\Ø|f©\î\îð‘\è\0\Ö-\0==½Î¦…«ƒ¨+.fzE@´{bCõ›œ¥\èŒð¿Š“Ú«¦\Ê/]´XQM\Ç-8ª°üõ…\ì\ì?v-ªŸ??¿»»ûË—/¿ÿþ\êÕ«Ìž=\Û\Ù\Ù\Ù\Ô\Ô\Ô\Ì\ÌvÍ›7¬›››[[[‹ŠŠ@ÿ£-{‘—×•‹ò1õ~$ÿ\É|°\È=·–V_\è\Äÿw[Û»jZcùHö¿B|‚1<öU<\Ójš<¿hŒû¦\íô]Ç¾u”-u™\0}+Š\Õw}«&·¡I\Ïø§\è:Y6…D\"\ÉV\çª\ìo\ÒjX\îwÿg‰‰ˆgÆ€þ\ï\Öm`Pé„\èºY›\ÂW<‹ˆªG‚Aÿ¯ˆ¼³ÓÜ¡c Cv‰¦\ë¤\äÜŠ3¥u\é¥/2¼<~¿\îø­¢\Æíº‰qQ\î[\ÓGŸ!,)K 2_}\ç\ß½´F¤8v¢ž\Þ W\æk\0hŽõ\Öum\Øv\ã\"eúVP¬\0Ï¡ªª\n\Ë\ï\"\"\"455Q‰OS\àÿ? ¯ø¥,\0œŸÏ¿\Îø\ÉÀ‘=€\Î\0fh\Øu‡B 	©ˆ’­$¤]¤]lý—/M\ÊN\Ë{š‘{wú\â\ÊZb’\ÎbV‚B\ZK‹Ó¢êœŽ†¢&~\Â\Æ„\'²\â¦>dS¿\ázž\æJVhwt Cv¼-ól¯/\Ù?E\Ðj$š¤´Œ¨¾œ„¹¼„5„œ„•”¨?IaØ°ž¯ŽŽX\0\Ê\ë\È\â\ë\ÅX¡¥ÃªŸV\ë\êõ|\0¼:m]\íi¡\ÓVn\\½-šj\ì\Ü¿;>vg,”¡fÅºSfM¡4bxO\"*lY\0»@·\Ð_0Sa\éR\ãM\"NV=U	õ[¶lAóz°\à\Ò‡\'\'46\ÎV™\â3^˜6M\×\Ø\Ö\Ã-xù•\ÜÇ§³\Ú]€\Ã\0‰D\Ò\Ñ\ÑIJJª­­ýFŽ°\ïß¿_ZZúúõkPþ---?Ž…¯O\ïW7€Ï¶\Ö0¾åœ„½¢.\0\Ç9…®\n\È\æŠ+\Ýq‚$¹|Qm85m\ÖS„‚“yõ³‡ûUð=%Nz.\êóZ\Ú\ëoY\ÏFY\Ï\×R^/D|ž‚\Êy‚2y|ù\Ô;»y*{hHZ’<Aù÷L \Æ_\Þ2ýÿ-Ÿºþ_úf®\çÿc0¨ô\Îb‡‡\Â\êù©KV<§WþK¢\êW,¾¾\Í[!Ÿi Cv	‘_@\Å\ÚS\Ò\"ƒi\ËMlºn\ç\Zß¼(\Í1FF$Aa4	\ç?DG)Ž\Õ\Ð[\0°KC`PøU:C†(`\å\Î,\0\0r(Ê§OŸŠ‹‹±ü>a\êÔ©†††¨Ä§ƒ©ðS\×\èWp\0\ç7·\0~e@\Þ*ˆˆ“e\Ü5},gjŒ¦Nû7\ãT$\ØX\È\nU\çt¨\Z-i\ì)f\Z b\ê\ÇnˆšúK˜ù\Ë\ZºhhB»£²;\Äù\ìµHžzD5‚’÷p\êjü´ !\nš\×# \íþ\ÑÔ‚ýX.8p„\Z!Ž:Q˜zœ\Z‡ON+>ÿ\ïõôô\Ð.z‘DTVU617ñôñœ8uö\ÔÀ\à@7/7cùò\"Û—6\ÐókZ\0\0vE@ñ\å‡/+_—•–\Å\Ä\Ä8::J\Òn‚\Õ{bW\Ô\rõótq”$“\ÑZ>>}£€y\ÑG.\Çí»€V\át‚ˆˆˆ‘‘Qxxxbbbzzúµk×®^½š–––\0Ç¬ššš\ì®ÿ\×5B<¼zCy}Vp·ÿIHùƒ\ßü	ü\Ë8‰^ƒ	\Z\ÃxI<½ÿ? •ù$}øô¶ò\Ú\ß\ážôŒ{f-÷\ÌgÜ³*‡\Í\È¸‘\ÛÞžW]ŒO¸\Çóÿ™ H\"Œ’\ås\Ó&„[68MOvx}\Ý\ä\Ñ\É\Ñwh/ž¢`ª\'\Ú\Åú0¨ô.b§»t\ì\äÀ¨Eg¯¬Gôÿ\Ò\Åw6\Î\\•0^k\ç8Q†d¦\É’\"¤’Õª‹\å…þ;+ÿ\á\ÐC/¿Ac_¹r\å\Ýý\Ð\íðÿ™€¤!\Ðku÷	5\Æ\Å\ä=ƒ€\É\Ð\Ý\è\à?”³³3*ñ\é`jü¼;ô7¸€ƒó›ƒ[\0ÿ$¿´ˆ\Ø1	a1c~9Ú´öŽbqN–¶¶ºŽ®¢µ\Ü§¶pa!œ\äi™J£-¨ú_G\íŽtH–!x!Ð>b\äÈ‘Ñ›¢7mÞ´is›c7#±eë–­q[\ãÚ³iÓ¦¾²\0‘h~\êiU/õ|go_¬/ø^†/ÿ\"´»>E^^>33³¼¼~[\ä\ä\äúVOfgfx\Û\ëNš8¾c·ò*\ÚN\Ë\Éÿ­•\Éúø4’H$x…i@Ÿ¿›‹‰z‰—W›Gx8·\Èp¡\á\Ü\Ü<\Ä^˜_6!‚A\\š(‰„L&Š{?µ9$\"Ÿ?Ÿˆ€˜„€Œ$¿¤8IL„\ÈObo,•\Þ]ˆ\íð\Ûî©¼\ÝSb‡‡+óÿ±@‡d‡dþS\å\ädd‰¤~üœ\àüY\ÞÙªûPFf@aU?\0ò1­N¯\çš0M`:.lv´\0 yUû\Ûö¨¨(ø×ªüÎÈ„|´e—\à\0\Î/\rnü& \êü§€‰ƒƒƒƒ\Ã\Z*½_§= °‘þ§\Ù1\àd‡Uý\0z­	H´“ú\íštL€J¦\ã\ÒwÈ”dE\0$¡\Ñ\ÒÒš;w®ŠŠ\nªõ™¡ªª\n9¬Ž[\0888¿4¸ð›€ªóŸ:$k0¨ô~\rtHv\0õ[\\\\\Ì\Öø4ù\á\í\í\Z\Z\Ú\Ù\\\0¨ý\ï\ã\ãƒf³\0n\à\à\àü\Ò\àÀoª\Î\n\è88888¬Á \Òû5\Ð!qpp\è\Ð\ÒÒŠŠŠrvv644\Ô\Ô\ÔTTT„G(»¸¸@=»³p\0\ç—·\0~PuþS@‡\ÄÁÁÁÁa\r•Þ¯‰ƒƒ\ÓGGÇ©S§FDD€ìŒŒ¶³³cñúzp\0\ç—·\0~PuþS@‡\ÄÁÁÁÁa\r•Þ¯‰ƒƒ\Óo\à\0\Î/\rnü& \êü§€‰ƒƒƒƒ\Ã\Z*½_§\ßÀ-\0œ_š‹°\è\â\ß}h×¿¯½_§`x«û$Ð®qpzÃ‡ªO\íú÷€2ïŸ\èm0¼\í}h\×88¿+ÿ\0\ç7ý9øµa8¼\è“@»þ=`x\íý\Z\è8ý\0\Ã[\Ý\'vƒ\Ó>T}h×¿*½_²\r†·½O\í\Z\çw¥À\Ç÷?^Ë„³\è^ \0\0\0\0IEND®B`‚',1);
/*!40000 ALTER TABLE `tbl_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_subjects`
--

DROP TABLE IF EXISTS `tbl_subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_subjects` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `subject` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tbl_subjectscol_UNIQUE` (`subject`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_subjects`
--

LOCK TABLES `tbl_subjects` WRITE;
/*!40000 ALTER TABLE `tbl_subjects` DISABLE KEYS */;
INSERT INTO `tbl_subjects` VALUES (2,'English'),(1,'Filipino'),(3,'Mathematics'),(5,'Music and Arts'),(6,'P.E'),(4,'Science');
/*!40000 ALTER TABLE `tbl_subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_users`
--

DROP TABLE IF EXISTS `tbl_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tbl_users` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `username` varchar(12) NOT NULL,
  `password` char(76) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `secret_question` varchar(40) NOT NULL,
  `secret_answer` char(76) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_users`
--

LOCK TABLES `tbl_users` WRITE;
/*!40000 ALTER TABLE `tbl_users` DISABLE KEYS */;
INSERT INTO `tbl_users` VALUES (0,'','','','',''),(1,'JCM','$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa','Joshua C. Magoliman','What is your favorite color?','$2a$11$uCaCUH/VMhC7WDrDotu1QOb8Afhamkr9g1AIuvM4p4GlXX50sGpQa'),(8,'QWE','$2a$12$lwAwitUy/XVmmTE4o8wdkudiEg8mZI0cm47rowUbwAvpAQHi1KxQ6','Joanna Mae C. Magoliman','What is your contact number?','$2a$12$jw1yMU0wAvJxuc8dgtMf1e.ozSQSrXCKawNTJxC0NrgB9JUg5n07G');
/*!40000 ALTER TABLE `tbl_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_getallaccounts`
--

DROP TABLE IF EXISTS `vw_getallaccounts`;
/*!50001 DROP VIEW IF EXISTS `vw_getallaccounts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_getallaccounts` AS SELECT 
 1 AS `ACCOUNT NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_getallbooks`
--

DROP TABLE IF EXISTS `vw_getallbooks`;
/*!50001 DROP VIEW IF EXISTS `vw_getallbooks`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_getallbooks` AS SELECT 
 1 AS `ID`,
 1 AS `RFId`,
 1 AS `TITLE`,
 1 AS `SUBJECT`,
 1 AS `AUTHORS`,
 1 AS `PUBLISHER`,
 1 AS `COPYRIGHT YEAR`,
 1 AS `ORIGINAL TOTAL PAGES`,
 1 AS `CURRENT TOTAL PAGES`,
 1 AS `QUANTITY`,
 1 AS `DATE`,
 1 AS `TIME`,
 1 AS `SHELF`,
 1 AS `ACCOUNT NAME`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_getallborroweddetails`
--

DROP TABLE IF EXISTS `vw_getallborroweddetails`;
/*!50001 DROP VIEW IF EXISTS `vw_getallborroweddetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_getallborroweddetails` AS SELECT 
 1 AS `ID`,
 1 AS `BOOK RFID`,
 1 AS `STUDENT RFID`,
 1 AS `BORROWED FROM`,
 1 AS `BORROWED UNTIL`,
 1 AS `ACTUAL RETURN`,
 1 AS `LENT BY`,
 1 AS `RECEIVED BY`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_getallshelfs`
--

DROP TABLE IF EXISTS `vw_getallshelfs`;
/*!50001 DROP VIEW IF EXISTS `vw_getallshelfs`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_getallshelfs` AS SELECT 
 1 AS `ID`,
 1 AS `SHELF`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_getallstudents`
--

DROP TABLE IF EXISTS `vw_getallstudents`;
/*!50001 DROP VIEW IF EXISTS `vw_getallstudents`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_getallstudents` AS SELECT 
 1 AS `ID`,
 1 AS `RFID`,
 1 AS `FULL NAME`,
 1 AS `GENDER`,
 1 AS `DATE OF BIRTH`,
 1 AS `AGE`,
 1 AS `ADDRESS`,
 1 AS `GRADE LEVEL`,
 1 AS `CONTACT NUMBER`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_getallsubjects`
--

DROP TABLE IF EXISTS `vw_getallsubjects`;
/*!50001 DROP VIEW IF EXISTS `vw_getallsubjects`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vw_getallsubjects` AS SELECT 
 1 AS `ID`,
 1 AS `SUBJECT`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'book_monitoring_system_with_rfid'
--

--
-- Dumping routines for database 'book_monitoring_system_with_rfid'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_BorrowingBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_BorrowingBook`(IN param_book_id INT(9), IN param_student_id INT(9),
IN param_borrowed_from_date DATETIME, IN param_borrowed_until_date DATE, IN param_lent_by INT(2), IN param_received_by INT(2))
BEGIN
INSERT INTO tbl_borrowed_details (book_id, student_id, borrowed_from_date, borrowed_until_date, lent_by, received_by)
VALUES (param_book_id, param_student_id, param_borrowed_from_date, param_borrowed_until_date, param_lent_by, param_received_by);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteExistingBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DeleteExistingBook`(IN param_rfId VARCHAR(10))
BEGIN
DELETE FROM book_monitoring_system_with_rfid.tbl_books WHERE rfid = param_rfId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteExistingShelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DeleteExistingShelf`(IN param_id INT(4))
BEGIN
DELETE FROM book_monitoring_system_with_rfid.tbl_shelfs WHERE id = param_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteExistingStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DeleteExistingStudent`(IN param_rfId VARCHAR(10))
BEGIN
DELETE FROM book_monitoring_system_with_rfid.tbl_students WHERE rfid = param_rfId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteExistingSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_DeleteExistingSubject`(IN param_id INT(4))
BEGIN
DELETE FROM book_monitoring_system_with_rfid.tbl_subjects WHERE id = param_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByAccountName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByAccountName`(IN param_AccountName VARCHAR(45))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_users`.`full_name` LIKE param_AccountName)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByAuthors` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByAuthors`(IN param_Authors mediumtext)
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`authors` LIKE param_Authors)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByCopyrightYear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByCopyrightYear`(IN param_CopyrightYear VARCHAR(45))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` LIKE param_CopyrightYear)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByCurrentTotalPages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByCurrentTotalPages`(IN param_CurrentTotalPages INT(4))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` LIKE CONCAT("%",param_CurrentTotalPages,"%"))
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByDate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByDate`(IN param_Date VARCHAR(10))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`date` LIKE param_Date)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByOriginalTotalPages` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByOriginalTotalPages`(IN param_OriginalTotalPages INT(4))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` LIKE CONCAT("%",param_OriginalTotalPages,"%"))
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByPublisher` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByPublisher`(IN param_Publisher mediumtext)
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`publisher` LIKE param_Publisher)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByQuantity` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByQuantity`(IN param_Quantity INT(6))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`quantity` LIKE CONCAT("%",param_Quantity,"%"))
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByRFID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByRFID`(IN param_RFID varchar(12))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`rfid` LIKE param_RFID)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByShelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByShelf`(IN param_Shelf VARCHAR(20))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` LIKE param_Shelf)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookBySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookBySubject`(IN param_Subject varchar(20))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` LIKE param_Subject)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByTime` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByTime`(IN param_Time VARCHAR(11))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`time` LIKE param_Time)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookByTitle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBookByTitle`(IN param_Title varchar(60))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_books`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`rfid` AS `RFID`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`title` AS `TITLE`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`authors` AS `AUTHORS`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`publisher` AS `PUBLISHER`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`quantity` AS `QUANTITY`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`date` AS `DATE`,
        `book_monitoring_system_with_rfid`.`tbl_books`.`time` AS `TIME`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`,
        `book_monitoring_system_with_rfid`.`tbl_users`.`full_name` AS `ACCOUNT NAME`
    FROM
        (((`book_monitoring_system_with_rfid`.`tbl_books`
        JOIN `book_monitoring_system_with_rfid`.`tbl_subjects` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`subject_id` = `book_monitoring_system_with_rfid`.`tbl_subjects`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_shelfs` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`shelf_id` = `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_users` ON ((`book_monitoring_system_with_rfid`.`tbl_books`.`user_id` = `book_monitoring_system_with_rfid`.`tbl_users`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_books`.`title` LIKE param_Title)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_books`.`id`;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBorrowedDetailsByActualReturn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBorrowedDetailsByActualReturn`(IN param_ActualReturn varchar(21))
BEGIN
  SELECT 
        `sourcetable`.`id` AS `ID`,
        `b`.`rfid` AS `BOOK RFID`,
        `s`.`rfid` AS `STUDENT RFID`,
        `sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,
        `sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,
        `sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,
        `u1`.`full_name` AS `LENT BY`,
        `u2`.`full_name` AS `RECEIVED BY`
   FROM
        ((((`tbl_borrowed_details` `sourcetable`
        JOIN `tbl_books` `b` ON ((`sourcetable`.`book_id` = `b`.`id`)))
        JOIN `tbl_students` `s` ON ((`sourcetable`.`student_id` = `s`.`id`)))
        JOIN `tbl_users` `u1` ON ((`sourcetable`.`lent_by` = `u1`.`id`)))
        JOIN `tbl_users` `u2` ON ((`sourcetable`.`received_by` = `u2`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`sourcetable`.`actual_return_date` LIKE param_ActualReturn)
  ORDER BY `book_monitoring_system_with_rfid`.`sourcetable`.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBorrowedDetailsByBookRFID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBorrowedDetailsByBookRFID`(IN param_BookRFID varchar(12))
BEGIN
  SELECT 
        `sourcetable`.`id` AS `ID`,
        `b`.`rfid` AS `BOOK RFID`,
        `s`.`rfid` AS `STUDENT RFID`,
        `sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,
        `sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,
        `sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,
        `u1`.`full_name` AS `LENT BY`,
        `u2`.`full_name` AS `RECEIVED BY`
   FROM
        ((((`tbl_borrowed_details` `sourcetable`
        JOIN `tbl_books` `b` ON ((`sourcetable`.`book_id` = `b`.`id`)))
        JOIN `tbl_students` `s` ON ((`sourcetable`.`student_id` = `s`.`id`)))
        JOIN `tbl_users` `u1` ON ((`sourcetable`.`lent_by` = `u1`.`id`)))
        JOIN `tbl_users` `u2` ON ((`sourcetable`.`received_by` = `u2`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`b`.`rfid` LIKE param_BookRFID)
  ORDER BY `book_monitoring_system_with_rfid`.`sourcetable`.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBorrowedDetailsByBorrowedFrom` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBorrowedDetailsByBorrowedFrom`(IN param_BorrowedFrom varchar(21))
BEGIN
  SELECT 
        `sourcetable`.`id` AS `ID`,
        `b`.`rfid` AS `BOOK RFID`,
        `s`.`rfid` AS `STUDENT RFID`,
        `sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,
        `sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,
        `sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,
        `u1`.`full_name` AS `LENT BY`,
        `u2`.`full_name` AS `RECEIVED BY`
   FROM
        ((((`tbl_borrowed_details` `sourcetable`
        JOIN `tbl_books` `b` ON ((`sourcetable`.`book_id` = `b`.`id`)))
        JOIN `tbl_students` `s` ON ((`sourcetable`.`student_id` = `s`.`id`)))
        JOIN `tbl_users` `u1` ON ((`sourcetable`.`lent_by` = `u1`.`id`)))
        JOIN `tbl_users` `u2` ON ((`sourcetable`.`received_by` = `u2`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`sourcetable`.`borrowed_from_date` LIKE param_BorrowedFrom)
  ORDER BY `book_monitoring_system_with_rfid`.`sourcetable`.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBorrowedDetailsByBorrowedUntil` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBorrowedDetailsByBorrowedUntil`(IN param_BorrowedUntil varchar(12))
BEGIN
  SELECT 
        `sourcetable`.`id` AS `ID`,
        `b`.`rfid` AS `BOOK RFID`,
        `s`.`rfid` AS `STUDENT RFID`,
        `sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,
        `sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,
        `sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,
        `u1`.`full_name` AS `LENT BY`,
        `u2`.`full_name` AS `RECEIVED BY`
   FROM
        ((((`tbl_borrowed_details` `sourcetable`
        JOIN `tbl_books` `b` ON ((`sourcetable`.`book_id` = `b`.`id`)))
        JOIN `tbl_students` `s` ON ((`sourcetable`.`student_id` = `s`.`id`)))
        JOIN `tbl_users` `u1` ON ((`sourcetable`.`lent_by` = `u1`.`id`)))
        JOIN `tbl_users` `u2` ON ((`sourcetable`.`received_by` = `u2`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`sourcetable`.`borrowed_until_date` LIKE param_BorrowedUntil)
  ORDER BY `book_monitoring_system_with_rfid`.`sourcetable`.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBorrowedDetailsByLentBy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBorrowedDetailsByLentBy`(IN param_LentBy VARCHAR(52))
BEGIN
  SELECT 
        `sourcetable`.`id` AS `ID`,
        `b`.`rfid` AS `BOOK RFID`,
        `s`.`rfid` AS `STUDENT RFID`,
        `sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,
        `sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,
        `sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,
        `u1`.`full_name` AS `LENT BY`,
        `u2`.`full_name` AS `RECEIVED BY`
   FROM
        ((((`tbl_borrowed_details` `sourcetable`
        JOIN `tbl_books` `b` ON ((`sourcetable`.`book_id` = `b`.`id`)))
        JOIN `tbl_students` `s` ON ((`sourcetable`.`student_id` = `s`.`id`)))
        JOIN `tbl_users` `u1` ON ((`sourcetable`.`lent_by` = `u1`.`id`)))
        JOIN `tbl_users` `u2` ON ((`sourcetable`.`received_by` = `u2`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`u1`.`full_name` LIKE param_LentBy)
  ORDER BY `book_monitoring_system_with_rfid`.`sourcetable`.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBorrowedDetailsByReceivedBy` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBorrowedDetailsByReceivedBy`(IN param_ReceivedBy VARCHAR(52))
BEGIN
  SELECT 
        `sourcetable`.`id` AS `ID`,
        `b`.`rfid` AS `BOOK RFID`,
        `s`.`rfid` AS `STUDENT RFID`,
        `sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,
        `sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,
        `sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,
        `u1`.`full_name` AS `LENT BY`,
        `u2`.`full_name` AS `RECEIVED BY`
   FROM
        ((((`tbl_borrowed_details` `sourcetable`
        JOIN `tbl_books` `b` ON ((`sourcetable`.`book_id` = `b`.`id`)))
        JOIN `tbl_students` `s` ON ((`sourcetable`.`student_id` = `s`.`id`)))
        JOIN `tbl_users` `u1` ON ((`sourcetable`.`lent_by` = `u1`.`id`)))
        JOIN `tbl_users` `u2` ON ((`sourcetable`.`received_by` = `u2`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`u2`.`full_name` LIKE param_ReceivedBy)
  ORDER BY `book_monitoring_system_with_rfid`.`sourcetable`.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBorrowedDetailsByStudentRFID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetBorrowedDetailsByStudentRFID`(IN param_StudentRFID varchar(12))
BEGIN
  SELECT 
        `sourcetable`.`id` AS `ID`,
        `b`.`rfid` AS `BOOK RFID`,
        `s`.`rfid` AS `STUDENT RFID`,
        `sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,
        `sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,
        `sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,
        `u1`.`full_name` AS `LENT BY`,
        `u2`.`full_name` AS `RECEIVED BY`
   FROM
        ((((`tbl_borrowed_details` `sourcetable`
        JOIN `tbl_books` `b` ON ((`sourcetable`.`book_id` = `b`.`id`)))
        JOIN `tbl_students` `s` ON ((`sourcetable`.`student_id` = `s`.`id`)))
        JOIN `tbl_users` `u1` ON ((`sourcetable`.`lent_by` = `u1`.`id`)))
        JOIN `tbl_users` `u2` ON ((`sourcetable`.`received_by` = `u2`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`s`.`rfid` LIKE param_StudentRFID)
  ORDER BY `book_monitoring_system_with_rfid`.`sourcetable`.`id` DESC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetShelfByShelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetShelfByShelf`(IN param_shelf varchar(20))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` AS `SHELF`
    FROM
        `book_monitoring_system_with_rfid`.`tbl_shelfs`
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_shelfs`.`shelf` LIKE param_shelf)
    ORDER BY `book_monitoring_system_with_rfid`.`tbl_shelfs`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByAddress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByAddress`(IN param_Address MEDIUMTEXT)
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
         ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_students`.`address` LIKE param_Address)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByAge` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByAge`(IN param_Age INT(2))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
   ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_students`.`age` LIKE CONCAT("%",param_Age,"%"))
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByContactNumber` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByContactNumber`(IN param_ContactNumber VARCHAR(42))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
         ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` LIKE param_ContactNumber)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByDateOfBirth` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByDateOfBirth`(IN param_DateOfBirth varchar(12))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
   ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` LIKE param_DateOfBirth)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByFullName` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByFullName`(IN param_FullName varchar(45))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
   ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` LIKE param_FullName)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByGender` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByGender`(IN param_Gender varchar(8))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
   ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_genders`.`gender` LIKE param_Gender)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByGradeLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByGradeLevel`(IN param_GradeLevel VARCHAR(10))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
          ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` LIKE param_GradeLevel)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStudentByRFID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetStudentByRFID`(IN param_RFID varchar(12))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_students`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`rfid` AS `RFID`,
		`book_monitoring_system_with_rfid`.`tbl_students`.`full_name` AS `FULL NAME`,
        `book_monitoring_system_with_rfid`.`tbl_genders`.`gender` AS `GENDER`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`age` AS `AGE`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`address` AS `ADDRESS`,
        `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,
        `book_monitoring_system_with_rfid`.`tbl_students`.`contact_number` AS `CONTACT NUMBER`

    FROM
   ((`book_monitoring_system_with_rfid`.`tbl_students`
        JOIN `book_monitoring_system_with_rfid`.`tbl_genders` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`gender_id` = `book_monitoring_system_with_rfid`.`tbl_genders`.`id`)))
        JOIN `book_monitoring_system_with_rfid`.`tbl_grade_levels` ON ((`book_monitoring_system_with_rfid`.`tbl_students`.`grade_level_id` = `book_monitoring_system_with_rfid`.`tbl_grade_levels`.`id`)))
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_students`.`rfid` LIKE param_RFID)
  ORDER BY `book_monitoring_system_with_rfid`.`tbl_students`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetSubjectBySubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_GetSubjectBySubject`(IN param_subject varchar(20))
BEGIN
  SELECT 
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`id` AS `ID`,
        `book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` AS `SUBJECT`
    FROM
        `book_monitoring_system_with_rfid`.`tbl_subjects`
   WHERE
        (`book_monitoring_system_with_rfid`.`tbl_subjects`.`subject` LIKE param_subject)
    ORDER BY `book_monitoring_system_with_rfid`.`tbl_subjects`.`id` ASC;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertNewBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_InsertNewBook`(IN param_id INT, IN param_rfid VARCHAR(10),
IN param_title VARCHAR(60), IN param_subject_id INT(4), IN param_authors MEDIUMTEXT, IN param_publisher MEDIUMTEXT,
IN param_copyright_year VARCHAR(45), IN param_original_totalpages INT(4), IN param_current_totalpages INT(4), 
IN param_quantity INT(6), IN param_date DATE, IN param_time VARCHAR(11), IN param_shelf_id INT(4), IN param_user_id INT(2))
BEGIN
INSERT INTO tbl_books (id, rfid, title, subject_id, authors, publisher, copyright_year, original_totalpages, current_totalpages, quantity, date, time, shelf_id, user_id)
VALUES (param_id, param_rfid, param_title, param_subject_id, param_authors, param_publisher, param_copyright_year, param_original_totalpages, param_current_totalpages, 
param_quantity, param_date, param_time, param_shelf_id, param_user_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertNewShelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_InsertNewShelf`(IN param_shelf VARCHAR(20))
BEGIN
INSERT INTO tbl_shelfs (shelf)
VALUES (param_shelf);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertNewStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_InsertNewStudent`(IN param_rfid VARCHAR(10),
IN param_full_name VARCHAR(45), IN param_gender_id INT(1), IN param_date_of_birth date, IN param_age INT(2),
IN param_address mediumtext, IN param_grade_level_id INT(1), IN param_contact_number VARCHAR(40), 
IN param_photo LONGBLOB, IN param_status_id INT(1))
BEGIN
INSERT INTO tbl_students (rfid, full_name, gender_id, date_of_birth, age, address, grade_level_id, contact_number, photo, status_id)
VALUES (param_rfid, param_full_name, param_gender_id, param_date_of_birth, param_age, param_address, param_grade_level_id, param_contact_number,
param_photo, param_status_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertNewSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_InsertNewSubject`(IN param_subject VARCHAR(20))
BEGIN
INSERT INTO tbl_subjects (subject)
VALUES (param_subject);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsertNewUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_InsertNewUser`(IN param_username varchar(12),IN param_password CHAR(76),
IN param_fullname varchar(50), IN param_secretquestion varchar(40),IN param_secretanswer CHAR(76))
BEGIN
INSERT INTO tbl_users (username, password, full_name, secret_question, secret_answer )
VALUES (param_username, param_password, param_fullname, param_secretquestion, param_secretanswer);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_Login`(IN param_username varchar(12))
BEGIN
SELECT * FROM tbl_users WHERE username = param_username;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ReturningBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_ReturningBook`(IN param_actual_return_date DATETIME, IN param_received_by INT(2),
IN param_book_id INT(9), IN param_student_id INT(9))
BEGIN
UPDATE tbl_borrowed_details SET actual_return_date = param_actual_return_date, received_by = param_received_by
WHERE book_id = param_book_id AND student_id = param_student_id AND received_by = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateExistingBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateExistingBook`(IN param_title VARCHAR(60), IN param_subject_id INT(4), IN param_authors MEDIUMTEXT, IN param_publisher MEDIUMTEXT,
IN param_copyright_year VARCHAR(45), IN param_original_totalpages INT(4), IN param_current_totalpages INT(4), 
IN param_quantity INT(6), IN param_date DATE, IN param_time VARCHAR(11), IN param_shelf_id INT(4), IN param_user_id INT(2), IN param_rfid VARCHAR(10))
BEGIN
UPDATE tbl_books SET title = param_title, subject_id = param_subject_id, authors = param_authors, publisher = param_publisher,
copyright_year = param_copyright_year, original_totalpages = param_original_totalpages, current_totalpages = param_current_totalpages,
quantity = param_quantity, date = param_date, time = param_time, shelf_id = param_shelf_id, user_id = param_user_id
WHERE rfid = param_rfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateExistingShelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateExistingShelf`(IN param_shelf VARCHAR(20), IN param_id INT(4))
BEGIN
UPDATE tbl_shelfs SET shelf = param_shelf
WHERE id = param_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateExistingStudent` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateExistingStudent`(IN param_full_name varchar(45), IN param_gender_id INT(1), IN param_date_of_birth date, IN param_age INT(2),
IN param_address mediumtext, IN param_grade_level_id INT(1), IN param_contact_number VARCHAR(40), 
IN param_photo LONGBLOB, IN param_rfid VARCHAR(10))
BEGIN
UPDATE tbl_students SET full_name = param_full_name, gender_id = param_gender_id, date_of_birth = param_date_of_birth, age = param_age,
address = param_address, grade_level_id = param_grade_level_id, contact_number = param_contact_number,
photo = param_photo
WHERE rfid = param_rfid;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UpdateExistingSubject` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sp_UpdateExistingSubject`(IN param_subject VARCHAR(20), IN param_id INT(4))
BEGIN
UPDATE tbl_subjects SET subject = param_subject
WHERE id = param_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_getallaccounts`
--

/*!50001 DROP VIEW IF EXISTS `vw_getallaccounts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getallaccounts` AS select `tbl_users`.`full_name` AS `ACCOUNT NAME` from `tbl_users` where (`tbl_users`.`id` <> 0) order by `tbl_users`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_getallbooks`
--

/*!50001 DROP VIEW IF EXISTS `vw_getallbooks`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getallbooks` AS select `tbl_books`.`id` AS `ID`,`tbl_books`.`rfid` AS `RFId`,`tbl_books`.`title` AS `TITLE`,`tbl_subjects`.`subject` AS `SUBJECT`,`tbl_books`.`authors` AS `AUTHORS`,`tbl_books`.`publisher` AS `PUBLISHER`,`tbl_books`.`copyright_year` AS `COPYRIGHT YEAR`,`tbl_books`.`original_totalpages` AS `ORIGINAL TOTAL PAGES`,`tbl_books`.`current_totalpages` AS `CURRENT TOTAL PAGES`,`tbl_books`.`quantity` AS `QUANTITY`,`tbl_books`.`date` AS `DATE`,`tbl_books`.`time` AS `TIME`,`tbl_shelfs`.`shelf` AS `SHELF`,`tbl_users`.`full_name` AS `ACCOUNT NAME` from (((`tbl_books` join `tbl_subjects` on((`tbl_books`.`subject_id` = `tbl_subjects`.`id`))) join `tbl_shelfs` on((`tbl_books`.`shelf_id` = `tbl_shelfs`.`id`))) join `tbl_users` on((`tbl_books`.`user_id` = `tbl_users`.`id`))) order by `tbl_books`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_getallborroweddetails`
--

/*!50001 DROP VIEW IF EXISTS `vw_getallborroweddetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getallborroweddetails` AS select `sourcetable`.`id` AS `ID`,`b`.`rfid` AS `BOOK RFID`,`s`.`rfid` AS `STUDENT RFID`,`sourcetable`.`borrowed_from_date` AS `BORROWED FROM`,`sourcetable`.`borrowed_until_date` AS `BORROWED UNTIL`,`sourcetable`.`actual_return_date` AS `ACTUAL RETURN`,`u1`.`full_name` AS `LENT BY`,`u2`.`full_name` AS `RECEIVED BY` from ((((`tbl_borrowed_details` `sourcetable` join `tbl_books` `b` on((`sourcetable`.`book_id` = `b`.`id`))) join `tbl_students` `s` on((`sourcetable`.`student_id` = `s`.`id`))) join `tbl_users` `u1` on((`sourcetable`.`lent_by` = `u1`.`id`))) join `tbl_users` `u2` on((`sourcetable`.`received_by` = `u2`.`id`))) order by `sourcetable`.`id` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_getallshelfs`
--

/*!50001 DROP VIEW IF EXISTS `vw_getallshelfs`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getallshelfs` AS select `tbl_shelfs`.`id` AS `ID`,`tbl_shelfs`.`shelf` AS `SHELF` from `tbl_shelfs` order by `tbl_shelfs`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_getallstudents`
--

/*!50001 DROP VIEW IF EXISTS `vw_getallstudents`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getallstudents` AS select `tbl_students`.`id` AS `ID`,`tbl_students`.`rfid` AS `RFID`,`tbl_students`.`full_name` AS `FULL NAME`,`tbl_genders`.`gender` AS `GENDER`,`tbl_students`.`date_of_birth` AS `DATE OF BIRTH`,`tbl_students`.`age` AS `AGE`,`tbl_students`.`address` AS `ADDRESS`,`tbl_grade_levels`.`grade_level` AS `GRADE LEVEL`,`tbl_students`.`contact_number` AS `CONTACT NUMBER` from ((`tbl_students` join `tbl_genders` on((`tbl_students`.`gender_id` = `tbl_genders`.`id`))) join `tbl_grade_levels` on((`tbl_students`.`grade_level_id` = `tbl_grade_levels`.`id`))) order by `tbl_students`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_getallsubjects`
--

/*!50001 DROP VIEW IF EXISTS `vw_getallsubjects`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_getallsubjects` AS select `tbl_subjects`.`id` AS `ID`,`tbl_subjects`.`subject` AS `SUBJECT` from `tbl_subjects` order by `tbl_subjects`.`id` */;
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

-- Dump completed on 2020-04-05 18:07:29
