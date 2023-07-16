-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: 1
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary view structure for view `avgg`
--

DROP TABLE IF EXISTS `avgg`;
/*!50001 DROP VIEW IF EXISTS `avgg`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `avgg` AS SELECT 
 1 AS `sid`,
 1 AS `avgsorce`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `CId` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程序号，主键',
  `PCId` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '先修课',
  `DId` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '开课系编号，外键',
  `CName` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程名称',
  `CCredit` int NOT NULL COMMENT '学分',
  `CHour` int NOT NULL COMMENT '学时',
  `CAttr` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程类型',
  `CNum` int NOT NULL COMMENT '选课人数',
  PRIMARY KEY (`CId`) USING BTREE,
  KEY `FK_Course_Course` (`PCId`) USING BTREE,
  KEY `FK_Course_Dept` (`DId`) USING BTREE,
  CONSTRAINT `FK_Course_Course` FOREIGN KEY (`PCId`) REFERENCES `course` (`CId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_Course_Dept` FOREIGN KEY (`DId`) REFERENCES `dept` (`DId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('1','5','CS','数据库',4,72,'必修',50),('10','9','EM','统计与审计',5,90,'必修',90),('11',NULL,'EL','刺绣',1,18,'选修',50),('12',NULL,'EL','家庭保健',1,18,'选修',30),('2',NULL,'SD','数学',3,54,'必修',90),('3','1','CS','信息系统与数据库',3,54,'必修',50),('4','6','CS','操作系统',4,72,'必修',50),('5','7','CS','数据结构',5,90,'必修',50),('6',NULL,'CS','计算机基础',3,54,'必修',70),('7','6','CS','C语言',2,36,'必修',70),('8',NULL,'CS','计算机组成原理',3,54,'选修',120),('9','2','EM','会计学原理',5,90,'必修',90);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dept`
--

DROP TABLE IF EXISTS `dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dept` (
  `DId` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门编号，主键',
  `DName` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `DAddr` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `DTele` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '电话',
  `DEmail` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`DId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='院系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dept`
--

LOCK TABLES `dept` WRITE;
/*!40000 ALTER TABLE `dept` DISABLE KEYS */;
INSERT INTO `dept` VALUES ('CS','计算机科学与技术系','SL604','87678976','cs@nit.com'),('EL','外校',NULL,'62765678',NULL),('EM','经济管理系','SC302','87464789','em@nit.com'),('FD','外语分院','SA401','65656798','fd@nit.com'),('IT','信息科学与技术系','SL704','88767864','it@nit.com'),('SD','理学院','NB309','67536387','sd@nit.com');
/*!40000 ALTER TABLE `dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise`
--

DROP TABLE IF EXISTS `exercise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise` (
  `EId` int NOT NULL,
  `EContext` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `ELevel` int DEFAULT NULL,
  `EAnswer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`EId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise`
--

LOCK TABLES `exercise` WRITE;
/*!40000 ALTER TABLE `exercise` DISABLE KEYS */;
INSERT INTO `exercise` VALUES (1,'显示院系信息表中的所有信息',1,''),(2,'显示院系信息表中的部门编码、部门名称信息',1,''),(3,'显示所有女教师的工号、姓名、性别信息',1,''),(4,'显示CS系的老师所有个人信息',1,''),(5,'显示CS系与IT系所有老师的全部个人信息',1,''),(6,'显示女教授的姓名、性别、职称与部门编号信息',1,''),(7,'显示研究领域为数据库的老师的姓名、研究领域、联系电话、所在部门',1,''),(8,'显示40岁以下老师的姓名、出生日期',1,''),(9,'显示5月份出生的姓名、性别、出生日期、联系电话',1,''),(10,'显示姓李的老师的所有信息',1,''),(11,'显示选修了1号课程的同学的学号',1,''),(12,'显示同时选修了1号与2号课程的同学的学号',2,''),(13,'显示012005002号同学选修的课程号',1,''),(14,'显示012005002号同学的全部选修信息',1,''),(15,'显示期末成绩不及格的同学的学号、课程号与期末成绩',1,''),(16,'显示选修了1号课程的人数',1,''),(17,'显示1号课程期末考试成绩的平均分',1,''),(18,'显示012005002同学的期末成绩的平均分',1,''),(19,'显示2008年每门课程期末成绩的平均分，显示课程号与平均分，并按降序排列',2,''),(20,'显示周4有课的教室',1,''),(21,'显示周4有课的老师的工号',1,''),(22,'显示NB222教室排课的情况',1,''),(23,'显示1号课程上课的教室、老师工号、上课时间',1,''),(24,'显示02004号老师上课的教室与时间',1,''),(25,'显示第4节有课的教室、课程号、教师工号',1,''),(26,'统计每个教师每周上课的次数及总时长(每节课45分钟)',2,''),(27,'统计每个班每周上课的课时数，显示班级编号和课时数，并按降序排列',2,''),(28,'显示无前导课的课程的全部信息',1,''),(29,'显示CS系所开课程的课程号与课程名',1,''),(30,'显示学分大于3的所有课程的课程名与课时',1,''),(31,'按开课院系统计每个院系开课的学分数，显示院系编号和总学分，并按降序排列',2,''),(32,'显示学生中所有男生的全部信息',1,''),(33,'显示01班所有学生的信息',1,''),(34,'显示03班所有女生的信息',1,''),(35,'显示刘山同学的电话号码',1,''),(36,'显示所有女生的学号、姓名与班级编号',1,''),(37,'统计每个班级的人数，显示班级编号，人数，并按降序排列',1,''),(38,'显示人数5人以上班级的班级编号和人数，并按升序排列',2,''),(39,'显示年龄在18岁以下的学生的全部信息',1,''),(40,'统计18岁以下学生的总人数',1,''),(41,'统计每个班20岁以下的人数，显示班级编号、人数',2,''),(42,'统计每个年龄段的人数，按照年龄升序排列',2,''),(43,'显示姓名中有\"白云\"的同学的所有信息',1,''),(44,'显示白姓同学的姓名、性别、班级名称、联系电话',2,''),(45,'显示CS系的班级名称及入学年份',1,''),(46,'显示没有班导的班级的所有信息',1,''),(47,'显示2008年入学班级的所有信息',1,''),(48,'显示所有学生的详细信息，包括学号、姓名、性别、年龄、班级名称，入学年份',2,''),(49,'显示信息科学与技术系同学的名单，包括学号、姓名、性别、年龄、班级名称、入学年份',2,''),(50,'显示选修了\"数据库\"课程的所有同学的学号、姓名',2,''),(51,'显示白云同学的班主任老师的姓名、联系电话',2,''),(52,'显示白云同学所在院系的名称、办公地点与联系电话',2,''),(53,'统计计算机科学与技术系每个同学已经修完的学分，显示学号、姓名、学分总数',2,''),(54,'显示张飞同学已修课程的课程号，课程名及期末成绩',2,''),(55,'显示计算机科学与技术系、信息科学与技术系的班级名称、入学年份、班导名称与联系电话',2,''),(56,'显示2008年入学的同学的学号、姓名、班级名称',2,''),(57,'显示已修数据库的同学的学号、姓名及期末成绩',2,''),(58,'显示期末平均成绩75分以上的课程名称与期末平均成绩',2,''),(59,'显示期末平均成绩80分以上同学的学号、姓名与期末平均成绩',2,''),(60,'显示一周课时数为5节及以上的教师的姓名与研究领域',2,''),(61,'按照班级统计期末平均成绩，显示班级名称与平均成绩',2,''),(62,'按照学期统计计算机科学与技术系学生的期末平均成绩，显示学期名称与平均成绩',2,''),(63,'统计每个院系一周的课时数，显示院系名称与课时数',2,''),(64,'显示没有选修任何课程的学生学号、姓名、班级名称',2,''),(65,'显示上过李飞老师的课的学生的学号、姓名与联系电话',2,''),(66,'显示一周6节课及以上的课程名称、学分',2,''),(67,'显示一周6节课及以上班级名称',2,''),(68,'查询周四上午第3节有课的同学的学号、姓名与班级名称',3,''),(69,'显示期末成绩没有不及格课程的班级的名称',3,''),(70,'显示已修数据库的同学信息，包括学号、姓名、班级名称',3,''),(71,'显示期中成绩不及格1门以上的同学学号、姓名、门数',3,''),(72,'统计每个班级期末成绩的最高分，显示班级名称、期末最高成绩',2,''),(73,'显示一周8节课及以上的学生的名单，显示学号、姓名、班级名称',3,''),(74,'显示计算机科学与技术1班一周上课的时间、地点，课程名称(周几，哪几节课，哪个教室)',3,''),(75,'统计教授每周上课的课时数，显示姓名、课时数',3,''),(76,'显示没有班导师的班级名称、院系名称',2,''),(77,'显示指导过两个班级以上的班导的姓名、所指导的班级名称',2,''),(78,'为洪玉飞老师(教师编号：03012)安排软件工程1班(班级编号：04)的数据库课程(课程编号：1)，上课教师为NB201',1,''),(79,'计算机科学与技术3班所有学生都选修了2009-2010-1的操作系统(课程编号为4)，请记录相关信息',1,''),(80,'理学院新开一门课程“数学建模”，课程编号20, 学分4，学时72，选修课程，最多选课人数为50',1,''),(81,'将李飞同学的联系方式改为660101',1,''),(82,'计算所有学生的总评成绩，公式为：总评=平时*20%+实验*20%+期末*60%',1,''),(83,'将电子信息1班(班级编号：08)的班主任改为洪玉飞老师(无重名)',1,''),(84,'将课程\"数据库\"的上课教室改为NB111，授课教师改为李飞(教师编号：02001)',1,''),(85,'将学号为012005001的学生班级改为计算机科学与技术3班',1,''),(86,'删除所有期末成绩小于60分的选课记录',1,''),(87,'删除学号为012005001的所有选课记录',1,''),(88,'删除所有选修了\"数据库\"课程的选课记录',1,''),(89,'删除李飞老师(教师编号：02001)2008学年的排课记录',1,''),(90,'删除所有在NB1楼上课的排课记录',1,''),(91,'删除NB111教室在周四的排课记录',1,''),(92,'删除选修人数小于5的选课记录',1,''),(93,'删除未担任班导师并且未安排课程的教师记录',2,''),(94,'创建一个新的用户，用户名为[alogin]，允许该用户在本机访问教务数据库',0,''),(95,'授予新建数据库用户[alogin]对表student和sc的查询权限',0,''),(96,'授予新建数据库用户[alogin]对表student表sname列的更新权限',0,''),(97,'创建一个角色，授予对表course的查询和更新权限，并将该角色授权给新建数据库用户[alogin]',0,''),(98,'为student表增加约束条件，性别字段可以的取值为‘男’，‘女’',0,''),(99,'为student表增加约束条件：性别默认为‘男’',0,''),(100,'为student表增加约束条件：联系方式至少长度为6',0,''),(101,'为student表增加约束条件：出生日期小于当前时间',0,''),(102,'为dept表增加约束条件：院系名称必须唯一',0,''),(103,'为grade表增加约束条件：入学年份不能大于当前年份',0,''),(104,'为dept表增加约束条件：联系电话必须为8位数字',0,''),(105,'为information表增加约束条件：学期格式为“xxxx-xxxx-x”，其中xxxx为4位数字表示学年，x为1或者2，表示上下学期。',0,''),(106,'为sc表增加约束条件：各项成绩都在0-100之间',0,''),(107,'删除一个已经存在的约束条件，如果没有先建立约束',0,''),(108,'写一个触发器，使得course中的记录更新时，课程性质只能为“选修”或者“必修”。否则提醒更新失败',2,''),(109,'写一个触发器，使得sc表的新增记录满足下述条件： 公式为：总评=平时*20%+实验*20%+期末*60%',2,'');
/*!40000 ALTER TABLE `exercise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `GId` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级编号，主键',
  `DId` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系编号，外键',
  `TId` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '教师工号，外键',
  `GName` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级名称',
  `GYear` int DEFAULT NULL COMMENT '入学年份',
  PRIMARY KEY (`GId`) USING BTREE,
  KEY `FK_Grade_Teacher` (`TId`) USING BTREE,
  KEY `FK_Gradet_Dep` (`DId`) USING BTREE,
  CONSTRAINT `FK_FK_Grade_Teacher` FOREIGN KEY (`TId`) REFERENCES `teacher` (`TId`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `FK_FK_Gradet_Dep` FOREIGN KEY (`DId`) REFERENCES `dept` (`DId`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES ('01','CS','02008','计算机科学与技术1班',2006),('02','CS','02008','计算机科学与技术2班',2006),('03','CS','02008','计算机科学与技术3班',2006),('04','CS','02009','软件工程1班',2007),('05','CS',NULL,'软件工程2班',2007),('06','IT','03014','自动化1班',2008),('07','IT','03014','自动化2班',2008),('08','IT','03012','电子信息1班',2008),('09','IT',NULL,'电子信息2班',2008),('10','IT',NULL,'电子信息3班',2008),('11','EM','03010','财务管理',2006),('12','EM','03011','旅游管理',2006),('13','EM',NULL,'营销管理',2006),('14','EM',NULL,'信息管理',2006),('15','FD','03012','日语',2005),('16','FD','03013','德语1班',2005),('17','FD','03013','德语2班',2005),('18','SD',NULL,'应用数学1班',2008),('20','SD',NULL,'选修混合',NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information`
--

DROP TABLE IF EXISTS `information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `information` (
  `IId` int NOT NULL COMMENT '序号，主键',
  `CId` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程序号，外键',
  `TId` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师编号，外键',
  `GId` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级编号，外键',
  `IRoom` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上课教室',
  `IWeek` int DEFAULT NULL COMMENT '周几上课',
  `ITimeseg` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '第几节上课',
  `ITerm` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '开课学年/学期',
  PRIMARY KEY (`IId`) USING BTREE,
  KEY `FK_Information_Course` (`CId`) USING BTREE,
  KEY `FK_Information_Grade` (`GId`) USING BTREE,
  KEY `FK_Information_Teacher` (`TId`) USING BTREE,
  CONSTRAINT `FK_Information_Course` FOREIGN KEY (`CId`) REFERENCES `course` (`CId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Information_Grade` FOREIGN KEY (`GId`) REFERENCES `grade` (`GId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Information_Teacher` FOREIGN KEY (`TId`) REFERENCES `teacher` (`TId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='课程信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information`
--

LOCK TABLES `information` WRITE;
/*!40000 ALTER TABLE `information` DISABLE KEYS */;
INSERT INTO `information` VALUES (1,'1','02001','01','NB111',4,'123','2008-2009-1'),(2,'1','02001','01','NB111',2,'345','2008-2009-1'),(3,'2','02003','03','NB222',1,'34','2008-2009-1'),(4,'3','02004','01','NB223',5,'678','2008-2009-1'),(5,'5','02005','05','NB224',3,'34','2008-2009-1'),(6,'6','02006','05','NB225',1,'67','2008-2009-1'),(7,'7','02007','03','NB226',4,'89','2008-2009-1'),(8,'9','02008','08','NB227',4,'678','2008-2009-1'),(9,'11','02009','09','NB228',2,'AB','2008-2009-1'),(10,'2','03010','02','NB229',1,'123','2008-2009-1'),(11,'4','02001','02','NB230',5,'345','2008-2009-1'),(12,'5','02002','03','NB231',3,'123','2008-2009-1'),(13,'6','02003','09','NB222',1,'89','2008-2009-1'),(14,'7','02004','13','NB223',4,'67','2008-2009-1'),(15,'9','02005','15','NB224',4,'345','2008-2009-1'),(16,'3','02006','13','NB225',2,'89','2008-2009-1'),(17,'4','02007','15','NB226',2,'12','2008-2009-1'),(18,'10','02008','03','NB227',5,'123','2008-2009-1'),(19,'10','02009','20','NB228',3,'AB','2008-2009-1'),(20,'12','03010','20','NB229',1,'AB','2008-2009-1'),(21,'4','02001','12','NB230',2,'34','2008-2009-1'),(22,'3','02002','09','NB231',4,'345','2008-2009-1'),(24,'1','02001','09','NB111',5,'12','2008-2009-1');
/*!40000 ALTER TABLE `information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `is2`
--

DROP TABLE IF EXISTS `is2`;
/*!50001 DROP VIEW IF EXISTS `is2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `is2` AS SELECT 
 1 AS `name`,
 1 AS `sid`,
 1 AS `gid`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `isstudent`
--

DROP TABLE IF EXISTS `isstudent`;
/*!50001 DROP VIEW IF EXISTS `isstudent`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `isstudent` AS SELECT 
 1 AS `SName`,
 1 AS `SId`,
 1 AS `GId`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `sc`
--

DROP TABLE IF EXISTS `sc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sc` (
  `SCId` int NOT NULL COMMENT '选课序号，主键',
  `CId` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程编号，外键',
  `SId` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号，外键',
  `SCTerm` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '开课学年/学期',
  `SCScore1` float DEFAULT NULL COMMENT '平时成绩',
  `SCScore2` float DEFAULT NULL COMMENT '期中成绩',
  `SCScore3` float DEFAULT NULL COMMENT '期末成绩',
  `SCScore` float DEFAULT NULL COMMENT '总评成绩',
  PRIMARY KEY (`SCId`) USING BTREE,
  KEY `FK_SC_Course` (`CId`) USING BTREE,
  KEY `FK_SC_Student` (`SId`) USING BTREE,
  CONSTRAINT `FK_SC_Course` FOREIGN KEY (`CId`) REFERENCES `course` (`CId`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_SC_Student` FOREIGN KEY (`SId`) REFERENCES `student` (`SId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='选课信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sc`
--

LOCK TABLES `sc` WRITE;
/*!40000 ALTER TABLE `sc` DISABLE KEYS */;
INSERT INTO `sc` VALUES (2,'1','012005002','2008-2009-1',99,60,70,76.3333),(3,'1','012005003','2008-2009-1',99,44,88,77),(4,'1','012005004','2008-2009-1',99,78,67,81.3333),(5,'1','032005005','2008-2009-1',99,65,87,83.6667),(6,'1','032005006','2008-2009-1',99,76,98,91),(7,'1','032005007','2008-2009-1',99,56,78,77.6667),(20,'5','082005009','2008-2009-2',99,78,83,86.6667),(21,'5','092005010','2008-2009-2',99,77,63,79.6667),(22,'5','112005011','2008-2009-2',99,90,74,87.6667),(23,'5','112005012','2008-2009-2',99,45,83,75.6667),(24,'5','112005013','2008-2009-2',99,89,73,87),(25,'10','012006001','2008-2009-2',99,67,73,79.6667),(26,'10','012006002','2008-2009-2',99,36,82,72.3333),(27,'10','012006003','2008-2009-2',99,87,83,89.6667),(28,'10','012006004','2008-2009-2',99,54,73,75.3333),(29,'10','032006005','2008-2009-2',99,45,73,72.3333),(30,'10','032006006','2008-2009-2',99,78,83,86.6667),(31,'10','032006007','2008-2009-2',99,72,84,85),(32,'10','082006008','2007-2008-2',99,60,78,79),(33,'12','082006009','2007-2008-2',99,60,73,77.3333),(34,'12','092006010','2007-2008-2',99,90,83,90.6667),(35,'12','112006011','2007-2008-2',99,89,62,83.3333),(36,'12','112006012','2007-2008-2',99,89,65,84.3333),(37,'12','112006013','2007-2008-2',99,78,65,80.6667),(38,'11','012007001','2007-2008-2',99,65,67,77),(39,'11','012007002','2007-2008-2',99,76,78,84.3333),(40,'11','012007003','2007-2008-2',99,56,79,78),(41,'11','012007004','2007-2008-2',99,50,76,75),(42,'11','032007005','2007-2008-2',99,78,71,82.6667),(43,'11','032007006','2007-2008-2',99,98,81,92.6667),(44,'11','032007007','2007-2008-2',99,79,82,86.6667),(45,'9','082007008','2007-2008-2',99,93,62,84.6667),(46,'9','082007009','2007-2008-2',99,72,63,78),(47,'9','092007010','2008-2009-1',99,89,69,85.6667),(48,'9','112007011','2008-2009-1',99,86,68,84.3333),(49,'9','112007012','2008-2009-1',99,80,76,85),(50,'9','112007013','2008-2009-1',99,88,83,90),(52,'9','012005002','2008-2009-1',99,54,76,76.3333),(53,'9','012005003','2008-2009-1',99,78,76,84.3333),(54,'9','012005004','2008-2009-1',99,77,56,77.3333),(55,'2','032005005','2008-2009-1',99,90,65,84.6667),(56,'2','032005006','2008-2009-1',99,45,65,69.6667),(57,'2','032005007','2008-2009-1',99,89,76,88),(58,'2','082005008','2008-2009-1',99,67,45,70.3333),(59,'2','082005009','2008-2009-1',99,36,84,73),(60,'2','092005010','2008-2009-1',99,87,90,92),(61,'2','112005011','2008-2009-1',99,54,93,82),(62,'2','112005012','2008-2009-1',99,45,67,70.3333),(63,'2','112005013','2008-2009-1',99,78,64,80.3333),(64,'2','012006001','2008-2009-1',99,72,63,78),(65,'6','012006002','2008-2009-1',99,60,48,69),(66,'6','012006003','2008-2009-1',99,60,76,78.3333),(67,'6','012006004','2008-2009-1',99,90,65,84.6667),(68,'6','032006005','2008-2009-1',99,89,76,88),(69,'6','032006006','2008-2009-1',99,89,46,78),(70,'6','032006007','2008-2009-1',99,78,85,87.3333),(71,'6','082006008','2008-2009-1',99,65,65,76.3333),(72,'6','082006009','2008-2009-1',99,76,54,76.3333),(73,'6','092006010','2007-2008-1',99,56,65,73.3333),(74,'6','112006011','2007-2008-1',99,50,65,71.3333),(75,'6','112006012','2007-2008-1',99,78,74,83.6667),(76,'6','112006013','2007-2008-1',99,98,74,90.3333),(77,'7','012007001','2007-2008-1',99,79,83,87),(78,'7','012007002','2007-2008-1',99,93,94,95.3333),(79,'7','012007003','2007-2008-1',99,72,73,81.3333),(80,'7','012007004','2007-2008-1',99,89,83,90.3333),(81,'7','032007005','2007-2008-1',99,86,63,82.6667),(82,'7','032007006','2007-2008-1',99,80,67,82),(83,'7','032007007','2007-2008-1',99,88,84,90.3333),(84,'7','082007008','2007-2008-1',99,67,96,87.3333),(85,'7','082007009','2007-2008-1',99,65,90,84.6667),(86,'7','092007010','2007-2008-1',99,78,92,89.6667),(87,'7','112007011','2007-2008-1',99,77,86,87.3333),(88,'7','112007012','2007-2008-1',99,90,80,89.6667),(89,'7','112007013','2007-2008-1',99,45,80,74.6667);
/*!40000 ALTER TABLE `sc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ssc`
--

DROP TABLE IF EXISTS `ssc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ssc` (
  `SId` int NOT NULL,
  `CId` int NOT NULL,
  `score` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ssc`
--

LOCK TABLES `ssc` WRITE;
/*!40000 ALTER TABLE `ssc` DISABLE KEYS */;
INSERT INTO `ssc` VALUES (12005002,1,70),(12005003,1,88),(12005004,1,67),(32005005,1,87),(32005006,1,98),(32005007,1,78),(82005009,5,83),(92005010,5,63),(112005011,5,74),(112005012,5,83),(112005013,5,73),(12006001,10,73),(12006002,10,82),(12006003,10,83),(12006004,10,73),(32006005,10,73),(32006006,10,83),(32006007,10,84),(82006008,10,78),(82006009,12,73),(92006010,12,83),(112006011,12,62),(112006012,12,65),(112006013,12,65),(12007001,11,67),(12007002,11,78),(12007003,11,79),(12007004,11,76),(32007005,11,71),(32007006,11,81),(32007007,11,82),(82007008,9,62),(82007009,9,63),(92007010,9,69),(112007011,9,68),(112007012,9,76),(112007013,9,83),(12005002,9,76),(12005003,9,76),(12005004,9,56),(32005005,2,65),(32005006,2,65),(32005007,2,76),(82005008,2,45),(82005009,2,84),(92005010,2,90),(112005011,2,93),(112005012,2,67),(112005013,2,64),(12006001,2,63),(12006002,6,48),(12006003,6,76),(12006004,6,65),(32006005,6,76),(32006006,6,46),(32006007,6,85),(82006008,6,65),(82006009,6,54),(92006010,6,65),(112006011,6,65),(112006012,6,74),(112006013,6,74),(12007001,7,83),(12007002,7,94),(12007003,7,73),(12007004,7,83),(32007005,7,63),(32007006,7,67),(32007007,7,84),(82007008,7,96),(82007009,7,90),(92007010,7,92),(112007011,7,86),(112007012,7,80),(112007013,7,80);
/*!40000 ALTER TABLE `ssc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `SId` char(9) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号，主键',
  `GId` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级ID，外键',
  `SName` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `SSexy` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '男' COMMENT '性别',
  `SBdate` date NOT NULL COMMENT '出生日期',
  `STele` char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`SId`) USING BTREE,
  KEY `FK_Student_Grade` (`GId`) USING BTREE,
  CONSTRAINT `FK_Student_Grade` FOREIGN KEY (`GId`) REFERENCES `grade` (`GId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='学生信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('012005001','03','李山','男','1998-10-11','660780'),('012005002','01','张飞','男','1997-10-11','660781'),('012005003','01','李玉和','女','1999-10-11','660782'),('012005004','01','王一飞','女','2000-10-11','660783'),('012006001','01','韦宝','男','1998-10-11','660780'),('012006002','01','李飞','男','1997-10-11','660101'),('012006003','01','冯玉','女','1999-10-11','660782'),('012006004','01','马观','女','2000-10-11','660783'),('012007001','01','李知','男','1998-10-11','660780'),('012007002','01','吴飞','男','1997-10-11','660781'),('012007003','01','李凡','女','1999-10-11','660782'),('012007004','01','王二飞','女','2000-10-11','660783'),('032005005','03','徐红','女','1998-01-11','660784'),('032005006','03','刘和','男','1998-12-11','660785'),('032005007','03','刘山','男','1999-10-01','660786'),('032006005','03','徐一红','女','1998-01-11','660784'),('032006006','03','刘一和','男','1998-12-11','660785'),('032006007','03','马西','男','1999-10-01','660786'),('032007005','03','王红','女','1998-01-11','660784'),('032007006','03','王一红','男','1998-12-11','660785'),('032007007','03','丁西','男','1999-10-01','660786'),('082005008','08','刘去山','女','2000-01-11','660787'),('082005009','08','白云飞','女','2002-10-11','660788'),('082006008','08','刘问计','女','2000-01-11','660787'),('082006009','08','白问礼','女','2002-10-11','660788'),('082007008','08','刘红丽','女','2000-01-11','660787'),('082007009','08','沈学云','女','2002-10-11','660788'),('092005010','08','白云','女','1998-11-11','660789'),('092006010','09','黑土','女','1998-12-11','660788'),('092007010','09','李风','女','1998-11-11','660789'),('112005011','11','李红','女','1997-12-11','660790'),('112005012','11','周磊','男','1996-06-11','660791'),('112005013','11','冯圭','女','1997-08-11','660792'),('112006011','11','李玉红','女','1997-12-11','660790'),('112006012','11','冯磊','男','2006-06-11','660791'),('112006013','11','冯由','女','2007-08-11','660792'),('112007011','11','刘好','女','1997-12-11','660790'),('112007012','11','周成','男','1996-06-11','660791'),('112007013','11','文成','女','1997-08-11','660792'),('112007014','11','霍去病','男','1999-05-09','660793');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teacher` (
  `TId` char(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '教师工号，主键',
  `DId` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '系编号，外键',
  `TName` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '姓名',
  `TSexy` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '性别',
  `TBdate` date NOT NULL COMMENT '出生日期',
  `TField` char(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '研究领域',
  `TProf` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '职称',
  `TTele` char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '联系电话',
  `TQq` char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'QQ号码',
  `TEmail` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '邮箱',
  `TMsn` char(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT 'MSN',
  PRIMARY KEY (`TId`) USING BTREE,
  KEY `FK_Teacher_Dept` (`DId`) USING BTREE,
  CONSTRAINT `FK_Teacher_Dept` FOREIGN KEY (`DId`) REFERENCES `dept` (`DId`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC COMMENT='教师信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('02001','CS','李飞','男','1986-05-05','数据库','讲师','660001',NULL,NULL,NULL),('02002','CS','郭山','男','1980-06-09','数据库','副教授','660002',NULL,NULL,NULL),('02003','CS','马骊','女','1983-03-08','网络技术与数据库','教授','660003',NULL,NULL,NULL),('02004','CS','徐守','女','1980-06-09','面向对象编程','助教','660004',NULL,NULL,NULL),('02005','CS','金贵','女','1980-06-09','财务管理','助教','660005',NULL,NULL,NULL),('02006','IT','成山云','男','1984-11-02','金融学','教授','660006',NULL,NULL,NULL),('02007','IT','张田下','男','1977-01-07','新能源技术','研究员','660007',NULL,NULL,NULL),('02008','IT','王一钱','女','1965-03-03','信息管理与数据库','讲师','660008',NULL,NULL,NULL),('02009','IT','李远','女','1977-01-07','电工学','实验师','660009',NULL,NULL,NULL),('03010','IT','吴天贵','女','1984-04-26','中医学','主治医师','660010',NULL,NULL,NULL),('03011','EM','刘了了','女','1972-06-12','近代史','研究员','660220',NULL,NULL,NULL),('03012','EM','洪玉飞','男','1967-09-29','哲学','教授','660222',NULL,NULL,NULL),('03013','EM','划计成','女','1962-09-01','应用数学','教授','660223',NULL,NULL,NULL),('03014','EM','李丽青','男','1968-05-09','应用物理','讲师','660233',NULL,NULL,NULL),('03015','FD','李员','男','1971-09-15','统计学','研究员','660234',NULL,NULL,NULL),('03016','FD','国威','女','1965-04-30','政治学','研究员','660123',NULL,NULL,NULL),('03017','FD','国华','女','1989-05-29','证券投资','研究员','660987',NULL,NULL,NULL),('05022','SD','后羿','女','1983-06-16','护理与营养','主任护理师','660909',NULL,NULL,NULL),('05023','SD','王飞红','男','1975-11-20','多媒体技术','讲师','660938',NULL,NULL,NULL),('05024','SD','李丽青','男','1969-03-30','理论力学','副教授','660323',NULL,NULL,NULL),('05025','SD','王红','女','1970-06-15','建筑学','副教授','660099',NULL,NULL,NULL),('05026','SD','李飞','女','1963-12-22','流体力学','讲师','660987',NULL,NULL,NULL);
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `avgg`
--

/*!50001 DROP VIEW IF EXISTS `avgg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `avgg` (`sid`,`avgsorce`) AS select `ssc`.`SId` AS `sid`,avg(`ssc`.`score`) AS `avg(ssc.score)` from `ssc` group by `ssc`.`SId` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `is2`
--

/*!50001 DROP VIEW IF EXISTS `is2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `is2` (`name`,`sid`,`gid`) AS select `student`.`SName` AS `SName`,`student`.`SId` AS `SId`,`student`.`GId` AS `GId` from (`student` join `sc`) where ((`student`.`GId` = 1) and (`student`.`SId` = `sc`.`SId`) and (`sc`.`CId` = 1)) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `isstudent`
--

/*!50001 DROP VIEW IF EXISTS `isstudent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `isstudent` AS select `student`.`SName` AS `SName`,`student`.`SId` AS `SId`,`student`.`GId` AS `GId` from `student` where (`student`.`GId` = 1) */;
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

-- Dump completed on 2023-04-12  0:20:36
