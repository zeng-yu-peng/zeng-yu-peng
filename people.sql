CREATE DATABASE  IF NOT EXISTS `people` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `people`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: localhost    Database: people
-- ------------------------------------------------------
-- Server version	8.0.24




--
-- Table structure for table `People`
--
#一、全國住民整合資料
DROP TABLE IF EXISTS  `ALLPeople`;
CREATE TABLE `ALLPeople`(
#住民資料表,ID:住民序號,SID:身分證字號,HID:健保卡號,PID:護照號碼,RID:居留證號碼,NAME:姓名,ONAME:原文姓名,PHONE:手機號碼,HPHONE:住家電話,BDAY:生日;
#SEX:性別,ADDRESS:住址,HADDRESS:戶籍地址,HOTEL:旅遊居住地,NATION:國籍,FID:緊急連絡人序號,P_CON:健康狀態;

`P_ID` VARCHAR(7),
`P_SID` VARCHAR(10),
`P_HID` VARCHAR(12),
`P_PID` VARCHAR(9),
`P_RID` VARCHAR(10),
`P_NAME` VARCHAR(20),
`P_ONAME` VARCHAR(40),
`P_PHONE` VARCHAR(10),
`P_HPHONE` VARCHAR(10),
`P_BDAY` DATE,
`P_SEX` CHAR(2),
`P_ADDRESS` VARCHAR(60),
`P_HADDRESS` VARCHAR(60),
`P_HOTEL` VARCHAR(20),
`P_NATION` VARCHAR(30),
`P_FID` VARCHAR(12),
`P_CON` VARCHAR(12),
PRIMARY KEY(`P_ID`)
);


##truncate table 



--
-- Table structure for table `ALLVaccine`
--
#二、疫苗資料表
DROP TABLE IF EXISTS  `ALLVaccine`;
CREATE TABLE `ALLVaccine`(
#疫苗資料表,V_ID:疫苗記錄序號,P_ID:住民序號,V_NAME:疫苗名稱,V_DATE:注射日期;
`V_ID` VARCHAR(7),
`P_ID` VARCHAR(7),
`V_NAME` VARCHAR(10),
`V_DATE` DATE,
#FOREIGN KEY(`P_ID`) REFERENCES People(`P_ID`),
PRIMARY KEY(`V_ID`)
);




