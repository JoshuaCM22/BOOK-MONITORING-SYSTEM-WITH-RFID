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
INSERT INTO `tbl_books` VALUES (1,'0011677950','General Mathematics (For Senior High School)',3,'Marc De Guzman Garvida, Corazon S. Aspuria, Liberty Gay C. Manalo, Anjo M. Abaratigue','Books Atbp.Publishing Corp.','Copyright © 2016',335,335,5,'2020-03-21','02:33:21 PM',1,1),(2,'0003297238','Physical and Health (Volume-1)',6,'Lualhati Fernando-Callo, Peter Fermin Dajime','REX Book Store','Copyright © 2016',134,134,1,'2020-03-29','10:58:34 PM',2,1),(3,'123','BAGO',1,'BAGO	','BAGO	','123',123,123,123,'2020-03-30','12:06:54 AM',1,1),(4,'456','NEWEST',2,'NEWEST	','NEWEST	','456',456,456,456,'2020-03-30','02:20:37 PM',4,1);
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
INSERT INTO `tbl_students` VALUES (1,'0003297366','Magoliman, Joshua  C.',1,'1998-06-22',21,'Manila',1,'09108827366 / 09475613881','�\��\�\0JFIF\0\0H\0H\0\0�\�Exif\0\0MM\0*\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0b\0\0\0\0\0\0\0j(\0\0\0\0\0\0\01\0\0\0\0\0\0\0r2\0\0\0\0\0\0\0��i\0\0\0\0\0\0\0�\0\0\0\�\0\n��\0\0\'\0\n��\0\0\'Adobe Photoshop CS3 Windows\02019:03:20 18:33:42\0\0\0\0�\0\0\0\0\0\0\0�\0\0\0\0\0\0ݠ\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z\0\0\0\0\0\0\0\0\0\0\0\0&(\0\0\0\0\0\0\0\0\0\0\0\0\0.\0\0\0\0\0\0\�\0\0\0\0\0\0\0H\0\0\0\0\0\0H\0\0\0�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0\�\�I$�\�I$�R�I$���>�\�:_Hc_\�rF�\0�\\\�\�\�S^\�6�\0/\�.s;�ac��x�%�\�\�\�!�~w�\�\�����z��]\�~\�\��\�\\��e=ӟew�¦�\�\�M��\��b\�;\�r�[�f�X\��龜�-�b\�G\�%\��[:\�;?G�yx\�\�\��\��u�������1�\�XޣK2�&\r\�\�V�\�3�5��,�Kޤ�`u�����\�N\�F�c�\�\�S�IM�ȱYNR�I$���I%)$�IO�\�\�\�I$�\�I$�R�O_냥Tʩ\�\�-q�wЭ�\�\�9\�k\��&��i\�k(�\�\�\�X\�$0�?��y/Y\�O�X\�\�\Z�a�\�%�h\'m\�W��\�\��\0Ͽ�@�\�\�9�_�!�\�k������ws��~\�N\�͵��\�\�m�\�\�\�Q7R\��\Z\�\�6�|a\�ʻ�\�\'w���5�l$\�i\�(�\�^<\�\�ܣ�\�\�]��\0r�mñ#��j�\�\�C�!Ð��\�{8:��UX:\��?�\�dD�>a$�B\�]71�8�� \09���\�ޛ�{��R�l,\�|�:sq�4\�0=�\��\�1\�˭\�uo^\�mh\�t?\���\��\0\�߭\�_\�\�\�-�3+�\�鬏�S\�_f\�}\�Y�\�o\�#�m\�\�I$�)$�IJI$�S�\�\�\�I$�\�I$�S���.�o����\�k�\�1);\\l�\�[��Y��Yw�,^W\�2\ZHǤ6���>��O�J�.�\�\�\��vF	/��\�u���v5\�\�w\�\�\�j�����c\�P�\�y��F\�v�>�q2[�\�ΌKrl\�N��\�w[�?Tˀsۻ\�\��\�:[k��sa\�X�]%t�4U吓�<q�5p(��C\�7�\�\�?H\�[��O�7U\�\�\����`� ��V�J�N\�|�ؘ�+#��>\�VݍY:�q���?���}eþ\�4�\�\�1\r����m\�k�ߘ�\�K-\�{\\$��^e�I��tugp��]>\�,$z�\�\�>\�Ai-<�$ʹ\\\�\\8���w�m\��IՅ�I$�R�I$��\0�\�\�\�I$�\�I$�S*�\0�o\�~U\�a�:�X\�K�y�����qٯ\�\�^���p[�\0;�\�P�ֱ\�Q�m�\�\�9֨�옋!a\��~#�@9\�o\�sD�\�\�\�\���	\�\r���\�\�@�\�\�1�\�Ɔ�I<*Xh95a�\��|z;v��p\�\�\0y���n�M352����Qq�|D#�\�\�.�Ǒ^��\�cnc�\�?n\��\0U\��=l:�E[�D\�e���z�>3e����\0�8��k�\�\�B�\�,k\r��\�*�j\����?�\�Ϭ}=�b;\�\�I{C�v\�߻n\�{6=::��+e��@[��c.�\�\�m�%���.3�\�r\��\�]\�J\�0��܌p6�\�>���\��\��\�׺]\0\�3cmwf��o�\�w�\�O�\�ǐ_@�e���J\��u���\��\�[\Z�eߜ���ˉ��5\�\�\�!%d1�$�IJI$�S�\�\�\�I$�\�I$�R,���yd\�uO\r�gi�\�a1ަ��\�u5\�\�{\�\�]`0g�s��SԲ*n����\�\�-Pg��_\�\�:\�k��\�1�p\���jEU81��2J�����P\�`ĝ\04Z��\�\�Xu�� 1�\'\��+&\�\�z����\0�\\\�c��1��@&1*\��5\����P���O���m�Cmv�9��ñ?E\��cN�O�Ji��\�\�]b�\�\'f���Gr�\�ja��j{\�g�s�~\�\�\��f�\�{\�}=\�-�$z-�G�v>�2�[\�c\�e{�,.3�\�kV\�\�*\�1\�\�&\�|1��X�+X�B#\��7��!����\0Ҥ�I=b�I$��\0�\�\�\�I$�\�I$�R�_W�-fHo-�\�\�\�e���uf\�;�5!���o��&\�HLM<\�qx�Xثu,�\0�b��\��$\�c\�>����;9\�\n�ou,\'\�X\�׏\�9ͱ����I\�z#$�Dz�4��\�cf�\0\�S\�]sA���4\�\�\�L�\0RW�;h�\�:�\06�\0��\�<#3�m\�\�f\n}\��f�	2�{�\�\�o�V���I\\��n�v\�Ȣ͝\�+p#�Wps���/�pi\�\\�\��j��4[�ٹ��������K�\�\�\�9�`:�\0��r�at]��<?�s\�� ~���.N\�)Q\�u�ѼZZ6��5��Н$����I$���I%?�\�\�\�I$�\�I$�R��$�Jy���\�,�\�?Cd��v�ί�\�\�*�{,���\��\�e_e��\�\�\�\�3�֍�Y��\�1suٵ�U<�dxJ\�i\�\�;\�y���\�\�\�\�\�ub�[JN��Y�v�]�w\\�(�X\�7ktR�\�\�\�UF\�u\�\r\�Ov\�f\���5�\�\�\�\�5v,c+ck�C+hk�h\�\�\��]\�\�\�\�`�Ⳗ>\�K�\�eun�\�[\�sk�\0��\Zꕌ\0p�ܰ\�$�$�Jf5$�I)I$�J�\�\�\�I$�\�IF\�*��vE���͖81�\�>wן����w?2�\�(i\�\�\�zl�\07\�@�\�][�at�_�f>	�j�ǩa𭿻��;�u�7�a����a��(�E��#}\�\��\0���sٙ\�W:\�u\��V=\�\�?94ϲ\����nG֬���n\�^\�bW�\�ͭ�96�Z略\�:�\0�⫑E��̱��a��B���\�-\�\�٘/03�k\�\��\��z�^�\�qz�\�\�`�^Ѩ������\0F\�AA\����x��%\�V�Q\�y]>\�O%��ݭՎ���{�\rʋ�e�B��Ak\�~�@�Ud�\�\�-X�]kj���;\�r��\�+Ưu\�u��� �7����\�{mԭ��w߳���l���]\�pmn��m����K\�Ϫ�\�	�zx=z�\�@m}A\�	\�\����\��\0؏�\�3덥�%�\�z�h?\0\��\0�q�$|�\�p�LD�_�{\�p��� �\�����~����t�6�����d[O2Ci�w��\0Y��c\�\�v-�3�b�_��\�ϋ�\�>�\�vڞ$On��Ӻ�M\�/\�\�5\�F�c=��?m\��\0�դ\�)$�IO�\�\�\�?\��\�K:}.\�p�\0l\�_�Y�\��ע����׭$Umx\�<\n�l�\0�o��ɛLĨ��⅞\�7�:�^m��U\�ȷ�\�qy\rӷ�*�\�8\�P�\�LLw�\�\n��pn��\�F\�I\���u\�:j;��t>�\�?�\�\�7\�1\�\��i^퍐˩m�2׀A�+\�\�\�\�U��\�c���\�h���m\�\�\�]Q\���\�,�廷��]�:�Z,�ܵ\�A\\[/�u*�r3k\��@\�\�l�M�\�k�s���\0\��5\�u޳�\�zFOS�o6YP\�\��Rߥ�\��\0�\�g\���G\��\"���xnn^\�.s˟[�\�\�����Fʨ�#ӫ�*�0�\0�vLFZ\�}F�^�I��\\cո\�\�y��E��d���.s\�O[\�u/\�9~\�b\�n��8=��;m�\�֗6\�I\��q�\0\�j��T��_�y8E9]�\�\�>�۹�o����r\�B���>K;�\�y�\�\r�k�6{�;%�6��\��)��5d9�k\�\�ǳ轤�꽾殓�}~���\Z\�-�6e\����m���ع=\�?*��IV��L�\0�(\�\�c�u��MI�\0�\�\�V��\�?\�[_�\��\0�Zb}�\0\�3\���?�>��V8\�\�y��#\�U��\�\�7\'C�!�P^\�t�\�\�\�\�`\�<G*A\�斑�ӹIJ�\�Zf9\�O�HQ[\0@��	){\�9� ��+\�/Q\�S��\�\r\��\�{�\�n^i:B\�>�\�\�V1����\�\0�?\�T�\0\�oO���cGs�`u:�\�\��佘�T֘˴Y:�\0\�j7\����)r��\�v~�J G�\�E�o�\0��\��8ލS����x��	�\'\�u�8\�\� V�\�\��O�c.���\��\�,�V\�^�@~+��]��\�5�\�\��-\r,�>\��^�7�ٕ���v��\�EB\�V�M\�ͣ�b\\H���P\Z\�j�\��̇\��=\�\�S�_�e{�ܗ��ۥv4=���\�\���q�\�\�\��]a�:=\�p{ݵ�\�w����\�%��\��۟}��L\����K��H\�Ř/0��\�L�_��pښ\�4xH�O�\�\�`�D\�\�9Y\�A�\rĸ7�-CSI�jS)�\n\"Ǹ{���\'\�#\�>ނY4�u<�S�\0<\�RIK\�\�-\�A-?�J�\��\��Photoshop 3.0\08BIM\0\0\0\0\0n\0\0��(\0bFBMD01000aa603000004160000b22400001f2600008f2700008f2e000023450000d04b0000b44e0000885100002c7d00008BIM%\0\0\0\0\0eMeGe]�\�A�`%�/\�\�8BIM/\0\0\0\0\0JC\0\0H\0\0\0H\0\0\0\0\0\0\0\0\0\0\0\�\0\0@\0\0\0\0\0\0\0\0\0\0\0\0d\0\0\0�\0\0�\0\0\0\'\0T\0.\0j\0p\0g\0\0\0\0\08BIM\�\0\0\0\0\0\0H\0\0\0\0\0H\0\0\0\08BIM&\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?�\0\08BIM\r\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0	\0\0\0\0\0\0\0\0\08BIM\n\0\0\0\0\0\0\08BIM\'\0\0\0\0\0\n\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0H\0/ff\0\0lff\0\0\0\0\0\0\0/ff\0\0���\0\0\0\0\0\0\02\0\0\0\0Z\0\0\0\0\0\0\0\0\05\0\0\0\0-\0\0\0\0\0\0\0\08BIM�\0\0\0\0\0p\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\0\0\0����������������������\�\0\08BIM\0\0\0\0\0\0\0\0\0\0@\0\0@\0\0\0\08BIM\0\0\0\0\0\0\0\0\08BIM\Z\0\0\0\0I\0\0\0\0\0\0\0\0\0\0\0\0\0�\0\0\�\0\0\0\n\0J\0C\0M\0 \0L\0A\0T\0E\0S\0T\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\0\0�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0null\0\0\0\0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0�\0\0\0\0Rghtlong\0\0\�\0\0\0slicesVlLs\0\0\0Objc\0\0\0\0\0\0\0\0slice\0\0\0\0\0\0sliceIDlong\0\0\0\0\0\0\0groupIDlong\0\0\0\0\0\0\0originenum\0\0\0ESliceOrigin\0\0\0\rautoGenerated\0\0\0\0Typeenum\0\0\0\nESliceType\0\0\0\0Img \0\0\0boundsObjc\0\0\0\0\0\0\0\0\0Rct1\0\0\0\0\0\0\0Top long\0\0\0\0\0\0\0\0Leftlong\0\0\0\0\0\0\0\0Btomlong\0\0�\0\0\0\0Rghtlong\0\0\�\0\0\0urlTEXT\0\0\0\0\0\0\0\0\0nullTEXT\0\0\0\0\0\0\0\0\0MsgeTEXT\0\0\0\0\0\0\0\0altTagTEXT\0\0\0\0\0\0\0\0cellTextIsHTMLbool\0\0\0cellTextTEXT\0\0\0\0\0\0\0\0	horzAlignenum\0\0\0ESliceHorzAlign\0\0\0default\0\0\0	vertAlignenum\0\0\0ESliceVertAlign\0\0\0default\0\0\0bgColorTypeenum\0\0\0ESliceBGColorType\0\0\0\0None\0\0\0	topOutsetlong\0\0\0\0\0\0\0\nleftOutsetlong\0\0\0\0\0\0\0bottomOutsetlong\0\0\0\0\0\0\0rightOutsetlong\0\0\0\0\08BIM(\0\0\0\0\0\0\0\0?�\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\08BIM\0\0\0\0\0\0\0\0\0\0�\0\0\0�\0\0\�\0\"\0\0\0\�\0\0�\��\�\0JFIF\0\0\0H\0H\0\0�\�\0Adobe_CM\0�\�\0Adobe\0d�\0\0\0�\�\0�\0			\n\r\r\r��\0\0�\0�\"\0�\�\0\0\n�\�?\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0	\n\03\0!1AQa\"q�2���B#$R�b34r�\�C%�S�\��cs5���&D�TdE£t6\�U\�e�\�\�u\��F\'�����\�\�\����\�\�\��Vfv����\�\�\��7GWgw����\�\�\��\05\0!1AQaq\"2����B#�R\��3$b\�r��CScs4�%���&5\�\�D�T�dEU6te\��\�\�u\��F�����\�\�\����\�\�\��Vfv����\�\�\��\'7GWgw����\��\�\0\0\0?\0\�\�I$�\�I$�R�I$���>�\�:_Hc_\�rF�\0�\\\�\�\�S^\�6�\0/\�.s;�ac��x�%�\�\�\�!�~w�\�\�����z��]\�~\�\��\�\\��e=ӟew�¦�\�\�M��\��b\�;\�r�[�f�X\��龜�-�b\�G\�%\��[:\�;?G�yx\�\�\��\��u�������1�\�XޣK2�&\r\�\�V�\�3�5��,�Kޤ�`u�����\�N\�F�c�\�\�S�IM�ȱYNR�I$���I%)$�IO�\�\�\�I$�\�I$�R�O_냥Tʩ\�\�-q�wЭ�\�\�9\�k\��&��i\�k(�\�\�\�X\�$0�?��y/Y\�O�X\�\�\Z�a�\�%�h\'m\�W��\�\��\0Ͽ�@�\�\�9�_�!�\�k������ws��~\�N\�͵��\�\�m�\�\�\�Q7R\��\Z\�\�6�|a\�ʻ�\�\'w���5�l$\�i\�(�\�^<\�\�ܣ�\�\�]��\0r�mñ#��j�\�\�C�!Ð��\�{8:��UX:\��?�\�dD�>a$�B\�]71�8�� \09���\�ޛ�{��R�l,\�|�:sq�4\�0=�\��\�1\�˭\�uo^\�mh\�t?\���\��\0\�߭\�_\�\�\�-�3+�\�鬏�S\�_f\�}\�Y�\�o\�#�m\�\�I$�)$�IJI$�S�\�\�\�I$�\�I$�S���.�o����\�k�\�1);\\l�\�[��Y��Yw�,^W\�2\ZHǤ6���>��O�J�.�\�\�\��vF	/��\�u���v5\�\�w\�\�\�j�����c\�P�\�y��F\�v�>�q2[�\�ΌKrl\�N��\�w[�?Tˀsۻ\�\��\�:[k��sa\�X�]%t�4U吓�<q�5p(��C\�7�\�\�?H\�[��O�7U\�\�\����`� ��V�J�N\�|�ؘ�+#��>\�VݍY:�q���?���}eþ\�4�\�\�1\r����m\�k�ߘ�\�K-\�{\\$��^e�I��tugp��]>\�,$z�\�\�>\�Ai-<�$ʹ\\\�\\8���w�m\��IՅ�I$�R�I$��\0�\�\�\�I$�\�I$�S*�\0�o\�~U\�a�:�X\�K�y�����qٯ\�\�^���p[�\0;�\�P�ֱ\�Q�m�\�\�9֨�옋!a\��~#�@9\�o\�sD�\�\�\�\���	\�\r���\�\�@�\�\�1�\�Ɔ�I<*Xh95a�\��|z;v��p\�\�\0y���n�M352����Qq�|D#�\�\�.�Ǒ^��\�cnc�\�?n\��\0U\��=l:�E[�D\�e���z�>3e����\0�8��k�\�\�B�\�,k\r��\�*�j\����?�\�Ϭ}=�b;\�\�I{C�v\�߻n\�{6=::��+e��@[��c.�\�\�m�%���.3�\�r\��\�]\�J\�0��܌p6�\�>���\��\��\�׺]\0\�3cmwf��o�\�w�\�O�\�ǐ_@�e���J\��u���\��\�[\Z�eߜ���ˉ��5\�\�\�!%d1�$�IJI$�S�\�\�\�I$�\�I$�R,���yd\�uO\r�gi�\�a1ަ��\�u5\�\�{\�\�]`0g�s��SԲ*n����\�\�-Pg��_\�\�:\�k��\�1�p\���jEU81��2J�����P\�`ĝ\04Z��\�\�Xu�� 1�\'\��+&\�\�z����\0�\\\�c��1��@&1*\��5\����P���O���m�Cmv�9��ñ?E\��cN�O�Ji��\�\�]b�\�\'f���Gr�\�ja��j{\�g�s�~\�\�\��f�\�{\�}=\�-�$z-�G�v>�2�[\�c\�e{�,.3�\�kV\�\�*\�1\�\�&\�|1��X�+X�B#\��7��!����\0Ҥ�I=b�I$��\0�\�\�\�I$�\�I$�R�_W�-fHo-�\�\�\�e���uf\�;�5!���o��&\�HLM<\�qx�Xثu,�\0�b��\��$\�c\�>����;9\�\n�ou,\'\�X\�׏\�9ͱ����I\�z#$�Dz�4��\�cf�\0\�S\�]sA���4\�\�\�L�\0RW�;h�\�:�\06�\0��\�<#3�m\�\�f\n}\��f�	2�{�\�\�o�V���I\\��n�v\�Ȣ͝\�+p#�Wps���/�pi\�\\�\��j��4[�ٹ��������K�\�\�\�9�`:�\0��r�at]��<?�s\�� ~���.N\�)Q\�u�ѼZZ6��5��Н$����I$���I%?�\�\�\�I$�\�I$�R��$�Jy���\�,�\�?Cd��v�ί�\�\�*�{,���\��\�e_e��\�\�\�\�3�֍�Y��\�1suٵ�U<�dxJ\�i\�\�;\�y���\�\�\�\�\�ub�[JN��Y�v�]�w\\�(�X\�7ktR�\�\�\�UF\�u\�\r\�Ov\�f\���5�\�\�\�\�5v,c+ck�C+hk�h\�\�\��]\�\�\�\�`�Ⳗ>\�K�\�eun�\�[\�sk�\0��\Zꕌ\0p�ܰ\�$�$�Jf5$�I)I$�J�\�\�\�I$�\�IF\�*��vE���͖81�\�>wן����w?2�\�(i\�\�\�zl�\07\�@�\�][�at�_�f>	�j�ǩa𭿻��;�u�7�a����a��(�E��#}\�\��\0���sٙ\�W:\�u\��V=\�\�?94ϲ\����nG֬���n\�^\�bW�\�ͭ�96�Z略\�:�\0�⫑E��̱��a��B���\�-\�\�٘/03�k\�\��\��z�^�\�qz�\�\�`�^Ѩ������\0F\�AA\����x��%\�V�Q\�y]>\�O%��ݭՎ���{�\rʋ�e�B��Ak\�~�@�Ud�\�\�-X�]kj���;\�r��\�+Ưu\�u��� �7����\�{mԭ��w߳���l���]\�pmn��m����K\�Ϫ�\�	�zx=z�\�@m}A\�	\�\����\��\0؏�\�3덥�%�\�z�h?\0\��\0�q�$|�\�p�LD�_�{\�p��� �\�����~����t�6�����d[O2Ci�w��\0Y��c\�\�v-�3�b�_��\�ϋ�\�>�\�vڞ$On��Ӻ�M\�/\�\�5\�F�c=��?m\��\0�դ\�)$�IO�\�\�\�?\��\�K:}.\�p�\0l\�_�Y�\��ע����׭$Umx\�<\n�l�\0�o��ɛLĨ��⅞\�7�:�^m��U\�ȷ�\�qy\rӷ�*�\�8\�P�\�LLw�\�\n��pn��\�F\�I\���u\�:j;��t>�\�?�\�\�7\�1\�\��i^퍐˩m�2׀A�+\�\�\�\�U��\�c���\�h���m\�\�\�]Q\���\�,�廷��]�:�Z,�ܵ\�A\\[/�u*�r3k\��@\�\�l�M�\�k�s���\0\��5\�u޳�\�zFOS�o6YP\�\��Rߥ�\��\0�\�g\���G\��\"���xnn^\�.s˟[�\�\�����Fʨ�#ӫ�*�0�\0�vLFZ\�}F�^�I��\\cո\�\�y��E��d���.s\�O[\�u/\�9~\�b\�n��8=��;m�\�֗6\�I\��q�\0\�j��T��_�y8E9]�\�\�>�۹�o����r\�B���>K;�\�y�\�\r�k�6{�;%�6��\��)��5d9�k\�\�ǳ轤�꽾殓�}~���\Z\�-�6e\����m���ع=\�?*��IV��L�\0�(\�\�c�u��MI�\0�\�\�V��\�?\�[_�\��\0�Zb}�\0\�3\���?�>��V8\�\�y��#\�U��\�\�7\'C�!�P^\�t�\�\�\�\�`\�<G*A\�斑�ӹIJ�\�Zf9\�O�HQ[\0@��	){\�9� ��+\�/Q\�S��\�\r\��\�{�\�n^i:B\�>�\�\�V1����\�\0�?\�T�\0\�oO���cGs�`u:�\�\��佘�T֘˴Y:�\0\�j7\����)r��\�v~�J G�\�E�o�\0��\��8ލS����x��	�\'\�u�8\�\� V�\�\��O�c.���\��\�,�V\�^�@~+��]��\�5�\�\��-\r,�>\��^�7�ٕ���v��\�EB\�V�M\�ͣ�b\\H���P\Z\�j�\��̇\��=\�\�S�_�e{�ܗ��ۥv4=���\�\���q�\�\�\��]a�:=\�p{ݵ�\�w����\�%��\��۟}��L\����K��H\�Ř/0��\�L�_��pښ\�4xH�O�\�\�`�D\�\�9Y\�A�\rĸ7�-CSI�jS)�\n\"Ǹ{���\'\�#\�>ނY4�u<�S�\0<\�RIK\�\�-\�A-?�J�\�\08BIM!\0\0\0\0\0U\0\0\0\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0\0\0\0A\0d\0o\0b\0e\0 \0P\0h\0o\0t\0o\0s\0h\0o\0p\0 \0C\0S\03\0\0\0\08BIM\0\0\0\0\0\0\0\0�\�,http://ns.adobe.com/xap/1.0/\0<?xpacket begin=\"﻿\" id=\"W5M0MpCehiHzreSzNTczkc9d\"?> <x:xmpmeta xmlns:x=\"adobe:ns:meta/\" x:xmptk=\"Adobe XMP Core 4.1-c036 46.276720, Mon Feb 19 2007 22:40:08        \"> <rdf:RDF xmlns:rdf=\"http://www.w3.org/1999/02/22-rdf-syntax-ns#\"> <rdf:Description rdf:about=\"\" xmlns:xap=\"http://ns.adobe.com/xap/1.0/\" xmlns:dc=\"http://purl.org/dc/elements/1.1/\" xmlns:photoshop=\"http://ns.adobe.com/photoshop/1.0/\" xmlns:xapMM=\"http://ns.adobe.com/xap/1.0/mm/\" xmlns:tiff=\"http://ns.adobe.com/tiff/1.0/\" xmlns:exif=\"http://ns.adobe.com/exif/1.0/\" xap:CreateDate=\"2019-03-20T18:31:06+08:00\" xap:ModifyDate=\"2019-03-20T18:33:42+08:00\" xap:MetadataDate=\"2019-03-20T18:33:42+08:00\" xap:CreatorTool=\"Adobe Photoshop CS3 Windows\" dc:format=\"image/jpeg\" photoshop:Instructions=\"FBMD01000aa603000004160000b22400001f2600008f2700008f2e000023450000d04b0000b44e0000885100002c7d0000\" photoshop:ColorMode=\"3\" photoshop:ICCProfile=\"c2\" photoshop:History=\"\" xapMM:InstanceID=\"uuid:7ED322A2FB4AE9119F56CB7FC05C1DF6\" tiff:Orientation=\"1\" tiff:XResolution=\"720000/10000\" tiff:YResolution=\"720000/10000\" tiff:ResolutionUnit=\"2\" tiff:NativeDigest=\"256,257,258,259,262,274,277,284,530,531,282,283,296,301,318,319,529,532,306,270,271,272,305,315,33432;CB24F3EC25097D52BCCCC9C456727F39\" exif:PixelXDimension=\"733\" exif:PixelYDimension=\"762\" exif:ColorSpace=\"1\" exif:NativeDigest=\"36864,40960,40961,37121,37122,40962,40963,37510,40964,36867,36868,33434,33437,34850,34852,34855,34856,37377,37378,37379,37380,37381,37382,37383,37384,37385,37386,37396,41483,41484,41486,41487,41488,41492,41493,41495,41728,41729,41730,41985,41986,41987,41988,41989,41990,41991,41992,41993,41994,41995,41996,42016,0,2,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,20,22,23,24,25,26,27,28,30;44A260919C50646E5ED7247DAC8ECE54\"/> </rdf:RDF> </x:xmpmeta>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 <?xpacket end=\"w\"?>�\�ICC_PROFILE\0\0\0lcms\0\0mntrRGB XYZ \�\0\0\0\0)\09acspAPPL\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0\0\0\0\0\�-lcms\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\ndesc\0\0\0�\0\0\0^cprt\0\0\\\0\0\0wtpt\0\0h\0\0\0bkpt\0\0|\0\0\0rXYZ\0\0�\0\0\0gXYZ\0\0�\0\0\0bXYZ\0\0�\0\0\0rTRC\0\0\�\0\0\0@gTRC\0\0\�\0\0\0@bTRC\0\0\�\0\0\0@desc\0\0\0\0\0\0\0c2\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0text\0\0\0\0FB\0\0XYZ \0\0\0\0\0\0�\�\0\0\0\0\0\�-XYZ \0\0\0\0\0\0\0\03\0\0�XYZ \0\0\0\0\0\0o�\0\08�\0\0�XYZ \0\0\0\0\0\0b�\0\0��\0\0\�XYZ \0\0\0\0\0\0$�\0\0�\0\0�\�curv\0\0\0\0\0\0\0\Z\0\0\0\�\�c�k�?Q4!�)�2;�FQw]\�kpz���|�i�}\�\�\�0���\�\0!Adobe\0d@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\0�\0�\�\0�\�\0�\�5\0\0\0\0\0\0\0\0\0\0\0	\n\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\012# 0P!3	@\"$AC4%`5\n67�BDE8&\'9\0\0\n	\0�!1AQaq���$4��\�\�D�T%5PdtEU\"2B�#e&6R�3�uF��┅�Vf `br\�Cs���\�v�70@\�S�\�\�\'	��c�\�\�Ggw(8\0\0\0�!1aAQq�\�2 0P����\��\"@b\�`BRr�#�3��Cs\�Sc$4�\�\0\0\0\0��麰\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0OV<�3\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y8�S����\Z.���\�W��\0�^q��\�\�X�{��o�\�\�\�r�l�FYo\�[��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?F)WP\��\��3G\�YF4ܜ\�e$�}f?M\�Y+m,l�V\�\�ϮN̉\�5��\�z;6F�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��>D\�\�]dN�j���]�]��\"\�ӆ�I\Z�D��\�h�\�T\�\�3e�Vy\�\�Ͷl��8\��+���|�$u\�\�=�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0F�=VQ�:|\�8Iթqk�\Zr\�\�$M\�\0b%�$N�mqK.\�0l\�\�nE��\�5�(se�٫���\�\�Xo���\�\�vSw;�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�1\�m=\�7%\�t\�.v�Y\�n\�\�魽UR�v\�dbȤO\�NjV\�\�vU\�ΐ\�\"\�\�\�6�E[G\�촓�����z��-\�T}B��\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~��(i:\�5����y�\"\�\��|85nw\��j�,�\�;c�1�\�|\�=>,#ګ?�\�/3�\\�3S6̌�6\\�\�rJ\�]\��\\�\�_ѦJ��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~�\�V|zq\����8a\'Oi/h�/\�=\�h�\�_y���@!�����q��R��\�\�x\�l�\�ֲ_Sl�I�\����Wp}r��\�\�w\�\��?S?F�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\08WW�\�x\��dqt\�\�ʍ{�z\�J\�j\�&G���O\�E�9%\��Ƹ�(�Fx͞\�#\�\�\�>)\n\�\'��\�̈́�R�A\�j\��޶�\���\���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�ƿ\�\��{m͚�\�\��\�4j�t\��\�\�~fcg\�\�?<_8�s�9%)�ڦ\�ɱ\�C͜r\�0��l�ܐ~}E�y�\�0�֜�\�\�\�Yg\�/?{�V\�\�\�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�է3Q�?\��\�gN\�#:ঋ\��\�,��N6\�\�E�cdK\�db�\�\�r�F&E�ƚ\�r9P,�1�\�-8ٓE\�\�Ǭ�\�s*l#\�92Y\�\��B\��v\�\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0uW]�IM\�Y[x\�\�L�I�E�e�nj\�Y\�\�k3\�eqbce\\�Q�L_6%�ƑUW+t�1��,<fnXRş��O�\�\�\�s*.l0�<��\�\�\�?�.\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01���[\�r�]�\'�^�.%z\�\�/��,[8bE)TAD�kI�\�\��\�l��\�dx#�H�5\�m\�%3C.0\��k��[ZmP�\�j�\��7M\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\07�\'\�M<\�f}VK�ă\�+\�8\��䭋c\\F.�Ĺ\����G\�)�όB�\"\�\�\�\�q ��h\�-�\�te�����l�X\�=�2\�P��_]��\��\��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0?l|��\�\�O8׶l�\�\�{x`a%�E�$ȳg�]q��Ŕg�U\�\�w\�fնR!\�\�$�q�\�Q�lkh\�\�G����\�)w$c-K�X\�)&\�V���G2yj߽�\�\�\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0<x�q�1��Y�\�ͭ-ap\�ӆz\"�\�J�\�\�E|Y��62E�YS\�mW��>�6����efx��1�lb�Ԝ&η[�RY\�`�q�̘яv%I/�Vcf%6�\0,=@\�L����\�\��Q\�_�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0^\�\��\�~cA\�[[I\'[v�8bR*l�Ql�	\�6\�\�`DӺ\�,wdKm\�[e���\�k,�Z�we��\�G��\�@��<Uʓ\�\��s����Z\�ŉ\�x+3GHṘ�\�V\� k{.o_\�\�$ͪc�\�u���[\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0bѵ<\�\�\�t�8�jͳ0�^5ݚ�6q�K�he\�\�\�-�\�\�n\�\�M�#;F�\�dy�������!.da�]x^\�\�F9%�ְ�^0�,bqZ\�\�\�p�\\Y\��v�\0�\�-�7�.)�2\�\\~\�\�D��_C\�g \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�+O\�/7\�5��\�b\�RgW�͇�WR,\�)\�\�\�o�\�\�+nC\�t���f\�N\�\�c\�=��-2BA\�G�i\�b\��J$��P<��8)\n4�L\�$h\�\�\�\�N� \�y\�%�\\\�\��Z�ε&\�qV\��\0F>�ӵ\�P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�|\�ǩ7�/��ӋG3%���W\�\�l�\�v�\�\�>Z·\�k�>t\��\�dl��\�]�b	�<��ŏ(���\�\0�xr�.��&�`fh��\��\�\����:+EYV\�E\��:\�O^��:��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0藔\��]yL�v�f$HE\�\�,�\�\��f��\�/\��C�\���\ZG!͏�VXd�\�bJ�H?~vx?9\�O��{\�t�3��\�\� \�z:vĲ���\Z8U�Ws�z\�\����\\\�.\�V�J\�?v�\�F\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0yc\��\�\�ٳA\Zk:+qa\�:�Ӕ\\?E\�/;\�s��\�1&.\�6>\�WE�4H$Y��;<��\�\'��\�+f�čz��\n�:v���\��\�ƍ?\'WV]B�|_�>o[\�\�V�\�ǫ��?A\�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\�Q|t�N�շ/�a\�^r\�|_oؿ;\�r���߻)3�9Ƌ�ŚI��~s�y�8{�P\"�ci1�3\�OaW�}�ty^1\�V�:Y�\��\��z�m��\\�\0����i�\�@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\n?\Z�\0��˹.�z)�:�\�_6\�\�:\�θ�ߞ|\�\�$k�\�\r��b�\Z,��0�y\��\�O\��Ɂ �\�@�1��8���Ȟ��Ǧʻ\�+\�.jS�GQ\�<�\0[ݿ7�&\�֛����\�R\�n�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0=x���~c�n�\�_��x�\�[�\�M\�~G\�սM��Yw+m\�c�R��\�O�\� \�_�0?P0?3�$�Q洬��[^M�\�IeY�*&q/6YΡ\�\�\�uu\�Ls3�U�:���sI\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Uy��9�\�?�\�Z\�\�͟s�\0&\�y�]e��Mޅ\�e\�s\"\r�+|��\�GײI�α\���}��R)�=\Z�\�\�;+H������\�VjZ��6͇\�P��\�q:*\�.1�\�_\�{��\�l\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��h��F��i\��Sq�\��N�\�Ֆ�\�\�Kg�\�I#e�fd,�i��͗�\�V\�\'�o�\�\�^b��\��b�\�\�(�&��\�Lk\�^5f���2<Vd�m⻃\�\�/�\��\�\��v\�y|\0��U\�,;��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0*���[��W\�\�ӯ�\��ӆ\�{�\�;[\�Z�iE]d���1�du>�4�\���L�g%+6/ul�z\���L�\��U��՛���9E�l��j�\�gG\�lI9V\�q�!Wt�ޯO��\�^��\�\�: E\�\�˜�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�~->7I\���	�Svw\�}\'���nt��xʫZ\�\�D�\�l\�xr��R(�:^QQK\�U6{*��7�Y)\�͔b��1\�4\��]Ù�x�g[�\�*\�,�m*��vʇ\'?,\'D\�+ϓ+-\�<\�%�R\�|\�Y�W_e[��\�Jo��6Y\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0>p>WS\��\�/m\�\�\�Ⱦ�u\�A\��\0IY�G����\�\Z1Kci&<95y�\�\�s�DӲ,\�vUv\�n��b\�6R\nS5\�4\�Vh�cIXV\�{|Ǳ\�eU�\�6؞\n9���X����^��f��\�Ϛꃪ\�(\�{��\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:J\�*�\\\�\'hw�N�\05\�h\��ݛ$}\�[c�#G\�FY\Z\'�M%Wi��+o�\�#���\���\�%ہ�%\��B\�LN>[\Z\�\�nˏ ����i\�M\'fL��{\�9U\��\�k���e[���\�\�}t\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�}/�\�v\��\�潮�\�\�R��\�m�\�\�2�\�F)�=j\�<�s=&�,H�z\�͟*\�/b\�Q��\�s[�k�4,\�\�\��n���\�\�\�\�\�\�*]\r5d\�e\�ͺns�x_+��\�\�l�~\�dv�\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�i\��?�?��\�K�\�.��\n�\�=\\\�\Z\�N3\�\�\�M\���\��<o�\\�\�*Λ��9�WdOky�Zn�NC��\�\'dau�����_\�\�#\�\�v5�S\�9.w6\�ѷm�\�NZsݿ*�\�ە0blc���l`rgm6Ѳ��;\�|�\�k\�H��\�d>�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0y0NW�}\��\��\�l�\�w�\��6��)[c�U\�\�5��k���g\�9�׺\�+��\�\�5��JΓ����F�Z\��\�FZn�X\�_O[��\�F5�%q\�\�Fcf3W����oq\��c\���\�zǞ\��}�VYr��N\�����\�\�}k.�����\�jm�e\�*ۑ\��\0E��\0��N\�]�Wܙ\����\�D\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0g�O_��ɭk:\n�\�;��:J]��\�s_Fߠ�l5��[F͍I٩�4�3���\�!\"�;*�ns\�΂��\�m\r}\�\�+\���6I:\�q\�*ؾ���\�y�3��\�wO���\�&�\�#�\�m\�k�$�\�\"$��Fֻ�{�GJsV�r�HͽX\�◾�\�_���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\�k�\�\�UY\�e\�\\�Ӹ\�D\�D�\�f\�\�\�QU�5��y�XK�\\��&5j\��\"QU�˳�L�6\�\�;fk\��}���T�R쭲M�\�~}I�Ě\�I�����	�R%\�ضF�Ym�w^2(5w5\�򮧤\��1\�a\\\�\�~ƿr�\�-P\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\�9���a\�(�wֿ6ra�w\�~E�wSב�\�X\�u�\�+X\�]�8Q˓JVE�(ԕ�Y�\�[���ͬ)���\�i\Z\�\���B>��\�+\�\�\�\"�\0\�,�e\�ʺU\�D\�i,�\�\\Ȝg�\�9!\��\�+l�-\�}�\��\�\�@v|�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\�W\��\0\�||\�zJ?�|Sv6\�<O\�q�\�z\�4?+�]]�\�\�\�f4�@Y�I\�\�,����\�GW��\��1ֵ͘�\�#\�Wv0���\�׫$3/4�%��_U\�-\�\�!K�ŧ\�\�q��\�\'\�\�U֜\�����{�\�\�\�i�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�?\Z\��\��\��R�/\��n6\�\�&\�2̝\�D�\�O2���Q�\�q�+�:{%S,\�<m\�\Z�ݞ���u\�&+\�s\�g�e�G�H{�-2\�_8��I\�?56v��t\���y\�\��K/e\�\�o\��\0\�~��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\nh�{���\�*t\\�\�ݫl�\��L�\0.\�dO2J�R=G��)[Oe⩑t7}�^_�\�SμH\�\"y�x\�\�\�g\"<zҵ,X\���\�W�N��M�\�^i\�\��1���\�sk\�6\�\��\��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~�\�\�}\�X�gK�%Wm��Nl\�\�š\��\"I��c(\�oT<n�5q\�ZT\�#��ݽ<\�N�Ό~q�q*\��aj\�̎\�\�\��eF���c1\")�\��\�\��`t��\0��̬�\�ݿG~u\�_Ъ�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00|\���ߊ�eL�\�K9�\�ʉ�\"\�ԋ�\�&\��Vمj݉V�\�ն��gi_��@\��H\�ta3�\��WO\�|)��ޖ{2z^��C1#1��d8\��|�\�vG?\�v!g�^��\0W|\Z\�~@\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\rW\�\�\�\�P\�j\�n|X�s>İǛ\���V6��+�C\�:\�\�]g\��\�W$���#JXd��y!\�ׅ*\�w����\��oI\�&i6Սl�\�޲�R3[M����nĊLf2:�����(���i}#\�\�����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\Z�>ߛ���\�\�\�\�,l3>ĻǙi��X\�<\�\�c�[,t�=i�X\�r�]=m�\ro]#X呢F0���mvB\�<�uE[\�s�1�3c[?v\�G�~�����٭\�n\�\�v3\\��\�\�l`v\�ur{.�\�Ż	�U\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~;\�u\���\�\�}�{\"\�e\'��X�sǍa�7Uix�\�$Rp\�୥8V{\�L�\�]�<���=��vYd�\\pX�d]����\�(�b���y�\\`U���\�f���+{��c};���fS7\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�\��s�n\�\�3:\�u��F$����eH\�9��,q�u\�Fm8��\"\�,�_-5\�X�mg\�w+Np�\\��\�\n��>o�/}�\�\���\�z\�	1��9�Wbbl\n\�ƾ\��N���B\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00~w[�>�\��ϵ�k%��\�=ٳ�V٢��k�\�g���8NlQf�\\̜ي\�8���WF�\�uv\\؍\�m*\�\�\�>%u�N\�S\���\�\�\�5�}b���ht��p_�9�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0~1\�ߙ\�\�W\�>��o\�=u��\�^G\�6rO՚Ae���b�G��El?6y�\���em䈷Uֹ�6Z\�J\��:\��_\�\�\�db��=�u�U\�\�\�w��\�ۿ��\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�\�D�j\�5?3\���ϊ\�N�����\�Y�\�c\�\�\��������\�Y�J��<\�\�\",\�UʕWe���g�5u�\�G���ҷ]�x_�P|��v\�bT�)x\�{P��\�����\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:\��gI\��\0�v\��g�Iߟ1K_u�J=��-�rϕ\�֒}H�\�M&*�6�\�\'\�ʵY*��\�,�Y-�/5�^?M\�}��GA��e���9 �#\�Iԛ��\�v?�9 \0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����~%\�RV�����>,D��ճ�ji��\�k$Ů⮱\�.�Q\�\�WfX�\�\�/\Z�\02�l�<GĕnoY�mc�y��\�Vf\�-n��_ǉ�\���\�#lx/�\�v�O��i�ڐ\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0_�\�K_���CY\�Wj\�N�\�\�ĵ�]�N�\�\�\��\�\�y���\�Moqwc76����>Q�	t\�m�Tj8�\���q�7v�\�5U�8c�\�k�I�\'C1Q\�	{E\�g��\�&\�/m\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\00~p\�t_\�Vz��I\�o �\�n$p�\�@�\�1G�m�W��c\�\�sgG�\��*\�\�W\�ԋ]��\�չ�\"\�V�.Zs|g\�\��ϙ�\�o����Xɕ��\�\�\�_�̔�sS�c�{㷒|�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��\0<�\�\�~�[��5\�\�/q[\�Ǭ\��m\�l��*\�h�=�{_�,j\�\�\�\�+�,�\\\�=[�\\1��ԕ|\�\�_?�}U\�\�Zr�0%mČh�[{��9��\�w;�.8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����\06��G5\�FX�V6E\�6՛bؕ\�\�\�RX\�\�\�\�\�\��-Wy\�\�oY�}:\�\�%�\�gej����\�kr6�B�Mx��I��\�W\��\0��{�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0:������7�����]\�Ll�W]m���Fƞq+/x�\��2�6�\�7\�\"yy<FϜs$hy��h\�l�(�\�Ė8�m4dy5�%\�+����\'��q`\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0x�硟�v<g\��Hղ�g�eXݙ�\�\�2$�햌$\���\��[Zb��I28�{D\�Q\�3\�\�\�\�5V\�&\'���n�#1�[�S�W䛖�8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0WR�z�7}�\�\�A�U�ٜ{�\�r�Ȼ%\�h�cpf\�&\'�Q�H�Y��,Xъ\�w��j�Ċ]��I�\�zv\��\�v���p\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0R\���GmL\�bN�y[�\�d��nF\�\\e����\�ZF��x�XG��Cκc\�\�	1��\�\n=���6Q�Z\��\Z���\� z�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�g\�Q? �f�wGy[��d��[t\�Ze�HJ�\���\�iY>o�dE*�0M>1�\Zۿ)-\�HVdi{F�?G?�>5�n�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�?��=I�S�\��\�巙v�v��ȳ�$2\�$-�<Q��S\�v���:\�q�Q��\�ݝm�W�\����\�5\�\�\��\�Ź\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�~x�\r�s\�a�O�U��y%=�ley�vd�\�ka\�1���\�\�L\�\�\"cf$b��TvU���f�\�v\\;���\���̾��\�\�~Y\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0u_\�I\�\�\�L\�?)\�R�J>%?>-\�r\�94\�̌�\�l�$b��?����O\�(�f�\�\�q�65eKK�;�\�g���\�-g�_��}�}_\�_A\�\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�׫�\�p\�\�d����\n\�\no§���\�\�e\�,\�\0E\"��\�)U�ۜh\�=F��\�\�M�\�#�m\Z�\�ߛ.��\�?@\��[\� �\��\�\�\�t:�\09\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\01��\�|\�Y\��\�t��\�\��\0�qß��O��\�li����V\�vDm��oq�t8\�J\�X\�e&�T�$�#\�Ckhm=[vA�틑�s\�&��a��\�5u�\�/G\�K��\�;r\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0Wj\���^��\�\�:��濭I\�q�彇͗\��ń\�F6Q\�~4W�\�\�[mU\�ؑ�\������orh\�\�\�]�p\�]�\�\�շ$#};\�׵\�1���\0�n}rζǲi0�\�~�K\�y^�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0�q�ώ_�t<���瞢��\��|Vѣ\�R�\04�W\��ɾ����_�E!C�\�ӴW�cҘݒ��c|	fYE�M�!�\�d���?]\�7\�e\�\�\�\�\�=\�����������<\�jl��\�R�\'m\�\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\�\�������\�^,5Ĩ�ز\�(?�E\�o\��^z�\��ߛϑ��SR[\�(s��cDr4��&T�v#\�I�Is}ٗIYX��!�N\"�\����<\�[��iY�U\�d�\�y������n\�\�}`v57���\0\0\0\0\0\0\0\0\0\0\0\0\0\0\���zꞃo\\Uv}\\RXq�\�t��!�\�Չ\�\�/��︮y�~|\���\�%gM�o�O��W�\�+�\�V����z\�l�(eM�~�Z#cH��&\�ǫ�X�k\�8\�]?Kh���\�Ϊ,\��`3\�\�=�J_\�Βe�\�\��\�\�\�mh;\�\�l�ѭ=\�\0\0\0\0\0\0\0\0\0\0\0\0\0�:֫\��\�Z�\�\nv1\�\�(\�bf#1LJN�C[\���?k\�>�>y��{ߦ\�_�SL-z%�o\�:��ѱ\�`FSӋZ\��u�\�����$���?\�9�~}�\�oi\�\�3�\��\�j\�~��诙\�\�VE�|\�\�<ܐ�\�u�I�\�*\�j���\��;\�\��fS�\0\0\0\0\0\0\0\0\0\0\0y!x\��3\��<��y�N�cl\�1\�S�\�]ǻ\��L�\'UiM��\�\r�\�\�\�~k�+G\�~�R��RMaS�\�?%�N��>}wFP\�Eٮ<�q�����$y�F=\�ޫ^�\r\��=�~���\\\�q/4�c�\�JZy����꣛\�$TK�Zb|�Iddg�.�\�\�g7�۶�\�w;鿩\�ˠ\�\�\�\��\0\0\0\0\0\0\0\0\0*u�\��WN���[��Ƹ>�?\Z\�μH\�\���t��#�[�N�#���\�\��\�Ϣ�\��Iv����_@��X��4\r|\�>�^�\�\�4ǈD�\�)\�渎�=�}\�杆��\�Z\�d�\Zr��b^a5�*N�X�?\�}xs}�D��\�O�\�$�Xi\�3e��$2E�ɫ\�\��#�\��{�\�av\�sO��\0\0\0\0\0\0�Ǟ�i�t\�Y?��\r\�:�V�l�\�\�l�7]!�\�ݖ�	G�\'�l���#M��k�\�vm\�FO��\��6[#��gZ�#MT����z٬\\���A�Ρ~1�\'�\�\�\�^A#�a\��;��\�\�yi��j��F��jC_\�Y`��_�>����y|9\�z?ę`dg\�\��\0%�J,\'f1��\��>\�ˠ\�͋�����\�z��\�Z\�祷�\�r\0\0\0\0�4�}\\&��\�\�l�۬xX\��\�Y\��\�a�J\��B\�\�\�\��-ы\"Ii\�a�#�g{�G��\\Ys�pZ\�~��c��Iy%b\�F����\�\r�\�^o��?\�O�\��\�\���\�R�\�\�_)\�\�\��nϢ�\Z��1�{\�Ɗ�bF���ӆ��\�\�\�gH\���T\�:?ęc�x~�\��^Aē\�;6e�E���D�2�b\�?�E�cf�|\����x�\�tU[\�v�\0\0~�&\��\���gVu���:�<�Lƥ)q\n�ƭ\"W��b\��A�dI$�9�����8\�\�ш\�b?�\Z�λ\�߸\�~��:\�~r6[\'���\�\�N\��\�#{\�\\�\0Zzf8�\�t�G~t�?>q�ٓʿ��}\�����o\��\Z��v8`�s�k��\�\�O^���\�u�?\�\�g+\��\�az�\�I,ID�~�ϲ,=@�2RȌ]\�g\��8�2:\�w�Y#wj\�\�{�\�\��e����\���SI�7�qT\�¬�aw\��++�jXR�(�ŭ#O$���\"��$�\�\�$\�щ%!\�ύGg]\�gq��V���\�ò޼��\�g�8JӊKv\�U\���jh��\�~[�#�g�7�\0D��>E��ux�X�6�HՐs���A�\�NN�Ka]Ëz��$pv�\�:_ǯ> �YHĿ3\�ϨJ\�\�K\�3\�4F.\�숱\�\����ӻ.\�wr�������/3s\���|ˢ�J¸���#7bdV�%h\0�	%�*�ǿ;�9��H\�d:BH=\Z�5��w\\g\�wmY��;�\�,�j��5�IĝY��\�F1ٞ5��?1_o�	�>\�\�>�~�\������T\�\�\�\�9_�+\�[��6�l\�m\"i\Z�m��\�ߛ�\Zn����\Z��\�x�Y�IE�\�id	%�\�$��md��8�.�c�yi�3����F�\�XV�={�FDď)r�I$���\��A���V�gO�#�(t��̤xƳ[���3藶��.\�]�\�\�|�۸\�>Tx겇��j_&�֥�aY�\�_����\��\�����~0�\0�#i�0�H�m��\�\�ؼ]:-��\�5�Y\�]�W��@�\�P$�A$�2BP,�Ăg��HЗ��A/$�y�;0\'k��\�%iZVO �J,�ŧ�\�Y\�\0�E+O�d��\�$\�]71\�7m\���2gxV�\�\�Y-v.b̴���y\�ucoŏ\�>�\�)��;e�7�,�#}��\�\�}�@�\��\���X8I\Z^�N\�\Z\�o;\�S�^<q�6=�0\�\�\��$�h�]g|bI$�I&y�$���\���&�\��{�o�YAbR�/�?\Z2\�V��Ǩ��\�,���J#E���1�H\"�A����1 \�z֧\�ߴ\�{\'�\��Mk�ZB�ϩ�{]*λO��c\���|��R\�\�0q\�F��t�,j�f\�\�Bo�|o?\�l�lx2LJ^�N\�\Z�o;\�ӎ�>:�\�,:W\�;zD\�·�\�4I,3�I\��	\'�\��#�\��э@�����;\�\�b\�I#�3\�\�\�<+#�y�=Zd�+�\�\�\n\�[��>e�;3��+H�J+\�F1�\�\�\�1\�\Z�5_Cݿ؜\�=���\�?-\�X\�*.\��\"&�ȏ�\�;��\�y\�V��\�[E�i<��i��:z\���\���fp�\�U�2&e]�fi\�3�ǟ=K�T<�QZ{\���I$��l�^�2K\�$�񢴰\��\�\�\Z\0���nV$rNг�g��$\��Ic\�2e�:$�%n�=��/|\�Xִؒ�\�IZ�KP<eii#��f���ߋ\�v�\�z\\v�i��Y��Kwy^���\�\�/��2\�\�kޱ\�\��p��ƽg|V\�\���?\�?��\�:|\�_�\�\�d<JʿR\�Ӥ\�\�Ex\�\�\�\���\�[���YQ\�G�\�\�lO �Y��h�{��c@D���	%c7�o�\�r1$�f{tɭ$�OFE\�a�ϓ\�/Ԓ�ͨ��U\��HĂ9vH#�1\�g\�gM\�w_\�r��\�g�~�o&q��\�\�˫lz��\��\�o�\�ſAE\���\���N����\��[�ɿ�B\�V9\�\�\�>�����ws\�}[\�o�­+5��\�)AD��\��n\�Wĵ�$�O\�ROD�2I�ۢMa3\Z,�27\�1�\��\r�u��Ib1䁇�+\"1\�6\��\01���6RIy\'i�<I�k\�M�u��E��F�֖�vR�k\�	r1vV�Ic\�\�<�\�6\�M\�}t�>\�3\�gE��&ѯݗUX�&��\�3i՗��J�\�\��<_k\�=��>%d\�|�.Y�7���{����K��s�6�\�YҳIoݧzŢ��\���o�o���?�\�\�1K0{tI�=ђܝ\Z\��ϭ�g�x=�\�We�C�\�!7N[3�$bI\0I<e#2,Oߘ��xI�Hő��-+b\�ˌ?BI�n�Zx<�@�<�\�\\`��S}�\��]�[\�\�\�ɻz\�\��)\�\n�\�\�:��\�\��ՁU\�m\��:�0:\�8�qٻ�ƷT�m����\�\�Sv�W\�k\�\�XU�E\�\�\�h9\�>��ꣅ\�1\�ŒF\0�J$��\�R(\�l@\�\�gd\\G��Y��y�l�FbI\�6!dy\�AY��\"�d��\\��\��b?�*�k�1\��)q�غ\'\�ńyե�\�\�HŐb1\�.4\�gy}�	\�Ŏ{�\�۝�7f�osY\��9��~#���+�\�m��ґ+�������\��I\�c�>қ���|����r�\�Z����\��=B\�\�<�\��\�π����%a#*\�\��~u��c\�9��c\�\�ḍ�ЌY\�<\�+H\�\�ZJ+ɛ�8X\�\\0e�x\��\�I\�I?�ܥo�]�3�X\�{���\'&C)J#AXy5�]��_9�\�d�׬�è�����$k\�c��\0\�.ƹk>����5\�\�Vl\�\��5��\�\���w9\�u\�\�\�>I\�\�xźl�>�.��ԵϘ��+W\�$���I�X����#\�^lz1�Afy<A\�+\0+I$b~u\�O\�\�\�82�\�1\'(Ŗ��\�\�&�\�W�Ԝ%\��\�*H�F��5�n�9F\�ȭ$\�u�r�\��\�AA\�wG\�v�q\'�k,�{G�$����\'�\���\�����,y\���݆#���\�2��\�n���m\�\"~��?�ϩ���.�<����~o=gC���\�~]8>搬?G\��.��+I%nY~3�2�\0;#\��I�F$�JP\�u�$\�x\��g\\c\�$�y\�vC��\���ď��#�D�1a\���\�ZA\���$��\�I��1I�}kA�\��dNZh��;,\�Go�-�\��u�ܰ�\�+mz�\�/)���\�Z�N|�\�cWK\��:�wὐtm���|\�\��\�w���\�񢴲#I䗍�O\�u�<\�+J\�?x\�$�	$`�ՑY\'H�J3�l�\�$KLl��OZ��;.�,��Y�Aa\�\"X�\�$�n��QHx<�2�V�~��.t�\�&�C�6̘|��uy\�}7�\�}�/߻--�L\�\�7\�l��z辳\��&b��\�^�����\�\�\��L䞱\�\�m�j\�:�3>k\��\�U&�\�rA$�cg�uݕ�����J�\�Zcg�\�,��D\�y#q�]�d\�$�6,\��l�?9\�\�1���\��!$�\�A�e�F�*]�ir�2\�N�\�V�@�<a+(\�b1�g\�\�\�I\���DL\��_F޶8\�\��z\�\��<\�=�c�bƮ�\��V;<jɍx�\�\r[�N�\�\�w\����w�j\�Vް\��\�)�??7\�\�k�#�$�\�ȥ�j\��\�\�>+	 �\�\�H�ΰ,HǓ\�6G?9\� y\�\�/vu�Ei�\�;#e�οQ�y\�\\E%I�I\�lh��q�\��\'+,,K\�1dW\n\�I\�Wa�\�\Zώ��N�M69:\�.\�|\���\�z<\�%���\�\�_9A\�\�ͼ3���,鷧�\r�\�ߧ�\�\��Iݯ\����n��j�6!:\��\�6J$I�\�`Fb2�,1Ք���F<��\�\��%%�8=X\� ��r\�w\�\�9~3�1x@?�\�\0\0\0�\0\��WI��K�8�b\�\�!k�\�U�\�]\�~��z��\�59�u=��)Wdtͽ�#�PB�\���P�\0\�Z�ݷoK�ŪQW\�֧��l[�\�}�΀���ĆJ��\�ۺ/�!�Y�d�����p\�Pު\�(\�2\�\"ض4\Z\rF��ž\�	�!ºUCc�Zg�*u&�kS��UdѥԵ`\�t\�\�L�\�#Q��\�8}�\�\��p\�\�ƦS\�\��ẍ9��*��]\�i�`�dF�C���O�\�pS\�t\Z��D��\�\�N��ȹQMEQ|nI\�Q3��2�\�\�\��t�:E~\Z���aD\�\�!�5h��\��˧\\!5�R�Ҧ�\�\�\�\"\�\"\�>΃A�Ӷ�\�\�\�8�~\Z��-L&\�ۜfI\�)�\�I��g\�8}��_~�aD\�\�\Z��T�,�d���\�\��an�n�gA�\�UH��LsU3Q�p�\�f�\�M�s���\�G�t]�.�_c�p\�0�gMX\�ƫ/�?xI���͵��%\�^1x�\0�4\Z\�]\���u\�5����?��9&��\'>�GRa?����$g�=V�\�Z���\�Q��.R\"\n�HQ\�\Z*����\�v�\�\�9\�\�:�M\�:\�\�(pD(pZs9�C�r\�9s�䓩51ww�|AZ\�5OSIQB����.ej\"RV��ʴQ\�\�Θ\�Ls�r�͘\�\�&�\�\�y^�8��Ns\naA\�c�Ǩ�Q�\�\�,=Tͧ\��K�K\�hZ��\n.AW4����(�5�Sģ�tU�q\\=����\�|t�劂NZ�S��Nm!ͤ9�\�\�����u���>\�I\\<t�M/�;X��L��ط۠ӳP����rdj�={Q��j\�Ê��\n�[�\�fc�\��p(\�\�%0�FH\�sun�\�`$\�	�z\'X�Cӱ�d�Y\�\�;�ʢ�~@\�@\�B\��8\�pⓥ˝B�)\�W��s�-\�-[�EM*B�d�GY\�qF|>uJ�r\�C\��8\�ur\�.⣩E\�EU�ϝ\�ĶTΦꞔ��	�u�ie�\�^�\�b�x�J�\�4\�S�\�[�)����\�[�\�@��\�K����jˇ�kN�dFO\�\'>\�\�*I󓢧*�4?}hZ�)\�\�K���\�[u4.Ȋ������\�pU\"��߅\�@}�\0�\�i\�\�)\���]ݕ���FE��S�T۸3Q�<T�;��*��\n{��!�wb�$)\�C\��xb�\��� ��UK\�֫Bж-�bش-b߷l[�x\0�-�d-�L\'\��x\��.\�=̩���^�J�\��v*\�\�e\�vűl[4�\ZF�4!�\r\�І�\�\�\�\r#��d��	��?�/?�\�\�,Ψ�\0�\�\�\�\�4LȤT\"�C\�\n�����u[�P�P�P�P\�r\�\��R8���44	��D\���>55Z\�A�|$aAW�\�v:�@�u\��>�x���ᮏ\�R-���\�#:�E�E�E�G/�&�\��s\�!�\�PڝSo�I�q&�:X�X�,ښIO\�f�\��]��P�YF|>�֙\��ª��\�4\�ރ�D3�2\�4\�\�HM\ZBh\�N�U\�M:R8i����G�\�P��N��4�p\�8)��\n$B�%Q����$u�)�R\�uSIQO\�2Zxd\��p�,\�\�Q�E�jH�T��Q�\�i\�TF��V\\\�\nO\�H���a7f�e\�P\�\�ȓ�����\�\�J[Pz\�C\�j	ʝF�\�!p\�\"H�\'B0S\�B%J��#�5;��\0�羕}�b\�QƢ��\�?P\�\�\�\�~�M%\�\�\\�\\��዆.��\�B\�C��\�H�*j.k��P\�P�&\��\�tZsP:J�\�\�\�H\���#�75Z\'�{\�W\�\�P\�*ҷC�\��B�\�TF�\�A���^.\�\�/�.�\�/�.\�κ�FT�&�\�548�T����U7�Կ\��\�\�c�\r�?����M�\�|)�\�TU\�5:���5n)c�\�u�\�\�\�Е�29\�R��ӫeWe¨\ZgY\�cC	6����~Bj\�Y\�EUr�TctЦ\'Yq59\�\�F��#R)hS@���\�-\�O�2�0��V���\�&2�#\�y�Ia-UbW>\�E^\Z\�hZQ6\�Rܘ?����\�R_RV\\���^\�9Oce8�n�UG\0\�\n���T�E~C�j��\rQJTR:i%^PwA�\�\�Z��-R���U\�&�����>\��\�k��]_�\��\'{��!�v�J|6�҉�)��\�u\�\�UP�z�\�ܨQ=��\Ze\�sM%\�\�09�p\�\�\n\�n\Z�\���33	\�;\�km��\"W(�Er�G�\�=N��\�2QC�\�L�M=~$\�edt\�\�WΓ\�\n�\�#&�,\��\��Yʩ�n�\�\�\�In�{��P�e��\������>b�\�V9�\�\�/P{p׶�}�����f@\�\�\�j��\�V>�yj�-PM�\��ԓOBM2\�?b*�\�\�k�W��8���UU�ue^3�\�Z7A�\\�OԊ�=��,�\�b\�B\�Bɋ&,��aT\�E\r�>&\�Tt�(�i\���d��A7�\�\���\�;\�첡)����{	v���e��E�E���������\���n�:�L�{\n���w{�2A@���\0w�4�O�\�%n\�\�\�\�AD�\�@�\�{^�\�~ݱoA�c�Ɔ40~\�J�\�\".\�]\�;p\�\�\�$�%�\�6t?f�Rk\\Q�����]\�{\�	�v�&-�bд\�MC\�%{Yw�\�ٸ\�%��G\�\�\�Q�\��P*�Ԭڪ��~\��h\�O�\�~���Kƚuj�Cl\�͎1��\�iMM\ZР0~\�C\�(��\"ښ\�\�\�H�j}\��T+\Z\r=\�_��4�(�gИG|?/jn��\�M\�\�(��T�\nG\rH\\�\"C�)\�Wyw�\�~ᯆK\� �U�\�FT\��\�J�\�\�R6�{�	+�I-E�p\\E\�p\\c�)\�Wyw�\�~ᯆK\�8O�M���\�\�;�Y�I�\'\�T��\�\�0dc��W#x\�<���\�0a4�j���K�ꑥ˫�&8O��ځA�����\�tG���f\�5�\�$T\�\��\�lc��W;f�~�\�\�\�a*,\Zr�ir\��ciZ�b\�a{��\�h�Ĳ����q\�HY\�\�~\�1Ow-P\�	��I!l[�#��-A\�zd-{7E\�h��6�[�M\�R_�������dc�T�I�\�NX�,A$��ŰO\��!D\�ɖ�A�\�\�cS��73��j0�c�(�t�Fhח\�	�\�\�$���!\��I�Ѥ΄�\n:-pFpZ�\�+\�\�Q=B����\�{g\�7�\�\�\�cx���\�6$\��\�a0�Z\�s*b�z�~���Di˘U��\�Ta7�>�\rP�e��j\�[�ړ��\��/�15ت�Q\�K�R��c3U\�諯�m\�\�&祊�������\r�Z\�-�B�B�A%�L$�\0B��\�Υ6ա��^Q�<`�=�{�\�k�U6mEi�\Z\\*Gۑ�\ri\�\�\"\�\"\�\"\�!ԑ�ޒE�\��G�)MV$GX>�\0h��L	��	�)V/Ч��i��J�^\�Bj\�\�d���^B`�\�\�\'_I\�8�N�\\LF�z��\�Z\�8dؙ��\�x̕F�xk���\�4�\�I%#Y�.�t�] �.\��\��\�+:B�L�\�@̔\�W�\�\�fD\�\�\�_���i�\�Z�\�1�����/\���3�c\�G�d�����>\��h�\�m\�r1h㏋�\�}q+b\�i{��.��.N�\�\�9Qʄ\�\�Y�\ZU�\�\���ґq�*\�\�`��].�{\�\���\�P9�1@\�(D8�]}�b\�a���IDG|rr.�Frh�\�ҽ\�w{��\�\�s9����\�.{v���B�e�\�\�K�\�b��\�\�hcC�6ŽB�Q�\���\�\��v(��ձo\�\�Q��|{u*M�z�D�gQ�\n�T\�\�\'\�DPV�\����t\�Bܗ\�\��&\�MC�\�L�/�&���e��ʚ\\W\�R�\�J)�\��5	�|s!zi�ϣj��b!/�D�gQ��F���P�\�Z\��R�2QMC\�*Tg�\rQoȩ�ڪҕ(-T��\�\�\'Lwb!.�+:�4ʢ\�k\�u\Z�b\�M=i�\\ ���35u���\�QF&Dn���.UT_p\�6\�ʾU�\�_�Q/�\�Ei�zl��t]\�\�)�\"\�d-��C���/*G>\�z+t�7U)�ވM=l�mB+��YjQ�Ԓ\�T�cI\�riє\�\�J.\�$\�\�\�h51���Ԏz�dY\ZR4�s�9\�E\�p\\�`\�h�����)��H(���Y�\�]�\�?�;�A�2x�f7\�-�Ĳ\�R�j�eR旳t]\�.�\�.�\�P�Wktv�9\rU)\�+�F��\�\�EeR>]�\�.�Q#:�fn+��Gۍ�ˑ\nj$\�\�#�WB\�\�M)�\�]{x�q\�qT8�U*�B�\�\�	�\�EFt1��_�7�\���u!S<�\�:k���b���/���\�\�\\V+%�׳�Q!� k6��\�D*��Y�U\�$�r�AH���F�\�6��H\�\�ǩ���\�\�c��ުM#\�+b\�b\�\�7ߔ��j��m2�\0\�m�(R��T\�N%�H-6\�`n�\�)P\�*LY?f\�\�&h��\�IuN����\�#�,\�\�d�|���\��_\�\\F7K\�\�\�\�4(�%�\�I*|�8\r����\�_��\�\��PlrESw�8�\�5��d�\�\�|���\�:�\���Dt���\"FA�\��z�$n+^N��*�2�-Zb�\��{���\�\�\�\�Eh\�A|*��~$�=RL8\�s�=\�*GC��\�Q\�sm��a\'(,_�Qd�\'Y)\Z�n�#wUF�uTi�*ŒK\�\�T\�T����K�\�\�\�EEHJ������Jc-r\"\��\�\�\�j��}Ʒ�\�0��ю�Ev��|*��~$\�PFN;\��OqG���8��\�jt�5�Be\��\�\�]?��J(�y�)2\Z\�:\�C�\r�*�W�����\Z\�UjPfJ��b?��>#N��\�s�\�:�Uq����k�\�\\)��_\'�\r�Qc4��7:*o�(����(�]����!	\���UME\�LȅNФ+�6�EPRu\�S\�\�>R�\�W\�\�4�:\r;\\�\�Tb�\�H6*�du\nQI\nBu�DPUJAbJ�r<1[\�P�\"���\�ӓ/�a�B��I�����zh\�g�^/�r�R�\���\�\�~�$\�$��3\"̱@�ȕ�\�r\�s\�űlpT8*\n�B�?B*�r�\\.\��1�T�FD\�QQ�m\�Nc�� \�V���\��G�\�\�׉`j�LF7Sz�._�_\n��Pu\Zt�ű3\�K\��KUUv#$�\0�\�_5\\���rMhZU\�\�4\�\�dU�\�G\0\���d(��2�m�]/��Ze��+�\"\��\�9��<�E\�9F5A+�0�G\�)6A��(O�\�j�{hL�M1�H\�L�R�~е\�\�(9�I\'%TSU5\�pT8*~,�!#��+�\�\'h�&H��\�(\�\�-\�!���\��\�\�\�\�^#>MSQJ+�G��PW\��(	�\�w��m5֙��\��A�n�O{�\�ܟd\"�\�u�VK!�j��Q?`�\�5>*rG5�\'\��l|\�lx�ښ�V}G��`UҠ�\�\�P\�\�o�]�΃O����\�SJc;\�w*�*\'�\�@�B짹Zhl�I+O+4V��0��FSX��!3Vڸ��i�M����e$�X�t\�p���\"�\�j\�\�\�\�d��kLV���j*�\'\�m\"\�*�֦��5! \�\�2?P��+VtU*�d\�82��\�<Iv��2\�\'�?�\�ޟ\��x��P�\�Y3\�d��J>J&,��z\�kn�dt�ܕ$\�8\�#�|�\'2�\�6�\�2:g�Bɋ&H$��#ޟ}=Ӟ?\�j5�\��&^&><hxTOP�dOZ���[�\�!?�\��W�%R�R\�莢��!BF\�\�MO.3�lU�\�$�j�z{\�\�.\�\�\�>C\�8\0�-���Q]Ɋ<\"�\�%hԔL\�\�N\�\�&\�//K\�SN�\'.\�\�&@a0�Fb�a�X�u�Y7͸C\�x{P�N}R]O�pR8)ž\��\�Wrb�b��:\�Iq\�.�-RiTt\�\�r\">?��:rRt�PZ���P\�V*�Z�f\�IQ�Bb�d�u�j\�\�����\�@H&\�:\�q\�f\\)\�\�i��\Z�\�f�WW��Zd�\�<m���*�c*ěc�˽ ��n\�\�4\�M%����\�k\�\\wE�A0�u\�\�\�Ap%��:]J\�6HSE~ĉ��P��9B\�*4\�\�]N/Z�rܪސWķt�����U����^��zaE5\n��ҥ2\�s/)���J�+P�K�Cй�H\�,�SZh�Pv�x��i���E�w�(�h��\�X��UC���0���\�\��5�U\�\�2\���c\�)\'�+:\�:�a4\���;TʼAO\�\�\�S*IʇA��\n\�2?�#u)\�AO\�\�8\�J\�(P�\�\�\�\���;=\�J�(�,n8ѧ��IR\\�	�-�Ҧ��\n�\n\�\"4S:\n]^�\0B7S�7R�:�B��i*3i#r���{c�R\�\�GՍE\�]2n�2�=;�z�՚�Pʶ��\ru��\n\�*i\�\��\�\�7\�\�N��j\�*��Ҧi\�g4\�\�cm\�NF4��\�r\�\�wi\�)pH\n�&\��W\�Pd\n\�Z\�\�\�Lƚ�f���x�\�\��\0���4�c$���\0J0<\�[�N\�]�=\�7��\�\�\�Pd>>��0_��\�\0\0\0�\0\��WA��MG\�Pg&��&����#�ȴ\�S�\�DQ�SQ6pFI9 ����M\�*�+Y4��UJ�Mz˒\Z\�5�qR8�\Z�ԅ\�tQQj��Wj����N�UH�U:�\0к�\"��J�;Y`�fa4\�˞�\�C�q1\�.��:�:+2.ğU&�5�⸳��\�4�\nP��]$)w:b�PΚ�x\��\�8��b��ΣM=jt]\r\�H\�\�eUU\�\��\�tHSEJ\�yZq\�dT����\�W�\�c���\�U���(�PJ)��B�\r���pGK�JJ�S��\�QWO\�\�W:\�\�!\�.��\�\rC��\�P᫷A��\�3��\�4�	*P�7P����MT���2\�\�	\ZUkd\��#\�g�p�\��?f\���즡���j\�ꩱqR��	Т���~\�\n;T\�\�w\�\�p\�\�x\��H%ڢ�Q(�\�mԮ��,�d�\�7�9�\�\��s��Oݤ\�MC�\�L�)D\r������rU��\�ަ�\0IR��.���#��\�\�t9\�iQ�?z\�\�?o\�>~�T��QNۢ\�o\r#��\�{��^ \�L\�\�o��Z\�4��֙�\�A4�J�%\�Z��hZ�\�i\�P�.ƞ\n�&\�>\' �Ԣ���M)�\�Z��$��͡hZ��kܨ�PJ)�kO�ǥh?�Ȗ�\�&8O\���B�E��B�,\�ffi3�N@\� c��\�r���\�V:��Z+UZبX�rÖ++�\��0n.6���k��s\�H\�&ޓ:��E�BL�	3�� C�!\�\�ri�M0�u���R\Z�\n�E�G,�\�hh�\��`*�����\\I.��\�n�41\�9c�\�C�&ޭ��\�N>�	334���\n\�\"\���H�Oo$9!_\�T_�Q�\�&=.�\�uK�z]C\�zA�\�d�3\�\�G��\�^ʻ��/�.�&�]��\�\��kQ�mMi�ܵM\rBQ�\�\�\�&dfDI�#:S�����\�T�A�\�8\n�\�8\�q�\�1�aFe��(#p�h\�2ײ�\�6\�\�QT_|����QWΊʢH$�\�\�H6eQ\�ݝZ6cU5�\�.\���{��{ˢ\�k�υt�\n�|*Q��U↫V_u]T<��\�5��\�$	$L�lʞ6\�\�\�&EH*)��\�H�~\�=\�x�\�\�w�t�S-TL*�<U��૮\�\�\�ckZ�u	:8�IP��D\�3:У\�ރ:\�\�|>\�/\n=���}ʁ^\�\�,��\�Z��\�^\��-��y��N\\U*�j�J\�$Fm�-$GSZ\�\�%\�G��A��P+ڒ��ij�Z&GWcC\�q�\�\n%ܗ� �d�\�d�\�k�+l੣\�Z�Z�]�]�\�\�ʀ�����ȋR/��E5Бh\�H$%\�[:<�Ғ\�N�sdœ�^/oB\Z��>�\0aǁ\�k�\0\n%\�\�𦞡4̉4�PzB%�UҦ��Q�\�!\�CA�\�k\�\�5�x\�t�F�Q�����rA\�\�\�\�z\Z�\�\�\�\��	&Di����\�:\n��	�[��F�Q�\�!\�_�\�CB\Z������rA\�\�\�\�z#\�͟\�\��\��P�8\�N����:S���9�sTj�\�P9�H�M\"2M@�����\rK��\rC��\�H\�G29�1@\�\�\�w��%A�\�\'��$�Mg[/�ׯ?	�\�\\eU-h\�)%�\�G29�̎ds\"�S	\�Td��f��΃Nڼ51\�\r\�c��s#�\�\�E�t6\�k�iK�ͦGWd��*��\�\�-iF�\n\��\��5=(QM��\Z���gZ�U*Q]G\�c��\�5J+n�\�Bi\�HȽ\�TQ3#V�\�D�\�\��UD�\nT|F8�^�^�6sU5�����\�\n�5\nt⤊���e���F5-+�N�j*dJ(N��I�\ZqT\�i��\�\�tC�zzd9b��H�\�Oܨ�WO\�D©���H(�T\�i�\�t�\�\��H�zG�p�Z�iC\�,+�\�\�J8���4]�t֯�4�ΊOJ3RzZ!h�I!5\n�g�1�8�\�\�h>C\�8p\��شB\�D\r\">)����\n�5\�u[\�.\�:��t֯��&�QA\�ЭT-TL�\n�t��\�\Z�\�q�\ZG\r#��\�Oo\�|ƃA\�H\�p�\�/fыF-�az5�\�uG��+�\�#Ҷ�\�V��JciD\"fuԖ��x�c�!K�LR7�>\��|���#$-˰uS6l\\Q\�V�5��\�L%�\�1U|$�\�d\�SEyE4��[@K+L2\�\�Z�O	j{�+ܰX8Lȕ��\�\\4�A�$�d�)x�gT\"e\�RdT$x�#_�K�Q\��.��fF�m\\Q1�0�2W\��I�T*\�C���O�\�\�L�z��뗔�\�#S��i^���Fq�\"l�T�v*5{�	*8R�t\�~\�-\��7ūR�\�.ڟ�\�\��\��TZ�Q<��\Z�f��(��MB2�\"�AU\�DγM=Bi��@]���\�\�G�>\�SQ(GY��f\�XG&\�oZQ[\\%�4�1`�/H\�a@��H\�U�c�\'I��\�UUL\��QUQRu|0���ܳ��M43$\�.\�\�7\�0��GEg�-X\�	�\�H�$�\"4\�\�|\�\�b�\��vQ\�O�7Q��Dp\�;O\�֚;�q\�1\��W�q\�([S~IRi�UB3��&���,\�Ve�}\�\�e*\��C0�K��C��H\'\�p\\L]1t\�\�	�|*(Z*���ٴ-{*{TP��O�Jx����5Rҵ4�ʏ�\�.\�ɶN椓vw\�H$?���}�F8�]1t\�\�LP)?��hR�>\�\�\������\�L��<Xρڇ�b���e\�T�5�ݾC��\Z%7�S\�\��\0P?�O}!p\\\�U\�\�-v\�x\�G/]��y\�\�q\�33�ke\�l�T�n�\����>�������K\�A�\��\�h+x�-h-v\�x\�;ܶ\"\'\ZS^\�<S\�~2\��G(\\TS\�R)���H\Z]���\�\�c�$\�\�Ƈ\�d\�2�\ZHȑ#��\�p�Þe\�\��\�x;2��|T�E>qo@Iv�ޯi�\��C��p{\�D�\064�iV�F@\�Ө���\�씴\�wҧ\�Gj^{���b1#�:T����QE-�C\�%�UQ\��n\�\�Id\�EӶ�}�\�\�\��jS�A�EB8(\�ߗ\�q�\rdi�Qڗ��\0a �j�R$\�:�\�(���R5\Z��\01�ښ���w6�J&L�\���z�\Z�2�O\�n*����!�m�$�]\���%\�G�ؠS\�Y\�5��\�|�\�SO�\�\�\�\�	�$IL��4\�\�h*�4\�%[����\�\�E���o��^*�7�2r�UQ\�W\�X(i9K�.�ļ(��\n|(���O�/@\�\n\�ʒUvDI�ĴM\���-Ez\�J82:�f�\��5VaE΄�\�Ja/6��\�\�\�I�uҡ�؏r^/h\�0K�������\\)\�W��U\nȕ$��\n&iMPd�\�2R� ���\�F�ʡA�-\�\�\\��Ȋ�����\�Ed+�zjQ؏r^/j\��\�T��\�+�\�P\�+��OT���J���xfi\�u�(���B�j�tݮn���c�\�A �r^/b��U��9����:�:��\�P��Z\�γ�F�(\�\�\�gV�3�\�Ӫ���Dm]&�\�$\�\�&�&�j��/ir\�ˊZ��;�\�\�*TF�H#ܗ�خ�\"QN#E\�U\Z��&UVٕ\'JL�	��(ʒ\n3��&Da6T1\�SC��Rj���PΓMC\�544\�\�&�\�\�5\�Jr��M�ǪI,\�\�6�%\�\�X)\�\�9�\�\�SN$\�	��\�I\�̎d�#:\�(\�@���QəV\�\�\�\�\�\�SZ\Z�u<h�=�j��*�|\\\�\�5���=\�x�\nw9\�s\�`�ZتU�M�i���M\r�J�І��T�!\\i�4�q��\�ߓ��\0�ʦb13:P�\���\�d��\\N�1��\�P�/i\�|t�eQ\�U*F\�h�v_��/\�B�7�\�JuS�UPAJi0�4��{IҺ�]Nb�\�q�K6�$ͱS\�G�>�����:�1��\�8\�����͝\�M\�\�\r\r�~f\�*�TT��J�굢yM+����Uy]B��r�r�k[�+\�r�{\�\����&j|f�H\�8��I]Bjb�^ֿ��\�)���RF�\�B�\�QV�&vX!f�f�k�S]4�\�\�N�#>Ă~ʊ���\�U��ƣ\�Ԃ��fi+�j�^ߕ%\�\�B��kCʈ���\�NV��\�Lz��U1\�\�\�M.\'Α\�\�Q��Q�$�X)R�\�\�Mo�\�IWL�)��\'4�܏j�%���4�4�Z�\�T9j�-P\�\�.5\Z�z�D\�3A\�\�\�o�U\�V8���>\�{U�-\�\�Z1h\�,9a\�Xr\�Z��\�\�\�h\'�Tx�Ǳ�\0�ظjj䩤�+\�\�]�]�ݪ�h������?���\�3q\���}�\�\��j5�*+�QC# `�?�%u{B\�M3�\�P�+��~E4\n�Dz�(��\�L�,-\nT+b\�Q2��P\�;\�/\�UTȔS_`�N6�#/�\�Y�&廒��\�D,�\�ΐFt�5/o�q�HjC��\�H�.�\�\�&��p�\�4��Q�\�5~6���J\�	��x�N;-�a\�b��~S\�~\�C��\�8\�\�A�H��\�4�5��.L�EMA[:k\nPi�|c\�f\���eJ\�H\�ե\���5\Z��o�\�8�\�\��C��\�P�-�%\�T�� �#��\��\�ᖨk�\�\�Z�iI�4��ʟ\nJ\�x̉Ҫ\ZV�g\0\���ۂ\�\�1\�c�1\�\�1\�bыF8Hp��-7UT�\�\��\�\�J��&N\�SM%]&I*թ�i��J��>]x�YDri�B���=���T�T�D-\�h4\Z\r�\�>}�\�K*&�h:\��\Z�&��U\�]\�MI*�|D�\�4\"\�Z�8H&苶o\�S\�V��\'ACdKq\�H\�O\�\�h,��b\�B\�CS\Z�\�Ʀ51����v\�N\�TS]OjL\"$\�5P��\�P��P\�*QY|2�+�\�l�f�^�T\�I|����OmfI�|����UQ���}�b߳\�P\�<ٜIRyCT\�\�i58�qR8�~��J�/i\�.*Tf�[W	���}BM�T1\�iQKb\�s\\\'�?fs\�S\�A\�DّTm�\�j�9��R~աk\�\�):i,�|\�U-�+Q\"u�>1\�8\�u�:\�L��\�縅\�j*\�&�VЖ5\�+HTGI��j�\�:\�	�V��I$Z�{��{�\�ӑL\�JAOwa\�UBu�Ȓp��\���\��ƴ\�R�:u�-)J��\0�L�\�o\�\�\�\��\�1SuS:Ӯ��Y\�Di6QPP\�A�E-��\n���>C\�\�K\�\�$S�ӐKU(x{tҨӍ\�Lc�eN�OGI��IFA�(֥^�X�\Z\�?\�]�KBr\�\�6���\�\\=\�	R�)��zUu\Z�\�Hk�᪮�J�U�\�`f��\�\�qS\�x�T��\�[ƐO�\�f`�jr\�\���\rho ���S]>\�hAGI�yv[D�m<ڽ�ԕWA\��UQEd�:\�MT�H���*p� �,c�Tz�\ZG\��\�\�^\�qv�\�[ƐK��#ܗy�k��f�u.R��\�LԢ^\�ı���N�JZ�\�\��j)�QC#��W�2tU:jC���դ\�r��\�+�&�ZǦ�M1x^L]?~��n\�aAW}b�1O����kr*klㄱ\�>$\�M�lj&\�9:T��\n�\\\'Q\�\���E��\�]F� /\��\'\�|q�#3l� 骟e&ʪ���UAPw�6C�!t�\�H]!�\�ޫ\�[�\�PU\�X�\�@��\�4!�O�\�G\�\�IP��Tǲ*�e�k$��*\�[�P$��\��\�]g�u��� /\��&�P��f�|b��\�Z�\n\�\Z%V�5\�Y\"D8�qm\�w\��R8��5��RA�H$;�g�1�ԓ\�\�q��U7��Gq�J\�:ۛaY��@��ݱ	&��\��K�\�.��\�\�qR��\��嵸.�\�m�s\��/sX�\�$�@��#4\�nK�lu�-ʐnH\�\�P\�[\�ޘ�5+ ~ʁn\�I�t�P\��-�p]E\�tq ����B\��\�����1\�5�)oS�\�c\�N�=�b\��\0:Y$z�+O��`�\\�\�B^{�=9Apҗ\��k\�]�\�\�fQԤ��5�\�\�H5;�B>�=�{\�\�\�ܗ��\0\�q�?z�K�/|<@�{�>c\�!U��2��\\�#���馠ڊ�dR0�zP6+ҹ�\�\�+�\n�\�`\�ҨD\�\��w\�U*�\�a/���<�\�ƣQ�*k�Z��\\� \�)*{\Z��H�e.M\n�W&\�j5\n��0t\"Ft~;��\�W��.��.�\�k\�t]�t	_�	��AUm�z�F�57\�i:OJ�H\�rC�t\"{M?�֢%;J�sMD��\n�]\�w�\�j\�	A�O��b��6�\�.��CQ�m�s\�\�%|g\�%�	|ĺ�\�>�.B�ɡ*\�\��Z&�s��+2�\�ک<�2]5�$+�ruԩTT*\�[�_%��d��\�\"�?\�qR/�~\�\r}\�]1t\��\�\�\�ʉ%J�[�Ug\�.�8�\�Q>a9Z,�\��\�\��S@!��\ZgMf���p|�q�������5��!t�*C��n�m\�u�r�\�qit�j�\�20�w�\�S$+�SO3U=�?���D�\�:\���Ћ�B\Z�\�R-S\�\�UM-�\�0�|\�\�f���4�⛶=Z�Z;P*�$vi Ht�O1O\�.\�F�\�PV\�_\�LY?8ښi���[�n\�iJ�L�\'�����TȔP\'��$F�eA\\/bM[u\�)ҽ?\�G	����T8*HZ!�6��\�.{#�\0 z\�M\��ee\�E\\9Mu�bi�GM\'��\�U��f��#�\�G	�#�Z1h\�ةT\�\�K�/\�LÊ�7Tbe�d}�)�Z��)��M2��\"N+d��?Ў{�w��(X@Ě\�\�KDkY[\\\"\���\�x�(\�\"�\�0B\�\�\��\�X�w\��8\�\�1�B���=�{�\���L�\�w7\�0B\�\�\�\���@.\�\��\�\0\0\0�\0\��\�i����\0�����v�\�\�fe^�\�Kh\�p\��y��\0�\Z\�zY\�~���\r�\0\�3��i��\�*�ž�\�I\�L��2\�#>\�]o㓻e�\�\�\�\�\�\�gr|/��������\�;��T\�O�*�+�f\�\��\�=P�\�f�ɝ\����S��\�\�$\�u�\\\�,�\�\�T�!(�B\�.\�3F+�r�\�\�Jf^m�� �I�Rl��q�6o7�C#g��r�\�\�}ٺ\�\�\��\�\�\�p\�\�N�mN�c\�JRV���Q\�?N{\���\�o�u3�\�ެ�m\�&G�3�V\�d\�\�\�3y\�\��/\�S�x������\�#�?\�9BiH�\�\��\0`Ln\�\�@\�r�R�>,�����\�\�B\r\�\�\�����p?&R[=�{��Y�K?�J��+8\��\'�\0@dY?�@u��@\�v�\�\�Ԏ\�/\�&@\���?G$}�Y��e�g713��K<ȳ�\�\�3\�#\�-�\�z��\�謍��-����\�G1+�ί}l*��\�y\�\�\�!먭7ȯ�0~�e\�|��4�\��\Z?q�\�۬�z\0\��5��t\�\��y��\�i���R\�q��\����~\�\�$�\�g�B=	O���̫)�\�p�\�}�\�ő\�\�.��\�\�>eR(,�\�\�^[#�U�rA�;\�\��9�fh_kz\�\�F]�z\�7�+C\�%_s�p��\�M%�C\�$��na �&�z\�	\�a�w�d1�.�~\��\�%\r1�C�j�j����WpUk\�~G�Et�\03\�6\�U\�*=�+\��2Dg?\�(\�\�T�\�\�y�Aylw B5\�\"b�=�m8$�l�E\�U�,Ї|���A\�з\�fǑx��썕.r\"s�H7]�\�Q\�f�E\�o�o���[\�\�\�F\�_b>\��\0r����d���/�SMU\�֗WLzh\�w�+o-�S����[\�\�T<ޘu\�۝�In��\�\�dB>VNKnc\���FH\�\�Y�z\�lv=�X�\�zK7\�~\�~�5�\��H\�\�6A s�V\�x���+\�\���\�\�<�C\�y\��\�(\�e[�m\n\�ѯI�\�\��X\�^\�\�lO�>K�\�=\��~��\�\�::�7�v7Oy\�2N���Q\��9!�ue_���\�þ\�\"�\�	�\�w�9$�\�]e�\Z=�(\�m�7��\�\�Yᜬ�\�[�h���f\�=uV��@,\�������P���|�\�7��.\�,�<�\�\�/�ƯȈyV뇫�S\�m�x��pOYa\��\0r�Y�\���>-5;�Bu�\�\�\�\�R;f2H3\�\��m�{~O2L�\0�\�2��\�8|\'�w(<y�H?E? ��:\�|~)g��\�\�����na�Q\�?G\�rI	�!iɔn#\�#\�G=�\��ȝ�o�-$\����\nѯ�H�?��ȇ�W\�\�\"K��8܊\�D\�vS\�2�I�ln\�c�\�YV?�Ji���\�FcQ[K%�\���ë\�Td�HJ���\�\�ȷ.$qŲ���\�3\�ӏ��\�\�8|�ӎ~�g�8盠J\�?\�G\�9�G�xFW�1\��\"	~\�\\3]\� �\�\��|3|\��\��\��v3J\��<o!�\�_\�Vy\�\�1\�ǦH��Tl�O��\�eP%\�\�<�(\�6O�=|S\�A�,���\��vy{Y\�\�xٌ�\�G��a\�\�ɌrGY�\���b�Q\�<��1Yl�U\����\� \�\�\"�[2n�[*p��\�\�q$\��\�$.\�\\#\�%�,�A�\�\�RA�@F\�-\�=:!�JYf-�<y�\�64\'a\�\������\�}b��I��\'f$��̿㓼�,�\��\�\�n�����ޝ\�\���\��\"K#�V\��wd���0}�f<���ra\�c������V�#\�\�>߂Cb}�+J���G /�\\X���\�Ak\'g��q\�\n�+�\�=U�\�S�\��%�Vq�-9\"�����g8|��W���P�\����(�\�\�q�ጔk\�\'�0\�\�G\\de�/�o\�\�D����\�`�ց\�x3��\�ݏ�\��\�\�\�\�3Mn��әC\�&��^N8�\�\�9��q\���sc��\0���\n�0\�$r8p�Gee\�\�/J�9y�~o�\�2A\��n�6Z�\�\�[\�Z6p_L\\1YW\�9�\�Ʌ�\0�O/|cr�-t\�,�\�\��\�\�\��u=�|E*x\���\�3\�WP{�\�.?�e�8F/�C\�FG8�U�;�:?`n8& �\r$�\�\�87E��~\0��t�\��\�?Yf2\0�\�6�\�\�\�5\�\�\�j\�\�y�R\�Vg�K>G�~����+�0iElD+�X\n\�#�VA�>�c�\�\�@�#Ȭ����$�f\�\�֒A�\�$C\�f��\�\�r�ʛ���{�[\'�}���\\��?�KN\�b\�=\\o��\�\�ݥ\�\�����m~*�\�\�\�\�A\�Lo�\�\�2�\�8\�\�y������Yva^J\�\��f\rdfCHI\���*m��\�\�\�\Z\��A�G\0$�A�8��|�m��E�\"��4��\�i/�%�\�\�-�nl�&�p\�ڮl��9\\~\��<l~܏ \�\�\�<�����a\�8�A��\�\��\�\�[\���\�\��\�\�lw!��\�4�*Y��F\��\�*^#�f�\�ܮ�\�zX��+<��\�; �\�0yZh\�q�\�\'���	��|#v���!yD#�2��\\\�H.?Į�Y\���q��<8:y���`\\\"�I\�\��%\�d�R2{,\��\0\�.�\�ҹ��nYy�PIla\0�\r�D�HET�\���Y\"������\0��7�8\�M\�γ�{k���C\��6\���o���Y\�\�\�\�\�8�\�\�l\�m\�屽��1��\�h�o�n\�XF7�\�\���(}�~�\�l\�g���`\�F\��WHGl\�8\0Cnc�Gn�\����\�n[�m$z\�Ka۬r]<�\�<\�\�C͈��m�r\�=\�6\�\�K�D�\�\�\�\�?\�o>���g�\"�Q\�\�\�Rl��\0\"����na��Bu\�a�{o�3\��\���\�M\�\n��\�,ź&e�.!\���\�\�\�v\�onP@@\�c\�G��nb7l�\��<z�\�\�V����K}=%��S����K�|z [1\����G��T0\�wl��\��U�G\�3\�(6\�\�\�C6`\��\�Pؠ�\�2��5�˙Z�oۣ\��\0v\�3v���Anf\�ų|\�>q\�\�\�q\��VA*��A_�YlN\\a�=�����Ű\��\�91�\�z��b\�X\�b�QC�0���$>V��HY!d��\�\�$C\�Z)\�#\�zXZ+ɘï�\�\0ogvpf�w��#ee�ox��`W���\0\Z=\�\�ix���\�>֙�\0\\8��*\��y\�܇�3\�\�\�c�\�J�\�4d\�${�0@��N0,�a\�lV��PF+\�\�LX,��`����c�A��d�$\r�Y\0�z*=�[��HJ�\�\�V»��\�2��<��4|���\�\�\��W�����\�\�\�\�����\�ӏb�{1�Yk\�m$O�\�m�W�\�\�`x\�+`F\�yѬB,B(\�v\� H���j9r���1c\�Y���\�n\�\�캃\�\r�;�\�L��\�RE}��[���|C\��\�n\�\��M/+���y+\�2E\�cqN%d���y����oqK,�r����cYX\��X�@r���T\�.C� �ɋ&9s��\\Ƣю\\ōG-\�Kr	-`|\�\�>s\�\r\��n���c�\�K㝰\�x�qц\�d�f\�RFT�?(\�\�3�g�n�\��3w�\�d8��p��tW�3\��l\�-�\�\�7C�\�~l؄P�|X�&��c�1`���\"��,�\rX}�B��;$�T�\�\��\�\�.*\��\�\r\�\��[jЇ�데8�w\�\�JIoML7 \�}�q�<�\�\')\"�%�.���\�\�a�\�1\�/:�\�f\�\"\�\"�.@��E�<\�˗e�\�4��,��B\����Y�\�h4�<De|\�����ca�t\�r?�\�\\ �l[��n��܋\�\�\��?�\�\r�\�\"���[�)�N�\��7e\r`b�W\�lM��6@\"�Es@\"�x��|�ˋ\�f�\�/�\��������s�\�ag/���/�\�1ca��\�\�$\Z�̢\r\�\� ���\��豘A\�ۺ[(�\�k\�\�ҿX�D��\�\�\�}�\�\��Vcj⟯=��w\�\�n\�,\�+Б<�=�?��\\-(hs\�B�p�\���,����lC\��_x\�/Ϝ4�\��|z���\\1\�\�\�[t�S{.���-Ƈ|?q!e	�՜��7\�[p��\�<\�����s\���ؙ�\�/��Bb*I)\�&>\�۝1�\��>n��Cd�\�J�~�A�<�ny\�K�A\�n-X2e�\�1��z�p�d7��*�5��ޙwȣ\�\�\�A��\0�.�\�>�\�[�\�_*Y�\��y�w\�\�\�\�Y��0�+�ts\�9г\�\���J�\�\�\�FI��\�\�z�p�/7��3y\��Uغ\�\�P�ʳ=������g	\���\�g��TJ�\�<͢�S\�HOK\�J\�ELeS�3�Lq\�\�m�s\�\�\�\�h\��=\\�\������4\�\�!�\�\�.QL�v\�7�\��G<�ۗƳ\�\Z~��]\��f,�c?\�I�\��\�\�k\�s�7+�\\�\�8^7\�$E�\��R���υ�y\�%l�MQ�̛��y�Ⱦ��\�C̊@֒��1=�h�<�A\�+�G��\�\�s�\�\�\�3�\�u\'�>7m\�\�64\�+�\�a���G�\�G�\�Xh�\�~#\�u\�	c�E\�\�$$%^���HA`{�#8�k�.=a\� ��\�\�	e�\�]\��M~��\�C9B!n�s\�\�܂)�Åь\�$B:#��\�{C\��(��\\s�g\��\�/:\'�8p�F˘y= ����\�\��\�`r�U��{8�}.Ț\�\���\�;����]�D�9\�C9\�\�\��|�^}*zuUI��b-�ŷ/�߈�\�G8\�`�\�rPH8_0\��\0�=�\�RA�\�.\�jۢ�>\�G�|�\�\0Pm\�ت�\�LA�!S!a��\�\Z�u\�k\�����$�\�O�I> ��j��1�\�8;s\�\�#�r=p��Y,;\�\�0b@<�\n�v(ً\�p\��\�<r��p}���\�UB���\�\�R}��G3��\0Gs˷^7c`�sr\"\�j\�?��d����K\��n\�Io?�\"�W\�\�K�<9\0�V�^�#�{�	$\\\�@\�רF��@�F���\�_\�IH\�h�W�\�b�\�5��%�;�\"ϩ�u\��\0&�=Mb��wk\��JǮ$PAa=�\�Ł��\�	C\�\�&�\�fdP���\�\r�fN��\�\�\�\�\\!K����{\��V�V�=\�\�a��\�\rc\� \�c�\�י�o�\�o\�m�;�\�\�\�JC\�u�\�`hu_�\Z@\���\�\�W\�a�-�\��\�C����ŵ\�<�\� �7ax?&u��ϡ˄\�[���g�\�\�\�q\�\�o�@\�u��\����\�\��\�\�\"\�\�\�T;M��3\�m�ے���8�x�0b\�\�\n\��y��`��!�l�\�Jo�\�\�X\�f��<�\��È\�a\�~�a&gs߶n\�\�D�/�\"���\�,\�wéΨfLl�\�\�>ʷk`vw:{d���()\�t[���W\\�\��U�3\�\��wS�\���B�Èa��q\�\�Eh\\d�~L\�%��Q�\�\�R\�I\�/�loNn7$\�.�����r�-\�\�#?�ӻd\�?\�3��1|�\�\�l�b����3��\�M\n�\�%�\�\�3q�o�كj��\�+6\�;dq�\�զj�}�݆y�|5\"W}w\���\�h|\�X�\�t1��\�8\�+o\\I7%ļ�\�\��m�/�p=(c�czI���K��W��\�r�\�K bp2\�E@�\0���/:{\��F{M�\��:���Y�����#��W���!\�\�y\�1��\�7\�p�\0�	\"}=e\�����\��#�\��s\� �m�z��<�\�nND�\�0��\�:d\�\r��\�|�\��y(:]ŀN}ɰ\�\�d�8c����Q�\�l\�\��`\�\�\�Y\�D\�,�\��\�덑�9�.�\r��>��\�zo�8=�A\r\�Ac�w\�\�\�z�����0�#��\�R\�s�} �Z�\�\�	1pb1ȯ;c�f�[\�?\�\�\�X�\�HY �� �?�9|zT#�m���������\�c\��c߉��ǉe���\�u!�+�2p,p�\�\�D��\"�\�Aϯ1�k�\�l\�_\�\�\�R\�8�^o�q+�\�8�\���G\nf��\��[��@<�EjG�\�5��-��\���pe��z���ȡ\��o�D�ќ`9;�1\�W�\��|_�\'?<<�\�xźf6\r\�\�\�-\�vۧ�\�cq�|�yp\�\��\�q.\�N�>{�\�3��\�8\�\���c�>��%\�\��0�j\Z/�A\0��9}~k�\�uA�v\rh�E�F�1D\�=b9]hv6:�ɒ\�e|,\�r$b$���\�\0�\�FT3^�g\�`r��J\�	&Va��\��úp\�,i�t\�:�h\�S�\�:n�Rc>\�F\�Q�\�c\�S�B�(\�#?N\\\"�\�܎t_�Y�\�.�$w���\�B�%��\�=\�\n�k�\�-\�	,]���@#��H\�`_�y\�]t�<|\'�f\�|f\�\�M�\\\��\�a��?av\�\�k�6l�6\�\r\��ƙ~:p\'�\�Ƌ\�:Xd/�B�\0�ɼb�Y~\�\\\�.ao\n�[�3�3\�\��1�,��CΒc`<\�\Z\�B���\�Kp�]��_$<$ܴ�=STR�qy\�\�\"aq0��s\��\�\�-�ʯ�\�?\�On�y�QW{\�S�\��\0���y\�\�\� ��Ǔ��\�\"b\�{\�,�\��+޳��>�~�6�.w;@L��w\�{\�.���\�c\�\�H-|,\�\�!n\��I./�\��\0%�|��\�9���Ԋp�m�G!\�H�%�q�\�\�?���b*R�<�`�_�C��	/��E���W\�I\�r\�n�Qh\�%\� h/\Z��&o�p�\�ߞS_5���UG61�\�a��<#W�ڷr\�_Eh�\�\���\�Yp��r\�Hg�nf\�c�i%�G��a\n\���~���?�{ؼ~F\�nG\�Ø�}�\�\���/\�,�� ��K\�\Z\Z\�|�c\�c\�Vn�\nd\�36���3�\�[s����?\�\"��\��*F�m�\0�b\�y��b\�	�7�\�/��Oa.�\�|\�L�\�qw�_\�\��\�\�fv�\�Q\�\���x� i��Nm<�i�<�i/?X7�Ix�_\�|5n��䧓1+`l��\'NF\�\�̍��H\�\�<���\�(ne-\�\�q�-��7p9�w�\�_*�\\\�[�\�w7fe�.ɛ\�\�y\��.\r9e\�\�\�\��\�w{\�\�\�Ln���\�8�d:ۗ���#\�>MS\�L�W$GƏz=\�w��0c�1~�Yq&�\�W�o<\�Nz[q����uݵ�Hr_w=��-�\�Oo�R!\�oe\�\�7]\���wk�}�\�I-���l�b�\�h���et��\�s]��:(.\\_�|/�.$W�w�ILr�o6G�.�\�\�~b���\�`��\�w\�9��\�f��#�#\�G�\0K�\��\�\�\�/\�W�$\�\����n�a���6،[1�y\�\��b�/c�s\'��\�95p�;�\�ps�zI�^K\��[\�q��g�\�\�f\"A``�k�/�\�e\�ˉ\'\�K\�\�\�h�����zb{nc\�#ѷO\�¶��\�\�:�\�3e�\���\�\r�/�/��r�o�\�\�b\�sݮ�\�g\�n�7)\�\�d(�;r\�[n,�q�3�p3\r�\�\��u1*6Ǥ,?��,�\0HX��\\\"�\�Җ<A\�\�\��;_�Սy����M\�\�\��&\�V\��\�d�Ig7��\�s�\'?.ds#���\�A[�l&�|��\�8U8\�Tu�E�8�/#\�ő΍\��%\�\�\n��Y�χ:9�/|s/\�\�\�#��O�b{a�|Q���8\�Ly,or\�\\^ k����΄W�\r\�Y� ?q\�\���\��\\&h��?�\�\�@\�.\�9�\��΅rN`�W@�\�<AÞ!΅�|\�_\�\�Kg2t\�\�϶33��UiG\�\�\�.\rcЖ=/\�\"�\�|��S�\�M��\�\�O�\Z+�\���z�e\0\�g�&>�a�\�\\�\�[ޓ\�\�^�\0\�x~����nj˽\'i\�,\��\0�|\��W�/�`\�29�\�\�}=\�%�oq���[�\�r������F��NE���J>��U9`LdK���\�\�@#�Ǡ\'���BK>\�%V���ǭȠH\�/\�[�>l�\0{�Yo]p����\�0\�lo|y��\�M\�8\�\�\\4}�?�\�̅���8�\�\Z>\��/���Y�\�.�J$��\���\0+\�\�<S\�pȳΣ?cIC�{��\�o|�F#r�\�,\��\��Lpw�ǐW#n���׿x�n?\�y�y��\�A\r�\�o$z\�\�x9�\�\�_1F\nT��-\���=}W��\�\�y=b-\�6\�ɋ�\��5\�����\�1|\"�\�L7p��\�csl(\�\�\�ze\��+g��\�\�`�67����G��V\�0b�I�[��y���\�P9\�\�䣺&�|�L\�ėE\�\�:^�A�<�a�\0�9��\�\�\��~;�\�\�x\������d#܏s�<�\�1\0\�\��1֞)I�I.ܖ\�E�+���\�a߸ю؈�2N����{e�H�\\ckX\����+��\�\�\r��\�\��>�\�v� \�\�$���=�a�C$^BpI`\�\�\�7��\�c08\�x4��\�\�\�\�o\r\��\�:\��9��|g\"��\�����r�r/��`\"�M�b\�y\��8\�p�n�2xp(�$��%\�1[��(�\�\\~�!��\�ټ��\�$�%qZ�j\"Ǒw�\\<}�Yqx�\�\�\�\�7A�v�m�ٿ�uϲ\�\�#V_�;\�\�M�E�E�/��x�x\�Cv\�\�%�,�@<\�\�h\��F`?\�\�f7�7��\� B��#X�n���O�|�\�x\�+�<=m�\�\�3?�Ԛ+�\�\�ͻ\�}\�YpNG3����\�4_\�\��+_#|<c����]\�H $�p! c1�\�R:�!�l��\�\��ۀ\�\n��\�\�\�\���\�e\�0A\�+r:K\"�\�]��\�\��\��\�\�+��{��^U�YZ�˯���\�W\�|�}�f�@�\�0�Py\�p�n\�-�-\��\��\0�@�\0d7�\��:\�\0�P�p��}�Yp�\��E�D�\07\�\�c\�\�\�\�\�p�B�[����F\�3\\F/�G��\�\�x�@X�_ɲ,%\��q$�<\\<\\,�%��	wC1�:U��N��=\��{�I!`-�5�拈\�\�K�ٮ#W\�3\\\"�b˷,\\��C� �rˉ%�>.pa�v4\�\�\�ZOd�=\�\�\� �\��+R\�2q�3p� �f�f�Eq|<\\s��\�:9�\���\'�\��Jˇo�\�\�\�\Z\�Ύ�:ƀ\�*m)\�>:��}_\�\�o�\�đj�.�\�ޖ��H3}�E�E�FT#*J\�J�T�=Xz��`�\�\�iP�\�\\<|.\\p\�#D/\�4?�K�r\��`\��N��\�\�î3軦���\\�/�5�/��\��V�ʆr\�\�eB3�\�G\�#\nʏV ���1\�\���V�0�����7�\������3��C\Z��~B?y��q�I}�~\�Lz�\�S#/�\�n3�xo\�ϫ����\�-�9_�\"\����0��o\nN5\�e2�\��T\nʏTJ�R�=T-8N|��\��\0b\"51\�\�j\Z�e_x��\0H�;�95�\��\�\�=Da\�Rt�\�2\�\�\�\�k\��%�\���9\�wS�,=�K=Km,�\�j$P�d��r\Z�\�]��p=Pz��U1\�\�ՂҦ=XǫZv�y�X�|#\�.>}�о��\Z��ܬ|n\�EH2G�&-��\�_8b�\�\�j�r_o�\0�[ӳݬ\�]�\�\�\�\�ɼ�q�8Y�x\��M\����HJ=\��\�WmR\�\�\�Kͷ\�\�qɌnad>K1\"\�̬\\X!\�\�}\�\�V1\�=lǫ\�=Z���\�/HE�4�A&�����\rv\�\��\�a0�������\0�\�yT;\�El?9%��=�\�n�w���o�ݲ��\�}M�q��)\�\�au��=Of��yT�>G�5�.�v\��\��\�OC?\�������d@,\�,\�X0�,�\�\�&�0��+֌j?ʊW��\"�ɛ\��c��v(\�x\�`��݊)/\�o\�\�\�m�ϯO���9 ��\�GKe\�\�I��з\�\�`�\�22?�n\�m�\�cQ�\�r�������\��\�\�;$}\�l;\�G�>�ݷ4H���������\0x��7i2���Y\0�5�HYB̏E��Y�\�h��I��#C҈zqXE�0\��7�HN<h\�ґU{\�\�\Zo�\�fe\�\�~x�]\�\0\�#�\�\�_}�~��\\\�-�\��\�1���(�\�<�tv\�k#��\�\�>֍\��\�\��ॺ�D\��\�\�enWE\�����\�~DI/��\��p�\�[g;�gu\���0\��\�.q���d,9n\�$C\�o�\�\�h�\�ҬD��d�����E�\�\�6�`\�87\�g_�����\���;>�9\n+�ٯ|_�eleF\�u/�[\�?��e�\�ӗ\�ס\��S��LG��2I.�~\�}-�\�Ө�gUۦ\�q�\�3Ϥ0��2�dd���+\�=�@_p�=C\�x�v##|ߛ�!\��\��\�T`��U)\r\�\�\\_q�z�\�CZb*B)\���Xr�o\n\��!�\�\�r\�9a`�&�1l:c*y�\�v?�\�\"�Zy\�_�N�\�>p��ՙ��\"��\�\�k�W�����\�+�DlGX�@\�T�M�\0�\�Lq\�M�p��:��22�\�rr1Ќ�\�Ѿ\�\'�\�~\\:!�RrΦz��c>疓ʴB���Y�\�-�~�Y\�I>�>�62�?\�\��\�C}���h,K�\��q/*�R�\�ۨ\�v�#p6rf�$u.\\\�ݖH.,\'\�b�\"�����g\�b�s�`\�!\�fyt�}���O\�7\r\�#\�\�\�<�H��@%��]Ƭ\�8\��1\� �c\��ہ��b�O?s���)�>��M�״[����U5R�\�rw�\���LP7{\�m\�\�gV\��?�{��\�~�\�\�.��\�rJp\��<�2�#]\�\�\�@,�xU~Ek�k7܋9%\���2O\��\�;��{:o\�\�XLC�\0$.!|;F�˱\'rv�\�cz�\� \�\'��\�\�\\\�,�m�͉�_czI�|\Zc�\�q��\�\�<6\�O%|\�<^��CC�^�\��[�TJ\�J�\�\�to�\�\��\��+�-��y\�K�b�ir\�\�nG \�C\�7\�1�2x�\�M{�����i�\�t��\�\�Rl�\0\n�\�H\��\��J\�eZ\�\�cy2:�s�\�\�\�Y�������\\=����\�@\"$�X�\������\�XE\�T�ˠ\��z����>؇�x\�\�\�\�/\"���_l\�\�,�j�9R�\�}H��\�y\�� .�	\�(�\�}H�?*3(�\�v�\�[�ƣ�\�󉍁\��cA�\�/!8�I�|Td���1燈r\�\�.2G\�N�\�m\������\"�E�dG0\�~�\�/�~�>xg\�&<�1��-\�G���5\�\�\���������]{�1\�Ql_��2S�d>\�}\�ѧ]\n�\�J�\�g�F\�֖y�u\�#�7�\�j�\�}溫\�\�Ω�wu�K*4D\�T\�<�qg\�/��T\�\0�\�ZZ=tQ;\�\"���`�\�%o#~��\�\��8]i%\�G�\'N�˷�$M\�-0�u�\�\�\�\�\�ڧv�`y>g�DZ.\�c�!���\�.˘C{6\'\�\�\�\���l��@Y0�o\�\�Na�S\'\�\���\�;��9爱o\�0��^/\�	�\�#0�����oc\�\�]{;C\�\�[\�G�Ȏz��a�_@\"����O!a\�7\�E�\�F���7\����pae\���]\�t\�� \���.��\0\�\r�\�7\��v�\�c##�颺\�|:\�鏧\�w�\�g�<�׏Q;ī\�\�$\�\�\�>3pN7@/9 �Zr=\0�k\�g\r\�˷3Dۮ�n]y��\�8�.>��\�\0�.�d�.]���0\�oU\�v��cX��b=\0�\�,�=Ǒ��\�-\�D��\0��w�&5��(�\�_�\�\�/����2���\�u6\�1�\�^�d0\�_\"6��v\�\�\�\�a�c�,��r�U\�4X��Fu�\0\�}��]��%�զ\��R\�;��<�R\�\r\�[\�]`�\�\�/1�k�M\��7\��]�>B\�\�7����\�!��{\�\��\�ʅ�\�Y���\�X��9��\�y��+��\�ke\�c�\��\�M�\�咽�R���>\�\��\��煗Ps��-\�\�y�\�2�\�l��e�J�\�\\-9}W���,\�H�AVp\�^y���c ��\0p\ZH �>b\rUn�+J\�\�f�=�}\�燬o��B\�[�b�ޞ\�*��\Zǝ�\�fl-\�\�c�\0�\�C{�}�9}�\'\Z�}\0�����J�@}=K�\�\�8\��=xu�\��\�o�K�\�e3��t ��#\�\�lx�f	�\�\��\"�q<��UR��JvQ\�\'Ƹ\�)f㨹^{s��\�d5\�r�d? ��\04Wn]\�\�1}~xY\0�\�z�.w��k�W�y\�\��q�$��n=S\�A�\"!\�,}\"�\�\�q!�I_zΦv�~��o\�h\�(ٖ�c?p�\�\�|�\�_�ae�o�\��z��3}aoUoeg\�J2�4__�x�\�x���\�\�Y\�؈\�?�ZU\�\�\�X�\�,�?u\�\�+\�f�\��7���a��\��,���Y\��.\�dhy\n\�w���]\��I��\�۸F��P=B+\�\����ȅ\�!�1%\��\�}\����1�\�l���\�?\�9���ݳx6#*[q�\�\�\�Q]q19|H\���>�f�ń^�\0O���\�<��	U[�緙X����\�ۋ�M��\�޲bÀ�U,#�{\�>a�Y\0�.��\\ۣa\�\�U��\��u\�\�@Yǒ\�v\�\�\�\�Y�\�V�C]�\�x�q�}\�:\�-�y7`,��E��Y�Y{+<���K�^�\�<}a�Ȣ\�x�	e��\�S��Z���W��\�,��,w\�\�7@*�z㑏|��\�\�a\��rR�f\�\�f�\�\��9����\'\�\�A\�\�Gan��\�1\\rR�\r/���w�\��\�\��-\�=\�\��\�\�?qdL\�(|KeS+��\�\�\�(ڽ\��2�v�\�E���J�F�\�\�_\�\�\�v\�J\�A\�Sv+nC\�Uͯ�\�W0��\�\�7A\�?Ev�wg.�\��y\�)o=G\�[�,\�\��\���Q]�\��pn[��\�\r\�5\�<��\�_8��;�\0%g\��\�m�dP\�-\���8@\"��\�6\�o,�<\��p�[\�V�������!a�n�;��\�\�l�?K\�\����(8��9#��\�(�XZ5w+IL1������\�o4�~�\�}+}�~Y\��G9��,V�Q�|\�K|\�\�[�sw\�<\'����~\�o�S�䅕l�H\�r\"�\��\0�\�e+\�K}��\���T\�\��0�\�\�\�\�Eo��\�=�S�������ź��\�b�?\\k�ȣ|�\\3_��\"\�-ˮ^���Xoy ?N+\�\�j�`3}|#\�rl؋������P͋�M�=�|�^._�l\�s�b&+z��|\���+�����y\�\�\"��s\�Z@��Y�ȋ��\���ְ\�3b]\�\�\�/`@��ŖC\����\�1�,H ��\09\�.�\�@w\�9�\�Yp�\�y\�\�ۏ\�>�\�Q]�\�s\�g�\�8\�w;Z�\�7\�^��lr>z\"��%�A�\�Ŏ\��:�\�j;\�\��:�o\�_t�\�z �<u�էBO�i.yT|\�+J\�[	\�\r\�\�쫤n����zQ�_TV\\\�\�/�����3�S˜�\�\�u�)\�[\Z��&��\���\�\�.\Z>�p\�o�X\�E�?��\�|�\�Y\'\�_��+$���Z��y\�\��/�\�X�\�a~�\��(\��\0&5��\�s\�,\�\0�\�\�\n��\�5�\�Y�}e��o�A\��\�\�+�AdW�A\�<\�\�\��q�\\1�E\0�\�\�y�\�\� b\�\0�� ��^>n���r�3A�S4��|,�����O\�\�o�BKfr?\�x�\�>��L���\�ԯ�\Z�@��X��\�۫|�ޘ��\�\�\�\�ΨzWϰ��y�,\�\�U�\�r\�\��ݼ$\�&�Iu\�Pn^��yy���?�\� ڽ�\0͐���ȉ-E\�ʩ5�Z�D��2T\\k�����r?X}tQ�V�\�>�ߧ���G��\�\�,�\��\�+�Au�>xf�ػ�\�_p�\�=\�����\�\�n} �˾�}`��]�<\�s�\��o\n�\�W\\,������G\�[�9\�%��\��\0>\�\�\"�\��\�ű��\�ۢ��������\�}����� ]\�\�\�Z̈́y��\�G���\�}tQC�h��+e(_[�)\�\\٭����L�Sx�\�VWTa\�n4E�W�\�\�ˬ6�^��ֆ\�)\�v�|7�:\�\��\�&\�e�Y\��ܫ\�ђC�i�R�߷K��\�\�o\�W(�+�=\��\0;lv�`���9ܺ2l�\���;�:�\�[\�{\��p�\�\��\�\�yI!`-���;/�\�|�V\�Z��Y���Ϙ]%\�\��>\�\�\�z�(���˷\\F�\�\�yŗ��/�y\�/\"�/gU�YË,\�p�{��\�\��\�`}Mv�\�\�<\�8#\�,?�\"RN1E�\�h��	dY�o\�<o �E�\��\0K\���(_y18\�(F����оB�x��\Z��Y��\�!|d�9]�\�\�r\�\�l�\�\�?8ዽ���X\�\�\��E}G\����{�^��6+(\�W\�IY\�!�\"\�4l�\�t[�{��{�ԞT\�2g�\�\�Ln\��l��\���\�v�\0n�9\�f��\0�:�\�\"�.FI\rx�\"�\�.��\�[1A\�\�d��ݬ���\�}`�3�?\�\�+�9d �+_A\��\\\"\�,F9\�A��=�0Ҿ��k\�!to�\�(_Ya$���t\�\�`�\�\�\�s9\��^\�6kX \�p�\�Yw�^!\���A�\��\��H }�4_|\�} k<{�\�\�^5iWKGf\�2��Cp�z�\"^��-!\�-&�x(\�X��>�}$�\��K>o\�\"\��dq���s\�P\�^I!}n��?ۛ�/`m�\�\�\�G\��\�\�1}B��n�\�[��뷭\�\�\�\�;}���\'\�O�gMo�V\�Sf=rn\��^��ѻq�a*M\�\�\�\�>g�\�\�߷�\�\�|\�#G�|�\0�\�\�\�\��y˾w1\����u����\�\�\�����`_�^�?\�e\�͸GU\�G\�E/<,����E\������\�\�BK8p����~�;D#\�2�}\�\"��Y��̅�_�j\'}H�\�=}}i\�#笪�[�]n\0��u\���\�=Ig\�ɬ�`���]��\�\�d��d�K\�nG1#s���\�/\",\�(j\�w��@3\�\�Ei\�\�d?Ea�\�\�U�\�/}��D<c �+���s���\�\�ۗ\�M�W#1��3�y�ۺ\��\0Ğ�6\�����Q�Ǿ�ʛ��\�~\�\�-\�_JX\�\�C\�\\?�V)�q�U\'��}\r�\��(\�8ߌ�)�\�\�#<\�`�3\�\��&\�\�Q1x�+�^B3�Annc�\�u��\�D��\�B\�EmPE\�\�\�5�(YG���\�p��Ӡ�(珂���7�|=\�\�ݸF)��HY[�L׾�5\�,�z+����\�\���`r\�\�;���߅\�p�\���B蠺��+�W�Q_��..\�\Z�뢲�U�uň�?��Ulq\�\�c�Pr�3{�EͰ�9g3�\�A\�\�\��y\�˱C����\�eȅ��|���/���C�\�!�m�\�J���&O1	^u�L��i\��\0P�:\�\��P\�C#��\�/�>\�\�\�n�\�n�sԓ?K�Gy9\�#<}\�?1!*�\�\�\��\'��n\�J[O�\��O�,�\�\'c�\�<��WifJ�{3����J�\�m\���e^�ԃ�\�ֿȅ�O���\�\��ȍ|\�\�_!|Xofu\�\�ZB����a`X-#y��\�ȯ �g\�\�_\�,��h�adW�}e��1��ߦ�%��g%\�\�\�DJ�xVx\��t��H좻�\�\�q�6�I\�*�ɚo����p�Y����\�P��\��䑃n\��\�J(XF�u\�e\��;\�fϘ\\*���:\�Ʈ\�rY\�/�<��ΑW�[\�\��?#i��\�c2�U���uE!���\�\�1\\f5���c�buE�_\�}�\�\�8�v�	A\��c�/}�U\�ݽ�\��\\�s\�\�\�?��Dd$\�x?\�\�n�]7Sn:o����\�\��##|7\�q[\��I���3܌\�\�q�\Z\0���y\�\�\�\�B<��Pq|\"�<,�W\��Y}Z>V59��\��\�~�+\�J�\\,�Ap\\�\�%\�\�_n�E;��ae�������hr!eƦ	w>�E�\��2\�}b�.FA��\���۠�2�͚�Yn�+EXx\��\�\�\"\��/p���`��B�\��#��+/\�#�VB=�>E\�\��ļj\�_\r>�7߬Y\�\�0�H��ވgl\�\��<�\�\�1��{q��Tw�u&:�\�\�d%Vʶ\�g\�]\�G�@t��A��\�\�n\�#j\�o�h\�\�\�z9\�M\�2m�\0\�k`�\�\����*\�c�ͽ\�Wm�7\�\����d<݇c~5>��\�G�T3}#���Y��{�\��g%��`��\�|���\�\�@-���\�Y\�E\0��f\�}B>Ӡh���\�\�\�Z�{+r\�f�u\�Y{\�:��@\�\�A���䮻�Y��^\�7\� �7\���Y\�ߑ���\�(X[�(\�J��������Ϲ�}\���\�\�\�Q�Z\�(�n�<�Ⱦ_0�\�ߒ\�G���oТ�\�\�4WqzI{I k�\�#���b\�M\�cv\�ZCl�M�\��Kj��\�\�\�<V=��\�}�\�\'is\r\�\�\r\�\�\�/f\�\�b�ᄽq�7�Ktk�\��W][dl����#��sov���1\\o#�÷�\�w�\��<��|q�s���r6k\0p�}\�3�\�G�Xr\�묯녎ye��?E\�\�\�%��P�\��o�\��b�\�:5%\�r:�]�\�~��\�\n�\�\"��\�\�<�7۠�\�7��\�|՗5ղvG�6 \�d<�P�̜8�\Z\�\�;�\�B׬#��\�\�<�K������\�s��\���yi\�\�\�3�`<��C�E�x3Au\�f�{(�H,��\0�x\�\��\�Y9.&<��]\�\�^ 0\�\�\�e[&�\�<V7o*͞0\�\�6ǑV����\�e\\�7\�3\��dr�\�rD9�\�n��󎻷;\�I\�4}#��\�+*\�*�\�\��\\\�\�X�[5͢���\�������\�\�!��\�-������n\�v��ު\�,/�\����_ \�p���\�O��\�X���Yq%|3}䭪eǪ�\�]Wn�b��\��\�z?]e�\�(�}\�X�E{���\�\�.�\�\� \�ȸ\�A\�\�E|�b��\��ܻl\�oaO\\#\�I<\�k\�L/|,���\�/3\�$_7�\�\�G�\�9p��m�\0ѼA\�\��\�>��ǋ��I�u\�@\�\�e�Nz�\�ck�~�4,-��/�Fc���J��Z�Gc�<�\�t��{���W\�K��#\��\�\�,H`L�5�\�M\�\�25���\��\�+;�ی\�zw�67���g�o��$��\0\�3mۏ\�����\�%O\�<\��\�\�\\}tA \�\���j��a�\�Eﮰf��IEX+�\�߾?P�\�\\3ל�/;��\�˅��_E\�\�f�w�\�W�&�\�_Y/\�?�H�\0F\�\�%o�f�\���G\�/�^wCV���}�\0�m\��l�\�d#�ߖ�\0fy��{\�騏��_\��YW�rA_��\0\�#�\0MH}y\�\���\�~�?\�\��\�G��\0^?�\��\0b��\0rw�\��\0w�\��\0��\��\0\�J_�����\��\04a�\0��\��\0�M�\0�68nw�y�\0\�s_�\0̙\�\��\0m_�4{�\���}����Q��\������\0\r��Kw4���\�Y�]\��\�Do\�i��Կ�g��\�\��\0���\0F�|g��\0g�\�\0?\0�\0\�����\0d\�\��\�\�ʜ����9\r\�T�\r|f�\�>��\�?\�;�k�\�\Z�\�\�\��>\��\�W�\�\��)s�gX�W�ki���^\'�R�\�\�h�Η.4�g3�\�n\�%eĸ�|J�I��\�,L\�\r\�r�����w#�-�/�R�2n\�*Q�I:\�W\�n��q�b�cj����O�_)6?%#!PsC�J�����hp9\�\r\�+/-\�o\���\�\�\�O;�\�>\�\�\�u~�\���,��/�Sk��h5\�\�\�9��\�v�J,\�3\�t\�S澾\n��V\�l�\�n��r�m\Z\�\�o/\�&y:s�\�C۟\�\�gS\n7�ޮ�\��.,�WD�Ӓ4�\�y|\�O\�\�ƌE1�k\�f\�;h��G\�R�%Z6+Fη�qe��(t\�UPp4�S9<�?��Ո��l�\0i�\�Sy�*\���A	�c\�3,I�f\�\�r�`��ǚ���h_O`�NFs�fO��\�噱\�w���n]F}�\�4�3�:<K��vVA\�2s	\�p\�Gj�K*�+�&S*���ãĸ�utӛ\�\�o�\�}\�\�ڏ\�+\re=\�3q5(�+�\'�\�\�\�\"^�j3�?�	�#خNN�^s�����\�\�\�R��~\�%?����ˬ\�\\(\�\�\�F���`��b⍋�6.ح\�[\�r\�0U4�1����7(ܬ��U�oM�Ͻ7\�\�\\y��\�A�\Z�E\�q�@*y=_\n���hD�B���\�\�lW���^6+\�\�\'x�\Z\�0W��Q\�\�_\�v[\�\�x\�\�Is�@�\0�:gU�h��G;|���\�\\]3+!\�`�i#�5(܌\��#�}1ଭ�\�\�\�˅p�\�0R&6)�@F\�|�.(ظ�b���M#2\�\n��\�3\�?�M�h�y��G���Nc4hG\�\�t`�Mcgs\ZU\n$ظW[+d����o�\�B�CJ�lW��7(܄\�)��\�E�\�<�`k�\�� \�h{@}���&�^�\�(�Ѳ��S�Se\nm�eoĆ�\�\0\rE\0 �t\��\rU��g\�\�p|�K�\0M��n���ǂ�(�\nˇ�!����D�\�\�\��r�};C�܆\�\�\�H�8:�O�A�\"q�F�qN�\��K�\rL\�\�3��|��}G�\�	/�,��>���/h��`��QF\�\�]\�j\�\��M���\�\��!\�\�/��6|���\�\�@F\�4\�\�\�DcBo\��\0P��A���hfe\�c\�\�B-�YhE\�+�Bp�ɨ�$�\�\��\��K}ӓ\0��_��O^����`��ˉq+����%Į�Ӻ�F\�\�\�\�\�ȣ���!�\�\�Z\�!\�o�\�\��*F\������\�\�\�\�Օ�uuee¸QG+c8B3e�ړo��hI\�\�h��7)R7)H�8�B=z1�F��\��t̄��x�\�9cz�\�\�Suelh\\�t�\�?^\�|�\"�*r�\"r�\0�ާ�c�mU�oN\�\�1(�Q�I\�\�6\�c\�25\�Y[\Z\��F�\�L�{@�!s9F\�$y!�\�\"s��a�>�}	����hA\�\�:)�����`�iՄ��2M\"\�\�\�En�mF4)�1�3P�A\�w\�\�։4	\����\�unO2��8\�\'�4�R�4�@U����U/�^?�Z?�G\�T�GW\"��\�c�U��J�~�x��x��A�[F�\�Q�	����S]a]r�ir�\����!w��܊�\�Q�\��\\+�T\�\�xثV6(ܣr\�\\Yn���\�\\J\�\�\�0T�n�T�\�\n��\0F\�6F4/�z�\\\�g�������\�Vy)�\�.\�U\�љ��.��UmN\��\��劼lW���qe\�\\K�q.%Ĭ��gH\�4\�\�ݯ)2UR��<�3h^\���\Z��B�s���=\�r�\�.k&\�\�\�*��z\'dj( D\�\\3\��\�{z~t\0lH~uh��\0\�ĉh��\0\�No�Q�\�\�\n\�\�G�\0����ET�\�\��&秠�\�I��h\�\��\� V?:�ʑ�i\"�W!�E\�\�E\�\�}n w�\0L巅�\�\�.\����p\�O�g\�ȋ����N\�=�5>\���\0PK\�^�$)OLi\"t\���\0ʤm\��\�֡0����\�\0MMLu�{�\�e\��� )Yر��(Խ\�L\�(\�\r�\�El��\�s~\�\�䴒N2���n\�\�9��_\�!���KSy\�q\�p�\�_v��n/>RЅk8̆�\�\�\�*e	ǂ�\�7+\�\�xخ��FƔ\�yB9dM�)\�ߧ[t�ȅ)O\�\��\nB?�+\��.�\���(܍��{մz,Tn_k\�a��\�\Zs�{�\�}\�L\�\�`v\�\�\�)�_v\'�\�&\0s\�d+�9;#Q�BAF=nQ�^6+\�\�ĸ�\�\�қ�(G)NTg��)�\�U4�Q���Wm\\Q��T�PD��޶-_@�`�\�Op�_�\��)w�Gf�`W<J��D���\�蛫vV�\�\�p�¸r�$-�&�n\�\rg\�:4&��Gw��\0�\�\���f\�}\�\�0�&;\�t\�މ��ejnYt8W\n\�\\(�/x�\ne	�[�CY�F4 �\�wz/�pM]\�.��\�ܟ�\�Їl��@�Lg\�6Z:�F�\�c\�\�\����]\�\�����|��8._\'�$ƀ�\�\�\�\�6`�$Z8�O�\�UNm\�{�Bf�\�wO�]]]q..�\�A\���0\��~\�}<�Z.�O�9\�A>\�\��	���zl�@t\���\�(ME�\�\�unV\�\�{��\�\�=\�\�\�\�\'\���� �\�IӱhAH�\�<gT�VBj(u\�֛� c8��\�_e�c�\0O���>\�Sd톾�T�ǭ HEuuel�WWA��t��\�M8n_h׏�㩵Ӥx��3��6����\�t�{�\�\�h�!��\n\�\\+�YYPG�v�\�H	E����\�χir�\�3\�};\��5~�\�=���N<\�j�-sHp�O,�tcħ*\�+\�J\�pM\\�W-�[� 5��:�o�`ce�ܞ�>\�s�>���:&dP�Y8f�u|K�{�\�J<�\�b�l\�Ft\0�+\�Jy�X����57�G�߮_H�p�\�Wi�\�+�&\�A\�f�\"�%S:���mV�����%ĭU�j��\nˇ�¸zLYr��\0\�Eڦ���\0-\�e��\��\�\�7\�3���\�O_Vf��mV��\�\�\�b�lŖ)\�p����\�a\�����\Z\�\�s&_q\�\��ǩrr�\�Mw(ܣvV�d�k,c�G�ǂ\�\\Y\\�r7C\�re-��Ϻ���\�.d\�3\�\�\�o��\���(�@�5��\��%�#�\Z\�?����	�UuĀ\'!N\�	/�P8\�\�\�\�G\�4}\\�ux�z-MD�+�3\���4)\�P&<U\��\��F\�¬����#b��e\���\�5���폺�yL�\�X��@\�7�\�Պ7;��!H\��S\�Xǡt4\�*bʍ\\>*?R�ԍc���X\�zm$gM\�A\��\no퟼\�\����\�$�{\�\�ac\�\Z>!\n\�^�x؉�#ĸ�B]\Zd�̄ŭGO~�\Z\�\�NN\�鱜�7JZ\�\�\�A�\�\r��\����\�\0�|�Q��q�T\�0W\\H��\�\Z�WNN\�鿜��r\�{�o\�o۾\��Ƿ\�^:�[�\�\\K�q+\�\�xظ�b\���*�ئ#éh�\�(?�\�`8R@l\��\0!\����\�T�ˋ��\�\\J\�\�6�ڣz�mR1\�coR�&?�?\�˓�u��n�D�K�D�\�[s\"I�ӓ��+(ܣr�\�7+��\�Ӻ�屍�\�\0k�\ZW+\�gΔ\�q\�\��\�\��nk%\�i3	\�\�O\n\�Q�F\��nVVVV\��.$\��sg\�2n�T\�5�\�\� �X\�A�\�?\rĮ�j�\0�\ZXN\�\��\0�\����Q\�]_���	��/�\0hy�\��\0���\�S*AL~R���ԅ�ҿ\�]��\�c��oM:\\�Gq��hAH����@*0N�J�R�\�s�\�.=\�M��E�w�\0�\�2\�s)=>\�&Ty�r�0\��\�n��*�q#���$�M2��>ۜ\�\�\�>��\\P7��0\Z3fLt�9��NV��I\�n���U\�@HM��4zb�+�0k�M\�}˵;z\Zv\�{܈$�X��@{i?TiB=�\���Ӻ<+�-�j�mVVWWQ�F�uuu~�LhBw�gMM@ʉ��a.\�hѫr\�:m\�r\�y�u3�`�΄\�k�=ṣ:p\Zz�\�\�xظW\n���\�7.%Ĭ�\�k\�zz~d�iMMD�Tdh��f�\�1�A\�?Vq��Hs�\�\�\"�\�\�k�m�j\�\�~�w�[��E\�\��\�-\�\��.,�+�YYYYYYq.,�\0g\�\�\� �P׹F�yN�\�\�\�\�s\�4\�\"��\'��?C<T˦z\r\�ꃿ{\����x��\�t\��`�H���\�\�uuuuuuuuĸ��\�[\���d0���\Z�B�:>\�\�	���%ܫO8𯚛\\\�\��9�\�C�S�Rk����s	s�3\\=Mk5\�\�N�\�?�7z��*B\��E��YG���a�\�\�41�HE�L��m\�Cݣw\�r�y�utf(~�8�O\�\�p@9�\���]�R\�M�\�6�\�<�\�%\�\0�����Q\���@\�)��X�p\�\�\�W\n\�\��kOp��\��ʪ͑\�\�9\�u�!\��\0s�M&ď?0Ms�Zi�nR��jR�5 ����\�S���`���p�ky\�\�h|:a=\�e\��D}�.CI\�$]\�\�\�ƛ,�Ճ�\�\�/��O��%,�E81���\�bp\�+�\��P��\�\�\�&=P��\�\�\�\�l?:\�ـ�\�\�\�D�MУ@\�B*\�\�\\�i\r\�:l�\r綤\�O\�K�|\�|�~2|ǀ�Y~6�\�{Zt|�\�\�L`�\�1\\+��i\�0F��c\�3D�Xs\�\�W�9�i\��ڞ\�6�y\�o��[԰J\�5\�PϚ_�!Kk\�E�99TТ1�F�ԄU\�\�\�U\r#z\�\n�ɷA�\�\��[\�\'� \�8\\\�\0�n/8-���F�\�%\�M\�kT�;K\�Z\�\�j�\0Qft\�[m\Z��N��A�{�%\�?R��\���\��?�4�\�ч\�bc\�\�KF��\�\�n\�k�֛#��\���>O5\�8E.g,;h�M�\�y�!/x������U\��\0k�]\���\�\�ӹ�\�	z7���⍫�6��d\Z.\����:�[�\�FP��µ>I\�ki,^�\�x�\�\Z\�c(���N,��s�\�r%�ڎ���nC�zw\���j⍫\�\�\�\�R@}\�/݈ܾ�W��?\��<f\0�G!��\�s\�\��\\\���+�YYY[��r�D\�m�D˿b�1UTMAB1�H6�b�eA�O�\�\n\�3�\�4L\�!4�I��H�\0�&��	y\�Pl\�\�rw@Q]]l�7\n\�\�=�p\�\��\�\�\���\�L\�v�O5N��\\�;I+��\�-��X\�9x|W�����\�\�\����LYM]b�\�rR�\�bt\�R1\���\�L\'��F)�\n\�\�ֽ�\�3�2�;(������:�\r¸r\�\�r��\�_\�a\�P�]\�M��\�\�\�ߍ`\�蛫j\0E��\0NN���\r\�fN\"\�ئ	��ҏ���ЩN6(#\�(\�v�\��?��1Ů�\�{���\��s\�\�2Y\� �\'8�th�P$��MEHؙ�`�貜�#J2-h5\�<�j\�ЦS\�r�^\�#Oo�E$�jlC_�F4\"��\�xە\��2�\�;\�	��_nD��\�މlT��kL&\�z֖;��\�(N\�I\�_6\�\�-Tѡ64#\Z\��\�}M\�X���\�)\�\�\�hS�������t!��\�s\Z��?\�\�\�4�\�+\�@�AЦ\�_�h�4i,>X��\�\'e��K\���\�.\�@�������,�*^\�\�H�0�lF4b�\�W\�\�2\�\0�N�k�l\�yNV^\�o3\�JLO6`jr\�{KM�3�\0�\�\����\�\\91MA\��\�\�w�CX]\�((++\'jE\Z�\�r��g�^\�$%9{��s�H�i��\�s�\�;�c�\�sN3dΔ9m�\0l�\Z�_\"�R\�<�\�5�+,r5g\�]]_��r(d\"C$\�i\0�!�R�$�c\�+8��%O.\�Y� ׂ`H�\�W,�铉3�8�}\�pm\0\r�$���B�)������ynULQ�g�(e��t�~ϲ���^v\�P˂pq�����M�iD��\Z~�\�o\�5�\�tkO/\���\�r��\�)H\�l���4QVQT\�\"^A2gG��\�\0�]+I\�F�\�Њr(�\Z`�=)�\�FF�\�P����\�@l%9\��htO\n�\\M�R�=�\0\�&A�6\�\��]L\�I��S\�O��;�\�I��\�@��I\nS\�9���h̝+\��ѡ64\"��r1�F\n����M$3\�Z\�\��\Z\Zδ����儺\'�\�u&$\��u��\057Ї\��\�K�-u�=Ų�k\�\�!\�\� 	L)\�꿖�&i#\�	�\�\�*��\�\�\�\�\�\'?\�6\�V�V\�Q\0�@�\�\�#\�\�hvs*|��O�\'N���Nb`�uIH\� �\�Lr�:��k!�\�\n�9�\�4�Kɢ������nSY\�嵲kg?h5�\�\�ԒNrP�JS�\�\�b�59 H��i܄�B�	�i\"�s\�c\�Y��\��N{�\�m�H�,ڸ�{˥!%A�\�b��ᖂ(�\�\�	g͠L�!A\"kF�\�\��\�idNsq��\�R@Ҟr�)F��Y@M�Fp�iN\",�!\�2aC�\��Y[$\�sA��\�X^\��\���\�\"g\�YO(h�\0�u�\�r\�\\k\�&\�\n��\� Q�\�k�\�!|�VM�X\�8!3JQ\r*BȣJ&\���\�p4WWS\�\�\�a�\��\�ƌ�\�h\�\"ߔ�s\��!:�}DNե�4	։�L_ ��\�M�\�Tuu!t]5\��\n\�\��9D�\r�U5��\�\ZQ9\��g��\�}À�����HP\���z�cBr*B\���\� w�\Z�\�AԜ\�r=S��zPDβF����\�\�\�k>����NE635&\�܌hNE:4&\��٭��\��.\�B�	ڐ�݇�\�\0?\0�\0\������\�2N\n��O�S�\�e͖��_�\0�\�\���?����C��\�׹��k��Gܻ\�z�\0|\���s[2�Gr�\'��8/�ɞjN&Z�+�\�⮮����p���W���Z.<\�\�\�\�ޏ�\�c��s\�W�\�N�S!��Ҹ�>�\�ବ�����WA�����^٠\�Nc��\�	�Sc�?`K���A�j;�_[\�V\�en���1�b�.�\\K�Hǂ\�K�c�\�}/�\�\�\�E��̠�{\�=�\�	\�ƕu|�W\�\�_��\�H;�*f\�q)\�%��\ny�_�{.\�\�4ͧ�?�\�g\\*\�˅p�l���Դ��h\"-ё�$ #b\Z ?�\�4\�g,\�L�®���Ѻ���S)��ET�ԣF�\\b�ґ�3?\��W�O+�~���Ԯ\�Ѳ�Sen�\�\�d\��\�2�1\�w<\�\'�n~APKG���F\��\0�rvY2�\�$Eb��m�\�o\�\��,��xW[�\�jj\�\\Hƅ\�i\�};W�l?Q�U�.\nf\�xW[+ejj\�\\HƄ�\�\�\�څ\���\�q50Q�|K�HYa\�\�\\K�q.%\�\�\�]c�k+�\�<3�\�d={S�y���b��\��.%���G�q.%ĸ�S���Q��F�\�\�8���$\�\�%*zg\�Sߤ�+u7WS�\Z#�R�\�J��ޣz�\�7�ڸcj���ґ��Օ��oQ��_俴\�K\�M�N��\\\�\Z\0�WW\�l��ci�\�W#tJ3�J���\�7�ޣz�\�_=\�Ң4�R5�[G�*����ޭ翩�5��\�>\�\�{4�5�+t�k\��b�#j��j��\�T\�z\�\\9x|~+�\�\�9cz�m\\?�\��\\?�\��Q�F�i\�^1S�\�dE2�\�\���\�/qЂ\�\\9n���7�k@F*�\�iq\�DmC8�T�����U��\�㗋\�฼>#�7*ǂ������\��FV�U�#9S\�ћ)\\�p\�\�4\���\�Au,�NB�f\�\"z\�\r��z9�\�Bbɩ�6���+�)��ԍ\'�\"�=ӓ�՟״>\�>��7���9Us\�~�4\�(�R1R�joM��o\n\�\�tD���h\"�ܱ�߶}�\��\\�7J�J��������\ZSA�(��B\Zz����7)h(�/�Df�e`\�\�(\�\�	�mg\�;\�+��@B$�\�J���@\�cj?V\�޴&\�h%B2�)|��	�.\�w0�\�\�⚚�����e�S\�&����j\�xW\n\�\\];��B=�FZA�� 	�h9��Zjrrd�OD\�Ė\n7u<+�q..�#ьa�0\\�\�rh��v��d\�L�<\�Z=��\�\�\�	��ѡFc\��`�\��y3�@\�iE�ˣeo�\�[�SS�B�2\��]yy/\�v�rc�B��)\�\�%(̣r�\�ѱZ6+F\�hؚs g��:�����\�ѱF\���b�l\\+�F)��#<\�Mr�й`�\�#\�~���^E�J����z#1%\"h~�nV��ѱZ6+F\�h؄\�*ǂ�TPVVQ�F\��nV��ѱp��\�`�q��Lh\\�p��L˴4�\�\�z� q܆h1ZToU��j��S�h�����GWQ)�*�\�m+�Ԁ�jG�����E�\�dfB3&3\�@K6\�;�������Ɣ)H�\�\��J?R�y�\'H\�\nH�K����d��,c� �iB��J\��J\��J?R�Ԧ/��Wp_\�E�\�_gi5\�B�3Z9-�r\\>+�\�Z�\'U1h\�]]]_�uuu|�\�F�¬��)f�-��ڏ�E\�hoi1\�YF)�\�\�T2p���U\�&�(e\\+�Y[�en���p�H��o�\�蝨�PE\�\���i=�P���R4�1��r(\"�\�\��\0V�@��*|?*��ʄڄ\�OOʀ\���\�	�;7\�\�2����\�j�X�;̜\���\���&k�5�\�\�\��b��f\�+����`5$$�v�<�&��\�\�s\r?�h�k)�枈�\'\"�(����\�%\��\0O\�DJ�,T\�\�	�ڤoA�o\�Y\�o\�M�\�L\�\�1\�PWWNG)�\�k��H�LXi^\�c�@�h҅diM$\�K\�\�\'�+����2�廞e\��|�d�G�wyi@�\�\�^\�պ`�Βi`�\�?PFb�\�Ԉ΄gƜ�ϓ�\�\�|~\ny���t4�����r\�Q�-���PA\�\�\�?��5Ӡק�\0q4{��\���+++�\�\�edW�G�k��v�\�DQ��\\\�\�\�:5�\0��o\�i �\�	�\��1\�ݡ<�\�=�\��B3�cOB�W���6�\�X)g(f\�;(G(7�b�k����4�\0J�oW�\0�]]^?�P\�������+-\�g��4�Jzb�\�\��Ν\��C���|k٥0g�ߠ�<���9ͭcBrvW#�\�˅p�B2�u<K��r\�l��ɽ\�0BY�\�����\0�?�\�vph5\0�ๆq=IĄ\�\�G�¸W\n\�G&*�O\�\�ܳX!�rn�D≧\�iz.q��\�\������\�\0\�\�\�:^\��QG\�g!�$�\��\�*\�\�B9n��wy �i�B��S�\���J\Z|\�q�3\�\�ܮ{\rZPtǴyO@@���G�#\��Ô#��qe\�I�ǘQ�)\�>K��-�\0k\�	\�0�\����HlBf�AP\�x�W\'tZ�׊\�!3Z sH\"	�#2{��G\�״=�|\�O\�|�E:�%ŕ\�\������JDߧB?\�y�\�Z��\�G�9.:P�A�M\�3�r�\��NNSU\� �W\n\�F4��Dt���M��fcb{G��j\�\�M�q\�9Z�\�r(�QHE���2*Q\�W\n1�\�UD\�t���r�c$\�%��64v�5�V�ɩ�Z�\�((ܦoW���?���\0lζ��\�W��#Ҧ,cB�x\"HQ�{��Y\�gr#J\�:u��s�\�\�&oD\�I�Z�\�()ǒ�Q�F�?eu�U�.NE59F\� m\ZT�x�#U&ǂ#\���s\"���F������#�\�\�h��P�x\�joO�q./=ˋ\�r�f�R,�\�b�y\'\�بo?�ѩ}6MM\�Z�>�|��1�6 �NE5�3\Zi�\�+Szur\�\\^[��\�S2]]F�e9.�1�TԦ��-AF��a9�VEH\�	\�ɩ�\"�\nc! F\�jF(ъ�c�\�1XF(�R-��7�ޤr\n��]A�$�\�P�Q�4\�p\�|ӓ�Sz7\�8�S&�N�\�\�S�_N*B\�4�E\�KF(R��\�1BW�UEG\�F�*7�HD�:6�L\�\��m��lW>�#8Q�jnW\'(�R,�k�4F\�2��r�\��\�\nrS\�\"eX�\ZFń`�V,P�D\�ꆰ��\�|�%L\�퉋�\�\�b���\�\�0Q���6B$2�\�\�\�P\��H�\�Fq\�z��r�b��\�/\���N3#1CXCP鸋H�n�Ɯ\'\�\nt\�X\nq�&+��ɥƒ݊i\�4��\��L舚�ҥ8�\n�R�S,�\0,W�?\�(0Z5��M\�%����\�%c\ZI7����P�j$�*�тhϢh\�L\�H�تk�^�ߥ^Q���1�(cfI\�(�O�4��\�\�#\�o(X�l\�t!;J3 ��P��k�Ԧ\rc$+)*\�]]]]T*\�ض\�\�\�\��B��\';7Ƕ\�A��VsB��7.\nѱ\ZFN<�J�ƅ�nQ�F\�L\�E�~T\�b��\��L\��\�o8�n�Q0�\�i)�MM\�\�\�\n\�W���^6�\�\�xگz��sF�\�a�n\�a�_Q\�\Z0MM\�\�\��\��W���^6�\�\�xگz�\�\�\�v�\04a�%h\Z2���qu`�\�>gw�@�U \�ٔuK����?�\\\�$���\�eH�%\��)�O���ޚ{�x��\�\\JaH.%\��2\�pq\�\�ܲ\�0\�\n\�t�^\Z.2cj ��6V\�uu¸T��\�\�����<~�Nc�:\�.qM\�\�*�.\���\�\�#F��xj�V,P,��Ӻ�����\�VR\'%��\��GO\�[*�ګ¦;du2>�#4\04�\�\��!4�\� z`�~Yl�����p\�\�7e����D�hֈi\��ɁEܳSYC�c\�\��\�k\�\�\�\�MW/��\�\�O��5�&�庺\�\\YxW\n���\�7���%\�Ӕ\�\Z�ǈƐ�LLJ.�݊-�\�;T5�Mq�r�VI��k	��\��\0.�=>¸|W�V\�\�(��𢜧(��@�\�a\�7˴�\�2��\�\�:U�21�Wj\�U6�r���\�Ai^�r7a\�\�\\+�p�e�3\n%׍H�*\Z���&<�$I8�\�t|f�\�;6Mi%H7\�zi}Lb�\�\0\�;R�9fSMF��J`��8~T]\��\�\�_�ed@�jQ�8\�6\�4\��+ c2q\��\�\����1��\�Mcd�(	_[�(�% \��\\(�#gMڐ\�!^\�\�\�\�\�h��`�\�x\��:|K��ut\\t�X\�\�(�\Z_�9\�t\�+++����wNs�� 3w\�@��\�I\�\�)4L�\�j���z�F��.\�\�\�\�\�\�4\��\"a�W��Htb���R\��\0D\�M>X�4OO\�O���$\�H�6(\�64�|+�}#\�T�\ZԞ\�\�JhF�\�\�\�\��\"e\��T9Z�ԸK7�q�\�|\�T\�͆6�	��\�?*c	�\�\���\���f�S\�\r{�A�H�{7\"s�Ae�\�	������ǒ$\�H�K(֦m�n4R\r�޿\�*M��7W\�F	\�\�Z��<\�Pl\�il��45\�y��A�\��j\�>{��\�)z\0��=0d�n�P�\����m�V���U��k�6�8��x���\�6tl�\�\�[�Q\�\�ܢ4#33�L5\�\��&ֱ�z/�[B5�\�OтǊ G�N�\Z�F�?@�\'u�\�?2!�q�I��T=�Su6o\\1�Z6�%ĸ�^\�\�E��O\��SkA(�	�\'Dp�\'y\�M׬gN\�Y�G�\"3���S� ��wz~\"f\��5Bb{7��t@41�\�?\�W��Q�F\�ĸ��\��\�ܝ\�����\�\�H\ZF�\�\ri�\'Dp�HĿ�M\�\�\"hzw\�\�O\�b�.�\�)I\�G�)9\�2]]]_/\n\�\�n�ԄS��0�S�\�\�\�\ZP�\�銑�T�[t��2���,�0��\�ܨ¸W\n\�\\+�]]{.W�\��h������\�\�m����v�\�b��LI\�\"����ج>X�\�6d%�D�\�qN�:a7(����[�V\\+�p�edJ�N��`�c$I�G�h>\�Bd\�eUV\\K�9�̌����\�Н�\�&jI��<\�d=e泌\�6��]]]Q\�F\"j�#:G�#B:�Bf�\���+u�;�&4#\Z2�`�6��\�㒼^*r�3\�m�n҉Z������\���++���;�&4#\Z2�\�\�ύ	�ѹF\�2++z[,��ES�Q����=H\��\�\�2�Yʥi�����K�q�.?�\n\�\�\�v�\�)ʨ��Yp��ĩFl%L��(ޣz��\"U���~%MlN�#8��\'&�bP���\���\�x�\�\\]+ue;P\�$�<��\Z�\"[ĩ\\Ą�: �nB4#Y�	ĊK֨\�2\0�>\����\'&��rh�\�W\�;��%\�Ք2�.,�MI��	ۊ{Nq\�D�\�\�\��t�\���t\�h�u�:7�	�\�WD��]}\��\�ˉqueel�K�/,<\�c\�Rh�\�\�u\"�\�\'\�\�\r�tw/g,}]�Ӭ\�ZOz\'Bt�1\�V��#a�R\�.��ʃ��W_l��N\"Y\\��ڒ�\�޵�4=\�l>!KGCA*A�8�b\�\�N9F��d9~�)6�;W�p���gN9\�\�\�\�Ox�_n\0��G�y(ޱˊ$\�\�\�Db�*_!\�\�e�E�~\���YL����\�\\)��\�ιc?�e8O\�\n\�\ns� pݔ�V�\��\�ˢ%d��\"�$]�-Z�Sӻ\�i\�=2��!)JZ|\�7euj�5�Ӣ�=ړd+/O\�S\Za\�:��\�\�\�>\�<\�\�a�@m%1I�\�s\�JvS\�^�篩W\�\�h��PG��hQ�D\����0]ۓ�\��z\�\�V\�܏T�G�\�\0?\0�\0\�<\�$t��\�!N������������\Zt\�\�\'�F��*-\���ʍ3364��߽|èYx\\�~s�\�v�\�\�\�\�\�Q:Uh떤�\�)�\0�M�\�\�`��n\�h׾J�\�;�\�˶�Mz�~\n_LO\�\�\r�\��N)�mS��w-5MY~#\����J;i;�\�\Z��ʛ�\�{�D\�t���\�:\�\�QWR6�\�U\�OD\�(Tj�\�5��\�\�\�\'UYU��\�W*n\�[\�\�W=\n5UThUU��D�}b\��i\�ƔҮV�\�ޚO��\�\Z�W\�\�ʫ����q4O+�\�HK<\�.�w}\�\�t<*\�����ο\�d_�\�c�>\��\�C��z\��Iu\�P�\�\�*TN��\�}\Z��)��3#�\�\�]x���x�i��7\��\���:\�GN�V\��Z\��ti�\�?S�[�\�\�em\Z�\�*麟\�J\�m\Z%D�ԨE[T��\n3��F8\�/�~!K}S�j\�[\�#\�\�v�\�j��g\�\�p\�\�ѣ��\�9�vo[��춚\'�\�\�\���\�\�fDt+o���OGyQ26�:5\�Ð\�\�޷Y+�إe��7\���=4�9�����\ZX�e.Zs6\�_\n��GF�\�\�|����:?�\�\�\�\�P��\"�\0eTA��Ң\�<\�2\��\0Y_�F�/��L�+����\�k�\�BEIK����Y\�UWX~����*4(\�30E�z|ܵ7f��F�m\��]{V����^��C�3|\�>}:��̊ �į�5\�\�uSR�m�u�����_L�\�nW��uu�P�:1��VT�\�hUR�\�\�k\Zk\�#~4��\�mlfr��\�x\�6�\0w\�/%\��N\�u�\r��ŏ�h>��d\�^<����C0�ZI2\�\�ٲ`\��w\�-\�\�d�R\',���^~\�p�.{&��ڼ�\�!y9_~�z&t�5�\�\\|V?�(r<\�:\�ڴ>���W��~ �\�\�I\�\�\�\�0!�@\�;^\��۽�\�\�	^K\�\��滆F���\"{r\�\�\r�\r\Z\�xs�\�!�kS�y�\�N��7C<\�.J�\�\noj�ʩh\n�>k�ȅ\n\\и�Ӗ*\�\�\��qUQ�7i6:\�EA5婣��֞1Q{yE\��\�mUMmj���T�\�h�t\�jN�eT�q,�F���YQQ\\L6\��\0X�\�U\�Rl�m\nT���m_�\�\�+�\�r��8�S�|ާ�\�\�m\�.Ӧ�[ھ�\�3?DT(�\�R!S�\���o5I}=U2wP�TͿ��y>hV�FTX\�bjM\�)\�\\Gsǖ\�v��$�$w6���\���I�gF���\�\�J�\�U4*�����.\��\0\\�{l���\�\�\�\�8\�36F x>?w��\�\�#z:�\�d�)/N�)��\�P�\�A\�\�η����\�n��\�Sx娤wy�=�\���\�\�}\�>Ӽ%T\�\�;	S\�\�p��\�\�\�db\��x%\�w�g�`\�|]���܊^ \�\�\�\�P�+\�ZE�~�@�oz�]�u�a\�\�#h�M��!ZPd��;\���}\�x�\�a\�8���ȃnE�����\�Ê;\r��W(ImlgdQF8��B��U�\��\�-\�o�&9��\��5j\�\�UTW��48\�UM3/:�EEm\ZuJ*)��\�\�\�Ҝ�]\�^���\\\�\�\�\nԵN��6����d/ʶ�\�\�s\���iMk\�R�̚Ut�\�N�\�\�\�\�w/\�\�}\�R�t^{��D�q�j�S:�t��]��\�|\�tN�\"*M###��`�oU\�~:\�\�\�s\�zw������AKY\\���\Z�$YZf.���T\�5���\�v��-\�\n\�\�\'�K�F���nR�莡y\�Z\��\"�x֥��\�#�I��8NDTL\����\�\r2o�\��	E?9��Ԍ��\�7~\�~%\���q�ڨͦ\��m�>\���ĕ\��]�\�}\��)�.�\�ݖ��\"܊ahw�EJ�+��\�]\�8su���\�L�\Z\"_m��)\����)�>�J�L�\�\�\�ww�w�T�V���Bw}�\�\�KQ8�֏e���{+�Q\���\��kC`��n\�gf\����F<?���������e�9�7d��\�lq\�\�=�\�<l\�AK�\�Vd������fXV�x�<���\�f㏪`�ޣdSa\�b�<����-rk	�\�i��&�N�W�͢,#\�0K\�)�\�\�\�z\�\�\�K\�V�\�?��\�k��z\�z��V�\�\�KZ�s�\�͵j\�UWP���\�ҥD\��Oj�WsV�\�V��ˋ�L�P�X\�%^�\�^\�u	\\W���*_�TiT��Q�������OǬ�D\�2(�̉�p�\�s;�s2�8\�t\�\��}膩\�v\�S&�H�SJ�u5�)��\�ꓕ*T\n#23\n�.�\ZzN\�U\\\�s�V:\\\�\nq�QJ����Eq\��T\�Rď&���?�o%{��dw�\�g\��\�p�_\�\�\���ʄ�K\�\"��G�/�~��t��\�x���/�&�;\�\�|u��!w\�=jdغI�M�\�k�wFp�\�\n�%�hR�Fː`\�;Gx<6ee�\�\�\�ҒC�\�=jr�\�0�W��L�˂0��\�\�!\\Cy��*}A2v�5�\�F?�3��g�\r���G\�\�f\�\�\�pd\�uo$�-\�\�	�G���f�\�(ŝᵩIa�)A>͓\�\�\�{�x=����&nP����\"]\�\�\�.\�)~�\n7��4(:\\s�ueI\�y\�/\�J����U)W^��D�Q**j\�\�T�\n��@�7�\��F�q�]�_g�����7[\�5R\�\�)�:Uj�K]F��:&eJ�\"?�ʍ3�fDDD\�i�/ݡ70V\\\'\�2��Ͼa\�w��}]ۃVu�\�\�%2m:�O�#*T�FUTL�(<�\����1�۬ŎW�\�ó\�\n_�\��[��\n$K�㨇�\�	8o�},A;tN<��+\�ȭ����\�x(x%u�V�Ѿ���\�X���\�_\�I\�Odm�\�\����}\�w�މ\�}\"	�ϼZU\�%��Κԥ�`\�*7M�\0�����ԝ^�\�.�\�u�L\�\Z�7_��R�\�\�\�]D=�w\�VB�~�\��ڒ��j\�hP�KfHɠ�g�xZ�˥J����蘁Z7l�[�,��%Z�B�w��q7Pj��#\�8��v�\�фq|}��c\�T�,a�5��@���*�9�ŝIE}\�<͆�!\�x$�]\�L�z�\�<�WEK���\�C��\�Eގ�$���\�\�\�R�\�zz%F�]*5���*�#iRF�v�N�\��MP�\�u\�$X�M]\Z\�\�SW՝*�\�\�eJ�*&dd�\Z$gḦ���\�wF\�R�����\�Z�\�\�7Ek\�\�r]�\�\�]\�B�\n4\�\�o��f\�\�E��`^�ޒ�\�\�Kh�^W\�\���\�ޔ(�\Zt(Q\"�B��e\Z$\�\"��7��\�^��\�z�[\����\0�K�\�W]2d�n�}��\��@\�c\�\�I�\�O����\'\']�\�\�9\�\�%�J\�	��(��	ts�$�\�\�x<=-wW}Z���\�=\�J�)\�Z;\�\n���\�췫��)�*��=�a�C��s�\�ah\�\�R�\"�K�fy�\�K:��N�hw׳纳�R�\���--�Q\�\�Wu\�~jL!ӌ{��k7\'\�:ǳ\�p��bZ�\04\�\r�J���\�6���u�%#\'\�\Zݤ���\�Y\���,��<:0�n8$�X�\r�#Wl\�ťܣfFG�t�%\�E`\��L߬Z΁r�͗�{\�\�}һ�%�ɨWr\�\�Q�4�jTQ�5�t���]:��\�T��ѤFQ�\�G1�\�e�\�K�\�=n\�ßW�\�t.\�\�\�)��wf��\�>\���M*�\\\�tjʑ�����F�yRU~oE�}\�\�\�D�a-*4W\�\"\"�F\�Q�ThСD�\"(�)�Q�]o��:\�+m\��A�gw�	J�\�ņp^\�&�/�]�㑁7�ޖ��\�\�6w?R�Խ�\�{p�ǵ.ڸ�[;�j\�x$��\�\�KuL��ju��8]\�G|p��n�M�>\�^7��hx\�,\�v�\�_�D{��\�u�\r�\�i�i�\�Jt��v\�m^�\�1fN1���@�\\�M�;�\����\�\�\�Q\�.1\�\�\nއ\'�\�\�\�O�&�6�\��\�Jek�|�##(a\�O\�=�Ś_(S2h\�\�1g�^��&�g��1�\��l\�\�hٕ�܈l\�|�$\r%1\�y��p�\�o0*\�V��7z�\���:Ey.˚�GQ\�{�\��\�U�~u\"������\��\��zoS\�3�\�]�;\��?\�\�)�4�\�C�-bׂ\�\�*5	�iR3�C�<�\0AsV\�[\�x��~_!�J�4��~͸k늉�R�\��յ�_�[N�)\�ˈ\��U\�W�8\�]�<S\�\��_`R\��\�]��aD�^\�z^�\��;���E1\�x\����[� �\�\��\��\�wi�\�\�YR\�\�.1h\����z\�z7CB�\�ӫJ�\'�,\��ǅ�R�mC1\���-/̗j)G�6����Rϐ\Z�{\�\�_\"\n}�����iл\��\�\r�l���\��ﺱ\�8\�\�O����\"�pf��/̖\�\�T1\���%\Z#˔{A߃�\�u̖�,@���/]��z�&!2��b\�0�;�ue=�\�\�Z�\�\��ۥq\�x�G\�\�{.�?E\���L�%I�\�+G�\�C�m*�\��xb\�rL;\�(\�\�\�%\�M�\�\"\�s:髭Iy�j�(L���N�K_F�R�\��g���T��\"����Ê�8�P\\㼎wk�κ���c�쎥z4�\\���,M�Ԩ\�#:FdDDM6���\0wK��\��\0�\�p.�w�ZU�>\�]\��(QV���=e:T/+ʨ\�\�T\�\":4\�\"j��w\��QK�\�wهVkÉ��\��\�)�E\�^����\��%�-�J�Z=��ԛ\�\�,\�J�1�5�6`���ޅdZ\�;\�\�\����\�Q-C\�\�;�\�\������w�ҧ�r�?u�f\��-Ѵ]�X=\��J\���`��\�KP�\�\�1|��\�\�6w��\�\�Ҫ�|�;N\�,0xl\�\��{�T�meIgأoX\�\�_�\�\�\��J�Lp`\�\�IT\�,	G�\�\�)� �y�Ȏ.#\�8���.��7^��o���7=\�$�\"\�0&�X�k:�\��Y\�kAY�\�t�\�}�Z�\� �\����M��a���C\�ʕ忡[���hv:\�s\���\�U��\\�v�Q@�ק�N�.\�W]\�]L����\n�UDg%\n4Jo�\\\�!:*w���\�r�8]�TUQ��q5U$�\�\��\�3:ʴ�Ѩ�D\�\�Ut\�Ή6����\�X\�|�\�t^ä��g)\�\ZF\�\�Hù\�:܊���\�S����\��[�\�Q!c\�\�-\n*z)�ի��\�w��km�\�#\��|ޖM�j\���^�&z:\�\�Z�\�ǀ{AC��>�+V����t�l�v\�\�\�c�</��ه�{祳|��~B�\�R�\�xVEn\�\�,\�����	X6~)����\��\�\�Z�4%~ �(u��=�;zAoN�9�\�(;;\�ԛ4BΣeS�k8Qd\�?�J�K\'\�\�8��\�f\��oI�t�0l\�3Dj��9�:l��9�e~>\�\nS�\�^I%��c�Bi\ZK,���P\�\�\�ڇ9Q\���!g8�dM�&!򔇷a�f�< a5\�N�ș\�v\�A3��\�IҺ8!��\�z�崪i\�]~h]{[?�V�\�x(M:u��\�FrU\'�ә<�{9)^�9\�WB\�\�J��h+oE\�z��w]\�Z�\�:5D�}}\ZU�Dt���3\"3&\n�b_;\�U\�f_���\�|^u\�)\��\�U\n��f����\Z����QWF�\n4H��\"(���x����{\�zw=\�U��5b��\�\�\�]�a�\"\�8;�\�ǯ%�\�\n\�\�ek�!\�Y~\�3r}.?g:\"\�\�\�$\�nX��\\_\���\�\�u�I��_jq����\�\�x~\�\����\n����\�\�#��\�iב�A~\�^�綄�вᶂ\'{�\�J=u��\��\�R�\n��D4\r�V�*J�8N\"��b�/,�\�ًG|�x�&�\0���\�\�x*�t��{Bҕ��\�E�H�F]\�T�b�\�\��-\�V��V\��/�\�\�ХޢʕJ5\�ȣ�q��6W�Xh\nn�\�j�m\�V\�\�@\�	��p8ş\�\�T�a\�>\�\�\���\�8v\��I!�^�_X���&w�\��8R\��\�2L\rBu>�b`�*S5n��\�7\�B�\��\�\�\n���J��\Z\�5U5�\��@\�8�H\�GFG�#�\�\�)\�u\�r�\�ǟ7y��/\�n����Q��ܮ�\"8�Ή\�?a�:�5\�]�.}.�\"\��\0��AgL\�yEoD���7�	\\.B\\H[Wp\�S�;^\��\0�>\�oȜ�J)ɘ{\�J�^޹m�\�C\����\��׾\n�nKw\�~Ձ�{B�*z|��{V^�H8�\��\�\�,��h���\r�:�I�{B\�`ܐ�4Z�މ~[nlp�Y\�S\�A(Qj�6q\�JH�,P\� \�n�mXjE�T0c1hwl�{A=��|��u\�c�\�!\�\�,\�4tJ=�p\�-	���X��\�!�ѐ��\�0\�0�\��vW�L�����\���C��ܰ\��Xu4q�2Bu�,Q_�~\�\���o�z�5\�v\�e^(�\���Q�W�\�\Z�_x��\��\�\�\�t\�\��\�_�SQI\�w55Ս��Gv�j��UP(�Ѭ8�#\��]7ΧB�0��3�=�\�\�wm���{N���Z��������ʲ���\�Q�j\�\����GH�q;�\�\�{I���|�軿@\�?\�Gu�[���\"c\�\�\��\0��\��#�\r�\n/\�\�\�uj��\�H���\��I���}��^��R�D�U)��\��\�:\�\�ͯ\�=ޖ\�#@��\�6x6v�\�B�Q�g:�f�k՜E\r1٣\��:�J6�~\�\�\�I�`\�\�\�04\�*%f-�Uk\��\�.ѻ��凨F��<Q˘D��<��GVa+�JD�Yl+b��!\�!/_T�G�,�S�d\�&\��\�ŀD[2��vPJ8�\�\�ȅ�߲�I\�w��w\�A=�\n.Ƈjw�w[�\�2<.Qi�\���\���\�G\�$w���΋����fq��q\�k�z/e\�|к7\���O�\�e\�b[��y�\�EA\�TΝ}$�Ĵj��:%H�\�\�fR|`��\�ݮ;�\�Z�\0|�U\�Rd.�Bz\�\�\�\�\�R��Rt��R<9�\�*��]\�~9�|\��#�\��\0\�!�e\�0\�.`>/�Z�\�^t>ռ_�}�\�\�Ow��{��X�U\�1�@\�w\�\�Wm\�\�o:ä�������;�\�k^\�\��\�&\�>�&H\�\r��z3K�>�\��\�\��F\�KiW\�m\�\�{B\�\�M�\��\0j)\�kF\��J�6&tx*9<��\�N�\�\�a\�\�\�zx\�9=�\���f֜BB���y4\�y5��\�8L\�V\�\�C\'~\�8=�\�H��R�C�\�E��H>w\�I\r5~\�\�\�&�����\n=���S��\�@�(bd��\�vH\�\�\��\�V�\�c�|h�\�\�ܺCY�O$c\r��(��B>\�ah��xH=0\Z,�K�Q\��\�_���\'�ZY�\�\�\�\�}7��\�_��\�\�Be���\�h�\�&|W���T�\�4\�Q&��\"���\�����7���\�W\�\�x%�������Jʚ�ʺ��UYP�\�S�s\n+��^�y\��7�\�\�F��\�;��\0�6drFFAK\�\�\�\�*g��b\��\�\�\�ȟU�܈)w\�\\%�\�\"Z��p\���\�U|����Zf��:u\n�)���\��/ ��\�[f��Y�h�!�k\�\�2\�Zu�vI\�7x\�HxD{��\� ٝ�OK#\�i��v\����\rw\�7|�򈓪\��wyc\�\�\�\�\�gcG�\�l�����ᨂ��y�Ǥ(�;�ዴ\Zw}߲)�:│�.\�\�=ި�J=ܪ}�î!�G�Cw�x2�+>�H6t\�LE,\nqg&\�\\f-;\�,Ǥš\�\�J�L�$L�GN�\r\�\n}�V���坁2�=�\�\�u���_�\�|ݤ\��\�]\�z\��\0ri?���z\�\�\�$\�);)\�Z�ښ�}ma\�С\�\�V)�B���/�/�2�j�v.\r\�{^\�\�\�7\�*�s�%b\��=*T*�E9�W\�3��y\�\�d_gX��ߗ�\�_i���p\�(�}\�z%�����\��r@��ɬ;o\Z~p�g��ޗk߭�\�\�B΢ԥ��B�<8\nc���x�\�L�*o]�W \�\�s�\�=i��&mAh\�\�3ym�oH��\�\�\�h�;:�bh�30c\�\�\�I95D%ՄK\�я��\�\�%�r`=\�5i�\�&!�\�7|\ZzFa�p\�\�\�\"=���\r�&��h�[F�\�]R^\�-�>\�C�T̗4��\�Y���rY�&i\�@�����&\�\n|*|H�8bw}�ї�W�)Q\�Rn0���g\�\�r:��\�R�\�Ͼ׉\�T�W�1r\���^t\�U\�]�\r䯨PW���\n4\�����H\�~:3�#y;U�^\�x%N�\�u\�$X�]M	�&��:Uu\��5�iQ�Fddm��\��2\�ꓱ\���\�K�\0\��\�uD�x�{?h���OVE祭X�\'\�sc����c	�s��^��\��\�{�\�/�St�\�Qw\�k��\�]`Z�\�g��yG7;\�\�\"\��d�Ot*J�!o���\�\�\���;�G�rC쨏&0j/É�����@��̙#v/.hP\�\�xH&\�\�pO�n��\"\���\�\�\�\�\'w�\\ChO��\�(\�\�\�\�\�\�8ǜ�\�!҉5w�5w�\n��\��\0�\�?�\r�\�.8\�ڇ\�\�\��Ӑ�\�2\�\���N7~���\�\�9�ݽQ��\�\�=��-�\�+�}\�.B\�\"az��\��C\�~7F\�L��\�8�_\��\�\�Lk���0\�2�7�M\�Z驽n�\�<\�S��\�z�މ�\\d^q��uW�\�4ʮ�(���/�˯\�+´�V\�w\�\�Z���\�r�\�J�H\�WQ\"*\�\�I|ʚt��N����`�\�\��\�r$^Hؾ�lǔ);\�~��E�\�>\�>\�\�_=\� �\�\�U)VL\�r�:���N`��\�I�n�\�i\�L�0�\�mG�H8���\�g- KhO<�\"��3�4\�:ٜHj�5��uu7\�:�5�\"mB<�\�\�%\�\�%\�\�%\�\�<��m&&\�bm&&\�b<==Bm&&\�bX3 ��ǐj\�,��\�\�i\��\�7xc\����;\�]-\�r�\�Ql�K�Q\�%�m9��ӱ(Sh�gf,�\�hٔ0xG=9v�x\"W\�\'C��ѯ��[��=UԤZ��DU���\�OL\�(�\��ɨG/\��s��v�N���e]\�|]����ڇ��.�\�O�24o&\�]��\�>)\�֣�]\�P��]J�\�#�B�+\�\�Ne�Wr\�\�\�~�߽�W�:/wc\��\�\�\�\�G0\�>\�;\�C�\�\�{/\�\�^�\�\rީ*�{��\�x�;�◍�o}3/�n�`��\�PL\�w���!2\�p�\�}Q�.�\�\�a\�\� J��\�1\��\�2��D�\0\�~N�ξ�6�.�\�\�Kd\�<S:\"�?�]}���&˨xVuO��ֺ\�_\�f\�bJP\�$�㯴o�i\nm\�Ob\�.�\�I:�12\�m�Sh��\���)O���?�H�\�	N\�\�gxL�\�7}�4C4qB�(\�\'T�\�\�k�xn\�R\��4\�w�n\�Em�pТ�����zE	�\�##�\�Mc\��D̩Q222�\�1ϛ\�\�z�~*]\�ˡm޻�n\�{�u\�v��]N�Rc)\�\�YB��e\�i�C��t�^\�?n-\�\��\0�\�J��\�z*y}t�L9��ѵ)V^6@��{\�_xSx+\�\�J��!p�\0\�\�b\rnfLx�ނ��x\�d�Q.]q\�Q\�âq�>�.�\�6��f\�bm&&\����D��ć��D��\���;�v�tH\����<���0)P{\�FE�A\�\nTt\�<@\���\��<6\rChO\�C\�ҡډ=\n��w�\�^j�\�\�\�W����KB�CK\�\�V���F�)�K�\��\��u\�\���\�\�\�\�e�\�p9�V�5\�O{*�i2�;�|\�\�UPVt|\�F�\��Ҭ�#�\�\n�OHi�qRS\�YE�F�L�z\�\�\�\��jd�`A\".��φ�0�\�p\�`\�l�\�N���0C.���q!\�>\�\�ܣ�w�!�\�M\�	5�\0t!�\�C�Єڄ�HO�����D���D���~	I	Av�Ug�P���G��D �7��{F,2�:;�\�>�<�\�W�.{��\�P�\�=q�C�i� ��\�1p\�r\�R��|\����\']\�E�ei^+�\�\�~)\�O�%J��H���&y\�E&Dӛ\�\�p\�c�;\�\�\�W#\�\�\�GB�\'I+\�\��IZ\�y���GD�\Z��)Q3##&��޺�k�\��7q�m�w8�\�\r\�x\��Lȳ�x��\�F,ҩ@�\�a�Ë\"\r�L�9�w\�>���CBn�K�e\�,\�D��B\�\�\�%\�\�%\�\�!�K��K\rJ0\�%\�\�%\�\�%\�\�\�bl�����������������	u�\�����B.���o]S\� ���(�p\�\�0I4�M��bC�)��\0(��-:2`o\�\n�/.8\�A�����p:\�\�\�n\�+��U֕z���CP��)�(��,�~��?ʥH\�\�\n\�\�T\�UQ���YJ��\�\�ѡD\�:2�&�1\�\��\0\���ɯ\�|<\\��\���\'��Zr�y<\�j}�]\Z �ѵ<��ۗM�\�\�1�8M�	W`��0�ȴ�\�$�@�݂�c�@�}�B\�c\�q|\�m&1���	A��i?�]}\��\�%\�\�&\�bm&&\�b�h��B�\0�?A��C֔�\0\�3\r߱�ɂ���\�E�4N\�\�R�ѳD\�;��&\�\�p}�����E�\�UԽ�Պoe\�\�\�,��Er�W[\\�\0sܷ+��YX��\�M:o��u�g\�\�4\��\���\�O�kh\�uk$��MXFsЯ�D�\�߿����:_�w\��6�\�ߧ̚և�u	��\�\����|3��AOw\�����5\�	��Ԧݷu\�	��Oe\�M�\�Kj<�p`˳(��7PkHbX�\�<��\�m ���`�\�1��\�M�\�\�ffo�3\�z�X!>��m�6K�xY�\�\��\�\�\�<*]xK\�\�\�\�<`9f\�f`�\�$��)\�zd���0)O\�X[���w�\�U\�׌&w�Oe}�\�)^.�\0\��\0!\�V\�(���/�}j��|��h�\�ר��B\��m[�r�\n�\Z\�+\\H\�V\��}3kM��I��[Ve����\�\�[\\���^�\�|އ\��TW�h\�2*4JB\"\"abEEಸ\\�~û���x\�Eǂg}\�w�p�];�}�ֲx�0\�o�\�g\�2\�;7]\�|\�0��\�	Tp�ڥ\�.P׆\�d�_j\�,�\�\�c\�\Z҄\����\�01\����B1\��z�BUSE�xFf\�67?h\�.\��:;\�\�\�\�d�\�&\�E&MbM���G���	�\r\��v\�\�E\�&�\�s�͡K	qi<2N�\��l\�\�CxU�\�#�\�hgC�/t��\��\�!g\�,�v�By$nYg\ns�\0�`\��N\�E�)+>\�)\�\��e\��\�\��v1�o.�͆`��*�.��ic�~?���y��^K�N��\�n�V�\�^���̪�\'\�U\'*T��EJ��)\��ޛ��E\'�b�N\�*��5%�R֚:*+hѥJ��\�>��\Z-6oN\�zp�\�8\�\�/v\��\�\"�.�r߫�B�>\�u��\�2#\�Ĥ�\�\�sa	���U�\�b��C�\�wމI#W�\\�B�\�Jn\��\��\0m!\�Ma\�m�\��\�{>�R��\�m\�@��J�\��\�n\�Ş�]�Vkv%�Q\�\�\�	���Re{�>\�ޙŝ{�\�2M�r\�8pS�\�	R�?�w�&��\�jK\�+pOP�J��tP��d��\�q�\"\�\��`������.z��؆\� Q�����h\�a�3xQ\Z�f��\�mxT�x���\r�\�*5*�2a\�\�\r<6&\�?�<�v\��zp\�\�i\�W�e[.(��y��$߭��8z�K�d\�� lH͇HL~\�-���;�C\�\�^\�!Ju\�E\�{`TI\��9�u�6�}�N�\�\�w}\��*�\�m�\n߫��ah^����ۈ�}#Xv��ʽĖ��\�\�\�\�\�[��\�\�Tw\�\�t#��N��\�\�\�J\�+�\�\"�M\�t)!QN��J�a��|_Z�e]\Z\�j�*������Q:���_\�i\�S2<���]\�\�P\�q\�{\��sӡKΣN着��\�S*G/�S[G�)N�yV�|�/��\'�)0}\�(R�\0��E�\\�J�+�4L�.�aK\�\�N�\�-�Q\�)�\�\�8S\Z\��ޯW�f��P�L\�\Z�˃D=;�翞�L��\�Y�h�$K��\�n��\�{\�~	o�ޮ\�-=\�P\�Jj\�mȖ�7^(\�g{\�\�\�?�\�EE\���\��w�\�����\�\�\�S\'��s�\�\�8��;R�/�s߬;m.÷\"��1z\�i2��lgHמM�B0�1�oU0n)�geǋ�\Z�\nR�\�xa3�\0�1R����\�c\���lH�ڏ\�3�x�JY8�|ᶅJ�s-]ºT\'\�U\�\�UI\�-	\�=\�p\��\�\�~{*x�(w\��Dޤ��aK�گ�7SŹE�{��)I\�5��\�z�W\�A�ǜ*��\�{\�\���\0�\�{aߴ��?l�)ٽ�4�\�r�{ĿXM��\�\�7W4S?r��\���wo\�ٳ�Os\�[\�F�\�ҫ#�*\�tH̊Hé�\�EP\�s8ݨ\\\�rZV�\�\�v%�D�j���:D�*\�Q��/�^*�WYY}ygs�O\Z\�e�U��\�;��#����R&\�\n^*WjM��3�ϾF����\��yW��zB��y\�\�m����)x^����w/\�N\�M�\0M�\�\�v\�e�\��� \�z���\�G*\�e<���,�u&J�$V\�3ϨT�\r�oz\�	�.���Il\�\\Q�<Ez�VO�����>׆~��JkU���w\��w��9Gɼ�4b\�\�)\r��ah�#цa`<Y�F3�h��\�`\�LR\�p�	�V�\"\�\�=�jʋ\\�\�\�w�ax4R\�̧RO�\�u��7\�\�zq�<��>\�u&W\Z\�\\\��U���}�8VF�l\�*�}J�����,\�\�ԑ�\\Q\�\�\Z�w�T�\�Q�]\�8\�&Qw��^D���=\�����ε)6�ˬ/Ǧ҄����\�\�lK��PM\�hN\�/P%��1np�w\�O(q���Z�T�Yu\�2ܷm⒭z�\�u:�2D�+k[B���U򠰍�\�@\�(\�_�G�ȒЪF���\�\�g��umRE�Z��\�dJ+�\�13��w��RgJ\�\�R��;]\�u5�nZ�\�H�i\�?�\�VǣXS\�\�	Z�~�}6�\�ޤ����8,Ӷ\�\���}xG�`�+�d�����\\эݘlL�X�\"(\�\�2\'c1\r��ǆ\r\���-��`>�\��\�P\�\�Q\�@8\�e\�\��!\�oK��\�I��&��\�a>�)X<.VZ�|�\�>M\��&\�>�D\�Xܑ���Nݪ@�E�-��\�t���\���J\��j$$�u\�.@\�Ogu��+\��\�q��<�\�=�R�\�\�Zh)r�!\�d�\�\"�R��pܧ\�s=�\�R\�Oz/\Z�ɩ\�zz\�.\"��\n�\�W\�}ܠ�X�\�\�\�%��s����\��q\"N�\�x�\'*S\�u/�\\l�ͪ0���h\�(��Bxx�\�\�bɘ;,�q\�\�{\��w�\�o^�o\��(�\\��n�\�j\r,m�)�6a�)S�$2a\�\�8�a=\Z�\��T��\�P���/�T\���\�\�\�K�\�\n=X��F�˒>\�@�H�P`\�d����B-X\�Ce�f,Hy:$i	!�ahd b\��x%T�K)�\�Z]���\�1�m�(\�.��1hqG^j�\��í^2(٢f��w\��dj�\�\�\��\����\�n�-K6\�(�n�w�UdBf\�M\�\nS�\� S\�\�\���:�ⷫ�U��ȹ\�o1�;���\n�m\�w�v�)];�\�\"�\�\�\�}ҧ_N�\�N�Q\"e:�\�*\�S��]T�\"�5\�4���]M:�ڣ\�YB��q~���\n4W�����\�\�\'��#&\"�>ʒ6�\\\�R\�\Z�6\�\�(\�\Z�4C\�\� �\��QeM�\�\�<�\�7K뵾�x\�\�g\n8�\�\�C\�3߸�b\�8�\�w*�\�Kw��\�\��@�*���t \�W~\�^/�G�\�0]�\�\�xF�ߦn\�w�Uy\�\�~\�NU\�P\�\�{\�\�\��\�\�\�ޜ5_�}G���!\�.��Rbo�9�1N�g\�\n(N%T\�#{H�Ia0<ݣVc���\�8����JG�4)w��?e\�F��گg\�\��\\{��z&I�^���qLF\�\�w��#���_�~�w}��\�˿�\�\�Ư��o�D\�\�\�\�}\�\�t\�qyƢ�[�\�LC\�.����\�)�P\�Q?���0\�E\��vlY#<�A�˘^K���{8\�}�6\� �w�>�\\�w\�\�&Zryʶ��g0�Ӛ\�V\�\�o�s\�\�\'�]�u�\��GB��L\�]��\�N�\�t\���\�:j\�)y���\'rgZ\Z��\0*��h�\��JfDYN\"\nTiѬ}\�TЮWJ�EergMMaЮRt|\�32�\�kL�1�(���\��\'@�곯��\�y�Fl�|ʚ\'�M3\���M*e+����u�_\r33nS��)�I\�\�4�ݐ���&(ˬ��d��Z+�$�\�x��W�}�J���2\"�QJ>y�\�z^�l~9�`}\���n�\r\�t�B\�#�_���9���\n���ګ�̷\Z/��7�\�㻗�8���\n��ڳB0�\�\�\�\']\�r*\�\�.��\�\�Ê\�ht���\��\0`ގۑu~\�pW/z=^8o\��_�4p��|?҅���W�-q�Q4�h\\3�\�-��\�8�\�{!\�Ζ\r\�(N\�O\��\�4d�����\��\�zD\�\�.1\ZxN?н\�xqE.�Ɓ�b�E�_@\����*�R}��)\�Ȋ!\��s\��T�%n7��;	r\�$\�����\�\�\��OikG�\�o��]�ǜ�N\��\�\�q�?e~θhG�\��I�ؾ��(���\�\�`\'T�r+�\�z�f\���\��\�e{oȐ�#0L�\"\�\���&\�\�\�y˫\0�\'��y\�w�w\���\\�8L.W0oEU]]\�廞��\��W)�@\�p?]Z\�n�o\��ښ�G\�+\���J�Q��o��-!X\�\�j\�k?\�\ZK�.e:�Wy	�gEm\�e7}I�3��4��\�KIIUV\'P�{\�B2\"e/K]T��\�3<LP,w\�s�\n��mQTVzg[Ҫ��Ӭ@��):�ҡH��4�\�\�\�9\n���B�M\�o���hV�\�UѢQQ��\"���D��*4(fA\��W$�˜��\�\�h��IT\�\�o�xb\rn\���p�U\�4P\�(\��RT�G���ř޽R\\z\�X6�jC�~\�z���\�5|[`\\�\�\���z�\�\�t����5\�;\�i�\�㏠\�u\�=\�uҪS���X����\�t���9~�{�\�\�\�R�Bl\�e\�(,�\��\��P�<�\��^Ұ\�3�\��Z�<o\n\�s�j\�\��|4��x��I\Z�\�nǈ��	\���\�<v\�X?;\�\�p\�Oh\�f\�E�\�(\��e��M��=\��+߯:\�z�Y+�>%Uk߭�c�<~\�]�Z�?1�tyL)x\\����҈�\�.�L�\��S��\�u3)\�l$	�ςh��%��\�\�)d�\�)i.�t�\�t�߰Wi�\�\�ޝ\��J\�-\�TK�[�\�z�d\�ʝ4\�7��+Y�E�WwתObxqTL\�G�\�R��\0��H⌎0\�\�\��\�@�I�\�%�SW��Y!�[TXk(lA\��c���?h�;��\Z�\�A(Q�<�\�,.�\�9\�Z�%�\�N�4�\�h\�\�\r\�.�0�(-��>\�\'��#L2\�\�Qdc;�	�	 `�\�r\�x\�l\�r\�\�(�^���#r�\��4\�e\�!\�+LC\n9c\na\�&\�bm&!��6&�CDg\�+�.��L�\�u\��y.�\�\rN\�J�V6\r�ܗL\"�17 j�s1\�\��,3�4Z���~����&�\\��\0�mA��\�?-��0Z,\�R\�\�\'\�tQ\�_\n-V\�l�ZYL;M7�����d�QQKΡF\�\�%3a�\�PWס�&�\rrjE�\�ڊG%\Z\�<�N���\���{_�\0�<x�\�d\��\�8s�=�L�\�>\�v\���\�0���3��\"��\�L�,�\��\\�L\�\Z&�a,\�\Z \�\�4�H<�r����n\�a\�0dQc�\\�0YK��q\�\�7�<\�33ɠM�I\�<��\�}&\� \�Y�i��\�\�\�J:g�$\�\�u\�02B���\�+M��\��\�\�\nx��<P\��00\�R�\�+p\�إ\�a\��\�K�\\?\�z]�\��x}��\�����de���/�#��)\�;>���JJ\�VV\�Z\�\�R��Av�e!m�sa0\�~ۃ�\�{�\��!\Z\�a�1�F\r�K�\�\'�;CY�\�7xtDCw��S`�b�!\�\"�.h�z|��!\���q\'��?$�\��۞A>��\�Ťl\�M�1�j�$:D\�Q�O6��LK��Hz�x����\rܥgV�F6�\rM\�{�OX�5�\�}�kC\�37y�C,�g\Z ܠ�ϧG6#	\�\'�3.Yr\�\ri�մ�\�w�a������z��i�!,\"l\���\�{\�#�L\�SҺ��\��\�\"YL\���i��\�N�G��R\�Q*F\�\�y# \�\�丐a9�d?�i m\�!\�q�iC0�Wx�V�J?\�	����,\�b�\�\�Z\��Hq�3�$\�\���C�F8a\�\�Q�qӜ0\�9��?�7}p�G���3\�\��#�\�|=\�\��K4��is7��ZN!�\'�Y�;[\��\�R\��ޝD��uD̜��S�\�\�<\�\�j�z\n\�\��w;\�Dڤ�*k��/���T\�R2i1�:4�Tj$OR�5Me\n�\�\�\�\�\�\�\�/\�Ы�DY>.~]uԼ\�\�\�b���][D���֑R���F�\r�A]Me2�tW\�ib(�\�\�\�\��\�	��\�?8M�\�\�O��O�8�A	5w�M�\���h��h� �\�\�Ϡ\�XK���6�\�.\��Fr\�/�L2\�\�՚L\�4\�2L!ل\'1!\�>\�\�\�{f\"K\�\�̋6&�DԶ�AI\�J{;XE\�0�j�̭q.<��&Nq�L8S�1\�|VSப�S��\�/8��iխxV\�&�\":��S@\�\"ek#�\�\��\0�J�/\�2>��RJb{�EEEE[ҝ$K(4������\�&Q��p\�\�1�\�3�G��<�\��\r}�\�\�.�B,=bmBEIT�f�\�R\�g.����\�.�\�0\�\�c1�\0j\�\���1t���\Zcwُ)d��\�V��Ӎ�Cgϧ\�<\��\��IJ\�Nq�,�\�f.�J:OHώ\\֤\�3$͇`f��Ĺc\�<�Ref���3�q�l\�sp�9VT��R�\�H�H�Ķ�\�:(�R9	Ԟ��HFT�0����IR�p>T�+�GR�\�\��̿\'ӧ\"#9\�k��.g�st�j��1v\�\�>M\�\�:���\�0��\"��m&!�#Af\��L`�P�P�xn\�\�ۛ^��jLq�ĝ��bX631�0ͤ?(��A2w�Ԛe���S	D�q\�\��\�.��\�l�8�b\�0-��l\�,�\��C�n�P��A\����3r6��2��FN�d\�k\�h;\�\�gJ�\"*4ZqFf�y�$N7C�К�\�J�܊�%8��eU��L����\�\�z���\\\�\�<=	�\0\�U\�\� \�A��\�u��n\�D\�Gw��\�V0��K\�8j��?Wâ�\n\�\�\�AQl�?HS�\����>6\�(L�e+,\"\�7~�\�M]�Ɩ٧\�\�$\�]���&)�|�\�e�,\�\�\�\nT\'���oCb�$��i�DW�����l<����\�\�C\��\\��A�葤\"\�Մ)P�j۳\�5\n*0�-B\�\�\�V��\�r\�\���L\�S\�ڻ;��KJ�ξ��a1�\�\n\�\�\�J�B��Ī(R��B�\'W[@�\0\�P�b�]z�P�.\�\�\�\�I]A�F�*��5\�\�\�3*U5��)s�R����[4��`1��~\�]�$j\��\�]\�qc�@8a\�\�\Z��4�C\�z�	^R��|Cm�\�1\�x����K�r\r\�F�r\��FI!(���Sh�a�\��\�-\�b\� ��{Hc�M$3	5w�5w�\�fq	�\�}c7Q\�\�_b\�\nO\\�\��\'}�\�aۙ�X��Rh�\\\�}�e%W���Â�2&�ʦ�7�ɧD�y\�W�&��\r�\�+�}��Ѧ��\�\�zP#�2�=*\�5m\"2i�T�J�[��/k�F\�wDZ�\�cϠf>�&%�\�KIv	KIv�8>\�]\Z��.|c��`l���Y��N޳>�^S\�\�W/��\�\r\�x�\�u��\�\���&���:\�;�rD�y\�`�p=�;t��E\�,\�\�-.{�~8\�\�I%ֻx�٤XGQ��\��\�ӎ\"	�g�W�u{�\�P�-=���\0LM%k�\�1g��m\�\�!6��$�f�\�h1&���\ZC��g.��(\�oXMhOj۵7}\�-��\'q\�A\�A}*�\���˝.�I�̪X��-:u���eB���*T�*4H\�]��穫�w]\�B7mM\n�>m\nu�5Dj\�y��ū)VWS3�\�\�38\�\�%I\�Q*F��w�%3(\�+��MQB��Ϊ��g	\�x\�N+A��\�s\���I��I��M�\�p�M�\�p92L�d\�\�\�X�;\�Fa�|�\�^Lf\�^Yx\'�<��m\��zX4\�\�T\�y7\�_eq�P��6�>0?\�\�]}C��׽NB߬E\�)��^{-l\�c�X\�\n\�de�\�dA2~!\�+nŧ+E�ܝU�\\ڙ�5�\�\r3��O����Ě�Ě�ƈ�D�4#�i�6	�p\�<\�X��\�\�A3���.0��V=��a��P��׵\�\�g�E#�(�\n\�v:k�\��M�T�~TVңFz\'���|d�L�%b\�55O\n�u4��j���5�T\��UP�\�j��	�\'#��dm���3�@�A	5w�5w�5w�5w�h\�!5\�\\\�FD\ZQ��\'6/�K07; �\�\�\��(�\�\�-S6�a�<np!$XqŠI	�\"waA�5\�J���⋡��\��Ti��}���\"\��w�z>�uk2�\�\�91u	O�<��\�0>Ѽa\�#\�QE\�(�X�D�!�\�z>�\Z��JL�\�+W;��Ot.\�Ծ/mA��?*U�:(n\�8���[@ΰ\��ȣ6�\Z4h\�*4(P/6�\n4H��\ZJ*4H�O�\�W\�R�i\�6��\� ���IF�RC�{ދ���\Z���\�h��\�Wn��P�xP�DΝ\�cJ6�H\�\�x�K\��%�\�a��X~h��%�\�KIv|1\�$�!.��O\�6iغr�-Jp\��yg��iɀ�p�Q�\�\�BŤH�I�H\�\�+�,\Z1�\�6B&k��N�\�!>�̰>�-fj\�\�%-%\�:�ɢ-��~�AB\�Lj\��\Z%D�\�Γ�����\"�5uw��Zo�\�uqѩP����#3:U.tEF��#�T�0��U}E3��B�fcI�)\��\�P��5O\����V�GR��EQ�&b�bm$\�\�$\�\�$\�\�%�\��h���\�\�h\�@Y�\�#��鉳�Ѫрf\�&\�,c^)d�#8~h�\�\�`\�G��\�\��,\�iz:�u&\�����呂&�8�\r3���iC0�c�P�$�@�g\�(�]�\�S\�m\"w;\�}d�6�ƙ�]\�\�\�^gQ#[VUE\�8��z��%YR\�8�Oz)\Z\�ե\�L��\�f\�\�U�*�\�Ѥ��nյՆT�\�\���\�)\ZG�u�UM\"�\�&\�3H�\"\�!>�\�!)i.��vG�b�H6r׆!�G,x���a|�R`�Di\'\���\�,�΢�i\ZR�(i/K\�D�K\�>6�;:�Q\�z&Pv��\�q\�X\�\�1�h\�- ��G\�@�I��6�D5�|Y��&\���5t$\�\��I��JZK�K\�\��F�r\�*Ө\'m⨽kI�Mw]��w�4�ʚ\�uTXM�\0i����q�\��r�Y\�R�\�\�U�|\�D\���2Z\�Ti2�3�zԧ�ED\��fFQ�r��&!>�)\�>�	��M��z���\�l�+&\�z�IY\��(��q�,\��/	L\�1t��\�\�B\�\��M8\�\�3)wH����H�\�6��;ŭ�٤D��tM�!�C���\�0�\'x*(��H$\�yz� �\���Fb�cl��w�p_\�a��\�h?���\������w����\"�j~\�q7���J�U!�\�ȩc�\��]��u��NEd\�*\�u�uD�KD��\�\�S�m2�A\���̈́m\"a��F���R�J�#�J�*&T�\�#6ѤF\�*D\�0\�	\�I��I��I��f>�_\�\�\�V��5S\�\�6��T�s%/,\�Ђ�%T��۠�\�\�1�(a`��0㛤\��X\"�A�\�9󴥌r}�\�ӇWpoK�\� \�<��hxFR\"�F�=&?@�\�\�����{\�g/y;\���T�rDp��2�z�����5\� V~�\n?\��>MӃX\�.x��e�D! \�}#,z\�\�E\Z5Į�\0\���\�~1!CO��hѢ\�2�uh\�\�#��{dg\�7\�ƥ\r\n�\�\�7�\�\�YTT�7��Eޣ@\�Q�ө��J��\ZTk*\�Qi�C�V�$\�!&��.�)\�>��\�P �Q��$8\�f�g*�[�l\�I�\�e�U�&�IY LV�Q�[t\�&P��eŔ&e\�zK.0���\�\�-�6\�*U3WI�$\�ڢ<>P�ޡ̩/�\�:u�ֲ\�V��p���T�M�ngQ)\�7�\�?�!�އ�@��\�Ь�!\��\��&\�\�<�\�`T��]�FeBP\�UfI�-��>3	�l���\�`]�\'\���K\�+�xd��!p8\�Z\���\�F\�8Q�TI\�mm*F\����Q\�9��\�߻��5.\�\�u�UP\"*4:\�T\"�\"\"\"\"m\n�?�n��N�E:nׅ;��x\'��[A+�\�^�\�X��\�)U\�=|\�1�\�\'[Ka\��g��BAD3@��\����JlC`C1���\�\�l7}�� �1�O@��\�a7\��\�\�6,�\�\�,\�6\�P�I@\�cc�(\�%4�˱�Jw}\�J�\�Ƭ]�\\\0ۻ[�Ѭm��ᦟN^��m�ʧ\�~�\�t�s_�٤\�:$ia!6�\�\�\�\'\�A]�YB�\'\'-t^��\�b\�\��3H\�R\�aR$n�U�劙P��:\�\��rT\�\�.��s�\�\'WVuT�P��4\�y\�#\�/Ӽ4(\�y8\�\�t<\�\�h(K]D���e-\n\�EH�����\�\�q	�(f\��!���sN\�%���D$i\�\�1�-Z��vH\��\nhٖ>�8��\�/�=\�x\�;\nX��Y\�	5�)�\�\�L�K\�Z\�vX�тQ��1\�+LB`}�m&\�`\�\�1�ig����#\�5���*Q{�\r\Z�⫤�UAȄ̩R/9\�w�\�Rd^��|v��7~�Z���\�7%�t&�\�oQ\�7C殉6�\�:\�\Zxj\���G��\�Җ \�G��K����Y�4\�;3J!	C?\�\rS�L2G\�(\�\�\�F\Zx\�(�zD�\�u.�m)�H0cdmo��\"\�L\�\�&v�\�\�;4�8H\�Ǯq-f\�!�.�#0\�|�ѢQry{B�\�uU�\n�Ӿy�.���R�5!�\�)���ڦNA�\�?�\�\�*��R�eMbU�k\�eB�\��N������\0�]:�221^穨��\�޵ow��x��7\ni)��葝\"+�\�*�UN�\�`��Qh\��D�g�Pޮ�	�Χ�>!�XBhniD&�\��*�>\\b4\�9�<cv�\�$�k�Bp{6���)�Ct\�1.Q�N�\�&4˞ \��\�!6�)\�>�Q�B0\�q�*T�}<�y͔^�\�d^u#6Q)\�B\"���Ӫz\�:o[\��OTU_h/*\�f�\�N�\n�\�/0�\��\�U\�/�^��y\�+�+(<\�\�\�a����-\nt]\�&qeU*gF�E\�P3#\�}\�\�%�N�������X�ZUtkS�����5�5\�T��)K\�]#DY��ˀB\rf�α	�v�Av��Mo@�\�1}Cv�\�e��\��V�\�<��/^,�\�\�f�|鑄4˞2�\��P�#j\��B,\�\�E\�\�:\�.�\�P�N�\n5$i\�=\��#\"�z*�u\r�th\�\��|t\�MEEE*�7\n�\�\�\�/=ub\�\�\�U��*�uq�0\�,F7X�\��D:$i��ItJ\����	u�B1!h.\��Cx�\0c&�!i1.�\�6��!7`8i`���vO�I\r!�i\�\���A\�P!\�WqR�˦�SY\�\��P�\�dƟ\�ژ\�ٛ\��_\����\�ɁUޥ�\0�6x����\0L\�30�L�1�Wf�H!7`�ph\�\�CL]��P`�\"\�7�0\�%-%=\'\�3H\�o�٤Ǝ��f�\�\�\rlP�-9�ѯ�r��U?IWG�W<�\��p$1\���\0�\�I�^toIՖ\Z>�\�Xq1�Hf�g\�3H�݂4\�n��~�ۤ�:%aO�I��vi1-(f�\0b$\�\�%�\�_\�D�؈M\�\ZX }\�jq��ht�Ϗ<�$\�\�\"\�}�\'P\�\�\�t�Y����]E#�\�\�:\�-a�\�~=�F\�?\��h(�\�\�(Q#3�H�\�Fg�5��^\'5\�|T�\\��Y_\�\�uAѤ�\�#���u嫭�EbK\�ui\�� \�\�\� (~Q�\�B\� ص\�\n\Z�3$�vf�Ba	\�k&��\����K��K��K��K��g\�!	��s�2灆��\�6�.ѼR�qD�C\0<�\�A7\�s�bH�^��c��B��=��4|�b\��T}\���WF�E2*�eiy���\�3#c##i����d�\�\�=)�\�G5\�=n\�.i��k]\��S\�\'��Vdl�\�I^Tjd?OYF�4��z\�&��\�\�6��\��f�$4uN1\�);3\�\�\"�CV1�ՌA��=��O��ukc:�Z�\�\�\�\�%\�\�wE�D]\�l�!aDRbF\�\�$�	��\�ft\�:d�\�0Iלr/�.���8�z帏�:�\�\�)�y\�ptn�䲦��i\�duFUh\�#�h��%5QT,�/íNT)�Ь�l2a\�?�\�?0\�֡\�snk�S��>�B\'r:�����\�3�gF���f/�0\�\n\�T�ּ��7!\�\�ѣJ\�\\���\�r\���RR���*\�\�_�[YJ�㒩��\�&�wz\�ѽ\�&\"3�L�L$z���\�A��DRO�`\�\�]$e��8ig�Bp\�D#6�\�\�\�?\'Gx��\�[\�?+Gx�|���.�.���äh3�-b\"َ9{�F��l�s\�8\�F�A�hq\����x\�ǈ��ý=�M\�]oà]�\�wK.�\�k輜/\�\Z�t�ݏ�&GF�\ZD~u\ZTL�FQ��q~�/�U\�\�\�Ed7\�U*�?��N��\Z\�\��\�	n�\��ҥ�:�͵t���Xa�\�Ȍ�Q6ѤFM#�H�22�\�\�}/\��\�v.��5bǛ\�袭2z���>w�@\��-m9(Ѣ\�Ff�\\��y]L���_WP��\�z�\�\�\�<\�N�1�\�H̊Si\�rn�{W��á��x�/�r�NVb\�á\�h�\'K�^7��5�� 2a��\"d\�a�!\�#�2�����\�\�M\�!`��\��G\�\�\�\�?Wx�|�]}\���\�ƍ\�T��&����_��\�4�\�Q\�ٞ3��7��\�\�ő�\�\�\�\�P�{��s̈́(w�t\\�A\�	?beX�Kˎy�s�4\�ʃ�}b�/k\�\�#��D�%u�\���\�J���iR*ʂe*�tYJ�739U{ܷ\�\�^D\�T��\�5TT���4N�\"��*\n]\�$�H�\�&QB����\�ӠG�ߙ|Ҽ	n�\�tP2�\�iѷ>^�R��\�\�KJ�\ZkދN��]]\�3a�*|=\�Ժ�C�;�qѯ�J\�9\�\�L�\\���\�57λ�0��h�0<�Z$�\�\�\�$�<\�k\�3�fFEs���n�`����\n��Z\�EH\�\�g(�̔\�e0x�/�RW�E\�ș���B�A�� ׌Ol�\0t$=\�<�\�1G+1f�j�Fd�z�,��&\�\�\�@�YvN$\�}�C\�K�B�P��O\�\�8�.�	�B���\�\'�&��=�ȓ\�NY�?��\�n\�\�/ju�\�W�\'��\0Χ��&��\�\'N�A�f6��x�Em}\�O\�\�O��\\���z�\�F�\Z�\�\�\'WYM�L\�\�\�P#2�ZeN�ҡI74�-yj\�.��h/�g�I{nC�ꊚ��{܅YY^\�z�36��*�\�?�B�*&ߍD��\�\"3=)�����SxVTV���N�\�\noE\�]F�ҨNIha:�\�\�aRT�\�\�Q)<\�L�k/E�}Ӧ\�L��\�\\�]\Z?e�k��P*\�[��\�*ů\'@�WW\�6���Fl\"\"S\�DȘ|�\"�a\�;�� �E��\�}�AΙ�8C˙�LD��z�E#\�\�k$0�\��@�\��I\�b#��F \��7,�K��y0\�v���0K��\�v)����a1�30D$\�-b�f\� Ȣ\�\ZF���Q>>�M	���\�\�\\�Yh\�\�i��\��}��\�7�\�fy\�\�ߏv@\�1|\�cɔz\�l�Y�:��\�;\�X\�4jΪ�]���s\�ӌ̏\��\�\�)Q��tL�F�\nTk*\�R�J�\"#\"Ku+�n6]\�((�|���������y\�\�.�ڍ\Z��\�\�R\��\�Q�[VD\�ʪYH\�dde)FY�1]}9�{��.\�;�%\'ª�\�[I��P�5#�/SNj��4\�\0���wgA\�{�H�\"�\�w\��p�E[GͮUv��4\�v�\�eF���k\n�e\�ґ[\��y��\�k�\��x\���2\"��*Ft�	��F)f\�\r����\"�xn�Nc::�\�\�	\�\�\"\�z�f\�\�\���#,yZ�K�3��y�%�(���\r��D\�e.��\�އz��E�\�\�2\r��B@}�m&%�\�a��\�\�\�\�;s\� آ\� �\�\�\�o@\�\�7xt\�bJZGx�%nA�>�\�ܣO\\\�\r3	��9%v\�����\�\Z\"\�yNo��m7{�i���E)�\�&1�\�a\��r>�·��<]\�\�\Z�t�ݔ�\�F�\ZER#&��\')>���\�	i\�t]�|W;\�jo�\�SQGͣK�	Sy\�o\�5iQ*$𨪵\�?§\�Ix\�M\�q_����B��d/\�B\�\ra\�L�vשK\\Dd\��i�a�FFR���|V\�$fx�\�A{�3�7+����J�\�}/3�\�%�F�\�]k\�bB�2�E�#��/�:\�\�̥F\�9i8n�����\�����-*���EX\\˵\�w*\�EЮ�\Z�\�z\�Ht\�\�y\�j�\�O1%#�U\�Nhs�\��Qy����E\�R\�/�US@�\�UQl\�H�)\�b͈|��@\�O�Z7�*\�q�oE�\r%��M\�t.(�\�\�9l���wUͤ�eK��3&A�\�P�w&\'��\Z%�1�4ې\�z�NC\�V\�\��\��I\�C�	���%\�\�%\��\�:$\�#�P�X�D\�g\�@�\Z�f�a����(\�&|?\�\�q�E�C\�	C\�)l3�DZ\�h&�36�w���`�^ֆg\�b�E<]�|=\�N��\�+�{�W��\�\�\�\�\�.U\�~\�j5�g-\n\�$§@\�!��w_<+\�\�XU�ER:��}�;(\��hV\�\�V⯧\�үE]N�d\�T\�W\�O!�aQ\�ܣV\�p�&#$7樎\�W\�\")k\�\�3��\�+�v�\�\�y���\��p�L�t�\�h)D�CY^�ME\"��\nF_ӯ�2����t\�+\�L�\�j\�Q&ҧY[I�(P�Q����< �T9\�~�P�eu�x�\Z�j\Z~khS^�:\�rJ�T�\�:)(�QD\�(�<ܻx��u\�P�h\�����\��S�\����+*\�V6ZI\�\�2�\��^7�\�{.27����\0��|\�a6�*m�q\� Kx4vd{�����I7�\rɊ1�\'\��n\�P�\�S\�hS\�	Rɑ�i	����mV�G�\��w�\r�ЁЃ\�$8�)w�{Aa6aǔ)w�]\�\Z�fQ��8�<\�-\�j�F�ཡK�\��RU)<\�v21>��\�C��\�$!���D! ��h��h��$=\����`q\�؂d�}��6�͊A\�S\�\�Zl\�fJ\�S�sO�\0\�\�B�0\�pG�p�\0\rݔFl��C�?W�ۤ���o4��K9�\�)b�\�\�>o_�_�4h�\�]\�\�A\nUTh�\�\�P���\�\�\�#3��(ý\����wg��j�e�o-\�LW\"��+J�~�+(\�9�%�\��jjҥi��*r˚��u\�3:����JP\�K�\�#?\�W����e#�^sRW��E)�\�	�d\�\ZLnO�D�\��\�!^�}�P�]��b��\�]C�\nz�UʕS�����\�V��\0�WQ����n[�][}5�1U�qթ�,�\�(�T��\\�Z�i�U\�梺�::�S�\�;�).�#\�jK P���)��諡F��Źj(\��[B��Ѵ9	�\�)\"iR��YI��)w\�7H9�}ݳ\r�\�f�\�z�{<�d��a\�\��\'O��Y�\�@�:t�� \�\�\�T6��d�\�\�`���Ե�\�\�\ny`�x7n\�uK�&9�Q\��4x{���@\�\�\n^�zW]\��\�S�YG�Y�\nȸS\�9�|�\�zHHZ��	��,\�b]}\�}%�o>Ff\�BXyz~er\Z�Y\�\�Ҧ�D�i\�M�F?VǤl�G\�;d��y`\nS�jc��=�,y�\r\�(�چ\�\�c\�	5w�s�\�ψo4tw\r�F\\Si�\�lr�z�y \�hޔ�\��#Mr9\�yu\Z�}Mȿt\�/�\�M\�T	\Z�\�B��)\�)ՙ�J]�\0�\r\�U\�׍e�K�W&�}\�T�0̩��\�J��\�2aj\�EI��E���rc�/�Nj�L�\�G\�G�uA�V �N��\r3�\ruU�F��H��_�6��\0{��\�ё\Z��\�{�r;�Hɤtռk�ԔXeĤ�\�e\�LM���T(��i�e\�_SM5\"�\0\�T֑\�\�\��w�\��֢�\�y�qc\������\�>�R����6~5Bz�\���\�;\�}*I�Uއ��\�F�IB�\�ТSDA���\�8�I$0����� �\�\�lb\�\�ڔ�\�\�;�:EJU\�\�\��F�Ç�\\3�\'\��S\�6r8\�3\�1h\�\���%\�ҳ\�䐂m�(M$�ֻ4�\�`Hz$=�\�F\�ms��B\� �w�={-hrǌ�`\�\�f\�f\�Ɔ\�\�\�Z\'\�cX9\�\n�Dʣɘ���\�ڞ�h�\��\�[��\�#>	Av�!�\�HB|2\�\�t\�\�J��k�\��T����\�w\�R�a\�ə�=�ܖv�qu�Y\�\�#��C,�B84Z2\�<\�\�\�٘9\�$%g\�\�F&nx�\�&\�\�?�0\�~��\�&���Y\�B\�1g�6ˬp�\r\�1a\�\���1c\�=h�8e�\�r\�\�鿐�<(�O\nN����J�\ZD\�Ti�\�t_\'˗�\�E5Q\�\�K\�:\�u������*T/R_6�)��+MZ�%5�\�}�B\�etʦ�aVTҹ\�+\�\�:tP_��un��J�7\�U.\�36�a;\�ر+\�ڲ��r7�K���/:�reu�\�W\�S�m*Ti�-Z�\�#�E��Z�QT�%E��\�\n)U\�U\�\�a\�R���9�z6��\�rª�\�X�S?=\'�G�\�39O\�\�2�0\\\�\�Ǻ��tQ�\�^�~ou:dq\�ՠ�V�\�T\�\��Ec0\�?9�\�\�~\�\�\�ʩ=}\�}\�xT��(ʪ���Q����5\Z4H�\0\�-0\� �\�f=���ih��\��{0u�Z-\��.��hG�1\�\��V{3A���)\�\���H\'�u6\\(�����V��2�:kZ��\�\�\�X�8�(�I\�7��q\�\�Ч\��Í��9}��\���\�EۨP�iHv\�\'�\��6\��o��*�\�Х\��N�U����7�\�\�/�\�)w\�z��c�N�\�\��a��b\���\��\�\��z���y񞀖�_\�R�Kb��Dا \�=\��\��\�޳6IH3k�P���Ѭ)\�\��V��!�ɘ�F�JYd��\�I!�J]C1�	Lz�)�\�8g\��\nk�i�\�\�A���a�I�\�1�ǈZ\'�UL,��\�-ﺎ�}7�ٚ\�\�/=\�xӬ\"�N�\�5�\naѢE\�y�tA;��|��\�3�+\�˷\�\�\��a��\�\�}\�yҮ�\�\�(�&L$�\�u\�g�8�\�s\"��\�<�k(�=	�^E�]Uu?ɢ�\�[J�\�(\�UR�[SL�\�V\�\�*ut\�\�#�YD΍\"2��b2�I�l�~n���\�\�\�\�\�P��SR�e\�AZ�q\�w$��aF_�\n*�қ�̵i�*u�Z\�\�$qzc�����ԕ\�WH\��]\�\�A\Zj�w���\�=Em:q��k�\�T��*5\�U\�~\\�X\�\�TS�UQu.�>�.��\�VU)�5�u4�3�}:\�>d�N�\0_*u\�\�T^[\��y8\��UMUU&�D:,L)Y�\�\�Ӄ�)x�\0f\�\��Ǵ<^\�H%|�\�Q	%S)gɌz�h��\�\�,Y��\�Ԃ\�\���8�~\�C�\�\�8�<.\�2\�%�{A\��(m�*_�G�|\���*8�ѕ��Ҫ�\�Yӻ��ch7{�:ST�	`c�L��O��~5q\�\�4�a	\��z�\��wƜ\�\����17�}��0<4\�Ӟ��\�Х;�[I�\�\r�M��ݾ�4h��O��\'\�!��g}\�w�0�\�}\�\�=�g�Ҫ}�\�\�X\�\�)\�8�\��O~�e���Md;�\"ˆN�yz\�\���-\�12���r�rY�G[1�xx�.Vf��\��\�h�(\�$�v�b\�\�\�!J \�1��\�0\��\�d\�g\�\�\��&�\�Ϝ5FfE�Z3I\�\rڶM\'�\�5FԘ�\�\�\�ǚ��\�wi&\�\�\�uU๋���ҧSv\�e\nVz\�L�R�̬)�J\��\��\�\�\�U��ny_Ro�)��\n�\�\�,QE\�\�@��N����MVS\�>�1\�K�~j\�\�us�\��Sx�յ�o���>��R&6����̣222��#/�\n4��Dg\�M`x\�߾g:�\�\�YJ\�\�\�\���ר2#���44\�J�M�J��,!R>Kr\�\�t]�\�y�\��\0��x\�J/\�&w;iT]d\�\�kU),s�\�o\�un\�&\�v<S]�\"&3Ϻ說*����FaN�K�D�U�)h!g�*�eǦ@�hUiI൜�D&˔4;\�%����\�Fa}�\r.�h�\�j}\�2Hb�n�7O`\�\�\�A�\�S\�\�c��x*Kd\�\�h�0��xl\�0\�6xZ��c�x*JZ2�x�]:�AR�~@�B��]�^�\�ahQ��I�NS\�L��^��h��dP0�;R�R��\�\���2�F\�\�\�1v\��\�\�\��\�\�\�[B]]��\r���d\��ٚQ�.�ƞ��\��	�\�=IC�)N�w�T\�f�)x]���\�\�r(2QӖR\�%�lB\��O�n�\�m�Ǯ0�\�\�wzT��3m�\�R\� f�\�\�{\"\�6}\�\�B Ό��\�7XS4Y�4qG��a�2�`�=3u��+\�]M����)\�CX��>J\�}\"��g>�\r\�\�}lh�]c�6�� 4�\�~��g͔\�\��h81��\�\�\�=��K<�5�5�\�w��\�\�]�\r\�<��3�\��T\�T���j%\�\\9�(Dj��C�N*�WM\�\�dT/#�l*,~���\����D���&2 \�E\�\�S^�]�\�+��|^����ݚ�\"\"�����\�=�F\�:R\��*k(��H\�|�\�-ʽ\�ʫ\�V8j�4�W������+n\�\�\���W@\�\��602��x)�\��\0P�/&\�\�\��v\'����\�]�rR�_^j\�V3�4hQ(\����[\�4\�\�Z��k.�.\�\�rW\�\�+z֝s\�e�ʶ��b �\�_�)�6�\�\rFDG���d$\�\�H�*��1�����#v�\�\nx}�|=,�%��\��>X4&��*���\�\�p���xZ�\�\n^\r\�oV�e)W�.\�;ԓ�J�!\�8zw=�\�P�Yӹ�ů8/g\�\'\�	�\��L�k:{*fFɴ��E�L#	�q^6��Z(T�.n�\���T��\\z�Q�\�7�}�*QgT�\�{�Y1a\�g� \�\�z�#�\Z�\��O\�\�꜈t\�#3�\�\�)b\�L\�1!�\�X�#���h\�\�n�͏XShN\�35�\�nO\���eyZ�E\��Uޘ�0�۽\n9�\��h9=E�]\�+xe�;x}����m#1\�\�\r\�\�䭅<bХE�䭥0��w�a\�\�!\�%���:$i��R?N)B�P���)��\��Q�nc%\�aR�\�X:�i\�@{Fv��,�Đ�\�}�УVN�H=j\Z\�\�\�j\�9#\nv�\�	���du\��\���|=\�Iu١\�\'�+\�\�\�\�_�\�ϢL\�g\�\�(\�&��\�=D��N�S\�8��\�\���\�K�^��\�^��~r�-���\�Ju�\�\�VQ]ݾ\�4N���Z�5�TY�4I�\�r\'\���\��W[Ee\�\�e[�s\�\�*U�k\�擁\�SD\�J��j\�G��*�g�ýE�N�Ա;�����*%�����<4i|�qB1�O\Z6w��g޲��M9��n�ri\nvs�\�p�\�\�ۙ�C=�(;F�cgڤɜn�\�\\�\�«2N�>\�e\�\�6��\�0\�\�m*\�\�\�\�8��}\�C�oI\�0{�U�\�\\P��:��\��O^�/�\�Z�*8��\�$��9��-I��c\�/nӌ2\�jM0M��\�5\�8���h3K���\��?\\�>!\��\0��|�\�[�fD=��\0`v\��w\�o���y\�Qhcs�G�\'��\�\�i� kd\�\�a�+O�I�O\��(,\�b�yp\�&������_�\��Nv_d6������f`S\�\�\�u��\�\�\��^�\�(�x\�\�-7y\��u���\�^\�\�\��\�Qx���ױ}�\�|\�K��s&lL\�\�w\�	oK�𡷸ֹ}�\�xˠq���\�WH4\��6mp�CH7z}�L2J>vQj�(\�>��<;�\��\�\�_ev�I�DS�h\�1e!h��Ɍ\�O	░>�,�g\�!���\"\� �u�\�[<p�X��\0��\�-	��\�\�td�D!\�>L�ip�a�\�!	0\�>N��$�\�na��\�\�>MӃX���\\�G\�-\�PJ-x�(N�4PU\�\�j_��������\�^\�\�֫����+h7ͭ��FB�\�>b\�s{ҭ�:\�;�\�+\�E%\n\�k*h�$\�>�VS�Dθ\�)e(\�`y=���-�^��Cv�\"!h�^\\xoׇI�\�2\�?��Y[8\�7�\'Q��\�f���)�@�\�7�\�\0�vN�յ��o\n�\�&F�l��\���\n=S^�hޭ��s\�Ӷ\�\�8{�߽\�\�<QZ\�,\�*ɏT�hLj�y4�w�ñƞԔ��Z6�G�eh��͆6��\�P\�\�х>\�\�U\�S�\�\�\�J��o\�\�\r\�vWZi%�m�?�|�O�i\�8��s�b\\\�_b\�\�(M\��Q��;m\r����\�v0�\�R�O	���\�\�)��}>*,�Nm^\�t��?J�^�0ds#�\�J���~1\ZC$�E�\�oD��\�\�\�\�\�Ѵ���\��\�W~1t~\��\��I^\�\�\�\�m��ngN�ҙ^⹅.L�h\�\�٤\�\�>R��AS�F�c1�GpSq|)\�\�\���̮�=\�F\�1�,\�\�I�x2Q�]YX>v\�C(e�\��&�\��>m#hQ�w\�4\�`\�!�.!&\�\'v��F\�K�|5�B�`h�(kvhD;0��\��LB�\�\�<ٌ3\�\�y\�$\�7�C�F��\�H-�&�D\�f\r�C��\�6���8�3h!���70\�ôo:5! �4�ּv�����1�C\\\�ϘϳG/X��l\�\�,���\�iI���9\�a\�\�Y�\��\�ŝ�s4K\0�\�үƋN��/��ڙDrg�M�1h\��J�\�C�\��^�N�hP\�\�x����\�iC�\�f�69\�K3A�\�Rè&|(\�Sn6ui{<\'f0�=�VǿE	GO\��\0\�1c\���\�޺\�u�\�_\��`�CHw;\���^\��a\�52�p\�hLp\�\��C\0_\��=?�U�f.�y/\��x%u�.�\��^�nA{>�whr��N\�T.�\\nEq\�uާs���~\�\�\n]�\0zO?�K{n��b}]V\�\'\�\0v�ﺝn\�{���\�\�\�\'7=�ҭv\�\�g��\�,\�\�m\n�yN�\�i3�W�����\�?\�u����1�.�&.�SC\�D�\�\�\r\��~���\��\�CPShë�q�\�\�QdŔ^\���ڙ\�\�{�>��W��=�DX�d�\�\��\�\\?�A\�*\�&a��(S+Ry1\r�\Z�h\�6��� �&\�a꧟�A�ox�\�h���	\�>��Y\�\"\�N\�Hx3H\�#gݼw\�\�B\rn�6��Y\�)w��E�&�RG�4�\�(�O\�0Y!�|\�0�\�7I3\�\na�q\�$�P�\�\rT5�h?Ht�\��Ri��P,�\�aM�v�Z-{*l�\�~/�\�\�[\�\�\��lM��p�:�\n�C�\'�s*=:_P�k�%\�;4\�A:T�\�\�-\n%a\�@��w\�\�Z\rE�˰Em\rOe߬�j�x��z�\�	�z�W\�~��*x(N�T:ZA2�B�?.YF�k�މ6�\�6Ӻb��F�t2����XŝC,\��\�\�cP�ҚDC�Z<�\��ڔ�o�Dz�WhMf�%v\�n�1ro=\�z�?�\�\r���\�C��2��ˤ;���\�kϠX<2���}|s\�\�緶\�Z;\�7\�%\�Ewn�&�\�g#i0\�0v�����r\��w�a��.�}�z�E\��\0\�,`\�\�Ó���\�r\�Z/Z�\�8\�5\�\"��0\�0��}\���\�?�6�\�y,�C\�N\�\��\0cK0?���J��i?�[\��T\���kPT��ة��F\�g��ώ9��]�k�\��=.��\�\�\�8\�\"c�\���\�]M\�!\�<\�r���^\�\�	\�#�9��}\Z�q)x�(\�>�\�yB�Z�\nS�ݽvI[,�T0\�\�/e·�\�z�:!(��6\�\��Pm�\�8F�\�-��|\�>r:�3d\�7��xE$p\�f7q�\'U����g�l��n\�#:�O�d\��S2)[�3\'[�>�&ɹJr\r\��\��@�\�\��<Х:�U��Ѳ\�#��\�\�\�Q�������\��[���\0jy\Z���Z�.1-�]\�T#\nS�OjMa\Zp\� �\�\�1�*���@�\�l�\�hT�6\�\�6��a���Q�L�:��.\��6m�.!4\�m\��ڭ*\�a�L��6[^�y�;:U)�z2�:w:�L:D|Q\�\�9��jS$#>\�e\�\\�g\"SkCӃ ��ڬ��&�y|�`�E�\�a\�8{�=�\�\�{�E�4_ҹ�ѵz�\�\�V�JM���\�+\� L!���\0��^��p�7�I���c��zR����뤙�>����o.�\�d\Z�\"j�2b�6�2\�\�,��9�ϋ\��J�5\�q��\Z(����q|�\�\�\�\�R��\�Zw\�\"\�\�6���\�\�#dT|\�r0\�\�v\rǩ�8�C�R_�I;d�7]֩\�k��z���pm\�w�A\���\�	.۹I\�\�\���\0\�\0�\���\�\���H\��9���\�\�#\�FFM6���n��_-�;ys�^\�.���E0�ܡ�b���\�\�C\�/�\0#\�\r�\0�ƀ��mo�������S2i��\��#m\�a�l��Fa\�\�>\r>6�f\�<:��[:s�\�y�)\�h�7\\�\�\�\��vs\�7���\�6��b\�\\rIu\�,��-2\�F�qgS0��{�Mh�3��A��\�s�\�ů�#\nZ\�Kèz{B�;ِ&�	r\���z�oKF3\�\�(��\"\Zc\�\�1��F\�\�%\�\�#�p\�6|YJy�e\��h\�\�\�5w\�7��Xѻd\�\�\�,։�3�@J,�\�,X���C/JҊ2�?Pٷl�b�\�E8\�>\���\�<_ˢ6I��wU�\�\��N�E��\'��p�\�=}vN��o�b>\�㡬jnI�\�	�7{�aN\�j���lZ�q1�.u	����~�pMQ���d!\�.�5�4įq�1\�t�T�hw\�\�\�\�n\�\��#x\�6�����zvZ�s\�	�\0@�R��rPז��{;j�x҆�?�I\�!h�R�\�,c�\0N,35���Q�Agxl�LA3\�\�\�O���8ӕ��y��p��(\�g��\�)�&��0f6�\�8�&\�\�8�O�Y.Gܾ\�\�\\�\���\�ۏ�<os}\�\�\�9r��\�\�\'Sr���Z\��t�\�\��3�\�e\�?.m+\ZV\�\�fl}#��9]u\�X\�Z��\���o�\��\0�72\�\��.���Iz_\�o\�\�g:DDt��f\�0�\��\0\���\�\�R�/\�(�\0�\�N�\�:\��\�\�j9\�\�\�qS%]ټ\���\�x\������lr�\�y\�NN<\�\�o,}�\�n��\�]��`�\�rJ/��]̣\�Gq�#<��\�\�0\�xZ,�\�\�!\�7�\�$O�B8FBS�\�a�K)Q_�)W&��v�h\�kǋ�}�O�&�UЁw��:���j��)\Zx�E	����d��f�Q\�ph?Y�c\�-\n6��\�8\�\�>2@�\�G�\Z5�>bCw�c\�f\�#�Ϥ)Q�lQ�k3�8�p�P���Q�,�h?g\�l��\�\�x���cgڱ\�\��J:��xt�\�x��!ߜ|�[;G��K�z\r�b(��8�E�)Qh\�1\�\�	�gN�\��O\�-/[.\�@�\�ma\�g\�a0S�\�e\�qJ&$\�A�\�l�J{=�Mx�	��!�\�t�S\�]A3�\�OGZ���ץ�z��Ym	0�	��hT%�e�(�yZ�\�qK�>��ԠS?�\�!\�\�|��\�(�}cx\�2{G\"A\�eJ�V��N�CSgw�\0\�\�xf\n]\�2\�\�I#\�,ZFΣfW�@\�\�\�m�`L�=�ҒO\�9\�&�R�;�\��vp�\�\�/(\�E\�P�/c����Bh�JQ�j�Tf�	��\�x�L\�2�#�1���^��\'{����\��{\�2\�/�6y���\0\�\�\�����jߣ�\�\nw[M\�~�D�{0\�\n\�]\�]�\����\�\���\�}\�\�5�\0u�R,B\�S�\�M�w\�w�\0\�k\�\�\�ל\�^�\�y\�x}\�s\"6\�^U\�&�\�%ވ�L\nSp\�I}Ђ&{G�P��=\�:ݼqЂڵ��1ywu��\�,i\�]�\�x/�-\�y]�\0`ئ\���ϳ]�f��?�L\�_�\�a!�%z��������gch��Sl\��-\Z|\�c�<0�t\�4\�a�N��\�Z6tm^����\�\�jL��O��\0\�]�J���\�>9p��˭�	�f|�7\���X�\�:�hJ�&Ba�Q�\�\�\� ѻ\�yF�y\���C�\�\�4\�\�2.\�\��A-��\��(\�\�G\�?O2\�\�Տ�D�M	��օ*6�Sw�\�˟(�\��U�\nh\��d9\���\����c#Ǆ��j50�(/\n�=#�\�a�1�\�x�0÷gK�\�9��x%H���\�Yţe\�a2t�Z\�\�Ş\�\�C\�\�m>�,݆6}\�\�f\�{:\�kC\�(7y%L̘e\�\�Ǩ&�Ԛ�!�Z��\���Ρ��n6\�\�a�=�R�X�=RAgw��ZV`�f�k,a�ZnͰ[C���ڞ^{�\��gg�,�M(L�ޣi�ș�H��\n�O7�[�|)N�\�f�\�Y:�H	>��.I\�ѻ���<����\�.\�B�\��\�»PM���\�kBY5L;���\�`\�\��$} j<2]��k �\�\����\\�����.E\n�W�^\�\��U7�`C\����\�.\��J�!p�ǭ�\�̞h\ZWg\�{\�\�8�/��O�݊\�r�U\�eTSQ\�E\�r�\�\�/i���.\��\�\�*&_�z/����p�w�t��~l$�^\�v�\�TY^\�\�\�.i\�\�\�Kz��V\�9bz�]{\�\�\�\�QerqǾ\��s�n ��7WKs�\�jOP��9\�]S##\�/R}Q�xb��(�\��\�\�\�^�nV\�(��EG�ܽ��~L���zl\0�H,\�\�Z�Cegt�=%�r�\�^\�;�E�B��,_G��e�o)�u�\�<m��\�0�v\�	�4\rxN.��h\�R2Qg�\��šB{Rf�X�BAg޺`c\r���ѧ\�(\�2��=�L�\�s\nx� �`s\�T\�e�3<�0�Z�F6x3ah\�pł&4cI�ϢR\�c�\�F�\�\�$\�1�%�\�`�(��x�&�޹~]\�\"\�c\���\��?MGK)�O#of���&\�6��\�B�u�>\����\�2A\���p� N\�Qd�\��I�L�\�SgN�M��Y�\\�\nOj\�a�C\�\�j\�\n��h*J�[�1�ÆX����Bf\��4�kEMm\�m�Ga\�\r?\�}a���\�\��AR��A\��Ti�l%�KXL�x;��\�-�8��\����T:B��d��\0(JM����m�\0\n�?��/�\�}-\��R�\�\�#\�\�B1�\0�~�\�0\�v�$�{Ss�x,�3���\�\���\�\�ڽP&�\�S\� N�2�(i	�\�u�}B�<.�\�\�f���\�\�{Ŝ&N�Qj��o^�\�}\�{���)y}o���\�r/\�ː;]�=ޥ\�y/\r\�\�7Uʏ\��\�\�3��\0\�Ȕ\�Ge�\�\�..�2���̌�\��u^*\'ǜW��dw��S\"i`v��7w\�S}�tXQ}\�Ŕ^K\�pGI\�\�E�ŕ�5�\n,�K����E\�N}���h%R�~[\�V\��P�O\�k��,`�u�)Y.�\�Co�����\�\�^i��\�\�y�y)�Ȉ�ͤmdM+�p*%\�}\�k�\�O\�/S3�o\�L�@�O�\��u{t�L�Bٻ\�˦��\0\�\�2Q\�\��\�\�N���\�-\0��`f3:\�<�\r\�#H]\�{\�G\�\'8\�W}���7w8\�;pͨl����ktX:g���$��-T� g��qh=�l�ʯ�v\\����>�͆\�Q��\nl�[7x��\�\�iM�L��1\���X����\���\�+c3�H�e)\�\�\nt\�h\�\��)�O\\R�(+.x\�r\���\0GtH6r\�3���\0\���s\��n�a4 Ч\�Y$�~i�\�I�ȴ����g~\�iW\�0\'I\�\�3\r�jl\�\�gK�m�va\��qɪ0͗�D���<]=�>S(S�����4��&jt���B�~\��\�J;�z��2]\� �{Q\�d�\0��\�m\�c\�\��8�T�&[\����z[Ot���9�MBΞ\�\���\"\nx{�R\\(��0M��>\�q\Z\�laa`Sx\'�&H�\�}\�c\���\�\�g�):\�j!\�(Oe��\���\�G6q\���7�\�a\�f�~1G�x\�э�vW���Q�\��E�ɰF\nYv\�\�\�)\��edYd\�I\��\0Q\�J-�\�Ww@Mٞ^�\�xK\'��F(O�\�\n^T\�\��\0��\�^;\�\�=9K\�o\�N\\�/u<ow����i�\�Nt\�U%�&\�7z\�\�\��\�\��\0\�\�\�Gu�\�\�ϕ�\�|\�7	1\�w\�(\�\�>�\0�=9�\�;�����j���Q89>\����\�\�a�\��\0(�۹\�\�Z��\n\���=\�\�;\�*M���m\�}��-�*��E\�w�\�ޮ\�\�\�nX�\�oGҤD���a�\��x)Ⱉ�\\��\��3�\�N\�\�]\�\��/K�Yx(5�A��\"�\n�\��\�iQ\"*4XDƐL���#f<�>wK\�ބ�J$��p\�\���M\r�w\�F�4\�p\�0Sa�pw~\�v\�B\���\�dq7]\�^\�响\�t�_[�\0X[�)ެ\�\�-�0m�W�\�\�\�\��\0b5�na%���z�q��F닧\0脣\�Ly�\� �\�iʖ\�G9JQ\�6�l\�\�b\�>iD���&D�d�\r\�,�+|�\�-L5�K�Ͻ��A2�\n7|f!�\�t�\�5qb#�L��T��x:D:ŝ�{����C�\�\�Ǽ&\�٨Z6��\�qh� �;\�{�����\�&Oh��Ѩ)P�e���8L�\�*�vt�Fյ\�\'X�!�\�<�O�Sng� ��-�\�	�\��3j�Pi\�\'�|�<�\�j\���&�z]�OhR�N�-�.`�\�\'���\�\�\�\�ɸ�?-<�\�s1�\�z�\\&��\�\r߲�L��\���.�\�l��sBj�FҮfe\��N�z�J�L݁2�\�\�\�SJRE�q\r�\�\�\0�U)a[0�z{*cd�����\�cGxl�RnKY\�\�f\���6\�\�S;�j\�T�JFO\��\�\�PI^wz�[�\�><�1�\�I6Ȳ\�\�	\�ǲ�_\���Q\�r\�n3D�\�\�\��`\�\�\��k��3\�\�)��\�䕾P���\�jo�1��\0j�?�W3�\\x���\Z\��\0\��T�N\�\�#�\�x�\���\�\Z|�\�E�\�F�\ZDw��\"7�N炅J��VއaѬ9<\rWWq\��/jj�At��/ٿ�΋\n)\"��\0k\�^I/U�\�\�]/a\�܋�w�\�sc���\�\�a��/vD��\0�79�G(n�\�>�\�AF��D�ނ\�!Qc��\�\"*?\�\�\���p�iL\�ffW���U\�W�s\��}�*\����\�����v\���4��\�Z9�w\�mI��\�\�t30+D2�\�\n-\\6ݷD@�@~\�V\�g\Z\�\�S<?j}��\Z/\��\��1�t�{\�\�ԶX�x\��\�2/T�\�e\�{����\��\�O\ZM\���D��XF9s��\��\r?�\�.��!\�	\�&Q6�\nr�A�\�i4�,\�\ZS\��;v�� ]\�oLmC<$\�q\���\�l�hMi�l�4#0�\�jK�\�6t\��;��M\�\�aO\��p\���e�Q1\�!��P�8M\��1�<�\�3K8�tj�Qg\�U��e�e\�\�\�\�q\�Ǚ>M\0��\�&@\�d\�a^G\�y���Q�ڕz\�Li쥷\Z�O0\����S&��n�\0>۰\�ة*d�}�,BΝNҭw�v0�PﲪR�\r\r\�\�m*�\r�D]�0{A\�eM�F�\�wz�\�I2/�`�\Z�U�DC�(\�Op]���Qh\�l�{�	��Oe\���q\r�\���I�FId�$ZZ�)<FH�ɕ\��\�\�0Z�\�D\�5\�\���r\�]\�7x\�ࡌ)w���y�\�\�\�\�\�{�\�5\�w{�_�3�Bg�u�^\����<{6+w��\�\���U\�t�+�˄_W:>�`\�\�-EM!\�Á����\0���g\r\�r�\�7��~\�]\�!\��y�\nW\�\�\���w���O�+(�.\������\0~�Q\"/�7=��9L\�f\�h4\�\�*���7�}�o\�/v����\�\�G����|=�\�\�\\�E�SU\�G�\�ե\�\���{Å�t�{�ߣ�h�ϋ\�jKv\��6(����\r\�d_i\�Q���\�&\�\�7U�#�\�Ww}�\"�\0Gܦ��~/\�b�\0\�\�7��\�M���Gbr�\�W6\�4�\�\�K��L�eg���%�8z��q\�}��=�cm2�^˫`\\xL�e\�c\�\�(y9�\r�Nއ\"�8x�\�e�C,�M\�Pj�95�#�xsj�mI^W��r\�\�_�\�Bg~J8|Vf\�\�\�?�3\���jÎQhPS\�;\��\��[H��q�\�a1\�-6�\�?V�Z>�H\�؆\�\�/@�\nl��\�-\r\�\'X�Zq6|�\�J#���գ@L�e�x\�4䓠b�H�2\�ɤ\�<�gݲ�>\�\�}A7�g{gYg\�<�\�\�\��j\�<�-\nl�+\�\�a&@�gUۛ(Mh��h\�\����a\nv�;Q\�p`\��H\�g��ۼnFd\ZY\�]!I\�\�,����\�\�0�C�ų�(Sh������\0[l	�m*���-\r�p�\�ْ!�\�\�\�=�U�\�\���\�a�\�ǎl��\�2\�\�\�(ݼpM\�)7\�\�,�}���g\�_\" o\�*T��w�3w\�QG�p�>ͩ\�>!\�ۺ@�F�\�\��n<�����\n\�=\�x\�R�zE\�x(Q�?,\���N�\�	j?�/e\�a�\\�\�9\�\�,�+ð\"�\�\�P�9\Zd�	c�)\�\��@�˞���\'�˸}\�r\���|\�?\�\�Y�\�\�4\n��\�\�\r\�\'�\�}.�?��q]��\0&npy)Pj����\�8\�\�q{n���ysn\\�wsݱ�gxm)P\�\��rM!\��\'O���\�q\�\�B������[�ȮN]o�ܑsss.�\�\�wxy\�xn�_p\'4T=\�ʹ;\�\�\�\��>\�،���O��x.��\�\�ͫ��N�֥\"\��^��y>/E�Wڽ\�n?�5���B}��\Z��%/B{V\�z\��������L�G\�z�N8Ǫx-y\�\����٪��b�Q\�ӻ\�Q�p���e�\'\�\�\�E�ܿg.�ah\�\� \��ŞA�\�F	a�[4\"���bW�c\�,�F\�3\r�F\�\�g�ז\�/X�jL���Y\�[i�v�Cˇ6�B}\�Y��\�\�Yv�tJ��a.h�ڬ�FОN�I��)\�<RU9p`�Y���\�i׭��2�a\�	G�\Z��9!<�64z9�9�.�l�\�\�hL\�|���\�\�X��J�ɤ&��=xH)�M��\�iW���\�{�n�Z#�3a\�mO)\� M�I�)\�}B.\�uK�E\�6Y\�m�+s,P6F\�ɘ\�Jx�W/\��\�\�eM\�\�\�\�\�7�%��2�D&N\�O�*Ä~�zI��\�6}\�۶�?d\���O\�;R�I�\�Y�\Z}\�\�\�\�[��\�U�Z=\�e5#�\�X-�b\�	�-���СQ�HV/�c��\'	\��M�תV�{m6\�`S���y\�\�|�\�_	G��E�~\�>=8N��\��t��2Y�\�Y��}\��nI\�O$��\�2�E\�b{Re|^\�l�����\�\�\�E΄�}]\�/#�\�[[��0\�w�\n�%t܇;��\�d�����_T\'z]~@����\�^u�}�x��w{��~��\���q���+����[t��?_Wau�\��W{�\��׹�\��v�p���\�\�]\�l�U\�_P�m\�x;Һ�\�\"��t��R�\�sa[a�w\�\��\0��\��܍�8\�hY�q�=-.�\��͟gd,b\�\��\�\�)/�K\�\�a\�\�vn9��b\�*U%��H\�\�w\�WJ\�.�\0F�W�\��\�I�N]\�N�Lv|\�\�h�3[\Z,\�x�:\�\�[���J��|�g\�\�4ɋDrH6��2)\"��J�&�m%�zҖ�e߳v���\�\�\�	ӓb%\�\�0\�@lcw��@�͚!g,\�\�\�~�fK��6x�\���xM��z\�Ng\�\�\�ؘ\'�I��C.F�\��^\�\�Q&��\�A��Uf��0�=�T:#\��\�8��\�al��\�V\�,#	���N\�)����8����&��x�eKg�)Qꈶ�)ShT�h�\���<\r	�Ț\�\�\�\�:��RB�Bo��\�F=�d��?\�\���m�G#q\����?��\�\�|\r�L\�F\�k\�ϛ�\�T(5_�s\�)�{\�ӿ\�)3r�\��\�\���hxn\�\�\�<���%\nc�\'\�Z�=:{SRb��hs\�\�\�nXr6\\aڣ\�+\�$\�.�\�\�!.���#�@��\�9�g��\�uӨ��W\�lSO����\�\�K�۸\\���\�\�m�\0Zq�\�\�A\�j\�\�\�-�{9�Z�w�P{w��\�\\\�w\�U\�\��\�\�ފ�_\��\�6\�\�볬]?��tzI\�}㹯q\�u\�\�Ÿ���\���e`�r�\0\�T�\�_\��G\�A\�\�L�2M�[n}>}\��{���\0��]�_�\�\�K\�\�I�m�ȉ\�\��x��kۋ�C�\��\�\���\�\�\�b?e~\�7\�Ç�w�J�t�\�Q�.Iû����S��\�~[ЮC\�{�����\�\�\�\"\�?\�{�E�7)��d�\�\��\�\�Y��\�)Ğ8⁎rs�\�\���yV�\\��_��>о6��\�w\\߭\�L#\�;�2*?�`XG\�ed�r	�\�D,\�Բ6�Y4]�\�my\���R�\�>Q�m;�L�# S\�3A�x�Tc\�F\��yG\�U�\�\�Y��$V,bН�e\�\�\�I\"�aL���\�|n ��o�şe\�\�W@K��Hg.�\n[�kpM\�\�6�\�%\�`P�m\Z\�\�\nS�xJBY%\�,���\����\�6S\�\�3��\�\�C���zCG@S�\�\�\'�}a6R\�r@O�\��Ԃ���A�ϋ�b�\0�X�I��(��\0h<�aL?��ǰ)\�a\��	\�D?(��\�3��?2 �Y��\�G\��_�\�	�u�g\�A\��4\�\�\'�v�\0N��俽%\�(Q�W\�\�\Z:��\����޷O�,�b?v{��K\�e{u�z\�\�?\�>F�e�\�џ�\0Va\�>����U�\0z��\��\0~�\0�\�\�\�i=\���)�\0!�����\�\��;�׿M\'�,sG���\0�Y�\�����{��Q���\��\0��O�?y��x�\��o\�\�>���\0\�<\��\��\�\�\�(S���0�����\�Oz�ۗ~\�\����g\� �\�F\�!�\��Fs\���C\0S���|Ⱥ���\�b�B�\�GI�\��㗰h\���h<\��\�<��A\�=`\�0\rNn�_>\� _>�?\�&R\�\��sϠ)��\�	���\0lC�\�',1),(3,'0011677737','Magoliman, Joanna Mae C.',2,'1999-05-01',20,'Santa Cruz',6,'123','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0V\0\0\0\0\0\0@\\��\0\0\0sRGB\0�\�\�\0\0\0gAMA\0\0���a\0\0\0	pHYs\0\0\�\0\0\�\�o�d\0\0��IDATx^\��wxW�\�r��Ͻ\�s�8\�=3\�gޙ3\�̙9Ӟ��\�\�\����v����\�np`�e���EΠ@�\0E�	�Ad�B(\0@$$H!����Z��V�\n�v��7�~�����jժ�\�\��\�kou�\0\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0�B\0\0\0\0\0\0\0\0\0@�@�\0�V]w�\�\�\�(*F�y-\0\0\0\0\0\0\0\0\0\�\n\"���C���\�×�z��\�Ö{��Qa^\0\0\0\0\0\0\0\0\0���!y\��m+�\�y�z�\��?M\\M�n�¼\0\0\0\0\0\0\0\0\0b�}b\�S_-^�W��Х}fl\�r�<iu\�\�7�\�R�\"*\�k\0\0\0\0\0\0\0\0 V!��6=98\�\�\�\�\�.��\�\r_\�yȢד\�l,����\�?\�3(\�\�$2\�:u\���\�S;w\�\�9�\\�h�4̚Z3��:�C\�i�Ŭy\�\�w=]HD�5\0\0\0\0\0\0\0\0 D\���\�~1hiζ�?���\�\�%��g�+�m\�/�U�|~H�¼�s��\�H.\�y}ݠ���j{����~�\�\�ES�Q\�\Zr�#\�\�޸�\�B!��\0\0\0\0\0\0\0\0� B\0O�Z��3I���fƦ\�|\�\�\����1�0�%�\\n\\�\�r3s\�eݕ9( 0\\�����>\�ƥ\��\r\�\0�\�\�O\n�m\r\0\0\0\0\0\0\0@k��Hw@d�	t���q A�a�DT���\�?�d:\�\�\��\�2�flș�*�\�Sa^K��\\\�ʟ\��\�Ҿ�\�}\�\��3�k눲ƿV\�8#oEj��_�\'�\�\����q\�\�%��LQ\�<�َq�Ω�\�\�R��r.�\0\0\0\0\0\0\0�2ȵ�=	\�\�֣��\������\�Vk8&���_\rY�oq\�\\�`Ζ\�\�!\�O?�r\�tͯ�\�>\�$����\�&,4\�kfȻT��b~\��ьюz��q��rF\�\�w\�9x;,Qo�7.��\�lK����\�u\�.\�3+\�H��\�\0\0\0\0\0\0\0\0D̝:��x�6��j��Ð���3��\�$��<g�qhh\�\�\�\�\�*\�kI\�����n�5���	�c�ǚe\��\"R{J5	^Q�Ϋ\�y�f�z)�A�\�\�\�\�\�\\��\�O��6\����\�p*\0\0\0\0\0\0\0 � �\'�$x�cVkS�\�~cGd����_|>\�^c�&�\���/S�CC?\�3�p�\��p\�$g[άw�\�MǫeH\�\\��k�\�\�=��V�\�)*\�!�I\0���YjH;��}-`)e\�\���\�h(�h�>�\0\0\0\0\0\0\0�&�-@h\�?R����\�f�轑\\SV\�\�2 e\�ҭ�z��\�5~if�T�ג��-\�k\�]�\��/f�\�N��f�ʪ\��<]w\�\�\�Y+i\�z`�pv(XA�+7(��$VE\�[��u4\Z�/GǱ\0\0\0\0\0\0\0\03p\�B��\�xb[vC���B\0?�x\�?����Q�Ϧ/_�-\��\�F\"׿�?bO\�Y*\�kI\�Ζ<�l�M\�K�1׎f�p�:�s6�{h\�v[O$7*7h\�\�ʱ]���X \�lI\�Kul�\���n\�\0\0\0\0\0\0\0\0D\�\�ĞOt\�jm\nZ\�\0��a\�߿\���oYw�h��\���\�\�wF\�6\�E\�_Qa^+X\��\�\�<0\�\�r\�3\0\0\0\0\0\0\0h]\�B\0q\�V(�?RQ\0q\���o~��{|a\�?�>\�r�\�\�T�\�\n����\0\0\0\0\0\0\0\0�G�\��\�p4����9x�\�ϧ�s�qEŨ0�\�r�4n\0\0\0\0\0\0\0\0\0�R\�g�N�\�6�N\�h�)1\���\�\�\0\0\0\0\0\0\0\0\0�\�A\0\0\0\0\0\0\0\0\0\� \0\0\0\0\0\0\0\0\0t\0\0\0\0\0\0\0\0\0:\0\0\0\0\0\0\0\0\0�\0\0\0\0\0\0\0\0\0�B\0\0\0\0\0\0\0\0\0@���\0=zt\�\���w\�޹yݽ{�\Z�\�aKK?�e55\�nhh�q�1:\�\�\�L=�ky�\��\0\0\0\0\0\0\0\0�\��ٱ��>|(N�C�_�\�Ѭ��\�{�\0\0\0\0\0\0\0\01E\'�Q��S�N;V�$zK�45\�Rlv�Q\0\0\0\0\0\0\0\0\0�H\'Ţ���\�Ͼ�\�߽��W�Ǘ��\�S\�\�L���q�hhP\rv��|��q\0\0\0\0\0\0\0\0@�b������g\�Z�f�o_\�\�3@2�\0���!\n\0\0\0\0\0\0\0\0 \�%��?9�����\'���\�[?\��\�\�����\\����(\�:�\�\�\��\���\�\0\0\0\0\0\0\0\0@\�t�����r��8up¸cǊ~���~�\�\��8���^�\�U<��\�\��ۇ>a0t;O\�\�҆\�4\�P�\'�x}~�8��\Z\Z�\�?p\0\0\0\0\0\0\0\0D\'��\0��\�nbbꏟ~�\�O��\�\�c\n�\�Q��}��*�\�+�:�\�\0���\�/#��Ev}\��\�_�]Jo�\0	Q\0\0\0\0\0\0\0\0\0�B!\0\��;w\'�?9%�\��O���Ӯ=��7o�\�輼�\�-\�ݹk�R\�Mtz\�Q�(\�x���bk���C�>t��(�>�*��\0���\r��ĉ#���8����6R<t�fӣG��h\0\0\0\0\0\0\0\0Q�\��\��w\�\�G��l�\�~�����7׿=�\���rs�~\�\�\r*�%s�R\�Qtz\�N�`\���\���X`��\�<W+��m\�C\0\�\�srr��r0�����\�\�c\r\rMr1ݼٌ(\0\0\0\0\0\0\0\0�(\�W���y������\���߾��?��\���\�}\��k;�~\�\���G\�?p\�\�]\�\�%�F\�\�+^:�\����\0���ؖi\�o�b��\�Q�-[2������\0\0\0\0\0\0\0\0\��\nܸ\����a��dN����g\�%\��\�sq��\�ݟy�\���:$��k\��_\�ڷ��~_\�\�\�*�\�E�W�t@�]�~)�l�Ρ\�\��C\0$��\�֭�裏33�\���\Zo����a\0\0\0\0\0\0\0\0�� ~\�ʕ��U���|���\���ϻ�A)��\�{��\�})��\�\�����tz\�E�i��\�~�\�\�\�`��}�\�+\�+PXx��\��Z���/,��\0\0\0\0\0\0\0\0�x\�\�OI���\�O?�O�xట��O�ק\�j��\���X\0\�w��\0�\�\�w��C\0��G\r����XS\�-�wB�\�c\0\0\0\0\0\0\0\0D��\0^�՟�~�B#�^�/�\�<�_\�*!\0�o�=���\�\�CF�P����\ra|���99��F����\"�\�\�ۈ\0\0\0\0\0\0\0\0�6�t~\�s\�S/~&�\0�\�\�\���7o�N Ƅ(\0\0\0\0\0\0\0\0�h#��?=\�ݐ�\�\�jn�͇\0\0\0\0\0\0\0\0��D\\tz\�6?f�u\�e\0\0\0\0\0\0\0\0�\�A�u�(\0\0\0\0\0\0\0\0�(!�Vם;��X\0\0\0\0\0\0\0\0\�B\0m!~�\0\0\0\0\0\0\0\0@;\�I�\�N(V�1�\0\0\0\0\0\0\0\0\0ڗN�n݁ � � � \�B\0AAA\�!�\0AAAu!\0AAAAB@AAAP�B\0AAA\�!�\0AAAuy�\0v\'��L��\�\�\�5�o_]x�r��\�H9\�\��m\�n�����M\���ҹ�k1S\����		��\"Y.�\�\�m)\�\�[�ݯ\"�bR��*zj�#/��R�{�#;�������\�\�\�\�]���\���AAA1(\��\�̛\�ɷ繌��B\�&���^\�\�\�\�\�k-Hi\�\�Z\�KkkYF�:\�j=F�=��\�\�x��]\�K+��\��i����4p8 \0AAAA�#�\0�\�jD�Ue\�y\�9+G)#_�\�Ue��.�~��k\�\������\�\�\�P#\0AAA�� C\0Ɯ[�|��+�C��;\��\�\�:\��U֡�N6���\�Q\�Da�sT�Cn�\�SN\��ک���F\�C[\�\�\�\�\�ʫ	�|�Qu\�ũ\�Dʘ�YR�\��\�N$0��W�C�`\�ͽ|xk\nl�\�<�޲�\�Nͫ8�X�\n48\���5\�n$,\��0\�M0ҵ\�\�{D\'�n˯I�\�\�69�֨AAA�E�@�\'�df\�0���yf?,)a iv\�h\���h��\�\�eB�R�!\��t^Ӈ+cK)�;2s\��Ժ\�\���17�)EI�\�e�<�&:���e\�q�.��A�f�C1P\�)#�\�~Fyp�b\�=u|�He\�+A4��g\�~�R��{Ը�6��V4AAA�E\�0\rG��)�sɶP5\�\"M��̳x\\�N\�\�J`N�o�\r��|QB̽��_�CO�`2l�Gy1\�\�q`)Ҙ�Yr���p(c\�\�\Za\�\��X�\��&�\�-P�0d}�҉\�;�\r�=\�<5\��\�\�#���qxʷ\�8��H3�ũ5K�tx\�j�AJyM�C\�e��ފ�AAY��\�(B�ùd!���[�Uh\�l|���\0�+b�]��\�L\�\��\�FƧ䞳3j��y\n\�օ_�CO�\�D�ъ��\�d�[�5jY\�\�s�,�W\�U8�\�b=�pt�x\�X�urA�\�p�C���j9�6P�۩\�\�SB���1��D\�q-Ne�]\�[ެ��\�I��Go�>AAAV��[\0����_��<˵ZM��\nQ����0\�l\��\�.�ʃ\�\�\�٢\0^+h1Gg8־�1�yQ\��*=1\�D��0�/g)A\�2�\���\�\��N\�+��\�9dI�\�>\�^F�o��\�9X��\�勳;nˇ,�j��5�\�\�0bA\�up\��`\�ۋ\�\�R\��J\�_\�Zn�R�\��\�\�}\� � � R=?hEk�f�\Zd��\�Bk\�t)\�Wd\�꾗��\"\�\�\n�\�Z\������D\�Q%<\�c\�\�\�-\�Zg�1�eQ�Dn\�F�#�ʑ\Z!��;n�ʇ*% �\�\�U�b�\�aĂU��Q\�(\�ӎ����\0\�2zE0߳\�k8xщ䷶y\�z�zAAA��<B\0Pۈ\�h\�+��A�d\�CR8�\�\�no!� � ��!����\�\'\�<C���L��\�M_�@AA�?!\0AAAAB@AAAP�B\0AAA\�!�\0AAAu!\0AAAAB@AAAP�B\0AAA\�!�\0AAAu!\0AAAAB@AAAP�P(!��?ϓ^�z;V\�\�|[�\�\�h\�MǏ�HI�2z��1c\�&\'�\�\�*\"���sK�~3n\�����A��HHHHJJ޶m\�իו�AAAP\�u\�ڍ7n*�Sf`��\�ƾ���\�?߾}����F�o�\�:W�^���%\�K���\�R\�M�Ѧ���5k\�ܼy�����\r6|�\�`�XD4���.Y�$//��������Ng���\�\�Ξ={v�~��\�?�\�rԛ\���\�R\���҂]Jy?RZ�K)\�GJ\�R\���\�B\�:p0g舑��S\�f\�\"MNJ>jL~�Q�AAA��;\�\�\�W�;w��\�\�nٲ���\�YS�� �\�\�\�8z�\������\�W�\\�:u\�{ｷr\�ʳgϾ��\�\�\�\�d\�q�\�q��\�\Zm:�o߾UUU\��s.]�D\'�q�A)��ߴi\�~�۷o߹s\�޽{�\�ߧ����e˾Q\�ڥXP?RZ�K)\�GJv)\��Hi�.��)-xK�\�GJ�if��}��?z�H�5>|�k��y�*�!� � \nJ�f�\�ٳwԨQ}�Q\�޽��\�7n\��m۶ϛ7_)P��\��EI\�\�\r>�\�\�~q�\�\�\�?p�W��\��eW\���z}��g�\�a\��x�\�\�\�\�4z��H�@\nq@SSӳ\�>���U__O�\�W_���x�\�wϝ;�\�?����\�\�u)\�\���N466+-\�\�\Zm:j\�֭\�ׯOOO�?��\�̙�v\�\�-[�\\�\���4\�\��{�n�n\�+u\�\"۹-�\�Ԏܦ�\�n\�M\'\'	\�oc��	Ja� � �|\�\������iӦ�\�¬Y\�99�IJE��G\�S��=�^�o޿����z�t\�A�6m�޸�jc\�ym�ܴ�jJ�ɗ\�\�\�[x\�\�/^�e\�֠��>�<|P-�\�ۗ�uw��^z\�h�\�*\0�;v젝	&�9s��\���\�?��y�\�<�\�nSc\��\�\�\�\�N+-\��62ƍ/l�D|||P!\0?\��=eee�\�w�-c�s���Ν;�{\�9���\�v޹\�\�_~ljGk\�\�E�\��Ci�fϙ;�\�\�g<x�_��\�\�?}�<c\�\�)ӧ+�!� � �gϓ�|[#..n\�\�E�k\���w\�}�\Z��\"yn�웥�\�s���5�a\��\�����;\�#�.���V\����\�\�\�[x���\�\�*\�ȑ�\�>T#F���\�C��Ha���h�СC���*\��\�[UUUd׏;�k׮\�\�\��\�\�[i��\�h\�Q\�ƍ��ZZZ\�q�\��b�\�߿��\�\�SSS�=z�\�Ma�u\�\�\��\�\�K�Y�|��o��Ե�\�Tj�ý�8p:���\\�\�\�W\�h\�.ަ,JTZ�˨h�c�\\�\\;k�l\��C.\�UZ�\�h����)��/\�.Bc\�G��,�}\�Ξ��)\�R\�O�<a\�\�i�iY\�\�w\�ݛ=w�R� � � ?JMM�4i2Ib\�\�Y׮ݠđ\Z�s�z%�\�ɓ\�\�f��\�ۧ�|X�\�A����\�\��\�{�#DH{�W���.��\�{�2�|\��\�\�O?��\��la��\��N�>}\��Ӗj-�B\\@v�\�O?>|85z\�ҥ���>�`��\�\�\�\�?��_|1`������8q���\�7\�TZ�+Rmd�_�>99�믿?~�رcϸ0y�d��,?\�\�>������nӦMS�L��1q\�D:/5>{�\�455Q�!\0��cSy�ׯ\�\r���eV(En�\�����s\�\�Ņ\�]�D[9\nT�\\��[�(c���ȭM����P\�}�J��>��ogʴT�0AAA~t�\�74RS\��_��q\�\�_&�ߔHY�̉\�FE�\�=\�\���{\�~�\�o�潚\�\�F���\��\�{;�~�\0�\�\��\�w\�u��.d\�\�ܹC���mcc\�͛7\Z\Z\�\�\�G�I湾���\�\�\�\�+++����^�\�\�\�F���6m\ZY,j�\Z�\�\��\�ٳe\�JٮA;tH�dו����\0�\�\�\0&%&�\�SH�\�䅍�	Cg͞M��i�>{\�\�JvMq\r��w\Z��Z��v\�~��Z��H�Ӧ,޾;}0�+\�X0�\�0/��R߾}�,Y\\X��\�_�о�IX�웪�>d�_�-��\�+\�-X���\�Ja� � �j\�\�e_}�\�믿���\�_�RO)G�\'\'L����ޢ�=��uuW�\02d\�7\�|kT�\�s\�\��Q�\�}����\�\�oz��/B\0d\�C�\��)\��\�°a\�\�~�\�t��\�)\�U\0w\�\�mnn&\�N�c7L;a�1�k׮�ͦ,�!���\�\�hhh\�ڵk�\�\��E\���\�\�ŋ\�߿\�\r�\�\�ѣ�����KZ#\�_~l*oSx)�v�\��Cs��E�\�\��bJv��6m\��\�\�/�Y�\�/���Se%�s��\��ys�2nm�\�5�}�\�\�|�ٟ4^{\�5�?xp\�\��\�\�g����\�\�\�%�}\�\�\�K�\�[�A\�ђ�;w\�W{br�R� � ������FF�\��IIIt\�\�\��\�&\'\'_�\�p\�ڍ����?��\�\�&ʢ}*�\�_^�zͨ�H�۳�\'u\�~u����a�\����t�\�u�x\�wB\�\��\��|\�gC�{뭷z\���\�F�Wܿ��\�[��/�3\�n�v\�\�ٟ�\�|;e�D�ME\�\�U��\���\���\���\���A;t�\�_��ҥK4\���Y�f\�֭Æ\rS��O?�T3��+��S�\�*\0\�K�W�/�o\�Q\��\�oH��B�C�\�;��\'��6e��\�\�i�7�<��_~�\���\�tx�\�\�|@)˿YB�n\�X��Ǜ\�\�J��� � � \�[\�\�,Y�\�\�u\�ޝ�_\\\\J���«\�R\"\��\�r\����-Z\�s�\�\�\�\�]?�{�\�\�\r}�ǯn����~B\0.�\�K�\0Ȋ���Y>��s�\�?\��>[:t؛o�\�S筷\�2Z �\n���\�\�����\�_?~�ي\nõ�3\�]6\�~,.7\�w\��ڦ[ \�ƍ�\�?�\�\�~�32�\�<�9�\�ׯ\'%%\�!%��\�w\�\��K㫯�(-\���\���7��\�_�\�O~��\�_W\��x�nݺ�#G)�(�6�\��\�\�_�4~\�س\�Ɉz+�M5\�\�ѽ�K/�\�\�4\���}�m��s@\�P%%�6�@r�\�I?!\0��F卺\\�  \��򜑒���R>��c\��\��Pڴ\�i�4��y�\�A־왳f+�!� � �VSӭ��\�\�\�\�W_]�x	�TT��}\��I%%e\�ߞ?K�K�,��~��8p�*��\�}��Nw��w�\r�ǯ�ۧzDrp!\0�\�a�\0|���0�\�{:o���s��uٺ5�_5~�\�<��Ӵ�\��x۶m´k�\�0\�ܷS����?��\��s\'\�6͙3��>u�K�.]�v�裏\�\�\�&O�L��HY�\r�W|�\�J~d�����\�o5�o��\"77wԨQݻwOI�Z�mo�G?�Ѷ�[ȋ�O�	nSŁ�U\0�6�x\�~~8z\�~q�?\�\���6I>C\0ί\r��FuCr�Ҏ,\�6{�/�˶\�\�	ƾw�v����\�\��vs#�}z\�\r�*ϝ5�m�����A_\�\�\�gg\�?�\�\�u7o6-Z�\��A_�;��˯�9z\��/�\\�\��\�\�f�:AAAUTt�O�>���ʈ\����]���\�\�0�С\��\�\�\�)�\nP�~��Q�����<��ϯ<7\�N�Q�\��\�~F��|��\��裏��\���:\�\�^{W�.\�h�\�*���?�\�O�|�\�_�\�W555gΜ�:�\��\�\�ޓ\\�l\�))\��BPm�2^z\�e\�\�3\�<C�����ڱcGRR\��HY/��2��3`���\�r<�\���˿�\�\�o�M�-⣏>���\�۷/\�\'\'\'9r\���\�\��Ҕ!�1��\\\�aS=\�,>Y$�\�\�\'য়\�i\�;|_iʐ[�?�\�Ox�\�\�I�\r\�\����\Z\'O��M�׆\���={�\�/+)6R2�n����|B�}&9�����O�S�iK\�Ҥ\�������7�*+/\�}\�\�䤚�Z�AAAAi\�\�]d�\�\�\�|����!C^}�U\�\�!%�\�\'?��\�\�\�\�)\�\�)۶mW\Z1$\�\�Y\��+\�F\�y~̃gG4�6.\���o�B\�С������\���:�G�dB9����\�)�U\0\�\�O�\�/~�\�\���׿��ɓ\'���h�)q\�	\�߻\�w\�@�����\�\�h!\0\�\n�ME\�\�o~�r��}�ن\r����\":\�P\�\��s\�/\�ݻ���|\�c|Ǝ\�\��x\\�G�\�Ǎ\�Zܦ��@�\0<\�=jdh!\0\�~\ZՕ��4e(`�\�\'��_ظ~]\�\�C~\�t\�;m�2\�\'\�߯_�\�9�.\�^ܱ}�\�(囥KBh�D\�\Z����\�ͷ?�\���\�{\�ڵ�\�gʩA��_%(!� � \nJ;v\���7�tH���׮]�A;���d�_z\�%^&++ۨ\�n�N�n�nc\�<?\��s����\�)�C\0{^x��h_�\� \�\�\�?�3Z�2\�\�W_}�,�G�F� V���\�//^�XSSSQQq�\�YڡCJ|\�w=|�\����f @�	�{�n�!��\�tdP\'�~�i���\��N�J--Y��9�E\�rԨQ�uh��d9�\�c|\�~�ma����6\�y\�m\�x\�aS=\�|\�7?����d_\n�M���\�%��۬<w\�\�\Zrk\�\�!���\��Ձ�\�W��\�/VWy��\�x�\��\�w\"\0�q�d���hg\����|H\r:ꃾ\�� � � ?Z�t\����W�^\�:�\�\�O\�\�\��\�ŋ��p�<�\����\�}u�۸;/L��ܘ�g>�0b��@x��ן����[�n�����\0����zxC�{�\�!�\0\�{\�\'�|��A���2�\���G���=x���\��ܻǿ\��\�=�Km�\�w$//��\0�m\�Q��\��׿�5Y}���\�\�vj~\�y�\�\�ܹg\�޽�J\�1>\�f�ݷ\�\��G=\�|��uG7�\� \�*\0\�6yS�z\�t��Zb\���<~�p\�\�E}���!\�t\�\�޽{\�c�RR�LQZ�Y�\�\��?7J;t8}z\�\�\'�\\X\0AAA\�\�ȑ�=z��ӿ��IIɤO>\�/�^|�\nS*z�[\�S�r\��	�_�t��qM\���0bZp!�\�^{�\�8\��� 3߯߇F%%\�\r=�\�WC\�ފ�\�HA�\0&M�����_��_������(\'\'�v\��\0\�\�p�m=,\�U\�q\�og\�رz �6\�>\�MO�M�\�׿�u�n\�n߾]ZZ:{�\�?��ϔBP\�̙��*r<�\���?^8~+V����\0mN�0��UGy\�\�ۦ�U\0��Py�������޽{W�?�4b\�\�,G\�e6���\'�iG\�\�\�� � � �:~�Dm\�\�\�\�S\�\'\�6\�\�\�++/�8Q�TTdY\��\�ﾾ��\�\�/$\�\�6�\�O�GN�6rݴ�\��W�\�\��=z�x�\�Wid\���\�g�\�\�;\�\��\�K/�\�\�)���3O?���\�ﱝ8q\"77�v\�s\�\�UUU�Q�\��A\�Ç!��W�?�\�3\��+Pzmm-\���\�tT}�52�\�\�g�}����:<j\�(:\�Н����T	Vn\��\�SO\�\�\�	ǯ\�\�\�p\�ԩ\r6|�\�g�|ҿ��^iʐ[�ī=^\'\�\�!�)C�MG)u=4o޼?��O�\���|�Ni\'����>hn�=a\�D\���+�S�AAEV�\�/8u\���\�#\r\ZԳg\�>}�|�\�cǎ%矑�P)P\��.\��Յ\�\�7t�\��\�\�k\�|V5r����\�W�\�\��\�\�_y\�n\��Cf�O��F~B\0�Ǔ�\�\�	�R!\0Rf\��\����\��~�A;t�s\�\�W\�\�v}��	\��\���\�oi\��ܦ�h�\�\�\�%A�!�ft�}|\�\��\�\����\�~A�\��\�?��?��\�_�\�_RRr^^�҂]�c�eK�R,(u\�6\�\�Ś��>�\��+Cn�����\�\�L��x�r��ICC�R� � ��Hi\�\�uuuW׭[�m\��\�ꋛ6mV\n�\�\�?�t\\I�AU]��\�2��\�}\��-[��rݶs\�U8\�,e�\�-z��Xн{wr�\�G����a੅2֭\�\�^�>Ќ�@n�\\�t�t��\�>�K�\�����\�\�0PiDֱcE\��\�y�\�wi+Z�\�ݦ��\\��5+\�\�\�̙�(Q)�h|&N�\���\�:uF)�\�fd\�SW�^WR��\�қv��uu��>����R\0� � ��(\�\�~4���\��ǜ�d���G��pXQ߯��?\�{�>\'\�gY��G�\��F�\Z�嗃CPrr�\�B߾�>����\�,��@\n:\0AAAAJw\�޻{�~H�=-�� � � ��!�\0 � � � �C!\0� � � \�\�t\�F#AAAA��� � � ��!�\0 � � � �C!\0� � � \�B\0� � � �:�� � � ��!���K�!����$!���C��� � ��V�2?\'!\0APd�<IH���� � ��V�2?\'!\0APd�<IH���� � ��V�2?\'!\0APd�<IH���� � ��V�2?\'!\0APd�<IH�V��\��\�ݼS\�V|\�Y�\�\���2b�6\ry�\�\�BEM٤&BAA����9	!\0�\"#\�IBR�Ќ˕\�\�0\��T!\0\r�#eĄ\ng�\�>?\��ю���k� � �Z)�s�\�@�Q���K\�g�ZSl\�zk_z?��IA5APtHy��,��\"�\0 � ��֑2?\' ��7[ͥ#\0A1(\�IBR��\��?0\�l3\��R;\�\�+P�\�K��-���\�J^\�0��c�S�\�+�\�s5d�\�\r�\��\�\�%�Nκ�K����RF)=�\�H1������{<� �\�~$��W`�^�	n\�\�\�̋��vx\n|ql�k\���A�\\AAPlH����\n�ٷf�X ��}\��Z\��(+}�b\�\�\�\�\�\0k��q.󘷖�.\�$�\��\�\�\�Z\�>��\�>�\\ʓ��`!y�w3f�Dr\��N{�\0\����oT�\�QB\0f;\�؋��h\�zvVFo\�\�\\��Y\�i#\n���?O;%0�����\n�n�\���\�!\0�\�Q�oT�\�QB\0f;\�؋��h�R���2z�\� � �bA\���\\�X�\�6W\�ŗ��n\����^ݒhHo��e4�\�?\"��\��$!)XH�\��\�]NQ\���cy��\�\��\�Z��K	8�+�x�˼\n�ORFLH�\��\�]NQ\���cy�k���z�^[\�z.^\�\� /e�� � �)�sR�!\0����K��p\��\�\�ɱ\�u\�Z-�\��r��p>\�\�>��ھ,\�IBR�Ph!\0!�\\�!��\�C\0\�\�[S����t.5 $�ˇ^X|6\�P�\�\�W(鲔\n- ė\�\�D�\�!\0�UR�����\�\�%\�\r\nI\� � �bA\���|�\��K_�jG\�g���VX3�\" \�5�&*-83�\���Fʓ��`!���\�\�!\0\�\�Wf)!\0Ӻ�\��33o�#�\�f��(�\�*\0�s\��I)K\�w\�\�\�o8J1!���\�R�\"Q�\�of��v�vL\�ξ\�\�َ̼���y*\�\n�\�\\AAP,H���B\�\��C#�v\���Z	��Y�\��2rEcǾ\n@�\���\�\\�p>\�\�>���>��$!)X����xf\�u�\��\�!\0�C�\�Yt���~h\�\�?�\'�q�����\�ZC\0f��sy\�GS��\�\��\�\��K1]�\���lb�\\��/\�r�x-�\�\�	�\��/�=1d7�\�`�7\�S��i\�)�sѮV\�h\�~.� � (�\�\�I!�\0��\�< Џ�D��\�<�\���r]QZõf�\���#\�\�\0͞@%R�$$\�\0?��O�O�\�yI���\�\�N\�^��y\�H1��AA����9\�w \�\"\�\�>A���\'	I1��e~�#~�?֥��o�\�\��\�?\�AAAR\�礶H�\0���!zL�<IH���� � ��V�2?\'�\�*\0�/)O�b�!e\� � � �U�\�\�I@)O�b�!e\� � � �U�\�\�I@)O�b�!e\� � � �U�\�\�I@)O�b�!� � jK)�sB\0EFʓ��<� � � jK)�s�C@�.\0\0\�IB�u\�AAA\�%e~NB\0\0�\'	Iy\0AAAԖR\�\�$�\0\0\0�Ay���AAAm)e~NB\0\0�\'	Iy\0AԾ\�U\��(#AA\�%e~NB\0\0�\'	Iy\0AԾ\�U\r��2\�\�CAP{I���\0\��\��\�&�\�\�\�\�|����\��Ay���\�c�׮\����iؕ�\�?gmHU\�Tcc\�1ݔ��R�d\��\�JyQS�\�<�4\�EMe~;J)\�G�O�ٹs��\�\Z��۪�k��A����С�+V,\rĪU��=�TV7n4\�\�R��m۶c\�N�\�/,<\�\�\�K�*=z�\Z\�\�̤i@h?/�\��������+V<� ��e\�\�\�\�\�J\�U\�\�Ce���\��w}?F ��_\����\0\0�-\�\�\�\�U\��&�~6zv�m�`\��1%�Τ\�Y<fr\�G�Dj �\'	Iy\0ykw^ɰ�͆�:�h/���\\I�k\���gKv޿sA\�\�\�\�ͳ�\�~tx碒�5Jk�ҼU;WOV\n{��*>��\�6\�(?Z�g\�\�My���fM}7I)\�G\��w\�\�s\�\��\�\�#��Gsr\�4�D)\�/\\�V\�;\�qT�\�?p\�ȑ;w\�ЫΛ\�\�Ɯ��\�J��o\\ii���\\Tt����|�\�KJJ��u\�\�r��I\� m��nZ�|Ÿq\�-ZDf�;6l�?�رc�oߩ� K�^\�!��;TFv��\�\�\�\�W����H\�ڵ\�yy�{�\�\�\�ͫ���\��Td\����7A\�R\�\�$�!��\�\��$4\�H��s��8jg����\�;f\�-�i�t�^L�4R��_\�\�\�\�	?�)\�8#\�\�\0�̽{�O���t��t8�m���WSo6\�\��I;e\�y\�Rf�\�Y,�|�<IH\�\�[\�V�\�иE���\�\�)~�Բ+\�ĺ\�ƍe)o\�m<z\�\�YE��̜����Ʀ���\�m<�4x:o�;,��Z����G�_5k\���|�\�_�\�g�}:-q\�MzAتx����]�\�ݺ5����۶m\'�}�:������*p�qT�,Yr\�\�=z\�|7qRB\�Ο��\�\�\�3f�+�t���\�_�zu\�\�uJ�<n\\~~u�,:u87��,J�tʥ2J-��\�\�\�\�\�`N\�a�R\�Q_}�պu\�v\�رo߾\�زfa�K�\�q-J\��휡����\�*((�\�o����d)� ޫ <�\�w�\�\�\�N�\�ϛo5�\�ӭ�\�[V\0�>��\�O��\�S\�_��\�+�\�\�ؼf\��\�)_h��\�V�X\�#��\�9׮]\�\�\�6l\���7o�\\?\�z�ܠ7>� �u)�s������߾����Yq\���\�-C\0\�Jy��0[\�S\��b0\�:�\0��8wu܈9\',�d\�\�\��>|��OB\�G�\�OJ_%Jx2|\��)\�K\'N�_p\�H��$!) -\�v�\�Q��\�o\�\�a��\�����n�1\�<q��R�,J1r�Zv�XgmH++X}�z��\�ܙ9\�3��>ud�ңً�+�edm�����=\�\n�-L�1�<���\�5ިzH�\�\�g\�}�|��ӦMj\�~\�L9����7oٹs\�\�\�W\�\�Җ�\��sQ��(�\�.]�\�Vc\�\�n\�\������_�\"�?�\��_g�\�_M\�\�\�Vs�+d�V,��5n7��\�49���B٨+*,<J�����R\�Q\�0U��\�2\�h�l?e\����O�,V\�\�5t\�Pr�yyy\����\�\�n7^xx\�*\�ޭK\�\�:�o\�o\�i�_߮]�m۶	&(-\�RA�WAxp�\�����\�ӟ߾]_]��\��g�mOT�\�\�)��\�\��͸\�\�&\�\�-?�?}�3�}���\�\�	\�HSӭ��\�\��7m\�\�\�\�t\�\�\�\�\�[;v\�\�B�w����zѢE\�[.��\�\�\�R\n\�ܸq�\�4�\�\�z�\�`@�4A\�R\�\�$_!\0n\�-�\�V\� \�@��<kpΨd9�k\�\�\"%:�\0`e�Ƭ�F�<z�\�)\�~2f�_M�\�\�?��\�\�\�\�*�y1�4|\��Ss�\�H\r��$!) �5~\�\�s\�}\�i+�\�\"{�lo!m\��.\�P���Բ\�{b\�p\�Ƣ\�\�j\�ם�\�U_�V~4}����W�����^SS�I�6\\\�$58��x�\�\�\�\��ϝT*\�śڶi&����Y\�\\�\\_w�\�JEeխ憲\�\�X8g���H��߶m�ŋ�\�x\�����-%\�\�^\n*\n\�8�d\0\�L�L��\�\�}g\�:�Y��\�\�\�)���\�\\��Y\�֭[ׯ_�\�o\�\�O\�\�И��I�?|8\�Qd\�w\�\�C;G�۲eK@?\�\�ؼy�*\�\�ϧѠ:<t(��hK���u\�\�\�\�o(-(\Z5jTaa\�1����\�]7������\�k�߽a\�gy��N?�+\�\�߿?))IiA�2\�\r�)O\�\�ɠs\\��?P\�ΩN\�]3+4�\�����\�ӟ߹Su|�\��>\�4\�JV@�<E\�\�\��\�sW\����qE�\�Z�4g\�Iq��\��\�3?\�\���a�;v�ۧ£G�\�\�p���w\�\�~UՅ�nڴY)\�-z߻w����z�Nuu5�\�\�իWy��w=In\��\rBź��9\�\�*\0}A�Պ\�\�\�I!\0]���\��]\0�� y���@\�Q�\��\0`\�܅\�}\�\'.�8g-~<|\�c���݀q?3w���Aq\�\�Cƒ\�\'\�O�_���$!) �6z~��:��K\\�Tw\��;�<B\0<W�e��\�z��YE�W��\"�U�+��kNw\�̾\��IG�/Y>�g\�͛JE7\�g-?�+�*/��:�\�\�U\�՞_xpve\�\�\�\�\�UK_k�q]�hkj\�a_�l\��{\�5\�]/9�b}\�����\�>�wkՊe�~z㚯/�\�ݻ��\��cǎ�\0(��F�G<�� \�qT,X����\��/Q=-�nӭ\�g~hi97(~\��g\�\�F����k׮-Y�DiA�\�)N�8I�\�\��\�\�ؓ�\�\�\�G�����K������T��t\�/\�\�\�^����eSk55�X���\0�{�E\�Ǐ/\��&퓋\�)U�_(P�;e\�	�6M_��n\�\�����T \'\'g\�ԩJ��A\��l\�\�3S;w�o\�Yո8���\0�#<׻LT\"��;TFv�~�vcS\��}K~�\�\��\�i?�)\�U\nx+\�)�\Z�N\�\��6�\�=\�\�ȟ�\�	���\�\�<g͢����\��♚s^\�\\#G�\\�bţG-D]]\�ɓ\'kjjh�R֭[�\�W_�����{�._�\�G}z�檪��ک�r�\��yד\�\�0i\�g�A�.e~N��s��ڧ�\�\�[��\�*�e�zvH�f��7��\�7�[z\0pd\�ç��ph\Z\�/�~\���&\�[?p¢��e��B\��\�\�\�OI_:|\�t�$ʓ��<�<�ڨ�;Jj}\�`\�\�ڞ��B�U\�\�~�y*��J-�<&\�7\Z2\��\�j\�\��=\�\�<ܧ�8cuz��\�\�|+c����[J\�O\�~\�?���=�����\�]i�\��wk\��J{ߏ�ךz\����|�Ia\�\�\�kGo^>����i���\�\�\�Xw�vcա}�)���J���v\�\�C\�\�\�L�\�[�ŵ}��*-\�rչs\�~�������ѿ�\�\�\�2�Y\��\�-z\�_�ƍO�\�_�\�[�\�[�\��\�\�\�u��^��h\�\"�Y��عsWAA!���\\:�\�i\'\�N�DΟR�$]�҂��{�\n���zE\�Y\�%r�O\�k���FFiAQbbb�F^\�ެ\�\����<\�O\��^>������{�|p\�&^�\�\�\�KKKSZ����\�\n�qq�N\�C��8p����k\�W�q\�]\�.\�K>��֣�Qg�\�\�\�8��מ;\\{.7\�8�\�ʥ�/�?]\\�k\�\�\�o\��fɖ�u�F\�\�蕷\�㬵\�W��\\�01=)~\��iJ]G\�\�^��\�ɓ\�>z��\�\�͛Ϟ=�\�\�\�>Q^^\���\�E\��;whzʘ?�{:\�Ν�ک��\�4�\��$��/l��?���>� �u)�s����\�\�#�E\0J\�U�EI)��\����\Z\0\0X�z��߰�/&/\��\��v�����:��\����is�K�=qڼ��SDR�(O��\0�\�k�\�o8Z\�S�C\0)k��nД�9\�\��W\�?@����/�Pn�!�[\�\�\�I�trTu\��\�gv�\�\���o�?6\�Y}��R��U6\'].G\r�\�����wpߖ�wo\�\�\\\����s\�Xʪ\�w��RA�w\�T��\�4#?}rGv\�\�m�v\�\�mi��}\��\�\�\n\�\�8p�\�E\�-+;�\�u\�\�ݻ\�\�o޼�Dζ����\�h[Tt����~���7\�Nh!�ٳg�\�o��\��]��\�ZZ�\�d\�\�\�]����\����|��S\���r\�[�\�ӵU�(-\�r<Ŗ-[ȨsCN�?+k�����{?s�<\'\�0��t\�J���\� �\Z9{��WU\���r.Y&�ES�N=��&c���WV�<{>�\'���6�1n☉3\�M��1+�0/SXXH��� K�V�\�;3�S\\&�[�\Zǿ!\�Yv\�gM\�<�\�ޕ6��\�B�\�B\�\�L�)\�{<ݱ�\�F���\�&\"5�@\��\��\�zd��\�d�~\�\�\�/~��ꋊ]/\��\�I�%�\�6N����\�TW\�x���sS��;��\�\�x\�\�7_\�Jؿ�ת\�>���빣�\�~�\�i\�\�ڸl\�\�\�{UT�+\�\�\"{O�s\�Γ\�\'�O�\�cǎgddTW\�P\n�}�?R���-�\�D}}=58t\�\�7\�|�̙3�B;\�\�\�<�ڵkT��]O�t�O\�޴�\� AP�K���|��Z�\��5�\�-�a\�C�9@���o|��i����@�N=\08s\�FSߡ3>\Z�>g�֖�f�\�!2l����MLK����\�\��!cDj�(O��\0�P���V��)�!�q\�w�������о,J�tʥ}��]�kRSc\�̄ΫR__>��\�)\�\�Τ�\�~�\�܁7\�N�nf���s�\�c�[>�Ǌ�/,M�C}��̌ί?�׷�\�x�\�l�zE\�[>�?�7�Mʋ�~�\���릯\�ޛ_�5kOSݡ#E\�Wl;1gS�ѣG?��Ӻ��J]G)!\0�֭[Of�<��7�C	̚9scڌ���u�ל\�����\�\���\�\�^{�8i�Ń;k\�,�1�Fߟ]\��o[_�\�y^p��[�l\�_\�\'�ϯ��x�b-�ڗ��Q�\�+-(ڲe�Q�DMQ�ƘЀ\�޽\�ȥ,\Z=�E3g\�,�X�\�\��\�/듶���m���oN\�lL\�x��5;)���\������*G�\�_\�\��\�i�\��)-�W�k(��Pk��\�;<\�؊\n��0�\Z\��K���2�\�#\�M���G\���\�\�}\\��\��\�<8\�\��\�w\����\�ox�\�\�޽\�����\�NA:�ծ9\�-�����O\�\�x�!L\�\�!�\��9�\�{FnZ��|\�ؤQ�9\��\��7n0\�СCd���\'\�ܹs����\�#��\��MMMW���\�eee|����\'\�\�\�\�\��]Orl�(**�<y2\�\�\�i\�A��X�2?\'�s�B��7䓘�b-HA\�\�\�!\0\�2���?�O\�Թ\'\0\0Wj�\\{�8u\�\�\�IBR@\�1r\�\�\�2���x\�\�\�\�D�\�\0dm_>�\�\�\�Y\"Uz��`\�w�z\��m_1�b\�W\�\�/�\�[͍o���Ӄ���Ǝ4a���5Y����\�e7\�(\�:p`\�\�\��6��2e\�\�)�G�+`������N��۶m!���z\�ڵ�7\�L���g�_�e�_�͉	�����\\ܿ�6gӡ]\�\��q�{�z�?\'����oԱ}��Id\�ϟ��>\�\�\\4���K\"\�\�g\0�\�\�\�ݛE�����ڬ���ۤ)���M�6)-(\"CrN\�X޾�\�\�\�o\�#\�\�^�\�\�صW��s\�빇�֜*<v���8�D\�U�꽵U\0r�ݢ�\�(�Jʎ�;�����\�\�\�N�|�4W���keV���z\�+\�q/\�{G�t\��\�\��rG�\�n�\�\�\�l��\�\��*�;>w�\�u��\��\�\�w6N}�z\�Г\�\�O\�wl\�\�\�&\��\�K�����5+}\�ĉ�\"綟�q�!##\���A=R�\�]\�\�\�Xk\�\�_�\�6\�9{�,O�\�]�t\��]O�7x\�̙\�ӧ�\�\�\�w\�\�)���*m}6A\�R\�\� �\0\0\0.(O��\0�P��s\�\�:\�S�C\0_\�ߐ�x\�\�\�t�p̯��\�}J�tʍH�\�|iޮ\�ܞ\��Qu\��\�\�\��\�_�޿ilU^j�͗�\�VsS�_�\�\��?5�e\�ȁ>͘�\�p�P󍓕e�\�g{\��}�\�\�\�n\\��\�r��\�3\0�\���\�\r90m\�T�O��\�͘1�WFt횽j\����\�K��_��\�s��v��+�9G�\�u1�{\�\��׬�3�d9���G�=+k\�\�ù<\n@W\����E��T^iA/\�\�gg\��֨ͼ�|j��%\�Yx�C�r���t\�.^]42u\��\�]�_|�\�\�mM\�Y��\��\�5c��<g\�ֲ��\���eD�^\�(\�\�n\�\�R\��J�҂��\�\�\�\�{@e\�a\'z�ܾv){\r{�\�=���\�]\�\�{\�\�\�߮\Z����D�\��\�g\�?��O�Zy���\�֦���_�qƗ\��&�6{\�\�\�>\�\'�wfk��oL�\������Ξ=��\�/^��\�ݻ<@\\�v=\�G\n\�W[y��,:~�\�l\�Nm�����4H\��\�{��9�CP�\�!�b]\����\0\0 2(O��\0�P��sS��)�!�Og��b\�F��\�\�:�_TZx�l]\�ڧJ�܈�\0v~7�ҙ��#�.ĕ\�}�\�\�\����\�\�3�K\�j\r~�\��\�\�\�\�����2>EM](����\�\�?6����\��\�۷a\�Ƒ#G\r0`\�Ow��>q\�����g\�^\��7n\�\�@Quu\r�a�[\0��q�Y�����|\�ƍ�>��R\���\�\�������_\�\�\�_f��n^:[~\�\�.y\��Ϡ~	��zNV�\\ϕ�{�;\�u2�F\"��)-\r�7\�\�\�\�\�ܹ�ڤ´=u\�4�F���Aj��_@\r\�ۗ]TtBiAѲe\�ș0jj�$��}\�k3\�/��\�\����n\�=[ZQ=je\�ॕS3�����\�wJ��A\�c(��w9��\0�W�m_0��\�(��\�HTv�\�\�A��^Py\�I�#ͷ�O}?\�7m\�\�\�_\�\��\�\�?���\�[\'�u\�QO\\�����0C\0��U\�\�[{j۰u\�z%�\�\�����G�N\�3\�\��yە\�\�*,<:hРaÆ�[�>;;;�G\n\��A�.]\n�yx�x\���\Z\�w=\�\�\�ɓ\'Ǐ��\����\�I\Z>� �u)�sB\0\0�Ƞ<IH\�\�C=F\�Mڐ\�S�C\0��0{����&�_Ks\�\�کs�\�>�P:\�F$�2�\�\�\�5\�>=��݌p�?ieZ\�+�G\�\���\�.��w�n\�\�\�\���OiM����g5�\�#G���\��#F�X�diUU��c^�\��Æ\r;vluu�o\Z\�\�\�\Z!\0��\�n�\�\�K\�{\�Ks�Oڱcg}�\�\�\Zt\�\�\�\�\�ׯ�\�G|���w\�ر\���\�_���HΪ��\�b��\�!Ծ�\�ݟ�>}�҂,\�S45\�Z�~�\��s�/�\�)$J�ˡ�J���ooڴ��|���\�1Z�rJ7oR�j#�V�\\yI��\��oS��,\�>�{l\�\�Sq駗\�:[|�jȒr\���|\��gϞ]�n�҂,e\�{�Cޛ���\�_K��D�l\�-v�E\r:񸁁�Mj�pl\'�\�>\�*#;\��1r����\'\�\�J��6�\�\�%�gO\�\�T,�\�\��I�G=q�v\�\�ۇ�B�>�O*\�\�U���l\�;\�v}}b\�\�q�^N���\��J1?�\'Ʋeߌ\Z5*\�G\n\���\�O?���\�w���y\"��\�\�j\�w=ɱA\���\Z>� �u)�sB\0\0�Ƞ<IH\�\�C=F̝�}�O�ĥ��t�2���O���:w	\�Sʧ\�z��?p\�ā��C/�|\�\�\�f�\��W�;��\��K\��g��\�3o����;w\��\�]V�\�%7�|\�\�_%صk�s\�=7R���+�\���5F��nE\�Yr��S�N���Dعs\�\�\�u\�\�qT\'M�t�\�Տ$>��\�ݙ[��\�~�W\�Rƞ_<���n\�O�M֟~}��\�\�)S�d�\�8\��-[�\�\�O7Q.�\�\�*���jjj7nܸo_�҈,j�F\�\�\��J]�����:�L^\�gVI�\�\'\�fӶ��\�\�6\\�r���\��\��A\�U\�\�Ce\�a\'y?Fn߾�y\\�\��qh\�_o�򫊣v\�{�\�\�\�Gn��-\�!���Rא�)\��\\Iά\�o|�V�35\�\���\��#���\�߾4yꩧrss�NQQO<{�\��\��$\��\� AP�K���\0\0D\�IBR@��\�\��ӿ��kw)\�5z��\��Id�\��\�\rJ��:��W\����/\�\�8}賈�ҶcN姞-�\"c\�+������,,,<u\�\�[o��iE\�Tّi\�\��y��@v��^xa�\�\�cǎU�Q��/�6\��\�\�{\�\��C��c\�\�K��x��㨎7\��\�\�g4\r\Z�}�v�����۞�\��Ϲ��\��\�_\�\���G����\���\0�\�\�NQW\�L;�ӵP���\�M��hpӦ\�\�\�%J-Gmܸ�ʕ+\�ad.T_�tҚ��\�}0�D\�\�}\�_^q�\�\�\�\�ܹSiA�2\�\n\�C}w��<\�$\�\�\�\�[\�\rߏ�\�\�q�w\�\�\�\r7x:��]צﺖ��z��\r?@�:vv�W��AG}\��#���\�9O>�\�\�Ç�\��\�\�y\"�\�\�\�ʼ\��$\��\� AP�K���\0\0D\�IBR@\"cy�\�y�����Tw;s�f�^�r�^�e�\�\�����Ӿ|�\�\�ϖ$�q�\�TEŹ\�\�t-�.]���z�z\�͛MͰ��\�\��GQ\�\�E��\\Z\\�lٷ�\��\�#�\'\�T�fS�YS4n�o�/_��\������}x\�B�Q\�M\�#\�s\�\�?˶����m\�^UU\�\�⯗�[���Q�\� �O[��;z$�\�\�#�9�shK���lٲC��~�\�\�UU]�>o߾#K�i\0\�\�>��]�\\�|@\�\�\�nݚI#�4�c\�Nj���J���\n�\�\�\�_�t��Ϲx�\"y���r�߰=+��Luu5\r٤ӧ\�(-\�RA�WAx�\�����\��j�u�\�լ%\�U[�9}�/\�v�$���Z�\\F���\�\�\r\r�W�^����+u�\�~?\�.j�jѓ�Z�\'=[\�	C\�@z��>]�~��^�>�\�$\�]\�Ayy��U��\����7A\�R\�\�$�\0\0\0�Ay���\�\�\�\�[&�Z2��C\�\�)((,*:YVv��6\�+W\�oܸ\�G���g-L\�0�\���y�Ǐ�(-=E\r\��\Z�	�\�s쓛\"c\��v\�\\%��f\�J\�|F\�\�Q�\�\�\�\�\����?�Gڿ�\���}\�\'5�\��Ç�,^�d\�ر#G��\���\�/_�����\�Gt��/\�q\�B\�B}\�\�MdȨ\�ܹ\�\�\�c�~\�B����\�\�P�UU\�\�\�Hg\�\"�A\�n߾�n\"5HY����ܻ�O�:�gϞ�\�\�\�\"�S]]��\�!�^\�!��;TF��E�ݥk/\r�0�\"�Ooyzc\�۟&:q���;�����H�b�g��\�@(~\nz�\�ӆ\�Ȥ��\\?\�Ј�\�\�\�1ACR\�\�$�\0\0\0�Ay���\�㧛7�\�s]�z�t\�\�\r�744RM��{H.�|G�A�)j\����p�&�\�^�v\�h��R�X\\�U&\�_䫕|��O\�p��\r\�v]\�UE4\\J|$�\"\�\�\�\�uT\�?~V�\�U\�\�Ce��Y\��{�z�o�,���;�\�ur��/�cWD��.]����eO\�}z�\�+��ӉH\�3���*vE�]\�f���X�2?\'E>0\0\�ox	\�IBR@��\�{�>\�\�CAP{I���Z% �\0\0�)@AAP�K���\0\0\rB\0AA�R\�\�$�\0\0\0A�\0AAE���9	!\0\0@\��T\�>t]�ǽ�o\0\0\0\0\0���9\�W\�J\�\�ًV\r3u�\�y\�vx��\�p\"@\��ɓw\\\���\0\0�\�qB\0\�n߾\0\0\0\0\0 zP\�\��!�KW\��L�0��\�\�i��p�:�\�\�\r&�YR\��\�\�\�7��-�o6�\0\�Q�*\0�-\0\0\0\0\0\0Q�2?\',Y��lN�qڿ{�޴\�K\��\�E�k\�8\Zl\�x�\��\�l!\0\0B�\0ܶ\0\0���\�).S\��\�vN-\0\0\0�e~N\nHL[8hx�8�\�윂	�rN�c�!\0n���\��\0�/�c	.)�5\�bZ:+�d�H\�*�:|Wm���ښ�O\�e\0\�`�\�6�\�O�ΏF��P\"�c����L\�+ڒ\�\��1\Z��\�n�����K�t\�\�K�<}P��<�s\'�\0\0\0m�2?\'\�]�Z�\���tXz�,?�c�\0��\�x|���n��2��\'��\�,��\�?�	s��`oS�d\"ҍ\�EK,E\0\0�Dy 7�g�.]�[/�\��\�\�۷ͩ\�Y�Fŕ�TN\�\Z�\�9�Ys\�+;�\�K�G<��\��\�tϮ�\��a�\�Ș�P�\��\�\�\�]\�\�\�\�|�\Z\0�Ѩ\�\�\�hMm0�o�6\�|�\��\�w~4k\�y�g\�\�\r��\�K\�9\0p?��\rK�޺�<�V	A\0\0\0�.��9)p��ly�!c���~k��?.e�\�/�[�8p=X�U2�Yk1�\�w(�\�8�i��\�0�\0�%�C\0\�u\�\�3=��~B\0\�g\���\�\�K�::t]ޞ߾ը�#翦N1\�_\"M�)7/5��Sz�e~\�:!�� �MTl\�.Jv}\��]���to!�o��qq�\�21}ɂڌY�\�MAu\�1\0�譆\�}\�C\0+\0\0 \�P\�\��!\0���tȘ�d�I\�\��|\�䥫6�EB	8�:r\"\�lSMA \0\0�Dm`�0n�Y �O\����F�\�4\�^����C�\"C\�\�\�۷�!�b\�eJ��ga\�\�\0�\0\�i��\�ud�G#�m�\�[�4\�\�\\�}ɂ�\0||�߰�q\�OoU�#,\0\0�(C���|�\08��\�75ߺ��\�E�$L��l�c ���\�\�\n�ݮ3���3��6�\"#\��%f3\'\0(D�*\0�\������\�?0͸G�\"C��\�\��۷|	��\�_\"s�\�e�i�@��\04�\�xغ(گ�q����\�2\���1\�#Ut˲�@��vD��n�]rh��˭�^�q�4~N\�9\Z�U\�p꘸���2W�/\��9\�\�\��%\�B\0\�����w�T֖\��\0�P\�\� B\0>��t̀�I[w\�I~C\0�\�\�숹qkf1a\�-��2|ߞ+��X�\�\�5O\0P\�8!\0o�o\�2�]W��/�}���ҒN��/�i@����`����T�\�\�a�4\�cVqϲ|.\�8�}�\�\�\�\�.94\�\�e����QR�(�kO�\����t�%�R\�\�%WaY	F\�M\�FL_��)\�\�\ro�]d\�]�@8\�F\0\0\0\�e~N\n%@<x�pw�\����c	Go\�v������ylB\0\�H#O�[�/2t躼=�}  ����l\�\0������3���b�GnM\�b�\�\�\Z�7�\�f�B�\�\�p?�\�\�J\�O\�\�>��x\r#@��;��b�Z\�#ߦ�\�ZL3�\�!��_��g\�1y\��+�\�F\0�\0�F6,�ic{B\��@\0\0\0\�v(�sR�!\0\�/`�*\0\0�*�M��\�y���5~/�v\�?\�\��\�[�g���_��\�a�\0�m\�4���\�G�`M�֔�{\�|���MTh�\Z.\�r\�ݦZ��1�\�k��a��b9Z\�R\�u\�\��Vz3\�7�\�\�,\�\�%\�I���n ��\����6\0\0�\�B����\0\0��xlB\0�\������0�\�?\�~&��K���\��q�m��\�\"��\��Z��(�0\�,�5�M\'�K\r\�B\�6\Z.C\�5P_�ɣ�V(F�\�eO\����\�\�%\�k)b�\0�~@�	\0w�O\��\0\0 �P\�\�$�\0\0\0A\�qB\0\�n߾�/�;�Q@\�\����d�\rC\0���mݲ/l��\�ٝ�쵘?yǴ(\�P)�Oe�,աI0Q.ݰ\�%3��7�-\����7?\�\�FC�(\�(z\�\�h�n�\�(���Ɛu`uz��)��d\�U\�\Z\����\��]��\�@l\0\0\0\�e~NB\0\04Q\�M\�\�\�Jמ\�\"3躼=�}�c����|�O\00�\�h\�\0�\n��W��BFs\�h2��fQҽ	XK. \�jv�+}/+cZ3�\�[�\�\�YL�K7�\�|^2��\0��s�\�JY�̹��V\�\�m�8N�!\�K��\�Fɭ8���5���d9˻ް�\Z٪���\�+\0��/r9�\�w|; \0\0\0\�2?\'!\0\0��_1�ݾ}@\�\�-�8\��Ɓ7NA���,\�\�1\0�\0\0\0��Q\�\�V	\0\0{\�^By�����e躼=�}@h \�\�x��\n\�� ,��\n\0�\�\Z~&\0\0\�e~N�|\0\0\�1Q�$$a�co�o\�>����M\�3\�\��\�G\0c	=�P0S\�;@\�\�\�\�;\0\0\0О(�sB\0\0�Ƞ<IH\�F\�2t]ޞ߾\0\0\0\0\0 JP\�\�$�\0\0\0�Ay�����e�ݾ}\0\0\0\0\0@��\�\�I\0\0\"��$!	\�\�uy{~�\0\0\0\0\0�(A���\0\0D\�IB6:��v��-\0\0\0\0\0\0у2?\'�J\�ѣG\�\�\�e�+�\�9z0��Pn\�\�S7)K\0D7\�i�By�����e�8�\0�ǃk�!HT\0\0(�sR\�C\0MM\�Ǌ\�W\�\�_�\�\�t���6�v\�ꯟ��\�>�w�&\Z\0��\r\n\�IB6:��\�\�C\�s\0\0�\r���)Q\0\0@t�\�\�I<z�\�؉қ�\�\�n4\�]m�R\�r\�u\�\�\�더u(��\�Ç�\0 Z!Oʓ�$lt۲~X\�.\Z]��L\��!\�\�!�-\0\0<(\�ާDe\0\0\0с2?\'E>Pp����U\��\�x�>\�`��\�*3�u\�`3\�\��γ\�l�ڠP�$$a�ې\���]��7�Î\�u��\0\0\0\0\0 zP\�\�$�!�1i�ʫ.�O��(;~�\�di��\�\Z2�\��\�\\��8W]p�$��\���QT!\0\0�	�A�<IH\�F�Z@����\0\0\0\0\0\0D	\���\�7У\��\'�-\�\�\�t[$�p�\�9���\�\�\�V?Yv���\"`n��E�g\�W\�hh\�\�;.�* \0@4A�6(�\'	I\�\��\"!\0�.>>�\0\0\0\0\0\0D\���\\�D;\�\�\�\��e~�z��\�f3��\�n�U\0j�\�\�\�Q\�#!���n�4$�N\�<�S|�HrJ4~V�H5\�h�\0p�<��>�@\�\�P�$$a�ۉ�|��CP[\0\0\0\0\0\0�e~N\n:�7|n��r�g�\�X	Y}����{�E�cם9\�x�k\�|\����\�\�|�y�7�D-�\0�3dh\��sı\�IB6�]X?�K�.\�� ]\n�[\0\0\0\0\0\0�e~N\n1��r\��-q���\�XIŹW\�\�74�@m]��\�\�\�{�\�\�\�>,�*p�.ȣk�]N4�\�\�\��\��;��S��\0.���\�_G�J(O��\�m�\��\������\0\0\0\0\0\0D	\���b�חiY9\'D��cŧ�/֝=_S\\V��8�\�ġ#\�\�=�_t�\�̵\�7�s�EQG�nw�Y\�\'��2r\nB\0\0�������{�(��$!	\�\�h_\0���\'\��P�\�\0\0\0\0\0=(�sR\�!�W>L\\���\�{�D��%\�޿\�\�\�\0ͅ�\�\�\�\�)Q��\�eĮs�\0\0g\�\�\Z(�_9\�(O��\�mID�?�\�!�-\0\0\0\0\0\0Q�2?\'H��\�\�\�\0s܂\�޿�u0OU`n\�@��\�L�L4��G\�\��9\��[\0RS\0\0\'\�\�\Z\�\rT�\0X\0���0\�t]|(|n\0\0\0\0\0���9\�o`X\��S5\����\�\�܂���\�u��\��8W]Trfw�\�\�EQ\0@C�6(�\'	I\�\�X��CP[\0\0\0\0\0\0�e~N����MǋOe\�\�\�ڗ�3+g\�ރ\�v؝�[XTz��Y\0D7dh�By�����e\��P�\�\0\0\0\0\0=(�sR��\0\0\0�\�i�By�����e�8�\0\0\0\0\0 JP\�\�$�\0\0\0ΐ�\r\n\�IB6:��\�\�C\�s\0\0\0\0\0@��\�\�I�x�\�Qsss\�\�#�E9G�\�-<�[x��\�\�\�F\��\0\0\�\ryڠP�$$a�c>Am\0\0\0\0\0���9)�!���\�c\�\�j\�\�hl�\�\�|�D;u�\�OWTfʻy\r\0�\n��ܯ�$!	˸�|�-\0\0\0\0\0\0у2?\'E8�\�ѣc\'\�o�]�\�Xw�\�J��\�u\�I�C�׮7R֡\��\n\0�hE�{�V�$$a�c\Z7�\�\0\0\0\0\0 JP\�\�ȇ\0\n�\�^�ʝ�]/\�g\���u\0�\��\0\�a\��A\�Wy�����e\�|�\�\0\0\0\0\0�\�A�����\0Ƥ�*��$<9z�\������\�\�*k\��s\�_s��\�\\u��\��s\nDQo�@V|\'�X�GV,\�\ZQDR@�s\�2�ʓ�$lt,C\�\�\��ݶ\0\0\0\0\0\0D	\���\�7У\��\'�-\�\�\�t[$�p�\�9���\�\�\�V?Yv���\"`n��E�g\�W\�hh\�\�;.�z\��+B\0 �\�\�\�~�\'	I\�\�6$7�g�a\�Ezȸ�|�-\0\0\0\0\0\0у2?\' \�κm���~���\0�^kh�\�L��굛|���+5�u�x\�{ +��\\�\�]-;��ݴ�Y��\�oպfI���4\nJ�X���a�i\�\��+�x�׻��-�TF)���ƾC/j$�\�0\�\�s\�2�ʓ�$lt{�~X׮=\�s\�Qh\�8��}�-\0\0\0\0\0\0Q�2?\'\��>7�D�ȳRp����[\���\�=����*\�@%�\�ܩaS�Q�J\�W԰\�5K�Eu�*�fM�fY!�g�D{\"MԴ4��׻���#z)V.\�RϬh/ciӻ~::\�\���ܯ�$!	\�n�@�\�|�\�\0\0\0\0\0�\�A���Bp�\�x@dK-*-8VRq\�\���\r�\"P[W~������������\ndBe\�iXQ���g��\�u���]��\�Pأ��IQ��\��\�w�6S�\�-X\n�˶����\�\�:��|O�\0:4\�\�����$!	\�N\��{\0{\'��}�-\0\0\0\0\0\0Q�2?\'�\��eZV\�	�g\�X�\�ug\�\��U\�+\�-8q\�ȱ�G\��(9s\��\�\�|QT�mB\0���ѹ��Wi_N\�)�B~\n\�\�ء2¾��nYj5��ܦ�}3\�سa\��A\�Wy����n[���[\0��\�w\�\0\0\0\0\0=(�sR\�!�W>L\\���\�{�D��%\�޿\��s�Vo��v�j��ԵW�x{a{�}�<%�\�\�3��z�%7a����\�DV�Q\�,F�\��E�SK�Autt���`\�IB6��`\�\0\�\r\�8��}�-\0\0\0\0\0\0Q�2?\'H��\�\�\�\0s܂\�޿�u0O�\�,��P�\'��Uٮ:\�u�,\n���\�R\n\�ʘI\Zz\Z�!�4k\�Д�䯰�mC�.`�\�Ck�J:�\�0\�\�s\�r�ʓ�$lt��w\�|�\�\0\0\0\0\0�\�A�����\0��,?UQ#<���\�-(�8_]Wo�-��s\�E%gvg>{�Z�Q���܋`\�A�!̽?\�\0+O��\�\�G��H\�\�\��ݶ\0\0\0\0\0\0D	\���\�77���\�\�\�ߵ/ggVΎ��\�>�;;����fc�(kH�\0\� \0 /9\�8}*�\0h%����_\�IB6���\�t��n[\0\0\0\0\0\0�e~Nj�\0\0\�1@�{�V�$$a�\�r���\0���  �\��\�\�m\0\0\0\0\0���9	!\0\0�3\�\���ܯ�$!	˸�|�-\0\0\0\0\0\0у2?\'�J\���W\�\�\�o\�1k�7Sf.LJ���6�\�\�j.\�R�(\0�n���`\�IB6:��qps�n[\0\0\0\0\0\0�e~N�|\�\�\�+��u\�Hٙ�/]�\\w�T{�jɩ�[vd�ON�P}Q\0D1\�\���ܯ�$!	˸�|�-\0\0\0\0\0\0у2?\'E8�\���%߮����8��L\�ɲ�\'Jϑh��tU���\�\�R\�ܻwOT\0\0D+\�\�����$!	\�\�8��}�-\0\0\0\0\0\0Q�2?\'E8��\�\��KV�\�\�߮�\�\�$͈��\�\�\�\��0�� ��<IH\�F\�2n>\�m\0\0\0\0\0@��\�\�I~C\0\�R��\�bט�U��΢o\�/]�~պm{���q\�w�l\�\�\�󗮙��|Ҵ��hk\�\�\�@�\0t<���`\�IB6:��qps�n[\0\0\0\0\0\0�e~N�8UQ�B\�	v�W]%t�]������m�,[�~\��o�\�\\�6g\�\�o\�\�ޗ[y\�\�\�\�KE\�\�\0!\0\0\"�0�� ��<IH\�F\�2n>\�m\0\0\0\0\0@��\�\�IA| i\�:\���-\�*�$�]��\���\�.\�\\!\����D\�ټce��N\�-�\�)�\�C\0Y�8\�o�\�G�\�D���\��풃��hg�&�V<>�\'�\�fX\��c�0�� �<IH\�F\�24nn\�m\\Ɍ\�\�9�\\X�\�\0\0\0\0\0��\�\�IA�\0�\\mx\�\�D\���\�\�\�t[\�I\�]�\�Ha�[\�\���#&\�EU�\�MS�	�]�o&[���̾�o\�13oԐrE�h��\�y�	�\�~z�c�0�� ��<IH\�F\�2n>\�m<(O\�\�).SX�\�\0\0\0\0\0!�\�\�I��\�ʍ���m�\"\�\�\�o\�\�[�f\�ޜ�\���jy\�\�\�\�m{�zˈI3\�OE\�]O��|��A�#�2�W�\�\�{����}�\�aiya��\�0�� �<IH\�F��\�=�t\�\�u\�zq*4nn\�m�C}j\�ѝ:�\�Zϒ�qRS\�l�\�oV\�ZX\'s���T+3�Ӎ\�\�\�S\�)W�i\�Zj��S��Pi\�\�y 2\���U �}�,\0\0\0\0\0&\���\\\�\�{��L#�7|\��E��ū6\��\�\�wd��s�N��|ʬ%�iS\�~�\��\��\��\�E�\0Ǐ\�\�^ݲ�\�9\�ʉ\�\�\01�0�� ��<IH\�F�=�\�=��\�ٳk�!\07�\�eh;�TqGm�ev\�\�s\�C\0{a\��D\�\�Ѭc�{Y`����\�O��|m�?\�(\�zd\0\0\0\0��Q\�\�\�B\0DVΉzO\�?\�:\�[�}��oLM_&��Xc\0Y��6\�e\�\�̨\�\��E\�\�)\�]\�3W�gЎو�g��\�\0�\�\�����$!	\�\�h��\��\�\"�qps�n[\�\��?�gw6Mu\�C\0q�ٝ��ŕfƵM��80\�0l�}��G\0\0\0\0\0�\0\���t�X��\�sb���d�\�B\0\�*/�I�%�\�af\\�\�5�\�\�\�8�ѓ�c\��m?ݯ�� t��c\�{cO/A��	\�^�X ̽?\��*O��\�m\0h\�?\"!\07�\�e0_m	XRZ!�I[f\�ɓS\�m`Ŭ�\���\�2�\�/�yd\0\0\0\0��\�\�I��\0�9�{4m޷;���:\'�����߮\�:|Bڮ}�EQ\0@#̽?\�\0+O��\�m�i��g\0��\�X3�9gYfI�α`)d�5�O�̟G$\�\�C\�o8�	�`��k\�}�G\0\0\0\0\0e~N�|���xi\�w\�O���\�iC\�L<2yа\�a\�2�}_}�(4\�\��Ƈ�\0�\�#̽?\��*O��\�m�l��h�\Zp1\�^�c/@�i�X�ݹszg\�\�\\���p\n�\�*\�0̾\�\�{d\0\0\0\0�0P\�\�V	\0\0���`\�IB6�Ͱ��(Z ��N@\�\�ͶI@\���[�&\��Y�\�\�\�\�{d\0\0\0\0�0P\�\�$�\0\0\0\�s\�r�ʓ�$lt[A���=\�sE�\�q��n[�\�ފ?h�\0Lد��A�\�B� \�ݽf�-=�\0\0\0\0\0@8(�sRT�\0��/�bx�]�iE	\0@�#̽?\�\0+O��\�\�D��\���\�\�#\Z`�;�\0,�ϷR�~\"O2\�/�i���\�{d\0\0\0\0�pP\�礨$��:xD�]�.J\0\0\�a\��A\�Wy����n\'\���\0\\6�l9Wr\�j\�N��g\�ۚ\�ky�\0\�j���\0�kYC\0��eŁ\�}s��G\0\0\0\0\0�\���!�IS\�/�؟{��\�4m�\�v\�\��ʢ\0.,\r\0�m\�\�d��\'	I\�\�X�\��\�\�m��\'�xd\0\0\0\0��P\�礨$�η�\0\"�4��S���\0\0\ra\��A\�Wy�����e\�|�\��@>\�m��G\0\0\0\0\0e~Nj����\�=��\�5&m�(�\�\�32�Ne\�>t(�$m)ں\�\�\�\0J�8ST���H\r|=B\0\0�0�� �<IH\�F\�24nn\�m\0\0\0\0\0@��\�\�I�8UQ�B\�	v�W]%~�a\�̅\�폟\��T\�l#0>%]TS���\0$\�\���ܯ�$!	˸�|�-\0\0\0\0\0\0у2?\'�\��\�S�ڒ�\"Ocꬅ|�\�\��G��\0�8u���`��Y�bE@��,v\�r\�\�\�z��\\��-�Ʊ\�\0a\��AXy�����eh\�ܾ۶�~AA��hj�\�\�Im�r�\�\r�ߣJc\�m��1-}\��Ҋ\�\�\�<����\�\��!\0��x\�陣׳�4�\n\�	�O�lO�CTf\�ۛ\��G�{��U�$$a�c7�\�%�\'/AA��hj�\�\�Im�s�+70B\0\�\�T�\�9K�\�$�\�w�]@J��n�H�>OTSPB\0\�2\0=`\�\��\�H�Q��\�x�\� \0a\��AXy�����eh\�ܾ\�Vy�BAAP����\���\�F!���\���2��\���<�VZZZ\�h,�7\�I��E\�\�3\�?\�\�S\�\\\���\�g\� \0:(\�\���ܯ�$!	˸�|�-�<y!� ���\�Nv��L��œ�\�*��؋��\���\�F!\0\"+\�\��\'\�p�\�\�---\�\�*�\0&O�����+u\�RQAA�񲷷�Ȳ��0�g\�NV�q\�\0\�qG�{�V�$$a�c\Z7�\�U��P�(o\�\�>�\�g\�A%���4I\�����Xe��֪\�4�\�\����2qSۏ�K�ia\�up\�/\�ݯ$>ފ�K�t\�\�K���\�6�-=�U\\\�i\'��\��\�tz\��\�/zn��C\�c-��*�sRۅ\0���=\'ZZZ�\�TV�.���zu�=\0��Z*�wo�\"`\�\�!\0a\��A\�Wy����nCr\�{v�\�ڵgz�\�\n\r7�\�%�gn�Ĺh\�\�ճX<�W�5I���6\�q\�\�\�Z/W=i���p\�e-7P�Rԛ\��h\�=K�d)��\';,3�.kD?�\�`\���Ħ\�}zm�V\�#/6/w���t\�\�\�?���I��KQ\0�Z�6�\Z<\�S�%�x�Z\�R\�\�\�z�,u\�\�[&\�\�\��vp�\��C-\�lA��^=tET�c�XGstL�\\��\�\�+ĭAϗ�\�_l�ȥژK�}�\�璍X�M�nhu\�^��z�\'�\�\�\�\�b�B⌚\�҃�Dho[�oU&\�۞��؋��\���Ԧ!\0oZZZ�\�\�W�.�\0�\Z\�\�����$!	݆\��\����=�ٲ��>d/�v\�Pd\�\�8��}����\�fQ\�$f$l\�e�kfƜ\��iQ���\�:ͭ\�S�,.Ȕ���E��R�_\r<�C\�(=9�й}��\�0z�\�`sh\�J݀\�Vi\�\�M�=d	\�v8$\���W������\�B\�~)�׷�\�]�x*Y\"E\n��6�D\�]\��ɮ�j\�(w\�\�R����\�nDC�G\�\�ƥ�-��\�K��&1P�)�n�\�\�:�_�$�wty>��~�\�W>xg��W\�\�5\�\nA@45U\�\�(\n�w\�r]�\0h5����_\�IB6�\r	6�\�҂N#Ou�q�S\�]ڡC��\�\��ݶ=m�q4\�E\��\Z�\�\�em���\��p9\�\�B�<6e�v\r<�\�\\�g1m�\�wo\�k�GA��]=ퟏ����\n q\��M�|n\�.\���\�d�呷�l\�\�\��vp�\��À\�r{m|����\�t�f/�_l�lst�a�q\�\�K�p�-p]�.�wty>�*`�\�˳��\�\��;��\0PMM��9)�B\0\0�\�A�{�V�$$a�ې`C\0�e�\��g��4\��\Z7�\����|.m�(l�\"�ωU\�mZM�.��\\H�\�\�_\�)\r<�\�\\�]�C�\�\rz�ah�93\�\�\Zl\�H[\�k~\�;KY�\��L6-\�ܾ���s�h�\���\�\�Q\�\�\�AK}�I7\�u\�n��.�z;�\�e�סs�S@ym��+Y\�i\�ȡ\�g>͖\�*f=�+�7�\�h\����S{�D{��M�$�,k��D7�+\�ߕ�>�9t�}\�Bn!\0�nx\�\�\��X(!\0�Gi\�_.\��]{�\�#��\�E\�=-Ph$\n9=|<\�\"�؉��\����\0\0�a\��A\�Wy����nC�\��^��0\�\��ݶ��E�$\�ZH\�y�4\�\�\Z�i�>Qs��9\�\�t�C\�%\�Ѡc�d�\�5Y��Xn\��\\\�c\�&v�7N%#mp��[�i�6MSvmo8\n\�`\�V\�#���\�`E\�DΟMI����R@\��.f�8��\��!\0v��C��g3o�s~�	<{\�x�\\\�\�\�О%��B}�$�[,��0i�>ޗ_uvYsm\r��Ĉj�YJ�Z��V7k*�tϲ�\�:\Z�\�=�!:\�$WaY\�{M\�FL_��S��\�b�E�g��\�\�\��X(?!\0\�A\���\0z�D�6\�%�\�`\�a�]�\��2E�hj�\�\�I1H_�r\�\�4o�\��F�\0�F�{�V�$$a�ۋ�út\�\�&\�\�\0����-\�:4nn\�m\�\�^L��\�>M�P�a�\�w�\�9u\�rh\\�`y�\�\�l�q\�1�#��e\��\�kC��Ksnc\nn��\�O?��嫢))�7\�_�\�g�\�|�/f?\�i&\�\����\�E[^n#^�\�z�\�Y\�K+\��Whb�\��\ZХ:4/\�\�i��V�vg�<d��]^.��\�K�\�\�\�\�+ey�нA��,k1\�\����~-\��N(&/Y\�\�<�@��\0\�\�f!\0\��}t!\0�c���\����!��S掚<\�[TF�\0�F�{��U�$$a�ۏ�úv�\\	P~�<\���\Z��D;��t��n[\�\��ȓ\���مu�c��3�\�L.$\�\�\����\�k��U�+�qo\�kC�ی\�c.p�\�=\�W\�C\0\�\�T_�\�/�\�oN\���F�\�GY_l���\�#���\��vp�\��C\�,[��\��\rA\�e���\�cj\��\�m�U�2\�KH3���W���\�},Tq��\�źQ��6\�\�\�b��f/~��E1v\�B�g�W7(��\�c9���\0�B\0�\�MM��9)�C\0---�\�=s���\�$\�\0\0�\�\�d��\'	I\�\�v��2�w  4nn\�m+,�����e��\�T\\\'.l$0�\�Z\�a&�\��+���h0๼\�l�l�܈{�\�c\��f䶙�9;�\�\�޳|U\�s)�� �(\�\�5���(\�|K�OKry\�\�F\�\�\�\�\�\�z��^�6K 5\��+\�^F 8\�\'\�,�˧\�\�\�]�^l\�\���K-w��v\�#K�{���uC-F�\�EN絺e�b뒅�\'	�G7I�n��\�\�c9�|�\0��9@\��\���RY�;�\�X\�tz<ESSe~N����i�v\�\�O����>3k\�w[������\���c�f�\nTft\��\��2����\� ����_\�IB6��\�\0��6�n>\�mK�.��(s\'�b,�\�n{�\�q9\�\�B�<֖5\�%�ȣ��\�\n0\�d\�zr��p�\��&�9�j�Yڇ��\�\�#�\�#�_�\'\�,l��\�^`�8�\rW(#ϲ\��\�\���\��vp�˞�Cv.3����ƽ^_�aɼ$\�-`�\�\�\�]��U\�5#�,U+�\�׋�u\�\�KT>��\"��\�EtI{�KY=T^�\�\�ӥ�Ɛu`\�\�q��T\�\�%�\\5�\�э@��>�*P�?₱\���\0�Oy�E \�MM��9)zC\0c\�V�W].���$N��|\�o\��\�tQAAv\�\0`E�{�V�$$a�ې�ú�$¶�\Z7�\�՟�l\�}\\\�dq/�dEsG\"�;%Iܽ�U�,��\�a&\�ڠ��ɓT\�:��h\�\�_��;\�R\�v|\��F\�\�\�5��\��C9a	��\�n�,�\�Dn@\�\��$c@ҽ�����\�\�M\�{\�\�m�\�o׻\��:��K\�W\�_Q�I��\�-��0�sI�9�ꚷR9��zsz�iX��E\���*\�\�\�ʘ\�2���5˵�l4�b\�!ɱǐײ�?V�,gyw\�[\�Em��,\� \�\���\�.vc\�&�\�^H\�~����\�[[y��\�z=h\�e{��\�V�~c�\�\�T����7У\��\'�-\�\�\�t[$\�hiiIJ]�e\��щ\�o�Ϝ���\�\�\�\�;Y��NH�-*( \0�;\�\���ܯ�$!	˸�|�-�<y!ȏ؇c��>.�[>(\�b6،Ab�\�w!,�:�hj�\�\�I\� \�κm��<---\�i\�g�vM�2GT�@��� >Ks\���\"E�\�,zV</NŌVy�\�,��#�\�G\�n݌\�F\0�>\�\�����$!	\�\�8��}���\� �N\�O\�\�){\�\n!�V��ZzH����\�@PGMM��9)B\0\\q\�\�\�(y:---)32��4\�1�m�\������\���\n�\�hO�Ql\�lV$]ѨGI�n� �s\�r�ʓ�$lt,\�\��ݶ��\� \�bQ\0}�����PL\�%�.S7�O�}\�XB���Έ��\�U5�o\�\�T���b&��r\���\�\�\�2e\�B\�3�&Os�����\��ےhű.\�\�\�,\�,�\�[�gU\0h+���`\�IB6:��qps�n[\�\�AAA\�\"��*�sR̄\0z}���sB\�鴴�L��0\�*�\�\��DG7\�#��7S���+j\�!�m\�\�\�~�\'	I\�\�X\�\�\�m\0\0\0\0\0���9)B\0�|��rほ�\�	-�H�\�߮\�\��EG7Nd��\"�QH.F�\����_d{REs׽bV��\�\�\0\"�0�� �<IH\�F\�24nn\�m\0\0\0\0\0@��\�\�I\�H��\�\�U\�YuKK˴�EW$���\0��\�Vޓ\�\�w5�\�ນm\�1�I\�V\�����݈@�t\0\�\na\��A\�Wy�����e\�|�\�\0\0\0\0\0�\�A����70,e���\Zq\�\�^�|\�oWR\�Q�� Kw;���`\�IB6:��q�K\�\�D\0\0\0D?\��\�:�ĕ\�!Q\�\�\�\r�$u\�\�\�ޢ2�t�\��s\��R*\0\�1D�{<�!\0\�\�\�\��1��O\0\0\0�\�Q\�qG��r\0:$\����!\0\0@+!̽?�+�~���<c\�z�\Z4|\0���\n sMV�ђ\�\��tFi�%ktV\�\�f�Ũ���\�JE�ڠY��/\�\��}\�\0\0\0��\�\� q\�\0tH��9	!\0\0�3\�\��#jB\0�\�=�v\�\Z��7	m\0s\�\�g.\���]�H�\�\�tk\��\�Σ�R\�ő�\�xz���\0\0\0\0@C���b>��p尉i\�J���(\r\0��0������a]{�犃@\�\�*\0\�ˡ�E\'\�o]/`\�%WJ[�M�\0\0\0\0\0\0��2?\'\�|`����&\����\0�\�\�Q�t �\0�o7���Zt��\�{�!\0vFq\n�\0\0\0\0\0\0��2?\'\�v���e\�Թ\�\��\�5&q��\0\0��0����\0����\�u\�J���4\�*\0ަ#<ײ\n�\�{�\Z̢[r�u/\�\�l\�\�C\0,+���\0\0\0\0\0\0:\����!�I\�\�\�ޟ�6o9i}fֲ\���m{�y\'\�&\�<��l��cb��R�\0Da\��!\0f�e\�ώ\�[�U\0�K�E\09�\��\0���G�}�@\�B\0\0\0\0\0\0\�(�sR�\0Ƥ�*��$\\hiiI�>_�\�߮�\�颂�l\�\��/\�\Z%�4\�\��#zB\0�\��ٲ��b\04\�*\0o\�U\0��e[\�f\�Y�\�\�\�Kz�\0��tR��\0\0\0\0@\�C����7У\��\'�-\�\�\�t[$\�hiiIJ]�e\��щ\�o�Ϝ���\�\�\�\�;Y��NH�-*(\�\�\�l\��[\�\�\�\0\"�0�����\�� �\0��\043o�\�@0!\0�_��\0\0\0\0\0\0\�Q\�\�h�hgݶ\�������\�\�3�&N�#*X {\�I���\��x��\�n/n�\�\�\Z�(5!1\�`&�V\\\�F|�Ԧ�O��\�\�\�\�P<��\��5\0\Z��WX���E\�\��u?B��\�9\�\�o\n\0\0\0\0\0���2?\'\�@�+n�\��췮dZZZRfd\\0i�c�b\�5+�d\�K�\\/�@e��̈�6��=v���+\�D{�\�\����\�\�\�s\�h	h��\�8\'�\�`��\n@��?��\'���\�Z>�g&_\�f^i��ײ�\0�!B\0\0\0\0\0\0��\�\�I1\�Z��\�\�hii�2s��]����Q@ӊ[�\r\�mI�¼��a>\�ܚ�\�K;��}\r��T̲�4Z\0��\�\�\��,4|��U\0\0\0\0\0\0\0D\���3!�^_�e\�y:---Sg-�\n q�<QA��\�\�}?!\0�\�̝[\��s\�D�R\�p(\r�\0\�Vs\�\�5�]�}K�\�1\0\0\0\0\0�\�A���b �ʇ�+7�{\�Ȑ\�B\0��\��\�J�>_TP����\�\�\0\�\�|QFi\�\"���F\�]\�3�gЎو�g�\0\���\�\�d��\'	I\�\�X�\��\��ik|\�o\�\0\0\0\0\0%(�sR��\0�殻r\�uV\�\�\�2-}Q�U\0I�.!\0͠3\�^\�\Z\�n{�m��T\�<f\�`�\�7!�(�ЛU\�1\�\���l���K\��u\�\�\�~�\'	I\�\�X\�\�\�c\0\0\0\0\0\0�~��9)zC\0\�R����.��\�\�\�g�v%�-\0\0�\�\�d��\'	I\�\�X�\��\��i�U\0\0\0\0\0\0 �Q\�\�\�\r�$u\�\�\�ޢ2�t�\���\r\0\��A�{��U�$$a�c7��U\0\0\0\0\0\0 �Q\�礘\0\0Z	a\��AXy�����eh\�>��X\0\0\0\0\0\0�e~NB\0\0\��0�� ��<IH\�F\�2n>�\0\0\0\0\0\0@��\�\�I1H_�r\�\�4o�\��F�\0�F�{�V�$$a�c\Z�ϧ-V\0\0\0\0\0�\�G���b>0~\�\�Q�gx�ʈ\�\0\0\�s\�r�ʓ�$lt۱~X׮d\�e��L\���\�\��e\��v�<;�\�\�,Cq�\"��\�9�\�9�Yd\�Wv��Z/�,x\�b4���Y\�\\�53Q�K�\0\0\0\0\0��P\�\�\����L�:W���\�$\�\0\0�\�\�d��\'	I\�\�v#7�g׮\�֋���q��|\�v��U\0�k\�l�d�#+\�̻d�\���.����:q\�\�n-\�\�,\0\0\0\0\0hs��9)\�C\0��\�۽??m\�r\��̬e\�m\��\��\�;�N�M�%*x`�A~	\�D\0:\�\���ܯ�$!	\�^�5\���U\0̓[?���t��\�+\�ő\0\0\0\0\0D\����!�1i�ʫ.�ZZZ�\�W>�k|r��� ;|�\0\0�\"̽?\�\0+O��\�\�C�\04v�OۨY��\����\0<\�\r�\0\0\0\0\0\0�	e~N�\�@��)/����dkc\�m�d���%)u��]G\'����>sV\�*��>3�\�d::!e����\0\0\�s\�r�ʓ�$lt��%\0��Ϗ�\�\�\�;~���y�%d�L@��S-VEj��\0\0\0\0\0\0�	e~N��\0�v\�m˽�\�ȐhiiIN\�P>�k\�9������Y�ۏ�)�\���Yƞ�A��fg\�\�\�^�hB�{�V�$$a�ہ\�, h\�>��\��[\0:Ư�I<��\0\0\0\0\0\0�5��9)B\0\\q\�\�\�P��\�\�Ғ2##\�*�ISC\0��\�^]?Ȋ��^@�\�\����0��F�H�\�Y\n]s\�r�ʓ�$lt\�\�\"\0X@���hZ ���\�#\0\0\0\0\0бQ\�礘	p�\�x@dk���L��P�\�߮\�\�\\�(�\��\�}à[��Y��\�\�\\@�\�):,Ǩe/@�!̽?\�\0+O��\�mN����q��|\�F\�*\0��u\��_p!\0\0\0\0\0�hB���b&\�\�˴��\"O���eꬅW$N�\'*(�\\\�-��#\�\�۫+)ra\0�a\��A\�Wy����nc\"�%\0��Ϗ\�U\0\�?\�\�\0\�\�\0\0\0\0���9)B\0�|��rほ�\�	-�H�\�߮\�\��Eِ\��Y��`�	x\�xci�^�\Z2\��gЎ�\�P�\�B�{�V�$$a�\�-\0�%\0��\�\�\�6jV�(d�\�~\�\�s�W�dY�>`ɲ�\0\�\�\� \0\0\0\0\0M(�sR��\0�殻r\�uV\�\�\�2-}Q�U\0I�.!\0;3Ȏ\�\Z{�s\�\�	��~Z!���-\�hб0\0ф0�� ��<IH\�F\�2n>?ZW\0\0\0\0\0\0`�\�\�I\����TE�8p��\0f/V>�+)m��\0\0��0�� �<IH\�F\�24v�Oۨ�-\0\0\0\0\0\0\0��9)zC\0>I��49m����(\"\��~	�\��?\�\���ܯ�$!	˸�|�\0\0\0\0\0\0я2?\'\�|\0\0\�Js\�2�ʓ�$lt,C\�`���\�*\0\0\0\0\0\0�(�sB\0\0\0g����_\�IB6:�q��X\0\0\0\0\0\0�e~N���\���_O�+1m�(\0hs���`\�IB6:��q��|\�b\0\0\0\0\0\0�~��9)*B\0	c��h��\0�6G�{��U�$$a�c7��U\0\0\0\0\0\0 �Q\�礨L�:W�\rҤ\�ʢ\0.,\r\0�m\�\�d��\'	I\�\�X�\��\��i�U\0\0\0\0\0\0 �Q\�礨$�\�/(:�h��C�\'Ϝ���\0�/\�\���ܯ�$!	˸���\n ?a\�;?\Z�NB�8�aJ\�42}�8hKBÐjy]�h�iu�Hkw:\�MQ�\\r$\Z�\0Qҍ\�\0���9�\�C\0c\�V�W].$\�\�\�!����]�v\�wv:.\r �M�)�	*3�Y�D_V��\'�\�?\0�\�\�d��\'	I\�\�e���\�\�9]{�\�\��q��|\�R\�\�}\�a�\�\�ٵ\�}`�\�\�Y��	����k-�n��ƽ�#�M\�\�-���ȳb�\�к��&�\�\�\�\�\�\�X�<;�\�\rŕ��u�ncw��ċ�6c���K��eY^c,\�\�R\���(\�\Zc\�^��[l\�q�nx\�z��{�\��\0��D���Z=У\��\'�-\�\�\�t[$٘2s\�\��\�w��8SY�ϕ0.�/\r �OI\�t�1\0X\0\"�0�� ��<IH\�F�!\��%۟�޳k\�a\�\�QH���.�-��%\�\�f�q醏kD�51��;��\�\�\�F\�f�tJ�,)-.P�)�\"�fw=\�\�~ɚ���Y\�\�I�\��\�^���{��1�\�\�C\0\0���9��B\0$\�Y�-����\"Cbꬅ\�\�{,�_�v\�ꍻ�\�\�N�:GT3�c\0F@N��N\ZZ\n�\�ɢ�\�3\�u%\0\��s\�2�ʓ�$ltۡz~v\�B\0\Z�ϧmG^�m�\�@�5�aD#sɥ\��\�\�Y>\�g��ua�yoo\�EF[��\�@�w����hi\�^\�\�\�;\��\0@��\�\�Im\��>7���fLK_D����\Z�\��\'O�_�|ñ��\�\�\�j&��7\�\�ߋ4��\��\�ke�\�Y�\\��Ё\�\�\�~�\'	I\�\�d�0���G���`@P�\�N0V\�Z��u�\�	�c-e2�q.\�P���Y��[��j��#r}u�풃\�\�hHe\�\�:\�x]~����\�����Q�K�\�5\�곏�\�\��\�~hNM�\�*\0��7.\�,㜥��Qr<�x\�\�����~�\��\�!\0\0\�\���\�\�!\0���l�\�9K�\�$�\�w�]@\����\�w�U\0�\�\�j��7M��\�v\�\'��&��\�\�h�X5^�\��\�#̽?\�\0+O��\�m\r�6\0��\0\r\Z�ϧ-V\�`�rg3\�:��Ļ�K��\�\�\�Y\�=K�9z��\�]�l)];\�%��\�h���\\�N�!\0ܔ�p2��*ڷ\0\�\�\��\�g�_\����6gr1\�~]�V\��NKw�\�/~.!�����\�	,\�a���n��^˻�\0\0#(�sR[�\0z}���sB\�Yiii��.���\�X��:_T�\�^�\0\�>_\�1\�\��O���\�0�	0\0@C�{��U�$$a�\�\�\0|\�?�]@�h��\�\�q;\�T\�:���w-;\�\�6u۠#e1{\�\�!\�\�p\�F��2�Fé�:,�.ݐ\�B8Q�K�-\0��\�\���ǗD0�Ed~\\�Q\�\�`�\�Gs�Z;��#\�?��{\0\01�2?\'�]\��Wn<p�\�=�a���\��]�U\�w,Z�A^�����+u\�RQ�3�ݺ�\0\���\�7�gh;d�	-�\�l�,��+\��\�\"̽?\�\0+O��\�m��[\0l=@xkh\�>��X��\�h3i\�33{��\�b\\͡m*/�dsz~I\�M\"�K\r��S|�\�H��\�v�\0�R\�|�8,�7e�,\�\���P>.\�,㜥��\�G\�EKeh�\�%\�\�����w\0 FP\�\�6\n$\�]w\�j�\�qKK��Eeg�\��\��\nڇ�\��\r�\�qD	2�z��k/@F�{��U�$$a�\�\� XBX!\07��U\0\n\�ɸ��\�&\�A�/{�`ݦ\�\�zdɸ7�\�\�6\rB�\��7\ZNł\���E1��\Z\�RY\�\��\��@`$�@����K6o�v\�,K���Qn��J\�%�\�{-\�\0@��\�\�I����TE�8𤥥��.�]΋�\0��0�� �<IH\�F�\�*\0\��K\�\n\Z�ϧ-V�hse�ʶ�\��Z��9G��3s��\�ءR\�˘�,�i}\0�\�\�\r+�]rfCwN\r\�\�Z�nX{ˌ��6{�)�`=Q��\�%���\��\�Z��y�@h��\��\0�LhW\�kY\�vǥ\�+�j\�J��T��{-\�\"ė\r\0\0D\Ze~Nj�@P�\��\�e�?\0�\�\�\�~�\'	I\�\�6�\�~�\��\�\�\�S\�\�\Zm�\�,�&\�_�y�=ݛ��\�R�fK���\�\�̢�\�,�tFV\0�\�\�\r�5��\�ᶡS\\p\��\�l]؅HYL\�\�r$\�u9v�\���:�����\��-\0��]\0u�@\� P��z�E������q�\�\'�j\�Y@\�5NǺ!��y�\�\n�\�/\�1\0\0@t�\�\�I\�\0\0D\�\�����$!	\�\�8\�}>m�`\0\0\0\0/�\0B\0\0��F���\0\08#̽?\��*O��ѱ��\�\�*\0\0\0\0��vf\�\0\0�\���!��\�K��lWb\�BQ\0\�\�s\�2�ʓ�$lt,C\�`���\�*��Q��󳂠U�M \"\�;\0\0�(B����\"�0v\�\��vQ�(\0hs����_\�IB6:�q��X\0\0\0\0\0\0�e~N�����s�/�\�?���\�\�\�bڟ4=CY���\0�\r\�\�����$!	\�\�8\�}>m�\n\0\0\0\0\0\0D?\���!�\�\��<�mONYŅ�\�Gh?Z�Tft\��|@\�\�Ƨ�a\��A\�Wy�����e\�|>V\0\0\0\0\0�\�G���Z=0,ey��)v�I[%J��C����\�լ\\�}\�\��\�\�(-�r\\\Z@\Z�8ST�Ɋgߺ\�\�gE\�H+Mѡ8\rAg�4��A�{�V�$$a�c\Z�ϧ-V\0\0\0\0\0�\�G���Z=p��\�\�\�*��$J��Ô�\�\�oضo\�\�te\�?׸��|i\0i|J��f�l�\�Ƴ\�\�B�j@?��6RD�\�\0��0�� ��<IH\�F\�2n>�\0\0\0\0\0\0@��\�\�Im�E���\����d�\�Ә:k!�\n�\�\��U\�wP�3\�/N�:GT3Pm3�\�n\�\�ݲ�*��,UK1\n\�Hm���(��}��\����H�\�5\�x��7.�=��G��&�32\�\�����$!	\�\�8\�}>m;\�*��\��\�J\�qS����\�{\�A[\��T\�\�\ZE�L��EZ�\�n\�cK��n�F\0��\�\�Im�r�\�\r�ߣJc\�m��1-}ѡ��[w�X��q[�\�-{(e򴹢��\�~\r뫻f\r�ߒK\�e؞Q�DM*j\�k�di\�r(\n��N\�5(\�\�\�c��2ڡk#z[,+^:\0�\"̽?\��*O��\�mKnzO�\�a\�Ebȸ�|j\�1�#�|\�;ݳk\�a����a\�k#\�6C\�Fhc\�Z˥>������\0pSj3fE�=�u�?�(U	�$�1\�\\�\�itV\�\�fq�S��G\�\�JEz@B�)Z�\�\�x^\�\�m\�i!�~a����^{\��\�\�\r����9\�g\'H���م�K\�\0\0\'��9��~p\�\�F`ݶ\\���:girڂ�\����H\Z��n�$N�\'�\�`�L�l:h˾��8,٭:!\�ۭ��o�\0���\�X\�L\���b�K\�)F\0\�F�{�V�$$a�ې�úv홞\�r\�{v\�\Zf�\��\��i\��о�mfش��\�f�q醏kD�u�����\�!����J]\�\�\�\�N\��\�\�\�%�\�(�)4\\ݳ7&HN���g\�A\�^�)N\�\��,\�a�\�V\0@�\�\�Im�{\�^�/\�\��\�\r�{��C�j���\����\�\�c]@R\�|Q�\�\�p\�-\��\�\np<r�6�\�!\0?-����c1JG \0Da\��A\�Wy����n3l��%�p��y@T��!\0\r�\0Z��	�Χ�^+J^�\n�\��\�\�Y>\�g��ua\�}Shp�\�V\�\�о.�B�!\0��\�\�\rv��\�\"pP���\�B\0\0\0�(�sR�\0���/���B�Zhii1~p}\�>r��\��\�\\�s��\n\�/\0�}\�-ٴ\�\� \�?�g\�E�lGr\�Ax\�s�M�;�Q�\�hIꉬ�d\��j	a\��AXy����n3�\�7\�\0h�Ua\�\0h\�>��X\�_�*$ϛ�+i�\�Vk)�r��s)R��l�,Ut˲�@��vD��n�]r��\r���V�\�\�\��\�\r�O<�7�\�m\Zݰ~\�\��#n.\r��\�\�\�U;vCw�\"Q�q�%߬P\�\\#�>�\��1ͩ\�m�\n�����t]\�%���p�)\�\�\�nJ	mY\nu�\�#\0\0e~Nj�\0�r\��\�DKK���+\0~�k0?�c\Zh�\���\�U�l\�KMv#�%�\�ڔ~.\�l\�\�;\�\�t\"����\�z\"�{�\0��0�� ��<IH\�F�\�e\0\�Q�!\07��U\06\�\�\�\��6C��\�k��[5eVq\�\�&�z+f^�F��r\�dO\�=F\�\�\�t�!�n�O<l�0r\�&�\�uG��tF\��\�ܺ�z��cGz�xܔPѾP�햖X=?[��\n�^ L\��yu�F7G�\r��\rum֎\�Mq\�;\�k\��٘+%y��xG\0:\���Ԧ!\0oZZZ�\�\Z?\�{�?\0 �s\�2�ʓ�$lt�\�>�\'Nt홾^�f@\�\�8\�}>m�}\�t\�vL�7\�3Z;\�5\�Y�w-˼\�\�\�m\�3o)�97\�ޠ�K7B�\��7\ZN\�\�a	��u�\�t��\�߶\�\����\�cxi0�θ�`v\�\�9\�\�\�\�v�E[�#��Q_\�\�\�7��r�H<n\n]���2/\\�];\��@�\�{�\�ySܺ��\�cvVBw\�M�\�]\0\0<\�(�sR�\0���v9,�\0�2\�\���ܯ�$!	\�~\�\0\�Ն)h\�Ymm�\�x\�r����C۴^*\�&\��,�D\�\rr<&ߡ]rh�\r��\�U$#\�\�?��\�B\�L\�;��cu�tK.\�0zn\����\Z��\�C-\��{�A\�~S�/!md\�b�e)�N�{m\�릸v�\��s�\�\�v»\0�\�e~N��\0\0 z\�\�d��\'	I\�\�v#\�_�*\0߰ɫ23vD�A�/{-�Y��9�f\�\ZY2\�\rj��|�v\�A\�o4��y]{\0pS<`\�;\�B\�C��7�=�\�\�cH�	%f\�\�0z�u@�n�\�uSB\�X\�/\����\�\�\\o\n�.��\r\�+\�f�)\�ݠ2\�ӕ\�A\�N\�/\0@�C���\0\08#̽?\��*O��\�\��!�0\0X\��cq�\�\\��^�Z�?� OЙ��9�\�ء�Fk�G\�r�\�\�(M5l.ݰ\�%gƱ�t\�\Z\�\�.ݰ��[7dC,�)\�>��\0�\�2�f�\�\�u\�rsi<g%C\�\�\r�\�\�\�\�v<nJ(�_�w�.\0���\�\�\�-�\�Pk.]�_n\�:\�~Sܻ��\�) ^a�\0By\�\0\0be~N��@�\�&�y+u\�7�4\0�7\�\�����$!	݆��\'sNtU�4@�\�8\�}>m\��\�\�hV\�%4\�E�\r\�\��%�r�9:�1|s�nfQyk�z:#+�\�t\�Қ\�K\��Iy��\�>\��\�\r\�Ұ����\�\�H�\�r\�FG�)\���a\�䬄�\��\��ܱ�M}�u�\�\�\r�\�\Z \�nJX��1��.��t�)�׏\"�^���\�1_�\��n�1\�I7\0�c�\�\�I1?e\�\�3�EeDi\0�o����_\�IB6:�q��]�\n\0\0\0@l�\�\0\0\�qG���b;\�\�\�2q\�\�3\�/zkL\�LQ\0\�a\��AXy�����eh\�>��X\0\0\0 �)O\�\�\�\0@��\�\�I1�4m�a�\�*.,Z��\�H$�M�%*�=\���\�P\�\�\�\�~�\'	I\�\�X\�\�\�c@ب+lM�K^A���[\�~���w\0\0\�@(�sṘ\0�\�7�~YŅ\�7\��54>9]T�\�u٣�\�\�z=\\��a��\�\�$Y�g�[�(\�U1�\�\n\�O�%�7\�a\��AXy�����eh\�>��X\0\0\0\0\0\0�e~N��@R\�\�\�U\\X�j�ꍻhk$�&�\�\"�lbi_s\�\�x\�]o\'�O��y5Y�Ԏ�\�|��{�\r\�\�\�~�\'	I\�\�X\�\�\�c\0\0\0\0\0\0�~��9)\�C\0\�i�\�\�/:�b\���\'\�|�yONA��>q\�QA��]��̝\�ǋDw���X�\�h���fҩ���\"�}4/\�n|�Y@i\�zhc;��_�\�\���.�\�\�\"z�DJae�SgX{�a\��AXy�����eh\�>��X\0\0\0\0\0\0�e~N��@\�3@\�?��1\�\�=Z�\�-\�g*y���.!\0�Vf\�\�\�p��kZ\��j\rQ�hQ$�%=��\\a�� K��[Fu\�\�d\\�Ѳ�Ϫ+D�bWTa��!g)\�\�v�\Zi\�d\���\�\�f1\�s\�r�ʓ�$lt,\�\��\n\0\0\0\0\0\0D?\����!�)3\�\��O��!\�O)KVn2�0y�\�d\�U�\����S\�[��&V/\�\�aE��Ysux)�l��j\�u\�bJM\�b:���B�\�\\L\�s̥VY�V\0ȵ��* �\�\�d��\'	I\�\�X�\��\��i�U\0\0\0\0\0\0 �Q\�礘L�\�B\0ʯ\0Rʪ\r;��\�\��DG�_5��\�N}�\0�C%��\�s\�)Z�\�S���\'g�f��\�X̂\�C{��ȉ�R!�A�{��U�$$a�c7�\�AW\�\'h�7�P\"�c����L\�+ڒ\�\�0�Z^\�(\ZdZ�/\�ڝ�pSZ\�YϋC\'<FÒ��\�/\�a��n\�4C\0�e~NzB\0�\��+PII�>_TPȊ\�ɻҮ[@.��3\n�g\��+32h\�,\�Ex\�j�Q*�e<�\�)Q�i,�\��$=Ѭ���n���ш�k��\�����`\�IB6�u\�M\�I>�\��\�\�`�0J\��L\���B\�`����\�\�i�\�\�\�\�;ݳk\�a����a\�5#\�6C\�Fhc\�Z˥>���U���F\�����\�?\�w>;�\�X�\�:�� R����A��a\�ր�6�k�:�\�\�\�,�uʳ�(\�P\\�HH��R+o�����,\�R�Y\�u\�#\��ţ�V�K�6\��\�\rԍ\�n%\0��Q\�礘LK_\�m���R]B\0\�\�\nL-�K\�\�bJ9�M\��|�t�1?���8\�\�֍��҇�JE�?�����{�U\�i�$�5#[Z\�o֠N\�iF%���H秶4�a\��A\�Wy�����<\�u\�\�3=��j�\�p㟛\�\�<7�\��о�mK\�T��\�f�q醏k��o\��M\���!\�\�7�\��[\�ڙ�\�ݴvQ�\"W�����]\�)�R�\��Z\\�$S���[i�\�Z1�^��D��{S�܅���\nt\�ޘ ~\�5*�Q�b\0\0@���b?0{�b�\�JJ[ *Dr\���0\���0�� �<IH\�FG\Z����gv\�\Z`�_��Z��N h\�>��y@T�L!\0\r�\0Z\��7\n\�U���\�|\�k9Z;w\�1�uX\�(y�+�r�_g���\�\����[i�\�m�\�Uc\�E؛2\�.��t\�\�?/&\�\\rt�\0\0�P\�\�\��s�&�-���\��?\�<>A\�\�\0\0*\�\���ܯ�$!	\�Z\�B\0J@\0���\�\�c�|ɨ��ѓ�\�\ZY~g�����Bƹk�:%6�*�eY[�\�Y;\"\�W7�\�.9X���T\�\�\r\�\�\��\�\�|�x\�o\n7Q%�e}�7�H1Q�#\�s4�,�˭tCwD;4��5ւ4Vr�ƧǺo���K-_\�@\�\Za�\�\��k�ϰ�S\�#�\n��VrX�\0!\03\�#K\�G<\�z+���\�7����\�l7\0\0\�2?\'\�|\0\0\�Js\�2�ʓ�$ltkaH\�\��z��w\0��\�\�\��\0l�\��\�>�Y�w-�\\\�\\\�z�\�?��{�\�гX1�\�5ʖҵ�m<Q�\r��\�\�&�/�)~\�&�\�\'a�$%pyߣ��F�_\0v�v�\�\�\�\�\�&.�\�J�\�%k\�\�ؑ�R7�ѾP�햖X=?[��\n�^ \�\�P\�=o%+(��{�zd��\�]\�c(��{\�~�Y���/D�\��J7\0\0\�2?\'!\0\0pF�{��U�$$a�[��f�Ez\�\�p��X��f�|�iG�5=S��e�˚(\�H:\�g\�:R�$nҽA\r�n�x\�!\�o4���\�\0\�\��\�\r\��1�)t\"\�@o�Y	ݵ3\�\�9p���2�7\�5�\�\�Pu\���\�2�axW�ë\�\�\�\rOķ\04\�+;;�\�_v �ϭ4�\��V�\r�Gao\� �A���1\�^y_r(\�\0\0�?\����!��+�ML�V\�oDi\0�o���`\�IB6����\0\�+�����\�\�\��\0�<��6\�$F��o<j�\�D�nX-�e\�-�d\\~I�q\�9\�\�.94���VL1\�\�\�\'�)�ps\�N\�{bg[�\�hx\r���)�\�\�r��:�e<���4h�\�-Z7�pX�o\�hY\�\�?�Ҹv\��2S<�\�~k�\0n��%�\�V~\�}ɡt\0\��(�sṘ\0\�O�;j�oQQ\Z\0\�a\��A\�Wy����n-l!\0��t�aG\0�\n�/lBi|�\�6\�\r\�}\�k�\�Dk$�w�,�5�L�C�\��7\ZNż�=\0�)nP\���X\�˱_`��^2#p���k\�~B�9��Q�.\�\�O�@�\���X\�/\����\�\��\�J\�\�\r\�A�_��\�\"\�M�yU�x\�J�\���\�P�\0h��9)�C\0---�\�U~�߮1�3E\0�o���`\�IB6����\0�:\0\���-\0�\��\��i�U\0*\�\�և�b�\�ୗ��m&͑\�\�̟мVwJ\�PLm5\'#eYf\�V��Z/�nX	\�3\�\��vN\r\�K�nX{\�&��n�c\�pS�a=w2Q\�\�9��\�hxd\�84\�1�\�Xڡf%�h�6\�\�ܠ~\�\�\�-Z7\�Q��\��]\0B8/���[i\\����]�~\�E؛27`���\���\�0B\0�<\�\0\0B���b>0i\�<\�\�U\\X�|��H\Z�4KT�]:\�_+\�0�� ��<IH\�FG\Z��\��e���\"�K�0�?\�\��q\���6�d�@�1K\�\�\\{�7k\��\\6\�\��\��M�dfQyk�z:#+�\�t\�Қ\�K\���r��\�>��\�\r\�i�����\�\�H�\�r\�FG�)\�D\�&\�s\�=F\�5\��V*W-g��N$�T�yu\�\'�\�2J�n\�Uw�J;�w\�\�\08\�w\�a���`o�xQY��\�\�E��l�\�\�y�E�8���\���1\�;ޗR7t\0��P\�礘$N�oX���\�o\�C;|kh|r��Qȕk���=W���㳂0�A�\0\�\�r/=��_P\�\�Od� �A4!̽?\�\0+O��ѱ��\�\�ӶV\0\0\0\0~\�b\0\0\�(�sṘ\0�RV��\�\�\�U�Wo\�E[#�4!e��9�\�5-neF��\�UM�a��\�)ݿO\�Q+\'u\�W�}��n栄\� �&����_\�IB6:�q��X\0\0\0\0��<�s���7\0\"�2?\'\�| 9-ð��E�V�\�~�\�\�7\�\�)(6\�\'N�#*��Oe��3�7g\�5>^$zXجx�\\�I�om_u\�n�R9��yB#���\�z�\�UHu��R��\�_��/\�1�,�\�֖�C��,�i�AK#,\�\�\�2�B;rW\��s\�2�ʓ�$lt,C\�`���\�*��\�R��.CmnJG\0w�1�\0\0\�2?\'\�| e� \�}�\�\�-]�ݖ\�3�<}\�T���Ą�1>3���\\7;��[�!Zm[J\�6W�\��\�+otPʵ�BtT��0\�5\�S�7J\�UT�0jQic�\��}v>\�+K�Z#,B�S\�P\�+mE\�\�I@{#̽?\��*O��ѱ��\�\�*\0\0\0\0\0\0�(�sṘ\0�\�\\(��?}��<?�,Y�\��F�\�i.�\�U\�\�\�\�\�\�F\�b�	\�G\�\Z,\�Ҡ@���\�\\s_\�s̥�qK�Y���pv v\�U-0�\�\�򨌾+p<o[>h!\0Q\�\�\�vXh�D\�0�� �<IH\�F\�24v�O[�\0\0\0\0\0\0я2?\'\�|`\�,P~�RVm\�i�$N�\'*8B&\��3e�yu�@ZXh�\�\�\Z\�{�@k\\\�5��=\�\\9�㳢�@\�3�����˷\�t�\�2���ڡ�k6\�0\�Q�0�� ��<IH\�F\�2n>�\0\0\0\0\0\0@��\�\�I�A`~\�o*)�\�\�\n\nY�\�\�[\r)���\�\Zๆk5k����63hGj�2�]�.\���l��J�s\�\���Ҭ�o\\\�w�J\�Ha%�=\�\�\�>ja��@�\�@ ̽?\�\0+O��ѱ��\�\�\��\0\0\0\0\0\0@��\�\�I1����\�~%���\0�/�\�V$^�\�\\VmS?f\�s�iEE6��<�=���}�\�)\�Pd{R�Ra\�%�\�\Z�b��\���^\�z\"�yVW;�4\�\Zpl�3\�\���ܯ�$!	˸�|�\0\0\0\0\0\0я2?\'\�~`�b\��ە��@T�\�\�>\�t�+�\"̽?\�\0+O��ѱ��\�\�Ӷ��\�O\�~9<�D\�0%\�?\Z��W�%��aH���Q4ȴ:_��;\����6���7\�T��nD?(\0;��9)�C\0Dꜥ\�i�EeD\�8c\�x�\��:\�U!\0�\�\�\�~�\'	I\�\�\�!7�\'��\�֋c	��`q��y\0�i\�tϮ�\����5C��\�����k-�n��F��\�\"�M�`�\�{\� �N�c��M\Z��\�]@B\�\�5Y�Fgu\�n\�:\�\�y�n(�T�$\������\�5-]1�\����v\�B���x?��(����\�g\'H���P\�>P\0�\�C���b>\0\0h%���`\�IB6:�ֵk\��t\�\�|�GV(\�8\�}>m;\�*�\�!l\�\�&�\�\�6#�K7|\\#3	D\�\�S����׉	�\���=��W�J]\�\�\�\�N\��_�\�\�%�\�(�_��?̪(Yz7��gh#�螽1A2��ϒ�W}�\0�\�\�I\0\0�\�\�\�~�\'	I\�\�HC._s�\�\�+>\�#+4\�|~G^�=E@C2-მ\"\�>n\r�BZ~\�i�T���J�����|\�\�\�\�\��\����\0�-7�\�1t\�\�F>P-:d\�iZ��7��A\�\�\�Z\0\�Q\�\�$\�@MM͹a\�\�%\�&�y+e\�\"Q\Z\0\��.\�s@�{�V�$$a�[��\0��\�\�\��\0�\�M�\�\�1\�>�t��N\�Z\�D!\�\\��T-%��Jݲ�-P\��\�Dh�,~FC*c\�\�3����t�\���MѺ�\�E	\�,#�}HkIQ\�	r4<��j�3�ƥ���uK)E�Z�}�\�5\�곏�\�o7��Gt\0\���\�8�\0�W���;;4�ZO�@#\�L�Z�\�_\�>h����,��k@\0��2?\'9�\0\�܉\�O�;j�oQQ\Z\0\�z\�s@�{��U�$$a�[����|���&�\���\�\�޵\\r-3`\�f�\�*\�Y��Y1�\�5ʖҵ�m<��\r��u\nk\�\�(\�\�ȳ\�2-�\�C\rg���?\�g�G�F+)\Zg�R롱#]�GCE�@��[Zb��l!��+\0z�0�u�\�%\�\�lЌD\�\reY\�}ѥgy��+޵(\�\�س>\�>\�#��t\�!\0\�1D���b;p��\�S\�*��oטę�\0�\�8\�}>m�\n@�M��\�Ԏ6\�z~\�]\�26�=$!Z\'\�,fW\�<�{�\Z.\��C\�\�h8S�%\0\�\�\�\�\�\�ySdK�\�s�\�c\�Yu�f�a��3\�٩e\�,n�&7ht�\��\�r;�1�\�Ш�\�\��|9@��\0_�\�r;\�勫V�\���y	\�Z�o<{\�[c�\�E\�J\�n�_>\�\0xLP\�礘L�6ϰ�e-\��e$�\�&\�b�\�s��\�9�\�A���E�ev$0p��X��xhS>���o<j�\�_]\�<3֐J�i1?�$Ѹk��ith�\Z�FC+�\�\��7% �qv\�\�țF�yQ3�\�h8#���F\�-=dݰ��7\�FO�.�\�\�x�04���2Z����\�\��2�\�\nm\�6�~z��^���\�\�?�2�%\�:\�[\�	|^\0�c�2?\'\�| q�|\�\�U\\�~�\�\�[C\�\�E��BvU���N�\\}�\�iw�A;�p�Ayc��\�K휮�qߌ�\�u�j\n�\Z\�8\�}>m�\n@��\n@3A�/{-���2�����G��{�\Z~�ѡ]rP�\r�b^\�\0\�WX\���\���Jn�\�\� \�\'��=\�<��^6d�\�p\�aHK�e9�_��\��4\0\�|��e\\�+I\�\�w�\��$\�\�#\�G-�\�|�2\�3�\�\\ю��\0��9)\�C\0I��_Vqa\�ͫ7�H��2[T�\���f���A.\�U����\��w�t��7(o��\�q_��ڷo����B\0n>�\0T�z*�s\�`�\�2M�yM/�.4\�\�;b\�\�HYr-�\0�ʥV��\�\�8\Z\�\Ż�.ݰ��Y[7dk,�)�h���\�`�\�F^KOW\�[\�\�\�\�\����}\�F-��\�l`\�B\0^=�\��n\� �`����_Ƶ���FO\�\�`{���\�\n��r\n���k\�3\n\0Ю(�sṘ\0�\�2��_tjź\�GO��~󞜂b#}\�9��\n9N� cp�\�,\�AO+\�\�k4\��\��\�-W*\'1Oh$�V\\\�3�\n��rR\�^��\�\��\�b�F�rR�p�\�\�h?�<��ޓ�Lמ鹁�B�\��\��iK-;�Ӷ\�M=�a\�d�+>���{��\\@\�ese�\�ߴCf��f��3��+\�n(���d�^w�\�CM?\�0�)�\�z]��.\�ntЛb};v+\�\��~z��\\+\�h8a���]\�\r�\��:/oа��\�T\�q\�aX��1��.�\��}��[#\n(\�C\'�<G\�\�ZN�[q\�\�0�\'�\��\0k(�sṘ\0Rf�!\0r�ه�\�N\�\�\�e\�m)>S\�\�\'Mu	KL\�\�3/�{Pw�ozW\�-�v\�,�;]QĚk\�{��\�A)\�v\n\�Q�z\�\�<\�@O5.\�ҬVD�mk\�,\��XyQ֒+\����\�B��@{#�\0\�7�\��\0\0\0\0tD�\0B\0\0\�\����!�)3\�\��O��!\�O)KVn2�0y�\�d\�\����ł\ZFنY�7!}\�qX��A�(Em˹澾\�K;Z\��\�\"\��\�ޙ�WQ�}�\�گ_YDp_q\�ji�@k�K���-j�ik[\�*_�U\�\�J5n��\�U��BBHH�@��hE�|\��ޙ3g�;sso2C��\�}�3g�sν9��;g\�R�\�	l�#\�\�ʶ9cdtp�\�88u>�\0\0\0@�f\�0Z\�ܨ\0\�N��9Y\�]\0M.\0\�-��\�\�\�1\�y��B���&A�]\0��60K9���5*WS�p\"䚪FJ���w\�4��m�3F�A����\�\�.�N#�����yt�Pv�Q�L�g\0\0�%\���l7p<K�_�-@-f�#Oq�w��\�?W$(==\02\�E��xNZ�\�P*�D3\��j��\�(*2Vq4XA�K$BZ�j\�\�+\����m�U�\�.\0\Z�Χ#v\0\0\0\0\0�裭\�\�b\�x8�Y)�}\���.\0!hS�Z[ٓiQ��z��sq\"rYBMM$��\�)�Xr6���v	:\�$3�T�d�wI$��tyۨ�񯸚kU����\�K\�c\0\0\0\0\0\0�>\���,�.�ǟ\��\�\��4H�%YwwzNOAx\�0�qp\�|:b\0\0\0\0\0\0�>\���,\�.\0b\�/<0\�i�<�;).\�X�=.\��3�\n\0\�\\\0&^:�\0\0\0\0\0\0@�\�\�\�d�w\�\�\0\0.\0\Z�Χ#v\0\0\0\0\0�裭\�\�\�]\0��%\r\0\0\�H\�\�\�>�~���\�\��\�K\��\�]\0�\�/W\�\�1�*�\�\�r?\���$�1L��_�Ba�.\�n\'�J�|ZH\�ht_\�mD��\�\�\0���>\'swĈ\�g�\�\�3\�\�&>�O\�\r\0��`�\0\�f2�љ�(w,\��93�<���/�F�\�-\�Ȕ�qp\�|:R���t\�\�\�\�\�\�\���{\��N-\�ӣ6SmFjc\�Yʣ�(~:���\0\�<��\�\�K\�H�k4R\��i��n\�V\�\�\�	j\n�)޴�j�OJ\�1d\�m\�\��F�̯|\�\�\����ɶ\"�\�yV(\�\�o�\�\0@D\�\�\�d�w\��\���\����Q\�\r\0��`��\�f2�\�\�d>\��\\:j.��ܱf�w\�\��\�]\0\�K�\�\�$=��\�\�H\�\�\�\�H\'��T\�b}��t~�u4��n/�XP\�+�A�x\�/P5�\�ҁ\�z�q�/\�\�q��RfN\��9\\�9�\r�Q�\�\0\0\0�E[��\�\��\�_\��\�\���N�c�c\\\0\0�� �\�$d,�\�͌)�#���\�����\����\�ؓwD\�\�|@\�0� eH�f��\�9\Z\�R�7g\�\��S羀N\�;��\\�KK\�D��SsP�g��*��k�u\�?Y\0\0\�b��9Y\�]\0�>��)��׮}��ץ��dw\�?�\0\Z�F�\�����+\\\0^:�\0\�0�\�n�i����\�\nw\�Z\�\�f^KSM��\Z@)\�d��*�pj�f�u9,AFC\�\�lFh��\�MW�\0cȄ�PD���f��2ա��26�F\�|w�Gc4Rc\�4��\���f�kW�\�ܴ\��C�\����Ɛ{j\�t�\0l1��_\n��liC\0\0�\���,�.��<eJ�\�k_{s\�Ѵ�\�\�邤��}��fUx˚��\�Y��<?[�N@U�$\�\�Rk�,\�AX�I\�XFg�$.��<@\�\�\��t\�.\0�Q����\�\��R�����\�P�V\�$\�=@�\�\�裪�=�Z�S\�g4�ƻ\�\�d5\�@��ZeS\�\�>yiS=:ZeU�9��kDe4R\�x\n�\�VW\�5�\�`� ��$i*�˲ė-�%y/|ʇ\�t�#\�Ya\�Ca\�\�\�\0@\�\�\�\�d�w\�?�iS\�/�]�\�+o�:�}:��dwOx���4\n`�*5\�t-�p*b��x�JB].���X�\�>�~����et��u\�\�!�\���z\�|\�\��y�wb��\�\��\0��2�vT\�D(��\�U�����\�\Zx4#\�.�L�\�p˦�?�\n\�qKmS�P��r�X�ĩHꊑW\�V\�cdF#5�)\0���a.\���\�:\��C{m�E\�b�\�̙\�\�Z�2\�\�y\0\0 �h\�s�ػ\0��gJ�\�\�+^���%\�V��\�J3���\�:B.3R5Y��\��)�\�\",�ժqz)���\��|S\��\�\n{\r�َ,2��ŴJ>%�\�i3Rƈ\�j7�2�`��\�}0H\0k3	\�\�L\�\�0�g�0�qp\�|:b��&lt���\\\�۔�?>�<V\��ʡ\r��B$ȫ(ƕ{V(��u95����M��\��G\�lFmfٔ\�0\�\�o؉�y\�`Z��\�h�\�e�u�b$\�\��1�\��<4DfN\�\�b<+�}(\��,\0\0t-\���,�.�	�Z.\0R�\�(P����z�rU����!�)�I\�f\'��)�)\�\�\�N�$֊$�sV+2q\'�2��\�\"��q�l5$RĿ�\�U�[�F�]�[�hʐ\�\�ym��\��dZ�{Vf�{\�\�>�~����et��p\0�E�^:�\04\�\Z\�k���\"�\�v��XͫKyBQ>�\�&�+4��u9�F\�-�_ߝ(�j�)S\�?�@\�Ndv\�E=������[�Us�\����μ\Z�g}����\�U�9U�o\�pZ��\�CI�x\0@���\�\�b\�x�g\���+\�H�S\��S\�0��\�a��V�\�M\�d�%\�]0sZE!\�j\rU.)V)�%L��y\�YC~vv>���h\�%d��D\�r8rM��q!���/vGX\���6����\�n.��\��\����\�]\0:A\�cKs �k}��\�\�zR����8e\'��MM�\�;6m\�8�j��p]��%f\�a\�\�[�h����%�Ֆ:�#^�SC��i�y��ʀ(��\�hC�\�\�Y\0\�p�o�\�z�\����\Z&�K����r;�%��\0\0еh\�s�ػ\0�,\\\0\�[\0)\�\�\�3c\�?�$pE\�]S�Z�6U�ĳZ5\�=,\�g\�%N�5\�\�\�;��*�:[k\��\�������`w�\�}0H�j3	\�\�tC2��J\�\��Q	:\��\��T�k|�\�X\�b����qg�?IK��T!8^�\�Z\�[I�ߞ�_\�L�l\�fh�\�D*�^Y\�\�i���dG�$a�~�#D�g��\�0�\�G\�iE2>��\�ڪ(�F\n؟��\�\�\���^c\���%>M� 1hF)\�C\�Y���Ȝ\�ߋ�\0\0\"��>\'\�\r\\\0ϒ\�\�~P��\�S\\@C\�A7nҗ�>\0�\"���Z!\��5\�\�Q�J��B	\'��%^h$Ye2?` k\�\��D�,�H���\�Y�$Bj�`w�\�}0H\0k3	\�\�8C\�\�\��t�]\0�ǡI/��+\0=\�\0\0\0 \�h\�s�ػ\0\�}V\�~���@\�`Ɣ�\�x}kf�<�N��\�Z�UJI�[�!\�\�Sg��\�\�(�@\�)��\�\�\�~��K�\�.g5\�٪�,\�A\�W�I\�XF\�/��]\0�\�\��\�}\�ν|��S3q��B\�\�\0�.E[��\�\���s�\�w\����\�I��.\0=�� �\�$d,�\���S\�\��\0:��\�Y� �!ه�o�N\��s\0b�\0\0\�m}No\01�����QΝ�zS]\'\����_m&!cg�t>v\0\0\0\0\0�裭\�\�b\�\0\0d�� �\�$d,�\���S\�\��\0\0\0\0\0\0@�\�\�\�dp\0\0\�aqR�\�LB\�2:\�x\�|\�\0\0\0\0\0\0\�G[��\�\���\�Ԝ{&�\�\�\'�ɹ\0�aq�\�LB\�2:\�\�88u>�\0\0\0\0\0\0Dm}N{�]N�\�}��\�\�\�\0�����_m&!cg�t>v\0\0\0\0\0�裭\�\�\�\��\�/\�yh����\�1�1.\0\0��`�\0\�f2�\�q�\����\�\�Cw�\�w���W\�}[\�|ҕ�6�)��\��n�\���O�P���\�7a�\�z�McL\�PO�oow��n��%y\0B��\�\�b\���\�\'M���v\�/�.͌$���\�\\\0\0�� ��\�$d,�3CQ\�X\�\�#rf𹁌4�\'���Χ\�]\�{�f\�\�_�K�N��ң6SmFjc\�Yʣ�(~0m.\0|(��y��ڰ0uvzC\�<st�\��U\��a���t��\�M\��5-�\�\��\�\n\��<AMA1ś�U\��II\� G\�6Pz)i��\���t�Ղ\�x�T�\�@OR*Ԓ��t\�H�MM����ty\0�\���,�.��<eJ�\�k_{s\�Ѵ�\�\�\�!oT\ZP�%BYsv�<s��\�dhER�\0�� �\�$d,�\�ό�#\�\�\�\�Qsؐ���,5h�:��\��.�\�\�C6G,�Om��f\�#\\\0@S/�=�[\�5>\�\��/O\�~����7��n/�XP\�+�A�-\�/P5�\�:M�/\0\r\�肙\�n�\�\�1\n��C٦�Ű�x\�\�e\riJ&��5\�V\��䥴1$D�!�Hm}N{���6���ڵ/��\�3ߧ�Iv��ǹ@\ZI��V�\�Q�L\�B\nWъ������\�>�~����et�!io!��\\\0F�Nn�\��=y@$Hi����\�\�f��f\�#\\\0��^B\�l\�\�\�\��7\�\��\�\�+=�kTK�ߜe�\�/N��R\'\���,Ŀ\�_�S)|1�*Z�9�oZ�/�[\�\�\�ܾu\�R\�Ƌ\�\0@�h\�s�ػ\0��gJ�\�\�+^���%\�V��\�J3���\�:��\�\��čw!����\�\�7��Z�\�\�;�U\��RB�3�٨6��Z\�I�\�^C~�#��E[�,�tV�r)\��Š�\�\�>$�����et�H\�(\�\�\�M\0\�Oǩ�\�]\0nk�\�~N�>��6���;]K\�#\�\�k%Y��E�R\�+\�^U.\�\�\�@\� R\�rX����\�ٌ\�.\0\�~i����\�!���_���I\�5\Z�ت5\�9kcΖ|@l��w��o%%��!\�\�\�\�\�z\�<$���\�������O\�\�\�.\0\�#��2\��Q�\�\�p�Q\�ۧP��@\�\�x[)\�{����rQ.\0\0RD[��\�\�0\�Q\�@ʿ`a��T�\�_oU�j���>\�\�0e4�\�lC\'U�Д�ji\rSZ[E\�9��8�\��UYa�\�\�8�B�\Z)\�\�Q�*�\�\\Ԭ�0O�V\�+\�S\����`��\�f2�љ\�\�`���O^:�\�w�\��\�{We�\�Z3I)�TmI��\ZZ\�*\�d�I%�Y�R\��F�\�\��\r��|C�\0��E\Z)��Tk45��\r�����	\����\�\'\�6\�\�7Jt��~\�>t���58�O9��\0Z�`u�]�\0\�[\0:��@�Rֵ\�N=L�Z��\�V��\�7�87\�c\��I�pk���\�E���1TJIs\0 \���,�.�{F\������4?\�<?�\r����Q@R��8�+�Y`�f̜V�DȵZq��)V)�%L��y\�YC~vv>�S@4\�,\"1O)�%�.�@-@�w\�\0:\��qp\�|:\�.\0;n\�\�\�\�5�Δ���X����\"i�S]�(IʲX�T\�]��\�2:�.�L�\�p\�\�&\�|�\�W�f(��釒D\�\�x�\��\�\�]h�\���N9��}�Dk�\�j\��\�K�O9�)\0���a.\���\�:\���Pͩ\�%��c2�\�	\����\�\Zo��ꅳ�sdD\�@�\08\�\�\�d�w<4�\�[\0)\�\�\�3c\�?�$pE\�\�6���@\�Y��\Z\�\�\�\�y�\Zd�\�;�\"�\�Z-��T�\�?\0�� \�x\�|\�\�H�@7\�sr�\�*�\��)屔��\r���\�X\�\�ƕ{V(�Y��\�\�\�6\Znkh7�\�>��8�e�1��թ ��\rO\�E�?\�N�\0\\[\�����D��_�Tq\��o��I���\��`\�\�G\���%C7�\�\�\�	_!��\�\�x��]�����c(�\�\0@0��9\�n\�x���[�Z\��G�\�\Z\��0����X��\0�I��\�\n�nm\�ϣ��\��\����\ZD�xu��ldu\\���{��B\�\�\0@�� �\�$d,�3Er�\�\�!)4N�OG\�\��<�]\0*\�\�.��r�\n-teⓤ\�]�A�etj]E�\�p\�\�\��$\�C�¨\\m�\"\�ɧ��k|J��F�*�z��\�ꯚ���\�v\�\�\0~_\01>I�9�\�d\�[�\���J5�Pa�/�[\�m�\\�\�,\�\�x\0@H��9Y\�]\0\�>+e��\�?\�\�@bX�l�%�9\�\�\�n�\�(���!g��i�R\�(�o\�t�\�Y��\�ՠ-�\�gq5.\0\��\�}0H�j3	\�\�L�\� \�;�:\0/��]\0:Ɗ-���#��r�r.\r\�_b\�I\�\�\�\�S���2���\�v��і��\nأv\�uyV����Msң�\�\n\�\�hFJڒ��⁽FG\�S��fk��	\�x�\���m���\�gL\�C�\�6}{�rX���� g���`�|\�5���\"&.\0�`��R�\��\�\�x{)�?=g)簈u�2��[��\�\�\�\�x�9M�;\��IOs��\�8\0=�� �\�$d,�Ӎ�\�?S\�\�\�(�:�\�m\00�qp\�|:R���t\��6!i3yr\��\'i)5��*V�/_\'n_���\�I�\�̤�:ĵZm�,��\�^Y\�\�Ai���6��\�\��r%i�\\�\�\�>���\�\�qyU�.��\'�F\�\��I\�`\���Lm�v9\�\n�S\0�Y\0}�@g \��\�\�ǧ ���\0\�:�~�\�\�š�Sr(m��x}��/�\�8�l����A]\0�\0���\�\�\�\� &>�\����7\�ù�\�\�w\�\��I\0z,\�A\�W�I\�XF\�/�?�\0\0\0\0�(b�\0\�\0 ��>\'��\0\0�!X\���6�����34N�OG\�\0\0\0\0\"H\�\�a�Bo�`wF[���\0\0p�\�}0H�j3	\�\�8\���\�(�\�5�ZA��ċ�^����g\0\0pA[��\�\���\�Ԝ{&�\�\�\'�ɹ\0�aq�\�LB\�2:\�\�88u>�\0\0\0\0\0\0Dm}N{�]N�\�}��\�\�\�\0�����_m&!cg�t>v\0\0\0\0\0�裭\�\�\�\��\�/\�yh����\�1�1.\0\0��`�\0\�f2�\�q�\����\�]\0\0\0\0\0\0 �h\�s�ػ\0\�}�IS\�/�]�\�K�K3#\�\�2\�vzΏ\�\�\���`��\�f2�\�q\�K\�c\0\0\0\0\0\0�>\���,�.��<eJ�\�k_{s\�Ѵ�\�\�\�Bӷ�\�ON�J(U�\�$�3g~�\��5�d�B�U\�\����\r�-`U��`q�\�LB\�2:\�\�88u>�\0\0\0\0\0\0Dm}N{���6���ڵ/��\�3ߧ�Iv��ǹ@�дkp)\�ӿ�Ψ\�N��_��M��-H�\�4d�� ��\�$d,�㌗\�\0�3^>��\�cLU\�ѷ\�~�\']Ijc�R)�>r�\�^]\�q\�NO�PR�+�\�C\�2\0\0\�m}N{���L���|\�\�\���d٪\�ޜSXRi\�\��\�\\@G\\F\�\\!J��9\�[�j\�\�<�*�\\ǌ�n��K+9̖\�S�f\�Fi��\�|+�V��\�\�&��\�+\n�;�\�\���\�)\�V\r\�\�e^4\�\�N9X\���6����\�E�cI��ș�\�v�S�C\�\�\��t\�ɻ\0�N�rt�z>\��<\�6H�\�L����g)�f\�����\0�\�1���<��\�;Mj-�5-�\�\��\�\n\��<AMA1ś�U\��II�˶���r\�ò\�ɴ��u\0\0���>\'��`£����\�2\n-��ǿު\\\� \�\�}\�\�@��\�gC^��W��RA��\�e\�S�\�\"ּ�]Q�|�$:\�\�FQ��\�ȵ:�sB\�Y�ŵ\\#���p���e��\�l���\�q��e\�VqEX\��ԯ6����N?3rF���KGw�_�;v\�رc=R\�\��{\�.�\�s��f<���pd\Z\�\�3\�u�/\�7g\�^<���Wn��C\�_�j���.�OD\���\�PT>,\0\0؝\�\�\�d�w<�\�3\����uM��)\���o�O\���Ǐ\n\�j\�L7��RKL\�h\�\�<u-�F�aJg�(-\'	D��fF\�\�h3�-\�@-�f\�J�fK@�)\�!�lF(ߑ\�\���+?�,\�AX�I\�XF��9R\�G��\�7\0�E\"�\0vW�6U<�@wB\�J8�#�\�R�7g\�\��S羀\�\�\�e�\�kD>,\0\0ح\�\�\�d�w<4Y�\0��\0R\�+��gƌ\�I.\����R�J\�*\�3\��\0W��r\�f⌑u8]\05MM2\�Vd\"\�͆\�#�lF\�\��\�\�D�� ��\�$d,�3��@8\0�ش�\0�t>v�a��\�6�6\�m\�_񻖲G��\�\�4�.)�\�P\nz%\�k�\�E=�\Z�Dj]K�\�P�8�Z���+H3d�\�\�?�l�\�:\�\�N\�#�\�r\�̚\�R_\���fޛo����]\0\�]=�\�\�/R3�A\0\0\0\�\�\�d��\�Y�\�oj1\�y�h\�g�\�7��\"Y)\�\��\�3��*lŭt+h\����^e�tC^l�|�D�f\�N�E*%\�v*q��D�UЈ�\��u�\�ޑ<�E\��6,\�AX�I\�XFg\nW�%���kb\�]���\��/呪\�-�\�\�]V\�$\�MK�\�\�\�*)=\�\�\�\�g4�ƻތ\r\���jUB�گk\�H�\�ߧ˩b<\�b��\�_l0\��\�\�Yܻ�}\�:\��\�!\0\0 \���,�.��s���\�\�\�\�\��d3G\��\�;Qsra\�\�B\�H�\�9\�\��(,k\�ڦ\�LP5��\�\�y���E��ٸ%V\�j\'�q\�(�6g/�=Md\'Ļ\0�ZyQ[U j���_m&!c�)\\\\\0�\�O��K\�c��X\�{=�l\�9A�/�ho��k]%Ih-/\r\�]��G3R\�r\�\r�l)�\0���e�9�ϛ�\\\�\�Z��~]N~\n���a�\�;�\�v�t8<���\0�����~u��\0\0\0���\�\�\�\�x�9M�;\��IOs��(r8:Y<:���,\��	`m&!c�).\0�\�O��\����\�]\0\Z�\�0$�\\�\�D�?>�<���8�\�0B\�)����b\\�g��Z�S#\�hٴ-\�!]\0>�\0؛d��o�+.�j��_�S\�e�u�b$\�\�\�.;�u\�\��a\0\0H\���,\�.\0b\�/<0\�i�<�;).\Z^�\r.�V�1w(]�\0\�\�@\�̝�\�-\�\��\��T�k|�E\0�]\0*�����<���8��\�\�\'��+4\"`R\�r(���[��.\0|(��\�{�y\�N�0����,\�1���\�������y5�O�E�\��$ȇ\0\0�sh\�s�ػ\0\0\0�\�}0H\0k3	\�\�L\�\�`�\0����ʱ\�9�R\�\�zI�\�*�!鐄8�\�0nQ*I��v��M�f\�	\�\�YY\�;lb�;�Ͱ�֡\�����P<p\�Z�I\�^m�\�r*\��{=@\��\r��\�\�\�\�4�\0R�K\0���>\'�\0\0\���`��\�f2�\�\�(w�qw\�B� \'Z�\�\��颮�=\Zc\�/T�a����\�O\�Rj%U�)_�o\��f~{�~93)�\��h�V[�.K��\�\�l�f�\�StDIf\�+I�\�ڌ���8\�\�)D�\�aJf�.���)\0��,��A��?��˄}r��\0\��0�|\0\0\0m}N	�C�/��\��6~\�3�\0\�尸	`m&!cgh�:��ñ\0\0\ZǶ�@{�+�\0.\0\0\0H��>\'��`ܝ���\�F�\0\�尸�_m&!cg�t>v\0\0B\��\�m\�\�\�\�Lxg\0\0�h��9Y$\\\0�>4E���\�e�f/XXZI\�{\�\�6H\�\�\0\0��� �\�$d,�\���S\�\��\0:��9\\� �J\�ѷ��\�\���\0\0�h\�s�H�\0\�O|J�\0ޙS��v\�{�(��\0t/,\�A\�W�I\�XF\�/��]\0\0\0\0\0\0 �h\�s�H�\0x4�4�ʺ��\���\�{�^��nu\�\Z׭dw����4\��\������{~�\�>?�@�\�}0H\0k3	\�\�8C\�\�\��t\�.\0\0\0\0\0\0}��9Y$\\\0>�\��\�\����r�m�\��>a�\�\Z@vׄ\\.f��_\��O��vX\��ԯ6�����3^:�\0\0\0\0\0\0@�\�\�\�d�p<4���\�\��Wf�KVկ�\�\'���S�[1���7;[\�0�	\�g\�z�I��R\�JH\�\�UY�R܃\0@�`q�\�LB\�2:\�\�88u>�\0\0\0\0\0\0Dm}N	�ù\�.X�\�\��\��l���N��ߚC1�=<���(�\�\�\����\�#�H�K�n\�\�oQ\�VQ�,\�ʬ�Ҳ�*�5,\�A\�W�I\�XF\�/��]\0\0\0\0\0\0 �h\�s�H�\0&>�\����\�S�\�$�kB�3��\'����\�%VL\"䌱{\0l��\�$���˾\0vX\���6�����34N�O\���_f�;�ü*�\�\�r?\���$�1L��_��\�G\�G\�{�\�\�嘍FډH3\�\�\�\�/\0@�\�\�\�d�pH��\�\�{\�\��澀�\'>\�LT�.qU\�ZL\Z]\0:�#\0\�F���_m&!c��rǒ�3�\�\rd�Ɉcs�8)5�t>U\�\Z\�ʤ\�\�\\,�3%�B�j3RC\�R\�\�G�+�is\�C�c$=yf=��\�\�\��F��6\Z��\���=XA;�\'�)(�xӲ�9>)\�w}\�d��MS\n�$%�2\�V��:y�6\��&�J>IDj\�\0\0���\�ɢ\�0\�8cև��\�\��LzZ\�\�\'^\�&v%.j\�ؚ/F��\�\�}\0j%V\�\�#j2�\�P~���U	\01�\�}0H\0k3	\�\��3#G��\\::]\0�V�6h�:��\��.�\�%\�j3\�x4#@\�\�4��f��m\\^3Ǹ\�\�\��F�Ҝu{�Ă�^�\r\��~��Y|�.܆\�\��\��Y|�\�\'Ij#���N�T�$\0\0\�z��9Y�\\\0\�{\�#\0~��U܄7iw\�\�\0\�\�2ۭͩL\���0�y�\�D��u����<f&\0b��`��\�f2�\�\�fF��\��i��\�\�ɻ\0\"Ԧ�G3�.��A\�\�4\��t9=�ѕTK�ߜe�\�/N��:�\��j:�o\�_�$}�\�\�)��_\'qi\�~�$\0\0\���9Y�\\\0�\�\0�6�\02��`�\0\�f2�љ�+\\\04N�OG\�p\�X:\'6��+`��ؠ�̵���V��\�<���y��W���\\\�é��A�\�\�\r%���]\0��\n\�&v�E\")�N��&Q|B�\�$ۧ\�1P�O�\�>\Z���\������\�\�\'\����:t�㓤Ub��S����\�\�&\0@7��\�\�\"\� \�{�\��\0�aX\��ԯ6����\�\�.\0\�&�\�T�\��T�k|\�\'v��x��}�/呪\�-�\�<V\�$\�=@�\�\�\�\�W#S\�r\����\�x��M&�\0JP�U�\'�\�\�\r\�e���J�\�\\��\�g�����\�0�h1�\�Uv\�/6oHd\�,\�\�\��\�\�\�\'\��F�ه�G\�2�Q�\�|�\�\'	\0\0�\Zm}N-\0\0 :��	`m&!c�)\\\\\06f\�P\�\�\0\Z�Χ#\�\�\ZOǞ�\�!^\�<k\�:S\�_\�C�\�T�\�T�\�\�ڔ$���4�w�\�H�\�)l4ܲ\�Ò�~k�r��~(t-�\��&>}�\�$��IQ�<�(�.�}4�)\0���a.\���\�\�\��\Z\�θ\0\�P��\'q\�\�nw�\�\0\0]��>\'�\0\0\���`��\�f2�љ\"�@\�\�\�N\0/��]\0\Z�\�0\�\�\�R\�.W��)\�.ךa�:��S(yŸr\�\n%>� �.�F�\�0�iRD��\���\0{���\�~�\�\�)���t9��\��\�:U1�\�\�K�\�b|�\�R\�6\Z>_\'F3\�ݠ>I\0\0\�h\�s���\0:::\�\�ۗ��]TZ^�h\���\�E��+Z\�\�(�3\0�\r��`�\0\�f2�љ\"�@���.\0\Z�Χ#vh�5t�5��\��7��ªM�\��IR�\� �<H�ˡ6\Zn\�»\0L�x\"\Z/��b�I!�l\�g��ʆO�\�0\Z\�V\�ܟ�7~ �3��^�#\�hXOI�$�u������>I\0\0\�h\�s���\0�oo/)��_\�Բik\�����BF�\�-+k\n��b�\01�\�}0H�j3	\�\�L�\�`8\0:�n@/��]\0:AU��!^l8J9�}YO\� ���\�0n\�)I>t�6p�z5\�N�.\�\�?.3lb���Ͱ�V\'G3H�x\��J�|�\�\�#D\�K�.�\r���� g���`����7F&qꓤ�\�\�`8&\�O��\�\0\0\0\���>\'K����������}�ֶ\�M\�6�l��y\�t�6JZPT�s\�N.\0\0�*,\�AX�I\�XF�\����g\�\�(%�3\�88u>�~\�x:�\\�E�\�-��kh�\�v\������AIU\�ʗ\�[+o+��ۓ�˙IIԦG3�\�vY\"@��pwI�4\�<�舒$\�\�/W��˵=\�Cq��%=G�t\�;\�W�z\r�O�;3\ZN\�OH\�g�\r���@�\�OA��Ir\�)F;��b�UK���\�>I�\0\0�n��9Y�]\0%e�\�?\�$��\�\�mhɟ_�\�\0�>,\�A\�W�I\�XF\�/�?�\0\0\0\0�\�\0\0\0 }h\�s��.�;&�R�f����b�Ҋ\�˪k\�\Z�H�K\�ߴ�����diUqi\�\�\�\�\�\�g�\Z�\'n\�u���Qf=\��h\�\�>$�����et��qp\�|:b\0\0\0��S3qX\�\'\0\0m}N\�0\�	\�^{��\�\�n\��	GyPQ�����\r\�5�\�,]�|Q�x#`\�\�KʫW\�7nݶ��x)g��\0����`��\�f2�\�q\�K\�c@�\��\�Z䵂 #\�C��3\0\0����\�\�¹\0\�(0���\�>�|�_�\06m޶�����ͭr�ڦ�M\�)r�\"o\0)m1��2n�\�g\�	\�\�:<;[\��\�JI�.�\�\"Z���f�5�\�J�q\�Q�Q�u\���!,\�AX�I\�XF\�\Z�Χ#v\0\0\0\0\0�裭\�\�B�\0�e\�:eq����������`\�ֶ9sqV�Ԭ�IF\'�7�Kg���	U���(�\�Fa�\"�D7\n�i^5p��W\r;�Q\\�Z�\�\�>�~����et��\��\�\0\0\0\0\0\0���>\'K\� m\�\�y����������n\�F\��\�\�\��������r圹E�rV\r!�-,�m\�M��jE�\�\"]\�f��HG�˥\"ʙيq� I6\0\�	��`�\0\�f2�\�q�\����\�]\0\0\0\0\0\0 �h\�s�]\0W�iR~a�\�)�\\Ѹ�yu}S\��\�\�e�E%�\�+Z�pqyEժ\�[Z\n�&Rq\�\�ǲ\\�X\�\�\�K\�3lE:�\��gf5��\r�x\�\�>�~����et��\��\�\0\0\0\0\0\0���>\'\�����Sg\��t\�NpPQU\��.\0\�\����v\�\�Q�T���x]`s����S�[�\�(�\Z!+F	;��MU\�\0�\',\�AX�I\�XF\�\Z�Χ#v\0\0\0\0\0�裭\�\�¹\0\�2}\�$kܒ�\��\�ȟ_\�Y��l�\��&���m�ۏ͍�Rv\�m��H�(\�\n�\Z\�̉d5N\�&�		q\0\��� ��\�$d,�㌗\�\0�3\�?��\�cLU\�ѷ\�~�\']Ijc�R)�>r�\�^�ؙ\����%\�֯���\0�nE[��u\�LxiEm����q}QIym}cs�\�]\0�u�\�U�f,\\]\�\�Yâ\���xE \0�\�}0H\0k3	\�\�\�P�;�t���|�2#��$�\���qp\�|:Rͮ�t\�\�K�+G�\�\�\�A,\�;�^O��H����g)�f\�����\0�$0\"S:�z��_��\���=XA;�\'�)(�xӲ�9>)a���\0�裭\�ɂ�\0B\�ڶ}i劂\�\�\�X�^~\�\�g��\�E�\�խm�\'!��@\�\0\0�7,\�A\�W�I\�XF��9#F�\�ͥ�\�P�;\�%6e�t�p��{��\�L3\�\�G�\02��#b�o�\�l��\�\�.\�Ws\�\�\��z\�6�?�d��f�Yf�\�@\0@\�\�\�dq\0\0vX\���6����N73r�\��\0]\�S\�\�\�\">I4N�OǞ� @m�x4#@\�\�zGD���r<�m��\�Y���\�Թ/ C\�c�\0\0 h\�s2�\0\0\0�_m&!c�)\\\\\0\��\0`@(\�\�%v>_y�\��M\�a\�h3>�\�ܵ�=�ͼ�&ܔ�R\�+\�^U.\�\�\�@\� R\�rX����\�ٌ\�.\0\�~i����B���/\'���$vHl-L$�뗽\�Ԙ5����\�?ͬ�}bn�wx}�D,\n\0\0b��>\'ˈ������}�\�\�E�克�\�/*]PTZQ������8\0 ڰ�	`m&!c�)�.\0�@\�O�\��4N�OG�\�5��=c��*{L��R���RO�տ.0d؞d82I,N�T�QU��L�\�)\�3\ZV\�m�J\��%�.\��4|\Zo$ٻ�\�T�OٻT*O��\�*�\���\0$2t�h��#3P\0\0��9Y�]\0۷���U֯ijٴ�m�\�\�\�?!�@s˖��\r�[[�\�\0��\�>�~����et�p�\0�%J�wnW��\��]\0v�`�ZO�y�\�\���|V�		A(��\�U���Ґ\�\Zx4#\�.�L�\�p˦K���\�\�n���&�|M�G\�\���\�Z�D��v:\�~%-���AK\�0�w�\�\�\0ip�|v1(\0\0�	\���,\�.�����\n�ο\�[ۚ7m\�ز��\�-d�\�\�[\�(iAQ\�Ν;�\0\0 ���	`m&!c�)\�]\0�m��\�88u>�@C_\�k\�o)�l�\��R2/�lPr\n!*��X2\"�h� �.�F�\�0�i�\'����\0�I\n��m��t\\���Tx\\6�[�*F��}�aq�\�;\�(\0\0�\���,�.���\��m�\�\�i\�6�\�\�/\�\�\0\0D�� ��\�$d,�3�\�\�P��\�\��@C,Ѓ\�54Xh�\�,Vm:��>I*\�\Z��M�Ժ�`�ᖭ*�7z�<o4\�\�e��V\�~%-\Zs��j\�\��?ةW�|v�(\0\0�\r\���,�\��I�Ԭ\��\'�,�X��b��ꚺ�&�R�7mh��k,YZU\\Z1����\�\�g�\�ď�\�\�\'�,\�AX�I\�XFg\n�@\��\�jBB\�\�\��t\�.\0c�@S96x\�Qʹ�7P �\�JKE�SvR�+I\�\�*�:D\�\�;\�<+K��찉a\�z4\�\�Z!�\�\�\0�7z�|\Z/\�V��	Я$�¢?�\��,\0a8\�7\�>\Z��h\�\n\0\0⃶>\'\�sÄs��{\��o�m���<��ZE\�݆\�\�k�.[��D��h�\�%\�ի\��n\�^X�����\0\0H+,\�A\�W�I\�XF�R���U\�;�jj�6\0x\�|�\�5�Gc����3\�\\\�Z\�%ޟ��\�J�P/_\'nf~{�~93\�G�H\\��\��\��6{e���\Z��(2\�\�\��r%i�\\�\�?g�L�/N\�F:jp\�\�_*��\0$\�\0��\��@��\�ίh�\n\0\0b��>\'\� ���w�>�\��a~\�شy۶\�v��6�\�]\0k�66�o�\��\\]\0�\�\�?X��D��O��\�e@&ɠ=�\�\�Щpdg��Q���j5\0�$��	`m&!cgh�:��ñ\0\0\0:�&\�\0\0dm}N\� -\�\�)�+\�wĕ�U�\��rl\�\�6g\�\"Ϊ㼏o>\Z�\nM\�\'򨥅\�O��%�\�\0�aqR�\�LB\�2:\�x\�|\�\0\0�N\0\0\0t\���,E���3\�q��꒲�ں�I\�okc��暺\��ʕs\�\�.X\�Yu�N��\��@ˣ�\0,�O�\�	<\0\0��\�}0H\0k3	\�\�8C\�\�\��t\�.�N�l\�?\�\�m\�C]\n\\\0\0\0\�h\�s�]\0W�iR~a�\�)�\\Ѹ�yu}S\��\�\�e�E%�\�+Z�pqyEժ\�[Z\n�\�ғ\����ƽ!�-�3��\�\�|[\0 ,\�A\�W�I\�XF\�/��]\0\0\0\0\0\0 �h\�s�\�.��?u\�Ow\�\�U5�\��~�C\�S�\�\�/o��g\�<f��*y��\0����	`m&!cgh�:��\�\0\0\0\0\0\0���>\'\��\�􍛒�qK�V�� ~1gձ�;\������<o\�O\�\�#���:@%��\0\0�`qR�\�LB\�2:\�x\�|\�\0\0\0\0\0\0\�G[��u\�LxiEm����q}QIym}cs�\�]\0�u�\�U�f,\\]\�\�Yu�m�iF�\0\0�\�\�>$�����et��qp\�|:b\0\0\0\0\0\0�>\���,� �mۗV�((\\����\�\�����wfϛ]PTZ^\�\�\��+�|?C:]\�>\0\0��`��\�f2�\�q\�K\�c\0\0\0\0\0\0�>\���,#.\0\0�n\0��`�\0\�f2�\�q�\����\�]\0\0\0\0\0\0 �h\�s2�\0\0\0�_m&!c��rǒ�3�\�3rF��H�cs�85�t>\�\�\Z\�\rTW��=_�a�\�j\�4�xF-8\��ŷ\�,:\�m�\�\������j�\0\0\0\0�8��\�\�2\�\�\�\�hoo_��vQiy\�%�J�VT�hmk�$\�\0�6,\�AX�I\�XF�!�\�\�\�\�\�\�\�(\�\�!94N�O\�\�\�\� ���D.\0S۷4S�\05\�J)C�˜F�^�Ol1R�S\0\0\0\0\0+��9Y�]\0۷���U֯ijٴ�m�\�\�\�?!�@s˖��\r�[[�\�\0��\�>�~����et���#u�p�)|\�(\�\��\�\�\������UmDKD���E�jbA�t\�gU7g�\0\0\0\0\0O��9Y�]\0e\����5oڶ�e\�G\�[\�(@����Q҂�ҝ;wr\0@Taq�\�LB\�2:S��\0Ұ��qp\�|:\�o��\�e�K�@\�~\�0���`�\�\\\�\0\0\0\0\0@\\\�\�\�d\�w��U��h�T�N[��%~Q7?Й\�\�\�\�L�r�D\�iX\��ԯ6����\��.�tl �t~lv�m�Ҭ<\�)\0\�i�\�#`�\0��gG\0\\\0\0\0\0\0\0qE[��u\�1镚5�ė%˗V,_V]S\�\�D�_*��\r-�u�%K��K+\��p\�\�b�p��.\0\�iX\���6����\�>.��l h�:��\��J}K�[�\0\�n?\0\�4�(ϰ\�bc׀\� `{j\0\0\0\0\0\0\�m}N\�0\�	\�^{��\�\�n\��	GyPQ�����\r\�5�\�,]�|Q�x#`\�\�KʫW\�7nݶ��x)g\�.\�\0 \0,\�A\�W�I\�XFg\no��\0�a\0\��c�.\0\n{�P�\��	@b;��\0\0\0\0\0↶>\'\� ���w�>�\��a~\�شy۶\�v��6�\�]\0k�66�o�\��<\\\0B�fg�\�%\�\�\�\�6	˧Dv�AXq�\�^�\�$\"�+\�-�^��\�8�*\�kQ~+�lc\"��D\�\\p\\��W�\�0j��(a]ɿ�@m=�� �\�$d,�3�� Mh�:���|@\"���vU/R�\���Bl�\0\0\0\0\0 �h\�s�\�.\0iY�NY\\a_%&()�\"�\�\�ز�m\�\�E�UC\�O)=�P54��v1JI2F䖺\�\�e�A&���.\�L��<�UT\�濣��{��\0\0�|IDAT�2���WU\\��\�	D\�r\nJ�z\�v\�D���g��!Ot!H\�@�\�}0H�j3	\�\�L\�\�H\�C\0/��]\0\�V�d���e�\�3\0\0\0\0\0 nh\�s�]\0ҦΜ\�\�\nKʫKʪj\�\�n$����]\0\�k\�\Z\�+WΙ[4�`!gհ4�Rd.�RƈQRܲ\'B�A\�W\�\�\�\�Χ 	fy�W\�I3چ�\��TK��RZBѫ\��Ƙق�\r�$X\���6����N7��I��(��\r@��\04N�OG��k<���.\0�Ӻ�ox\�\�H�\0\0\0\0\0\0v\'��9Y�.���4)���\�\�U�h\\׼���ry\�\�ʢ���\�\�-Y����j\�\�-���9���Z\�P\" ԩ�J�)R\�S\��~[\�\�\��\�?Ef\��\���\�5?���I5]\0\�li(~[\0���+�\��ã�\0\0\0\0\0\0\0��9Yh��׏�:sާ;vp����\Z�wx�В�f(P#��4\�Z\�\�̮��l���!3Fd�\��kق�\�bՇ��8Ϫ8#\�\�ɀ�\�\����O��$/\�l��m��\�>$�����et��qp\�|:Fh\0\0\0\0\0\0\0h\�s�p.���L߸)\�\Z�di���\0�\�sV\rK��R���<7��Iw˘D���\�\n� gby\�M�_�@`^\�T�22V�ɪ�\�c6ȁ\�\��j͊�Z\\.jDXױe��\�?y\�@��\�}0H�j3	\�\�8\��\0\0\0\0\0\0Dm}N\��3\��M|\�˚\��E%\���\�-�w\�\�5�W��]�pu}#gM�k!XH7,\�AX�I\�XF\�\Z�Χ#v\0\0\0\0\0�裭\�ɂ�\0B\�ڶ}i劂\�\�\�X�^~\�\�g��\�E�\�խmi{��y�<\�w��N0\�\0��� ��\�$d,�㌗\�\�.\0\0\0\0\0\0}��9YF\\\0\0�\�\0�� �\�$d,�\���S\�\��\0\0\0\0\0\0@�\�\�\�dp\0\0\�aqR�\�LB\�2:\�x\�|\�\0\0\0\0\0\0\�G[��e\���\�oln��滓��烏=s�ħ&Lz\�\�W_oZ���8\0 ڰ�	`m&!cgh�k$��г�\0��ze\�\�0\0\0\0\0\0�$\���,�.�\rm|\�\�\�[�|U��\r�>j\�B���MU+V��n�]\�m\\\�Y\0�\�}0vW�T�$\�\��$\�\�\��^\�&\��`�ۮ<��+\�U�y��\�=��\���+ImS*\�\�G�Pث�9�ۉه\0\0\0Dm}N�f�\�����n\\\�\\[��z՚e\�\�+�\�\�(P�rMMݺ\�u\�&=�c\�.\0\0�*,\�\��.��ܱ��G\�\�\��3rF�;�#\�\�qt�\�8\�]\0rL|�<=f�\���v\�\��|\�=\�\�)����j3RC\�R\�\�\�^M��G~(\0\0\0@\�\�\�div\�ܹ�\�_--_)��\�J���\��G�\�q\0���Qy\rf�\0\0.��F׺\0H擺ϥ�\��		\�_�;V\�\�p\�\�\0�1W�i.\0��|(\0\0\0@��\�ɂ�\0\��J͚\r|\�˳/\�x\�\��LgNA�\�\�R��-���O�0\��\�}�)\�\�\�d\�А7\nn�{�\�>]\� �o\�z��\�\n_\��\�sh����\0D�%\0P�*p��\0\0\0�硭\�ɂ�\0\�\�0\�\�k\���\�m\�?\�(^��6)����wޟ���3{\�?�̤\'^x\�\�\����a톇��v1p\0��\�\�]\0�@đ\�H#����\0tR�\0\��;\�|\�|�\�z�޵�y\�h3>�<s-e�d3��iH]R\nq��J�\�@��z85P3�Ժ� ��\�q6#���_A�!\�\�n��\0\0\0\0]��>\'\� ���w�>�|\'\'8x�շK��XY�vm\�F��j+�V�-_P��xI5E>8\�\� ����\�RZ3j�=�\'U}v6�\Z)j�\�|Q}`�\�\��n�kp\�èY%|)�\�(N���\�\�\�\0�����@ \�#�--,4\�.\0:z!S{\�.���\�\�? ĤM���vWֿ�G��\�4\�U\�;\�pd$�Xg�\�*)=�Z�S\�g4�\�\��� �\0\n\0\0\0I��9Yh���[�,�p_Nynڢ\�*/�\��u��1Ϊ�(s7�n\�Q�(�!�����\��Z��\�nbVi⼜3�z�\�\0%h]W\�V�fA\0\"��`D\�`<\n ��S2\�r\�H/)�\0�`�\�\�gv��\n�\�ܿTh��k]%I\�K/\r\�]����L�\�)l4ܲ�\���\0\0\0Dm}N��@\�ԙ�8Y\���\��\�\���p\��5\�`ђ\�w\�,�\�o��\�G\�\��g\�P��\"[�\�,�\�]t�K-k+�Hl3�=��s��\�\�/\�Ǯ\�\�T�F\Z܃\0D	����@�\�>�\�\�8��\0��.\0/t��>o�\�z-̦\���)Vm\ZUy�M!D\�U\�\�$R\�rj\r#��\���.\0\n\0\0\0=��9Y�.���4)���\�\�<�\�E%U\��\�\�\�ߝ�ܫ��|\��\�Ϗ��\�\�)�|��Y5�\�~h\ngՐZX�\�.V⌠Mc\�-����+p��ú\0U\�\�\\�\�y\�\\\0��Wb݃\0D	����@\�\�^�\'\":\��.\0��\�2\�k����B�/g��j\����\��Gm��\�\�P\r�l\�]\0&�P\0\0\0�Ƞ�\�\�B�\0.�~�ԙ�>��a��^�\��.��r��Y5�6T�)�u�l\�v�@H�5O�3E��y�\�\�D�v�V�@o�DFZ�q�,\��]\0V��T@�\�8`���>���ʱ�;�R\�\�Q}�\\(\�+-q(N\�Ia<X�$iO��$Q�Ͱ�\�b\�\�� �G3\��\�ьN�\0z҇\0\0\0Dm}N\�p��\�7%Y\�>���\��r\�5��c�dΪa\�l�\�RZ�X�ڮ��[-\��\�\�\�Ȭbk�%\�m�s\�cF�e2\�d���� \0Q�\�}0�\�@ʞ�����\�\�X�:v8B4\�\r\�%T�a��2��K�?IK��T�i9^�߮�\���$�rfR�\�\����]�H@\�d\�U��(I\�\��r%i�\\��|(\0\0\0@\�\�\�\�dA]\09^ZQ\�\�\'�\�+Z2\�\�\�\�_X��N}�>(zq\�۷\�=\��rV\r��=���v\�=\�t�\�\0�\0,\�\��\0�\Z� =c\0��\0\0\0\0\0\0t=\���,� �\�6��w=4\�;�����|\�\��s����ָ\�#\�\�$� �\\^OýJx\0@�\�}0vW�T�\�#	~\����q?:\�\�h\0\0\0\0\0\�\�h\�s���\0\0\0�,\�AX�I\�XF\�\Z�Χ�y\�\�y\�!��Ȕ@\��Y�\�\n���\0\0\0�%\���.\0\0�;,\�A\�W�I\�XF\�/�\�\�w\0\0\0\0\0�8��\�\�2\�\�\�\�hoo_��vQiy\�%�J�VT�hmk�$\�\0�6,\�AX�I\�XF\�\Z�Χ#v\0\0\0\0\0�裭\�\�\�\�ؾ�����~MS˦�m\�?\�\��	�[���m(XP\�ڊ�\0\�\0�� ��\�$d,�㌗\�\�.\0\0\0\0\0\0}��9Y�]\0eխm훷�5oڶ�e\�G\�[\�(@����Q҂�ҝ;wr\0@Taq�\�LB\�2:\�\�88u>�\0\0\0\0\0\0Dm}N�~@IY\���6I\�\�uZ�\�\��q���Q�\�\0\0�),\�A\�W�I\�XF\�/��]\0\0�݄YY����I\0\0��9YP��^�Y��O|YR�|i\��e\�5u\rM$���o\�\�R[\�X�����bna	g\�b�\��~p���`�\0\�f2�\�q�\����\�]\0\�\�\�qƻ\�\�U�y��\�=��\���+ImS*\�\�G�Pث�9�\�\�\��o���\�ak�̆3	z�z\��%-t\�@ٱ5�+G��F>\�t\�G��\�ɂ�\0\�\�0\�\�k\���\�m\�?\�(*�V��_���f���˖/*o,Z�tIy�\��ƭ۶/\�q.\0\�c`qR�\�LB\�2:3\�%>\"g�\'��Gbh�t>U\�\Z�{SSP\�\��|Ūl�����i\�\�\�͚f\�gV\�n�4g�S�Q��No\��W�.Xϧ݃X�tj����SmFjc\�Yʣ�(~q�G\�TF\��\�SD!\0Lj_�4�?=���\�\�C�a�!\��\�o\�(�\�l�\�zN�\�lFjc�\Z]y-O\��\�\�\�d\�\\\0d��N\�g�{>\�/]\0�6o\�\�\�N�\�\�V�`m\�Ʀ�\��`��@�\�\�\�Q�z�\�\�\�\�+;_F\�g\'���	K�\��T\"��	�I\�S�+kպb\�!|.�n��`�\0\�f2�\�\�gFΈcss騹\0dB�<)\�����\����\�8�\�\�0\��Ұ�\Z�D�Z\Z�\�^<��\�D�a�\�	�@X�b�\�M3\�\�\�\���\�W���Rq\0D�\�D\�O��h���\�ƥ�I]1G�ϛ�L`Gp�\�j\��\�\�\�d�]\0Ҳn���\������*��^.�-[\�\�\�]\�Y5�\�6��)�\�\0%�+����B�\'Լ�VE�2�H���{�.��\�Z�y	\0v#X\��ԯ6����N7��\ra/��M\�;4��\��K\��\�]\0*6M\"\�}~V�<1p\n~@V5���\ZQX�\�\�G�\0|���\�\����O��$E�\�D\�O\nC�?�sHW\�Qp!>\�ym}N��@\�ԙ�8YaIyuIYUm\�ڍ�����`}sM]cy\�\�9s�f,\�\Z��6`An\�r!�-DF+��ˍ���D�\\\ns�����\�Y���\0�\�\�\�>$�����et�pu�{\0D�N�\0h�:��\�`s��\�\�yg��t�\'Xޤ\�`,�\�v06\�m\��o۵�=�ͼ�������\�Z)\�d��*�pj�f�u9,AFC\�\�lFh⼢U<\�2\�??.�\�h�LU��Α���\�\�Q�=\0�\�\�f\��xd4�<\�ft�O��پ\�9d���%\�\�$x�\0|�0q3��\���,E�\���_X�iv\�*W4�k^]\�T��vqYeQIłEe�,\\\\^Q�j�ւB�/�MT������JX1]n˜\�`\���5�� \\\0`7�\�}0H�j3	\�\�L\�ph\�\0��N�\0�t�p7(�砺\0D8���1�}bnP�H�\�\�\�0\�:���?k�5�)�T�������\"\�I��H�?��>��\�{62�.��\�hX�w�?N�\�J\\\�*�\����\�K�k}G��\n;�\�\�W\�D5�ym��I�z\ni�$\�g4\����%Z�4R\�Wjet\�c�J����)!|�:�}�����\�\�B�\0.�~�ԙ�>ݱ�TT\�����u��\Z\']�ޗ��; �V~�.W�� s\�2pT\�\�I0�j%J:\0�\r,\�\r\0!\"� 16w��d@hh\\�\0T�k<{\�t�\�FR�]\0\�Pq\�\�\r�a��]�R���\�\�J���\�\�?u\�\n\r<��b�S&\�h�eӇ\�{�긥6�)~(FXY\"�+f����\��G�^\0��l�\�\�	6\Zn\�\��\�%\�W�f(��燢\n9#l�7��\���\�>͈\n��l(�\�\�\�d\�\\\0�O��qS�5n\�\�j�w\�\�/\�\Z6e.Е�P�\�V~3�(9�*�%�\�|\�(0E$*\�(³\0�\�}0H�j3	\�\�L\�\���wd\���S�$�s�eZs\�]\0���\ZbM#Wc��h��)���*���\�\�@^E�\���O�\�\�\�6\ZF�$+K\���\�IqS�P���H\�\���}��G�^��)k�6\Z>��}\�:�){V(���\���`�ad\�ԟ�\0JR�\�l5)Js�?\��^�5#*$iRj_\0�R1�\�ӿ\���,� g\�K+j��ė5�\�J\�k\��[l\���k,�Z5�`\�\��FΚ94�\0��`�\0\�f2�љ\"�@d\�@\�\"N�OG\��ݙ�\�.���~�W\�J��\����b\�%��T\���n�$\�\n\r���R\�r(���[6��;Qn�	S\n�6�)~(���\��\���}u\�(�\���?=Wv�?=�P<���\���\�@\Z\n/\�ez@�M\�D䆶>\'\�Ek\����+\n\n��a\�{��\�~0��\��f��W��)�B3G\�.\0�v�	|	��\�\�>�~����et��u\�t\��]\0vj\n�\Z^u���\����\�SI\\\0§0,\�y�3$A�_w\����q9\��\�\�mj�_5)\�\��\�\�(�65\�vs\�N���=�a\'\\�\�\�,\�ḅ�֊U����X\��̩����P/�Í�+\�_��#J�\0z��\�r���4�xb4^i�2W�֯\�*\�.\0�fD\�\��Ɇ�$p��\�w^[��e\�\0\0\�\r`q�\�LB\�2:ݐ�\'�b���4B�i�T�qp\�|:\�%\\\�\�[#�F/i\�\���JaS\�X��\�\\\�K��ι\0\��B�ߪa\��\�rM\��\'i)5��*\�/\�\�m�om%Q~{�~93)\��\�\�j\�e�\\�}+|�f�\�\�%I��_\�u�g��\�0�\�gy�	5�^x�}u\�H|\��\�\'\��\�u�˒(�\�%\�k3z\�b�sP犔��\�9\�\�w\���t6#*`\"rt�\�\���.\0\0�;,\�A\�W�I\�XF\�/�?�ǿ\0�nB��l�;\�\0�\�	\0\0\0 �h\�s���\0:::\�\�ۗ��]TZ^�h\���\�E��+Z\�\�(�3\0�\r��`�\0\�f2�\�q�\����\�\�Sw\0\�\�8�q�C߰\n�b\�\�t��\�\0\0 >h\�s���\0�oo/)��_\�Բik\�����BF�\�-+k\n��b�\01�\�}0H�j3	\�\�8\��`wA٭�?���d�� @蝮@E��\�C\��$u\Z�\�E|(=|\�*=e4��9Y�]\0e\����5oڶ�e\�G\�[\�(@����Q҂�ҝ;wr\0@Taq�\�LB\�2:\�\�88u>�\0\0\0\0\0\0Dm}N�~@IY\���6I\�\�uZ�\�e�q�L�( ~h�0X\��ԯ6�����3^:�\0\0\0\0\0\0@�\�\�\�dA]\0wLz�f\�>�eI\��˗U\�\�54�\��ʿiCKm]c\�Ҫ\�Ҋ��%�5)�\�)�$_]\0�\�� �X�\�>$�����et��qp\�|:b\0\0\0\0\0\0�>\���,�`\�\rν�\�IϿݶ���j)�u�kV�Y�l���F��\�K��W��oܺm{a�RΚ9\"\���\�\�D\�\0��\�}0H�j3	\�\�8\��\0\0\0\0\0\0Dm}N\�@F�\�\�}��\�\��\��i�m�\�$�7mn��\0\�6mlZ\�L�y�\0X)��9B\�f\�Ζ�\���\�F��d�l��\�\�\�3\�*��o�Rʛ\�	#ND\�\�5q\�\�&ˉ\n\�\Z\�j�\0\��� �\�$d,�\���S\�\��\0\0\0\0\0\0@�\�\�\�d�]\0Ҳn���\��\�bKʪH\�{�\0�lm�3wg\�P�t�)�\�\�B��iV��h\�\�8\nq��\�\�Ljq[)�\"E\�s�\�P3@i���r\�U�8\0�\�}0H�j3	\�\�8\��\0\0\0\0\0\0Dm}N��@\�ԙ�8YaIyuIYUm\�ڍ�����`}sM]cy\�\�9s�f,\�\ZB6+�\�	S6[�\�e%	M�\�2\�\�KD�\�`+n�!�\�\�eT\0_A r�%\�\0�\r��`�\0\�f2�\�`F\�\�Ĉcs�8���#�GZhh�:��T�k<��Y\��{\�6h\�X9�yWKð\��9RP]\�\��\�-f8_�a\�F�Q\�-^\�]\n\0\0\0\0\0Dm}N��\�\�?M\�/�\�4;e�+\Z\�5��o�\\^������b���yEK..��Z�yKkA\�b\�ꊔ\�R-��\�\�ώ(+�psX�\�p\�\�\0[�$H\0ц\�}0H�j3	\�\�tS�;vD\�+�zf\�X�zZ*x\��\�\�\�PSP\�\�\�<��\����ك 1*�t�w)\0\0\0\0\0A��9Yh��׏�:sާ;vp����\Z�wx�0?[W\�΀3\�JA\�<G�N��z�\�}\0Jq��\�X%����V;�]E�V\� ڰ�	`m&!c�Q��:T\�oKL	\Z�ΧcDvd\���}b�r\n\0\0\0\0\0@�\�\�\�d\�\\\0�O��qS�5n\�\�j�w\�\�/\�\ZBx3��\0g�R\�\�\�V~[�\�\�\�ʣ\�4Sě��VfS9s\\\�^���h\0��\�}0H�j3	\�茢�|\�`$ur��Ώ\�.\0K��/\�\�is�lJ%p\0\0\0\0\0\�\nm}N\��3\��M|\�˚\��E%\���\�-�w\�\�5�W��]�pu}#gMv�\r\0H,\�AX�I\�XFgC\�\'D���RxFg�\�88u>#��\�\�V7v\��\��|h?a�\�0u�pX�v�\�]\n\0\0\0\0\0Dm}N\��ֶ\�K+W.~�\�\���\��`�;�\�\�.(*-�nmK���\�\0 3���_m&!c�9�7�Yw�������;�$��Ώ\�.\0��J�5�xbA��P�\�`�\�B��\�\�\�\�]\n\0\0\0\0\0Dm}N�\0\0`7�\�}0H\0k3	\�\�a\���w\��\�\r��S\�\�1*�\0x�s�P\�\�\�\��\�x�\�ֻ\0	�\0\0\0\0\0\0b��>\'�\0\0\���`��\�f2�љ@�}����{\0�N{\0b����o�vR\�Y\�\�t\�\�\�\0\0\0\0\0�\���,#.�������\�+k��.Z2��tAQiE\�ֶ6J\�L\0�h\�\�>$�����et\�q\��#%!���\�<@\�88u>��@\��W�\�\'��[\�\�L��|��.\0\0\0\0\0�X��\�\�\�\�ؾ�����~MS˦�m\�?\�\��	�[���m(XP\�ڊ�\0\�\0�� ��\�$d,�ӌP���UT�O\�;|x\'�?\��r\��.G�\0O\r��\�����f\�|��sZ.�R\0\0\0\0\0 �h\�s�4�\0:::\�*\�;�6omk޴mc\�֏���Q�N7oi��E�;w\�\�\0��\�\�>$�����et��qp\�|:�\�.\0\0\0\0\0\0\0<\�\�\�d\�w��U��h�T�N[��%~Q\�\�\�\�\�@�\�}0H�j3	\�\�8\��#�\0\0\0\0\0\0\0O��9YP��^�Y��O|YR�|i\��e\�5u\rM$���o\�\�R[\�X�����bna	gMJ~v�\�Tw�\\\0T��,\�AX�I\�XF\�\Z�Χ#v\0\0\0\0\0�裭\�ɂ�\0\�\�0\�\�k\���\�m\�?\�(*�V��_���f���˖/*o,Z�tIy�\��ƭ۶/嬙#R.��\�\��DN\0X\��ԯ6�����3^:�\0\0\0\0\0\0@�\�\�\�d\�\\\0d��N\�g�{>\�/]\0�6o\�\�\�N�\�\�V�`m\�Ʀ�\��`��@�].E���E ;[�f瓒8�L��\�u�V3�\�1V�\�|��R\�,Nq\"B\��4�\�r��D�F��R-\0��\�}0H\0k3	\�\�8C\�\�\��t\�.\0\0\0\0\0\0}��9Yh���[�,��\�4;%eU$��\\\0[��͙���j�z:\�҉\0kk!ߍ\\�4+I�\�nim\nq��\�\�Ljq[)�\"E\�s�\�P3@i���r\�U$V\r\0\�\0�� ��\�$d,�㌗\�\�.\0\0\0\0\0\0}��9Y�.\0iSg\�\�d�%\�\�%eU�uk7�\�\�\�\�.��\�5u�\�+\�\�-�]���j٬ܫ\'L\�l�gG��D$4��˸7/qv���N�\�S�Q=\0|�ȥd�uX\���6�����34N�OG\�\0\0\0\0\0\0\�G[���\���O��+8\�NY\�\�uͫ\�*�\�..�,*�X��l^ђ��\�+�Vm\�\�ZP����\"\�˦���#\�J\"\�\\\0V�A:\\\0�:���$\�c��A�`qR�\�LB\�2:\�x\�|\�\�5+�W\�,\0@��9f\�D�\r�\0\0\0���\�\�B�\0.�~�ԙ�>ݱ�TT\�����u�\�k�L�\�8��$�n\�s$ioK�牀]�+ŭ�\" c�̶r�Z\�\�v�Z++\0q�\�}0H\0k3	\�\�8C\�\�\��t\�\�\0hm�-\���\�ʣo�r\\�ǘ�ܣo\���O��\�\�0�R~}\�\n��\�\�\�Jz�a\�r:*�5����\0\0:��>\'\��\�􍛒�qK�V�� ~1g\�R���8��R�ж�\�2p��~P5��\"\�䗈�2��ʙ\�*J�J��V\n�\�\�>�~����et��3�D81b\�\�\�\"�4)\�+�rf�y\'�\��T�k|\��\�\0`�h�rt�z>\��XJ��J�T��\�z��hF�>~�j\Z]\0�P�6�<��\�\�8��-\r\�n/�\�\�g*��\���\�f\�\nڭ�i\�2�kWs�\�6�_{u�W)\�|a�gC\�+�M*�0�\0\0\0\�)��9YP@΄�V\�6�/k\Z\���\�\�76�\�\�P[\�X^�jv�\�\����5-\�5<\0 ]��	`m&!c�nH\��^�m^�9\�<��iq\�88u>��\�]\0���s��f\�P�ȇB�ϛ�Ļ�\�\�.\0\�-�\�aS�\�P�� �\�>qh7�\rW�cj�N\0\0\0\�,\���,� �mۗV�((\\����\�\�����wfϛ]PTZ^\�ږ\�a�\0\0\�,\�A\�W�I\�XFg\�`��92,\��\"WjS.\0�\04|]\05ź\�Ϩ�K\�c#\0\0\0tm}N�\0\0`7�\�}0H\0k3	\�\�bw$H��\����\�\�sw���/\��y\�h3>�<s-e�d3��	*]_	q��J�\�@��z85P3�Ժ� ��\�q6#���_A�!\�\�n��Xx�\0|���q��Ͱ\0>\0\0\0\�\���.\0\0�;,\�A\�W�I\�XFgǃ\0\�\�\�e|\0��t3B���[��<R}Ԧ!��\"\�I�##�\�:�OEUI\�\�\�Ժ�2>�a5\�֯!]\0�PB\�\��\�r��\�h����U\�1�w�\��\"��P��\���u\0\0\0$\�\�\�dqttt���/_Y����pђ�E��J+*W���Qg\0D�� �\�$d,�3ǌ�\�.\�\�.���\�b\\�qy\�\�\�l\�~���\�jS׺J���^\ZһB/U�Z�S&\�h�eK��%0..\0�.�J\�.\0�W�ez\0\\\0\0\0���9Y�]\0۷���U֯ijٴ�m�\�\�\�?!�@s˖��\r�[[�\�\0��\�>�~����et�0���\�\�.�L�\�b<��Z��=\�t�?>�ªM�*\�%T���b�S�Dj]N�`�adK�H��%8\�r��\�r����Y\��\�o�wσ\0p\0\0@�\�\�\�divttt�U�w�m\�\�ּi\�Ɩ�5o!�\0�n\�\�FI�Jw\�\�\�\0\0Q�\�}0H\0k3	\�\�L`<\0\�-� c�,W(�]\0*�\n����ªM���~2ػB�i�Z�Cl4ܲ�w�\�CI��J�wX���f\�\�\���\0\0\0�sh\�s���\0J\�*\��I*��\�В?��\0}X\��ԯ6����N;I�?�]\0�#�r<��rl����q9�DT�\�\�JK_�SvR�+I\�\�\�*IԦG3\�\���?\�\�\�{k��t4�.\0|(I-\�\�\�\�\�\��ê\�Ϥ�8s�[\�\0\0�Ρ�\�ɂ�\0\��J͚\r|\�˒�\�K+�/���kh\"�/�ӆ�ںƒ�UťsK8kR��\0t,\�AX�I\�XF�\�\0 �b\�}J\�.\�\n��S\�ӑjv��\�n�X��U<���\�0S_Z\�%ޟ��\�J�д/_�o\�++��ۓ�˙IIԦG3�\�vY\"\�fX5��*Q��\��\�J\�~�6�~(\�\�u\rg�SA(|~��-�#�\����O��.\0\Z�,����\�\���|\�!R\��C�~\�A�\�\0\0\0 0\���,�`\�\rν�\�IϿݶ���j)�u�kV�Y�l���F��\�K��W��oܺm{a�RΚ�\0\0\�>X\��ԯ6�����3^:x\�\�@�\�\0\0�Ј\�\0\0\0\�\���,���\�\�)�\�sχ��`\�\�m\�Z\�I�o\�\�*w�m\�ش��\",�r�\�gWp�\�|ǩ\Z!ϥ� ;[\�\Z1f8\0\�4,\�AX�I\�XF\�\Z�ΧcO\� 0\�\�aa\0\� \�\0\0\0\�@[���vH˺u\�\�\n�[@%eU$��\\\0[��͙���j\�g\'�}C^��\�\�7\�<%�P��S�\�A\'\\ު	\0�*,\�A\�W�I\�XF\�/�߳w\�\�<Skses�fA^+2>\�\�\�\�\�n#\0\0H\���,E���3\�q��꒲�ں�I\�okc��暺\��ʕs\�\�.X\�Y5\�=|��\�p\rk�\�\0�Z\r\0 X\���6�����34N�OǞ�\0\0\0\0\0\0\�m}N��\�\�?M\�/�\�4;e�+\Z\�5��o�\\^������b���yEK..��Z�yKkA�\�\�x��wU�ΰW\0@�aqR�\�LB\�2:\�x\�|\�\0\0\0\0\0\0\�G[���v\\x���3\�}�c\'8�����\�\�\0�\�\�\0\\�׃\0�֓yx\0�\��\�>$�����et��qp\�|:b\0\0\0\0\0\0�>\���,�\��)\�7nJ�\�-YZ\��.���ŜUC({&�$\"\��ƙ�u�ʝ�\Z\0\0)\�\�>�~����et��\��\�\0\0\0\0\0\0���>\'\�ș�Ҋ\�&>�eM\�����\��\�\�ۻ\0j\�\Z˫V\�.X�����\0\"��`�\0\�f2�\�q�\����\�]\0\0\0\0\0\0 �h\�s��.�P��m_Z���p����_�\��ߙ=ovAQiyuk[;g\0D�� ��\�$d,�㌗\�\�.�\�d�8\�]�\��<\�T\�}[\�|ҕ�6�)��\�#W(\�U\�\�u%=\�CѰu9\0\0�\���,#.\0\0�n\0��`�\0\�f2�\�`F\�\�Ĉcs�8Rⓔ4N�OG�\�5��\�@uU�\��٦Y?\�6kZ\"Ұa	lK\�0%�\�\�\�[8E�\�f�YгB_�R��O̥\�*�\�\n6gQ�܆ �&D˕�\��i� \�R��Wʤڌ\�\�г�G3�Q�\�`\�\\\0�P�6�<��\�\�8��Z3\0\0\0Dm}N\0\0��� ��\�$d,�\�MQ\�\�93��\"�}�R\�K\��\�.���bEH:\�\�\����E�Ϊ6\�	C�[z^�jʜ�\�[)���R�\���ā��\�4�JD>b}\�\�db>=]\0\0I��9YF\\\0\�\�\�\�W\�.*-/\\�d~Q邢Ҋ\��mm�ę\0\0ц\�}0H\0k3	\�\�b��\�\�\Z�ΧcTvhb�1|W߮���\��\�Qʦ��\0\�\n}����\Z\�M\�Ap�%�@m���\0\0\0�h��\�\�\�\�ؾ�����~MS˦�m\�?\�\��	�[���m(XP\�ڊ�\0\�\0�� ��\�$d,�3J�]\0^:?*�\0\\\�u�ݦ��[�,�\����.\0�B_l��K~��?�C!\0�\�\�w>7\�m\��g��\�l\�4A�\�+!��^I�\Z�rQ�j�Z�\�d4�<\�f�v��+H3d�\�\�?/�O�}��8�W�^\�&y^\0\0@���\�\�\�\�\�\�\�(�\��ۼ��yӶ�-[?j\�BF:ݼ����\�ܹ�\0\0�\n��`�\0\�f2�љ\�g��ORph�:��\� \�\�O\�-m�\0\�\��\�U\�r�]ٟoh{\�̜��b/\�xv@6f\Z]\��J�b\�]\��^n���H�Q�����x\'��D\�L>}T%�g#S\�r\����\�x[��t\�C	����\�I�\0\0\0ⅶ>\'K����r�G���wں\r-���8\0\0ч\�}0H�j3	\�\�\�1#����\��I\n��Ώ\�.�\�.\0y_]���\��l�w\'V)���?a<\�p\r��6\��\��\�~���\�jS׺J���^\ZһB/U�Z�S&\�h�eK��%0..\0�.\0\0\�\�\�\�\�dA]\0wLz�f\�>�eI\��˗U\�\�54�\��ʿiCKm]c\�Ҫ\�Ҋ��%�5)\ry�F\�\�p\0�.�\�}0H\0k3	\�\�a�|���>I!�qp\�|:R���t\�Jl\��3BcKy�jo\n[\Z\�\�Pc��\0�\n}��\0\�\�WO\��dJFh!\��l\�u���\n�6��<��Pe�*�uNm�u95����-�\"M>�\��\�\�ܯ\�\0\0\0v7��9YP��&�{\�ݓ��m�\'\�AE\�*R�\�64׬^�t\��E%⍀E��.)�^]߸u\��\�⥜5)p\0\�}���_m&!c�	�]�\�\"\�\')<^:?\"�\0\\ļ\�n�T����͕\�\��M��]\0^�\0T	Z}9K�U�~w_�d�w�>j\�$�.�\"\�h�e\�0���q\�\0\0����>\'\� ���w�>�\��a~\�شy۶\�v��6�\�]\0k�66�o�\���\\\0��{1\���S5B�KAv��5b\�\�q\�(\0��`�\0\�f2�\�i���?A\�\�\��t�\�.\0BlKQ+��u\�m= ��\0\�>|\�#\��V苽���L�\\\0�5�c�w ��\�9%����WWZ�J���\�x�\\I\�\�VI�6=�a\'\\�ge��<\�=\�\�\�{k��t4�.\0|(I-\�\�\�\�\�\�w�\�\n\�\0\0\0\��h\�s�\�.\0iY�NY\\\���PIYI}/���ms\�.\�\Z�\�	�ސ�m\��\n\�\�@\�|\"Ľ\�0s\�	�5e;j\0��m(����et�*��JB��$��K�v��]\�\���\�۷ko�\���,�~#�j>�B_\�\�\�O��0���4���\�\�r.��$-�fPR��\�x�2|K_YI�ߞ�_\�LJ�6=��\��\��6\�ʼ \�PU�舒$\�\�/W��˵=�Cq�\�h8���\0\0\0 Vh\�s�]\0ҦΜ\�\�\nKʫKʪj\�\�n$����]\0\�k\�\Z\�+WΙ[4�`!gՐ�\�՝���5�E���\��\�\0i\�Ph3	\�\�8#\��y�]\0\0\0еH\0\\\0\0\0��9Y�.���4)���\�\�U�h\\׼���ry\�\�ʢ���\�\�-Y����j\�\�-���㤒wU�ΰW��#\0�� A\nm&!cg�_r(�c�v\0\0@\�a\�F��\0@\\\�\�\�d�]\0^?~\�\�y�\�\��	*�j�\�\��:��ls羋\��z���\����\�\r\0Ҵ�\�f2�\�qF���]\0�\�\�p͂�Vd|(�\�\0\0\0@�\�\�\�d\�\\\0�O��qS�5n\�\�j�w\�\�/\�\ZB\�3�\�\�(S�g�tUޫ5\�9k\0��m(����et��~ɡЎ\�\0\0\0\0\0\0���>\'\�ș�Ҋ\�&>�eM\�����\��\�\�ۻ\0j\�\Z˫V\�.X�����\0\"i\�Ph3	\�\�8#\��y\�.\0\0\0\0\0\0}��9YP@(Z۶/�\\QP���\�\�/|���\�̞7�������-�/H\0�\0	\�Ph3	\�\�8C��C��\0\0\0\0\0\0Dm}N�\0\0`7�4m(����et��\�\�<b\0\0\0\0\0\0�>\���.\0\0�;$hC�\�$d,�\��K�v\�]\0��<\�\�\�\0\0\0\0\0z$\���,#.�������\�+k��.Z2��tAQiE\�ֶ6J\�L\0�hC�6\�LB\�2:\�\�qp�k�x�\�˸}�\0\0\0\0\0@\�D[���\��}{{IYe����M[۶���2\n4�lYY\�P����\r\0�$hC�\�$d,�3���$#\�\�q$Q�;V\�Krfp|\�P�\�PhG�\�5���\�u{�j\�\n\�kP��\�i��\�EN㴥a��H�\���1~�\�B�>I\0\0\0\0\0�\'��\�\�\�\�\�\�\�(�\��ۼ��yӶ�-[?j\�BF:ݼ����\�ܹ�\0\0�\ni\�Ph3	\�\�tC:DB܋�\�`1#\�3)0r�\�\���\0La�#\\\0\�r�\��U-cى`f\"\�\�\�OM\��$\0\0\0\0���>\'K����r�G���wں\r-��\��8@CިQyb�\�cIa0h���\�f2�\�\��x\�\�>�Nn�~ɡЎvx�\0��\�H�r\�\�USP��Ĕ�\�\��>I\0\0\0\0\0����\�ɂ�\0\��J͚\r|\�˒�\�K+�/���kh\"�/�ӆ�ںƒ�UťsK8kR�k\�Pjv�T\�>-�J�~�@�B�6\�LB\�2:�x�\0DJg7��\��ؙ]\0��gMK�}o�#佱����\�?�$\0\0\0\0\0\�\�\�\�\�dA]\0cn�p\�wOz�\�\�p�U�H��\�\�\\�z\�\�e\���7-^���zu}\�\�m\���r֤ר�\�l\n\�7�j٧�^I\�\�\�VHІB�I\�XFg\�\0C��\��S\0�K�v��Рx\�\�ƯZB۳@\��\�!\�}\\\0�~@\�\�7p\�|�$\0\0\0\0\0У\�\�\�d\�\\\0d��N\�g�{>\�/]\0�6o\�\�\�N�\�\�V�`m\�Ʀ�\��`���$)�d{e\�맖^U������f\�H#�gg\�(g���l>�*��\\�h�\��ۣd\�T��\�*g�J� ��%Q�92�\�>eE���؍!�\nm&!c�9f\����N�@x\�8�:\n�\�ص�}b��¿�.\0S\�;վO\0\0\0\0\0\�h\�s�\�.\0iY�NY\\\�\�,)�\"�\�\�ز�m\�\�E�U�\�\'k݆�\�N6��6CB��%�T�\��D.�����Y�8+1�\"F�^\�~	�D~+ \�N5X%�\�q!�\�K��|sd��	��<�\r>�!$hC�\�$d,�3������\���\0\�/9�Lr��gZ���C:_<\�ol�ה�O\0\0\0\0\0\�h\�s�]\0ҦΜ\�\�\nKʫKʪj\�\�n$����]\0\�k\�\Z\�+WΙ[4�`!g\�z\�~{YծV8rM���f \�\�¤q�\"�$\�h-����Sg\r2ƙG�q��\��4^M\�W\�E�!\�ƿ\�%d��U즐�\r�6����\�\���\��\���\0\�8�:\n��\0D�j��@y C�^�{C\�\�\��\�\0\0\0\0\0z,\���,E�\���_X�iv\�*W4�k^]\�T��vqYeQIłEe�,\\\\^Q�j�ւ\�Ŝ\�U��K\�D\�5U��,��)�7���8�k�_;u\� �ص�3FE�\��\"�ג�.\0gY�mP\�@O�m(����et\�	��\��\�/9�L ��\�r:\�\�0��}�q�\�\��Ʀ�\��I\0\0\0\0\0=m}N\�p\��\�Μ�\��ࠢ�\��]\0��\�ϖ\�\�&YM\�)���.2V\�V�B�b)g�J!�Z�3^\r\�T��\�%\��j�穽gߝ1.(՚Agc\�5Iu\�\�Z�<�\r�f�\�\ZҴ�\�f2�\�iF8\0��\�Y��\0R��Dv9��\���0�H�\� OU�RD� w�U���>I\0\0\0\0\0�ǣ�\�\�¹\0\�2}\�\�\Z׃��\��\�ȟ_\�Y5�\�dXg�Qƹ��x�]B�rE	5�\�\��U&X7��TBh[ײ\�.��mF�v�\�\�\�%\��Zk|\ZoK�����W�p��$hC�\�$d,�\��KE�c&I\�\�w�\'	\0\0\0\0\0�\\��9YP@΄�V\�6�/k\Z\���\�\�76�\�\�P[\�X^�jv�\�\����5j���� i\�Ph3	\�\�8#\�!\�1c�\��\�\�\�\0\0\0\0\0z.\���,� �mۗV�((\\����\�\�����wfϛ]PTZ^\�ڦ��U40\�G�ƶ\�L&q\��\�@�6\�LB\�2:\�P�\�P<\0\0\0\0\0��9YF\\\0\0�\�\0Ҵ�\�f2�\�qF�C�#\0\0\0\0\0\0A[���\0\0p�m(����et��~ɡx\0\0\0\0\0 :h\�s���\0:::\�\�ۗ��]TZ^�h\���\�E��+Z\�\�(�3\0�\ri\�Ph3	\�\�8#\�!\�\0\0\0\0\0����\�\�\�\�ؾ�����~MS˦�m\�?\�\��	�[���m(XP\�ڊ�\0\�\0��\�f2�\�q��%�\"\�\0\0\0\0\0�蠭\�\�\�\�\�\�\�(�\��ۼ��yӶ�-[?j\�BF:ݼ����\�ܹ�\0\0�\ni\�Ph3	\�\�8#\�!\�\0\0\0\0\0����\�\�\�\�()�\\�\�&����nCK��\"<\0@�!A\nm&!cg�_r(\0\0\0\0\0�\���,�\��I�Ԭ\��\'�,�X��b��ꚺ�&�R�7mh��k,YZU\\Z1����\0\"i\�Ph3	\�\�0#g\�p�#\�\�q�JQ\�X��3�\�SE�C�㮖�\�n\�\�˲a[D4S��$	VP\�I��=s�Y\�lE�R��\�4wb�������5\�8�,��PZ\�\�\�-\�*�Z\0\0\0\0\0\"��>\'\�sÄs��{\��o�m���<��ZE\�݆\�\�k�.[��D��h�\�%\�ի\��n\�^X���\0\"	\�Ph3	\�\�tC�\�\��\"\���رc)�\�.\0\���G�!����L*jK-�S�\�:\�.\0ƙ�\�|\"R;��T\�\�\�B\���H1�/\0\0\0\0\0@�\�\�\�d\�\\\0d��N\�g�{>\�/]\0�6o\�\�\�N�\�\�V�`m\�Ʀ�\��`���!oT/&;_��IFX\�\0\��iC�\�$d,�3�\��+}\��[4#\'\r.\09��R[.�]�j\n�Y�:�.���ä�eU\�\�\�\Z�\�q`�\0\0\0\0�ȡ�\�\�B�\0�e\�:eq��͟��*��^.�-[\�\�\�]\�Y5���!/;O,�\���\�1f\0@f A\nm&!c�Q.\03\"-.\0\���G�\�\�6�-&.�YtR�49\�\�U.\0�\�\�M_j&\�ի\�0�\0\0\0\0\0�y��9Y�.\0iSg\�\�d�%\�\�%eU�uk7�\�\�\�\�.��\�5u�\�+\�\�-�]���j\��R\�3��Ź\�p\�\0\��iC�\�$d,�3�!�\�,\��]\0���\�=�rV\�\�\�\�%\�\"�\�!�),�yZ\\\0\�-���Ñ\�\\\0\0\0\0\0\0]��>\'K\�p��&\�Vp���\��\�W\�7U.�]\\VYTR�`Qټ�%�WT�ڼ���p1gu\�.�\r�oz\08\0\�<$hM��\�\Z%p\�h3	\�\�\�1#g��\�\��H\�\�]\0\�\�@�\��)6,w�qQq-\�\�Sq$\�\�\�\0\0\0\0\0��9Yh��׏�:sާ;vp����\Z�wx�0?\�\�\�oI~��\�\��]�\0\02\0iZ��\�\�N%\�LB\�2:C�\�&�\�?B�\0Ԙ̸\0�$Ym��\0�0\�\0\0\0\0q��9Y8��S�o\�d�q�)YZ\��.���ŜUC�}S�\�X\�\�=\0 ���5���\�\�*\�LB\�2:\0h\n�4���@\�?\���G�\�\�6��\��.\0�.p�u\0\0\0\0\0Dm}N\��3\��M|\�˚\��E%\���\�-�w\�\�5�W��]�pu}#g\r\��\�M��Uaݟ�c����et\�q\��N\"��\���&O�@T\�\��ݟϐ�y!_\�\0z�i\0\0\0\0\0Ѕh\�s��.�P��m_Z���p����_�\��ߙ=ovAQiyuk[;g\n�\0\�吠\�`�\��	m&!c�f��\�\�\'p\��\��.\0\�\�\�	���**Z/\�˔�B{ۓd)�W)O�{)��s\�v�\0\0\0\0\0\0@���\�\�2\�\0\0\���u\��	m&!cg\�8�:�\0.\0\0\0\0\0��C[���\0\0p�m(����et��~ɡx�\�\�\�\0\0\0\0\�Z��9YF\\\0\�\�\�\�W\�.*-/\\�d~Q邢Ҋ\��mm�ę\0\0ц4m(����et��\�\�\�\0\0\0\0\0�\�A[���\��}{{IYe����M[۶���2\n4�lYY\�P����\r\0�$hC�\�$d,�\��KE�#\0\0\0\0\0\0\�A[���\�\�\�\�QV!\���yk[�m[�~Լ��t�yK%-(*ݹs\'\0\0DҴ�\�f2�\�qF�C�#\0\0\0\0\0\0A[���\�PRV���MR�;m݆���Ex\0�\�C�6\�LB\�2:\�P�\�P<\0\0\0\0\0��9��`Æ�z���\�\n�0X��6�����3��\���G\0\0\0\0\0\0\"��>\'�@O�к\0�u�i3	\�\�8\���G\0\0\0\0\0\0���>\'�@O�к\0�u�i3	\�\�8Ck��\�y\0\0\0\0\0 \"h\�s2�\0���\�\n�0X��6����\�\03rF71blnGE�ce�DKM�\�<\0\0\0\0\0��9\\\0\�xx\�Ҽ��	k\�]\�\�@\�\�\�\�$d,�\�\r\��93����\�igU�\r�[�\��\�#\0\0\0\0\0\0A[��v�>>f�\�1�/I\�,�\�f�h\Z5;@#yx�T.�\�Ms�}\�\��4�\0SL�I\�XFg\��p�\�\���G\0\0\0\0\0\0���>\'\� \���<}\�\��\�|�v�¿i��|\�r�S\�\�\0�)�\�$d,�3J�]\0��\���G\0\0\0\0\0\0\"��>\'\�x�\rqXbl\���߸y0s�\�7\�<F�q\���gm(��j��*�$Xfު �.\�b<<\Z�\n?�/\�[�$2,�e�}��p$2\�S%χ/*I�v\�S��\'\�\Z9�O�.�`\�n\�LB\�2:�\0ۃ\0�\Z\0\�5�2�j\�y\0\0\0\0\0 :h\�s�p.�R!\�o~�¤�9F\�F�%����]���\�7�H�*�\����E��*�\�p@p\r>��$�F��rE��\�rS\�\�|b�}yJ�r�\0\�$\�o�\��1\"�R� Qm\�r\��b��Z`�n7m&!c�9f\�\���\�\�\Z�[�\��\�#\0\0\0\0\0\0A[���uț��\�Vյu�_K2\�O%L\�#;\\�J�d�b���ǃ�9�\� ��\�w�\�iB\�\'�\0H;o\�\'.yT���@�\0�\�Kx�u\�v\�f2�\�\�P�\�3\0n\�\�QH	�\�<\0\0\0\0\0��9Yh�\�M�j��\�\�\"�U�\�\�^��%�}\�3�3�����a\�\�\�\���@~s\�@\�)@sh]���ݴ���et&0\0H&\�\�\�	H	�[�\��\�#\0\0\0\0\0\0A[���w8cԀ\�.\0g\�\05��\�_D>.��s�\�$�\�g<<\Z�\�\�m|	+yǃ\0��7w��\�g\�\0>.\0�$4�S�\�,�(\�\��\�M�I\�XF��@�_M@j��}\�\0\0\0\0\0�蠭\�\�\�\�0_�\'^ŧ	oS�;�P��h��p�Y-G�ޥ*�\�`�er�\�\Zz޶Q�\�_�\�{�\���\��x\�\�����/Z`�n7m&!c�f��\��S0�3r����4\0���k~\�\0\0\0\0\0����\�\��\02jo\�\�/\�3m<<�B\�\�\�\�$d,�㌿\�w\0\0\0\0\0�\����;]\0\�&\0~�wO�к\0�u�i3	\�\�8Ck��\�y\0\0\0\0\0 \"h\�s�h\�\�n\�\�Z`�n7m&!cg�վ�\0\0\0\0\0@t\�\�\�dp\�\�Z`�n7m&!cg\�o\�_�;�\0\0\0\0\0\0Dm}N�0�X�u\�v\�f2�\�q\�_\�;�\0\0\0\0\0\0Dm}N�0�X�u\�v\�f2�\�q��\��5��\0\0\0\0\0@D\�\�\�d..\0K����3�j\�y\0\0\0\0\0 :h\�s2�\0`0X��et��y\�_�;�\0\0\0\0\0\0Dm}N\0˔���3�j\�y\0\0\0\0\0 :h\�s2�\0`0X��et��3b���cs�8\�bF�L%rfp\\jм\���G\0\0\0\0\0\0\"��>\'�\0�e\�XF���ܱ#\�^�m^\0#\�L\�4�j\�y\0\0\0\0\0 :h\�s2�\0`0X��etF1$���g\�nH�7�5��\0\0\0\0\0@D\�\�\�d..\0퇾`0,�i3	\�\�bw�\��]\0\0\0\0\0\0 \�h\�s2�\0`0XzL�I\�XFg��\0\�,gƌ�\�:�D\0͛��\�y\0\0\0\0\0 \"h\�s2�\0`0XzL�I\�XFg\�\�m!��\�:�+�_\�;�\0\0\0\0\0\0Dm}N\0K�i3	\�\�a\��m~!�mb[@�|\04o�k~\�\0\0\0\0\0����\�\�\���`\�1m&!c�	�\0\����\�\�\0�վ�\0\0\0\0\0@t\�\�\�disTN�\�u�\�I0�\'�6����N;\��\�����|�\�C�\�w\0\0\0\0\0�\���,� !��۴J-I؇��t]�t��\�`�\�7m&!c�f��7^�g�\n}J\�X\�kR\�_\�;�\0\0\0\0\0\0Dm}Nf��\�5�I\�e�f�V\�f2�\�q�\�M\�\�<\0\0\0\0\0��9YJ.\0\�\�57��s#,�\��\�\Z`\��\�^�\�\\#�\��|J\�k��`\�\�w	YֈLؓO>�0\�g(,M�I\�XF\��\�<\0\0\0\0\0��9Y�.\0!\�)2��_\�__�EF�ƭ\"ZqJ��,o�j��5[a�K$Z���д���et��y\�_�;�\0\0\0\0\0\0Dm}N��.\0)\�e\�K��q+n��#Ƶ`�H2R\�֙��#��3��6�����3�j\�y\0\0\0\0\0 :h\�s���\0\�_���\�8&��!#�u�i3	\�\�8C�\�w\0\0\0\0\0�\���,.\0�]�fgqg=H\�A\0N�!�H\�:s�a��K\�f2�\�q\�_\�;�\0\0\0\0\0\0Dm}N\� �vb{�Sl[1�\�\�3�jgq+�x�x���d\�PMZ%F�\�%�\�`0X��6�����34o�k~\�\0\0\0\0\0����\�\�\�\���`0o\�f2�\�q\�_\�;�\0\0\0\0\0\0Dm}N\0K�i3	\�\�8C�\�w\0\0\0\0\0�\���.\0�\�f2�\�q\�_\�;�\0\0\0\0\0\0Dm}N\0K�i3	\�\�8C�\�w\0\0\0\0\0�\���.\0�\�f2�\�q\�_\�;�\0\0\0\0\0\0Dm}N\0K�i3	\�\�8C�\�w\0\0\0\0\0�\���.\0�\�f2�\�q\�_\�;�\0\0\0\0\0\0Dm}N\�\�\�\0��\ri\�Ph3	\�\�8#\�!\�\0\0\0\0\0����\�\�\�\0\0�C�6\�LB\�2:\�P�\�P<\0\0\0\0\0��9\\\0\0\0wHӆB�I\�XF\�9��\0\0\0\0\0\0Dm}N\0\0���\�f2�\�q��%�\"\�\0\0\0\0\0�蠭\�\�\�\0\0�C�6\�LB\�2:\�\�qu\0\0\0\0\0 \"h\�s2�\0\0\0\r�6�����3\�/9�\0\0\0\0\0\0Dm}N\0\0�ҴN��\�\Z9\�f2�\�qF�C�#\0\0\0\0\0\0A[���\0\0p��\�	�\�\�f2�\�q��%�\"\�\0\0\0\0\0�蠭\�\�\�\0\0�C�V�\��U\�f2�\�qF�C�#\0\0\0\0\0\0A[���\0\0p��	\�~C�s\�\�\�f2�\�q��%�\"\�\0\0\0\0\0�蠭\�\�\"\���ՋȚŧ\�ݙ}��\�{\�J>�>mp\�F#���5\�4�v*\�f2�\�qF�C�#\0\0\0\0\0\0A[���qH]n2lb\r\'��H�\0js�\�\�4o	�\�\"Í\��\�]+oT�]X\�Ǘ�D���6�}&�\Z\�I\Z,k`��.�����S��\0�KE�#\0\0\0\0\0\0\�A[���wH\�a�=�T�e�����i\�V\�j3�\��\�-��� M\nm&!cg\�8�:\0\0\0\0\0��9Y�.���\�d\��T�\�e�\�\�( \�JT\'�$�O�#Du2\�pXA\�E���Y��)��;ۛr\�N�\n�1^[x6q�\�07jP�B�6׭��\�]}nϖ��+r\�3gswܚ�\\Bng8;w�0����L\�i��-\�p�d��\�f2�\�q��%�\"\�\0\0\0\0\0�蠭\�\�RtX�C\�ݟ5\�U�+E\�,vp��*\�>e�H\�n�Y-L\�\"\�����D�]\�\�0j\�R�^5\�n�\���D�[����W�9!m4կ���K\�����nk0�T\�^9\�$�iC�\�$d,�\��PG\0\0\0\0\0\0\"��>\'\�Ļ\0Y\�j�OT�n�\�\"\r���=�Vb������)6�ĕƊTq\�ԦM\�\�J\�T��M\�\���\�\�MߪB\��_\�]{^B	�y\�\0�\�h0\�\���m(����et��~ɡx\0\0\0\0\0 :h\�s�T0�\�mWe�yb�4�b\�lVX����򮵹#%�4��]\0R\�&\�\��֌O\���&\�;���+Q\�j��\�\no�)R\�\�\�\�la�9HӆB�I\�XF\�9��\0\0\0\0\0\0Dm}N�f��b�4�12_�&ײV�\�E�kӑ��������J�NTjT]\�;����i\���%�xNrEw�\�)\�m�\\��\�KT����G��\" ���\r�6�����3\�/9�\0\0\0\0\0\0Dm}N�n@\"BbE�J7��j>��G��w�t\\\�Y�3�Ԑl�vUԯa�\��F�Q@�[�&5�r�o4��i,�\�y��-3��k�\�\���,\�&G�@1�ϧ	\�\�\�M�֣r�1HӆB�I\�XF\�9��\0\0\0\0\0\0Dm}N\���!��\"�{$,����	\�Ph3	\�\�8C��C�\0\0\0\0\0@t\�\�\�dph.\0�]3��\r��\0HӆB�I\�XF\�9��\0\0\0\0\0\0Dm}Nֳ]\0\0\0oHІB�I\�XF\�\���G\0\0\0\0\0\0���>\'�\0\0\�i\�Ph3	\�\�8#\�!\�\0\0\0\0\0����\�\�\�\0\0�C�6\�LB\�2:\�P�\�P<\0\0\0\0\0��9\\\0\0\0wHӆB�I\�XF\�9��\0\0\0\0\0\0Dm}N\0\0���\�f2�\�q��%�\"\�\0\0\0\0\0�蠭\�\�\�\0\0�C�6\�LB\�2:\�\�qu\0\0\0\0\0 \"h\�s2�\0\0\0\r�6�����3\�/9�\0\0\0\0\0\0Dm}N\0\0�Ҵ�\�f2�\�qF�C�#\0\0\0\0\0\0A[���\0\0p�m(����et��~ɡx\0\0\0\0\0 :h\�s2�\0\0\0\r�6�����3rB\0\0\0\0\0�\���.\0\0�;$hC�\�$d,�\��KE�#\0\0\0\0\0\0\�A[���\0\0p�4m(����et��\�\�\0\0\0\0\0@D\�\�\�dp\0\0\�!A\nm&!cg�_r(\0\0\0\0\0�\���.\0\0�;�iM��\�\Z%p\�h3	\�\�8#\�!\�\0\0\0\0\0����\�\�¸\0fe�R6���و�Y|\n\0\�$hMH�_;�h3	\�\�8C��C�\0\0\0\0\0@t\�\�\�d\�]\0R�w��\0�.�4��\���V\�f2�\�qF�C�#\0\0\0\0\0\0A[���\���8L�e \�0SE��Y~y�%��f\��	Α��ĈT#\�\�ȣ_ݑ\�L7�\0p��\n\����\�$d,�\��KE�#\0\0\0\0\0\0\�A[���\�pS\�J�Mޫw\�y�T%\�1c�F��\��y�\"|���L\�1\�t%\0\��4��7�Oh3	\�\�8#\�!\�\0\0\0\0\0����\�\�:�.\0�71�5G%r�\�у�ķ1�\�\\\0\�y8\�%d?\0�!A\�\�K�\�LB\�2:\�P�\�P<\0\0\0\0\0��9Y�$p�w���Ǒ��:L\\\\\0zg�,$\�\0�$��\r�6�����3rB\0\0\0\0\0�\�����.\0%\�C\�ȣf�$>\�vM�[\�֙�\�~u�x5�3\0�B�6\�LB\�2:\�P�\�P<\0\0\0\0\0��9Yg]\0�\n�\�\�{���G\�n��2!�̠\���y\�\�t\�\�\0\0^��\r�6�����3rB\0\0\0\0\0�\���,�\0\0Г A\nm&!cg�_r(\0\0\0\0\0�\���.\0\0�;�iC�\�$d,�\��PG\0\0\0\0\0\0\"��>\'\�A.�\r>��`�3m&!cg�վ�\0\0\0\0\0@t\�\�\�dp�`���6�����34u�k~\�\0\0\0\0\0����\�\�\���`\�1m&!\�=\0\0\0\0\0\0@w��\�\�\���`\�1m&!\��R\0\0\0��<\'\0\0\0�C[��u\�м��	k\�f\�.�aN\�7o�����\��\�\�\nK�i3	O<a\�\�/\0\0�lxN\0\0\0:��>\'\���Ź����~���\�]\0-�\�T�l3��\�Z�\"\�UܝTy8�/\�\�eo\�<\�\�\�7�ԀF��y�T���z�i3	O<a\�\�/\0\0�lxN\0\0\0:��>\'\�h�Sj*�_�{ޜOD���\0���T�\�5�\�V����7���o\���j\�LB\�Ox�\0\0=�\0\0�Ρ�\�ɂ�\0\��\�ōz\�T�\�L0n\��\�i�eN�-�\�引 QP�\�mS\���<�<�(b� d\rɶhr����1N\�/���$qnnpĨ��ťsA$\�|��Jy�y\�f2�x\\��\�x�\0\0=�\0\0\0_xU��h\�s��.\0S�3	��P\�	�_�<��I�\�H\n�2��Ź�Tҿ�g�j��V�\��\"Vm\�&W4������\�9\��7n&ol�7��͆\�w\�X.�7�GDq\�\n�l\�CI\�lw3m&!\�\�\�R�/~\0�g\�s\"\0\0\0�^[{����9Y:\\\06A.\� <ߴ\������@�6�oeP\�4�x�\�\�\�f|\��ŘǗp�y��\�5F��3l\�,1B�\"0\�\�e\�LB\��\�O\�~J^�\0@φ\�D\0\0\0 \0�\�v[ck\�s��<`\no7�&ˣ\�0̸K�jx\�(\�\�`�R�˰\0lw6m&!\�\'\�L\���\�\�/\0\0�lxN\0\0\0��\�l\�J[[����u�.�\�r�\��/r>�ڃ\0Z��\"Vm)>�\�\�\�>��V�f�?\�<n<`���w\�X:\�\�A\0N�\0�;�6���ģ�3v\0\0�/<\'\0\0\0\�v�w\�0�\�_y!�\��e`_��:@R�\��\�=QDdH\�P2��\�\�\�J\�O�\�\�B�3B\�k�\�2�u��j�.\0\�\�o\�LB\����<�\0��\0��\rω\0\0\0@2xm�\�\�\�d\�\\\0��?5\r4���\�k\�LB\����\�\�)^�\0@φ\�D\0\0\0�^U{\�\�\�\�diw�]}~L Jhr��״���\'�0�\�\0\0z6<\'\0\0\0�C[��eh@\�\�\nK�i3	O<a\�\�/\0\0�lxN\0\0\0:��>\'�\0��Ǵ���\'�0�\�\0\0z6<\'\0\0\0�C[���\0��\�c\�LB\�Ox�\0\0=�\0\0�Ρ�\�\�\���`\�1m&!\�\0\0\0\0\0\0\�h\�s2\0��`0��`�\�\�\���`0��`0�G\\\00��`0���\0��`0��`�ap�`0��`0\�#.\0��`0��z��\�\'b\\\0\���t\0vkN\�B��\0\0\0��\�\���\���\0���?��CQt|\0Ѓ����\�K\�K\0\0��\�3j|I\0@ƀ\0\0i\�\�!�:\���\0\0\0����\Z_\0�1\�\0\0D\Z�\0z�λ�$\0\0�`h*=�Ɨ\0d�\0\0\0�.���.�/	\0\0 �JϨ�%\0.\0\0@�����\�K\�K\0\0��\�3j|I\0@ƀ\0\0i\�\�!�:\���\0\0\0����\Z_�\0̘1c�B[[\�i��&�;찺�:?~�x�d\�Ce��JQY��\�������IEd*k\�)p\0\0\"\r\\\0=V\�]_\0\0@04��Q\�KR檰\'\�M7Q��zss3�R\���L�Uë1TI]]\�a�&#׮]�\�lkk� ��\0@.\0�ݯ\�9�����\�F�\�\'�o_��\�#l\�}��\��#�}���އq5�ӻw\�}�\�o�c0��\�x\�\���\�\�\�޽�q�`�:W9�\�\'�u\�)���\�~\�\�oG��\'�\����۩?�C���\�)\�y�)�rm\n|\�`\��\���\�=�/��7G���C�>��\�=�\'O�L:\�\�\�\�\0�(@�<���:\� .f0�_�;��pF���\�T\�߾��2\��\�\\r\�iW?�\�_<�\�ac\�9\�\�\�:\�\�A}t�\�}\���\���\�I�y\�[���2bĈU�V544<�\�C4��A�\�ߟӂ1h`��&\\]:\���s*?��\�\��[�ָ�]tz�}{\���rȁ\�:p\���|p���\�t\�>��\�C�gBh�{�0`�\�N�ΉC��\�8}R��޿D�>�C{\�{j\�?\�\���}�;g\��#�\�\��\��D3\�1G��\n\�?\�\���rTZ9�o�\��݃q\�A\�9�;\r:a\����	�7���\�6\�\�\�O{\�ᓯ6\�\�C�T_\�Kv�\���3N<�\�!\�y\���}8즐2_�nǏ/<\'(I|nlX�|���\�@yy�\�Y��W�\\if�)p\0\0\"\r\\\0>\�R�\�C�|�\�u�~zǷ���\�S??�\�\�N<q\��\�:t\���\�\��u\�\�G\�~\�a\�9��\�8`\���\�\�ڿ�\�F%\\]H�\�w����0���:���Ɯ��~{\��\�_|\�\�\\<萟\��\��N\�w\�A�;�\�N:뜓�&��\'N��\��\��S��	�\�=!\�\�~�����|ѝS�&�=\�ה��\�=\�\�kǟ|ƙ\\�_2G\r\�{\��\����OO\�=�\�7���~{��o|k\�o~\�[�/%H\�TVV.^��\�%k֬Y��X/.��ڵkKJJ)\�а\�G\�\�\�9ꨣ�\�>�\\r\�ew��\�GCz��\�@��i1�\���\�\�{c\�o��\��#�4g\�\����FR̯���\�w�r�yG��\� �=xr\'\�\���\�ե���Ǥ��\nV�s\��\�o�oi\�ZUU�\����k�\��,>|�\�#*�h\�<s\��Y���I\�\�o}�W܏5\�E\�9�g\'}�\�a?\�9���yw��\��}\�L>\�S��+��v\�G\\w\�u��\�JJJh�]oP]]]\\\\L�ԅ^��\n±��<\������8x��!�\r�\��c�\r<v��\�|0\�ț�pp\�N�Òr\�!�ޜz�\�-\����s�r\�1}��\�\�p\�~�o;��W��1\�\�\�W�t\�\�^�ӑK\����g��g��Gwh*\�ߞ�\��\�[\�����\�һ���c?�\��1�d�9q\�U�y�\��\�=�{\�~{\�!�u�Ot�̥Pw�\0(F\�\�\�t\n��\0��׿���\�b\�\�,p\0\�Á�Z1�6dȮaÎ�\�W��þ*\�\�\�y\����\�=��ꞇ}�+�~�+�|�+)�\0�\�3h���:\�\'������Ͽ\�Ͼ�f�\�\�\���y�+^~�\�˯��ǌ�\�A�\\�ߠ3(?��չ\�\�7�5���G�^�\�W~r\�W.ʯ;9\��\�x7\���I\'�\��҆M\�>��\��\�I\'����z=צ���\�\�_��\�IW�?d��\������1�\\0\��uй���\�o��\�7�\�eB\"]\0;v\��|\�Ύ�\n\�Q\r|�\�g\���\�}���a��\�fȱ\�=�س����\�N8�wx\0u\�;�8<\�\�n�>�\��x\�ߪG�m\�m\�\"\�wF\���:b��ǥ�� �\� ��aÆ���\�<{\�o��\�!�\���G\�<�`\�\�֏?�x�\�͜/\�N9�.�\�O\Z\�\�\�6\��g��\�ޖ��\�֓L@�����۷\�~}�\�o�}I�\�\�{����\�ۧKHj�]wA�\�ӧ\�����7\�|�����/����\�I�-^��>8�ٹsg[[\�\�/�Lk���N\���z\�`\���gڧ��\���e{\�l��W�9�r��~�o�}\"�{\�a�o��m\�\�\�z�\�U?�\�\�9�\��\�\�><�+/�\�\�ц]t�\�HV�ӑ�?AVu\��\��\�w�\�Q��t{\�?\����[\�j1\�\�y3�^\0�d�\�\�g\�eo=�v\�C�o\�R�\�\�\�םq\�\0\�\�=q\�՗\�0\�\�|��b\���\�\��H\�?\�x�\0�\�Bg�}6\\\0�.\0\0z8�s\�w\��\�\��jxN7���\��9dP:\�{\�׿�9\�\�O?n\�=�\�s���\�\�\�=�8%a���\�㾶\�Я\�1\�k{��#��Gx��}����3:l̐�q\�\r�Ϲ�͢\�\����u�\r5Ҋ֮.Y\��%\����]��cO���4�o���\�\��bu�p򕷞t�c�.{\�\�k\�\�\�f->�\��\�I\��rҐ�>��ICv\�u���r\�\�׋�/\�?˚6?4m~\�?|\�u���\'N��\�\\�_҃3�\���T\�9\�ڳ�\r\�w�\��7��K�lP�S��f_� �p`����r\�\�\�u��ZC˖5�Mz�\�7\�xcŊ�=6�\�\�>\�\�K�s��7]��u\�A�o)\�g=h\���\���~3���?�\�F\�V\�b�]0�w3F�\�᧎>r�ޡ���\\\0w~��ُ\�\�-�8\�_w{\�/\�p|X��\�{\�W�w~T\��\��\�/|�ׇ\��\�\����p5-9k2��r��\�\�ڲxL[\�-E?mzzϕ��\���A���+��\�\�\�t�ɛ��\�o���\��\�v\�9`��\��\�7---�}�Yuu��I����\��\�\����O?��Q�F��\�\�\�khh\�\�\�X�r\��\�߷o\�\�\�\�\�{B��?\����;]�ߑ��\�į~�ɯ|\���|\����\�3��Ϙ}�GN��\�\������\Z_�b�����uڮug\�\�tή\�\�\�j\�P��3O\�޿O�q���\�\�Qu��z̏Y�K�?X}�\�ڟ\n@\��߯=\�E?�\�\�G\�\'�KES\��vw��U�O��۪�ꇔtϘs.�lօW,�\��\���)����%\���\'�\�����\��\�Y\�\��_�`0\'�\�R\�,\��\�\�G�\������\'H훯���\�o�\0R�TV�TALɔ\��㏧\���n�az뭷\�͛\'ǔ���\�\�K/�>}��u\�v\�\�AG\nS�\0\�C\n.\0��FMMaRJʓ�߳.���5L=(�\�g<u���2�\�\�~;\���\�kG��\�L���M��.��»\0��;��C.8\�\�~ۤ���\�\��YMV\�P\�4�/Z��`e\�K\�\��\��N<����\�~\�\Z޺�\�\\\�\�+�\�\�\'}\�;_|\�U�\�\�ۧ�^X�\�\�ʧ��\�׏�~���\�G��\�\�\�\Zv̵_����vQ\���͏�Y<\�g�5Y�J�_ҍ_�\���޾i��\�wЀ\�{\�M�;\�\�#�Q\�}�V\�\��;��F�7�\�\�M[>,.�]X$lAQ�{/�����\r�\�ܣ\�\���\��z�=�\�|j��\�9\�\�3s����ґ�,��\�G^�܈�~>$��H\�p\�\�j6\�����?i���l\�����L\n\�8p`NNNEE�\�?�p\�ȑ���\��\�\�5�/��\�e�g�\�O<d\�kgn]|�t�\�\�s\�\�^S~{\���.\0\��b;@\�\�\0���z\�q\'��ﾙ\�Ğ�S}��!��e˖�?��t�\�g�}�|\�\��\�W�����{\��\�o~�\�C�\�K���\�j��_|1\�ZBB��������9`�^{��o����o\��o����������:\���\���|��a�z6�\�}�8�Ļ6.�\��]ˇ\�Z��]\�޵�ǻ>�Ѯ�g��w\���3\�!d���)C�\���\�s,�����\�p�?\\�\0j\�=��\�a�r$�@S\��v��\�S�?\�_\�X=\�\�?�$���]z٬ɣ�TJ\�Kc�A�{�E\����7\��\�??x\�\rw�z\�o�\Zvv��\���syɋ�[�������e\�i�}\0�$\�\�]z�ڃ\0��\�\�Y�pU�f�,H��td\�@�\r����D\Z\\\0g�y&�}\Z֗^z��>\�p�ܐE���\���ckk\�\�/����u\�9\�Б\��?��s\0\0bB\�\\\0��\��\�z9�~��\�]���k\�\��z\�\�\\Q\0h��\�G~~�\�\�@���\�R�5L��\�\�\�=�8�s.�O?�����^8郚ie5�\Z\���ה�jbk���7+W<���\���CO�l��\�^X�+�|\�-C�\��\�<x\��~\�\�o����.\��\��\��K\�}g�\�\�\�y�����c�!�p�\�	�\\|߷\�{de�\��\�(<��GO�\�\\�_\�i���h����2�{$\��\�݆z\�^{����?�xZI\����P\�X:���/\�O\�\�ȃCߙ?�̯ۗN��\�\��\�u\�\�_\Z��o�v\�	�,AR\�˲?�\�G\\�\�ɃN\�J\�@����/�\���Ӟ���]\0/��⧟~�uö��۶i;�w�\��\�f.��>�H\����a���\�p\�qVN�ζ��\�\�=WM\�5�W\�\�\�Oo_�\��\�@߱!\'�Lژ\�ݠ<G;�\�\�9�ۧ\�\�@|\�{\�kii!���\��t\�I_��׿��/�r�\�{P\�\�8\�\���\�>���\�SO\�*\�0�π�\�x�i��?l���V%~߽��~��\�\�w\�76�w\�osb8.8�\�\'\��}�T\�#\�=\�\�\�?\�\��<\r\����w���k\��\�\�j����\�j�AG��g\'_�ֈ��\�8\�C�֊\�?\"�_w�(\�.\0c����\�3����\�?\�\�M��\�m�}�[�\��0�z\�\�n�\0*\'_5��L�/m\�\�\�Ԃ\���\� �?\�ww�\�Ź/\�̯\�X׼��iIU\�G\�W7=6�b\�}�<��K�\�iy<u�?<��~!߀ؓY�f\r\�;>�<��7]\07\�tiu�1;%9\n���\0(Le\�	�}\0.\0���F�\�R�I�p饗\��\�1>O@1��\0\0ċ\�\\\0�p�}��^\��2c\�%�jǹX\�_v���7�\�5c�\� \\\0G�ى\'J�I{\�q}\�v�zj\�gt|�۟�|�\�?��B�k:h\���\��\�WU��~�B�\0�\����{�\��\�\��\�Lʯ�d�{+\�\�\�\�-\\SWذڴ�\r�笪�^��\�oW5\�n�\�\�O?\��\�C�:\�\�X�+�t\�\�\�^��Ы\�?��|u^���>�\��^|n?���\��\��e���\�\��?\�\������r���	\�_��u�f�li]�a�\�7>y\�\�Aw\�\�o��\��\�Gz\�\���������\��\�k�\�K\�X�ikC�f�yKʟ{g���\�ڦ�e/�~�׍c�Ƶ�w߽���W��k�\�=\�\�\����\�\r�\�}\�ۇ\��\���\�>��9\���]Æ\�\�m\�p\�\��x�\�\�\�\�\�+��w\�\�T��\'?y�9/\�|l�#�L�_�^\��D\n.\0*�\�?�~?�o$\��\����-���\�/9�\��/�첍�\��\�B�\0N:f\����>�\�^�b\��~~_��~{Ơ�:�Ù�Z�;\�\�\�\��v���3cL��\�{\��;�{��>\�\�.<c\���z��ˠfq\�o��&I���<\������+���_����?\���\��\��=�_\�k�=(�������u\�Y4{wttP���7�Cz�Y5\�(\�\�v:��\�\�?s\�>�\��\�7g\���\�~�\r��椃���\�]�\�kR߆�\��\�Ѝ��\�#;\�+\�\Z�\�\�\�Z�\�\�W=���7�\�X1bW\��w\�\r\�U��]�\�^8\�\�9�\Zv��\�v�\�{Ѐa����W�dD\�Eg[.��G\�]w\�\�\����\�kV^a�UgU_yf��\�[~\�wW\\1l\�\�Yq\��<�\�A\�n,M����\�ycf�ع�߾\�\�\�r{\�w�\���Ns0��\��L��\�\�Os�Z�4���{�\���#~�5\�\�E��n�\�\�?۸�\�Ӳ�v.�\�~���/\�7n_��u\�;�$\�\�\�\�#\�E�\�+n�\��y�\�n&H���n?	I�����\���]��GC\�y*QH\�8\�\�\�\�\�\�U\\3wnV`�XJ\�.�\�ӧ���\�|b�\�)�O|�Z���\�\�t��G\�g�\�x\�û����{��{ή\�JٮsW\0\�8�\�\�gs�v\�\��G\�ԯύ}���\�>\���=M�9�\�ȯ�o\�\�\r\��\�%c\��?:�\�_��\�{_�\�\�[{��\'|�D\�\�\'Խ��\�ںk\�?\\�zF�����U��|ck\�\�;6|�sus\�\��k~w\��4�\��K�|\�\�\�;\�{��\�\�n}\�͢\�ι\�\�L<\�\�{����^v\�Y�\�}����_?z\�\�{��*a?���\�\�\Z���.��?�\�C\'��-W����3rh�͏���\��\�c�@S�I\�\�C\�\�34�>\0\�\���\'�����w��\'N�\�+�\�\Zd�Ӗܶ\�/�vۗ?0����\�c��\�\�5\���2�\�+�<\���?`ʹCW�r\�\�o\�=�7���6�\�n�Eߩ�\�_�\�\�\r�\�	\�5�w����\\W\0L�Kz����͍���,\�9�II��Uӛ\��\��Nj.��~���\�o��}�&\�oi\�:w\�\\��\���w�h\�o��M�\�`\�\�\�.�d�u�q�I�П�����\�o�\�w�9{ԏ�3lص\�^��\��\�gc���\�<{�\�6z\�\�_|��+.>\'.\0�s\�]w]{{{uu�\�g�m\����׿�\�4y䧃|�ѵ��ρO�\���^\0*x\�\�\�|\�ڵg�u��*$\�\�sP\�c>0DZ����|Q�\���\�~xq\�><�Бa~B�O\�\�ώ:pg�a��v\���\�\�g\�3}v�<�\�\�\��ђYg~�\��>z\�\�\��\�**\�wg\�Y����k\�\�]�\�\�Q����]�\�CB��=\�\�\\�\�q\�=�̪F\�G\0j��`\�\�֔U.nX��n\��\����ּ0�\�\�4�<l㿿�\��\�m~�M���<���J\'\����쒻��\�~��\'.=N���\�.5� ��\�WL}�Y�i|I\�\�ynVQ����۪6\�~ؔ_��e\�\�gv\�L\�X�\�QxQ\�\������i\�\�צ?�\�s��\�Ç	��)n:�;\�3g)\�O?��c}��_��\���������m۶�H	�\�\�$�e�z�]S˪,wn\�\�\�\�a!�\�\�^V�\�.\0��gee���T>	��dV�v��n\��\�|)\�\0I\�\�.\0�\�\�t��\�b\�\�Q��_��]3f(W\0\��:\�O�9���}������:` �O0\��\�=\�t\����.��Rst��g�\�7��{\�S�w�cͽ/m��\�-��?}�d\���L�[���\�٢�\�X_��\�͟w�o߹f�\'�}PR�\�셗\\�3�sC�\0.�\�QW\�3�ʻ�\\yW��\�6��꒜�������k�?�����\�\�z굹���;i,\����c�\�Uw}ŝC�\�EA]\0g\���������4��\�\�d_q\��]qQΕ�o�jL\�F\�z\�E9�_�Ү��3#���\��o��w~�W\�;\�\�\��\�\�r���\'�P\\\\|饗��h��\�_�m-+���_��/]w\�\�R�u��c�\�\��z��\�k�?�\��\�\��|\�\�\�\�:\�5\�:����\�;\�\���\�W|�[\��\���J�}�\��ܡ\�^�&\�?��^T�\�\�_\�{��_\��鈇w|��.\�>�\�\�;\�>[6\�x!\�I��nl�;;\�\0$�w�\�8\��\�|�ι���\�\�]ܐ}\�=fYX@\�3�n.�\�t,�K�\�\��\�rB�.\0�K\'m�-�q9�,,Z��\�>|�#�&TV��]�f\�\�\���\��\�k�:���F\\t\�����\�o�qj\n.�=pB0~s\�M\nƀ���|�\��&M:\����?\�\�__q\�a�\r�S���.\�sO\��\�/��\�{�\�w\�\�9nܸ\�\�\�8���\��;�m�cL+\�\�\��x~p�\�\�ݣ�Z6d���!C�r\���_n��>K/=r׍G\�\�\�]w �\0��\��l\�]S�L���\�o�\��\��[\���\�\r3n\��v\�\�\�U��]\�#vU���\�/V���{�\�o?�\�J\�����x�)O\\�w\�Ȓ�\�\�^u����˶\\�t���\n�\�\�+Wo޶�\��~�s��/�\�U<rW\��(y\�o�\�\�񫄚J\'3u��\���I�G�\�%G<9\�\��SF�<�\�\�F�<\�(W�OƗt\�\�cOΞ�deK{K���|��������\�_Z[W�Y�\�;g�\��\���Ӿ7kY\�\�\�\'�|ꡉ�=6�\�\�\�n\��d3�\'�1&�@p�0��\�\�6m\���\�O_~�\�t\�?��J\�y\�(��E��Q�q\��f��ٸq��\�n\�\�<tܺu��Μ9�*À0�!\�b)��\0>��\�s\�9�O\�\Z5jǎ|�\02\\\0 	��\08䆙j\�Iy�.fL�Ѯ\�_�l׌\�8\��|\�\���\�\�\���O�}㐃�\��[W\��\�\�\��_��=\Z�|�~�\�.�\��\�\���#��~ͯ\�y\�\�ҿ>]��\�\�y�鞗6��\�\�\�\���_+v.ݲcˎ�[?\�\�\��yݦ�\�\�E\�u\�/�xk^ɿޝ�\��8�wo�}��\��^t\�QW\�y�e�s�.��\�\�>�\�\�%\�^��!�\�1��ۏ����W\�9�\���\�\�{�{뛣\�\r�B\���Jv\�\�v\�q?�5W����S�3�u\��\�3yҋMk7�����~ܶnݾ`�\�\�;��K�t4lZݴ��\�㏕.�\�ՅJ\�{\�L�4M[��Ͼ�\���.\�\�g\�w\�*\�p\�E_|c�\�L\��\�\�z\��\�ޛ��﷾��o��N;�����vΩ\�X:�\�\��\��W\�\�m\��<p�+�\���7)��:���~�+{\�\�\��.�\�\�1\��\��zQӋ~W\��\�?��x�k��s.����\���>��\�o�\���+�\���7~\�\�GM�_\�H��rj\�.�c�\��\�;��\�w�^���\�s\�\�\���?\�s\�O�O\�/���\�?fȐ�^x\���6����Lz`��מ~&\�\����\�^}zCCØ�\��\�\�7f]s�\�\�tŘ�����]~�ɧ��»\0\�\�\\\�;\��m��6\�#A�ƴa�7޿�\0i���߯\����~A_�v�ᇗ��|��\�W_}�7��\r�����\�W\r��\�?<X�mGus�>_5\������\�w\�\��\�O)\�\���Y\���\�����}��\�\�?찚N0\�_G�Y�3\�\�r���~5d\���\�A�^9h׌Cw�v�w���\�^?i\��N�q\��n~\���O\��Ŋ�v-�ޮ�\�w��k\�9�V�x�a\nڻ>�:h\�凼xݡ��\��\�\�Q\�\�/����� �?����<(\��\�ϛ\�~\�\�\�%+>ڱ�\�]K~�k	]�쇻J��Է\�\��r�J\'3u~E\��\�?����s6�.��)� �i�ˮ7 ���׵j\���v\�%w<�죶\��\�\�xqՃ>z�\��\�}e�[ʫ\n\�޽�v�O\�~\��YEek���h�Ϟ\�{��\�uw�Uz\�q���R0a�\0疀\�T.�\�2R\��\�sϠ�?�a�@ {A3���ϧ�K/�$��UW]��Y\0/��\�<3��\�i]]�\�\Z\0N�O&\\,%vC\0}�2�@s�j\�j��ũ\�.��xw.5��˖ǭ�\�/\�b�\��2+�h�R\�\�\�a���u��Z�=�wSe�\�cF���p2\�\�\�.�\�~��\�ji_$�Jq4�]3:��$�\�k/�V>�H\�0�\0W\���O�>���Q`၃dR\���W�\��\�\�i�\0�\��{��|��¸\0�=�\�����<�\���,�-o�]��?u\�}S\�\���\�o�\�l�b˧\r�\�W�\�\\V\�8�b\�\�\�\�\�)\\����^~�`\�\��\�.�~w\�;�y\�_�\\~\�W\��\�+sJ��\�\�c.��b�]�\�#F\���?>VZ\�|ҕ?�\�[���qɭG_q\�q\�equ\n|I;m�XuǠ���\�?��\�o\�^q\�/��{@��\�;)�Ucn=䠠os4\\\0\�KK\�|<�l\��GI��E�.��s\���3/<$s\n�������<h\��_��\�9\�9#���z��\�\�\�\�{��@�{��`\�w�y\�\�}�z���\��S�Q�w\�)G�Ϡ>_ɹl\�UO\��\�ٹߤ�dG��\�����}�\�B�\�t\���c��\�/�\�_���\�\�o�x�;52�\�\�\�+�nn؜��Ty/\�G\��R\�\�[֋�z�3.\0\�\�c�z\�!�v\�\��N>栁ƭڟ���_\�x\�\�~u3�\�<�����QZ��R�;�����\�	\\L\�\�\�7!K\�̴/ӞV�*I���E\�&�-\�+ٲ�D	\�Kٲ�d����EEhQ$\�MY^ٚ�3so\�4M5\�\�\�}\�\�\��\�\�\�s�s\�\�43\�\�\�{\�C_�|		URUuquZ�p�������\�\�\�s\�\�����=\�g|�$\�\0ok\��\�\�؛���\�\�	\��?<�	�\�&\�E|$sȐ!�k��\�$}\�\�z�j$UU\�G�UWW���C\�\�\��NA�i\\&��i��p\�\�\�pP���\�\�iOc�@Q��_�\�n܊����XhjJ�\�8\�I�|�Ԧ��S\�*R-�����ˊ�\�*�\�\�\�\�s\�S�8�\�{�ϼ!\�\�F\�%gJ�\�\�\�-\�\�\�+Y)\�3�:¯.-�\�Wr�d��\��Z\��q}ZT��M�GS��\�FjD��o|z��\�\���g\r�:Y}�A�C`:��\�\��\������g�\0C�\�\�\�u\\�W�\�\�\�w-�M��nY~\�7\�C\�\�3wk\�\�5߬zs\�A���\�c�R\'V.S8}0\�Tɋ3e\�GMl\'x\�\����\�,����#S���\�\naaa�\�3f�\�\�\�w\�\�\�\�\�ϟ?#5Laی��\�\�Ȁ���\�����\0���}J�Y\0PS\�v\�}��l\"�8�7\�\�4�\���\0��X\0Ǐ\��Z\0T��)d\�`Է\��q\��\�\�l[\�֤]_��E��)�1iK�\�9޶��!h�X:$�\�~��\��8�\�\�X�q\��\��T��|\�\�%Z][��/��,�~\�d��\�\�{\�į\��Mh)�fޟ�!\�\������\n��v\��\rR\�\�>\�Ȩ\"\0�?�\�L\"\�r\r�\�\�	�*\\\�B��$\"f\�sq\�pq�\�\�c\��Z\0���8=o뭰\��\"w��\��x\�ڍG\�7��;\�t���\�oO\Z\�\�{R{��ɵ��\��\�\�O˺u\�\�53�i�▬[\0*N3\�\�\"\�\�\"\�#�:Ή\�|\�\Z\�5\\\�5\\\�#B\�-��\�#�_/\�䍒U�Җ�J�q\\�\��\��Ahwt�C�\�\�6�\�1#��\����\�o\�45�\�\�4�~\�D�v5/\��.��pZU��bd?�R�1\nBu�b\�?]�rzR\\ʄ�\�+�£��K\n\�զp\�\��Q������v�^�\�\�&�mˌܑ��\�y��\'F�p�s��?q�\��\��:Ú�ɥ/�8��O-\��O��3.@>Č/�\�cy	��A\�\�X>:�<�i+\�\�eW*W\'/P���>�\0�\��\�s\�$z��4���-���\�\�Q1�\�U�w�\�7=d�����(\�Uێ������&�	|\�\�/\\�~�������>�HX�zy\�\�\�K\"C���\�Ō52\�\�ՙ5\�?\�\��\�\�\�k������x\'aQVOv�\0\r\Z��ڇM\0?ho\�0`\0��\n�D~I�d��\�\n����u\�=\Z\Z\Z crssuuu9h\�^��녜\�yy�Q-+K0\0\�899MMMA�\\�vMX�U�Ŝ���(WK�\�b_7W�[��6��\�3==�-�`�\"\�E�\�M	P��(Q\�\�R�K<�})*z\��\'���i����\��C�嫤�%5{�(y\Z�����֔J�1�\�V�e��%KN@,\0�\�	YA\�w\�=����1 hׇ\�ʒ\�\":�\�\�-SY\�_\� +k\�R�\�]K��3/�fV�~_�\�\����}م\'\�V\�վ��Y\�x��\�\'�\�pz�`vi��\�\�\�\�YO^��\��\���]\0�m�G� 9\0\�f׀�~����2��D��7\�\�\�/^\�#���B�\�0�)))��;:�f��>���\0�\Z�,ˇݫy\'�������,;;;22288\�\�\�N@�\�_	��\�,\0gg\�>�#@{MM���\�\�\�>U��4�|*tm~�#�mI\�m�|��`\�bh\�I#&�\�\��2\�GN\']\��\���\�/w�3��N�V\��\�\�\�۳n_	������iܺ���<wZK�xhB)���v\�\�Ӄ\"\"磻@\�#.�7\�;q�/\�@@=\� Kxy���\02@��\�\r/\�xv,\0aq\�\ZޓW��{c\�;;\n���`\�����\�6�ߖќ���U˷��sVe�_\�/9w�\���;\�3sRү��\n7#�|S@�`\�q\�2�\�\\�X\�^�k�_\�\�\�#=\�Ĭ\�B��\�\"xp�o\�\�R�u�p\�q�\�\�Q\�!d\\\�{D�\�MB���=�����j�\�Z�,iWBھ=�R2Y�{\�\�\�u:f�;+?��\�@,�3�O���P)�X\09O]r*|�\���)�4���Jz��\�\�c�5�O�G�\�\�d\�6��t\�m\�\�>��\�]�\n�{@\��ƣrU{\�\���x{Tv\�d\�!K��*OA>�z*5ta(�\�5�;Z\0\�,�Uݭ�_��\"�Y\�#��w\n\�[�\���\�S\Z_4aD�[\0�\�\�@�Ca]\��\�\�ˁ�W �\0��\�\��rڸ��\�\�|nnn�JƦ\Z��eyx�\'��/�Z2>l�ϊ\��\�\"#�W�w5��G?o{[[s�^[\0���\re\�\0z\0�\�d$\�5P]Rq֘\�f� @~~���bhsqU\�\�\�\�\�1�ii\��\�fffVZZz�\�U\�-\0S>�G|2�9,fR��\�\nG	��\�\�X\�\��3\��%�B�Ku\�\�P\��|JTJ�\�>\�\��\\Ϛ���#��Vy��vj����U�h�?%K���KI���7�\�ۚm/\'Ɇ �ǟ�?Bb\�$��ͳ�\�\�xnmw��\0v��,n-r��\0\�\�������\�5�\rgN�?�Ըtfu،\�撗\� nV�ٟ��\�\�\�\'�n�h\�cY�R5s�\�\�\�}�jϕ�;{\��0�l�\0\�o<2\�6�@EE\��\�\�P�\�\�\�0o\�</�a\�\��\�{t�}\�z\��\�-\0(�f\�Lxû���\"::zq������...QQQZZl\�R\Z�Z\0���o߾�\�С�S�\�\�\�\�#���!h\�0\�VL\�\�kUe���ژ�\Z�G%��;m\�>��!\�?Ej��\�ԁ\��\�\�Xh6\�Yǧ\��ϡnu|&8�5�j�\�G�[N\��{~.po�\�\�x�ٮ�nc\��\�\�q_\n<Z\�{�*��\0\�|G&+\�t>�\��Ao\�y���GĿ2\�}\�\�S9|x0u-\0d\n�4\�kn\��\�\�lX\0�c���&-=>{\�\�y[o.Jȏ\�U�b\�5�n8�\"�\�(�}y�\��Ղ��\�iS\0�\\���t������	\��]��\�|�y�\��x�f��nؼ/3r��o\�\�\"$\�\�8SC\�u�fж#�6&�Rv[$�7MZ9ϓv�+\��j�vG:d{\�\�JT���mˑ\�[�\�ږ\�b\�KK\�rt\�=J#F�\�ub\�\�K��\�BYM\n�\0.<�Gj�ȹ9�A\��R��\\��y��\�`A\�\'�lx\�\�\�\�\\��]�rǵ\0\�vJ\�O�#�<O�\�3`\�d�\�\�i��\�ų\�#\��\'��\�ZG������\�\�oH\rl�yڔ�1\'B}gZ\0\��Gb����\�;\��DF\� �,n<ۀ_�\�\'yJ\��M�I\�7oO>zqU�Q��\Zx~\�\'\��?}KϮ�\���d�\r\�\�\�#K�\�����5\�%d�kH�\�\�).\���FSMNH�o�����E����\Z��t�\��2@�<��B�A�A��Y\0$\��:\�\��ݜZ\�PVV~�\�A}}���\r�\�^z\��kdr��\�HFs\n`\\wwwBiii�_0��?�G�!\�X\�\�\�\���9�,,�(c(Eb\�p��fhEu�FS<GQ|4\�.\�Y\�hq=е0h£�\�{\�.�{�\�\�q���\��\�(\�\�()cZ��)��[��<`+-β�&%�s���I�`�oVQY���m\�\�v5l6|X���]uZk�\�\�3$*N��g�͠\�!\�~[\0Ӷ{�\�\�˿⛷�{=Ź\�\�\�lamq��\�\�\�\"�-�-^q:�F��s_�H���^\�\�#w�]ܙS��\�\�#�5:>=��Ӆ\�g\�@~[\��)H��\�ǎ���N�\r_P�P�oAXXX~~��hY\�aۤ����\n��\0\�\�\��IIIH\rC2nt��	��n\������gϢҿ�m\�\�\�͝;\�\�\�\�f����\�xtvv>q\�|�ZZZ\�\�\�\�?�\��u+*�\�	\�����\�e�\r\�i\���,\r\��)2iB��=\�\�\0Z~�cQw�\�-��T;y�88m�\�\�\Z4�\�_rr\�\�\�b����\r\�\�vl�\�6��\\l\�qj�7\Z��@;b�  \�,&\�t>��	\��!���$`\�\�\�C_�j\'�\�\��?īa\�\�κ \"f8Bc����!/ω\�^���`\�_V�T�?�<\�ls^m뫖�\�O\�=\�\�+>{�\�k�G/\�:w5\�\�}\�\01c\�-\0%�@i\�9Ҏ�#\\\�Q�?z%�䍢�k�v��\�fJ9Pw�\�\�\nna�7��bֆ}�*�\�#ۇȸ,P��E���=7\�\�>ē�7m\�]��e˧\�_�~\�\�˗�X\�\�#��|�t;�HB��\�\0<|��s��3���Tnqڅ*�k\r\�M,�\�\�\\\��U�\��\�b���\��7\�C��y�\�mq\"S� Nr�\� ޡù8\�5�\�$K7><��ws�&���Q\�h g\�\\�\�\�}���=��\�\�\�\��=ΩE�{g��^O���\�\��WL�Y<W}e��J\�\� �%i�؈_���	[�\�Ċ��#��J�v\�\�]=CsdWH��ܢ�Wo�\�-��,���KOy����\�8p��f����`ϩ�S|\�|=-\��G�\�H��\�5\�a&0\�\�\�p\�hQQqh\����D\�CsP���\0\"�\06\0�_!$���\�O P\�\� ���Z[[\'O��\�2\��-(�@Z��CII���rҖ�3o\�<h����\��iyU>R\�pr��<�]?׃ZZ_ml����\'\��\"�\�zu[��)\�z,\�ɀ\�\�\Z������cO{\�dMp�\�\�V0ͩx�y\�bݼ�GכP�k�n1��\�S2���\�_kAa�\�\�E6���`!���\���\'o\\b~���\���\��\�s�S\0h�\0 �\�\�Zb\"\�_�J�@D>�m,=SX\��ϓ\��%�\�\�LO�Y\0!G�D%��&�\�\�K\�\�\�x�߹n��\���J\�nT%\�>\�x񾜡5\�;477w!�a$������#S���\�jjj�L&�	Bnn\��RQQ�������]/\r�\n �\nX=r�>Y��\�\'\ZH\�ɓ\'�\���[\0��e�C��w\�\�u��m�<}��\0F�PUU�\��\\����\�t�/\�[i7�Km�m�$h;\����\�$�kh\�\Z\�\�ؤ}�hk\�\�X\�\�eu��Vrp~kz`�N~��\�\�1�E�-�\�\rW\�lY�\0��/4f;@h઀v\�p�}�Dj��\�`\�A�P叅� �AF���)\0T`\�P�,\0a19U�\�#37\\\n��:okNm\"��=\�k\�$�m�S\�\�\�򵠢6\�^)m\n@މ+��\\�~ \�\�\�\�u��E\��U@\�&@\�>D\�n��C\�p�i\�\�[N\��\�ܰ\�\��%�v!R��dx��9L\�Wo\��C�w��%\�Δv��d5\�t\��X��~�#\'LTW�qW��\�T�59o�����2�&5G\�\�Q��*\�	�2\��v�\�ub�����S�\�\������r%J+4Xv~�Ӛj�Y\0j#\�\�w\�K?�\�ŋ7��O\�l�v@�9M�\���\n��ޥ)W%�\�X)}e�\�\�J\�\'\�_?:�\�ٳCi��\�G(�`���X\0s\�c��C\���\�]\�\�\�[\�jTy�eܑ祯hT�o\�\�zc`\n�ʞ�_�|��\�-�= \�+��`�\�*��-@@T@F[�HbTJ~\�#<\�[�r�,)�ʸvo�����\�̐٧\�_ܒ|a��#!\����e�	\�\�\�?�d9=]\�Y\�&L�\�\�\�8\�\�\�\�\�w���\�\�p\'r�+q�a�����<4B�P��4�M�\�\'��?q\�ķoߒ������kT\�\',|OR�DJ\n�|I\�-�ݶ\0|�AN���0\�v�!a�h\�P�\�ad$�\r�\�\�\�B^@�\�¢\�\��ovvQ\�ʬ\�P�W�S��5\�،biL�Cq\�o��\�\�\�(\�\����\�\0\�+3��,\�:u\�ce�6%J�?��<�rH�k�C\��Q��,TI\�\�v�4�/�\�O�\0�Cӎ>�~\����\��A����W��\�{R�\��|[:�o�-\�dq�?���cP\��R\���W�2j*�\�Xs��\�\�\�҆���5�\��Yq\�qý\�M\�\����d\��\'\�B�\��\�75t/^��-�䦬\���$\�V{l>F\�\�\n�~�\�\�\�V�Xq\�\�!(���<|��D\"			ݿ\�ڵH+`S��&6o\n��\0�W����J�k�ׯ_�f\��J�}\�@EE��i 3�>~�Ho\0zzzQQQ,��߱\0fϞ\�\��`����\�i\'��9?��[���\�\�R\�V\��A�\Z���\��Y\ZI�ш�	S\�~�-\�ǈ\�Ǣ\�Z\�\�B\0�\�t\��ȡ\�\n�ƿo��ѭ�N-y\rY\�6�E\�+�H=v�Dر�p�#\�\�R�-\�v%�o̶m\�w��.p\�\�*<<<��\�FAAz�\�4�\���%\0�x9x�\'\��\�\"$�+�\�\��:}�\�\�s6_[+|\�%�KV\�L8ל[\�\�\��%\�Qե;\�9wO^�}4�ơsWSN_\�y4CE\�SXT���[p#✞��d\�\�d�idx�.i;C\�j���,\�i\�!V\�WI9��^It\�t)�6˗Fo˸}�XV>�i��\�l%so�;:\�!ۣ�@�^+��f	mY!�\rHz5YO]\�iƚ]��Z\�HY/HV�r!\�X��\0�\n�/3\�,v�^L�|��3\�ж\�Y\'|�\�T\��\��6gg\�\��o<�yR_�^_r��(KV[u��\�\�}�3\�\�d�*\0\0�\0 69:�&�\�vm�sajۑJ�5f)���\�#��\0\�\�o{�SQ_W\�\�pd��\�=j��Ag\n@�e���_m.\���ّڣ\�ڕW\\~�N\��s/\�Y�*l\�\�\�#F\�D\�\�\\��361\�+\n�@$�IHh\�h��[Z�::X�8[�[�ki�)��k۴\�7#\�\�\�eK���h�_�\\��ǲ�T���\�\�\�\�˛\",|CB⪄\�v!�	\�\�4�	���,hnn~�����&\�k��8X\�*����r3\���_���\�Ɔbo�\�KKKsqV\�w����\�<)z\�Cs��)\�ʈ\�0柉c��&�3ߴ\�d�b\�ă\�\�;�ԥ�jS�hS\�\�Pb��m0{�\�\�Q]\�5�4���N�I�\�Br�d\�K1��7.�?�T�pW�9��˫o:a\'��>\�\�T�\�\�\"T:�\�g\Z\�Z\0�\�3��@�lϲ��\�ޗ5�Ϯ|���\�ŞK�f<xq�ɫ\�9�v\\{x��\�t\�\�\'B^n\�O���:�xU\�\�kO����b\������\�\�h�.�|�������#\"�?��x�\�E(\�\�\�|���y݁\��Aas\�ĉP���ljjB\��:`��w\0�UUU��@A�!�\�\�\�\0\�v�5\��t\\�n�\�\�CG\��\�`��\0?�vvvhw]��\0@�766\�#�\�w�\�\�4:\�T\�A&��ϧ\�^f\�+\r̬m�|\Z\�\rP[QikٶM�y���c�ȅ*\�\�A\�\��SE�\�\�P�\�G\�����\�Z`\�rǶእ����\�ˑ��d�6\��\�m��l��n�خ��\�4^�jɳ��.l�Q-\0>��I$P���>`�<\��$��8^\ZĖ  �,.\�\��yf�\�\�\�χnʚ��Ƣ�;�W�<\�~�\�vMkç/�T�GV�r���\��\�/\�I��j\�^�����H\�q5PuN\��V�d\�d����*iC����\n�w�!n�쒲	\�Q��q��\��J�EѺ\�ŭ�$\�f*�z�\�с\��o�\�q\�\�IBB#U�\�@Oe��\�\n�1Vc\�H9oH��1\�\�fCh!@�a���c;�\�Vw\�\�\�M\�\�rQ6}8�\�\0L-Lcw\�&N.{PV\�\Z%�%{\�Iؓ����\��f\��X��=R;Y��>֘�T\�\�\�3\�\�\�\�\�J\�A\�\'�n~���|}}A(���>��\�=\�-�H\"R�������׌�o\Z��nnY�y��0U؈���M����q\�Q$�]`x\�]��$�8YRBJ�_@\0�\�)�<\�=<]�m�߾#�\�\�OGG�-\�g�?d2�СC߿?r䈾��СC`\��\�\�\�\�\�\�\�\�\���\���]�\Z---���\�\�e�/\�\�\�M\Z$ta�;	J0�\�	\�71��?\�!{\�7F�ɗ�}Tvkյ�����Q\�M(VF\�?9\Zt1�\�j�\�̀�^\�m\�dJ�.e�\����\�n{\�K��\��IB\�\\�����}!��H��ԁ)r�\�\��\�\�\�k+u	���r\�\�\�-A�N_�J�p�\� �\�\�\�d�@�\�2�n!\�!\�35\�Ha]SjÄ́���j\�D~m\'�\�5g6�.{y��>��\�䍜W�\�*W��=xnٹ�5�\�]d��_���E�x�BE�z\�Yee��.�\�A~~���#>��c]�@O\�Y\0 h�c�\�\�\0b������	R�\��\�Ç!Y�\�ѣGHC\��K�,�C\'X��	P`�i���>�\�ko�?�����\�\�èЧ���`hh��\�\�Z\0�رc\�r�\�A\�\�O�3�&�Ê\���9?$.J�\n�>\�\�gl\�l\�7k�mҐihwS?�>//~\�1��g�\�\��lc\�\�vM\�u��\�Xh\r��юX\0\�@\n/\��z�1�CpZ\r��\� N�A,�\�\���\�\�\�;�DQ	+	\'�\��\��gF���9kA�\��\��\���m?\�|�i\�\��ܸ_����v�\�\�\�S22c���FNy���-��[p�\�Y�	b�S\�-&KXL\�d\�)�\�?v�&�d��[\��\�;Q�G��\�F�\�6\�\�Y�\0\0Tw�\�ow\�%J\nk�H�C\�\�\0C�E&\�KMuVPC{��f�(\�`5\��UwYq�\�\�	l�k�Z\0x%;\�\�\�i�\Z�c�{|�5�\�{lo,\0xz^�bwƦ���\�cTTT�Nٔ�\�\�\�D\�k\�[\0]\�*���V�\�\�\��m۶ׯ_7�zwe\�w�\�፵��G�юR\n\n\n:^@lY\0��\�n\�\�\����ʏ��Ht6��o��\�9\�\�\�\�\�B�3��\\\'G�V�_�^�\�\�\����\n\\ \�;MM\�\0\� e\0�BACC\�\�\�\n��_8n�\�\�O�>%\'\'A\�\0\�	899A���?y�\�ׯ_���\�{�����r\n�\�\�b=��*�\�\\\0���\��V:�_gn1F���\Z�\�;��0僲�wm�V=��%e,mF��1u�\0;C�\��\�hꒁ\�FS�\r��\Zt\�\�\�\�:��\�a1�\�q���GB�-���\'M0\�\��6ϖA�\�]c�\�\\{#0�t��\�Y\�\�2\�\�2	3\�\�>-��J\�\� �ݽ�\��ܐ0N��t\��\�X\�X�f\�	\�6�$e�bS3\�/y�Z�<\�޳]w�^:��*N�H\�\�\�\�\�W\�f=���fcnݯOKKb{�\�G\��q\�䔘���?�8�kjjj~�)\0؉}��N�C\�ܹs\�\�P\�7o\�D\�\0��`Z\��\�&C\0K\�l\\�n\�\�\�˽�uYYYG�0�\0455###\�\�]\�\0S\�G\���aƌ�\�edd 6\��_1X�\0?~���?��Ը��\�������D\�K�FK����1Y�6\�E6������Ʒ�\Z��l8��\�\nL8\�xI�\��\�\�\��lb\�!~\n7�k�v�\��\nb�pj\�0thÐ!\r\\\\/~9hP��� �_����-\0�-A\�����vV\��m\��kn\�\��qّ����k�U\�Z��sVA\��+9�.]۸\�\�\�p-�\0IY7Q	3?��)\0\0�\�\�3�333�\�4\�ۗ\�\�\'	�H�N��-5C\�\\1�)�F\�hwt�C2CG�t3\\\��j�@#�QYI\�qTe<\�\�&h(�A�\���ɎG\�U�\�DF��g\�$9�X\06;\�N<�\�Y�?�\�uP\��\�(d\� N��\0\0k{P���\�:�y���tWGJJK\�\\8�3ygt|���%/w�D`\��X:jW΁bd-�\�\�\�\�����\��n�,<|�0�FGG+)1\�YSEE\�\�ٳ���-@P\\@F[�H\"��\�G1I5	)u\�M��8\�k�0�bNٕ\�\�)辟�$\r...t���@ �AcUU՗/_\��qҤIjjj�g2d\���6d|y,X\0\��VV֘1cz<��r(_2���?D\�0�e2�ed<��7�����\�\�a��Xo�MOo�\�\�G\n\�5� Nz-9ᳺ\�wm\�V];��5\�04�.`jJ13��S,�[\�X5���9\�OF\��6!+�\�{�\�����L�L�:�i\��\�\0\���\�\'�-\r�yu*�i\�y�N\�\�t�\�ٷ�l��\0\�-]\�\�\Z\�\�\�\�:a�,CH�Cv�`�-��\�t\�\�CEu{�kwܮ�ϩ|r0��V���r֝�\�}@\�\�OHRm��/�^Zc��\��Ho@\Z$ e���P\�\��h\�2�\��@�C_\�N�>\�Q�L-\0EEŨ�(�e���\�W�b�4\�I\�S\�q\0�?�\�Y\0b\�9I�,���\�\�ڛH�&RO\�%I�!�]\�v\"{�^���c>fBÆ�\"\�\�\�Y�v������Dv�l�H\����v�U�4�\\\Z��3\'\�l\�\�\�\�u�9s+_f֤y+�4��\�\��/�@ t��5\"\�\�5�5�3�a-Di!e@4���\�e�X\�\"P\�d\�萝 .\�w0H\�M,y���\0��.\0\�P�r$)rs���\�0\�2\�<U�\�P^/Q]S=J�\�q��dr�v۔�iK\�\��w��t�em\�\�\�e\\\�\0�e疘\�1�N�=\��\0\�\0\�\�Q�\�\�\�\�|f�\�\��\�\0\�-\0==�Φ����+.fzE@�{bC����\�����ګ�\�/]�XQM\�-8�����\�\�?v-��??����˗/���\�ի̞=\�\�\�\�\�\�\�\�\�v͛7����[[[���@��-{��ו���1�~$�\�|�\�=���V_\�\��w[ۻjZc�H��B|�1<�U<\�j�<�h���\��]Ǿu�-u�\0}+��\�w}�&��I\���\�:Y6�D\"\�V�\��\�o\�jX\�w��g���gƀ�\�\�m`P靄\�Y�\�W<���G�A�����Ӎܡc�Cv��\�\�܊3�u\�/2�<~�\����\��qQ\�[\�G��!,)K 2_}\�\���F�8v��\��W\�k\0h��\�um\�v\�\"e�VP��\0ϡ��\n\�\�\"\"\"455Q�OS\��?����,\0��Ͽ\��\���=�\�\0fh\�u�B 	����$�]�]l��/M\�N\�{��{w�\�\�Zb�\�bV�B\ZK�Ӣ꜎��&~\�\���\'�\�>dS�\�z�\�JVhwt�Cv�-�l�/\�?E\�j$������������5������?Iaذ����X\0\�\�\�\�\�\�X��ê�V\�\��|\0�:m]\�i�\�Vn\\�-�j\�\��;>vg,��fźSfM�4bxO\"*lY\0��@�\�_0Sa\�R\�M\"NV=U	�[�lA�z���\�\��\'\'46\�V�\�3^�6M\�\�\�\�-x��\�ǧ�\�]�\�\0�D\�\�\�IJJ����F��\�߿_ZZ���kP�---�?�����O\�W7�϶\�0�圄��.\0\�9��\n\�\�+\�q�$�|Qm85m\�S���y����U�=%Nz.\��Z\�\�oY\�FY\�\�R^/D|��\�y�2y|�\�;�y*{hHZ�<A��L�\�_\�2��-���_�f��\��c0��\�b��\�\���KV<�W�K�\�W,��\�[�!�i�Cv	�_@\�\�S\�\"�i\�Ml�n\�\Z߼(\�1FF$Aa4	\�?DG)�\�\�[\0�KC`P�U:C�(`\�\�,\0\0r(ʧO������>a\�ԩ����ħ���S\�\�Wp\0\�7�\0~e@\�*���e\�5},gj��N�7\�T$\�X\�\nU\�t��\Z-i\�)f\Z b\�\�n���K��\�\Z�hh�B���;\��\�H�zD5���p\�j�� !\n�\�# \��\�Ԃ�X.8p�\Z!�:Q�z�\Z�ON+>�\����\�.z�DTVU617����8u�\��\�@7/7c��\"ۗ6\��kZ\0\0vE@�\�/+_���\�\�\�8::J\�n�\�{bW\�\r��tq�$�\�Z>>}��y\�G.\��V\�t������Qxxxbbbzz��k׮^�������\0Ǭ���\��\�5B<�zCy}Vp��IH��\��	�\�8�^�	\Z\�xI<��? ��$}����\�\�\��{f-�\�gܳ*�\�\���\�ޞW]�O�\���� H\"��\�s\�&�[68MOvx}\�\�\�\�\�wh/��`�\'\�\��0��.b��t\�\���Eg��G��\�\�w6\�\\�0^k\�8Q�d��\��\"��ժ�\���;+�\�\�C/�Ac_�r\�\��\�\������!\�ku��	5\�\�\�=��\�\�\�\�\�?���3*�\�`j��;�7����[\0�$���\�1	a1c~9ڴ��bqN����������\���pa!�\�i�J�-��_G\�tH�!x!Ѝ>b\�ȑћ�7m޴is�c7#�e떭q[\�ڳiӦ��\0�h~\�iU/�|go_�/�^�/�\"��>E^^>33���~[\�\�\��VOfgfx\�\�N�8�c��*\�N�\�\����\���4�H$x�i@������z��W��Gx8�\�p�\�\�\�<\�^�_6!��A\\�(���L&�{?��9$\"�?�������$��8IL�\�Obo,�\�]�\��\�\�Sb��+���@�d�d�S\�\�dd��~��\��Y\�٪�PFf@�aU?\0�1�N�\��0M`:.lv�\0�yU�\�����(�׏��΁Ȅ|�e�\�\0\�/\rn�&�\���������\�\Z*�_�= ����\�1\�d�U�\0z�	H���\�tL�J�\�\�w�ȔdE\0$�\�\�Қ;w���\n������\n9���[\0888�4�𛀪�:$k0��~\rtHv\0�[\\\\\�\��4�\�\�\�\Z\Z\�\�\\\0��\�\�\�f�\0n\�\�\��\�\��o�\�\n\�88888���\��5\�!qpp\�\�\�Ҋ��rvv644\�\�\�TTT�G(���@=��p\0\��\0~Pu�S@�\�����a\r�ޯ����\�GGǩS�FDD�쏌����c��zp\0\��\0~Pu�S@�\�����a\r�ޯ����\�o\�\0\�/\rn�&�\���������\�\Z*�_�\��-\0�_���\�\�\�}h׿��_�`x��$ЮqpzÇ�O\����2\�m0�\�}h\�88�+�\0\�7�9��a8�\�@��=`x\��\Z\�8�\0\�[\�\'�v��\�>T}h׿*�_�\r���O\�\Z\�w���\��?^˄�\�^ \0\0\0\0IEND�B`�',1);
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
