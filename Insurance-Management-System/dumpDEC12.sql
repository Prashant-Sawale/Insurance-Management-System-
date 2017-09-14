-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: training_and_placement_db
-- ------------------------------------------------------
-- Server version	5.6.33

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
-- Table structure for table `adminstaff`
--

DROP TABLE IF EXISTS `adminstaff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminstaff` (
  `SSN` int(11) NOT NULL,
  `RoleType` varchar(45) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `adminstaff_ibfk_1_idx` (`SSN`),
  CONSTRAINT `adminstaff_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminstaff`
--

LOCK TABLES `adminstaff` WRITE;
/*!40000 ALTER TABLE `adminstaff` DISABLE KEYS */;
/*!40000 ALTER TABLE `adminstaff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batchschedule`
--

DROP TABLE IF EXISTS `batchschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batchschedule` (
  `batchScheduleID` int(11) NOT NULL,
  `time` varchar(45) NOT NULL,
  `courseID` int(11) DEFAULT NULL,
  `SSN` int(11) DEFAULT NULL,
  PRIMARY KEY (`batchScheduleID`),
  KEY `courseFK_idx` (`courseID`),
  KEY `ssnFK_idx` (`SSN`),
  CONSTRAINT `batchschedule_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `trainers` (`SSN`),
  CONSTRAINT `courseFK` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batchschedule`
--

LOCK TABLES `batchschedule` WRITE;
/*!40000 ALTER TABLE `batchschedule` DISABLE KEYS */;
INSERT INTO `batchschedule` VALUES (1,'morning',1,114),(2,'evening',2,116),(3,'morning',1,104);
/*!40000 ALTER TABLE `batchschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `branchdepartmentlist`
--

DROP TABLE IF EXISTS `branchdepartmentlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `branchdepartmentlist` (
  `idbranchDepartmentListID` int(11) NOT NULL AUTO_INCREMENT,
  `branchID` int(11) DEFAULT NULL,
  `departmentID` int(11) DEFAULT NULL,
  PRIMARY KEY (`idbranchDepartmentListID`),
  KEY `branchFK_idx` (`branchID`),
  KEY `departmentFK_idx` (`departmentID`),
  CONSTRAINT `branchFK` FOREIGN KEY (`branchID`) REFERENCES `trainingoffice` (`branchID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `departmentFK` FOREIGN KEY (`departmentID`) REFERENCES `department` (`departmentID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `branchdepartmentlist`
--

LOCK TABLES `branchdepartmentlist` WRITE;
/*!40000 ALTER TABLE `branchdepartmentlist` DISABLE KEYS */;
INSERT INTO `branchdepartmentlist` VALUES (1,101,1),(2,102,1),(3,103,2),(4,101,2),(5,102,2),(6,103,1);
/*!40000 ALTER TABLE `branchdepartmentlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `CompanyID` int(11) NOT NULL AUTO_INCREMENT,
  `CompanyName` varchar(45) NOT NULL,
  PRIMARY KEY (`CompanyID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'Microsoft'),(2,'Apple'),(3,'Google'),(4,'Amazon');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course` (
  `courseID` int(11) NOT NULL,
  `courseName` varchar(45) NOT NULL,
  `courseFees` int(11) NOT NULL,
  PRIMARY KEY (`courseID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (1,'Automation Testing',1000),(2,'Core Java ',1000);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coursearr`
--

DROP TABLE IF EXISTS `coursearr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coursearr` (
  `courseID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coursearr`
--

LOCK TABLES `coursearr` WRITE;
/*!40000 ALTER TABLE `coursearr` DISABLE KEYS */;
INSERT INTO `coursearr` VALUES (1),(2),(2),(1);
/*!40000 ALTER TABLE `coursearr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `departmentID` int(11) NOT NULL,
  `departmentName` varchar(45) NOT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Testing'),(2,'Development');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptarr`
--

DROP TABLE IF EXISTS `deptarr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptarr` (
  `departmentID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptarr`
--

LOCK TABLES `deptarr` WRITE;
/*!40000 ALTER TABLE `deptarr` DISABLE KEYS */;
INSERT INTO `deptarr` VALUES (1),(2);
/*!40000 ALTER TABLE `deptarr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptcourselist`
--

DROP TABLE IF EXISTS `deptcourselist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptcourselist` (
  `ID` int(11) NOT NULL,
  `deptID` int(11) DEFAULT NULL,
  `courseID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `courseID` (`courseID`),
  KEY `deptcourselist_ibfk_2_idx` (`deptID`),
  CONSTRAINT `deptcourselist_ibfk_1` FOREIGN KEY (`courseID`) REFERENCES `course` (`courseID`),
  CONSTRAINT `deptcourselist_ibfk_2` FOREIGN KEY (`deptID`) REFERENCES `department` (`departmentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptcourselist`
--

LOCK TABLES `deptcourselist` WRITE;
/*!40000 ALTER TABLE `deptcourselist` DISABLE KEYS */;
INSERT INTO `deptcourselist` VALUES (1,1,1),(2,2,2),(3,1,2),(4,2,1);
/*!40000 ALTER TABLE `deptcourselist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `SSN` int(11) NOT NULL DEFAULT '0',
  `employeeID` int(11) DEFAULT '101',
  `salary` int(11) NOT NULL DEFAULT '800',
  `employeeType` varchar(45) NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `SSN` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (104,1,1000,'T'),(105,2,1000,'A'),(106,3,1000,'T'),(109,5,800,'A'),(111,6,800,'T'),(112,101,800,'T'),(113,101,800,'T'),(114,101,800,'T'),(116,101,800,'T');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `training_and_placement_db`.`employee_AFTER_INSERT` AFTER INSERT ON `employee` FOR EACH ROW
BEGIN
set @etype=new.employeeType;
set @ssn=new.SSN;

if @etype Like 'T' then 
insert into trainers (SSN) values (@ssn);
#elseif new.etype Like'A' then
#insert into employee(SSN) values (@ssn);

end if ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `training_and_placement_db`.`employee_AFTER_UPDATE` AFTER UPDATE ON `employee` FOR EACH ROW
BEGIN
set @etype=new.employeeType;
set @ssn=new.SSN;

if @etype Like 'T' then 
insert into trainers (SSN) values (@ssn);
#elseif new.etype Like'A' then
#insert into employee(SSN) values (@ssn);

end if ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `interviewschedule`
--

DROP TABLE IF EXISTS `interviewschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interviewschedule` (
  `ID` int(11) NOT NULL,
  `Date` date NOT NULL,
  `CompanyID` int(11) DEFAULT NULL,
  `Requirement` varchar(55) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `companyFK_idx` (`CompanyID`),
  CONSTRAINT `companyFK` FOREIGN KEY (`CompanyID`) REFERENCES `company` (`CompanyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interviewschedule`
--

LOCK TABLES `interviewschedule` WRITE;
/*!40000 ALTER TABLE `interviewschedule` DISABLE KEYS */;
INSERT INTO `interviewschedule` VALUES (1,'2016-02-02',1,'C#'),(2,'2016-02-02',2,'Obj C'),(3,'2016-02-02',3,'web'),(4,'2016-02-02',4,'System Algorithm');
/*!40000 ALTER TABLE `interviewschedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person` (
  `SSN` int(11) NOT NULL,
  `person_name` varchar(32) DEFAULT NULL,
  `emailID` varchar(32) DEFAULT NULL,
  `address` varchar(32) DEFAULT NULL,
  `branchID` int(11) DEFAULT NULL,
  `personType` varchar(45) NOT NULL,
  `phoneNumber` varchar(45) NOT NULL,
  `Status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`SSN`),
  UNIQUE KEY `phoneNumber_UNIQUE` (`phoneNumber`),
  UNIQUE KEY `emailID` (`emailID`),
  KEY `branchFK_idx` (`branchID`),
  CONSTRAINT `person_ibfk_1` FOREIGN KEY (`branchID`) REFERENCES `trainingoffice` (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES (100,'Prashant','psswl21@gmail.com','boston',101,'S','857-544-1009','Active'),(101,'Prathamesh','Landekar.p@gmail.com','boston',102,'S','857-544-1040','Active'),(103,'Rohan','Magare.R@gmail.com','boston',103,'S','857-544-1001','Inactive'),(104,'E_kal','Kal@gmail.com','pune',101,'E','857-544-1002','Active'),(105,'E_Sachin','Sachin@gmail.com','mumbai',102,'E','857-544-1003','Active'),(106,'E_jyoti','jyoti@gmail.com','bangalore',103,'E','857-544-1004','Active'),(107,'Vedant','vedant@gmail.com','pune',101,'S','857-544-1005','Active'),(108,'E_pranav','pranav@gmail.com','mumbai',102,'E','857-544-1006','Inactive'),(109,'E_prof1','profEID','pune',101,'E','857','Active'),(110,'Saurabh','saurabh@gmail.com','banagalore',103,'S','857-544-1011','Active'),(111,'SavhinGavande','SavhinGavande@gmail.com','mumbai',102,'E','857-544-1089','Inactive'),(112,'E_prof2','prof2@gmail.com','pune',101,'E','857-544-1090','Active'),(113,'E_prof3','E_prof3@gmail.com','mumbai',102,'E','857-544-1091','Inactive'),(114,'E_prof4','E_prof4@gmail.com','pune',101,'E','857-544-1092','Active'),(115,'Shruthey','Shruthey@gmail.com','mumbai',102,'S','857-544-1093','Inactive'),(116,'E_prof5','E_prof5@gmail.com','bangalore',103,'E','857-544-1094','Active'),(117,'S_vedant','S_vedant@gmail.com','pune',101,'S','857-544-1095','Active');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `training_and_placement_db`.`person_AFTER_INSERT` AFTER INSERT ON `person` FOR EACH ROW
BEGIN
set @ptype=new.persontype;
set @ssn=new.SSN;

if @ptype Like 'S' then 
insert into student (SSN) values (@ssn);
elseif new.personType Like'E' then
insert into employee(SSN) values (@ssn);

end if ;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `registration`
--

DROP TABLE IF EXISTS `registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registration` (
  `RegID` int(11) NOT NULL,
  `ID` int(11) DEFAULT NULL,
  `SSN` int(11) DEFAULT NULL,
  PRIMARY KEY (`RegID`),
  KEY `ID` (`ID`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `registration_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `interviewschedule` (`ID`),
  CONSTRAINT `registration_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registration`
--

LOCK TABLES `registration` WRITE;
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
INSERT INTO `registration` VALUES (1,1,100),(2,2,101),(3,3,103),(4,4,110),(5,4,115),(6,3,110),(7,2,115),(8,1,103),(9,3,115);
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `training_and_placement_db`.`registration_AFTER_INSERT` AFTER INSERT ON `registration` FOR EACH ROW
BEGIN
set @LastInsertedID =(select MAX(regID) from registration);
insert into studentinterviewrecord (RegID,Result)values(@LastInsertedID ,'painding');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `stdforinter`
--

DROP TABLE IF EXISTS `stdforinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stdforinter` (
  `SSN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stdforinter`
--

LOCK TABLES `stdforinter` WRITE;
/*!40000 ALTER TABLE `stdforinter` DISABLE KEYS */;
INSERT INTO `stdforinter` VALUES (100),(103);
/*!40000 ALTER TABLE `stdforinter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `SSN` int(11) NOT NULL,
  `studentID` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL,
  `trainingCompleted` varchar(45) NOT NULL,
  `enrollDate` date NOT NULL,
  `feesPaid` int(11) NOT NULL,
  `feesDue` int(11) NOT NULL,
  `IsActive` varchar(45) NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `ssnfk` FOREIGN KEY (`SSN`) REFERENCES `person` (`SSN`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (100,'st1','unplaced','yes','2016-10-10',1000,0,'Active'),(101,'st2','placed','no','2016-10-11',500,0,'Active'),(103,'st3','placed','yes','2016-06-12',1000,2000,'Active'),(110,'st5','unplaced','yes','2016-02-12',900,0,'Active'),(115,'st6','unplaced','yes','2016-04-01',600,1000,'Active'),(117,'st7','unplaced','yes','2016-05-01',0,0,'Active');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentaccount`
--

DROP TABLE IF EXISTS `studentaccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentaccount` (
  `studentaccountNumber` int(11) NOT NULL,
  `SSN` int(11) NOT NULL,
  `FeesPaid` varchar(45) NOT NULL,
  PRIMARY KEY (`studentaccountNumber`,`SSN`),
  KEY `ssnFK_idx` (`SSN`),
  CONSTRAINT `studentaccount_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`),
  CONSTRAINT `studentaccount_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentaccount`
--

LOCK TABLES `studentaccount` WRITE;
/*!40000 ALTER TABLE `studentaccount` DISABLE KEYS */;
/*!40000 ALTER TABLE `studentaccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentbatchschedule`
--

DROP TABLE IF EXISTS `studentbatchschedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentbatchschedule` (
  `ID` int(11) NOT NULL,
  `SSN` int(11) DEFAULT NULL,
  `batchScheduleID` int(11) DEFAULT NULL,
  KEY `batchScheduleID` (`batchScheduleID`),
  KEY `SSN` (`SSN`),
  CONSTRAINT `studentbatchschedule_ibfk_1` FOREIGN KEY (`batchScheduleID`) REFERENCES `batchschedule` (`batchScheduleID`),
  CONSTRAINT `studentbatchschedule_ibfk_2` FOREIGN KEY (`SSN`) REFERENCES `student` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentbatchschedule`
--

LOCK TABLES `studentbatchschedule` WRITE;
/*!40000 ALTER TABLE `studentbatchschedule` DISABLE KEYS */;
INSERT INTO `studentbatchschedule` VALUES (1,100,1),(2,101,2),(3,100,2),(4,115,1),(5,103,1),(6,103,2);
/*!40000 ALTER TABLE `studentbatchschedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `training_and_placement_db`.`studentbatchschedule_AFTER_INSERT` AFTER INSERT ON `studentbatchschedule` FOR EACH ROW
BEGIN


set @newbatchSchID=new.batchScheduleID;

set @cID =(select courseID from batchSchedule where batchScheduleID=@newbatchSchID);

set @fees=(select courseFees from course where courseID=@cID);

set @currfees=(select feesDue from student where SSN=new.SSN);

update student set feesDue=(@currfees+@fees)
where SSN=new.SSN;


END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `studentinterviewrecord`
--

DROP TABLE IF EXISTS `studentinterviewrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentinterviewrecord` (
  `RecordNo` int(11) NOT NULL AUTO_INCREMENT,
  `RegID` int(11) DEFAULT NULL,
  `Result` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`RecordNo`),
  KEY `RegID` (`RegID`),
  CONSTRAINT `studentinterviewrecord_ibfk_1` FOREIGN KEY (`RegID`) REFERENCES `registration` (`RegID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentinterviewrecord`
--

LOCK TABLES `studentinterviewrecord` WRITE;
/*!40000 ALTER TABLE `studentinterviewrecord` DISABLE KEYS */;
INSERT INTO `studentinterviewrecord` VALUES (1,1,'places'),(2,2,'placed'),(5,3,'painding'),(6,4,'painding'),(7,5,'painding');
/*!40000 ALTER TABLE `studentinterviewrecord` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `studentsforinter`
--

DROP TABLE IF EXISTS `studentsforinter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studentsforinter` (
  `SSN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `studentsforinter`
--

LOCK TABLES `studentsforinter` WRITE;
/*!40000 ALTER TABLE `studentsforinter` DISABLE KEYS */;
INSERT INTO `studentsforinter` VALUES (100),(103);
/*!40000 ALTER TABLE `studentsforinter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tempertable`
--

DROP TABLE IF EXISTS `tempertable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tempertable` (
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tempertable`
--

LOCK TABLES `tempertable` WRITE;
/*!40000 ALTER TABLE `tempertable` DISABLE KEYS */;
INSERT INTO `tempertable` VALUES (100),(107);
/*!40000 ALTER TABLE `tempertable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporarytable`
--

DROP TABLE IF EXISTS `temporarytable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporarytable` (
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporarytable`
--

LOCK TABLES `temporarytable` WRITE;
/*!40000 ALTER TABLE `temporarytable` DISABLE KEYS */;
INSERT INTO `temporarytable` VALUES (100),(107);
/*!40000 ALTER TABLE `temporarytable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temptable`
--

DROP TABLE IF EXISTS `temptable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temptable` (
  `SSN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temptable`
--

LOCK TABLES `temptable` WRITE;
/*!40000 ALTER TABLE `temptable` DISABLE KEYS */;
INSERT INTO `temptable` VALUES (100),(107);
/*!40000 ALTER TABLE `temptable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainers`
--

DROP TABLE IF EXISTS `trainers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainers` (
  `SSN` int(11) NOT NULL,
  `trainerType` varchar(32) NOT NULL,
  PRIMARY KEY (`SSN`),
  KEY `trainers_ibfk_1_idx` (`SSN`),
  CONSTRAINT `trainers_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainers`
--

LOCK TABLES `trainers` WRITE;
/*!40000 ALTER TABLE `trainers` DISABLE KEYS */;
INSERT INTO `trainers` VALUES (104,'Permanent'),(113,'Guest'),(114,'Permanent'),(116,'Permanent');
/*!40000 ALTER TABLE `trainers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainingoffice`
--

DROP TABLE IF EXISTS `trainingoffice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trainingoffice` (
  `branchID` int(11) NOT NULL,
  `location` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`branchID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainingoffice`
--

LOCK TABLES `trainingoffice` WRITE;
/*!40000 ALTER TABLE `trainingoffice` DISABLE KEYS */;
INSERT INTO `trainingoffice` VALUES (101,'Pune'),(102,'Mumbai'),(103,'Bangalore');
/*!40000 ALTER TABLE `trainingoffice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'training_and_placement_db'
--

--
-- Dumping routines for database 'training_and_placement_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `deptCourseList` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `deptCourseList`(IN Loc varchar(32))
BEGIN
Declare bID int;
set bID:=(select branchID from trainingoffice where location Like Loc)  ;


select  bID;

CREATE table if not exists DeptArr  as
(SELECT departmentID
FROM branchdepartmentlist
WHERE branchID=bID);

select * from DeptArr;

create table if not exists CourseArr as
(select courseID from deptcourselist
   where 
   deptID in 
   (select departmentID from DeptArr )
);

select courseName as Course_Names   from course where courseID in
(select courseID from CourseArr);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `Find_unplacedStudents` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Find_unplacedStudents`(IN Loc varchar(32) )
BEGIN
Declare bID int;
Declare countOfUnplacedStudent int;

set bID:=(select branchID from trainingoffice where location Like Loc)  ;


CREATE table if not exists temporaryTable  as
(SELECT SSN
FROM Person
WHERE personType Like 'S' and branchID=bID);

 
set countOfUnplacedStudent=(select count(*) from
temporaryTable tt inner join student s
on 
tt.SSN=s.SSN
where status Like '%Unplaced%');

SELECT 'The total numberof Unplaced students are',countOfUnplacedStudent ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `studentsForInterview` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `studentsForInterview`(IN compnyName varchar(32), interDate date)
BEGIN
declare compnyID int ;
declare interviewschID int ;


set compnyID:=(select companyID from company where companyName Like compnyName );

set interviewschID:=(select ID  from interviewschedule where companyID=compnyID
and Date=interDate);

select interviewschID;
select SSN from registration where ID=interviewschID;

Create table if not exists stdForInter as
(SELECT SSN
FROM
registration
where ID=interviewschID);


select * from stdForInter;

select person_name,emailID,phoneNumber,Status
from
person inner join stdForInter
on
person.SSN=stdForInter.SSN;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-12 10:40:41