--
-- 
--
#三、全國住民QR code
DROP TABLE IF EXISTS `ALLQR_People`;
CREATE TABLE `ALLQR_People` (
  `P_ID` varchar(7) NOT NULL,
  `P_QR` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;









--
-- 
--
#(1)戶政資料
DROP TABLE IF EXISTS `speople`;
CREATE TABLE `speople` (
  `P_SID` varchar(10) NOT NULL,
  `P_NAME` varchar(20) DEFAULT NULL,
  `P_SEX` CHAR(2),
  `P_BDAY` date DEFAULT NULL,
  `P_HPHONE` varchar(10) DEFAULT NULL,
  `P_HADDRESS` varchar(60) DEFAULT NULL,
  `P_PID` varchar(9) DEFAULT NULL,
  `P_NATION` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`P_SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `speople` VALUES ('0000001','王大強','M','2000-02-21','034987164','桃園市中壢區山東路','','中華民國');
INSERT INTO `speople` VALUES ('0000002','張小明','M','2010-02-01','038854974','桃園市中壢區環中東路','','中華民國');
INSERT INTO `speople` VALUES ('0000003','李三','M','2000-01-01','035487941','桃園市中壢區新明路','','中華民國');


--
-- 
--
#(2)健保資料
DROP TABLE IF EXISTS `hid`;
CREATE TABLE `hid` (
  `P_HID` varchar(12) NOT NULL,
  `P_NAME` varchar(20) NOT NULL,
  `P_SID` varchar(10) DEFAULT NULL,
  `P_PID` varchar(9) DEFAULT NULL,
  `P_PHONE` varchar(10) DEFAULT NULL,
  `P_FID` varchar(7) DEFAULT NULL,
  `P_CON` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`P_HID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `hid` VALUES ('A000001','王大強','0000001','Z000001','0987456123','0000001','G');
INSERT INTO `hid` VALUES ('A000002','張小明','0000002','','0985562314','0000002','G');
INSERT INTO `hid` VALUES ('A000003','李三','0000003','','0923654789','0000003','G');
INSERT INTO `hid` VALUES ('A000004','張春花','','H000001','0987456123','0000012','G');


--
-- 
--
#(3)電信申請者資料
DROP TABLE IF EXISTS `phone`;
CREATE TABLE `phone` (
  `P_PHONE` varchar(10) NOT NULL,
  `P_SID` varchar(10) DEFAULT NULL,
  `P_PID` varchar(9) DEFAULT NULL,
  `P_NAME` varchar(20) DEFAULT NULL,
  `P_BDAY` date DEFAULT NULL,
  `P_ADDRESS` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`P_PHONE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `phone` VALUES ('0987456123','0000001','Z000001','王大強','2000-02-21','桃園市中壢區山東路');
INSERT INTO `phone` VALUES ('0985562314','0000002','','張小明','2010-02-01','桃園市中壢區環中東路');
INSERT INTO `phone` VALUES ('0923654789','0000003','','李三','2000-01-01','桃園市中壢區新明路');



--
-- 
--
#(4)出入境紀錄
DROP TABLE IF EXISTS `ppeople`;
CREATE TABLE `ppeople` (
  `P_PID` varchar(9) NOT NULL,
  `P_SID` VARCHAR(10),
  `P_NAME` varchar(20) DEFAULT NULL,
  `P_ONAME` varchar(40) DEFAULT NULL,
  `P_NATION` varchar(30) DEFAULT NULL,
  `P_HOTEL` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`P_PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `ppeople` VALUES ('Z000001','0000001','王大強','WANG','中華民國','信實宿舍');
INSERT INTO `ppeople` VALUES ('H000001','','張春花','ZHANG','泰國','力行宿舍');
INSERT INTO `ppeople` VALUES ('H000002','','李大肚','LIN','越南','力行宿舍');
INSERT INTO `ppeople` VALUES ('H000003','','陳小氣','CHEN','緬甸','力行宿舍');



--
-- 
--
#(5)非本國籍者資料
DROP TABLE IF EXISTS `rpeople`;
CREATE TABLE `rpeople` (
  `P_PID` varchar(9) NOT NULL,
  `P_RID` varchar(10) NOT NULL,
  `P_NAME` varchar(20) DEFAULT NULL,
  `P_ONAME` varchar(40) DEFAULT NULL,
  `P_SEX` CHAR(2),
  `P_NATION` varchar(30) DEFAULT NULL,
  `P_PHONE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`P_RID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `rpeople` VALUES ('H000001','1597894561','張春花','ZHANG','W','泰國','0987456123');
INSERT INTO `rpeople` VALUES ('H000002','1452369874','李大肚','LIN','M','越南','0985562314');
INSERT INTO `rpeople` VALUES ('H000003','3687452196','陳小氣','CHEN','M','緬甸','0923654789');


/*
--
-- 
--
#(7-1)手機驗證/本
DROP TABLE IF EXISTS `confirm_p1`;
CREATE TABLE `confirm_p1` (
  `P_SID` varchar(10) NOT NULL,
  `P_HID` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`P_SID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#(7-2)手機驗證/外
DROP TABLE IF EXISTS `confirm_p2`;
CREATE TABLE `confirm_p2` (
  `P_RID` varchar(10) NOT NULL,
  `P_PID` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`P_RID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




--
--
--
#(8)手機確認身分
DROP TABLE IF EXISTS `reply_p`;
CREATE TABLE `reply_p` (
  `P_ID` varchar(7) NOT NULL,
  `P_NAME` varchar(20) DEFAULT NULL,
  `P_PHONE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




--
-- 
--
#(9)輸入驗證碼
DROP TABLE IF EXISTS `apply_p`;
CREATE TABLE `apply_p` (
  `P_VERIFY` varchar(10) NOT NULL,
  PRIMARY KEY (`P_VERIFY`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `apply_p` WRITE;
UNLOCK TABLES;

*/





--
--
--
#(10)疫苗紀錄
DROP TABLE IF EXISTS  `vaccine`;
CREATE TABLE `vaccine`(
#,V_ID:疫苗記錄序號,V_NAME:疫苗名稱,V_DATE:注射日期;
`V_ID` VARCHAR(7) NOT NULL,
`P_HID` varchar(12) NOT NULL,
`V_NAME` VARCHAR(10) DEFAULT NULL,
`V_DATE` DATE DEFAULT NULL,
PRIMARY KEY(`V_ID`)
);

INSERT INTO `vaccine` VALUES("0000001","A000001","BNT",'2021-08-12');
INSERT INTO `vaccine` VALUES("0000002","A000001","AZ",'2021-12-24');
INSERT INTO `vaccine` VALUES("0000003","A000002","AZ",'2021-12-24');



--
--
--
#(11)目前健康狀態
DROP TABLE IF EXISTS `state_p`;
CREATE TABLE `state_p` (
  `P_ID` varchar(7) NOT NULL,
  `P_CON` varchar(12) NOT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;




--
-- 
--
#(12)住民QR code
DROP TABLE IF EXISTS `QR_p`;
CREATE TABLE `QR_p` (
  `P_ID` varchar(7) NOT NULL,
  `P_QR` char(128) DEFAULT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



--
-- 
--
#(13)檢驗住民足跡
DROP TABLE IF EXISTS `test_p`;
#匡列紀錄資料表,I_ID:匡列序號資料,END_TIME:結束匡列時間,I_TIME:匡列時間,I_SYMPTOM是否有症狀
CREATE TABLE `test_p` (
  `I_ID` varchar(7) NOT NULL,
  `P_ID` varchar(7) NOT NULL,
  `I_TIME` DATETIME,  
  `END_TIME` DATETIME,
  `I_SYMPTOM` BOOLEAN, 
  PRIMARY KEY (`I_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `test_p` VALUES("I000001","0001000",'2021-12-24 16:52:05','2021-01-08 16:52:05',false);
INSERT INTO `test_p` VALUES("I000002","0001001",'2021-12-24 16:52:05',null,false);
INSERT INTO `test_p` VALUES("I000003","0001004",'2021-12-11 16:52:05',null,false);
INSERT INTO `test_p` VALUES("I000004","0001000",'2022-01-14 16:52:05',null,true);



--
-- 
--
#(14)檢驗結果
DROP TABLE IF EXISTS `cover_p`;
CREATE TABLE `cover_p` (
  `P_ID` varchar(7) NOT NULL,
  `P_CON` varchar(12) NOT NULL,
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



