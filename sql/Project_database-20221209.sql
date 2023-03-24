-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_database
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `兼修申請`
--

DROP TABLE IF EXISTS `兼修申請`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `兼修申請` (
  `學號` int(8) NOT NULL,
  `申請系編號` varchar(16) NOT NULL,
  `種類(雙一/輔二)` int(8) NOT NULL,
  `申請學年期` varchar(8) DEFAULT NULL,
  `完成學年期` varchar(8) DEFAULT NULL,
  `修習狀態(放棄/取消/通過/修習)` varchar(16) DEFAULT NULL,
  `延肆` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`學號`,`申請系編號`,`種類(雙一/輔二)`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `兼修申請`
--

LOCK TABLES `兼修申請` WRITE;
/*!40000 ALTER TABLE `兼修申請` DISABLE KEYS */;
INSERT INTO `兼修申請` VALUES (10842111,'520AB',2,'108-1','','修習',NULL),(10842112,'520AB',2,'108-1',NULL,'修習',NULL),(10842113,'520AB',2,'108-1',NULL,'修習',NULL),(10842114,'520AB',2,'108-1',NULL,'修習',NULL),(10843116,'5400B',1,'108-1','109-1','通過',NULL),(10843117,'5400B',2,'108-1',NULL,'放棄',NULL),(10844111,'5300B',1,'108-1','108-2','通過',NULL),(10844111,'5500B',2,'108-1',NULL,'取消',NULL),(10844114,'5700B',1,'108-2',NULL,'放棄',NULL),(10844115,'520AB',2,'108-1','','修習',''),(10943111,'5400B',1,'109-1',NULL,'修習',NULL),(10943117,'5700B',2,'109-1',NULL,'取消',NULL),(10944111,'4700B',1,'109-1',NULL,'修習',NULL),(10944116,'5400B',2,'108-1',NULL,'通過',NULL),(10944117,'5400B',2,'108-1',NULL,'取消',NULL);
/*!40000 ALTER TABLE `兼修申請` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `兼修相關課程`
--

DROP TABLE IF EXISTS `兼修相關課程`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `兼修相關課程` (
  `課程編號` varchar(16) NOT NULL,
  `學年期` varchar(8) NOT NULL,
  `種類` int(8) NOT NULL,
  `項目名稱` varchar(32) NOT NULL,
  PRIMARY KEY (`課程編號`,`學年期`,`種類`,`項目名稱`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `兼修相關課程`
--

LOCK TABLES `兼修相關課程` WRITE;
/*!40000 ALTER TABLE `兼修相關課程` DISABLE KEYS */;
INSERT INTO `兼修相關課程` VALUES ('AC073K','108-1',1,'財務金融學系'),('AC073K','108-1',1,'資訊工程學系'),('AC073K','108-1',2,'國際經營與貿易學系'),('AC073K','108-1',3,'科技管理跨領域學分學程'),('AC073K','109-1',1,'會計學系'),('AC073K','109-1',3,'會計學系'),('AC106A','108-1',2,'國際經營與貿易學系'),('AC237E','108-1',2,'國際經營與貿易學系'),('AC237E','108-1',2,'財務金融學系'),('AC435M','108-1',1,'資訊工程學系'),('AC435M','108-1',2,'國際經營與貿易學系'),('BA100A','108-1',2,'國際經營與貿易學系'),('BA100A','108-1',3,'科技管理跨領域學分學程'),('CS681R','108-1',3,'科技管理跨領域學分學程'),('ES791L','108-1',3,'科技管理跨領域學分學程'),('ES791L','109-1',1,'會計學系'),('ES791L','109-1',3,'人文素養跨領域學分學程'),('ES803L','108-1',3,'科技管理跨領域學分學程'),('GR507G','109-1',1,'會計學系');
/*!40000 ALTER TABLE `兼修相關課程` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `兼修表單`
--

DROP TABLE IF EXISTS `兼修表單`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `兼修表單` (
  `學年期` varchar(8) NOT NULL,
  `開辦系編號` varchar(16) NOT NULL,
  `開辦系所名稱` varchar(32) DEFAULT NULL,
  `部別` varchar(16) NOT NULL,
  `招生人數` int(11) DEFAULT '0',
  `年限` int(11) DEFAULT '0',
  PRIMARY KEY (`學年期`,`開辦系編號`,`部別`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `兼修表單`
--

LOCK TABLES `兼修表單` WRITE;
/*!40000 ALTER TABLE `兼修表單` DISABLE KEYS */;
INSERT INTO `兼修表單` VALUES ('108-1','520AB','國際經營與貿易學系','大學日間部',22,4),('108-1','5300B','會計學系','大學日間部',20,3),('108-1','5400B','資訊管理學系','大學日間部',22,3),('108-1','5500B','財經法律學系','大學日間部',20,3),('109-1','4700B','資訊工程學系','大學日間部',34,4),('109-1','520AB','國際經營與貿易學系','大學日間部',20,4),('109-1','5400B','資訊管理學系','大學日間部',25,3),('109-1','5700B','財務金融學系','大學日間部',15,4),('222','5300B','會計學系','大學日間部',20,3),('222','5400B','資訊管理學系','大學日間部',22,3),('444','6400D','資訊工程系','研究所日間',23,4),('444','8400D','電機工程系','大學日間',23,5),('777','5344A','資料管理系','大學部日間',22,3),('777','6400D','資訊工程系','研究所日間',23,4),('777','8400D','電機工程系','大學日間',23,5),('888','5700B','財務金融學系','大學日間部',15,4),('999','520AB','國際經營與貿易學系','大學日間部',22,4),('999','5300B','會計學系','大學日間部',20,3),('999','5400B','資訊管理學系','大學日間部',22,3),('999','5500B','財經法律學系','大學日間部',20,3);
/*!40000 ALTER TABLE `兼修表單` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `問卷`
--

DROP TABLE IF EXISTS `問卷`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `問卷` (
  `學號` int(8) DEFAULT NULL,
  `類型a` int(8) DEFAULT NULL,
  `類型b` int(8) DEFAULT NULL,
  `類型c` int(8) DEFAULT NULL,
  `類型d` int(8) DEFAULT NULL,
  `類型e` int(8) DEFAULT NULL,
  `學號f` int(8) DEFAULT NULL,
  `意願分數` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `問卷`
--

LOCK TABLES `問卷` WRITE;
/*!40000 ALTER TABLE `問卷` DISABLE KEYS */;
/*!40000 ALTER TABLE `問卷` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `學生資料`
--

DROP TABLE IF EXISTS `學生資料`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `學生資料` (
  `系編號` varchar(16) DEFAULT NULL,
  `學號` int(8) NOT NULL,
  `姓名` varchar(32) DEFAULT NULL,
  `密碼` varchar(16) NOT NULL,
  `學籍狀態` varchar(4) DEFAULT NULL,
  `延肆` varchar(4) DEFAULT NULL,
  `已修學分` int(8) NOT NULL DEFAULT '0',
  `興趣分類` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`學號`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `學生資料`
--

LOCK TABLES `學生資料` WRITE;
/*!40000 ALTER TABLE `學生資料` DISABLE KEYS */;
INSERT INTO `學生資料` VALUES ('5400B',10842111,'張一','5447','在學',NULL,111,'研究型'),('5400B',10842112,'張二','5447','在學',NULL,111,'實用型'),('5400B',10842113,'張三','5447','在學',NULL,111,'企業型'),('5400B',10842114,'張四','5447','在學',NULL,111,'研究型'),('5300B',10843116,'孫六','4436','退學',NULL,10,'實用型'),('5300B',10843117,'孫七','4437','休學','0.5',110,'研究型'),('5300B',10843118,'孫八','4438','畢業',NULL,128,'企業型'),('5400B',10844111,'孫一','4441','畢業',NULL,134,'社會型'),('5400B',10844112,'孫二','4442','畢業',NULL,132,NULL),('5400B',10844113,'孫三','4443','畢業',NULL,128,NULL),('5400B',10844114,'孫四','4444','畢業',NULL,133,'研究型'),('5400B',10844115,'孫五','4445','在學','1.0',110,'研究型'),('5400B',10942115,'張五','5447','在學',NULL,111,'研究型'),('5300B',10943116,'王六','5436','在學',NULL,123,'實用型'),('5300B',10943117,'王七','5437','在學',NULL,111,'研究型'),('5300B',10943118,'王八','5438','在學',NULL,100,'企業型'),('5300B',10943119,'王九','5439','休學',NULL,73,NULL),('5400B',10944111,'王一','5441','在學',NULL,110,'研究型'),('5400B',10944112,'王二','5442','在學',NULL,92,'實用型'),('5400B',10944113,'王三','5443','在學',NULL,120,'社會型'),('5400B',10944114,'王四','5444','在學',NULL,120,'研究型'),('5400B',10944115,'王五','5445','休學',NULL,121,NULL),('5400B',10944116,'王六','5446','在學',NULL,123,NULL),('5400B',10944117,'王七','5447','在學',NULL,111,NULL);
/*!40000 ALTER TABLE `學生資料` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `學程申請`
--

DROP TABLE IF EXISTS `學程申請`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `學程申請` (
  `學號` int(8) NOT NULL,
  `申請學程代碼` varchar(16) NOT NULL,
  `申請學年期` varchar(8) NOT NULL,
  `完成學年期` varchar(8) DEFAULT NULL,
  `修習狀態(放棄/取消/通過/修習)` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`學號`,`申請學程代碼`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `學程申請`
--

LOCK TABLES `學程申請` WRITE;
/*!40000 ALTER TABLE `學程申請` DISABLE KEYS */;
INSERT INTO `學程申請` VALUES (10843116,'1011Z','108-1',NULL,'修習'),(10843117,'1011Z','108-1',NULL,'通過'),(10843118,'1011Z','108-1',NULL,'修習'),(10843119,'1102Z','108-2',NULL,'取消'),(10844111,'1011Z','108-1',NULL,'修習'),(10844112,'1043Z','108-1','109-1','通過'),(10844114,'1011Z','108-1',NULL,'修習'),(10844115,'1011Z','108-1','','修習'),(10943117,'1110Z','109-1',NULL,'放棄'),(10943118,'1232Z','109-1',NULL,'修習'),(10944112,'1110Z','109-1',NULL,'取消');
/*!40000 ALTER TABLE `學程申請` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `學程表單`
--

DROP TABLE IF EXISTS `學程表單`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `學程表單` (
  `學年期` varchar(8) DEFAULT NULL,
  `學程代碼` varchar(16) NOT NULL,
  `種類(就業/微型/跨領域)` char(12) DEFAULT NULL,
  `學程名稱` varchar(32) NOT NULL,
  `應修學分` varchar(4) DEFAULT NULL,
  `權責單位` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `學程表單`
--

LOCK TABLES `學程表單` WRITE;
/*!40000 ALTER TABLE `學程表單` DISABLE KEYS */;
INSERT INTO `學程表單` VALUES ('108-1','1011Z','跨','科技管理跨領域學分學程','15','工業系'),('108-1','1043Z','跨','生技保健食品跨領域學分學程','16','生科系'),('108-1','1081Z','跨','創意創新創業跨領域學分學程','14','通識中心'),('108-2','1091Z','跨','奈米科技跨領域學分學程','12','化學系'),('108-2','1102Z','跨','人文素養跨領域學分學程','12','通識中心'),('108-2','1104Z','跨','永續環境營造學程跨領域學分學程','16','地景建築系'),('108-2','1108Z','跨','綠色科技跨領域學分學程','12','工學院'),('109-1','1110Z','跨','系統晶片設計跨領域學分學程','12','電資學院'),('109-1','1113Z','跨','中國大陸經營管理跨領域學分學程','12','國貿系'),('109-1','1114Z','跨','資通安全跨領域學分學程','13','資工系'),('108-1','1123Z','就','鼎新就業學程','14','資管系'),('108-1','1131Z','就','公共行政就業學程','12','通識中心'),('108-1','1132Z','就','商管專業英語跨領域學分學程','12','通識中心'),('108-1','1133Z','就','雅文聽覺口語就業學程','12','特教系'),('108-2','1135Z','就','臺灣證券交易所就業學程','12','財金系'),('108-2','1136Z','就','臺灣集中保管結算所就業學程','12','財金系'),('108-2','1138Z','就','國際會計事務所就業學程','16','會計系'),('109-1','1140Z','就','永然法律就業學程','16','財法系'),('109-1','1143Z','就','景觀學會11.11就業學程','14','地景建築系'),('109-1','1145Z','就','永然法律就業學程葡萄王生技就業學程','16','生科系'),('108-1','1196Z','微','資管系微型學程','8','資訊管理學系'),('108-1','1197Z','微','物理學微型學程','8','物理系'),('108-1','1198Z','微','企管系微型學程','8','企管系'),('108-1','1199Z','微','資工系微型學程','8','資工系'),('108-2','1200Z','微','機械系微型學程','9','機械系'),('108-2','1228Z','微','應數系微型學程','9','應數系'),('109-1','1229Z','微','化學系微型學程','9','化學系'),('109-1','1230Z','微','心理系微型學程','10','心理系'),('109-1','1231Z','微','生科系微型學程','10','生科系'),('109-1','1232Z','微','化工系微型學程','11','化工系');
/*!40000 ALTER TABLE `學程表單` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `成績紀錄`
--

DROP TABLE IF EXISTS `成績紀錄`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `成績紀錄` (
  `學年期` varchar(8) DEFAULT NULL,
  `學號` int(8) NOT NULL,
  `課程代碼` varchar(16) NOT NULL,
  `分數` float NOT NULL DEFAULT '0',
  `評分落點` char(4) DEFAULT NULL,
  `修習狀況` varchar(16) DEFAULT NULL,
  `評價` int(4) DEFAULT '0',
  `備註` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`學號`,`課程代碼`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `成績紀錄`
--

LOCK TABLES `成績紀錄` WRITE;
/*!40000 ALTER TABLE `成績紀錄` DISABLE KEYS */;
INSERT INTO `成績紀錄` VALUES ('109-1',10842111,'AC073K',82,'A','P',8,''),('109-1',10842111,'AC106A',72,'B','P',7,''),('109-1',10842111,'AC237E',92,'A+','P',9,''),('109-1',10842111,'AC435M',85,'A','P',8,''),('109-1',10842111,'BA100A',62,'C','P',6,''),('109-1',10842112,'AC073K',72,'B','P',7,''),('109-1',10842112,'AC237E',82,'A','P',8,''),('109-1',10842112,'AC435M',62,'C','P',5,''),('109-1',10842112,'BA100A',92,'B','P',9,''),('109-1',10842113,'AC073K',74,'A','P',6,''),('109-1',10842113,'AC237E',46,'D','F',4,''),('109-1',10842113,'BA100A',62,'C-','P',4,''),('109-1',10842114,'AC073K',68,'C','P',5,''),('109-1',10842114,'BA100A',98,'A','P',9,''),('108-1',10843116,'AC073K',60,'C-','P',10,NULL),('109-1',10843116,'AC237E',46,'D','F',2,''),('108-2',10843116,'CS681R',80,'B-','F',8,NULL),('108-2',10843117,'AC073K',61,'C-','P',6,NULL),('108-2',10843117,'BA100A',71,'B','P',8,NULL),('108-2',10843117,'CS681R',81,'B+','P',5,NULL),('108-2',10843117,'ES803L',91,'A-','P',10,NULL),('108-1',10843118,'AC073K',92,'A','P',7,NULL),('108-2',10843118,'ES803L',51,'D','F',9,NULL),('108-1',10844111,'AC073K',78,'B+','P',8,NULL),('108-1',10844111,'AC106A',82,'A-','P',0,NULL),('108-2',10844111,'AC238F',40,'F','未通過',0,NULL),('108-2',10844111,'AC609B',97,'A+','P',0,NULL),('108-1',10844111,'BA100A',90,'A','P',6,NULL),('108-1',10844111,'CS681R',89,'A-','P',9,NULL),('108-1',10844112,'AC073K',67,'C+','P',10,NULL),('108-1',10844112,'AC435M',55,'D','未通過',0,NULL),('108-2',10844112,'BA051G',81,'A-','P',0,NULL),('108-2',10844114,'AC073K',62,'C','P',9,NULL),('108-1',10844114,'ES791L',76,'B','P',8,NULL),('108-1',10844115,'AC073K',96,'A+','P',10,NULL),('109-1',10943117,'ES791L',75,'B','P',0,NULL),('108-2',10944111,'AC073K',75,'B','P',8,NULL),('109-1',10944112,'BA100A',82,'A-','P',10,NULL),('109-1',10944113,'BA100A',90,'A','P',9,NULL),('109-1',10944113,'CS681R',92,'A','P',9,''),('109-1',10944115,'AC238F',78,'B','P',0,NULL),('109-1',10944115,'CS681R',0,'N','C',2,NULL),('109-1',10944116,'CS681R',40,'D-','F',4,NULL),('109-1',10944116,'ES803L',70,'B-','P',7,NULL),('109-1',10944117,'CS681R',80,'B-','P',8,NULL),('109-1',10944117,'ES803L',40,'D','F',3,NULL),('107-2',10944119,'AC073K',75,'B','P',8,'');
/*!40000 ALTER TABLE `成績紀錄` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `系所清單`
--

DROP TABLE IF EXISTS `系所清單`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `系所清單` (
  `系編號` varchar(16) NOT NULL,
  `系所名稱` varchar(16) NOT NULL,
  `所屬學院` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `系所清單`
--

LOCK TABLES `系所清單` WRITE;
/*!40000 ALTER TABLE `系所清單` DISABLE KEYS */;
INSERT INTO `系所清單` VALUES ('3100B','應用數學系','商'),('3210B','物理學系物理組','商'),('3220B','物理學系光電與材料科學組','商'),('3300B','化學系化學組','理'),('3400B','心理學系','理'),('3500B','生物科技學系','理'),('4100B','化學工程學系綠能製作組','理'),('4120B','化學工程學系生化工程組','理'),('4130B','化學工程學系材料工程組','理'),('4200B','土木工程學系','工'),('4300B','機械工程學系','工'),('4410B','工業與系統工程學系工程組','工'),('4420B','工業與系統工程學系管理組','工'),('4501B','生物醫學工程學系','工'),('4600B','電子工程學系','工'),('4700B','資訊工程學系','工'),('4800B','電機工程學系','工'),('490AB','環境工程學系','工'),('5110B','企業管理學系服務業管理組','商'),('5120B','企業管理學系高科技業管理組','商'),('5130B','企業管理學系工商管理組','商'),('520AB','國際經營與貿易學系','商'),('5300B','會計學系','商'),('5400B','資訊管理學系','商'),('5500B','財經法律學系','法'),('5700B','財務金融學系','商'),('6100B','建築學系','建築'),('6200B','室內設計學系','建築'),('6310B','商業設計學系商業設計組','建築'),('6320B','商業設計學系產品設計組','建築'),('6500B','景觀學系','建築'),('690AB','地景建築學系','建築'),('8200B','應用外國語文學系','人育'),('8700B','應用華語文學系','人育'),('8800B','人文與教育學院學士學位學程','人育');
/*!40000 ALTER TABLE `系所清單` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `課程清單`
--

DROP TABLE IF EXISTS `課程清單`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `課程清單` (
  `學年期` varchar(8) NOT NULL,
  `課代碼` varchar(16) NOT NULL,
  `課程名稱` varchar(32) DEFAULT NULL,
  `類別` varchar(16) NOT NULL,
  `開課班級` varchar(12) DEFAULT NULL,
  `必選修` varchar(4) DEFAULT NULL,
  `期程` varchar(4) DEFAULT NULL,
  `學分` tinyint(2) DEFAULT '0',
  `上課時間` varchar(8) DEFAULT NULL,
  `上課教室` varchar(8) DEFAULT NULL,
  `授課教師` varchar(8) DEFAULT NULL,
  `授課語言` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`學年期`,`課代碼`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `課程清單`
--

LOCK TABLES `課程清單` WRITE;
/*!40000 ALTER TABLE `課程清單` DISABLE KEYS */;
INSERT INTO `課程清單` VALUES ('108-1','AC073K','財務報表分析','一般','會計三甲','選修','半',2,'1-34','教學','陳','國語'),('108-1','AC106A','企業的故事書-會計學','一般','資管一甲','必修','半',1,'','','陳','國語'),('108-1','AC237E','統計學(一)','一般','國貿二乙','必修','半',3,'3-567','教學410','李','國語'),('108-1','AC435M','高等會計學(一)','一般','會計三丙','選修','半',3,'4-234','商學301','孟','國語'),('108-1','BA100A','資訊科技導論','一般','資管二乙','必修','半',3,'2-234','教學202','張','國語'),('108-1','ES791L','音樂欣賞','我','基礎必修通識','通識','半',2,'4-12','教學410','陳','英語'),('108-1','ES803L','數據庫應用基礎','物','延伸必修通識','通識','半',2,'5-56','教學401','李','國語'),('108-2','AC073K','財務報表分析','一般','國貿三甲','選修','半',2,'3-34','商學308','張','國語'),('108-2','AC238F','統計學(二)','一般','會計二乙','必修','半',3,'2-56','教學501','曹','國語'),('108-2','AC240C','經濟學(二)','一般','資管二甲','必修','半',3,'4-56','資管104','陳','國語'),('108-2','AC453K','成本會計(一)','一般','會計二甲','選修','半',3,'1-567','教學502','孔','國語'),('108-2','AC454K','成本會計(二)','一般','會計二甲','選修','半',2,'2-234','商學306','張','國語'),('108-2','AC609B','英文(二)','一般','財金二乙','必修','半',2,'4-12','全人301','郭','英語'),('108-2','BA051G','管理數學','一般','企管工商組二丙','必修','半',3,'5-234','教學405','崔','國語'),('108-2','BA100A','資訊科技導論','一般','資管二乙','必修','半',3,'2-234','教學203','張','國語'),('108-2','CS681R','大數據智慧技術','物','基礎必修通識','通識','半',2,'5-12','工學304','李','國語'),('109-1','AC073K','財務報表分析','一般','資管二乙','必修','半',3,'2-56','教學504','李','國語'),('109-1','AC106A','企業的故事書-會計學','一般','資管一乙','必修','半',3,'2-234','教學501','王','國語'),('109-1','AC237E','統計學(一)','一般','資管二乙','必修','半',3,'2-234','教學502','張','國語'),('109-1','AC435M','高等會計學(一)','一般','資管三乙','必修','半',3,'2-234','教學502','黃','國語'),('109-1','BA100A','資訊科技導論','一般','資管三乙','必修','半',3,'2-234','教學202','張','國語'),('109-1','CS681R','大數據智慧技術','物','基礎必修通識','通識','半',2,'5-12','工學304三館','李','國語'),('109-1','ES803L','數據庫應用基礎','物','延伸必修通識','通識','半',2,'5-56','教學403','李','國語'),('109-1','GR507G','網球一','體育','體育興趣','必修','半',0,'3-DE','','陳','國語'),('109-1','GR509A','飛盤','體育','體育興趣','必修','半',0,'2-56','','張','國語');
/*!40000 ALTER TABLE `課程清單` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view1`
--

DROP TABLE IF EXISTS `view1`;
/*!50001 DROP VIEW IF EXISTS `view1`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view1` AS SELECT 
 1 AS `學年期`,
 1 AS `學號`,
 1 AS `課程代碼`,
 1 AS `分數`,
 1 AS `評分落點`,
 1 AS `修習狀況`,
 1 AS `備註`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view1`
--

/*!50001 DROP VIEW IF EXISTS `view1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`i4m`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view1` AS (select `成績紀錄`.`學年期` AS `學年期`,`成績紀錄`.`學號` AS `學號`,`成績紀錄`.`課程代碼` AS `課程代碼`,`成績紀錄`.`分數` AS `分數`,`成績紀錄`.`評分落點` AS `評分落點`,`成績紀錄`.`修習狀況` AS `修習狀況`,`成績紀錄`.`備註` AS `備註` from `成績紀錄` where ((`成績紀錄`.`課程代碼` = 'AC073K') and (`成績紀錄`.`修習狀況` = 'P'))) */;
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

-- Dump completed on 2022-12-09 17:13:28
