-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema lr_test
--

CREATE DATABASE IF NOT EXISTS lr_test;
USE lr_test;

--
-- Definition of table `registration`
--

DROP TABLE IF EXISTS `registration`;
CREATE TABLE `registration` (
  `userId` int(11) NOT NULL auto_increment,
  `companyId` bigint(20) default NULL,
  `adressId` bigint(20) default NULL,
  `userFirstName` varchar(75) default NULL,
  `userLastName` varchar(75) default NULL,
  `userCompanyName` varchar(75) default NULL,
  `userPositionCompany` varchar(75) default NULL,
  `userMobilePhone` varchar(75) default NULL,
  `userWorkPhone` varchar(75) default NULL,
  PRIMARY KEY  (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registration`
--

/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;


--
-- Definition of table `tbl_adress`
--

DROP TABLE IF EXISTS `tbl_adress`;
CREATE TABLE `tbl_adress` (
  `adressId` bigint(20) NOT NULL auto_increment,
  `companyId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `userName` varchar(75) default NULL,
  `mail` varchar(75) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  `street1` varchar(75) default NULL,
  `street2` varchar(75) default NULL,
  `city` varchar(75) default NULL,
  `zip` varchar(75) default NULL,
  `stateregionname` varchar(75) default NULL,
  `countryId` bigint(20) default NULL,
  `phoneId` bigint(20) default NULL,
  `faxId` bigint(20) default NULL,
  PRIMARY KEY  (`adressId`),
  KEY `IX_93D5AD4E` (`companyId`),
  KEY `IX_5BC8B0D4` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_adress`
--

/*!40000 ALTER TABLE `tbl_adress` DISABLE KEYS */;
INSERT INTO `tbl_adress` (`adressId`,`companyId`,`userId`,`userName`,`mail`,`createDate`,`modifiedDate`,`street1`,`street2`,`city`,`zip`,`stateregionname`,`countryId`,`phoneId`,`faxId`) VALUES 
 (1,1,0,NULL,'gigi@yahoo.com',NULL,NULL,'Street Av','Street Av 2','Brasov','70000','Valea Prahovei',165,3,7),
 (60,2,0,NULL,'',NULL,NULL,'','','','','Ottawa',38,69,11),
 (61,3,-1,NULL,'',NULL,NULL,'',NULL,'','','',165,-1,-1),
 (62,3,0,NULL,'',NULL,NULL,'','Street Av 2','','','',165,12,17),
 (63,4,0,NULL,'',NULL,NULL,'',NULL,'','','',1,0,0),
 (64,5,-1,NULL,'',NULL,NULL,'',NULL,'','','',38,-1,-1),
 (65,5,0,NULL,'wqeqw@as.com',NULL,NULL,'sdsadas dad','','','','',38,29,0),
 (66,6,0,NULL,'',NULL,NULL,'',NULL,'','','',1,0,0),
 (67,6,0,NULL,'jimb@jim.com',NULL,NULL,'','','','','Ont',38,48,0),
 (68,4,0,NULL,'',NULL,NULL,'','','','','',1,0,0),
 (69,7,0,NULL,'',NULL,NULL,'',NULL,'','','',1,0,0),
 (70,7,0,NULL,'',NULL,NULL,'','','','','',6,13,70),
 (71,8,0,NULL,'',NULL,NULL,'',NULL,'','','',1,0,0),
 (72,8,0,NULL,'',NULL,NULL,'wqee vqweqw','','','','',1,0,0),
 (73,9,0,NULL,'',NULL,NULL,'',NULL,'','','',1,0,0),
 (74,10,0,NULL,'',NULL,NULL,'',NULL,'','','',1,0,0),
 (75,11,-1,NULL,'',NULL,NULL,'',NULL,'','','',1,-1,-1),
 (76,12,-1,NULL,'',NULL,NULL,'',NULL,'','','',1,-1,-1),
 (77,13,-1,NULL,'',NULL,NULL,'',NULL,'','','',1,-1,-1),
 (78,10,0,NULL,'',NULL,NULL,'','','','','',1,0,0),
 (79,11,-1,NULL,'',NULL,NULL,'','','','','',1,-1,-1),
 (80,14,0,NULL,'',NULL,NULL,'',NULL,'','','',1,14,0),
 (81,14,0,NULL,'',NULL,NULL,'','','','','',1,15,16),
 (82,15,0,NULL,'',NULL,NULL,'',NULL,'','','',1,18,19),
 (83,15,0,NULL,'',NULL,NULL,'','','','','',7,21,0),
 (84,13,0,NULL,'',NULL,NULL,'','','','','',1,22,0),
 (85,16,0,NULL,'liv@fff.tt',NULL,NULL,'888888888888',NULL,'yyy','888888888888888','on',11,23,24),
 (86,16,0,NULL,'ABC@IBM.CA',NULL,NULL,'777','777','888','777','UN',1,25,26),
 (87,17,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'',NULL,'','','',1,27,28),
 (88,18,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'','','',1,30,31),
 (89,19,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'','','',1,32,33),
 (90,20,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'','','',1,34,35),
 (91,21,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'','K0A 1T0','',1,36,37),
 (92,22,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'','K0A 1T0','',1,38,39),
 (93,23,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Dunrobin','K0A 1T0','Ontario',38,40,41),
 (94,24,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Dunrobin','K0A 1T0','Ontario',38,42,43),
 (95,25,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Dunrobin','K0A 1T0','Ontario',38,44,45),
 (96,17,0,NULL,'',NULL,NULL,'','','','','',1,0,0),
 (97,26,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Dunrobin','K0A 1T0','Ontario',38,46,47),
 (98,27,0,NULL,'',NULL,NULL,'',NULL,'','','',1,0,0),
 (99,27,0,NULL,'3432@asdas.com',NULL,NULL,'Street 1 av','','','','',1,49,50),
 (100,19,0,NULL,'',NULL,NULL,'','','','','',12,0,0),
 (101,26,0,NULL,'',NULL,NULL,'','','','','',9,0,0),
 (102,28,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (103,29,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (104,30,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (105,31,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (106,32,-1,NULL,'jimtest@vennware.com',NULL,NULL,'',NULL,'almonte','','Ont.',38,-1,-1),
 (107,33,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (108,34,-1,NULL,'jimtest@vennware.com',NULL,NULL,'',NULL,'almonte','','Ont.',38,-1,-1),
 (109,35,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (110,36,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (111,34,0,NULL,'',NULL,NULL,'','','','','',38,0,0),
 (112,37,-1,NULL,'ericflawrence@gmail.com',NULL,NULL,'Suite 2',NULL,'Ottawa','K0A 1T0','Ontario',38,-1,-1),
 (113,36,0,NULL,'',NULL,NULL,'','','','','',18,0,0),
 (114,37,0,NULL,'ericflawrence@gmail.com',NULL,NULL,'1234','1234','1234','1234','1234',38,59,60),
 (115,38,0,NULL,'',NULL,NULL,'',NULL,'','','',2,61,0),
 (116,39,0,NULL,'',NULL,NULL,'',NULL,'','','',2,62,0),
 (117,40,-1,NULL,'',NULL,NULL,'',NULL,'','','',20,-1,-1),
 (118,41,-1,NULL,'',NULL,NULL,'',NULL,'','','',24,-1,-1),
 (119,42,0,NULL,'',NULL,NULL,'',NULL,'','','',27,0,0),
 (120,43,0,NULL,'',NULL,NULL,'','null','','','',28,0,0),
 (121,44,0,NULL,'',NULL,NULL,'asda','asda','','','',27,63,64),
 (122,45,0,NULL,'fpadurou@yahoo.com',NULL,NULL,'Street 1 av','Street Av 2','MAmaia','7000','Ottawa',27,65,66),
 (123,46,0,NULL,'',NULL,NULL,'','','','','',4,67,68),
 (124,12,0,NULL,'rererre@yahoo.com',NULL,NULL,'32324 dfsdfsdfsdfsd','','','','',5,71,72),
 (125,11,0,NULL,'',NULL,NULL,'','','','','',6,0,0),
 (126,37,0,NULL,'',NULL,NULL,'','','','','',6,73,74),
 (127,37,0,NULL,'',NULL,NULL,'','','','','',25,0,0),
 (128,38,0,NULL,'',NULL,NULL,'','','','','',1,0,0),
 (129,39,0,NULL,'',NULL,NULL,'','','','','',1,0,0),
 (130,40,0,NULL,'',NULL,NULL,'','','','','',10,0,0);
/*!40000 ALTER TABLE `tbl_adress` ENABLE KEYS */;


--
-- Definition of table `tbl_businesstype`
--

DROP TABLE IF EXISTS `tbl_businesstype`;
CREATE TABLE `tbl_businesstype` (
  `business_name` char(30) NOT NULL default '',
  `businesstypeId` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`businesstypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_businesstype`
--

/*!40000 ALTER TABLE `tbl_businesstype` DISABLE KEYS */;
INSERT INTO `tbl_businesstype` (`business_name`,`businesstypeId`) VALUES 
 ('Value-added reseller',1),
 ('Independent Software Vendor',2),
 ('Service',3),
 ('Consulting',4),
 ('Hosting/',5),
 ('Distributor',6);
/*!40000 ALTER TABLE `tbl_businesstype` ENABLE KEYS */;


--
-- Definition of table `tbl_companies_businesstype`
--

DROP TABLE IF EXISTS `tbl_companies_businesstype`;
CREATE TABLE `tbl_companies_businesstype` (
  `companyId` bigint(20) NOT NULL,
  `businesstypeId` bigint(20) NOT NULL default '0',
  `type_` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`companyId`,`businesstypeId`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_companies_businesstype`
--

/*!40000 ALTER TABLE `tbl_companies_businesstype` DISABLE KEYS */;
INSERT INTO `tbl_companies_businesstype` (`companyId`,`businesstypeId`,`type_`) VALUES 
 (1,3,1),
 (1,4,2),
 (2,1,2),
 (2,3,1),
 (3,1,2),
 (3,3,1),
 (4,1,1),
 (4,2,2),
 (5,1,1),
 (5,1,2),
 (6,1,1),
 (6,2,2),
 (7,1,2),
 (7,3,1),
 (8,1,1),
 (8,1,2),
 (9,1,1),
 (9,1,2),
 (10,1,1),
 (10,1,2),
 (11,1,1),
 (11,1,2),
 (12,1,1),
 (12,1,2),
 (13,1,1),
 (13,1,2),
 (14,1,1),
 (14,1,2),
 (15,1,2),
 (15,2,1),
 (16,2,1),
 (16,2,2),
 (17,1,1),
 (17,1,2),
 (18,1,1),
 (18,1,2),
 (19,1,2),
 (19,4,1),
 (20,1,1),
 (20,1,2),
 (21,1,1),
 (21,1,2),
 (22,1,1),
 (22,1,2),
 (23,2,1),
 (23,4,2),
 (24,2,1),
 (24,4,2),
 (25,2,1),
 (25,4,2),
 (26,2,1),
 (26,4,2),
 (27,1,1),
 (27,1,2),
 (34,2,1),
 (34,2,2),
 (36,2,1),
 (36,5,2),
 (37,2,2),
 (37,3,1),
 (38,3,1),
 (38,4,2),
 (39,3,1),
 (39,4,2),
 (40,3,1),
 (40,4,2),
 (42,2,1),
 (42,3,2),
 (43,1,1),
 (43,6,2),
 (44,2,2),
 (44,3,1),
 (45,2,1),
 (45,3,2),
 (46,2,2),
 (46,3,1);
/*!40000 ALTER TABLE `tbl_companies_businesstype` ENABLE KEYS */;


--
-- Definition of table `tbl_companies_coverage`
--

DROP TABLE IF EXISTS `tbl_companies_coverage`;
CREATE TABLE `tbl_companies_coverage` (
  `companyId` bigint(20) NOT NULL,
  `countryId` bigint(20) NOT NULL default '0',
  `regionId` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`companyId`,`countryId`,`regionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_companies_coverage`
--

/*!40000 ALTER TABLE `tbl_companies_coverage` DISABLE KEYS */;
INSERT INTO `tbl_companies_coverage` (`companyId`,`countryId`,`regionId`) VALUES 
 (1,1,0),
 (1,2,0),
 (1,3,0),
 (1,4,0),
 (2,210,0),
 (3,2,0),
 (3,3,0),
 (5,1,0),
 (6,38,0),
 (7,1,0),
 (7,2,0),
 (11,10,0),
 (11,11,0),
 (11,12,0),
 (12,3,0),
 (15,2,0),
 (15,3,0),
 (16,138,0),
 (19,2,0),
 (23,158,0),
 (24,158,0),
 (25,158,0),
 (26,158,0),
 (34,38,0),
 (36,1,0),
 (37,3,0),
 (38,2,0),
 (39,2,0),
 (40,2,0),
 (42,2,0),
 (43,3,0),
 (44,2,0),
 (45,2,0),
 (45,3,0),
 (45,4,0),
 (46,3,0);
/*!40000 ALTER TABLE `tbl_companies_coverage` ENABLE KEYS */;


--
-- Definition of table `tbl_companies_industries`
--

DROP TABLE IF EXISTS `tbl_companies_industries`;
CREATE TABLE `tbl_companies_industries` (
  `companyId` bigint(20) NOT NULL,
  `industryId` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`companyId`,`industryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_companies_industries`
--

/*!40000 ALTER TABLE `tbl_companies_industries` DISABLE KEYS */;
INSERT INTO `tbl_companies_industries` (`companyId`,`industryId`) VALUES 
 (1,2),
 (1,3),
 (1,4),
 (2,1),
 (2,2),
 (2,11),
 (2,12),
 (2,13),
 (2,27),
 (2,28),
 (2,29),
 (3,3),
 (3,4),
 (3,5),
 (3,6),
 (3,7),
 (3,8),
 (3,9),
 (3,10),
 (3,11),
 (3,12),
 (3,13),
 (3,14),
 (3,15),
 (3,16),
 (3,17),
 (3,18),
 (3,19),
 (4,2),
 (4,3),
 (4,4),
 (5,3),
 (6,3),
 (7,1),
 (11,1),
 (11,2),
 (12,1),
 (12,2),
 (12,3),
 (15,5),
 (15,6),
 (16,4),
 (19,3),
 (26,2),
 (34,3),
 (36,3),
 (37,2),
 (38,3),
 (39,3),
 (40,3),
 (42,1),
 (43,1),
 (43,2),
 (43,3),
 (44,3),
 (45,1),
 (45,3),
 (45,6),
 (45,7),
 (46,3);
/*!40000 ALTER TABLE `tbl_companies_industries` ENABLE KEYS */;


--
-- Definition of table `tbl_companies_sapsolution`
--

DROP TABLE IF EXISTS `tbl_companies_sapsolution`;
CREATE TABLE `tbl_companies_sapsolution` (
  `companyId` bigint(20) NOT NULL,
  `sapsolutionId` bigint(20) NOT NULL default '0',
  PRIMARY KEY  (`companyId`,`sapsolutionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_companies_sapsolution`
--

/*!40000 ALTER TABLE `tbl_companies_sapsolution` DISABLE KEYS */;
INSERT INTO `tbl_companies_sapsolution` (`companyId`,`sapsolutionId`) VALUES 
 (1,1),
 (1,2),
 (1,3),
 (2,2),
 (3,1),
 (4,3),
 (5,1),
 (6,2),
 (7,2),
 (7,3),
 (11,1),
 (12,2),
 (15,1),
 (15,3),
 (16,3),
 (19,2),
 (23,2),
 (24,2),
 (25,2),
 (26,2),
 (34,2),
 (36,3),
 (37,2),
 (38,1),
 (39,1),
 (40,1),
 (42,2),
 (43,2),
 (44,3),
 (45,2),
 (46,2),
 (46,3);
/*!40000 ALTER TABLE `tbl_companies_sapsolution` ENABLE KEYS */;


--
-- Definition of table `tbl_company`
--

DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE `tbl_company` (
  `companyId` bigint(20) NOT NULL auto_increment,
  `companyName` varchar(80) NOT NULL default '',
  `description` longtext,
  `partnerNumber` bigint(20) NOT NULL default '-1',
  `friendlySAP_site` varchar(80) NOT NULL default '',
  `web_site` varchar(80) NOT NULL default '',
  `adressId` bigint(20) NOT NULL default '-1',
  `noEmployees` int(10) NOT NULL,
  `parent_companyname` varchar(80) NOT NULL default '',
  `countryRegistrationId` bigint(20) default NULL,
  `partner_since` int(10) default NULL,
  `last_review_date` datetime default NULL,
  `reviewed_By` varchar(75) default NULL,
  `date_created` datetime default NULL,
  `date_updated` datetime default NULL,
  `modified_by` varchar(75) default NULL,
  `userId` bigint(20) default NULL,
  PRIMARY KEY  (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_company`
--

/*!40000 ALTER TABLE `tbl_company` DISABLE KEYS */;
INSERT INTO `tbl_company` (`companyId`,`companyName`,`description`,`partnerNumber`,`friendlySAP_site`,`web_site`,`adressId`,`noEmployees`,`parent_companyname`,`countryRegistrationId`,`partner_since`,`last_review_date`,`reviewed_By`,`date_created`,`date_updated`,`modified_by`,`userId`) VALUES 
 (1,'Cunningham Blythe','Cunningham Blythe is a consultancy organisationthat advises small and medium enterprises on business management and technology best practise. We specialise in enabling fast growing companies to make best use of SAP solutions in support of their growth strategy and business aspirations.',810449,'http://cpsn-channel.sap.com/','',1,8,'SAP',38,2006,'2008-08-06 00:00:00','A. Cunningham','2008-08-06 00:00:00','2008-09-12 00:00:00',NULL,0),
 (2,'The Createch Group','Dedicated in improving business performance, The Createch Group is a leader in supply chain optimization and information technology integration. The consulting firm offers services in manufacturing and logistics performance, process reengineering, asset management optimization, change management, ERP and information technology solution implementation. The Createch Group helps customers configure and implement their SAP business solution to match their unique requirements. With their extensive SAP knowledge, the Group?s consultants (who are all certified by the SAP Solution Academy) can also apply industry best practices to help customers maximize their performance across the enterprise.',318473,'http://cpsn-channel.sap.com/','',60,200,'',30,1998,'2008-08-05 00:00:00','Helene Gamache','2008-08-05 00:00:00','2008-09-11 00:00:00',NULL,0),
 (7,'11 Comp','',1,'http://','http://',70,-1,'',8,1990,'2008-09-07 00:00:00','','2008-09-07 00:00:00','2008-09-12 00:00:00',NULL,NULL),
 (8,'asdsadasd','',1,'http://','http://',72,-1,'',1,1990,'2008-09-07 00:00:00','','2008-09-07 00:00:00','2008-09-09 00:00:00',NULL,NULL),
 (11,'Adriatica','',1,'http://','http://',125,-1,'',27,-1,'2008-09-09 00:00:00','','2008-09-09 00:00:00','2008-09-11 00:00:00',NULL,NULL),
 (12,'RestoreMe','',1,'http://','http://',124,-1,'',5,-1,'2008-09-09 00:00:00','','2008-09-09 00:00:00','2008-09-11 00:00:00',NULL,NULL),
 (14,'LivCis','',1,'http://','http://',81,-1,'',1,1190,'2008-09-09 00:00:00','','2008-09-09 00:00:00','2008-09-09 00:00:00',NULL,NULL),
 (15,'Florin666','nana',133,'http://www.ibm.ca','http://www.oracle.ar',83,-1,'',7,2333,'2008-09-09 00:00:00','Mr Shoro','2008-09-09 00:00:00','2008-09-10 00:00:00',NULL,NULL),
 (16,'Emilia Popescu','emilia\'s descr',199,'http://aruba.cuba','http://aruba.mexic',86,88,'parent',1,8889,'2008-09-09 00:00:00','gogo','2008-09-09 00:00:00','2008-09-09 00:00:00',NULL,NULL),
 (19,'Vennware','Ecosystem Software Platform and Service',654321,'http://','http://',100,-1,'',8,-1,'2008-09-09 00:00:00','','2008-09-09 00:00:00','2008-09-10 00:00:00',NULL,NULL),
 (26,'Vennware 3','Ecosystem Software Platform and Service',654321,'http://pcn.com/vennware','http://www.vennware.com',101,23,'General Motors',8,2004,'2008-10-02 00:00:00','Eric Lawrence','2008-09-09 00:00:00','2008-09-10 00:00:00',NULL,NULL),
 (34,'JimTest Inc','Test partner discription',123456,'http://tobebuilt.com','http://',111,-1,'',38,2001,'2009-09-10 00:00:00','','2008-09-10 00:00:00','2008-09-11 00:00:00',NULL,NULL),
 (36,'Vennware','Software developer for EcoSystem Platform',1234,'http://pcn.com/vennware','http://www.vennware.com',113,23,'General Motors',6,2004,'2011-12-30 00:00:00','Eric Lawrence','2008-09-10 00:00:00','2008-09-11 00:00:00',NULL,NULL),
 (37,'ddddd','',1,'http://','http://',127,0,'',28,0,'2008-09-12 00:00:00','','2008-09-12 00:00:00','2008-09-12 00:00:00',NULL,0),
 (38,'Administartotr company','this was been added by test test',1111,'http://','http://',128,0,'',3,12,'2008-09-12 00:00:00','','2008-09-12 00:00:00','2008-09-12 00:00:00',NULL,0),
 (39,'Administartotr company','this was been added by test test',1111,'http://','http://',129,0,'',3,12,'2008-09-12 00:00:00','','2008-09-12 00:00:00','2008-09-12 00:00:00',NULL,0),
 (40,'eeeee','',1,'http://','http://',130,0,'',6,0,'2008-09-12 00:00:00','','2008-09-12 00:00:00','2008-09-12 00:00:00',NULL,2);
/*!40000 ALTER TABLE `tbl_company` ENABLE KEYS */;


--
-- Definition of table `tbl_countries`
--

DROP TABLE IF EXISTS `tbl_countries`;
CREATE TABLE `tbl_countries` (
  `country_name` char(36) NOT NULL default '',
  `regionId` decimal(1,0) NOT NULL,
  `countryId` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`countryId`)
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_countries`
--

/*!40000 ALTER TABLE `tbl_countries` DISABLE KEYS */;
INSERT INTO `tbl_countries` (`country_name`,`regionId`,`countryId`) VALUES 
 ('Afghanistan','3',1),
 ('Albania','4',2),
 ('Algeria','4',3),
 ('American Samoa','3',4),
 ('Andorra','4',5),
 ('Angola','4',6),
 ('Anguilla','5',7),
 ('Antigua and Barbuda','5',8),
 ('Argentina','2',9),
 ('Armenia','4',10),
 ('Aruba','5',11),
 ('Ashmore and Cartier Islands','3',12),
 ('Australia','3',13),
 ('Austria','4',14),
 ('Azerbaijan','4',15),
 ('Bahamas','5',16),
 ('Bahrain','4',17),
 ('Bangladesh','3',18),
 ('Barbados','5',19),
 ('Belarus','4',20),
 ('Belgium','4',21),
 ('Belize','5',22),
 ('Benin','4',23),
 ('Bermuda','5',24),
 ('Bhutan','3',25),
 ('Bolivia','2',26),
 ('Bosnia and Herzegovina','4',27),
 ('Botswana','4',28),
 ('Bouvet Island','4',29),
 ('Brazil','2',30),
 ('British Virgin Islands','5',31),
 ('Brunei','3',32),
 ('Bulgaria','4',33),
 ('Burkina Faso','4',34),
 ('Burundi','4',35),
 ('Cambodia','3',36),
 ('Cameroon','4',37),
 ('Canada','2',38),
 ('Cape Verde','4',39),
 ('Cayman Islands','5',40),
 ('Central African Republic','4',41),
 ('Chad','4',42),
 ('Chile','2',43),
 ('China','3',44),
 ('Christmas Island','3',45),
 ('Cocos (Keeling) Islands','3',46),
 ('Colombia','2',47),
 ('Comoros','4',48),
 ('Congo','4',49),
 ('Costa Rica','5',50),
 ('Cote d\'Ivoire','4',51),
 ('Croatia','4',52),
 ('Cuba','5',53),
 ('Cyprus','4',54),
 ('Czech Republic','4',55),
 ('Denmark','4',56),
 ('Djibouti','4',57),
 ('Dominica','5',58),
 ('Dominican Republic','5',59),
 ('Ecuador','2',60),
 ('Egypt','4',61),
 ('El Salvador','5',62),
 ('Equatorial Guinea','4',63),
 ('Eritrea','4',64),
 ('Estonia','4',65),
 ('Ethiopia','4',66),
 ('Falkland Islands (Malvinas)','5',67),
 ('Faroe Islands','4',68),
 ('Fiji','3',69),
 ('Finland','4',70),
 ('France','4',71),
 ('Gabon','4',72),
 ('Gambia','4',73),
 ('Georgia','4',74),
 ('Germany','4',75),
 ('Ghana','4',76),
 ('Gibraltar','4',77),
 ('Greece','4',78),
 ('Greenland','4',79),
 ('Grenada','5',80),
 ('Guadeloupe','5',81),
 ('Guam','5',82),
 ('Guatemala','2',83),
 ('Guinea','3',84),
 ('Guinea-Bissau','3',85),
 ('Guyana','5',86),
 ('Haiti','5',87),
 ('Honduras','5',88),
 ('Hong Kong','3',89),
 ('Hungary','4',90),
 ('Iceland','4',91),
 ('India','3',92),
 ('Indonesia','3',93),
 ('Iran','4',94),
 ('Iraq','4',95),
 ('Ireland','4',96),
 ('Israel','4',97),
 ('Italy','4',98),
 ('Jamaica','5',99),
 ('J3n','3',100),
 ('Jordan','4',101),
 ('Kazakhstan','4',102),
 ('Kenya','4',103),
 ('Korea, North','3',104),
 ('Korea, South','3',105),
 ('Kuwait','4',106),
 ('Laos','3',107),
 ('Latvia','4',108),
 ('Lebanon','4',109),
 ('Lesotho','4',110),
 ('Liberia','4',111),
 ('Libya','4',112),
 ('Liechtenstein','4',113),
 ('Lithuania','4',114),
 ('Luxembourg','4',115),
 ('Macau','3',116),
 ('Macedonia','4',117),
 ('Madagascar','4',118),
 ('Malawi','4',119),
 ('Malaysia','3',120),
 ('Maldives','3',121),
 ('Mali','4',122),
 ('Malta','4',123),
 ('Marshall Islands','3',124),
 ('Martinique','5',125),
 ('Mauritania','4',126),
 ('Mauritius','4',127),
 ('Mayotte','4',128),
 ('Mexico','2',129),
 ('Micronesia, Federated States of','3',130),
 ('Moldova','4',131),
 ('Monaco','4',132),
 ('Mongolia','3',133),
 ('Montserrat','5',134),
 ('Morocco','4',135),
 ('Mozambique','4',136),
 ('Myanmar','3',137),
 ('Namibia','4',138),
 ('Nauru','3',139),
 ('Nepal','3',140),
 ('Netherlands','4',141),
 ('Netherlands Antilles','4',142),
 ('New Caledonia','3',143),
 ('New Zealand','3',144),
 ('Nicaragua','5',145),
 ('Niger','4',146),
 ('Nigeria','4',147),
 ('Niue','3',148),
 ('Norfolk Island','3',149),
 ('Northern Mariana Islands','3',150),
 ('Norway','4',151),
 ('Oman','4',152),
 ('Pakistan','3',153),
 ('Palau','3',154),
 ('Panama','5',155),
 ('Papua New Guinea','3',156),
 ('Paraguay','2',157),
 ('Peru','2',158),
 ('Philippines','3',159),
 ('Poland','4',160),
 ('Portugal','4',161),
 ('Puerto Rico','2',162),
 ('Qatar','4',163),
 ('Reunion','4',164),
 ('Romania','4',165),
 ('Russia','4',166),
 ('Rwanda','4',167),
 ('Saint Helena','4',168),
 ('Saint Kitts and Nevis','5',169),
 ('Saint Lucia','5',170),
 ('Saint Pierre and Miquelon','5',171),
 ('Saint Vincent and the Grenadines','5',172),
 ('San Marino','4',173),
 ('Sao Tome and Principe','4',174),
 ('Saudi Arabia','4',175),
 ('Senegal','4',176),
 ('Seychelles','4',177),
 ('Sierra Leone','4',178),
 ('Singapore','3',179),
 ('Slovakia','4',180),
 ('Slovenia','4',181),
 ('Solomon Islands','3',182),
 ('Somalia','4',183),
 ('South Africa','4',184),
 ('Spain','4',185),
 ('Sri Lanka','3',186),
 ('Sudan','4',187),
 ('Suriname','5',188),
 ('Svalbard','4',189),
 ('Swaziland','4',190),
 ('Sweden','4',191),
 ('Switzerland','4',192),
 ('Syria','4',193),
 ('Taiwan','3',194),
 ('Tajikistan','4',195),
 ('Tanzania','4',196),
 ('Thailand','3',197),
 ('Togo','4',198),
 ('Tonga','3',199),
 ('Trinidad and Tobago','5',200),
 ('Tunisia','4',201),
 ('Turkey','4',202),
 ('Turkmenistan','4',203),
 ('Turks and Caicos Islands','5',204),
 ('Tuvalu','3',205),
 ('Uganda','4',206),
 ('Ukraine','4',207),
 ('United Arab Emirates','4',208),
 ('United Kingdom','4',209),
 ('United States','2',210),
 ('United States Minor Outlying Islands','5',211),
 ('Uruguay','2',212),
 ('Uzbekistan','4',213),
 ('Vanuatu','3',214),
 ('Vatican City State','4',215),
 ('Venezuela','2',216),
 ('Vietnam','3',217),
 ('Virgin Islands, U.S.','5',218),
 ('Wallis and Futuna','3',219),
 ('Western Sahara','4',220),
 ('Yemen','4',221),
 ('Yugoslavia','4',222),
 ('Zaire','4',223),
 ('Zambia','4',224),
 ('Zimbabwe','4',225);
/*!40000 ALTER TABLE `tbl_countries` ENABLE KEYS */;


--
-- Definition of table `tbl_industry_microvertical`
--

DROP TABLE IF EXISTS `tbl_industry_microvertical`;
CREATE TABLE `tbl_industry_microvertical` (
  `industry_name` char(39) NOT NULL default '',
  `microvertical_name` char(100) NOT NULL default '',
  `industryId` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`industryId`)
) ENGINE=InnoDB AUTO_INCREMENT=229 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_industry_microvertical`
--

/*!40000 ALTER TABLE `tbl_industry_microvertical` DISABLE KEYS */;
INSERT INTO `tbl_industry_microvertical` (`industry_name`,`microvertical_name`,`industryId`) VALUES 
 ('Aerospace & Defense','',1),
 ('Automotive','',2),
 ('Banking','',3),
 ('Building Materials, Clay & Glass','',4),
 ('Chemicals','',5),
 ('Consolidated Companies','',6),
 ('Consumer Products','',7),
 ('Cross Industry','',8),
 ('Financial Service Provider','',9),
 ('Forest Products & Paper','',10),
 ('Furniture','',11),
 ('Heathcare','',12),
 ('High Tech & Electronics','',13),
 ('Higher Education & Research','',14),
 ('Hospitality','',15),
 ('Insurance','',16),
 ('Lifescience','',17),
 ('Machinery, Engineering & Construction','',18),
 ('Media','',19),
 ('Metal Products','',20),
 ('Mining','',21),
 ('Nonclassifiable Establishments','',22),
 ('Oil & Gas','',23),
 ('Primary Metal & Steel','',24),
 ('Public Sector','',25),
 ('Retail','',26),
 ('Service Provider','',27),
 ('Telecommunications','',28),
 ('Textiles Production','',29),
 ('Transportation & Shipping','',30),
 ('Utilities','',31),
 ('Waste Management','',32),
 ('Aerospace & Defense','Airlines & MRO  (Maintenance, Repair & Overhaul)',33),
 ('Aerospace & Defense','Manufacturing & MRO  (Maintenance, Repair & Overhaul)',34),
 ('Automotive','Financial Service Provider - Asset Finance & Leasing',35),
 ('Automotive','Sales & Services -Automotive dealers',36),
 ('Automotive','Sales & Services -Wholesale trade-durable goods',37),
 ('Automotive','Sales & Services -Automotive repair, services, & parking',38),
 ('Automotive','Sales & Services - Automotive dealers',39),
 ('Automotive','Sales & Services - Automotive repair, services, & parking',40),
 ('Automotive','Sales & Services - Wholesale trade-durable goods',41),
 ('Automotive','Supplier - Fabricated metal products',42),
 ('Automotive','Supplier - Industrial machinery & equipment',43),
 ('Automotive','Supplier - Rubber & miscellaneous plastics products',44),
 ('Automotive','Supplier - Transportation equipment',45),
 ('Banking','Corporate',46),
 ('Banking','Financial service provider',47),
 ('Banking','Retail',48),
 ('Building Materials, Clay & Glass','Nonmetallic minerals, except fuels',49),
 ('Building Materials, Clay & Glass','Petroleum & coal products',50),
 ('Building Materials, Clay & Glass','Stone, clay, glass, & concrete products',51),
 ('Chemicals','Rubber & plastic products',52),
 ('Chemicals','Standard',53),
 ('Consolidated Companies','',54),
 ('Consumer Products','AFS - Fashion (Apparel, Footwear/Jewelery, Watches, Clocks)',55),
 ('Consumer Products','AFS - Footwear (Apparel, Footwear/Jewelery, Watches, Clocks)',56),
 ('Consumer Products','AFS - Hometextiles (Apparel, Footwear/Jewelery, Watches, Clocks)',57),
 ('Consumer Products','AFS - JWC (Apparel, Footwear/Jewelery, Watches, Clocks)',58),
 ('Consumer Products','AFS - Others (Apparel, Footwear/Jewelery, Watches, Clocks)',59),
 ('Consumer Products','Beverage - Breweries',60),
 ('Consumer Products','Beverage - Non-alcoholic',61),
 ('Consumer Products','Beverage - Wineries & distelleries',62),
 ('Consumer Products','Consumer durables',63),
 ('Consumer Products','Consumer electronics',64),
 ('Consumer Products','Food - Bakery & cereals',65),
 ('Consumer Products','Food - Canned, preserved & dried food',66),
 ('Consumer Products','Food - Confectionary & snacks',67),
 ('Consumer Products','Food - Cooking ingredients',68),
 ('Consumer Products','Food - Dairy food',69),
 ('Consumer Products','Food - Frozen food',70),
 ('Consumer Products','Food - Meat & fish products',71),
 ('Consumer Products','Home appliances',72),
 ('Consumer Products','Personal care',73),
 ('Consumer Products','Pet food',74),
 ('Consumer Products','Tobacco',75),
 ('Cross Industry','HCM - Payroll',76),
 ('Cross Industry','HCM - Other',77),
 ('Cross Industry','BI/BW - SEM',78),
 ('Cross Industry','BI/BW - Other',79),
 ('Cross Industry','CRM - SFA',80),
 ('Cross Industry','CRM - Other',81),
 ('Cross Industry','Financials',82),
 ('Cross Industry','Portal',83),
 ('Financial Service Provider','Brokerage',84),
 ('Financial Service Provider','Corporate',85),
 ('Financial Service Provider','Financial service provider',86),
 ('Financial Service Provider','Investment',87),
 ('Financial Service Provider','Retail',88),
 ('Forest Products & Paper','Forest products & paper - Lumber & wood products',89),
 ('Forest Products & Paper','Forestry',90),
 ('Forest Products & Paper','Paper & allied products',91),
 ('Furniture','Furniture & fixtures',92),
 ('Furniture','Lumber & wood products',93),
 ('Heathcare','Healthcare services',94),
 ('Heathcare','Social services',95),
 ('High Tech & Electronics','Computers, peripherals & storage',96),
 ('High Tech & Electronics','Electronic components (non-semiconductor)',97),
 ('High Tech & Electronics','EMS',98),
 ('High Tech & Electronics','Instruments & test equipment',99),
 ('High Tech & Electronics','Imaging equipment',100),
 ('High Tech & Electronics','Medical laboratory equipment',101),
 ('High Tech & Electronics','Telecom network & broadcast equipment',102),
 ('High Tech & Electronics','Semiconductors & components',103),
 ('High Tech & Electronics','Software',104),
 ('Higher Education & Research','Educational services',105),
 ('Higher Education & Research','Engineering & management services',106),
 ('Hospitality','Amusement',107),
 ('Hospitality','Hotels',108),
 ('Hospitality','Restaurants',109),
 ('Hospitality','Travel Services',110),
 ('Insurance','Health',111),
 ('Insurance','Life',112),
 ('Insurance','Property & casualty',113),
 ('Insurance','Other',114),
 ('Lifescience','Biotechnology',115),
 ('Lifescience','Diagnostics',116),
 ('Lifescience','Medicinals & botanicals',117),
 ('Lifescience','Medical products',118),
 ('Lifescience','Pharmaceuticals',119),
 ('Machinery, Engineering & Construction','ECO - Home building (Engineering, Construction &  Operations)',120),
 ('Machinery, Engineering & Construction','ECO - Plant contracting & construction (Engineering, Construction &  Operations)',121),
 ('Machinery, Engineering & Construction','ECO - Shipbuilding (incl. transportation equipment, NEC)',122),
 ('Machinery, Engineering & Construction','IMC - Components - Air conditioning, heating equipment & industrial ovens',123),
 ('Machinery, Engineering & Construction','IMC - Components - Ball & roller bearings',124),
 ('Machinery, Engineering & Construction','IMC - Components - Electrical equipment, appliance & components',125),
 ('Machinery, Engineering & Construction','IMC - Components - Engine, turbine, compressor & pump machinery',126),
 ('Machinery, Engineering & Construction','IMC - Components - Nedical, eeasuring & controlling devices',127),
 ('Machinery, Engineering & Construction','IMC - Components - Not assigned',128),
 ('Machinery, Engineering & Construction','IMC - Components - Tools & metal working machinery',129),
 ('Machinery, Engineering & Construction','IMC - Machinery - Air conditioning, heating equipment & industrial ovens',130),
 ('Machinery, Engineering & Construction','IMC - Machinery - Commercial & service industry machinery',131),
 ('Machinery, Engineering & Construction','IMC - Machinery - Construction, mining, oil & gas machinery',132),
 ('Machinery, Engineering & Construction','IMC - Machinery - Electrical equipment, appliance & components',133),
 ('Machinery, Engineering & Construction','IMC - Machinery - Elevators, conveyors, cranes & material h&ling equipment',134),
 ('Machinery, Engineering & Construction','IMC - Machinery - Engine, turbine, compressor & pump machinery',135),
 ('Machinery, Engineering & Construction','IMC - Machinery - Food machinery',136),
 ('Machinery, Engineering & Construction','IMC - Machinery - Medical, measuring & controlling devices',137),
 ('Machinery, Engineering & Construction','IMC - Machinery - Packaging machinery',138),
 ('Machinery, Engineering & Construction','IMC - Machinery - Special industry machinery',139),
 ('Machinery, Engineering & Construction','IMC - Machinery - Textile machinery',140),
 ('Machinery, Engineering & Construction','IMC - Machinery - Tools & metal working machinery',141),
 ('Machinery, Engineering & Construction','IMC - Machinery - Woodworking, paper & printing machinery',142),
 ('Media','Broadcasting',143),
 ('Media','Entertainment',144),
 ('Media','Newspaper & magazines',145),
 ('Media','Premium content publishing',146),
 ('Media','Others (e.g. media agencies, commercial printing etc.)',147),
 ('Metal Products','Fabricated metal products',148),
 ('Metal Products','Metal extraction',149),
 ('Metal Products','Metalforming & Treatment',150),
 ('Metal Products','Sheet metal forming',151),
 ('Mining','Agricultural Production - Livestock',152),
 ('Mining','Agricultural Production - Crops',153),
 ('Mining','Coal mining',154),
 ('Mining','Fishing, hunting, & trapping',155),
 ('Mining','Metal mining',156),
 ('Mining','Nonmetallic minerals, except fuels',157),
 ('Nonclassifiable Establishments','',158),
 ('Oil & Gas','Oil & Gas Downstream',159),
 ('Oil & Gas','Oil & Gas Upstream',160),
 ('Oil & Gas','Refining & manufacturing',161),
 ('Oil & Gas','Supply & trading',162),
 ('Primary Metal & Steel','Metalcasting',163),
 ('Primary Metal & Steel','Metalextraction',164),
 ('Primary Metal & Steel','Metalforming & treatment',165),
 ('Public Sector','Administration of economic programs',166),
 ('Public Sector','Administration of human resources',167),
 ('Public Sector','Environmental quality & housing',168),
 ('Public Sector','Executive, legislative & general government',169),
 ('Public Sector','Finance, taxation & monetary policy',170),
 ('Public Sector','Justice, public order & safety',171),
 ('Public Sector','Membership organizations',172),
 ('Public Sector','Museums, art galleries, botanical & zoological gardens',173),
 ('Public Sector','National security & international affairs',174),
 ('Public Sector','Social services',175),
 ('Retail','Retail - Apparel stores',176),
 ('Retail','Retail - Automotive dealers',177),
 ('Retail','Retail - Building materials',178),
 ('Retail','Retail - Food stores',179),
 ('Retail','Retail - Furniture, home furnishings & equipment stores',180),
 ('Retail','Retail - General merch&ise',181),
 ('Retail','Retail - Miscellaneous',182),
 ('Retail','Wholesale - Apparel, piece goods & notions',183),
 ('Retail','Wholesale - Chemicals & allied products',184),
 ('Retail','Wholesale - Electrical goods',185),
 ('Retail','Wholesale - Beer, wine & distilled alcoholic beverages',186),
 ('Retail','Wholesale - Farm-product raw materials',187),
 ('Retail','Wholesale - Furniture & home furnishings',188),
 ('Retail','Wholesale - Groceries & related products',189),
 ('Retail','Wholesale - Hardware, plumbing & heating equipment',190),
 ('Retail','Wholesale - Lumber & other construction materials',191),
 ('Retail','Wholesale - Machinery, equipment & supplies',192),
 ('Retail','Wholesale - Metals & minerals, except petroleum',193),
 ('Retail','Wholesale - Miscellaneous durable goods',194),
 ('Retail','Wholesale - Miscellaneous non-durable goods',195),
 ('Retail','Wholesale - Motor verhicles & motor vehicle parts',196),
 ('Retail','Wholesale - Paper & paper products',197),
 ('Retail','Wholesale - Professional & commercial equipment',198),
 ('Retail','Wholesale - Drugs, drug proprietaries & druggists\' sundries',199),
 ('Service Provider','Other Service Industries - Employment agencies',200),
 ('Service Provider','Other Service Industries - Facility management',201),
 ('Service Provider','Other Service Industries - Real estate',202),
 ('Service Provider','Other Services - Agricultural services',203),
 ('Service Provider','Other Services - Business services',204),
 ('Service Provider','Other Services - Coal mining services',205),
 ('Service Provider','Other Services - Forestry services',206),
 ('Service Provider','Other Services - Metal mining services',207),
 ('Service Provider','Other Services - Miscellaneous',208),
 ('Service Provider','Other Services - Personal services',209),
 ('Service Provider','Postal services',210),
 ('Service Provider','Professional services - Audit & tax',211),
 ('Service Provider','Professional Services - Consulting',212),
 ('Service Provider','Professional Services - IT services',213),
 ('Service Provider','Professional Services - Legal services',214),
 ('Service Provider','Transportation services',215),
 ('Telecommunications','Telecommunications',216),
 ('Textiles Production','Textile mill products',217),
 ('Transportation & Shipping','Logistic Service Providers - Railroad transport',218),
 ('Transportation & Shipping','Logistic Service Providers - Transportation by air',219),
 ('Transportation & Shipping','Logistic Service Providers - Trucking & warehouse',220),
 ('Transportation & Shipping','Logistic Service Providers - Water transportation',221),
 ('Transportation & Shipping','Other Service Industries - Real Estate',222),
 ('Transportation & Shipping','Other Services - Transportation services',223),
 ('Transportation & Shipping','Post - Courier Express Parcel (CEP)',224),
 ('Transportation & Shipping','Public Transportation - Local passenger transport',225),
 ('Transportation & Shipping','Public Transportation - Water transportation',226),
 ('Utilities','Electric, gas, & sanitary services',227),
 ('Waste Management','Waste management & sanitary services',228);
/*!40000 ALTER TABLE `tbl_industry_microvertical` ENABLE KEYS */;


--
-- Definition of table `tbl_lang_available`
--

DROP TABLE IF EXISTS `tbl_lang_available`;
CREATE TABLE `tbl_lang_available` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_lang_available`
--

/*!40000 ALTER TABLE `tbl_lang_available` DISABLE KEYS */;
INSERT INTO `tbl_lang_available` (`id`,`name`) VALUES 
 (1,'Arabic '),
 (2,'Chinese (Traditional)'),
 (3,'Chinese (Mandarin)'),
 (4,'Chinese (Simplified)'),
 (5,'Croatian'),
 (6,'Danish'),
 (7,'Dutch'),
 (8,'English'),
 (9,'Finnish'),
 (10,'French'),
 (11,'German'),
 (12,'Greek'),
 (13,'Hebrew'),
 (14,'Hindi'),
 (15,'Icelandic'),
 (16,'Italian'),
 (17,'Japanese          '),
 (18,'Korean'),
 (19,'Norwegian'),
 (20,'Polish'),
 (21,'Portuguese (Brazilian)'),
 (22,'Portuguese (European)'),
 (23,'Russian'),
 (24,'Serbian'),
 (25,'Slovak'),
 (26,'Spanish (European)'),
 (27,'Spanish (Latin American)'),
 (28,'Swedish'),
 (29,'Thai'),
 (30,'Turkish'),
 (31,'Vietnamese'),
 (32,'Other');
/*!40000 ALTER TABLE `tbl_lang_available` ENABLE KEYS */;


--
-- Definition of table `tbl_logo`
--

DROP TABLE IF EXISTS `tbl_logo`;
CREATE TABLE `tbl_logo` (
  `id` int(4) NOT NULL auto_increment,
  `description` char(50) default NULL,
  `bin_data` longblob,
  `filename` char(50) default NULL,
  `filesize` char(50) default NULL,
  `filetype` char(50) default NULL,
  `companyId` bigint(2) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_logo`
--

/*!40000 ALTER TABLE `tbl_logo` DISABLE KEYS */;
INSERT INTO `tbl_logo` (`id`,`description`,`bin_data`,`filename`,`filesize`,`filetype`,`companyId`) VALUES 
 (1,NULL,0xFFD8FFE000104A46494600010201004800480000FFE109624578696600004D4D002A000000080007011200030000000100010000011A00050000000100000062011B0005000000010000006A01280003000000010002000001310002000000140000007201320002000000140000008687690004000000010000009C000000C80000004800000001000000480000000141646F62652050686F746F73686F7020372E3000323030373A31313A30312031313A33323A34340000000003A001000300000001FFFF0000A002000400000001000000BEA003000400000001000000340000000000000006010300030000000100060000011A00050000000100000116011B0005000000010000011E0128000300000001000200000201000400000001000001260202000400000001000008340000000000000048000000010000004800000001FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080023008003012200021101031101FFDD00040008FFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554961F59FAD98BD2BA8D7D31B8599D4336CA4E49A70AA1616D41DE97AB66F7D3F4ACF67B37FF002FFC1AA9FF003DECFF00E777ADFF00EC2B3FF7A1253D3A4B047D6FC618D897E46067619CDCEAFA7574E4D4DAEC165A37B2E735D66DFB2FFC256FB3FE2D0F27EB8BA8C9B686F41EB178A9EE67AD562835BF692DF52A73EEADCEADF1FA376C494F44B2FEB264F53C5E96FBFA6806D6381B0EDDC5B58FE71EC61FA5FF00A4F7AC7A3FC60D7938ECCAC6E83D66EA2C6EFAECAF198F6B9BFBCC2CC83B96E6275AC6CBEAB97D2EBAEC6DD855D36D8F7B435A45E1CFAC33DDEAEEF67E93D4AAB4E84B8640902547E53B15B92265094448C4915C51F9A2D5FABBF58E9EB14ECB22BCDAC4D950E1C3FD353FF07FF9EBFCC7BF6972FD43EA8BFF006AD19DD2ADFB234BF75DB79ACC13EA50DFA3FA4FE6DF4FD0F7FF00A2531FE303EAE0E8F7F547DB63062DA71ADC47B4372BD605CC651F652E1FA4BB66F67FE0BE97A577A4FCE31589633A485F075C7E0C5CB1CD463987AA06B8C7CB947EF37FEB07D60C7E8F8FDACCBB01F4699FFC12CFDDA9BFF4D47EAC66755CDE9E727A9000D8F9C721BB0BAB81EFD9FB9BBF9BFE42CDC4FAA8EC9EACFEA3D4AE765E33B6D94B6D6963DF237359934B9ACF49947D1FB3ECF7FF0084F4FDF52B19FF005CB1F13A9E4F4CA3A6751EA3761FA7F687E1D2DB18C36B05D5B0B9D6D7EEF4DDFBA9D90E28E310854E46A52C9FF7105B88679E5964C978E11B8C3177FF00593FFB97A249731FF3DECFFE777ADFFEC2B3FF007A16963FD62C5BF27A7E21C7C9A323A95366432ABEBF4DD5369D8DB1994C7BB732CDD66D67A7EAFF0099B140D975524960677D73E998556539F4E4D96E2E633A78C7A981D65B7DAD6DB4FD9C6FD8E658C7FF00847D7FF9EFD44A77D25CC7FCF7B3FF009DDEB7FF00B0ACFF00DE857FA37D633D5721F8EEE97D47A7963378B3368F4EB7410DD8CB5965ADF53DDF41253FFFD0EA3ACE275CC3FAE34F5FC0E9C7A9E39E9E708D75DB5D4F6D9EAFDA37BFED059FA3D9FB9FF9DD8FF9C7F5ABFF009D6BFF00F62F1BFF0026BA549253C9756ABAF75BC7E8D75BD2DF856E1F59C7BEDA1D75563863D6D7FA994E7D6ED9F4ECDBE97F3ABAAB81754F6B4492D200F3853492538DF53B072FA7FD58E9D859959A7268A432DAC904832EEEC2E6A174DE9F9B4FD6EEB39F6D45B8B954E2328B65A438D4DB7D500077A8DD9BFF0039AB7966F5FEB0DE8FD3DD9459EA3DCE15D4D3A0DEE04B779FDCF6A31899484622C93416CE71844CA46A31165366756C0C2C8A31F26E6D76E498ADA7E1F49E7F319BBF47FF0018B84C8FA9BF5A32336DFAE0E6E357F586ABC598BD30358FA1D4D60D2DAEDC876CDD956D7FA4AF277FB3D9FCC7B3EC7A5D07A064758C83D63AC9365561DD5D6F1FCEFEEB9CDFCDC56FF82AFF00C2FF00C4FF003DDA00000008034002933E384088C65C5203D7FBBC5FD562E5B2E4C80CE51E0813FAB1FA7C1FBD26961F56C4CAC8B30C58CFB663B5A6FA98EDCD048F78AAC2DAFD66D4FF0063DFE9FF00C67A6B94FAC3D1F26CEB995958DD133AEF5C57BF2F0FA8B719971631AC6BACC73656E63E9FE63FB1EA7F8447FAC3F572EE9F77ED8E8B357A47D4B2AAC6B59FCEB6967FA277F86A7FF452DDFABBD68759C0F5DCCF4EEADDE9DC1BF44B800EDF5FF21ED77F63FF00044EC9863C032633C50DA57F3427E2B70F3123925872C78320B942BE4C98FF00AAF17FB1FAA77E83D63FF72EDFFD2EB7FA77D52B33FA274AFF009C565E3AC6154F63F229C87B6D0DB0FBA9B722877E9BD8DAB7FD3F7B3F9CFDFEA9250365E2A8FA924F5DCBAEDBBA88E96DA2A38D6FDB6DD6E97FDA38B7D5FA3E9FD356BAAFD53C0C4E8966360F4FBFA9D8FCA665BFF5A35E4FAAD1B5B955E6E43BF9DA5ADD8C66F67FDB9F4FAB49253E6DFB1FAAFF00E51758FF00DCC37FF4BAD5FAA5D33AEE375EB6FBB172F03A59C435BA9CCCC1965F91EA35CCB6BDB65BB36D1BD8BB449253FFD1F55497CAA924A7EAA497CAA924A7EAA557A97F43B3F98FCDFE93FCD7D26FF39FF7CFE5AF97D2446E37FA6E897CA76DBF4BE5FABF54B7E88E38EDC275F2AA4825FAA952E95FD1DFFD1BF9C77F44FE6F9FCFFF0086FF0048BE624911B1DFA792D3F30DBAFF007BFC17EAA497CAA920B9FAA925F2AA4929FAA925F2AA4929FFD9FFED0E1C50686F746F73686F7020332E30003842494D0425000000000010000000000000000000000000000000003842494D03ED000000000010004800000001000100480000000100013842494D042600000000000E000000000000000000003F8000003842494D040D000000000004000000783842494D04190000000000040000001E3842494D03F3000000000009000000000000000001003842494D040A00000000000100003842494D271000000000000A000100000000000000013842494D03F5000000000048002F66660001006C66660006000000000001002F6666000100A1999A0006000000000001003200000001005A00000006000000000001003500000001002D000000060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000000000000200013842494D0402000000000004000000003842494D0408000000000010000000010000024000000240000000003842494D041E000000000004000000003842494D041A00000000034900000006000000000000000000000034000000BE0000000A0055006E007400690074006C00650064002D00330000000100000000000000000000000000000000000000010000000000000000000000BE0000003400000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006E756C6C0000000200000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000003400000000526768746C6F6E67000000BE00000006736C69636573566C4C73000000014F626A6300000001000000000005736C6963650000001200000007736C69636549446C6F6E67000000000000000767726F757049446C6F6E6700000000000000066F726967696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47656E6572617465640000000054797065656E756D0000000A45536C6963655479706500000000496D672000000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000003400000000526768746C6F6E67000000BE0000000375726C54455854000000010000000000006E756C6C54455854000000010000000000004D7367655445585400000001000000000006616C74546167544558540000000100000000000E63656C6C54657874497348544D4C626F6F6C010000000863656C6C546578745445585400000001000000000009686F727A416C69676E656E756D0000000F45536C696365486F727A416C69676E0000000764656661756C740000000976657274416C69676E656E756D0000000F45536C69636556657274416C69676E0000000764656661756C740000000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75747365746C6F6E6700000000003842494D041100000000000101003842494D0414000000000004000000023842494D040C00000000085000000001000000800000002300000180000034800000083400180001FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080023008003012200021101031101FFDD00040008FFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554961F59FAD98BD2BA8D7D31B8599D4336CA4E49A70AA1616D41DE97AB66F7D3F4ACF67B37FF002FFC1AA9FF003DECFF00E777ADFF00EC2B3FF7A1253D3A4B047D6FC618D897E46067619CDCEAFA7574E4D4DAEC165A37B2E735D66DFB2FFC256FB3FE2D0F27EB8BA8C9B686F41EB178A9EE67AD562835BF692DF52A73EEADCEADF1FA376C494F44B2FEB264F53C5E96FBFA6806D6381B0EDDC5B58FE71EC61FA5FF00A4F7AC7A3FC60D7938ECCAC6E83D66EA2C6EFAECAF198F6B9BFBCC2CC83B96E6275AC6CBEAB97D2EBAEC6DD855D36D8F7B435A45E1CFAC33DDEAEEF67E93D4AAB4E84B8640902547E53B15B92265094448C4915C51F9A2D5FABBF58E9EB14ECB22BCDAC4D950E1C3FD353FF07FF9EBFCC7BF6972FD43EA8BFF006AD19DD2ADFB234BF75DB79ACC13EA50DFA3FA4FE6DF4FD0F7FF00A2531FE303EAE0E8F7F547DB63062DA71ADC47B4372BD605CC651F652E1FA4BB66F67FE0BE97A577A4FCE31589633A485F075C7E0C5CB1CD463987AA06B8C7CB947EF37FEB07D60C7E8F8FDACCBB01F4699FFC12CFDDA9BFF4D47EAC66755CDE9E727A9000D8F9C721BB0BAB81EFD9FB9BBF9BFE42CDC4FAA8EC9EACFEA3D4AE765E33B6D94B6D6963DF237359934B9ACF49947D1FB3ECF7FF0084F4FDF52B19FF005CB1F13A9E4F4CA3A6751EA3761FA7F687E1D2DB18C36B05D5B0B9D6D7EEF4DDFBA9D90E28E310854E46A52C9FF7105B88679E5964C978E11B8C3177FF00593FFB97A249731FF3DECFFE777ADFFEC2B3FF007A16963FD62C5BF27A7E21C7C9A323A95366432ABEBF4DD5369D8DB1994C7BB732CDD66D67A7EAFF0099B140D975524960677D73E998556539F4E4D96E2E633A78C7A981D65B7DAD6DB4FD9C6FD8E658C7FF00847D7FF9EFD44A77D25CC7FCF7B3FF009DDEB7FF00B0ACFF00DE857FA37D633D5721F8EEE97D47A7963378B3368F4EB7410DD8CB5965ADF53DDF41253FFFD0EA3ACE275CC3FAE34F5FC0E9C7A9E39E9E708D75DB5D4F6D9EAFDA37BFED059FA3D9FB9FF9DD8FF9C7F5ABFF009D6BFF00F62F1BFF0026BA549253C9756ABAF75BC7E8D75BD2DF856E1F59C7BEDA1D75563863D6D7FA994E7D6ED9F4ECDBE97F3ABAAB81754F6B4492D200F3853492538DF53B072FA7FD58E9D859959A7268A432DAC904832EEEC2E6A174DE9F9B4FD6EEB39F6D45B8B954E2328B65A438D4DB7D500077A8DD9BFF0039AB7966F5FEB0DE8FD3DD9459EA3DCE15D4D3A0DEE04B779FDCF6A31899484622C93416CE71844CA46A31165366756C0C2C8A31F26E6D76E498ADA7E1F49E7F319BBF47FF0018B84C8FA9BF5A32336DFAE0E6E357F586ABC598BD30358FA1D4D60D2DAEDC876CDD956D7FA4AF277FB3D9FCC7B3EC7A5D07A064758C83D63AC9365561DD5D6F1FCEFEEB9CDFCDC56FF82AFF00C2FF00C4FF003DDA00000008034002933E384088C65C5203D7FBBC5FD562E5B2E4C80CE51E0813FAB1FA7C1FBD26961F56C4CAC8B30C58CFB663B5A6FA98EDCD048F78AAC2DAFD66D4FF0063DFE9FF00C67A6B94FAC3D1F26CEB995958DD133AEF5C57BF2F0FA8B719971631AC6BACC73656E63E9FE63FB1EA7F8447FAC3F572EE9F77ED8E8B357A47D4B2AAC6B59FCEB6967FA277F86A7FF452DDFABBD68759C0F5DCCF4EEADDE9DC1BF44B800EDF5FF21ED77F63FF00044EC9863C032633C50DA57F3427E2B70F3123925872C78320B942BE4C98FF00AAF17FB1FAA77E83D63FF72EDFFD2EB7FA77D52B33FA274AFF009C565E3AC6154F63F229C87B6D0DB0FBA9B722877E9BD8DAB7FD3F7B3F9CFDFEA9250365E2A8FA924F5DCBAEDBBA88E96DA2A38D6FDB6DD6E97FDA38B7D5FA3E9FD356BAAFD53C0C4E8966360F4FBFA9D8FCA665BFF5A35E4FAAD1B5B955E6E43BF9DA5ADD8C66F67FDB9F4FAB49253E6DFB1FAAFF00E51758FF00DCC37FF4BAD5FAA5D33AEE375EB6FBB172F03A59C435BA9CCCC1965F91EA35CCB6BDB65BB36D1BD8BB449253FFD1F55497CAA924A7EAA497CAA924A7EAA557A97F43B3F98FCDFE93FCD7D26FF39FF7CFE5AF97D2446E37FA6E897CA76DBF4BE5FABF54B7E88E38EDC275F2AA4825FAA952E95FD1DFFD1BF9C77F44FE6F9FCFFF0086FF0048BE624911B1DFA792D3F30DBAFF007BFC17EAA497CAA920B9FAA925F2AA4929FAA925F2AA4929FFD93842494D042100000000005500000001010000000F00410064006F00620065002000500068006F0074006F00730068006F00700000001300410064006F00620065002000500068006F0074006F00730068006F007000200037002E003000000001003842494D04060000000000070008000000010100FFE11248687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D27EFBBBF272069643D2757354D304D7043656869487A7265537A4E54637A6B633964273F3E0A3C3F61646F62652D7861702D66696C74657273206573633D224352223F3E0A3C783A7861706D65746120786D6C6E733A783D2761646F62653A6E733A6D6574612F2720783A786170746B3D27584D5020746F6F6C6B697420322E382E322D33332C206672616D65776F726B20312E35273E0A3C7264663A52444620786D6C6E733A7264663D27687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73232720786D6C6E733A69583D27687474703A2F2F6E732E61646F62652E636F6D2F69582F312E302F273E0A0A203C7264663A4465736372697074696F6E2061626F75743D27757569643A31303566323238342D383834302D313164632D626335662D653434313031353832383764270A2020786D6C6E733A7861704D4D3D27687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F273E0A20203C7861704D4D3A446F63756D656E7449443E61646F62653A646F6369643A70686F746F73686F703A30343065636236632D383833612D313164632D626335662D6534343130313538323837643C2F7861704D4D3A446F63756D656E7449443E0A203C2F7264663A4465736372697074696F6E3E0A0A3C2F7264663A5244463E0A3C2F783A7861706D6574613E0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A3C3F787061636B657420656E643D2777273F3EFFEE000E41646F626500644000000001FFDB008400010101010101010101010101010101010101010101010101010101010101010101010101010101010101010202020202020202020202030303030303030303030101010101010101010101020201020203030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303FFC0001108003400BE03011100021101031101FFDD00040018FFC401A20000000602030100000000000000000000070806050409030A0201000B0100000603010101000000000000000000060504030702080109000A0B1000020103040103030203030302060975010203041105120621071322000831144132231509514216612433175271811862912543A1B1F02634720A19C1D13527E1533682F192A24454734546374763285556571AB2C2D2E2F2648374938465A3B3C3D3E3293866F3752A393A48494A58595A6768696A767778797A85868788898A9495969798999AA4A5A6A7A8A9AAB4B5B6B7B8B9BAC4C5C6C7C8C9CAD4D5D6D7D8D9DAE4E5E6E7E8E9EAF4F5F6F7F8F9FA110002010302040403050404040606056D010203110421120531060022134151073261147108428123911552A162163309B124C1D14372F017E18234259253186344F1A2B226351954364564270A7383934674C2D2E2F255657556378485A3B3C3D3E3F3291A94A4B4C4D4E4F495A5B5C5D5E5F52847576638768696A6B6C6D6E6F667778797A7B7C7D7E7F7485868788898A8B8C8D8E8F839495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C03010002110311003F00DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD5427F312FE663B9FE14F67F5EF5E6D8EADC2EF71B8F688DEF9FC8EE1CCE47151B63A7CD65B074B87C13E3E09D69F2092E1259669E649A35592355898962323BD98F636C3DD1D877ADE6FB7F96D0C173E046B1A2BF708D242EFA88AAD1C00AA54921BB863AC30FBCB7DE9B76F62B9AF96B96B69E5382FC5D597D54AF348F18D06592258E2D00D1C189999D830019404393D1EFF008BDF283ABFE59757633B37ACF27AD1BC743BA36C56BC4BB87656E258564ABC0E7A9237631CA84EAA79D6F055C056589882408979EF90F7FF006F37E9F62DFA0EF1DD14AA0F873C75A092327CBC994F723555B3C720FDA7F76394FDE1E53B5E6AE55BAAA9A2CF0311E35ACD4AB452A8F3F3471D922D1D0D2A018CF60BEA4CEBDEFDD7BA8B5B5B478CA3ABC8E46AE9A831F414D3D6D75756CF152D1D151D2C4D354D5D5D4CCC90D352D3428CF248ECA888A5988009F778A29679638618D9E6760AAAA0966626800032493800649E9A9E782D609AE6E6648EDA342CEEC42AAAA8AB3331A05550092490001538EA83BB73F9E5ED9DB7DD91EC8EA3EADA5ECAEB1C6E76830B93DF553B82AB1392DD05EAD69B2959B2F1898E9A14A088C80514D5458D6E9D5A224653EF2EF97BEEA77F7BCACDBAF316FC6C77E788BAC0235758B1551336A04B11F1AA01A386A620F5CEFE72FBFD6D5B673E2EC5C9BCA69BA72A4570B13DD34CD1BCFDDA5DAD93410107FA13495F1295D2AA4757F2A75007FAFF008588E7E845CFA97E87FC7DE20F5D15EB97BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBFFFD0DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD126F9BFF00093AF3E6875B7F77B3AD0EDDEC5DB90D6D475B761C34C25ACDBF92A84479719938D34C993DAD97929E31574D7D4A556684ACA8A4CA3ED5FBA5BCFB61BE0BDB4ACDB34E545CDB9341228AD197C965404946E1F85AAA71047BF5EC3F2DFBE5CAE76DDC34DB732DAAB3595E05AB42E684A38E2F0484012271140E843815D50B607607C96FE58DF25B234B57415581DD380A8831DBD765E465A89367764ED092679219054C6A62C9E1F2504667C664E01E6A4949650196780F42778D9F91BDF6E4686449C4D61302D04EA078D6D35286A0E55D4D165898D1D7D4696EB901CBBCC5EE97DD53DD2B98A5B66B6DDED9825D5AB926DAF6D89A8C8C3C6E2AD04EA3546D91421D0EE13F183E50F57FCB1EB0C6766759E4B547278E8B736D8AE9615DC7B2B70AC41EB3059FA346F43C64EA82A12F055C25648C9526DCD9E7CE43DFBDBCDFE7D877D828D968A55AF873C75A092327CBC997E246ED615E3DAAF69FDD7E53F78794ED79AB956EAAA68B3C0C478D6B352AD14AA3CFCD1C7648946434A8060EBABA8B19455792C95652E3F1F414D3565757D75445494545494D1B4D515557553BC7053D341121677760AAA092401EC1F1452CF2C7041133CCEC02AA825989C0000C924E00193D48D717105A4135D5D4E915B46A59DDC855555152CCC480AA06492400327AD51BF99E7F33CA8EF9A8CA742741E5EA68BA6286ABEDB786F2A379A92ABB52B699EED414458C1353EC0A5957522BA86CAC8A24602054593A0DEC47B109CA496FCDFCDF6C1B9A18030C26845A039D4DE46E08FCA304A8AB124720FEF5BF7AC93DC296EFDBCF6EEF59391A36D37372B556BF65FC0BC08B453900E67601880814319EFE56BFCAF1B03FDDDF931F24B00C99D51459CEA9EAECC53E893022CB518FDF1BDB1F50AA17321AD36371B329FB2B2D44EBF73A23A7007BFBEFC8BC37DC8FC917DFE27431DDDD21C3F10D0C07868F29251F1E55494AB34B1F74BFBA71DBFF00767BA5EE8ED94BFED976FB0957FB2E0C97574847F6BC1A081BFB2C4920F174AC7B12FD3FDE7F24FD4DFF003EF0D3AE9575EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7FFFD1D977F9CF7F345DE3FCB2FA7FACB2FD63D4F8BED3ED7EF0DE35BB2BAFA3DD75B534BB170991C4CDB766AE9773C18BAFC465F20D90A2CE18A8A182B29079D4BCB288D0ABE86582F9509FC811FE7F3FE7C0EC52A0134AFF009ABF9F0F2E88D7FB363FF0A89E3FEC5B5F0F4DC5C11D8584208362391F2C2DF4F77A2E38918F31F9F979D3F2A9F952C40CE9D3C0FAF1F2F3F2F3F5E38E07DFECD8FF00C2A27FEF5B5F0FBFF460E13FC3FF0002BFFAFBD507CEBF68FF0037A0FE67E43ADE2BC1695F9F0A1F9F1AD0D7D314C549D6E8AF971FCD3305F17BE65F697CF2F87DD4BD13BF7A27A477EF6CF4C667646F9C4EEBD85D855FB4B61EEDDC72ED9DD9B5F0BDA1BDF7361DF1594C0D234B531E4A18EBA92B5D235A7969F5CDA6AF045CF954FECAD387CC81F9797546017B8B0228380FDBE67F21FCFA43F52FF304FE623F247F9547C7AF96FF0017BE29F55F76FCAAEEDCEEEFC766B64A6EE87AFBA8FAFB6E6DADF7D8DB68EF2A8A4DEDD838ACF6E30F06D0C7D28C6D3E6E39DEAF20F51E55821689BD8AD2A2A29F3F43F215FCFF00CA05C85D43145CFF00224799AFE7C3F68E897764FCF3FF00852E75375E6FCED5DFBFCBB3E1EE0B62F5A6CDDD1BFF0079E6577AD1E44E276A6CFC3576E2DC1931418EF9535B92AE38FC3E3A693C34F14B34BA34A233900DBB704834C798F957CBFE2BF6534079556B9F5F953CFCB35F5FE8F008EF8FBFCCBFFE1465F293A7B64F7DF47FF2FF00F881BC7AAFB128F2190DA1B95B750C0B6568F159AC9EDDAD94E2770FCA0C56668BC597C3D447A67A789884D40692A4FA806335FB47CBE5F6FEDFB29BA0AF05A57E7C29F6F1AD73E800A66BD5946C2F99DFCCF3607C1BF9B9DEBF387E22F53F44F717C74E9EDEBDABD3F36D8DEB8CDDFD65D9E36EECADD3B87F8367F6EEDCECDDE5BA7053EDFCA6029D2ADCE5604C853E45053986486426A46680E3CBD7FCDFC87D9D680154A915C5695FCFF2FCEBD1D4FE5A3F2777CFCCCF833F1E3E4E765E1F6A6DFDF3DBBB532BB83706176452E628B6C63A6A5DDFB8F09450E32933F95CD6629C362F1503CAB3D54CDE66720852A078F16F4A9FE448FCFEDEAA411C78FECFF0F53BE6E7C20EB6F9A5D79FC077088B6DF626DE86A26EBEEC7A5A259F2380AB948924C564E357864CC6D5CA491815546D22956B4D1324AA18CA3ED6FBA9BE7B63BC9BBB2266D9A6205C5B16A2C807074241092A7E17A1FE16054D3A81FDF8F61795FDF2E5B1B7EE416D7996D813677AAB57858E4C72004192DE43F1C75143DE855C54D507CAAF9EBB07F919766FC49E8E6F89F995F889D9F879A83B9FE59E26086B33957BEA00D4513C7478A59AB33FB976EA46F98CAD1645A296A71159E3C1C4E6865808679CF9D79879EF7DBADE77CBF791D9D8A4649D1121388E15AE94551A460558E5CEA3A88E3DB3F6BF94BDACE58B1E5AE53DB2181238904B2851E35CC8A28D34F27C4EECC4B64E94D5A115102A87AF99FF00CF8BA6369F747C78F89FF0D3ADF15FCC27B2FBFF0033B4DB7BED4EB8CDE2F31B571DD4BBCB1FFC42AB154F9755ABDBD93DF39BDAD546B4D1D73262F138C492A331241090A42F04F3DBCC9736F3B43344C195C1656565229A4AE5581A10464114156C7437BAB6B6BDB49ED6F2DE39AC66428E8EAAE922B290C8CAD55656150C082083914AD0EAECDFE545F1C369FCA1AFF9170E1615DBB4E984CF6CAE9A5A2A78F67ED0DFB04953265370344269E1ADC7D34894D538EC7285A5A3ADF3483C918A68E19DB71FBC273BEE1EDFC1C9925C1FAD6D71CF7953E34B6E69A22AD70D42CB2C9F13A051825CB62AECBF73FF006C366F76EEBDCA86C97F75A7852DAEDA140B682ED4B179B4FE240423C10E12290B9A1511AA2F7F9A5FCDDAEFE5E1F09FB5FE5361F6450F616E2D9D3ECFC1ED9DAD97C8CD89C254EE2DF1BB70FB471B5B9FADA30F58D89C4CB97FB9960A7D13D578442924264F34702F9AAF99FF0020273F90EB2D146A20569D537ED7F9ADFF000A70DE7B6B6EEF0DBBFCB8FE1FD66DFDD782C46E5C155B6FAC6D2B5561F3B414F94C6D4352D67CAC86AE99A6A2AA4631CA892C6495750C081B42AEAAFA585456848F960F1F9D73E78A608B10B5214A95C673EB93C4711C3029E75AD03EFF00B363FF000A89FF00BD6D7C3EFF00D18384FF0061FF007361EEC02E2A0F9798F957CBCF3F657ECA6A9FE96B9F5FCBCFCB35F5C70EAC1BF97F7C82FE6D3BF37B6F7C07F319F857D5BD19B229769556E1D93D97D41D89B67314CF9EC6D6504351B2F70ED25ED9EC9CECD2E5F1B59355D264617A6A781A85E198334D1B8A9000AFCBE5F3FE5C07AFF93469FEAFCBE79F3E007D9E7D2BBF945FF304DD3FCCABE356F6F90FB9B60603AD61A0EFFEC7EB5DABB63055B93C9C90ECEDAF8FDA993C0D4E7F279170991DCB243B8992B26A58A9A91DE3063863E57DF8AB2B32B10483E5FEAFF37D9D501A80470201FDA2BD5A67BF75BEAAAFF99AFF0030CDCBF00333F0B2A71BD7F87DFF00B4BE45FC9EDBDD0FD830554F94A4DC181C06E7A09160DC1B3AA28663472677155CCB3FDAD5413475D0C4F02B53BB8A88A8CDA4E7E1D24FECA7F9FAF509AFA015FD94FB3CB874443E647F34EFE6371FF30EECCF803FCB7FE27F4DF756E9E8EEA9DA5D99D9397ED9DCEF8EAAAEA2DD78ED9D953598013F65757E1A8315888FB0B1348F1C93D6D6545549248AA90A7375A36A26B4069E9E47D466983518AE09AD40B01C09F3F5078022B90718A800FDBC07482FF66C7FE1513FF7ADAF87DF9FF9A8384FF1B7FDCD87E3DDA8BE87F68FCFCBE78FB056B9EB74FF004B5CFAFCA9E7E59AFAFCBCB245F2CBFE150AB2C6D37F2D6F8812C2B2234B12F62E12269220D778D65FF66B64F1B3AF01B4B5BFA1F7EA0F43FB47FABFE281F51D6E80FF00081F9FA7DBEB9AFA629E62F23FD2C7C9FF00F64ECF6CFF00B2C3FF003969FE8C3F8BFF00B2B9FE92B667D81ED7F17D9FF7487687F16FEE9FF767F8A7F94FDFFDC793F877F63EE3F6BDB7DD4A506AAD3E54AD2BFB334E3E5C7A6FF23FCBFCF4FE7D7FFFD2B12FF8561A4B49D7BF03B70D4524FF00C076F7786EFADCFE70D255CD4384A42DD6AC86BEA60A7A8A5A48EA844E57CA85A4F0954BFAD5B40F7915C943FE15EB5425D00E39FF008EB756BFFF000FF5FCA0071FECEC6C836BFF00CC0DDC6C4E9125EC7FD1C92DC466DF5BDC7FAA5BEFD3AB696FE13FB0F5E3FCFEBF9408BDFE6BEC8E2FF4D8BDC67E9E4FA5BAE0DEFE336B7D6E2DFA96FECFA75ED2DFC27F61EB0F6C7F30BF86BF38BE0E7F30CC57C56EEFC3770D6F5D7C40EF0AFDE91E176DEF8C44580A6DC3D53D8B4F826AAAADD9B5B05492C9939F0557E2485E490AD3BBD8280DEFD5EE8C79EA1FE11F2FF57F31A60555AA08C1FF00074C7FF09DFF00FB73B7C39FFB5576E7FEFF00BED2FF005FFDF7FB7F766356E3E43FC03E67FC9F6756614F2F36FF008F1F90FF0007E67893B3FCC7FF00EDDEBF3ABFF14FBE49FF00EF9DDE3EE87871A7FABFCBFEAAF0EB71FC43F3FF00074513FE13FF00FF006E7FF853FF008667607FEFE8ECAFF5BDD8F1EAADF137DA7FC3D18CFE6B66DFCB2FE7EF36FF009C41F9043EB6FAF58EE416BEB4FAFF00AFCFF43F43AF31F68EB6BF12FDA3A017F90AD87F289F84614C25475C6E31780A90597B377CACAF2944893EE6498334A028D32165E48D4740D751A799FF0009EBCDF11FB7AB73A8961A7826A8A8923820862792A2799E38E28608D59E496692522348A24BB3163600127DD9559D951149726800C924F00079F4D4922448F2CAE163504924D0003249270001924F0EB58EFF008513FCBECC556CCD9BFCACBA6FE33657E427C89F9A38CA06DA9267B65D4E4F676D2C3459AACA48B71EC9CA562D3D0D7F68612BB132542D72544545B4E8D4E4B233245E38E5A100D0B1A229049F3F953EDE07D780E38706086AF0E1EA4D09A0FB687FC1F6534FC40EB9F905FF0009BBF9BBD795BF2BBA0B6DF7474F7CB4DBBB4BACA93BDBA876F6577BEF0D85BAF252D0D566B6875DD4AE3A3CDD4E6A833959E2CA6DD4A58AA775E3E9A9AB31CD2CD48D461B6A33894AD2455F33E5C4D3C81F22719A0248A10FB3F891950694CD3D7E7F97CF033C2B53F40182BA92AA468219D0CEB4D4D5725312D156414D58D32D34B53492AA54D22549A69153C8AA58C6E0728D65051C2AB943E1B1201A1A1229500F0A8A8A8F98E92096232C908914CCA012A082406A852471018AB50F03A4D381EABC3F9B06C0F88DD9DF04FB93687CE0DFD94EA9F8F3937D949B8BB3B0B4F959F31B1371B6F7DBD16C3CF63D315B7F744E661BCE5A1A76496866A6992768A6D31BB30A1AD3B4F77D95FF0057E543F3E9C15D4A456A0FFABEDFF51F2EB514A0EB0FE54388A0A3C6637FE1473F30B198AC6D2C38EC6E3B1CBDDD4B474143410FDBD2515150536DF8E1A4A3A6A6A7090C71A88D5155505B48F75D39CC6B5FF4BD39A9FF00DF63FDE4F530EC0FE55A2F7FF8523FCD0E2FF493BD4FD3C9F4B60CDEFE336B7D6E2DFA96FBD1FF000B5FF79FF67AF6A93FDF63F61E8E07F24BEDCA9C6FF35AEECF8C7D0FF3A3BB7E74FC37AEF8A553BEA7DDFDB191DE997A2A7EC3A1DC7B0688C98EA0DE31C536D8A8C7A6E4AFA17681208ABD25FDC133451347B453473A0281E98AF0CD3F6FCF18C1EA8E58786D4A316FE5426BEA28401E99F5A746F17FE1331B2B67E5F74C1D0FFCC2FE6A742F5BE777566373E27AC763EF2FB4C16DD7CCCCB24B4B14D8BAFC10CA3D2C514704753510355C94F0C6B34B2BA191BC416A5429F99153F3F4E273D7958A8034AFECFD9E7E9FEA1D5536C7FE5B1DBDBB3F9BEF70FF002D7A8FE661F3769764F5B7C6AC7778D0763D2F676E997765766EB64EAF47DBB91C64BBB3F845363D23DFB348B32AF9184310D2439635D229FD9A541F4E38AF4E16ECAD175569D5C3F5C7FC26F7AEB17DBFD47D9BDF1F38FE5CFC9CC1F4EEF9C3F62EDFEB6ED3DD51E4B6C56EE7DBF570E4312D5F2E4AAF37534F8C35D4909AC8A9053CD5902984CC88C49F69C528A079D0509FCFAA78872348FD9D160FE6CFD2BFCAA6B7E7AEF5ED1ECDFE677DCFF02BE5664F60EC8DB3DBB80EAEA2EC653BA708B80DBF3ECCCABE576F6D298C50566D8A0C5C7530D2E467C7CAD8F81DE286AA19D9F67BB014103D413FEAFCBAD29715A0A8F98AD3ECA7F96BD57926C0FE560C06AFF8522FCCE5242F026EF622EDE3FA96C047603CA3EBF4E6F6D2D6F68FF85AFF00BCF57D4FFEFB1FEF27A0A7BDF19F00761F4B7696F7E8EFF85067CCBECEEE2DABB137367FABFAEE7CC777E0E3DE9BEF1785A9C86D8DB72E5AA31F8E8F191E5B2B1450B4ED3C222D47D6185BDED53B810AA08FE8FA7E7FF15C7AD12E680C20824038F22687F60CF5B10FFB355F283FE81B53F2A3FBFF00BDBFD996FF00652FF8EFFA51FE1C7FBF266FEF87F76BFBF224D3E5FE27FDC8FF002DFE336F2DBFDC95F573EEB534A7F4A9F96AA7F83F9FEDEB54FD4A7957AFFFD3DF0FB0FADBAEFB7368E5F6076AEC4D9DD95B173F1470E7366EFCDB586DDDB5F2F1433C75302647039EA3AFC6567DBD54292C664898C72A2BAD99411EF9F9F5A20114231D1451FCAE7F96D8000F81BF11800A1401F1FBAC05800547D36D7F43FEBFFB61EECAEC8AA8AC428140060003C875E655725990163C4902A7E64FAE78F1EBDFF0D75FCB73FEF03BE23F37FF00B97FEB01F5D5FF0066D71FA8FF00BC7F41EF7E2C9FC67F6F5AF0E3FF007DAFEC1FE6FF0057E43A1E360FC5CF8D9D57B0376754F59741F4F75F75A6FDA6CA516F8D85B33AE769EDADA7BC293378F9F1396A6DCF82C3E2A8F1F9D87218AA9929A55AA8E50F4EE633E836F746EFD5AF351435CD470A7D9F2E1D6C00294500035E03EDE97BD69D61D73D35B2709D6DD4BB1B6AF5B75F6DA4AC8F6F6CAD9382C76DADB1848F2190ABCB57A62F0B89A7A5C7D12D6E52BA7A897C71AF92799DDAECC49D924E49A9EB7E400181D3F6E7DB1B737AEDBDC1B3B7860B13BA369EECC2E536DEE7DB59EA0A5CAE0F706DFCE50CF8CCCE13338BAD8E6A3C8E2F298FA9920A8825468E589D9581048F7AE1D6C120D471E993AE3AD7AF7A7F65607ADFAA7646D6EB9EBFDAF054D36DCD97B2B078EDB7B63074F595D5594AC8B1584C4D3D2E3E892AF255D3544BE38D7C93CCEED76624FBED3D68000500C74E9BBF686D5EC0DABB8B636F9DB984DDFB377761B23B7774ED6DC98CA2CD6DFDC381CBD2C94594C366B119186A283278CC851CCF14D04D1BC7246C558106DEFDE87CFAF7E5D33EC8D8BD6FD2DB0B17B27AFB6B6D2EB2EB5D938DAB5C46DADB38BC66D7DA3B6312B355656BCD1E3A862A4C662E8854544D51315544D6EEEDC927DDE38E496448A246695D8000024B3138000A9249381C49E9A9A686DA19679E558EDE352CCCC42AAAA8A96626802802A49A00054E3AD5EFF99EFF0033EA9EF2AACCF41F4066AA28FA6A8AA1E87796F3A19A4A6A9ED4AAA595C498FC7B829341B0609A3E07A5B2CC03BFF9368497A0BEC47B111F29C76DCE3CDF6C1F9A1D434303656D01E0CC381B823FE710C0EFA95E427DEB7EF5B373FCB7BEDD7B757CD1F23C6C56E6E50956DC194E510E08B30470E3707B9BF4E81AEA3F972A7C8CDDBD09B0B777CAFDB3B58EEBC2628E3FA8B3D93C378FB621D8991A3A7A7A9ACDE3354C6EB89AEDC1474146BA60F055565353C7257A34C431C55F7B6D3902D39DEFE1E4391DE10EE6E2855ADD6627B96D8F1D20EAD79281BB633A45067A7DD7EFBDDBDC3DB0DA6E7DD8B7892E7C38C5996565BC7B60A423DE29ED0ECBA3C3A0591906B986B6A93DDBC30099EC3C860C36D6CC6E1C33B67B659DE18D192C3E2B79E3E9AA0EDECC49A2296BA81E8AB2517A9A4D357146CFE260C7989ED85A1B9B6FAF57366245D7A34EBD351AB46AEDD74AE9AE2B4AE3AC81BF17C6C6F3F76783FBCBC26F0BC5D5E1789A4E8F1347768D54D5A7BB4D699EB4FDDEFF0031FE6CFC60F9D3BCBB53B7A3147D9626A3C06F7EB790545275E6E8EB8A2677C360B6E287AB48F6CA52835388CA40D354254C8F3C8D34B255C72F4A769F6CFDAEE7BF69F6DD83971F5ECBA5A482E450DC4572477BC8680F89ABB6689A8A5688A142C6578A1BFF00BDDEFB7B53F780DEB9BB9D13C3E680CB0DD591AAD9CF64A7F4E284558783A7BEDEE10B38726472ECF32BED13D25DD5D11F397A2DF7061E8305BE7626EEC74DB777F75CEF4C4E2B3631759514711CCECBDF3B6EBE3ADC655911540255D24A5ABA791258CBC6EA4F3FF9E391F7DE41DFAE360DFEDF4CCBDD1C82BE1CB1D7B648DB1507CFF12B55480475D74F6B7DD2E54F77794ECF9B3952EF5DBBF6CD0B53C5B698005A199734615A839591487425483D065FF0D75FCB73F3F03FE23926F727E3FF00585D89D5A9988DB42EEC58927EA4F3F5B7B092BB28A2B102A4E3D49A93F99353EA73D48ACAAC6AC809A01C0700283F60C7ECF41D7BFE1AEBF96E7FDE077C47E6FF00F72FFD603EBABFECDAE3F51FF78FE83DEFC593F8CFEDEB5E1C7FEFB5FD83FCDFEAFC8743DF4BFC61F8E1F1C63CE45F1FFA1BA83A55373C94B26E3FF45BD77B5362BE79A844A287F8C4BB6F158E97249422793C2B31758BC8DA00D4D7AB12C6AC6A7AD8007C2A00F90A743A7BD75BE829A1E8AE97C6F6EE63BFB1FD55D7F45DDFB836EC3B4739DB74DB4B090F6265F6B53FF0F106DEC86EF4A219DAAC3443134A053B4E62FF00278FD3E85B7A9D7BA15BDFBAF745DBB97E227C56F91597C4EE0EFCF8E3D21DCD9EC15036270D9BECEEAFD9BBDB2F8CC534F2D51C65164B70E1F215B4F8E1555124A2057112CB233850CCC4F876B071F1D295F3A71A57D2BE5D78E40072BE8723F670F334F4A9F5E819FF0086B9FE5B7FF781BF11AE4004FF00B2FDD61A880A540D5FDDABD8027FD8F3F5E7DDB5B062DA8EA200AF9D05682BF2A9A7DA7D7AD695D21340D20934A0E24004FE600AFD83ACB1FF002C0FE5C114B14D1FC0EF888B2C32C7344DFECBD75636896275963701B6C117491011FE23DECC8E78B1EB7451C1147FB51FE6E8E7FF0076B6E7F773FB9DFDDFC27F747F827F76BFBABFC2A83FBB9FDDCFB0FE17FDDFFE07E0FE19FC13F867F937DA78BC1E0FDBD3A38F74A0A53CBAF75FFFD4DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD6BABFCF27E4EF69ECFAAD95F1AF6ACD59B6F60EFCD96BBCF7B676885453D66EF5FE3D96C3C7B2D320924718C2D02E312AB214E977A935102C85620C92E67FDD5391360DC9374E77DC1566DDAD2E7C1810D0887B11CCFA78F88DA8AC6C70A15C8058D579A3F7F9F7579B7659762F6BB6877B5E5EDC2C7EA6EA55D41AE7F564885B6BAD3C24D02495065CBC61884043C1FE571FCAE7ED976EFC96F92DB6FFCA5569337D53D559BA53A69ED6A8C6EF7DEF8C9E3D5F746EB36371B32131DD6A275D7E3891EF7EFDFCF105EF237235EFE9E52EEED0F1F2682061E5C44B28E394434D44A7FBA67DD33C2FDD9EE97BA5B67EAF6CB61612AF0F34BABA43E7C1A08186312482BA546C6C07E4817BDFE82E0DAC2FC9F505E2F7F7855D74DBAECFD2F7B01C93C7D0726F7B8B11EF47EDEBDD11CF9C5F06FAEFE6875E9C466169B6EF66EDCA6A99FAEBB163A40F5588AC7D5236133821026CAED2C9CA144F4E6EF031F3C1FB8183CADED4FBADBCFB61BD0B9B7D53EC33B0FA9B62681C0C6B4AE16641F0B7061DAF553880FDFDF60B96BDF2E5AFA3BC096BCD76A8C6CAF42D5A3639F0A5A664B790FC69C50FEA47460436AD7D21BD3E4C7F2E6F9694BB4E5C4E4B0DB9FFBC585DABBEFAFE759EB76FF00656D5C864920A16A2106A5C9455AB56D3E17254C0C914EFE9BAB4F0499F3CD5B5722FBD5EDE3EE297092D8F8124B05C0A2C96D22AD5B556A50A91A668DB0C07976B8E4AF21EFBEEA7DD9BDE18B677B3960DD7EA62B7BAB36D4F0DEC0EE02940B8903062F6D32772B1C60C91B6EEE3900DC1B81C8FA1FF11C9E0FBE58F5DE6EBBF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7FFD5DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD21F787FA35F3E0FF00BFFF00DC7FB9FBD6FEEDFF007C3F8079FF0088695D7FC0FF008D7EE7DEE9B5FEDFD76B7B35DB7F7DE8BAFDD1F55E1E9FD5F07C4A69FE9E8FC3FE9B1D07F7BFEAB78961FD64FDDFE2EBFD1FA9F06BAFCFC2F173ABFD267A5C7B2AE841D7BDFBAF75EF7EEBDD7BDFBAF741B6E9FF00441FDE9DA9FDF5FF0046DFDF6FB887FB8DFDE9FEEC7F7A7EEBC93FDBFF00753F8B7FB96FB8F2F9347D9FAB56AB737F677B7FF58FF77DFF00EEAFAEFDD543E3F85E2F854A0AF8BA3B294A575F953E5D05F77FEA5FEF7DA3F7F7EEBFDFDA87D2FD4781F51AAA69F4FE27EA56BAA9E1E6B5A79F424FB24E851D7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75FFFD9,'name1',NULL,NULL,1),
 (2,NULL,0x4749463839618F003000C400005256877793B2EEF1F5BBC9D8DDE4EC335D8BCCD6E2F0EFF4446A9555789E444C8088A0BBA7A3BF11427899AEC560618F223B73E1DFE99895B56E6D98AABBCF344379224F816685A8B5B2C9D2D0DE7C7AA18A87ABC3C1D4FFFFFF00346E00000021F90400000000002C000000008F0030000005FFA0278E64699E68AAAE6CEBBE302A71746DDF78AEEF7CEFFFC0A0B02611D136C8A472C96C3A9FD0A8744AAD5A3734E326C6ED7ABF602F561B2E9BCF68D6D8C3D9A6DFF03877DD96DBEFF811DD9D673D900A771000847D287B2D0C1D1D45278B7C6C1D1C2D0A118B1D1872158A970712108624882C078B11288F241C922C0A1D9E1B1800710AA58C1B9C19A0A11EA32A0F971D8126A923AB932B961378AB1DB3221A8B0CBCBDC8752B8A188B8D25C546AC2A008B78E29825961D15BCBE29A50FDAA7C41D90C72BC01D28831300EA2BCF2712162D2311B0C340138300EC2A9150210C7627801DF03061D13012DE22213B512ED846089C2E71D8556106AB09B650FF34FB27E2DE3411E500A05C74E0A28882340FAAB106E944360F15A4C9A307EE44055C8F360C84904152A007967479E8C8A1D6A20C28529628B7B15CC00CE832E97915A8A23317104D941AD87462B779AA8AA2285722603C11AEE0C294C4E1C0037EA8C66D5DD4F5D24B4B6E4594E2D654EC4E3229EEEDDAB0E8C15BA21BE70A16014160097823C49562E9687368C2A73BDC6D963A438D529955A425A128022100D13ABC1C91B15E38D3E56CF6DA5C6E778A4B26B8A6E6C67AAFEE253A65F354612B18CDCB716327379DDB04657CCEFBA96826BC786ACBDFC04FAD2C663A8A7B4B9AA117D15B2E47D3F7847F4F9D88BDA8451AA4F64F73EB31D21E643E758015FF092E61A4D737DA0DA69E077945A78D63E2DCA58259C679D0543A021AB35967AA1DC8464F242CA6D62B0E62E68F691E589259501DCC97A10BE85CA45C88E9C5F56009351CE29E09F999C0C97CF545185A6E84F4E312280034B51B6E8B10B29066AAED33D301E21538A0697931A24E0548C2A8C79025D4760287BCFDE85B60C1F0315330DC7860DD59FEA0734906E55529E28453E9B98863C89D301B850008C719213A023682028986735B932440F087525D4E35A9432D008084068A7A90D042909206D3A72CDD262482D4B4EAEAAA27BE2AEBAC221C4AEBAD77D88AEBAE6F1C7AE7AFC0062BECB0C4166BECB1C8C27A0DAFCCCAA16BB3D09AB86CB4D486F16CFFB5D8AE60AB008B14908009091820820016946040032F90FB050501A4100001047CDBC5050608E000021D08D06EB8045CE0C1020B7850000116701BB0A1689250007808885B42001478806F09138FD0400001A06BC2C260188080C518A30B3118019C2B02C4F822404003167460C100ED063040022B77F0B177098F708100272FD0B001038800B307170CF0F3000D704B40014027D0C1CC0600DD8003022C704107407B003101EF224DB5CF5107EDC1D4DD7EED34D21E085080080550A0EFCB030CB080BE0244DDC0C01ECC6CF3087113B000BBF4A5EC8103181BCD33C2AC9210C02232632C80D3E37EBC00E18FE33379DA03E84B80D6953B40000572576EA7FF039E3BED39E801883EB80309D8FB39CC9B0BAC9E0008E09BBAD38D77B0300210B77CB5D0A977F0EDDE05A80D9E01175080F5DA88C77AC2D0761600B3CC8137400002D3070D33BEDF0E9D7D070EA09BFDC20D202F33F8E2174E5FB803A09F77BBB2973B31C4142C4073DAF622C033BB6EB7FC71BC1D58C0E6047081F2056062C5B39EBC9485221110601105F3C0D21600BF9D714D8205A0E0E0743780782D0D83145C40070836C100244F8216209C08499841F879CE000158A1053E78B2BA25C06DE15B5A0C0B062F02FEEB6911A3D7D312F8B881E94B042234C0B7D4269DC4650B0E0D70D93A72F6C434148F1AD7AAA2166B45C52D7AF14C4EFCA218E9D0861F2B98F18C684CA31ACF98050FCC6008708CA31CE748C739D6498C783C410800003B,'name2',NULL,NULL,2),
 (3,NULL,0xFFD8FFE000104A46494600010201004800480000FFE109624578696600004D4D002A000000080007011200030000000100010000011A00050000000100000062011B0005000000010000006A01280003000000010002000001310002000000140000007201320002000000140000008687690004000000010000009C000000C80000004800000001000000480000000141646F62652050686F746F73686F7020372E3000323030373A31313A30312031313A33323A34340000000003A001000300000001FFFF0000A002000400000001000000BEA003000400000001000000340000000000000006010300030000000100060000011A00050000000100000116011B0005000000010000011E0128000300000001000200000201000400000001000001260202000400000001000008340000000000000048000000010000004800000001FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080023008003012200021101031101FFDD00040008FFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554961F59FAD98BD2BA8D7D31B8599D4336CA4E49A70AA1616D41DE97AB66F7D3F4ACF67B37FF002FFC1AA9FF003DECFF00E777ADFF00EC2B3FF7A1253D3A4B047D6FC618D897E46067619CDCEAFA7574E4D4DAEC165A37B2E735D66DFB2FFC256FB3FE2D0F27EB8BA8C9B686F41EB178A9EE67AD562835BF692DF52A73EEADCEADF1FA376C494F44B2FEB264F53C5E96FBFA6806D6381B0EDDC5B58FE71EC61FA5FF00A4F7AC7A3FC60D7938ECCAC6E83D66EA2C6EFAECAF198F6B9BFBCC2CC83B96E6275AC6CBEAB97D2EBAEC6DD855D36D8F7B435A45E1CFAC33DDEAEEF67E93D4AAB4E84B8640902547E53B15B92265094448C4915C51F9A2D5FABBF58E9EB14ECB22BCDAC4D950E1C3FD353FF07FF9EBFCC7BF6972FD43EA8BFF006AD19DD2ADFB234BF75DB79ACC13EA50DFA3FA4FE6DF4FD0F7FF00A2531FE303EAE0E8F7F547DB63062DA71ADC47B4372BD605CC651F652E1FA4BB66F67FE0BE97A577A4FCE31589633A485F075C7E0C5CB1CD463987AA06B8C7CB947EF37FEB07D60C7E8F8FDACCBB01F4699FFC12CFDDA9BFF4D47EAC66755CDE9E727A9000D8F9C721BB0BAB81EFD9FB9BBF9BFE42CDC4FAA8EC9EACFEA3D4AE765E33B6D94B6D6963DF237359934B9ACF49947D1FB3ECF7FF0084F4FDF52B19FF005CB1F13A9E4F4CA3A6751EA3761FA7F687E1D2DB18C36B05D5B0B9D6D7EEF4DDFBA9D90E28E310854E46A52C9FF7105B88679E5964C978E11B8C3177FF00593FFB97A249731FF3DECFFE777ADFFEC2B3FF007A16963FD62C5BF27A7E21C7C9A323A95366432ABEBF4DD5369D8DB1994C7BB732CDD66D67A7EAFF0099B140D975524960677D73E998556539F4E4D96E2E633A78C7A981D65B7DAD6DB4FD9C6FD8E658C7FF00847D7FF9EFD44A77D25CC7FCF7B3FF009DDEB7FF00B0ACFF00DE857FA37D633D5721F8EEE97D47A7963378B3368F4EB7410DD8CB5965ADF53DDF41253FFFD0EA3ACE275CC3FAE34F5FC0E9C7A9E39E9E708D75DB5D4F6D9EAFDA37BFED059FA3D9FB9FF9DD8FF9C7F5ABFF009D6BFF00F62F1BFF0026BA549253C9756ABAF75BC7E8D75BD2DF856E1F59C7BEDA1D75563863D6D7FA994E7D6ED9F4ECDBE97F3ABAAB81754F6B4492D200F3853492538DF53B072FA7FD58E9D859959A7268A432DAC904832EEEC2E6A174DE9F9B4FD6EEB39F6D45B8B954E2328B65A438D4DB7D500077A8DD9BFF0039AB7966F5FEB0DE8FD3DD9459EA3DCE15D4D3A0DEE04B779FDCF6A31899484622C93416CE71844CA46A31165366756C0C2C8A31F26E6D76E498ADA7E1F49E7F319BBF47FF0018B84C8FA9BF5A32336DFAE0E6E357F586ABC598BD30358FA1D4D60D2DAEDC876CDD956D7FA4AF277FB3D9FCC7B3EC7A5D07A064758C83D63AC9365561DD5D6F1FCEFEEB9CDFCDC56FF82AFF00C2FF00C4FF003DDA00000008034002933E384088C65C5203D7FBBC5FD562E5B2E4C80CE51E0813FAB1FA7C1FBD26961F56C4CAC8B30C58CFB663B5A6FA98EDCD048F78AAC2DAFD66D4FF0063DFE9FF00C67A6B94FAC3D1F26CEB995958DD133AEF5C57BF2F0FA8B719971631AC6BACC73656E63E9FE63FB1EA7F8447FAC3F572EE9F77ED8E8B357A47D4B2AAC6B59FCEB6967FA277F86A7FF452DDFABBD68759C0F5DCCF4EEADDE9DC1BF44B800EDF5FF21ED77F63FF00044EC9863C032633C50DA57F3427E2B70F3123925872C78320B942BE4C98FF00AAF17FB1FAA77E83D63FF72EDFFD2EB7FA77D52B33FA274AFF009C565E3AC6154F63F229C87B6D0DB0FBA9B722877E9BD8DAB7FD3F7B3F9CFDFEA9250365E2A8FA924F5DCBAEDBBA88E96DA2A38D6FDB6DD6E97FDA38B7D5FA3E9FD356BAAFD53C0C4E8966360F4FBFA9D8FCA665BFF5A35E4FAAD1B5B955E6E43BF9DA5ADD8C66F67FDB9F4FAB49253E6DFB1FAAFF00E51758FF00DCC37FF4BAD5FAA5D33AEE375EB6FBB172F03A59C435BA9CCCC1965F91EA35CCB6BDB65BB36D1BD8BB449253FFD1F55497CAA924A7EAA497CAA924A7EAA557A97F43B3F98FCDFE93FCD7D26FF39FF7CFE5AF97D2446E37FA6E897CA76DBF4BE5FABF54B7E88E38EDC275F2AA4825FAA952E95FD1DFFD1BF9C77F44FE6F9FCFFF0086FF0048BE624911B1DFA792D3F30DBAFF007BFC17EAA497CAA920B9FAA925F2AA4929FAA925F2AA4929FFD9FFED0E1C50686F746F73686F7020332E30003842494D0425000000000010000000000000000000000000000000003842494D03ED000000000010004800000001000100480000000100013842494D042600000000000E000000000000000000003F8000003842494D040D000000000004000000783842494D04190000000000040000001E3842494D03F3000000000009000000000000000001003842494D040A00000000000100003842494D271000000000000A000100000000000000013842494D03F5000000000048002F66660001006C66660006000000000001002F6666000100A1999A0006000000000001003200000001005A00000006000000000001003500000001002D000000060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000000000000200013842494D0402000000000004000000003842494D0408000000000010000000010000024000000240000000003842494D041E000000000004000000003842494D041A00000000034900000006000000000000000000000034000000BE0000000A0055006E007400690074006C00650064002D00330000000100000000000000000000000000000000000000010000000000000000000000BE0000003400000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006E756C6C0000000200000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000003400000000526768746C6F6E67000000BE00000006736C69636573566C4C73000000014F626A6300000001000000000005736C6963650000001200000007736C69636549446C6F6E67000000000000000767726F757049446C6F6E6700000000000000066F726967696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47656E6572617465640000000054797065656E756D0000000A45536C6963655479706500000000496D672000000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000003400000000526768746C6F6E67000000BE0000000375726C54455854000000010000000000006E756C6C54455854000000010000000000004D7367655445585400000001000000000006616C74546167544558540000000100000000000E63656C6C54657874497348544D4C626F6F6C010000000863656C6C546578745445585400000001000000000009686F727A416C69676E656E756D0000000F45536C696365486F727A416C69676E0000000764656661756C740000000976657274416C69676E656E756D0000000F45536C69636556657274416C69676E0000000764656661756C740000000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75747365746C6F6E6700000000003842494D041100000000000101003842494D0414000000000004000000023842494D040C00000000085000000001000000800000002300000180000034800000083400180001FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080023008003012200021101031101FFDD00040008FFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554961F59FAD98BD2BA8D7D31B8599D4336CA4E49A70AA1616D41DE97AB66F7D3F4ACF67B37FF002FFC1AA9FF003DECFF00E777ADFF00EC2B3FF7A1253D3A4B047D6FC618D897E46067619CDCEAFA7574E4D4DAEC165A37B2E735D66DFB2FFC256FB3FE2D0F27EB8BA8C9B686F41EB178A9EE67AD562835BF692DF52A73EEADCEADF1FA376C494F44B2FEB264F53C5E96FBFA6806D6381B0EDDC5B58FE71EC61FA5FF00A4F7AC7A3FC60D7938ECCAC6E83D66EA2C6EFAECAF198F6B9BFBCC2CC83B96E6275AC6CBEAB97D2EBAEC6DD855D36D8F7B435A45E1CFAC33DDEAEEF67E93D4AAB4E84B8640902547E53B15B92265094448C4915C51F9A2D5FABBF58E9EB14ECB22BCDAC4D950E1C3FD353FF07FF9EBFCC7BF6972FD43EA8BFF006AD19DD2ADFB234BF75DB79ACC13EA50DFA3FA4FE6DF4FD0F7FF00A2531FE303EAE0E8F7F547DB63062DA71ADC47B4372BD605CC651F652E1FA4BB66F67FE0BE97A577A4FCE31589633A485F075C7E0C5CB1CD463987AA06B8C7CB947EF37FEB07D60C7E8F8FDACCBB01F4699FFC12CFDDA9BFF4D47EAC66755CDE9E727A9000D8F9C721BB0BAB81EFD9FB9BBF9BFE42CDC4FAA8EC9EACFEA3D4AE765E33B6D94B6D6963DF237359934B9ACF49947D1FB3ECF7FF0084F4FDF52B19FF005CB1F13A9E4F4CA3A6751EA3761FA7F687E1D2DB18C36B05D5B0B9D6D7EEF4DDFBA9D90E28E310854E46A52C9FF7105B88679E5964C978E11B8C3177FF00593FFB97A249731FF3DECFFE777ADFFEC2B3FF007A16963FD62C5BF27A7E21C7C9A323A95366432ABEBF4DD5369D8DB1994C7BB732CDD66D67A7EAFF0099B140D975524960677D73E998556539F4E4D96E2E633A78C7A981D65B7DAD6DB4FD9C6FD8E658C7FF00847D7FF9EFD44A77D25CC7FCF7B3FF009DDEB7FF00B0ACFF00DE857FA37D633D5721F8EEE97D47A7963378B3368F4EB7410DD8CB5965ADF53DDF41253FFFD0EA3ACE275CC3FAE34F5FC0E9C7A9E39E9E708D75DB5D4F6D9EAFDA37BFED059FA3D9FB9FF9DD8FF9C7F5ABFF009D6BFF00F62F1BFF0026BA549253C9756ABAF75BC7E8D75BD2DF856E1F59C7BEDA1D75563863D6D7FA994E7D6ED9F4ECDBE97F3ABAAB81754F6B4492D200F3853492538DF53B072FA7FD58E9D859959A7268A432DAC904832EEEC2E6A174DE9F9B4FD6EEB39F6D45B8B954E2328B65A438D4DB7D500077A8DD9BFF0039AB7966F5FEB0DE8FD3DD9459EA3DCE15D4D3A0DEE04B779FDCF6A31899484622C93416CE71844CA46A31165366756C0C2C8A31F26E6D76E498ADA7E1F49E7F319BBF47FF0018B84C8FA9BF5A32336DFAE0E6E357F586ABC598BD30358FA1D4D60D2DAEDC876CDD956D7FA4AF277FB3D9FCC7B3EC7A5D07A064758C83D63AC9365561DD5D6F1FCEFEEB9CDFCDC56FF82AFF00C2FF00C4FF003DDA00000008034002933E384088C65C5203D7FBBC5FD562E5B2E4C80CE51E0813FAB1FA7C1FBD26961F56C4CAC8B30C58CFB663B5A6FA98EDCD048F78AAC2DAFD66D4FF0063DFE9FF00C67A6B94FAC3D1F26CEB995958DD133AEF5C57BF2F0FA8B719971631AC6BACC73656E63E9FE63FB1EA7F8447FAC3F572EE9F77ED8E8B357A47D4B2AAC6B59FCEB6967FA277F86A7FF452DDFABBD68759C0F5DCCF4EEADDE9DC1BF44B800EDF5FF21ED77F63FF00044EC9863C032633C50DA57F3427E2B70F3123925872C78320B942BE4C98FF00AAF17FB1FAA77E83D63FF72EDFFD2EB7FA77D52B33FA274AFF009C565E3AC6154F63F229C87B6D0DB0FBA9B722877E9BD8DAB7FD3F7B3F9CFDFEA9250365E2A8FA924F5DCBAEDBBA88E96DA2A38D6FDB6DD6E97FDA38B7D5FA3E9FD356BAAFD53C0C4E8966360F4FBFA9D8FCA665BFF5A35E4FAAD1B5B955E6E43BF9DA5ADD8C66F67FDB9F4FAB49253E6DFB1FAAFF00E51758FF00DCC37FF4BAD5FAA5D33AEE375EB6FBB172F03A59C435BA9CCCC1965F91EA35CCB6BDB65BB36D1BD8BB449253FFD1F55497CAA924A7EAA497CAA924A7EAA557A97F43B3F98FCDFE93FCD7D26FF39FF7CFE5AF97D2446E37FA6E897CA76DBF4BE5FABF54B7E88E38EDC275F2AA4825FAA952E95FD1DFFD1BF9C77F44FE6F9FCFFF0086FF0048BE624911B1DFA792D3F30DBAFF007BFC17EAA497CAA920B9FAA925F2AA4929FAA925F2AA4929FFD93842494D042100000000005500000001010000000F00410064006F00620065002000500068006F0074006F00730068006F00700000001300410064006F00620065002000500068006F0074006F00730068006F007000200037002E003000000001003842494D04060000000000070008000000010100FFE11248687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D27EFBBBF272069643D2757354D304D7043656869487A7265537A4E54637A6B633964273F3E0A3C3F61646F62652D7861702D66696C74657273206573633D224352223F3E0A3C783A7861706D65746120786D6C6E733A783D2761646F62653A6E733A6D6574612F2720783A786170746B3D27584D5020746F6F6C6B697420322E382E322D33332C206672616D65776F726B20312E35273E0A3C7264663A52444620786D6C6E733A7264663D27687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73232720786D6C6E733A69583D27687474703A2F2F6E732E61646F62652E636F6D2F69582F312E302F273E0A0A203C7264663A4465736372697074696F6E2061626F75743D27757569643A31303566323238342D383834302D313164632D626335662D653434313031353832383764270A2020786D6C6E733A7861704D4D3D27687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F273E0A20203C7861704D4D3A446F63756D656E7449443E61646F62653A646F6369643A70686F746F73686F703A30343065636236632D383833612D313164632D626335662D6534343130313538323837643C2F7861704D4D3A446F63756D656E7449443E0A203C2F7264663A4465736372697074696F6E3E0A0A3C2F7264663A5244463E0A3C2F783A7861706D6574613E0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A3C3F787061636B657420656E643D2777273F3EFFEE000E41646F626500644000000001FFDB008400010101010101010101010101010101010101010101010101010101010101010101010101010101010101010202020202020202020202030303030303030303030101010101010101010101020201020203030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303FFC0001108003400BE03011100021101031101FFDD00040018FFC401A20000000602030100000000000000000000070806050409030A0201000B0100000603010101000000000000000000060504030702080109000A0B1000020103040103030203030302060975010203041105120621071322000831144132231509514216612433175271811862912543A1B1F02634720A19C1D13527E1533682F192A24454734546374763285556571AB2C2D2E2F2648374938465A3B3C3D3E3293866F3752A393A48494A58595A6768696A767778797A85868788898A9495969798999AA4A5A6A7A8A9AAB4B5B6B7B8B9BAC4C5C6C7C8C9CAD4D5D6D7D8D9DAE4E5E6E7E8E9EAF4F5F6F7F8F9FA110002010302040403050404040606056D010203110421120531060022134151073261147108428123911552A162163309B124C1D14372F017E18234259253186344F1A2B226351954364564270A7383934674C2D2E2F255657556378485A3B3C3D3E3F3291A94A4B4C4D4E4F495A5B5C5D5E5F52847576638768696A6B6C6D6E6F667778797A7B7C7D7E7F7485868788898A8B8C8D8E8F839495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C03010002110311003F00DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD5427F312FE663B9FE14F67F5EF5E6D8EADC2EF71B8F688DEF9FC8EE1CCE47151B63A7CD65B074B87C13E3E09D69F2092E1259669E649A35592355898962323BD98F636C3DD1D877ADE6FB7F96D0C173E046B1A2BF708D242EFA88AAD1C00AA54921BB863AC30FBCB7DE9B76F62B9AF96B96B69E5382FC5D597D54AF348F18D06592258E2D00D1C189999D830019404393D1EFF008BDF283ABFE59757633B37ACF27AD1BC743BA36C56BC4BB87656E258564ABC0E7A9237631CA84EAA79D6F055C056589882408979EF90F7FF006F37E9F62DFA0EF1DD14AA0F873C75A092327CBC994F723555B3C720FDA7F76394FDE1E53B5E6AE55BAAA9A2CF0311E35ACD4AB452A8F3F3471D922D1D0D2A018CF60BEA4CEBDEFDD7BA8B5B5B478CA3ABC8E46AE9A831F414D3D6D75756CF152D1D151D2C4D354D5D5D4CCC90D352D3428CF248ECA888A5988009F778A29679638618D9E6760AAAA0966626800032493800649E9A9E782D609AE6E6648EDA342CEEC42AAAA8AB3331A05550092490001538EA83BB73F9E5ED9DB7DD91EC8EA3EADA5ECAEB1C6E76830B93DF553B82AB1392DD05EAD69B2959B2F1898E9A14A088C80514D5458D6E9D5A224653EF2EF97BEEA77F7BCACDBAF316FC6C77E788BAC0235758B1551336A04B11F1AA01A386A620F5CEFE72FBFD6D5B673E2EC5C9BCA69BA72A4570B13DD34CD1BCFDDA5DAD93410107FA13495F1295D2AA4757F2A75007FAFF008588E7E845CFA97E87FC7DE20F5D15EB97BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBFFFD0DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD126F9BFF00093AF3E6875B7F77B3AD0EDDEC5DB90D6D475B761C34C25ACDBF92A84479719938D34C993DAD97929E31574D7D4A556684ACA8A4CA3ED5FBA5BCFB61BE0BDB4ACDB34E545CDB9341228AD197C965404946E1F85AAA71047BF5EC3F2DFBE5CAE76DDC34DB732DAAB3595E05AB42E684A38E2F0484012271140E843815D50B607607C96FE58DF25B234B57415581DD380A8831DBD765E465A89367764ED092679219054C6A62C9E1F2504667C664E01E6A4949650196780F42778D9F91BDF6E4686449C4D61302D04EA078D6D35286A0E55D4D165898D1D7D4696EB901CBBCC5EE97DD53DD2B98A5B66B6DDED9825D5AB926DAF6D89A8C8C3C6E2AD04EA3546D91421D0EE13F183E50F57FCB1EB0C6766759E4B547278E8B736D8AE9615DC7B2B70AC41EB3059FA346F43C64EA82A12F055C25648C9526DCD9E7CE43DFBDBCDFE7D877D828D968A55AF873C75A092327CBC997E246ED615E3DAAF69FDD7E53F78794ED79AB956EAAA68B3C0C478D6B352AD14AA3CFCD1C7648946434A8060EBABA8B19455792C95652E3F1F414D3565757D75445494545494D1B4D515557553BC7053D341121677760AAA092401EC1F1452CF2C7041133CCEC02AA825989C0000C924E00193D48D717105A4135D5D4E915B46A59DDC855555152CCC480AA06492400327AD51BF99E7F33CA8EF9A8CA742741E5EA68BA6286ABEDB786F2A379A92ABB52B699EED414458C1353EC0A5957522BA86CAC8A24602054593A0DEC47B109CA496FCDFCDF6C1B9A18030C26845A039D4DE46E08FCA304A8AB124720FEF5BF7AC93DC296EFDBCF6EEF59391A36D37372B556BF65FC0BC08B453900E67601880814319EFE56BFCAF1B03FDDDF931F24B00C99D51459CEA9EAECC53E893022CB518FDF1BDB1F50AA17321AD36371B329FB2B2D44EBF73A23A7007BFBEFC8BC37DC8FC917DFE27431DDDD21C3F10D0C07868F29251F1E55494AB34B1F74BFBA71DBFF00767BA5EE8ED94BFED976FB0957FB2E0C97574847F6BC1A081BFB2C4920F174AC7B12FD3FDE7F24FD4DFF003EF0D3AE9575EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7FFFD1D977F9CF7F345DE3FCB2FA7FACB2FD63D4F8BED3ED7EF0DE35BB2BAFA3DD75B534BB170991C4CDB766AE9773C18BAFC465F20D90A2CE18A8A182B29079D4BCB288D0ABE86582F9509FC811FE7F3FE7C0EC52A0134AFF009ABF9F0F2E88D7FB363FF0A89E3FEC5B5F0F4DC5C11D8584208362391F2C2DF4F77A2E38918F31F9F979D3F2A9F952C40CE9D3C0FAF1F2F3F2F3F5E38E07DFECD8FF00C2A27FEF5B5F0FBFF460E13FC3FF0002BFFAFBD507CEBF68FF0037A0FE67E43ADE2BC1695F9F0A1F9F1AD0D7D314C549D6E8AF971FCD3305F17BE65F697CF2F87DD4BD13BF7A27A477EF6CF4C667646F9C4EEBD85D855FB4B61EEDDC72ED9DD9B5F0BDA1BDF7361DF1594C0D234B531E4A18EBA92B5D235A7969F5CDA6AF045CF954FECAD387CC81F9797546017B8B0228380FDBE67F21FCFA43F52FF304FE623F247F9547C7AF96FF0017BE29F55F76FCAAEEDCEEEFC766B64A6EE87AFBA8FAFB6E6DADF7D8DB68EF2A8A4DEDD838ACF6E30F06D0C7D28C6D3E6E39DEAF20F51E55821689BD8AD2A2A29F3F43F215FCFF00CA05C85D43145CFF00224799AFE7C3F68E897764FCF3FF00852E75375E6FCED5DFBFCBB3E1EE0B62F5A6CDDD1BFF0079E6577AD1E44E276A6CFC3576E2DC1931418EF9535B92AE38FC3E3A693C34F14B34BA34A233900DBB704834C798F957CBFE2BF6534079556B9F5F953CFCB35F5FE8F008EF8FBFCCBFFE1465F293A7B64F7DF47FF2FF00F881BC7AAFB128F2190DA1B95B750C0B6568F159AC9EDDAD94E2770FCA0C56668BC597C3D447A67A789884D40692A4FA806335FB47CBE5F6FEDFB29BA0AF05A57E7C29F6F1AD73E800A66BD5946C2F99DFCCF3607C1BF9B9DEBF387E22F53F44F717C74E9EDEBDABD3F36D8DEB8CDDFD65D9E36EECADD3B87F8367F6EEDCECDDE5BA7053EDFCA6029D2ADCE5604C853E45053986486426A46680E3CBD7FCDFC87D9D680154A915C5695FCFF2FCEBD1D4FE5A3F2777CFCCCF833F1E3E4E765E1F6A6DFDF3DBBB532BB83706176452E628B6C63A6A5DDFB8F09450E32933F95CD6629C362F1503CAB3D54CDE66720852A078F16F4A9FE448FCFEDEAA411C78FECFF0F53BE6E7C20EB6F9A5D79FC077088B6DF626DE86A26EBEEC7A5A259F2380AB948924C564E357864CC6D5CA491815546D22956B4D1324AA18CA3ED6FBA9BE7B63BC9BBB2266D9A6205C5B16A2C807074241092A7E17A1FE16054D3A81FDF8F61795FDF2E5B1B7EE416D7996D813677AAB57858E4C72004192DE43F1C75143DE855C54D507CAAF9EBB07F919766FC49E8E6F89F995F889D9F879A83B9FE59E26086B33957BEA00D4513C7478A59AB33FB976EA46F98CAD1645A296A71159E3C1C4E6865808679CF9D79879EF7DBADE77CBF791D9D8A4649D1121388E15AE94551A460558E5CEA3A88E3DB3F6BF94BDACE58B1E5AE53DB2181238904B2851E35CC8A28D34F27C4EECC4B64E94D5A115102A87AF99FF00CF8BA6369F747C78F89FF0D3ADF15FCC27B2FBFF0033B4DB7BED4EB8CDE2F31B571DD4BBCB1FFC42AB154F9755ABDBD93DF39BDAD546B4D1D73262F138C492A331241090A42F04F3DBCC9736F3B43344C195C1656565229A4AE5581A10464114156C7437BAB6B6BDB49ED6F2DE39AC66428E8EAAE922B290C8CAD55656150C082083914AD0EAECDFE545F1C369FCA1AFF9170E1615DBB4E984CF6CAE9A5A2A78F67ED0DFB04953265370344269E1ADC7D34894D538EC7285A5A3ADF3483C918A68E19DB71FBC273BEE1EDFC1C9925C1FAD6D71CF7953E34B6E69A22AD70D42CB2C9F13A051825CB62AECBF73FF006C366F76EEBDCA86C97F75A7852DAEDA140B682ED4B179B4FE240423C10E12290B9A1511AA2F7F9A5FCDDAEFE5E1F09FB5FE5361F6450F616E2D9D3ECFC1ED9DAD97C8CD89C254EE2DF1BB70FB471B5B9FADA30F58D89C4CB97FB9960A7D13D578442924264F34702F9AAF99FF0020273F90EB2D146A20569D537ED7F9ADFF000A70DE7B6B6EEF0DBBFCB8FE1FD66DFDD782C46E5C155B6FAC6D2B5561F3B414F94C6D4352D67CAC86AE99A6A2AA4631CA892C6495750C081B42AEAAFA585456848F960F1F9D73E78A608B10B5214A95C673EB93C4711C3029E75AD03EFF00B363FF000A89FF00BD6D7C3EFF00D18384FF0061FF007361EEC02E2A0F9798F957CBCF3F657ECA6A9FE96B9F5FCBCFCB35F5C70EAC1BF97F7C82FE6D3BF37B6F7C07F319F857D5BD19B229769556E1D93D97D41D89B67314CF9EC6D6504351B2F70ED25ED9EC9CECD2E5F1B59355D264617A6A781A85E198334D1B8A9000AFCBE5F3FE5C07AFF93469FEAFCBE79F3E007D9E7D2BBF945FF304DD3FCCABE356F6F90FB9B60603AD61A0EFFEC7EB5DABB63055B93C9C90ECEDAF8FDA993C0D4E7F279170991DCB243B8992B26A58A9A91DE3063863E57DF8AB2B32B10483E5FEAFF37D9D501A80470201FDA2BD5A67BF75BEAAAFF99AFF0030CDCBF00333F0B2A71BD7F87DFF00B4BE45FC9EDBDD0FD830554F94A4DC181C06E7A09160DC1B3AA28663472677155CCB3FDAD5413475D0C4F02B53BB8A88A8CDA4E7E1D24FECA7F9FAF509AFA015FD94FB3CB874443E647F34EFE6371FF30EECCF803FCB7FE27F4DF756E9E8EEA9DA5D99D9397ED9DCEF8EAAAEA2DD78ED9D953598013F65757E1A8315888FB0B1348F1C93D6D6545549248AA90A7375A36A26B4069E9E47D466983518AE09AD40B01C09F3F5078022B90718A800FDBC07482FF66C7FE1513FF7ADAF87DF9FF9A8384FF1B7FDCD87E3DDA8BE87F68FCFCBE78FB056B9EB74FF004B5CFAFCA9E7E59AFAFCBCB245F2CBFE150AB2C6D37F2D6F8812C2B2234B12F62E12269220D778D65FF66B64F1B3AF01B4B5BFA1F7EA0F43FB47FABFE281F51D6E80FF00081F9FA7DBEB9AFA629E62F23FD2C7C9FF00F64ECF6CFF00B2C3FF003969FE8C3F8BFF00B2B9FE92B667D81ED7F17D9FF7487687F16FEE9FF767F8A7F94FDFFDC793F877F63EE3F6BDB7DD4A506AAD3E54AD2BFB334E3E5C7A6FF23FCBFCF4FE7D7FFFD2B12FF8561A4B49D7BF03B70D4524FF00C076F7786EFADCFE70D255CD4384A42DD6AC86BEA60A7A8A5A48EA844E57CA85A4F0954BFAD5B40F7915C943FE15EB5425D00E39FF008EB756BFFF000FF5FCA0071FECEC6C836BFF00CC0DDC6C4E9125EC7FD1C92DC466DF5BDC7FAA5BEFD3AB696FE13FB0F5E3FCFEBF9408BDFE6BEC8E2FF4D8BDC67E9E4FA5BAE0DEFE336B7D6E2DFA96FECFA75ED2DFC27F61EB0F6C7F30BF86BF38BE0E7F30CC57C56EEFC3770D6F5D7C40EF0AFDE91E176DEF8C44580A6DC3D53D8B4F826AAAADD9B5B05492C9939F0557E2485E490AD3BBD8280DEFD5EE8C79EA1FE11F2FF57F31A60555AA08C1FF00074C7FF09DFF00FB73B7C39FFB5576E7FEFF00BED2FF005FFDF7FB7F766356E3E43FC03E67FC9F6756614F2F36FF008F1F90FF0007E67893B3FCC7FF00EDDEBF3ABFF14FBE49FF00EF9DDE3EE87871A7FABFCBFEAAF0EB71FC43F3FF00074513FE13FF00FF006E7FF853FF008667607FEFE8ECAFF5BDD8F1EAADF137DA7FC3D18CFE6B66DFCB2FE7EF36FF009C41F9043EB6FAF58EE416BEB4FAFF00AFCFF43F43AF31F68EB6BF12FDA3A017F90AD87F289F84614C25475C6E31780A90597B377CACAF2944893EE6498334A028D32165E48D4740D751A799FF0009EBCDF11FB7AB73A8961A7826A8A8923820862792A2799E38E28608D59E496692522348A24BB3163600127DD9559D951149726800C924F00079F4D4922448F2CAE163504924D0003249270001924F0EB58EFF008513FCBECC556CCD9BFCACBA6FE33657E427C89F9A38CA06DA9267B65D4E4F676D2C3459AACA48B71EC9CA562D3D0D7F68612BB132542D72544545B4E8D4E4B233245E38E5A100D0B1A229049F3F953EDE07D780E38706086AF0E1EA4D09A0FB687FC1F6534FC40EB9F905FF0009BBF9BBD795BF2BBA0B6DF7474F7CB4DBBB4BACA93BDBA876F6577BEF0D85BAF252D0D566B6875DD4AE3A3CDD4E6A833959E2CA6DD4A58AA775E3E9A9AB31CD2CD48D461B6A33894AD2455F33E5C4D3C81F22719A0248A10FB3F891950694CD3D7E7F97CF033C2B53F40182BA92AA468219D0CEB4D4D5725312D156414D58D32D34B53492AA54D22549A69153C8AA58C6E0728D65051C2AB943E1B1201A1A1229500F0A8A8A8F98E92096232C908914CCA012A082406A852471018AB50F03A4D381EABC3F9B06C0F88DD9DF04FB93687CE0DFD94EA9F8F3937D949B8BB3B0B4F959F31B1371B6F7DBD16C3CF63D315B7F744E661BCE5A1A76496866A6992768A6D31BB30A1AD3B4F77D95FF0057E543F3E9C15D4A456A0FFABEDFF51F2EB514A0EB0FE54388A0A3C6637FE1473F30B198AC6D2C38EC6E3B1CBDDD4B474143410FDBD2515150536DF8E1A4A3A6A6A7090C71A88D5155505B48F75D39CC6B5FF4BD39A9FF00DF63FDE4F530EC0FE55A2F7FF8523FCD0E2FF493BD4FD3C9F4B60CDEFE336B7D6E2DFA96FBD1FF000B5FF79FF67AF6A93FDF63F61E8E07F24BEDCA9C6FF35AEECF8C7D0FF3A3BB7E74FC37AEF8A553BEA7DDFDB191DE997A2A7EC3A1DC7B0688C98EA0DE31C536D8A8C7A6E4AFA17681208ABD25FDC133451347B453473A0281E98AF0CD3F6FCF18C1EA8E58786D4A316FE5426BEA28401E99F5A746F17FE1331B2B67E5F74C1D0FFCC2FE6A742F5BE777566373E27AC763EF2FB4C16DD7CCCCB24B4B14D8BAFC10CA3D2C514704753510355C94F0C6B34B2BA191BC416A5429F99153F3F4E273D7958A8034AFECFD9E7E9FEA1D5536C7FE5B1DBDBB3F9BEF70FF002D7A8FE661F3769764F5B7C6AC7778D0763D2F676E997765766EB64EAF47DBB91C64BBB3F845363D23DFB348B32AF9184310D2439635D229FD9A541F4E38AF4E16ECAD175569D5C3F5C7FC26F7AEB17DBFD47D9BDF1F38FE5CFC9CC1F4EEF9C3F62EDFEB6ED3DD51E4B6C56EE7DBF570E4312D5F2E4AAF37534F8C35D4909AC8A9053CD5902984CC88C49F69C528A079D0509FCFAA78872348FD9D160FE6CFD2BFCAA6B7E7AEF5ED1ECDFE677DCFF02BE5664F60EC8DB3DBB80EAEA2EC653BA708B80DBF3ECCCABE576F6D298C50566D8A0C5C7530D2E467C7CAD8F81DE286AA19D9F67BB014103D413FEAFCBAD29715A0A8F98AD3ECA7F96BD57926C0FE560C06AFF8522FCCE5242F026EF622EDE3FA96C047603CA3EBF4E6F6D2D6F68FF85AFF00BCF57D4FFEFB1FEF27A0A7BDF19F00761F4B7696F7E8EFF85067CCBECEEE2DABB137367FABFAEE7CC777E0E3DE9BEF1785A9C86D8DB72E5AA31F8E8F191E5B2B1450B4ED3C222D47D6185BDED53B810AA08FE8FA7E7FF15C7AD12E680C20824038F22687F60CF5B10FFB355F283FE81B53F2A3FBFF00BDBFD996FF00652FF8EFFA51FE1C7FBF266FEF87F76BFBF224D3E5FE27FDC8FF002DFE336F2DBFDC95F573EEB534A7F4A9F96AA7F83F9FEDEB54FD4A7957AFFFD3DF0FB0FADBAEFB7368E5F6076AEC4D9DD95B173F1470E7366EFCDB586DDDB5F2F1433C75302647039EA3AFC6567DBD54292C664898C72A2BAD99411EF9F9F5A20114231D1451FCAE7F96D8000F81BF11800A1401F1FBAC05800547D36D7F43FEBFFB61EECAEC8AA8AC428140060003C875E655725990163C4902A7E64FAE78F1EBDFF0D75FCB73FEF03BE23F37FF00B97FEB01F5D5FF0066D71FA8FF00BC7F41EF7E2C9FC67F6F5AF0E3FF007DAFEC1FE6FF0057E43A1E360FC5CF8D9D57B0376754F59741F4F75F75A6FDA6CA516F8D85B33AE769EDADA7BC293378F9F1396A6DCF82C3E2A8F1F9D87218AA9929A55AA8E50F4EE633E836F746EFD5AF351435CD470A7D9F2E1D6C00294500035E03EDE97BD69D61D73D35B2709D6DD4BB1B6AF5B75F6DA4AC8F6F6CAD9382C76DADB1848F2190ABCB57A62F0B89A7A5C7D12D6E52BA7A897C71AF92799DDAECC49D924E49A9EB7E400181D3F6E7DB1B737AEDBDC1B3B7860B13BA369EECC2E536DEE7DB59EA0A5CAE0F706DFCE50CF8CCCE13338BAD8E6A3C8E2F298FA9920A8825468E589D9581048F7AE1D6C120D471E993AE3AD7AF7A7F65607ADFAA7646D6EB9EBFDAF054D36DCD97B2B078EDB7B63074F595D5594AC8B1584C4D3D2E3E892AF255D3544BE38D7C93CCEED76624FBED3D68000500C74E9BBF686D5EC0DABB8B636F9DB984DDFB377761B23B7774ED6DC98CA2CD6DFDC381CBD2C94594C366B119186A283278CC851CCF14D04D1BC7246C558106DEFDE87CFAF7E5D33EC8D8BD6FD2DB0B17B27AFB6B6D2EB2EB5D938DAB5C46DADB38BC66D7DA3B6312B355656BCD1E3A862A4C662E8854544D51315544D6EEEDC927DDE38E496448A246695D8000024B3138000A9249381C49E9A9A686DA19679E558EDE352CCCC42AAAA8A96626802802A49A00054E3AD5EFF99EFF0033EA9EF2AACCF41F4066AA28FA6A8AA1E87796F3A19A4A6A9ED4AAA595C498FC7B829341B0609A3E07A5B2CC03BFF9368497A0BEC47B111F29C76DCE3CDF6C1F9A1D434303656D01E0CC381B823FE710C0EFA95E427DEB7EF5B373FCB7BEDD7B757CD1F23C6C56E6E50956DC194E510E08B30470E3707B9BF4E81AEA3F972A7C8CDDBD09B0B777CAFDB3B58EEBC2628E3FA8B3D93C378FB621D8991A3A7A7A9ACDE3354C6EB89AEDC1474146BA60F055565353C7257A34C431C55F7B6D3902D39DEFE1E4391DE10EE6E2855ADD6627B96D8F1D20EAD79281BB633A45067A7DD7EFBDDBDC3DB0DA6E7DD8B7892E7C38C5996565BC7B60A423DE29ED0ECBA3C3A0591906B986B6A93DDBC30099EC3C860C36D6CC6E1C33B67B659DE18D192C3E2B79E3E9AA0EDECC49A2296BA81E8AB2517A9A4D357146CFE260C7989ED85A1B9B6FAF57366245D7A34EBD351AB46AEDD74AE9AE2B4AE3AC81BF17C6C6F3F76783FBCBC26F0BC5D5E1789A4E8F1347768D54D5A7BB4D699EB4FDDEFF0031FE6CFC60F9D3BCBB53B7A3147D9626A3C06F7EB790545275E6E8EB8A2677C360B6E287AB48F6CA52835388CA40D354254C8F3C8D34B255C72F4A769F6CFDAEE7BF69F6DD83971F5ECBA5A482E450DC4572477BC8680F89ABB6689A8A5688A142C6578A1BFF00BDDEFB7B53F780DEB9BB9D13C3E680CB0DD591AAD9CF64A7F4E284558783A7BEDEE10B38726472ECF32BED13D25DD5D11F397A2DF7061E8305BE7626EEC74DB777F75CEF4C4E2B3631759514711CCECBDF3B6EBE3ADC655911540255D24A5ABA791258CBC6EA4F3FF9E391F7DE41DFAE360DFEDF4CCBDD1C82BE1CB1D7B648DB1507CFF12B55480475D74F6B7DD2E54F77794ECF9B3952EF5DBBF6CD0B53C5B698005A199734615A839591487425483D065FF0D75FCB73F3F03FE23926F727E3FF00585D89D5A9988DB42EEC58927EA4F3F5B7B092BB28A2B102A4E3D49A93F99353EA73D48ACAAC6AC809A01C0700283F60C7ECF41D7BFE1AEBF96E7FDE077C47E6FF00F72FFD603EBABFECDAE3F51FF78FE83DEFC593F8CFEDEB5E1C7FEFB5FD83FCDFEAFC8743DF4BFC61F8E1F1C63CE45F1FFA1BA83A55373C94B26E3FF45BD77B5362BE79A844A287F8C4BB6F158E97249422793C2B31758BC8DA00D4D7AB12C6AC6A7AD8007C2A00F90A743A7BD75BE829A1E8AE97C6F6EE63BFB1FD55D7F45DDFB836EC3B4739DB74DB4B090F6265F6B53FF0F106DEC86EF4A219DAAC3443134A053B4E62FF00278FD3E85B7A9D7BA15BDFBAF745DBB97E227C56F91597C4EE0EFCF8E3D21DCD9EC15036270D9BECEEAFD9BBDB2F8CC534F2D51C65164B70E1F215B4F8E1555124A2057112CB233850CCC4F876B071F1D295F3A71A57D2BE5D78E40072BE8723F670F334F4A9F5E819FF0086B9FE5B7FF781BF11AE4004FF00B2FDD61A880A540D5FDDABD8027FD8F3F5E7DDB5B062DA8EA200AF9D05682BF2A9A7DA7D7AD695D21340D20934A0E24004FE600AFD83ACB1FF002C0FE5C114B14D1FC0EF888B2C32C7344DFECBD75636896275963701B6C117491011FE23DECC8E78B1EB7451C1147FB51FE6E8E7FF0076B6E7F773FB9DFDDFC27F747F827F76BFBABFC2A83FBB9FDDCFB0FE17FDDFFE07E0FE19FC13F867F937DA78BC1E0FDBD3A38F74A0A53CBAF75FFFD4DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD6BABFCF27E4EF69ECFAAD95F1AF6ACD59B6F60EFCD96BBCF7B676885453D66EF5FE3D96C3C7B2D320924718C2D02E312AB214E977A935102C85620C92E67FDD5391360DC9374E77DC1566DDAD2E7C1810D0887B11CCFA78F88DA8AC6C70A15C8058D579A3F7F9F7579B7659762F6BB6877B5E5EDC2C7EA6EA55D41AE7F564885B6BAD3C24D02495065CBC61884043C1FE571FCAE7ED976EFC96F92DB6FFCA5569337D53D559BA53A69ED6A8C6EF7DEF8C9E3D5F746EB36371B32131DD6A275D7E3891EF7EFDFCF105EF237235EFE9E52EEED0F1F2682061E5C44B28E394434D44A7FBA67DD33C2FDD9EE97BA5B67EAF6CB61612AF0F34BABA43E7C1A08186312482BA546C6C07E4817BDFE82E0DAC2FC9F505E2F7F7855D74DBAECFD2F7B01C93C7D0726F7B8B11EF47EDEBDD11CF9C5F06FAEFE6875E9C466169B6EF66EDCA6A99FAEBB163A40F5588AC7D5236133821026CAED2C9CA144F4E6EF031F3C1FB8183CADED4FBADBCFB61BD0B9B7D53EC33B0FA9B62681C0C6B4AE16641F0B7061DAF553880FDFDF60B96BDF2E5AFA3BC096BCD76A8C6CAF42D5A3639F0A5A664B790FC69C50FEA47460436AD7D21BD3E4C7F2E6F9694BB4E5C4E4B0DB9FFBC585DABBEFAFE759EB76FF00656D5C864920A16A2106A5C9455AB56D3E17254C0C914EFE9BAB4F0499F3CD5B5722FBD5EDE3EE297092D8F8124B05C0A2C96D22AD5B556A50A91A668DB0C07976B8E4AF21EFBEEA7DD9BDE18B677B3960DD7EA62B7BAB36D4F0DEC0EE02940B8903062F6D32772B1C60C91B6EEE3900DC1B81C8FA1FF11C9E0FBE58F5DE6EBBF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7FFD5DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD21F787FA35F3E0FF00BFFF00DC7FB9FBD6FEEDFF007C3F8079FF0088695D7FC0FF008D7EE7DEE9B5FEDFD76B7B35DB7F7DE8BAFDD1F55E1E9FD5F07C4A69FE9E8FC3FE9B1D07F7BFEAB78961FD64FDDFE2EBFD1FA9F06BAFCFC2F173ABFD267A5C7B2AE841D7BDFBAF75EF7EEBDD7BDFBAF741B6E9FF00441FDE9DA9FDF5FF0046DFDF6FB887FB8DFDE9FEEC7F7A7EEBC93FDBFF00753F8B7FB96FB8F2F9347D9FAB56AB737F677B7FF58FF77DFF00EEAFAEFDD543E3F85E2F854A0AF8BA3B294A575F953E5D05F77FEA5FEF7DA3F7F7EEBFDFDA87D2FD4781F51AAA69F4FE27EA56BAA9E1E6B5A79F424FB24E851D7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75FFFD9,'name1',NULL,NULL,1),
 (4,NULL,0x4749463839618F003000C400005256877793B2EEF1F5BBC9D8DDE4EC335D8BCCD6E2F0EFF4446A9555789E444C8088A0BBA7A3BF11427899AEC560618F223B73E1DFE99895B56E6D98AABBCF344379224F816685A8B5B2C9D2D0DE7C7AA18A87ABC3C1D4FFFFFF00346E00000021F90400000000002C000000008F0030000005FFA0278E64699E68AAAE6CEBBE302A71746DDF78AEEF7CEFFFC0A0B02611D136C8A472C96C3A9FD0A8744AAD5A3734E326C6ED7ABF602F561B2E9BCF68D6D8C3D9A6DFF03877DD96DBEFF811DD9D673D900A771000847D287B2D0C1D1D45278B7C6C1D1C2D0A118B1D1872158A970712108624882C078B11288F241C922C0A1D9E1B1800710AA58C1B9C19A0A11EA32A0F971D8126A923AB932B961378AB1DB3221A8B0CBCBDC8752B8A188B8D25C546AC2A008B78E29825961D15BCBE29A50FDAA7C41D90C72BC01D28831300EA2BCF2712162D2311B0C340138300EC2A9150210C7627801DF03061D13012DE22213B512ED846089C2E71D8556106AB09B650FF34FB27E2DE3411E500A05C74E0A28882340FAAB106E944360F15A4C9A307EE44055C8F360C84904152A007967479E8C8A1D6A20C28529628B7B15CC00CE832E97915A8A23317104D941AD87462B779AA8AA2285722603C11AEE0C294C4E1C0037EA8C66D5DD4F5D24B4B6E4594E2D654EC4E3229EEEDDAB0E8C15BA21BE70A16014160097823C49562E9687368C2A73BDC6D963A438D529955A425A128022100D13ABC1C91B15E38D3E56CF6DA5C6E778A4B26B8A6E6C67AAFEE253A65F354612B18CDCB716327379DDB04657CCEFBA96826BC786ACBDFC04FAD2C663A8A7B4B9AA117D15B2E47D3F7847F4F9D88BDA8451AA4F64F73EB31D21E643E758015FF092E61A4D737DA0DA69E077945A78D63E2DCA58259C679D0543A021AB35967AA1DC8464F242CA6D62B0E62E68F691E589259501DCC97A10BE85CA45C88E9C5F56009351CE29E09F999C0C97CF545185A6E84F4E312280034B51B6E8B10B29066AAED33D301E21538A0697931A24E0548C2A8C79025D4760287BCFDE85B60C1F0315330DC7860DD59FEA0734906E55529E28453E9B98863C89D301B850008C719213A023682028986735B932440F087525D4E35A9432D008084068A7A90D042909206D3A72CDD262482D4B4EAEAAA27BE2AEBAC221C4AEBAD77D88AEBAE6F1C7AE7AFC0062BECB0C4166BECB1C8C27A0DAFCCCAA16BB3D09AB86CB4D486F16CFFB5D8AE60AB008B14908009091820820016946040032F90FB050501A4100001047CDBC5050608E000021D08D06EB8045CE0C1020B7850000116701BB0A1689250007808885B42001478806F09138FD0400001A06BC2C260188080C518A30B3118019C2B02C4F822404003167460C100ED063040022B77F0B177098F708100272FD0B001038800B307170CF0F3000D704B40014027D0C1CC0600DD8003022C704107407B003101EF224DB5CF5107EDC1D4DD7EED34D21E085080080550A0EFCB030CB080BE0244DDC0C01ECC6CF3087113B000BBF4A5EC8103181BCD33C2AC9210C02232632C80D3E37EBC00E18FE33379DA03E84B80D6953B40000572576EA7FF039E3BED39E801883EB80309D8FB39CC9B0BAC9E0008E09BBAD38D77B0300210B77CB5D0A977F0EDDE05A80D9E01175080F5DA88C77AC2D0761600B3CC8137400002D3070D33BEDF0E9D7D070EA09BFDC20D202F33F8E2174E5FB803A09F77BBB2973B31C4142C4073DAF622C033BB6EB7FC71BC1D58C0E6047081F2056062C5B39EBC9485221110601105F3C0D21600BF9D714D8205A0E0E0743780782D0D83145C40070836C100244F8216209C08499841F879CE000158A1053E78B2BA25C06DE15B5A0C0B062F02FEEB6911A3D7D312F8B881E94B042234C0B7D4269DC4650B0E0D70D93A72F6C434148F1AD7AAA2166B45C52D7AF14C4EFCA218E9D0861F2B98F18C684CA31ACF98050FCC6008708CA31CE748C739D6498C783C410800003B,'name2',NULL,NULL,2);
INSERT INTO `tbl_logo` (`id`,`description`,`bin_data`,`filename`,`filesize`,`filetype`,`companyId`) VALUES 
 (5,NULL,0xFFD8FFE000104A46494600010201004800480000FFE109624578696600004D4D002A000000080007011200030000000100010000011A00050000000100000062011B0005000000010000006A01280003000000010002000001310002000000140000007201320002000000140000008687690004000000010000009C000000C80000004800000001000000480000000141646F62652050686F746F73686F7020372E3000323030373A31313A30312031313A33323A34340000000003A001000300000001FFFF0000A002000400000001000000BEA003000400000001000000340000000000000006010300030000000100060000011A00050000000100000116011B0005000000010000011E0128000300000001000200000201000400000001000001260202000400000001000008340000000000000048000000010000004800000001FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080023008003012200021101031101FFDD00040008FFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554961F59FAD98BD2BA8D7D31B8599D4336CA4E49A70AA1616D41DE97AB66F7D3F4ACF67B37FF002FFC1AA9FF003DECFF00E777ADFF00EC2B3FF7A1253D3A4B047D6FC618D897E46067619CDCEAFA7574E4D4DAEC165A37B2E735D66DFB2FFC256FB3FE2D0F27EB8BA8C9B686F41EB178A9EE67AD562835BF692DF52A73EEADCEADF1FA376C494F44B2FEB264F53C5E96FBFA6806D6381B0EDDC5B58FE71EC61FA5FF00A4F7AC7A3FC60D7938ECCAC6E83D66EA2C6EFAECAF198F6B9BFBCC2CC83B96E6275AC6CBEAB97D2EBAEC6DD855D36D8F7B435A45E1CFAC33DDEAEEF67E93D4AAB4E84B8640902547E53B15B92265094448C4915C51F9A2D5FABBF58E9EB14ECB22BCDAC4D950E1C3FD353FF07FF9EBFCC7BF6972FD43EA8BFF006AD19DD2ADFB234BF75DB79ACC13EA50DFA3FA4FE6DF4FD0F7FF00A2531FE303EAE0E8F7F547DB63062DA71ADC47B4372BD605CC651F652E1FA4BB66F67FE0BE97A577A4FCE31589633A485F075C7E0C5CB1CD463987AA06B8C7CB947EF37FEB07D60C7E8F8FDACCBB01F4699FFC12CFDDA9BFF4D47EAC66755CDE9E727A9000D8F9C721BB0BAB81EFD9FB9BBF9BFE42CDC4FAA8EC9EACFEA3D4AE765E33B6D94B6D6963DF237359934B9ACF49947D1FB3ECF7FF0084F4FDF52B19FF005CB1F13A9E4F4CA3A6751EA3761FA7F687E1D2DB18C36B05D5B0B9D6D7EEF4DDFBA9D90E28E310854E46A52C9FF7105B88679E5964C978E11B8C3177FF00593FFB97A249731FF3DECFFE777ADFFEC2B3FF007A16963FD62C5BF27A7E21C7C9A323A95366432ABEBF4DD5369D8DB1994C7BB732CDD66D67A7EAFF0099B140D975524960677D73E998556539F4E4D96E2E633A78C7A981D65B7DAD6DB4FD9C6FD8E658C7FF00847D7FF9EFD44A77D25CC7FCF7B3FF009DDEB7FF00B0ACFF00DE857FA37D633D5721F8EEE97D47A7963378B3368F4EB7410DD8CB5965ADF53DDF41253FFFD0EA3ACE275CC3FAE34F5FC0E9C7A9E39E9E708D75DB5D4F6D9EAFDA37BFED059FA3D9FB9FF9DD8FF9C7F5ABFF009D6BFF00F62F1BFF0026BA549253C9756ABAF75BC7E8D75BD2DF856E1F59C7BEDA1D75563863D6D7FA994E7D6ED9F4ECDBE97F3ABAAB81754F6B4492D200F3853492538DF53B072FA7FD58E9D859959A7268A432DAC904832EEEC2E6A174DE9F9B4FD6EEB39F6D45B8B954E2328B65A438D4DB7D500077A8DD9BFF0039AB7966F5FEB0DE8FD3DD9459EA3DCE15D4D3A0DEE04B779FDCF6A31899484622C93416CE71844CA46A31165366756C0C2C8A31F26E6D76E498ADA7E1F49E7F319BBF47FF0018B84C8FA9BF5A32336DFAE0E6E357F586ABC598BD30358FA1D4D60D2DAEDC876CDD956D7FA4AF277FB3D9FCC7B3EC7A5D07A064758C83D63AC9365561DD5D6F1FCEFEEB9CDFCDC56FF82AFF00C2FF00C4FF003DDA00000008034002933E384088C65C5203D7FBBC5FD562E5B2E4C80CE51E0813FAB1FA7C1FBD26961F56C4CAC8B30C58CFB663B5A6FA98EDCD048F78AAC2DAFD66D4FF0063DFE9FF00C67A6B94FAC3D1F26CEB995958DD133AEF5C57BF2F0FA8B719971631AC6BACC73656E63E9FE63FB1EA7F8447FAC3F572EE9F77ED8E8B357A47D4B2AAC6B59FCEB6967FA277F86A7FF452DDFABBD68759C0F5DCCF4EEADDE9DC1BF44B800EDF5FF21ED77F63FF00044EC9863C032633C50DA57F3427E2B70F3123925872C78320B942BE4C98FF00AAF17FB1FAA77E83D63FF72EDFFD2EB7FA77D52B33FA274AFF009C565E3AC6154F63F229C87B6D0DB0FBA9B722877E9BD8DAB7FD3F7B3F9CFDFEA9250365E2A8FA924F5DCBAEDBBA88E96DA2A38D6FDB6DD6E97FDA38B7D5FA3E9FD356BAAFD53C0C4E8966360F4FBFA9D8FCA665BFF5A35E4FAAD1B5B955E6E43BF9DA5ADD8C66F67FDB9F4FAB49253E6DFB1FAAFF00E51758FF00DCC37FF4BAD5FAA5D33AEE375EB6FBB172F03A59C435BA9CCCC1965F91EA35CCB6BDB65BB36D1BD8BB449253FFD1F55497CAA924A7EAA497CAA924A7EAA557A97F43B3F98FCDFE93FCD7D26FF39FF7CFE5AF97D2446E37FA6E897CA76DBF4BE5FABF54B7E88E38EDC275F2AA4825FAA952E95FD1DFFD1BF9C77F44FE6F9FCFFF0086FF0048BE624911B1DFA792D3F30DBAFF007BFC17EAA497CAA920B9FAA925F2AA4929FAA925F2AA4929FFD9FFED0E1C50686F746F73686F7020332E30003842494D0425000000000010000000000000000000000000000000003842494D03ED000000000010004800000001000100480000000100013842494D042600000000000E000000000000000000003F8000003842494D040D000000000004000000783842494D04190000000000040000001E3842494D03F3000000000009000000000000000001003842494D040A00000000000100003842494D271000000000000A000100000000000000013842494D03F5000000000048002F66660001006C66660006000000000001002F6666000100A1999A0006000000000001003200000001005A00000006000000000001003500000001002D000000060000000000013842494D03F80000000000700000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF03E800003842494D040000000000000200013842494D0402000000000004000000003842494D0408000000000010000000010000024000000240000000003842494D041E000000000004000000003842494D041A00000000034900000006000000000000000000000034000000BE0000000A0055006E007400690074006C00650064002D00330000000100000000000000000000000000000000000000010000000000000000000000BE0000003400000000000000000000000000000000010000000000000000000000000000000000000010000000010000000000006E756C6C0000000200000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000003400000000526768746C6F6E67000000BE00000006736C69636573566C4C73000000014F626A6300000001000000000005736C6963650000001200000007736C69636549446C6F6E67000000000000000767726F757049446C6F6E6700000000000000066F726967696E656E756D0000000C45536C6963654F726967696E0000000D6175746F47656E6572617465640000000054797065656E756D0000000A45536C6963655479706500000000496D672000000006626F756E64734F626A6300000001000000000000526374310000000400000000546F70206C6F6E6700000000000000004C6566746C6F6E67000000000000000042746F6D6C6F6E670000003400000000526768746C6F6E67000000BE0000000375726C54455854000000010000000000006E756C6C54455854000000010000000000004D7367655445585400000001000000000006616C74546167544558540000000100000000000E63656C6C54657874497348544D4C626F6F6C010000000863656C6C546578745445585400000001000000000009686F727A416C69676E656E756D0000000F45536C696365486F727A416C69676E0000000764656661756C740000000976657274416C69676E656E756D0000000F45536C69636556657274416C69676E0000000764656661756C740000000B6267436F6C6F7254797065656E756D0000001145536C6963654247436F6C6F7254797065000000004E6F6E6500000009746F704F75747365746C6F6E67000000000000000A6C6566744F75747365746C6F6E67000000000000000C626F74746F6D4F75747365746C6F6E67000000000000000B72696768744F75747365746C6F6E6700000000003842494D041100000000000101003842494D0414000000000004000000023842494D040C00000000085000000001000000800000002300000180000034800000083400180001FFD8FFE000104A46494600010201004800480000FFED000C41646F62655F434D0002FFEE000E41646F626500648000000001FFDB0084000C08080809080C09090C110B0A0B11150F0C0C0F1518131315131318110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C010D0B0B0D0E0D100E0E10140E0E0E14140E0E0E0E14110C0C0C0C0C11110C0C0C0C0C0C110C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0CFFC00011080023008003012200021101031101FFDD00040008FFC4013F0000010501010101010100000000000000030001020405060708090A0B0100010501010101010100000000000000010002030405060708090A0B1000010401030204020507060805030C33010002110304211231054151611322718132061491A1B14223241552C16233347282D14307259253F0E1F163733516A2B283264493546445C2A3743617D255E265F2B384C3D375E3F3462794A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F637475767778797A7B7C7D7E7F711000202010204040304050607070605350100021103213112044151617122130532819114A1B14223C152D1F0332462E1728292435315637334F1250616A2B283072635C2D2449354A317644555367465E2F2B384C3D375E3F34694A485B495C4D4E4F4A5B5C5D5E5F55666768696A6B6C6D6E6F62737475767778797A7B7C7FFDA000C03010002110311003F00F554961F59FAD98BD2BA8D7D31B8599D4336CA4E49A70AA1616D41DE97AB66F7D3F4ACF67B37FF002FFC1AA9FF003DECFF00E777ADFF00EC2B3FF7A1253D3A4B047D6FC618D897E46067619CDCEAFA7574E4D4DAEC165A37B2E735D66DFB2FFC256FB3FE2D0F27EB8BA8C9B686F41EB178A9EE67AD562835BF692DF52A73EEADCEADF1FA376C494F44B2FEB264F53C5E96FBFA6806D6381B0EDDC5B58FE71EC61FA5FF00A4F7AC7A3FC60D7938ECCAC6E83D66EA2C6EFAECAF198F6B9BFBCC2CC83B96E6275AC6CBEAB97D2EBAEC6DD855D36D8F7B435A45E1CFAC33DDEAEEF67E93D4AAB4E84B8640902547E53B15B92265094448C4915C51F9A2D5FABBF58E9EB14ECB22BCDAC4D950E1C3FD353FF07FF9EBFCC7BF6972FD43EA8BFF006AD19DD2ADFB234BF75DB79ACC13EA50DFA3FA4FE6DF4FD0F7FF00A2531FE303EAE0E8F7F547DB63062DA71ADC47B4372BD605CC651F652E1FA4BB66F67FE0BE97A577A4FCE31589633A485F075C7E0C5CB1CD463987AA06B8C7CB947EF37FEB07D60C7E8F8FDACCBB01F4699FFC12CFDDA9BFF4D47EAC66755CDE9E727A9000D8F9C721BB0BAB81EFD9FB9BBF9BFE42CDC4FAA8EC9EACFEA3D4AE765E33B6D94B6D6963DF237359934B9ACF49947D1FB3ECF7FF0084F4FDF52B19FF005CB1F13A9E4F4CA3A6751EA3761FA7F687E1D2DB18C36B05D5B0B9D6D7EEF4DDFBA9D90E28E310854E46A52C9FF7105B88679E5964C978E11B8C3177FF00593FFB97A249731FF3DECFFE777ADFFEC2B3FF007A16963FD62C5BF27A7E21C7C9A323A95366432ABEBF4DD5369D8DB1994C7BB732CDD66D67A7EAFF0099B140D975524960677D73E998556539F4E4D96E2E633A78C7A981D65B7DAD6DB4FD9C6FD8E658C7FF00847D7FF9EFD44A77D25CC7FCF7B3FF009DDEB7FF00B0ACFF00DE857FA37D633D5721F8EEE97D47A7963378B3368F4EB7410DD8CB5965ADF53DDF41253FFFD0EA3ACE275CC3FAE34F5FC0E9C7A9E39E9E708D75DB5D4F6D9EAFDA37BFED059FA3D9FB9FF9DD8FF9C7F5ABFF009D6BFF00F62F1BFF0026BA549253C9756ABAF75BC7E8D75BD2DF856E1F59C7BEDA1D75563863D6D7FA994E7D6ED9F4ECDBE97F3ABAAB81754F6B4492D200F3853492538DF53B072FA7FD58E9D859959A7268A432DAC904832EEEC2E6A174DE9F9B4FD6EEB39F6D45B8B954E2328B65A438D4DB7D500077A8DD9BFF0039AB7966F5FEB0DE8FD3DD9459EA3DCE15D4D3A0DEE04B779FDCF6A31899484622C93416CE71844CA46A31165366756C0C2C8A31F26E6D76E498ADA7E1F49E7F319BBF47FF0018B84C8FA9BF5A32336DFAE0E6E357F586ABC598BD30358FA1D4D60D2DAEDC876CDD956D7FA4AF277FB3D9FCC7B3EC7A5D07A064758C83D63AC9365561DD5D6F1FCEFEEB9CDFCDC56FF82AFF00C2FF00C4FF003DDA00000008034002933E384088C65C5203D7FBBC5FD562E5B2E4C80CE51E0813FAB1FA7C1FBD26961F56C4CAC8B30C58CFB663B5A6FA98EDCD048F78AAC2DAFD66D4FF0063DFE9FF00C67A6B94FAC3D1F26CEB995958DD133AEF5C57BF2F0FA8B719971631AC6BACC73656E63E9FE63FB1EA7F8447FAC3F572EE9F77ED8E8B357A47D4B2AAC6B59FCEB6967FA277F86A7FF452DDFABBD68759C0F5DCCF4EEADDE9DC1BF44B800EDF5FF21ED77F63FF00044EC9863C032633C50DA57F3427E2B70F3123925872C78320B942BE4C98FF00AAF17FB1FAA77E83D63FF72EDFFD2EB7FA77D52B33FA274AFF009C565E3AC6154F63F229C87B6D0DB0FBA9B722877E9BD8DAB7FD3F7B3F9CFDFEA9250365E2A8FA924F5DCBAEDBBA88E96DA2A38D6FDB6DD6E97FDA38B7D5FA3E9FD356BAAFD53C0C4E8966360F4FBFA9D8FCA665BFF5A35E4FAAD1B5B955E6E43BF9DA5ADD8C66F67FDB9F4FAB49253E6DFB1FAAFF00E51758FF00DCC37FF4BAD5FAA5D33AEE375EB6FBB172F03A59C435BA9CCCC1965F91EA35CCB6BDB65BB36D1BD8BB449253FFD1F55497CAA924A7EAA497CAA924A7EAA557A97F43B3F98FCDFE93FCD7D26FF39FF7CFE5AF97D2446E37FA6E897CA76DBF4BE5FABF54B7E88E38EDC275F2AA4825FAA952E95FD1DFFD1BF9C77F44FE6F9FCFFF0086FF0048BE624911B1DFA792D3F30DBAFF007BFC17EAA497CAA920B9FAA925F2AA4929FAA925F2AA4929FFD93842494D042100000000005500000001010000000F00410064006F00620065002000500068006F0074006F00730068006F00700000001300410064006F00620065002000500068006F0074006F00730068006F007000200037002E003000000001003842494D04060000000000070008000000010100FFE11248687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F003C3F787061636B657420626567696E3D27EFBBBF272069643D2757354D304D7043656869487A7265537A4E54637A6B633964273F3E0A3C3F61646F62652D7861702D66696C74657273206573633D224352223F3E0A3C783A7861706D65746120786D6C6E733A783D2761646F62653A6E733A6D6574612F2720783A786170746B3D27584D5020746F6F6C6B697420322E382E322D33332C206672616D65776F726B20312E35273E0A3C7264663A52444620786D6C6E733A7264663D27687474703A2F2F7777772E77332E6F72672F313939392F30322F32322D7264662D73796E7461782D6E73232720786D6C6E733A69583D27687474703A2F2F6E732E61646F62652E636F6D2F69582F312E302F273E0A0A203C7264663A4465736372697074696F6E2061626F75743D27757569643A31303566323238342D383834302D313164632D626335662D653434313031353832383764270A2020786D6C6E733A7861704D4D3D27687474703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F6D6D2F273E0A20203C7861704D4D3A446F63756D656E7449443E61646F62653A646F6369643A70686F746F73686F703A30343065636236632D383833612D313164632D626335662D6534343130313538323837643C2F7861704D4D3A446F63756D656E7449443E0A203C2F7264663A4465736372697074696F6E3E0A0A3C2F7264663A5244463E0A3C2F783A7861706D6574613E0A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020200A3C3F787061636B657420656E643D2777273F3EFFEE000E41646F626500644000000001FFDB008400010101010101010101010101010101010101010101010101010101010101010101010101010101010101010202020202020202020202030303030303030303030101010101010101010101020201020203030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303030303FFC0001108003400BE03011100021101031101FFDD00040018FFC401A20000000602030100000000000000000000070806050409030A0201000B0100000603010101000000000000000000060504030702080109000A0B1000020103040103030203030302060975010203041105120621071322000831144132231509514216612433175271811862912543A1B1F02634720A19C1D13527E1533682F192A24454734546374763285556571AB2C2D2E2F2648374938465A3B3C3D3E3293866F3752A393A48494A58595A6768696A767778797A85868788898A9495969798999AA4A5A6A7A8A9AAB4B5B6B7B8B9BAC4C5C6C7C8C9CAD4D5D6D7D8D9DAE4E5E6E7E8E9EAF4F5F6F7F8F9FA110002010302040403050404040606056D010203110421120531060022134151073261147108428123911552A162163309B124C1D14372F017E18234259253186344F1A2B226351954364564270A7383934674C2D2E2F255657556378485A3B3C3D3E3F3291A94A4B4C4D4E4F495A5B5C5D5E5F52847576638768696A6B6C6D6E6F667778797A7B7C7D7E7F7485868788898A8B8C8D8E8F839495969798999A9B9C9D9E9F92A3A4A5A6A7A8A9AAABACADAEAFAFFDA000C03010002110311003F00DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD5427F312FE663B9FE14F67F5EF5E6D8EADC2EF71B8F688DEF9FC8EE1CCE47151B63A7CD65B074B87C13E3E09D69F2092E1259669E649A35592355898962323BD98F636C3DD1D877ADE6FB7F96D0C173E046B1A2BF708D242EFA88AAD1C00AA54921BB863AC30FBCB7DE9B76F62B9AF96B96B69E5382FC5D597D54AF348F18D06592258E2D00D1C189999D830019404393D1EFF008BDF283ABFE59757633B37ACF27AD1BC743BA36C56BC4BB87656E258564ABC0E7A9237631CA84EAA79D6F055C056589882408979EF90F7FF006F37E9F62DFA0EF1DD14AA0F873C75A092327CBC994F723555B3C720FDA7F76394FDE1E53B5E6AE55BAAA9A2CF0311E35ACD4AB452A8F3F3471D922D1D0D2A018CF60BEA4CEBDEFDD7BA8B5B5B478CA3ABC8E46AE9A831F414D3D6D75756CF152D1D151D2C4D354D5D5D4CCC90D352D3428CF248ECA888A5988009F778A29679638618D9E6760AAAA0966626800032493800649E9A9E782D609AE6E6648EDA342CEEC42AAAA8AB3331A05550092490001538EA83BB73F9E5ED9DB7DD91EC8EA3EADA5ECAEB1C6E76830B93DF553B82AB1392DD05EAD69B2959B2F1898E9A14A088C80514D5458D6E9D5A224653EF2EF97BEEA77F7BCACDBAF316FC6C77E788BAC0235758B1551336A04B11F1AA01A386A620F5CEFE72FBFD6D5B673E2EC5C9BCA69BA72A4570B13DD34CD1BCFDDA5DAD93410107FA13495F1295D2AA4757F2A75007FAFF008588E7E845CFA97E87FC7DE20F5D15EB97BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBDEFDD7BAF7BF75EEBFFFD0DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD126F9BFF00093AF3E6875B7F77B3AD0EDDEC5DB90D6D475B761C34C25ACDBF92A84479719938D34C993DAD97929E31574D7D4A556684ACA8A4CA3ED5FBA5BCFB61BE0BDB4ACDB34E545CDB9341228AD197C965404946E1F85AAA71047BF5EC3F2DFBE5CAE76DDC34DB732DAAB3595E05AB42E684A38E2F0484012271140E843815D50B607607C96FE58DF25B234B57415581DD380A8831DBD765E465A89367764ED092679219054C6A62C9E1F2504667C664E01E6A4949650196780F42778D9F91BDF6E4686449C4D61302D04EA078D6D35286A0E55D4D165898D1D7D4696EB901CBBCC5EE97DD53DD2B98A5B66B6DDED9825D5AB926DAF6D89A8C8C3C6E2AD04EA3546D91421D0EE13F183E50F57FCB1EB0C6766759E4B547278E8B736D8AE9615DC7B2B70AC41EB3059FA346F43C64EA82A12F055C25648C9526DCD9E7CE43DFBDBCDFE7D877D828D968A55AF873C75A092327CBC997E246ED615E3DAAF69FDD7E53F78794ED79AB956EAAA68B3C0C478D6B352AD14AA3CFCD1C7648946434A8060EBABA8B19455792C95652E3F1F414D3565757D75445494545494D1B4D515557553BC7053D341121677760AAA092401EC1F1452CF2C7041133CCEC02AA825989C0000C924E00193D48D717105A4135D5D4E915B46A59DDC855555152CCC480AA06492400327AD51BF99E7F33CA8EF9A8CA742741E5EA68BA6286ABEDB786F2A379A92ABB52B699EED414458C1353EC0A5957522BA86CAC8A24602054593A0DEC47B109CA496FCDFCDF6C1B9A18030C26845A039D4DE46E08FCA304A8AB124720FEF5BF7AC93DC296EFDBCF6EEF59391A36D37372B556BF65FC0BC08B453900E67601880814319EFE56BFCAF1B03FDDDF931F24B00C99D51459CEA9EAECC53E893022CB518FDF1BDB1F50AA17321AD36371B329FB2B2D44EBF73A23A7007BFBEFC8BC37DC8FC917DFE27431DDDD21C3F10D0C07868F29251F1E55494AB34B1F74BFBA71DBFF00767BA5EE8ED94BFED976FB0957FB2E0C97574847F6BC1A081BFB2C4920F174AC7B12FD3FDE7F24FD4DFF003EF0D3AE9575EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7FFFD1D977F9CF7F345DE3FCB2FA7FACB2FD63D4F8BED3ED7EF0DE35BB2BAFA3DD75B534BB170991C4CDB766AE9773C18BAFC465F20D90A2CE18A8A182B29079D4BCB288D0ABE86582F9509FC811FE7F3FE7C0EC52A0134AFF009ABF9F0F2E88D7FB363FF0A89E3FEC5B5F0F4DC5C11D8584208362391F2C2DF4F77A2E38918F31F9F979D3F2A9F952C40CE9D3C0FAF1F2F3F2F3F5E38E07DFECD8FF00C2A27FEF5B5F0FBFF460E13FC3FF0002BFFAFBD507CEBF68FF0037A0FE67E43ADE2BC1695F9F0A1F9F1AD0D7D314C549D6E8AF971FCD3305F17BE65F697CF2F87DD4BD13BF7A27A477EF6CF4C667646F9C4EEBD85D855FB4B61EEDDC72ED9DD9B5F0BDA1BDF7361DF1594C0D234B531E4A18EBA92B5D235A7969F5CDA6AF045CF954FECAD387CC81F9797546017B8B0228380FDBE67F21FCFA43F52FF304FE623F247F9547C7AF96FF0017BE29F55F76FCAAEEDCEEEFC766B64A6EE87AFBA8FAFB6E6DADF7D8DB68EF2A8A4DEDD838ACF6E30F06D0C7D28C6D3E6E39DEAF20F51E55821689BD8AD2A2A29F3F43F215FCFF00CA05C85D43145CFF00224799AFE7C3F68E897764FCF3FF00852E75375E6FCED5DFBFCBB3E1EE0B62F5A6CDDD1BFF0079E6577AD1E44E276A6CFC3576E2DC1931418EF9535B92AE38FC3E3A693C34F14B34BA34A233900DBB704834C798F957CBFE2BF6534079556B9F5F953CFCB35F5FE8F008EF8FBFCCBFFE1465F293A7B64F7DF47FF2FF00F881BC7AAFB128F2190DA1B95B750C0B6568F159AC9EDDAD94E2770FCA0C56668BC597C3D447A67A789884D40692A4FA806335FB47CBE5F6FEDFB29BA0AF05A57E7C29F6F1AD73E800A66BD5946C2F99DFCCF3607C1BF9B9DEBF387E22F53F44F717C74E9EDEBDABD3F36D8DEB8CDDFD65D9E36EECADD3B87F8367F6EEDCECDDE5BA7053EDFCA6029D2ADCE5604C853E45053986486426A46680E3CBD7FCDFC87D9D680154A915C5695FCFF2FCEBD1D4FE5A3F2777CFCCCF833F1E3E4E765E1F6A6DFDF3DBBB532BB83706176452E628B6C63A6A5DDFB8F09450E32933F95CD6629C362F1503CAB3D54CDE66720852A078F16F4A9FE448FCFEDEAA411C78FECFF0F53BE6E7C20EB6F9A5D79FC077088B6DF626DE86A26EBEEC7A5A259F2380AB948924C564E357864CC6D5CA491815546D22956B4D1324AA18CA3ED6FBA9BE7B63BC9BBB2266D9A6205C5B16A2C807074241092A7E17A1FE16054D3A81FDF8F61795FDF2E5B1B7EE416D7996D813677AAB57858E4C72004192DE43F1C75143DE855C54D507CAAF9EBB07F919766FC49E8E6F89F995F889D9F879A83B9FE59E26086B33957BEA00D4513C7478A59AB33FB976EA46F98CAD1645A296A71159E3C1C4E6865808679CF9D79879EF7DBADE77CBF791D9D8A4649D1121388E15AE94551A460558E5CEA3A88E3DB3F6BF94BDACE58B1E5AE53DB2181238904B2851E35CC8A28D34F27C4EECC4B64E94D5A115102A87AF99FF00CF8BA6369F747C78F89FF0D3ADF15FCC27B2FBFF0033B4DB7BED4EB8CDE2F31B571DD4BBCB1FFC42AB154F9755ABDBD93DF39BDAD546B4D1D73262F138C492A331241090A42F04F3DBCC9736F3B43344C195C1656565229A4AE5581A10464114156C7437BAB6B6BDB49ED6F2DE39AC66428E8EAAE922B290C8CAD55656150C082083914AD0EAECDFE545F1C369FCA1AFF9170E1615DBB4E984CF6CAE9A5A2A78F67ED0DFB04953265370344269E1ADC7D34894D538EC7285A5A3ADF3483C918A68E19DB71FBC273BEE1EDFC1C9925C1FAD6D71CF7953E34B6E69A22AD70D42CB2C9F13A051825CB62AECBF73FF006C366F76EEBDCA86C97F75A7852DAEDA140B682ED4B179B4FE240423C10E12290B9A1511AA2F7F9A5FCDDAEFE5E1F09FB5FE5361F6450F616E2D9D3ECFC1ED9DAD97C8CD89C254EE2DF1BB70FB471B5B9FADA30F58D89C4CB97FB9960A7D13D578442924264F34702F9AAF99FF0020273F90EB2D146A20569D537ED7F9ADFF000A70DE7B6B6EEF0DBBFCB8FE1FD66DFDD782C46E5C155B6FAC6D2B5561F3B414F94C6D4352D67CAC86AE99A6A2AA4631CA892C6495750C081B42AEAAFA585456848F960F1F9D73E78A608B10B5214A95C673EB93C4711C3029E75AD03EFF00B363FF000A89FF00BD6D7C3EFF00D18384FF0061FF007361EEC02E2A0F9798F957CBCF3F657ECA6A9FE96B9F5FCBCFCB35F5C70EAC1BF97F7C82FE6D3BF37B6F7C07F319F857D5BD19B229769556E1D93D97D41D89B67314CF9EC6D6504351B2F70ED25ED9EC9CECD2E5F1B59355D264617A6A781A85E198334D1B8A9000AFCBE5F3FE5C07AFF93469FEAFCBE79F3E007D9E7D2BBF945FF304DD3FCCABE356F6F90FB9B60603AD61A0EFFEC7EB5DABB63055B93C9C90ECEDAF8FDA993C0D4E7F279170991DCB243B8992B26A58A9A91DE3063863E57DF8AB2B32B10483E5FEAFF37D9D501A80470201FDA2BD5A67BF75BEAAAFF99AFF0030CDCBF00333F0B2A71BD7F87DFF00B4BE45FC9EDBDD0FD830554F94A4DC181C06E7A09160DC1B3AA28663472677155CCB3FDAD5413475D0C4F02B53BB8A88A8CDA4E7E1D24FECA7F9FAF509AFA015FD94FB3CB874443E647F34EFE6371FF30EECCF803FCB7FE27F4DF756E9E8EEA9DA5D99D9397ED9DCEF8EAAAEA2DD78ED9D953598013F65757E1A8315888FB0B1348F1C93D6D6545549248AA90A7375A36A26B4069E9E47D466983518AE09AD40B01C09F3F5078022B90718A800FDBC07482FF66C7FE1513FF7ADAF87DF9FF9A8384FF1B7FDCD87E3DDA8BE87F68FCFCBE78FB056B9EB74FF004B5CFAFCA9E7E59AFAFCBCB245F2CBFE150AB2C6D37F2D6F8812C2B2234B12F62E12269220D778D65FF66B64F1B3AF01B4B5BFA1F7EA0F43FB47FABFE281F51D6E80FF00081F9FA7DBEB9AFA629E62F23FD2C7C9FF00F64ECF6CFF00B2C3FF003969FE8C3F8BFF00B2B9FE92B667D81ED7F17D9FF7487687F16FEE9FF767F8A7F94FDFFDC793F877F63EE3F6BDB7DD4A506AAD3E54AD2BFB334E3E5C7A6FF23FCBFCF4FE7D7FFFD2B12FF8561A4B49D7BF03B70D4524FF00C076F7786EFADCFE70D255CD4384A42DD6AC86BEA60A7A8A5A48EA844E57CA85A4F0954BFAD5B40F7915C943FE15EB5425D00E39FF008EB756BFFF000FF5FCA0071FECEC6C836BFF00CC0DDC6C4E9125EC7FD1C92DC466DF5BDC7FAA5BEFD3AB696FE13FB0F5E3FCFEBF9408BDFE6BEC8E2FF4D8BDC67E9E4FA5BAE0DEFE336B7D6E2DFA96FECFA75ED2DFC27F61EB0F6C7F30BF86BF38BE0E7F30CC57C56EEFC3770D6F5D7C40EF0AFDE91E176DEF8C44580A6DC3D53D8B4F826AAAADD9B5B05492C9939F0557E2485E490AD3BBD8280DEFD5EE8C79EA1FE11F2FF57F31A60555AA08C1FF00074C7FF09DFF00FB73B7C39FFB5576E7FEFF00BED2FF005FFDF7FB7F766356E3E43FC03E67FC9F6756614F2F36FF008F1F90FF0007E67893B3FCC7FF00EDDEBF3ABFF14FBE49FF00EF9DDE3EE87871A7FABFCBFEAAF0EB71FC43F3FF00074513FE13FF00FF006E7FF853FF008667607FEFE8ECAFF5BDD8F1EAADF137DA7FC3D18CFE6B66DFCB2FE7EF36FF009C41F9043EB6FAF58EE416BEB4FAFF00AFCFF43F43AF31F68EB6BF12FDA3A017F90AD87F289F84614C25475C6E31780A90597B377CACAF2944893EE6498334A028D32165E48D4740D751A799FF0009EBCDF11FB7AB73A8961A7826A8A8923820862792A2799E38E28608D59E496692522348A24BB3163600127DD9559D951149726800C924F00079F4D4922448F2CAE163504924D0003249270001924F0EB58EFF008513FCBECC556CCD9BFCACBA6FE33657E427C89F9A38CA06DA9267B65D4E4F676D2C3459AACA48B71EC9CA562D3D0D7F68612BB132542D72544545B4E8D4E4B233245E38E5A100D0B1A229049F3F953EDE07D780E38706086AF0E1EA4D09A0FB687FC1F6534FC40EB9F905FF0009BBF9BBD795BF2BBA0B6DF7474F7CB4DBBB4BACA93BDBA876F6577BEF0D85BAF252D0D566B6875DD4AE3A3CDD4E6A833959E2CA6DD4A58AA775E3E9A9AB31CD2CD48D461B6A33894AD2455F33E5C4D3C81F22719A0248A10FB3F891950694CD3D7E7F97CF033C2B53F40182BA92AA468219D0CEB4D4D5725312D156414D58D32D34B53492AA54D22549A69153C8AA58C6E0728D65051C2AB943E1B1201A1A1229500F0A8A8A8F98E92096232C908914CCA012A082406A852471018AB50F03A4D381EABC3F9B06C0F88DD9DF04FB93687CE0DFD94EA9F8F3937D949B8BB3B0B4F959F31B1371B6F7DBD16C3CF63D315B7F744E661BCE5A1A76496866A6992768A6D31BB30A1AD3B4F77D95FF0057E543F3E9C15D4A456A0FFABEDFF51F2EB514A0EB0FE54388A0A3C6637FE1473F30B198AC6D2C38EC6E3B1CBDDD4B474143410FDBD2515150536DF8E1A4A3A6A6A7090C71A88D5155505B48F75D39CC6B5FF4BD39A9FF00DF63FDE4F530EC0FE55A2F7FF8523FCD0E2FF493BD4FD3C9F4B60CDEFE336B7D6E2DFA96FBD1FF000B5FF79FF67AF6A93FDF63F61E8E07F24BEDCA9C6FF35AEECF8C7D0FF3A3BB7E74FC37AEF8A553BEA7DDFDB191DE997A2A7EC3A1DC7B0688C98EA0DE31C536D8A8C7A6E4AFA17681208ABD25FDC133451347B453473A0281E98AF0CD3F6FCF18C1EA8E58786D4A316FE5426BEA28401E99F5A746F17FE1331B2B67E5F74C1D0FFCC2FE6A742F5BE777566373E27AC763EF2FB4C16DD7CCCCB24B4B14D8BAFC10CA3D2C514704753510355C94F0C6B34B2BA191BC416A5429F99153F3F4E273D7958A8034AFECFD9E7E9FEA1D5536C7FE5B1DBDBB3F9BEF70FF002D7A8FE661F3769764F5B7C6AC7778D0763D2F676E997765766EB64EAF47DBB91C64BBB3F845363D23DFB348B32AF9184310D2439635D229FD9A541F4E38AF4E16ECAD175569D5C3F5C7FC26F7AEB17DBFD47D9BDF1F38FE5CFC9CC1F4EEF9C3F62EDFEB6ED3DD51E4B6C56EE7DBF570E4312D5F2E4AAF37534F8C35D4909AC8A9053CD5902984CC88C49F69C528A079D0509FCFAA78872348FD9D160FE6CFD2BFCAA6B7E7AEF5ED1ECDFE677DCFF02BE5664F60EC8DB3DBB80EAEA2EC653BA708B80DBF3ECCCABE576F6D298C50566D8A0C5C7530D2E467C7CAD8F81DE286AA19D9F67BB014103D413FEAFCBAD29715A0A8F98AD3ECA7F96BD57926C0FE560C06AFF8522FCCE5242F026EF622EDE3FA96C047603CA3EBF4E6F6D2D6F68FF85AFF00BCF57D4FFEFB1FEF27A0A7BDF19F00761F4B7696F7E8EFF85067CCBECEEE2DABB137367FABFAEE7CC777E0E3DE9BEF1785A9C86D8DB72E5AA31F8E8F191E5B2B1450B4ED3C222D47D6185BDED53B810AA08FE8FA7E7FF15C7AD12E680C20824038F22687F60CF5B10FFB355F283FE81B53F2A3FBFF00BDBFD996FF00652FF8EFFA51FE1C7FBF266FEF87F76BFBF224D3E5FE27FDC8FF002DFE336F2DBFDC95F573EEB534A7F4A9F96AA7F83F9FEDEB54FD4A7957AFFFD3DF0FB0FADBAEFB7368E5F6076AEC4D9DD95B173F1470E7366EFCDB586DDDB5F2F1433C75302647039EA3AFC6567DBD54292C664898C72A2BAD99411EF9F9F5A20114231D1451FCAE7F96D8000F81BF11800A1401F1FBAC05800547D36D7F43FEBFFB61EECAEC8AA8AC428140060003C875E655725990163C4902A7E64FAE78F1EBDFF0D75FCB73FEF03BE23F37FF00B97FEB01F5D5FF0066D71FA8FF00BC7F41EF7E2C9FC67F6F5AF0E3FF007DAFEC1FE6FF0057E43A1E360FC5CF8D9D57B0376754F59741F4F75F75A6FDA6CA516F8D85B33AE769EDADA7BC293378F9F1396A6DCF82C3E2A8F1F9D87218AA9929A55AA8E50F4EE633E836F746EFD5AF351435CD470A7D9F2E1D6C00294500035E03EDE97BD69D61D73D35B2709D6DD4BB1B6AF5B75F6DA4AC8F6F6CAD9382C76DADB1848F2190ABCB57A62F0B89A7A5C7D12D6E52BA7A897C71AF92799DDAECC49D924E49A9EB7E400181D3F6E7DB1B737AEDBDC1B3B7860B13BA369EECC2E536DEE7DB59EA0A5CAE0F706DFCE50CF8CCCE13338BAD8E6A3C8E2F298FA9920A8825468E589D9581048F7AE1D6C120D471E993AE3AD7AF7A7F65607ADFAA7646D6EB9EBFDAF054D36DCD97B2B078EDB7B63074F595D5594AC8B1584C4D3D2E3E892AF255D3544BE38D7C93CCEED76624FBED3D68000500C74E9BBF686D5EC0DABB8B636F9DB984DDFB377761B23B7774ED6DC98CA2CD6DFDC381CBD2C94594C366B119186A283278CC851CCF14D04D1BC7246C558106DEFDE87CFAF7E5D33EC8D8BD6FD2DB0B17B27AFB6B6D2EB2EB5D938DAB5C46DADB38BC66D7DA3B6312B355656BCD1E3A862A4C662E8854544D51315544D6EEEDC927DDE38E496448A246695D8000024B3138000A9249381C49E9A9A686DA19679E558EDE352CCCC42AAAA8A96626802802A49A00054E3AD5EFF99EFF0033EA9EF2AACCF41F4066AA28FA6A8AA1E87796F3A19A4A6A9ED4AAA595C498FC7B829341B0609A3E07A5B2CC03BFF9368497A0BEC47B111F29C76DCE3CDF6C1F9A1D434303656D01E0CC381B823FE710C0EFA95E427DEB7EF5B373FCB7BEDD7B757CD1F23C6C56E6E50956DC194E510E08B30470E3707B9BF4E81AEA3F972A7C8CDDBD09B0B777CAFDB3B58EEBC2628E3FA8B3D93C378FB621D8991A3A7A7A9ACDE3354C6EB89AEDC1474146BA60F055565353C7257A34C431C55F7B6D3902D39DEFE1E4391DE10EE6E2855ADD6627B96D8F1D20EAD79281BB633A45067A7DD7EFBDDBDC3DB0DA6E7DD8B7892E7C38C5996565BC7B60A423DE29ED0ECBA3C3A0591906B986B6A93DDBC30099EC3C860C36D6CC6E1C33B67B659DE18D192C3E2B79E3E9AA0EDECC49A2296BA81E8AB2517A9A4D357146CFE260C7989ED85A1B9B6FAF57366245D7A34EBD351AB46AEDD74AE9AE2B4AE3AC81BF17C6C6F3F76783FBCBC26F0BC5D5E1789A4E8F1347768D54D5A7BB4D699EB4FDDEFF0031FE6CFC60F9D3BCBB53B7A3147D9626A3C06F7EB790545275E6E8EB8A2677C360B6E287AB48F6CA52835388CA40D354254C8F3C8D34B255C72F4A769F6CFDAEE7BF69F6DD83971F5ECBA5A482E450DC4572477BC8680F89ABB6689A8A5688A142C6578A1BFF00BDDEFB7B53F780DEB9BB9D13C3E680CB0DD591AAD9CF64A7F4E284558783A7BEDEE10B38726472ECF32BED13D25DD5D11F397A2DF7061E8305BE7626EEC74DB777F75CEF4C4E2B3631759514711CCECBDF3B6EBE3ADC655911540255D24A5ABA791258CBC6EA4F3FF9E391F7DE41DFAE360DFEDF4CCBDD1C82BE1CB1D7B648DB1507CFF12B55480475D74F6B7DD2E54F77794ECF9B3952EF5DBBF6CD0B53C5B698005A199734615A839591487425483D065FF0D75FCB73F3F03FE23926F727E3FF00585D89D5A9988DB42EEC58927EA4F3F5B7B092BB28A2B102A4E3D49A93F99353EA73D48ACAAC6AC809A01C0700283F60C7ECF41D7BFE1AEBF96E7FDE077C47E6FF00F72FFD603EBABFECDAE3F51FF78FE83DEFC593F8CFEDEB5E1C7FEFB5FD83FCDFEAFC8743DF4BFC61F8E1F1C63CE45F1FFA1BA83A55373C94B26E3FF45BD77B5362BE79A844A287F8C4BB6F158E97249422793C2B31758BC8DA00D4D7AB12C6AC6A7AD8007C2A00F90A743A7BD75BE829A1E8AE97C6F6EE63BFB1FD55D7F45DDFB836EC3B4739DB74DB4B090F6265F6B53FF0F106DEC86EF4A219DAAC3443134A053B4E62FF00278FD3E85B7A9D7BA15BDFBAF745DBB97E227C56F91597C4EE0EFCF8E3D21DCD9EC15036270D9BECEEAFD9BBDB2F8CC534F2D51C65164B70E1F215B4F8E1555124A2057112CB233850CCC4F876B071F1D295F3A71A57D2BE5D78E40072BE8723F670F334F4A9F5E819FF0086B9FE5B7FF781BF11AE4004FF00B2FDD61A880A540D5FDDABD8027FD8F3F5E7DDB5B062DA8EA200AF9D05682BF2A9A7DA7D7AD695D21340D20934A0E24004FE600AFD83ACB1FF002C0FE5C114B14D1FC0EF888B2C32C7344DFECBD75636896275963701B6C117491011FE23DECC8E78B1EB7451C1147FB51FE6E8E7FF0076B6E7F773FB9DFDDFC27F747F827F76BFBABFC2A83FBB9FDDCFB0FE17FDDFFE07E0FE19FC13F867F937DA78BC1E0FDBD3A38F74A0A53CBAF75FFFD4DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD6BABFCF27E4EF69ECFAAD95F1AF6ACD59B6F60EFCD96BBCF7B676885453D66EF5FE3D96C3C7B2D320924718C2D02E312AB214E977A935102C85620C92E67FDD5391360DC9374E77DC1566DDAD2E7C1810D0887B11CCFA78F88DA8AC6C70A15C8058D579A3F7F9F7579B7659762F6BB6877B5E5EDC2C7EA6EA55D41AE7F564885B6BAD3C24D02495065CBC61884043C1FE571FCAE7ED976EFC96F92DB6FFCA5569337D53D559BA53A69ED6A8C6EF7DEF8C9E3D5F746EB36371B32131DD6A275D7E3891EF7EFDFCF105EF237235EFE9E52EEED0F1F2682061E5C44B28E394434D44A7FBA67DD33C2FDD9EE97BA5B67EAF6CB61612AF0F34BABA43E7C1A08186312482BA546C6C07E4817BDFE82E0DAC2FC9F505E2F7F7855D74DBAECFD2F7B01C93C7D0726F7B8B11EF47EDEBDD11CF9C5F06FAEFE6875E9C466169B6EF66EDCA6A99FAEBB163A40F5588AC7D5236133821026CAED2C9CA144F4E6EF031F3C1FB8183CADED4FBADBCFB61BD0B9B7D53EC33B0FA9B62681C0C6B4AE16641F0B7061DAF553880FDFDF60B96BDF2E5AFA3BC096BCD76A8C6CAF42D5A3639F0A5A664B790FC69C50FEA47460436AD7D21BD3E4C7F2E6F9694BB4E5C4E4B0DB9FFBC585DABBEFAFE759EB76FF00656D5C864920A16A2106A5C9455AB56D3E17254C0C914EFE9BAB4F0499F3CD5B5722FBD5EDE3EE297092D8F8124B05C0A2C96D22AD5B556A50A91A668DB0C07976B8E4AF21EFBEEA7DD9BDE18B677B3960DD7EA62B7BAB36D4F0DEC0EE02940B8903062F6D32772B1C60C91B6EEE3900DC1B81C8FA1FF11C9E0FBE58F5DE6EBBF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7FFD5DFE3DFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD21F787FA35F3E0FF00BFFF00DC7FB9FBD6FEEDFF007C3F8079FF0088695D7FC0FF008D7EE7DEE9B5FEDFD76B7B35DB7F7DE8BAFDD1F55E1E9FD5F07C4A69FE9E8FC3FE9B1D07F7BFEAB78961FD64FDDFE2EBFD1FA9F06BAFCFC2F173ABFD267A5C7B2AE841D7BDFBAF75EF7EEBDD7BDFBAF741B6E9FF00441FDE9DA9FDF5FF0046DFDF6FB887FB8DFDE9FEEC7F7A7EEBC93FDBFF00753F8B7FB96FB8F2F9347D9FAB56AB737F677B7FF58FF77DFF00EEAFAEFDD543E3F85E2F854A0AF8BA3B294A575F953E5D05F77FEA5FEF7DA3F7F7EEBFDFDA87D2FD4781F51AAA69F4FE27EA56BAA9E1E6B5A79F424FB24E851D7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75EF7EEBDD7BDFBAF75FFFD9,'name1',NULL,NULL,1),
 (6,NULL,0x4749463839618F003000C400005256877793B2EEF1F5BBC9D8DDE4EC335D8BCCD6E2F0EFF4446A9555789E444C8088A0BBA7A3BF11427899AEC560618F223B73E1DFE99895B56E6D98AABBCF344379224F816685A8B5B2C9D2D0DE7C7AA18A87ABC3C1D4FFFFFF00346E00000021F90400000000002C000000008F0030000005FFA0278E64699E68AAAE6CEBBE302A71746DDF78AEEF7CEFFFC0A0B02611D136C8A472C96C3A9FD0A8744AAD5A3734E326C6ED7ABF602F561B2E9BCF68D6D8C3D9A6DFF03877DD96DBEFF811DD9D673D900A771000847D287B2D0C1D1D45278B7C6C1D1C2D0A118B1D1872158A970712108624882C078B11288F241C922C0A1D9E1B1800710AA58C1B9C19A0A11EA32A0F971D8126A923AB932B961378AB1DB3221A8B0CBCBDC8752B8A188B8D25C546AC2A008B78E29825961D15BCBE29A50FDAA7C41D90C72BC01D28831300EA2BCF2712162D2311B0C340138300EC2A9150210C7627801DF03061D13012DE22213B512ED846089C2E71D8556106AB09B650FF34FB27E2DE3411E500A05C74E0A28882340FAAB106E944360F15A4C9A307EE44055C8F360C84904152A007967479E8C8A1D6A20C28529628B7B15CC00CE832E97915A8A23317104D941AD87462B779AA8AA2285722603C11AEE0C294C4E1C0037EA8C66D5DD4F5D24B4B6E4594E2D654EC4E3229EEEDDAB0E8C15BA21BE70A16014160097823C49562E9687368C2A73BDC6D963A438D529955A425A128022100D13ABC1C91B15E38D3E56CF6DA5C6E778A4B26B8A6E6C67AAFEE253A65F354612B18CDCB716327379DDB04657CCEFBA96826BC786ACBDFC04FAD2C663A8A7B4B9AA117D15B2E47D3F7847F4F9D88BDA8451AA4F64F73EB31D21E643E758015FF092E61A4D737DA0DA69E077945A78D63E2DCA58259C679D0543A021AB35967AA1DC8464F242CA6D62B0E62E68F691E589259501DCC97A10BE85CA45C88E9C5F56009351CE29E09F999C0C97CF545185A6E84F4E312280034B51B6E8B10B29066AAED33D301E21538A0697931A24E0548C2A8C79025D4760287BCFDE85B60C1F0315330DC7860DD59FEA0734906E55529E28453E9B98863C89D301B850008C719213A023682028986735B932440F087525D4E35A9432D008084068A7A90D042909206D3A72CDD262482D4B4EAEAAA27BE2AEBAC221C4AEBAD77D88AEBAE6F1C7AE7AFC0062BECB0C4166BECB1C8C27A0DAFCCCAA16BB3D09AB86CB4D486F16CFFB5D8AE60AB008B14908009091820820016946040032F90FB050501A4100001047CDBC5050608E000021D08D06EB8045CE0C1020B7850000116701BB0A1689250007808885B42001478806F09138FD0400001A06BC2C260188080C518A30B3118019C2B02C4F822404003167460C100ED063040022B77F0B177098F708100272FD0B001038800B307170CF0F3000D704B40014027D0C1CC0600DD8003022C704107407B003101EF224DB5CF5107EDC1D4DD7EED34D21E085080080550A0EFCB030CB080BE0244DDC0C01ECC6CF3087113B000BBF4A5EC8103181BCD33C2AC9210C02232632C80D3E37EBC00E18FE33379DA03E84B80D6953B40000572576EA7FF039E3BED39E801883EB80309D8FB39CC9B0BAC9E0008E09BBAD38D77B0300210B77CB5D0A977F0EDDE05A80D9E01175080F5DA88C77AC2D0761600B3CC8137400002D3070D33BEDF0E9D7D070EA09BFDC20D202F33F8E2174E5FB803A09F77BBB2973B31C4142C4073DAF622C033BB6EB7FC71BC1D58C0E6047081F2056062C5B39EBC9485221110601105F3C0D21600BF9D714D8205A0E0E0743780782D0D83145C40070836C100244F8216209C08499841F879CE000158A1053E78B2BA25C06DE15B5A0C0B062F02FEEB6911A3D7D312F8B881E94B042234C0B7D4269DC4650B0E0D70D93A72F6C434148F1AD7AAA2166B45C52D7AF14C4EFCA218E9D0861F2B98F18C684CA31ACF98050FCC6008708CA31CE748C739D6498C783C410800003B,'name2',NULL,NULL,2);
/*!40000 ALTER TABLE `tbl_logo` ENABLE KEYS */;


--
-- Definition of table `tbl_os`
--

DROP TABLE IF EXISTS `tbl_os`;
CREATE TABLE `tbl_os` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_os`
--

/*!40000 ALTER TABLE `tbl_os` DISABLE KEYS */;
INSERT INTO `tbl_os` (`id`,`name`) VALUES 
 (1,'Windows XP/200X'),
 (2,'Windows Server'),
 (3,'Solaris'),
 (4,'Linux-Server'),
 (5,'Linux-Desktop'),
 (6,'FreeBSD '),
 (7,'Mac OS X'),
 (8,'HP-UX'),
 (9,'IBM AIX'),
 (10,'SGI Irix'),
 (11,'Unix Freeform Version');
/*!40000 ALTER TABLE `tbl_os` ENABLE KEYS */;


--
-- Definition of table `tbl_phone`
--

DROP TABLE IF EXISTS `tbl_phone`;
CREATE TABLE `tbl_phone` (
  `phoneId` bigint(20) NOT NULL auto_increment,
  `companyId` bigint(20) default NULL,
  `userId` bigint(20) default NULL,
  `userName` varchar(75) default NULL,
  `createDate` datetime default NULL,
  `modifiedDate` datetime default NULL,
  `number_` varchar(75) default NULL,
  `extension` varchar(75) default NULL,
  `typeId` int(11) default NULL,
  PRIMARY KEY  (`phoneId`),
  KEY `IX_9F704A14` (`companyId`),
  KEY `IX_F202B9CE` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_phone`
--

/*!40000 ALTER TABLE `tbl_phone` DISABLE KEYS */;
INSERT INTO `tbl_phone` (`phoneId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`number_`,`extension`,`typeId`) VALUES 
 (1,1,NULL,NULL,NULL,NULL,'123233 3231','122',NULL),
 (2,1,NULL,NULL,NULL,NULL,'444 4324 2423','22',NULL),
 (3,NULL,NULL,NULL,NULL,NULL,'1231231232','23',NULL),
 (4,NULL,NULL,NULL,NULL,NULL,'213 2133 ','11',NULL),
 (5,NULL,NULL,NULL,NULL,NULL,'123 321',NULL,1),
 (6,NULL,NULL,NULL,NULL,NULL,'111111111',NULL,2),
 (7,NULL,NULL,NULL,NULL,NULL,'11111',NULL,2),
 (8,NULL,NULL,NULL,NULL,NULL,'121212',NULL,1),
 (9,NULL,NULL,NULL,NULL,NULL,'222222',NULL,1),
 (10,NULL,NULL,NULL,NULL,NULL,'2122',NULL,2),
 (11,NULL,NULL,NULL,NULL,NULL,'(121) 2',NULL,2),
 (12,NULL,NULL,NULL,NULL,NULL,'(222) 1212-121',NULL,1),
 (13,NULL,NULL,NULL,NULL,NULL,'(123) 122-1312',NULL,1),
 (14,NULL,NULL,NULL,NULL,NULL,'-77777',NULL,1),
 (15,NULL,NULL,NULL,NULL,NULL,'-77777',NULL,1),
 (16,NULL,NULL,NULL,NULL,NULL,'-55555',NULL,2),
 (17,NULL,NULL,NULL,NULL,NULL,'111-111-11111',NULL,2),
 (18,NULL,NULL,NULL,NULL,NULL,'-66666',NULL,1),
 (19,NULL,NULL,NULL,NULL,NULL,'-77777',NULL,2),
 (20,NULL,NULL,NULL,NULL,NULL,'-12312',NULL,1),
 (21,NULL,NULL,NULL,NULL,NULL,'6132610249',NULL,1),
 (22,NULL,NULL,NULL,NULL,NULL,'23213211',NULL,1),
 (23,NULL,NULL,NULL,NULL,NULL,'8888888888',NULL,1),
 (24,NULL,NULL,NULL,NULL,NULL,'1234567890',NULL,2),
 (25,NULL,NULL,NULL,NULL,NULL,'9987654321',NULL,1),
 (26,NULL,NULL,NULL,NULL,NULL,'1234567890',NULL,2),
 (27,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (28,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (29,NULL,NULL,NULL,NULL,NULL,'1234567',NULL,1),
 (30,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (31,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (32,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (33,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (34,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (35,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (36,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (37,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (38,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (39,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (40,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (41,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (42,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (43,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (44,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (45,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (46,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (47,NULL,NULL,NULL,NULL,NULL,'6138324432',NULL,2),
 (48,NULL,NULL,NULL,NULL,NULL,'1234567890',NULL,1),
 (49,NULL,NULL,NULL,NULL,NULL,'342432412',NULL,1),
 (50,NULL,NULL,NULL,NULL,NULL,'32432',NULL,2),
 (51,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (52,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (53,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (54,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (55,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (56,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (57,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (58,NULL,NULL,NULL,NULL,NULL,'6138329249',NULL,1),
 (59,NULL,NULL,NULL,NULL,NULL,'1234',NULL,1),
 (60,NULL,NULL,NULL,NULL,NULL,'1234',NULL,2),
 (61,NULL,NULL,NULL,NULL,NULL,'12345678901234',NULL,1),
 (62,NULL,NULL,NULL,NULL,NULL,'12345678901234',NULL,1),
 (63,NULL,NULL,NULL,NULL,NULL,'(123) 122-1312',NULL,1),
 (64,NULL,NULL,NULL,NULL,NULL,'(213) 213-2132',NULL,2),
 (65,NULL,NULL,NULL,NULL,NULL,'(213) 213-2132',NULL,1),
 (66,NULL,NULL,NULL,NULL,NULL,'(231) 332-3123',NULL,2),
 (67,NULL,NULL,NULL,NULL,NULL,'(212) 323-1312',NULL,1),
 (68,NULL,NULL,NULL,NULL,NULL,'(213) 322-1332',NULL,2),
 (69,NULL,NULL,NULL,NULL,NULL,'(232) 313-1211',NULL,1),
 (70,NULL,NULL,NULL,NULL,NULL,'(123) 123-2112',NULL,2),
 (71,NULL,NULL,NULL,NULL,NULL,'(123) 213-1231',NULL,1),
 (72,NULL,NULL,NULL,NULL,NULL,'(213) 123-2121',NULL,2),
 (73,NULL,NULL,NULL,NULL,NULL,'(324) 242-3423',NULL,1),
 (74,NULL,NULL,NULL,NULL,NULL,'(234) 324-3242',NULL,2);
/*!40000 ALTER TABLE `tbl_phone` ENABLE KEYS */;


--
-- Definition of table `tbl_prog_lang`
--

DROP TABLE IF EXISTS `tbl_prog_lang`;
CREATE TABLE `tbl_prog_lang` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_prog_lang`
--

/*!40000 ALTER TABLE `tbl_prog_lang` DISABLE KEYS */;
INSERT INTO `tbl_prog_lang` (`id`,`name`) VALUES 
 (1,'SAP ABAP'),
 (2,'Java'),
 (3,'C++'),
 (4,'C#'),
 (5,'C'),
 (6,'Visual Basic'),
 (7,'Delphi'),
 (8,'.Net'),
 (9,'PowerBuilder'),
 (10,'Other');
/*!40000 ALTER TABLE `tbl_prog_lang` ENABLE KEYS */;


--
-- Definition of table `tbl_regions`
--

DROP TABLE IF EXISTS `tbl_regions`;
CREATE TABLE `tbl_regions` (
  `region_name` char(10) NOT NULL default '',
  `regionId` int(10) unsigned NOT NULL,
  PRIMARY KEY  (`regionId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_regions`
--

/*!40000 ALTER TABLE `tbl_regions` DISABLE KEYS */;
INSERT INTO `tbl_regions` (`region_name`,`regionId`) VALUES 
 ('Global',1),
 ('Americas',2),
 ('APA',3),
 ('EMEA',4),
 ('LA',5);
/*!40000 ALTER TABLE `tbl_regions` ENABLE KEYS */;


--
-- Definition of table `tbl_sapsolutions`
--

DROP TABLE IF EXISTS `tbl_sapsolutions`;
CREATE TABLE `tbl_sapsolutions` (
  `SAPSolution_name` char(20) NOT NULL default '',
  `sapsolutionId` int(10) unsigned NOT NULL auto_increment,
  PRIMARY KEY  (`sapsolutionId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sapsolutions`
--

/*!40000 ALTER TABLE `tbl_sapsolutions` DISABLE KEYS */;
INSERT INTO `tbl_sapsolutions` (`SAPSolution_name`,`sapsolutionId`) VALUES 
 ('mySAP All-in-One',1),
 ('SAP Business One',2),
 ('SAP ByDesign',3);
/*!40000 ALTER TABLE `tbl_sapsolutions` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_aio_based`
--

DROP TABLE IF EXISTS `tbl_sol_aio_based`;
CREATE TABLE `tbl_sol_aio_based` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_aio_based`
--

/*!40000 ALTER TABLE `tbl_sol_aio_based` DISABLE KEYS */;
INSERT INTO `tbl_sol_aio_based` (`id`,`name`) VALUES 
 (1,'Not Applicable'),
 (2,'Best Practices Baseline Package'),
 (3,'Best Practices Industry Package'),
 (4,'GUI XT'),
 (5,'Transaction Variants'),
 (6,'User Exits'),
 (7,'Smart Forms'),
 (8,'Additional ADD On functionality'),
 (9,'Modules'),
 (10,'Solution Networking (existing solution from an other partner has been adapted)');
/*!40000 ALTER TABLE `tbl_sol_aio_based` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_categ_target`
--

DROP TABLE IF EXISTS `tbl_sol_categ_target`;
CREATE TABLE `tbl_sol_categ_target` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_categ_target`
--

/*!40000 ALTER TABLE `tbl_sol_categ_target` DISABLE KEYS */;
INSERT INTO `tbl_sol_categ_target` (`id`,`name`) VALUES 
 (1,'Not Applicable'),
 (2,'Customer Relationship Management – Activities Management'),
 (3,'Customer Relationship Management – Calendar'),
 (4,'Customer Relationship Management – Opportunity Management'),
 (5,'Customer Relationship Management – Service Management'),
 (6,'Customization – Analysis Tools'),
 (7,'Customization – Extension & Personalization'),
 (8,'Customization – Formatted Search'),
 (9,'Customization – Migration'),
 (10,'Customization – Support Tools'),
 (11,'Customization – User Defined Object'),
 (12,'Financials – Banking'),
 (13,'Financials – Basel II'),
 (14,'Financials – Cost Accounting'),
 (15,'Financials – General Ledger'),
 (16,'Financials – Tax'),
 (17,'Human Resources – Employee Data Management'),
 (18,'Human Resources – Payroll'),
 (19,'Implementation – Alert & Workflow Management'),
 (20,'Implementation – Application Integration'),
 (21,'Implementation – Financial Initialization'),
 (22,'Implementation – General Settings'),
 (23,'Implementation – Getting Started'),
 (24,'Logistics – Internet Sales'),
 (25,'Logistics – Inventory Management'),
 (26,'Logistics – Procurement'),
 (27,'Logistics – Production'),
 (28,'Logistics – Sales'),
 (29,'Software Development Kit – Data Interface API'),
 (30,'Software Development Kit – Data Interface Server'),
 (31,'Software Development Kit – User Interface API');
/*!40000 ALTER TABLE `tbl_sol_categ_target` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_directory`
--

DROP TABLE IF EXISTS `tbl_sol_directory`;
CREATE TABLE `tbl_sol_directory` (
  `solId` bigint(20) NOT NULL auto_increment,
  `partNumber` varchar(20) default NULL,
  `solName` varchar(80) NOT NULL default '',
  `solDesc` longtext,
  `partComSite` varchar(80) default '',
  `solFocus` varchar(212) default '',
  `sapCertSince` datetime default NULL,
  `lastReviewBySAP` datetime default NULL,
  `averTrainEndUser` int(10) default NULL,
  `averImplTrainingDays` int(10) default NULL,
  `averImplEffort` int(10) default NULL,
  `averImplDuration` int(10) default NULL,
  `averSizeImplTeam` int(10) default NULL,
  `averSaleCycle` int(10) default NULL,
  `noCustomers` int(10) default NULL,
  `smallImpl` int(10) default NULL,
  `largeImpl` int(10) default NULL,
  `smallImplTime` int(10) default NULL,
  `largeImplTime` int(10) default NULL,
  `smallImplTeamNo` int(10) default NULL,
  `largeImplTeamNo` int(10) default NULL,
  `solSite` varchar(80) default '',
  `refCustAvailForUse` char(7) NOT NULL default '',
  `totalAppBaseLinePrice` bigint(20) default NULL,
  `appPriceEur` bigint(20) default NULL,
  `hardwareCost` bigint(20) default NULL,
  `hardwareCostEur` bigint(20) default NULL,
  `averLicensePrice` bigint(20) default NULL,
  `averLicensePriceEur` bigint(20) default NULL,
  `addServiceCost` bigint(20) default NULL,
  `addServicePriceEur` bigint(20) default NULL,
  `implCost` bigint(20) default NULL,
  `implCostEur` bigint(20) default NULL,
  `sapDiscount` char(7) NOT NULL default '',
  `dbUsed` varchar(80) NOT NULL default '',
  `SAPBusUsed` char(3) NOT NULL default '',
  `SAPGUIUsed` char(3) NOT NULL default '',
  `compA1B1Used` varchar(125) NOT NULL default '',
  `thirdPartyUsed` char(10) NOT NULL default '',
  `thirdPartyName` varchar(80) NOT NULL default '',
  `otherIT` varchar(80) NOT NULL default '',
  `addRemarks` longtext,
  `solSAPMicroSite` varchar(80) NOT NULL default '',
  `lastPartRevieDate` datetime default NULL,
  `reviewedBy` varchar(80) NOT NULL default '',
  `profileAdded` varchar(80) NOT NULL default '',
  `dateCreated` datetime default NULL,
  `modifiedBy` varchar(80) NOT NULL default '',
  `dateUpdated` datetime default NULL,
  `notificationProc` char(3) NOT NULL default '',
  `companyId` bigint(20) default NULL,
  PRIMARY KEY  (`solId`)
) ENGINE=InnoDB AUTO_INCREMENT=8783 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_directory`
--

/*!40000 ALTER TABLE `tbl_sol_directory` DISABLE KEYS */;
INSERT INTO `tbl_sol_directory` (`solId`,`partNumber`,`solName`,`solDesc`,`partComSite`,`solFocus`,`sapCertSince`,`lastReviewBySAP`,`averTrainEndUser`,`averImplTrainingDays`,`averImplEffort`,`averImplDuration`,`averSizeImplTeam`,`averSaleCycle`,`noCustomers`,`smallImpl`,`largeImpl`,`smallImplTime`,`largeImplTime`,`smallImplTeamNo`,`largeImplTeamNo`,`solSite`,`refCustAvailForUse`,`totalAppBaseLinePrice`,`appPriceEur`,`hardwareCost`,`hardwareCostEur`,`averLicensePrice`,`averLicensePriceEur`,`addServiceCost`,`addServicePriceEur`,`implCost`,`implCostEur`,`sapDiscount`,`dbUsed`,`SAPBusUsed`,`SAPGUIUsed`,`compA1B1Used`,`thirdPartyUsed`,`thirdPartyName`,`otherIT`,`addRemarks`,`solSAPMicroSite`,`lastPartRevieDate`,`reviewedBy`,`profileAdded`,`dateCreated`,`modifiedBy`,`dateUpdated`,`notificationProc`,`companyId`) VALUES 
 (7330,'','Mobile Field Solutions - Sales','Mobile Sales With more time spent away from the office, sales professionals need direct, instant access to accurate business information at the point of customer interaction. Mobile Sales extends your enterprise by delivering key sales tools to the field force on their handheld devices, for fast and complete automation of the entire sales cycle, in connected and disconnected environments. Mobile Sales has a full range of solutions for the retail, distribution, and supply industries that streamline the sales process and help sales professionals perform their daily routines with ease and efficiency. Mobile Sales enables companies to manage their field force more effectively, cut operational costs, increase productivity and generate new revenues through advanced selling tools. Mobile Sales provides the most comprehensive PDA sales functionality in the industry. KEY FEATURES BENEFITS -------------------------------------------------------------------------------- Comprehensive data management Create, view and update orders and accounts User-defined synchronization profiles Synchronizes only updated data Speed of information improves productivity and workflow Flexibility of information flow -------------------------------------------------------------------------------- Access to key sales tools Accounts Contacts Route Planner Electronic Order Generator Order History Inventory Products Pricing and Discounts Invoice Status and Collection Sales Statistics Shortened sales and billing cycles Higher revenues from sales opportunities Reduced cost of sales Faster, informed decision-making Improved customer service and retention Automation minimizes errors High quality data for sales analysis and forecasting -------------------------------------------------------------------------------- Enhanced sales features Mobile Form & Survey Mobile Manager Advanced Messaging Auto Fax Electronic Signature Improved data collection from the field Monitor ongoing sales performance Better communication More wins from the field -------------------------------------------------------------------------------- User friendly interface Easy-to-use Client Desktop and modules Multiple search and view options Expand and contract fields for better navigation Smooth adoption and use by sales reps -------------------------------------------------------------------------------- Secure, high quality information Secure access and data encryption Multiple information sources Management control over critical data Channeled information flow All data is fully protected Increased relevant data Accurate and timely information Maximizes data integrity -------------------------------------------------------------------------------- Industry-leading technology Palm OS and Pocket PC platforms Online/Offline connection Integrates to existing enterprise software and infrastructure Data compression for fast synchronization More choice of handhelds Works in connected and disconnected environments Rapid implementation Maximizes ROI of existing software','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 03:47:00','CPSN Administrator','2005-09-08 03:47:00','Yes',NULL),
 (7331,'','Mobile Field Solutions - CRM','Mobile CRM To make the most of your enterprise CRM, sales and marketing professionals need direct, instant access to key account information on their handhelds in connected and disconnected environments. Whatever your business strategy, Mobile CRM extends the power of your CRM to the field, directing efforts better, finding the most profitable opportunities and maximizing your investment. Mobile CRM is the exciting lead and contact management application that keeps mobile sales and marketing professionals completely connected to their company\'s Customer Relationship Management software on their handhelds. Mobile CRM enables reps to manage their accounts, contacts, activities and opportunities, and to collect, update and store important client information from the field. With Mobile CRM, sales and marketing professionals have a powerful tool for increasing customer retention, enhancing customer satisfaction, and creating new leads and referrals. KEY FEATURES BENEFITS -------------------------------------------------------------------------------- Comprehensive data management Create, view and update leads and accounts User-defined synchronization profiles Synchronizes only updated data Speed of information improves productivity and workflow Flexibility of information flow -------------------------------------------------------------------------------- Access to key CRM tools Accounts Contacts Activities Opportunities Forecasting Probability Products Pricing Faster response time to customers Reduced cost of sales Improved customer service and retention High quality data for sales analysis and forecasting -------------------------------------------------------------------------------- Enhanced features Mobile Form & Survey Advanced Messaging Improved data collection from the field Better communication -------------------------------------------------------------------------------- User friendly interface Easy-to-use Client Desktop and modules Multiple search and view options Expand and contract fields for better navigation Smooth adoption and use by reps -------------------------------------------------------------------------------- Secure, high quality information Secure access and data encryption Multiple information sources Management control over critical data Channeled information flow All data is fully protected Increased relevant data Accurate and timely information Maximizes data integrity -------------------------------------------------------------------------------- Industry-leading technology Palm OS and Pocket PC platforms Online/Offline connection Integrates to existing enterprise software and infrastructure Data compression for fast synchronization More choice of handhelds Works in connected and disconnected environments Rapid implementation Maximizes ROI of existing software','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 03:54:00','CPSN Administrator','2005-09-08 03:54:00','Yes',NULL),
 (7332,'','Mobile Field Solutions - Field Service','Mobile Field Solutions High quality and timely service drives the field service industry, so field service professionals need direct, instant access to accurate information at the point of service. Mobile Field Service extends the service supply chain by delivering key service functions to the field force on their handheld devices, for fast and complete automation of the entire service cycle, in connected and disconnected environments. Mobile Field Service has a full range of solutions for service-providing industries. Mobile Field Service raises the bar for customer support and takes field service to the next level, enabling the field service organization to better manage performance, streamline operations, allocate resources, disseminate knowledge, and improve inventory management. Mobile Field Service provides the most comprehensive PDA service functionality in the industry. KEY FEATURES BENEFITS -------------------------------------------------------------------------------- Comprehensive data management Create, view and update service accounts User-defined synchronization profiles Synchronizes only updated data Speed of information improves productivity and workflow Flexibility of information flow -------------------------------------------------------------------------------- Access to key service functions Accounts Contacts Route Planner Service Call History Service Call Duration Equipment History Field Inventory Management Service reps are better informed and prepared for calls Optimal dispatching and problem resolution Shortened service cycles Reduced cost of service and inventory Improved customer service and relations -------------------------------------------------------------------------------- Enhanced service features Mobile Form & Survey Advanced Messaging Auto Fax and Mail Electronic Signature Improved data collection from the field Better communication Customer can authorize the call -------------------------------------------------------------------------------- User friendly interface Easy-to-use Client Desktop and modules Multiple search and view options Expand and contract fields for better navigation Smooth adoption and use by service reps -------------------------------------------------------------------------------- Secure, high quality information Secure access and data encryption Multiple information sources Management control over critical data Channeled information flow All data is fully protected Increased relevant data Accurate and timely information Maximizes data integrity -------------------------------------------------------------------------------- Industry-leading technology Palm OS and Pocket PC platforms Online/Offline connection Integrates to existing enterprise software and infrastructure Data compression for fast synchronization More choice of handhelds Works in connected and disconnected environments Rapid implementation Maximizes ROI of existing software','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 03:58:00','CPSN Administrator','2005-09-08 03:58:00','Yes',NULL),
 (7333,'','Mobile Field Solutions - Form&Survey','Mobile Form & Survey Mobile Form & Survey is an easy-to-use, enhanced Application Module that enables the mobile workers to collect and synchronize important information not previously linked to the enterprise back-office database, such as on-site customer satisfaction surveys, new account leads, marketing surveys, opinion polls, and so on. With Mobile Form & Survey, anyone in the back-office can create within minutes customized forms and questionnaires and transfer them to the field force to complete and send back via a PDA. The information gathered can be exported to standard analysis programs such as Microsoft Excel. Mobile Form & Survey can be used as a stand-alone application or as an add-on module to Client Applications.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 04:01:00','CPSN Administrator','2005-09-08 04:01:00','Yes',NULL),
 (7335,'','Mobile Field Solutions - Sales','Mobile Sales Der Verk?er im Au?ndienst verbringt die meiste Zeit drau?n beim Kunden oder am Weg, ben??t gleichzeitig aber jederzeit Zugriff auf zuverl?ige, aktuelle Information, oft auch w?end des Treffens mit dem Kunden. Mobile Sales erweitert Ihr Unternehmen, indem es Ihre Verkaufs- und Businessmanagement Tools bis zum PDA des Mitarbeiters vor Ort bringt und so eine schnelle und vollst?ige Automatisierung des gesamten Verkaufszyklus gew?leistet. Dies funktioniert in jeder Umgebung, auch wenn kein Zugang zum Internet m??ch ist. Mobile Sales bietet eine vollst?ige Palette praxiserprobter L??gen fr den Einzelhandel, Distribution, und alle Wirtschaftsbereiche, die Au?ndienst-Mitarbeiter fr den Verkauf, Service oder Auslieferung besch?igen. Mit Mobile Sales vereinfachen Sie die Prozesse und erm??chen ihren Mitarbeitern, die t?iche Routine einfach, effizient und kosteneffektiv abzuwickeln. All dies erreichen Sie mit Mobile Sales ? Sie senken Ihre Kosten, erh?? ihre Produktivit?und verbessern ihre Marktpr?nz und Servicequalit? Mobile Sales bietet die umfassendsten PDA-Funktionalit?n am Markt. Mit Mobile Sales geben Sie ihren Mitarbeitern keine Gelegenheit, Gelegenheiten zu vers?en! DIE WICHTIGSTEN MERKMALE IHRE VORTEILE -------------------------------------------------------------------------------- Umfassendes Datenmanagement Auftr? und Gesch?spartner erstellen, einsehen und aktualisieren Benutzerspezifische Synchronisationsprofile Synchronisiert nur ge?erte Datens?e Schnelle, verl?liche und aktuelle Information Volle Kontrolle ber den Informationsfluss Schnelle Synchronisation, Datensicherheit -------------------------------------------------------------------------------- Zugriff auf verkaufsrelevante Daten Gesch?spartner Kontakte Terminplaner Auftrags-Generator Auftrags-Historie Lagerstand Artikel Preise und Rabatte Aktueller Rechnungs- und Inkasso-Status Umsatzstatistiken Verkrzte Verkaufs- und Rechnungszyklen Bessere Realisierung von Opportunities Reduzierte Kosten des Verkaufs Schnellere Entscheidungsfindung aufgrund aktueller Information Besserer Kundenservice Automatische Datenbernahme vom Backoffice verhindert Fehler Verl?liche Daten fr Analysen und Budgetierung -------------------------------------------------------------------------------- Erweiterte M??chkeiten Mobile Form & Survey Mobile Manager Advanced Messaging Auto Fax Elektronische Unterschrift Verbesserter Information-Aufnahme vom Feld Kontrolle aktueller Verkaufsaktivit?n Bessere Kommunikation Sofortige Reaktion ? Angebote, Rechnungen, Quittungen -------------------------------------------------------------------------------- Benutzerfreundliche Bedienung Einfacher Client Desktop und Module Vielfache Such- und Ansichtoptionen Aufklappbare Felder vereinfachen die Navigation Schnelle Anpassung und intensive Anwendung durch Au?ndienst-Mitarbeiter. -------------------------------------------------------------------------------- Sichere und verl?liche Information Gesicherter Zugriff, Verschlsselung der bertragenen Daten Anbindung an verschieden Datenquellen Management-Kontrolle ber kritische Daten Kanalisierter Informationsfluss Optimaler Datenschutz Einfacher Zugriff auf relevante Daten Zuverl?ige und aktuelle Information Maximale Datenintegrit? -------------------------------------------------------------------------------- Fhrende Technologie Palm und PC Betriebssysteme Online/Offline Betriebsweise Volle Einbindung in bestehende Unternehmens-Software und -Infrastruktur Datenkomprimierung fr schnelles Synchronisieren Sie verwenden Ihren bevorzugten PDA Unbeeintr?tigtes Arbeiten auch ohne Internet-Anbindung Schnelle Integration ROI-Maximierung bestehender Software','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 04:26:00','CPSN Administrator','2005-09-08 04:26:00','Yes',NULL),
 (7336,'','Mobile Field Solutions - CRM','Mobile CRM Um Ihr CRM (Customer Relation Management) optimal einzusetzen, ben??en Ihre Marketing- und Verkaufsmitarbeiter direkten und schnellen Zugriff auf relevante Kundeninformation ber ihren PDA ? immer und von berall, auch wenn sie keine direkte Verbindung zum Internet herstellen k??n. Was immer Ihr Gesch?sumfeld auch ist ? mit Mobile CRM bringen Sie die vollen F?gkeiten Ihres Unternehmens-CRM zum PDA jedes Mitarbeiters ?drau?n im Feld?: Sie verbessern seine Effizienz, behalten die notwendig ?ersicht ? Sie sind immer voll informiert und auf dem aktuellsten Stand und k??n so sicherstellen, dass keine Gelegenheiten vers?t werden und die wertvolle Zeit Ihrer Mitarbeiter optimal eingesetzt wird. Mobile CRM ist eine aufregende CRM-Anwendung, das die Information am PDA der Au?ndienst-Mitarbeiter immer und automatisch auf dem Letztstand h?; sie erlaubt ihnen, Gesch?spartner, Kontakte, Aktivit?n, Opportunities, zu verwalten, als ob sie im Bro vor ihrem PC s?n; sie k??n Daten aktualisieren, neue Information erstellen und dem Backoffice bergeben, Angebote erstellen, Rechnungen schreiben und sogar Zahlungen kassieren. Mit Mobile CRM wird der PDA das bevorzugte Werkzeug Ihrer Mitarbeiter, die die Effizienz, einfache Anwendung und jederzeitige Verfgbarkeit schnell sch?en und als unverzichtbares Werkzeug lieben lernen. DIE WICHTIGSTEN MERKMALE IHRE VORTEILE -------------------------------------------------------------------------------- Umfassendes Datenmanagement Auftr?, Gesch?spartner, Kontakte erstellen, einsehen und aktualisieren Benutzerspezifische Synchronisationsprofile Synchronisiert nur ge?erte Datens?e Schnelle, verl?liche und aktuelle Information Volle Kontrolle ber den Informationsfluss Schnelle Synchronisation, Datensicherheit Zugriff auf die wichtigsten CRM-Tools Gesch?spartner Kontakte Aktivit?n Opportunities Verkaufsbudgets Abschluss-Wahrscheinlichkeit Artikel Preise und Rabatte Schnellere Reaktion bei Kunden Reduzierte Cost of Sales Bessere Kundenbindung Verl?liche Daten fr Analysen und Budgetierung Erweiterte M??chkeiten Mobile Form & Survey Mobile Manager Advanced Messaging Auto Fax Elektronische Unterschrift Verbesserte Informations-Erfassung vor Ort. Kontrolle aktueller Verkaufsaktivit?n Bessere Kommunikation Sofortige Reaktion ? Angebote, Rechnungen, Quittungen Benutzerfreundliche Bedienung Einfacher Client Desktop und Module Vielfache Such- und Ansichtoptionen Aufklappbare Felder vereinfachen die Navigation Schnelle Anpassung und intensive Anwendung durch Au?ndienst-Mitarbeiter. Sichere und verl?liche Information Gesicherter Zugriff, Verschlsselung der bertragenen Daten Anbindung an verschieden Datenquellen Management-Kontrolle ber kritische Daten Kanalisierter Informationsfluss Optimaler Datenschutz Einfacher Zugriff auf relevante Daten Zuverl?ige und aktuelle Information Maximale Datenintegrit? Fhrende Technologie Palm und PC Betriebssysteme Online/Offline Betriebsweise Volle Einbindung in bestehende Unternehmens-Software und -Infrastruktur Datenkomprimierung fr schnelles Synchronisieren Sie verwenden Ihren bevorzugten PDA Unbeeintr?tigtes Arbeiten auch ohne Internet-Anbindung Schnelle Integration ROI-Maximierung bestehender Software','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 04:29:00','CPSN Administrator','2005-09-08 04:29:00','Yes',NULL),
 (7337,'','Mobile Field Solutions - Field Service','Mobile Field Solutions Zuverl?iger Kundendienst und Wartung technischer Anlagen ist eine unabdingbare Voraussetzung, im heutigen Gesch?sumfeld erfolgreich zu bestehen. Um dies zu gew?leisten, ben??en Ihre Techniker direkten, verz??ungsfreien Zugriff auf zuverl?ige Information ? immer und von berall! Mobile Field Service bringt die Daten und wichtigsten Funktionen Ihre Backoffice-Systems zum PDA Ihres Mitarbeiters drau?n im Feld ? Online und Offline, auch wenn keine Verbindung zum Internet besteht. Mobile Field Service bietet komplette L??gen fr den Servicebereich und stellt einen neuen Qualit?standard fr alle Service-relevante Aktivit?n dar. Ihr Serviceteam arbeitet wirkungsvoller, kann die Ressourcen besser planen, Information besser verteilen, Ersatzteile und Lagerst?e besser verwalten und Fehler in der Informations-Erfassung und weiteren Bearbeitung weitestgehend vermeiden. Amodat Mobile Field Service bietet insgesamt die umfassendste PDA-Funktionalit?fr Service und Wartung, die heute erh?lich ist. DIE WICHTIGSTEN MERKMALE IHRE VORTEILE -------------------------------------------------------------------------------- Umfassendes Daten-Management Serviceauftr? erstellen, einsehen und aktualisieren Benutzerspezifische Synchronisationsprofile Synchronisiert nur ge?erte Datens?e Schnelle, verl?liche und aktuelle Information Volle Kontrolle ber den Informationsfluss Schnelle Synchronisation -------------------------------------------------------------------------------- Zugriff auf die wichtigsten Service-Funktionen GP Kontakte Terminplaner Servicehistorie Belegerstellung mit Unterschrifterfassung (Rechnung) Ger?-Historie Verwaltung mitgefhrter Erstatzteile Ihre Servicetechniker haben die gesamte Information ber den Serviceanruf zur Verfgung. Optimierung der Arbeits- und Reisezeiten der Mitarbeiter. Vermeidung von Irrtmern und Missverst?nissen. Kostenreduzierung fr Service und Wartung. Effiziente Ersatzteilverwaltung, besserer Service am Kunden -------------------------------------------------------------------------------- Erweiterte M??chkeiten Mobile Form & Survey Fortgeschrittenes Messaging Auto Fax and Mail Electronic Signature Bessere und zuverl?igere Datenerfassung Bessere Kommunikation und Kontrolle Sofortige Best?gung durch den Kunden vor Ort. -------------------------------------------------------------------------------- Benutzerfreundliche Bedienung Einfacher Client Desktop und Module Vielfache Such- und Ansichtoptionen Aufklappbare Felder vereinfachen die Navigation Schnelle Anpassung und intensive Anwendung durch Service-Mitarbeiter. -------------------------------------------------------------------------------- Sichere und zuverl?ige Information Gesicherter Zugriff, Verschlsselung der bertragenen Daten Anbindung an verschieden Datenquellen Management-Kontrolle ber kritische Daten Optimaler Datenschutz Einfacher Zugriff auf relevante Daten Zuverl?ige und aktuelle Information Maximale Datenintegrit? -------------------------------------------------------------------------------- Fhrende Technologie Palm und PC Betriebssysteme Online/Offline Betriebsweise Volle Einbindung in bestehende Unternehmens-Software und -Infrastruktur Datenkomprimierung fr schnelles Synchronisieren Sie verwenden Ihren bevorzugten PDA Unbeeintr?tigtes Arbeiten auch ohne Internet-Anbindung Schnelle Integration ROI-Maximierung bestehender Software','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 04:33:00','CPSN Administrator','2005-09-08 04:33:00','Yes',NULL),
 (7338,'','Mobile Field Solutions - Form & Survey','Mobile Form & Survey Mobile Form & Survey ist ein einfach anwendbares Applikationsmodul, mit dem Ihre mobilen Mitarbeiter beliebige Information drau?n im Feld erfassen und diese direkt an Datenerfassungsanwendungen bertragen k??n. Erstellen Sie auf einfachste Weise im Backoffice verschiedene Frageb?? und Formulare um damit Daten im vorgegebenen Format zuverl?ig erfassen. Diese Anwendung versetzt Sie auf bisher unerreichte Weise in die Lage, auf Anforderungen und Herausforderungen des Marktes ohne Inanspruchnahme externer Fachleute ? also ohne Verz??ung und zu minimalen Kosten ? zu reagieren. Beispiele: neue Leads, Meinungsumfragen, Kundenzufriedenheit, Kundendaten, etc. Die im Backoffice innerhalb von Minuten erstellten Vorlagen bermitteln Sie an die PDAs Ihrer mobilen Mitarbeiter. Die im Feld erfassten Daten werden mit der jeder Synchronisation wieder ans Backoffice bermittelt und direkt von Standardprogrammen wie MS Excel zur weiteren Auswertung bernommen. Mobile Form & Survey kann auch als Stand-Alone Anwendung eingesetzt werden. Mobile Form & Survey ist ein hervorragendes Beispiel, wie wir unser Know-How und langj?ige Praxiserfahrung zum Vorteil unserer Kunden einsetzen!','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,3,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 04:36:00','CPSN Administrator','2005-09-08 04:36:00','Yes',NULL),
 (7339,'','Productiebesturing met SBO','BEHEERS UW PRODUCTIEPROCES MET BEHULP VAN EEN GEAVANCEERDE EN VOLLEDIG IN SAP BUSINESS ONE GE?TEGREERDE MODULE C-PPS One is een krachtig en flexibel gereedschap om u te helpen bij het plannen, optimaliseren en beheren van het productieproces. Een complete productiemodule speciaal ontwikkeld voor SAP Business One. Het pakket biedt naadloze integratie met de volgende modules van SAP Business One: Verkoop, Inkoop, Artikelen- en Voorraadbeheer, Productie, en Grootboek. Een oplossing die gebruikersvriendelijk, compleet en goed betaalbaar is. En heel belangrijk: een oplossing met een zeer korte inleer- en implementatietijd. Speciaal bedoeld voor het Midden- en Kleinbedrijf. Inzetbaar voor o.a. metaal- en kunststofverwerkende bedrijven, machinefabrieken, gereedschapmakerijen, voedingsindustrie, elektronische industrie, proces industrie, cosmetica etc. MET C-PPS ONE KUNT U ? Geld en tijd besparen door optimale ondersteuning van uw administratie rond het productieproces ? Op tijd reageren op uitzonderingen, tekorten en overschotten etc. ? Effici? en kosteneffectief personeel en middelen inzetten ? Nauwkeurig de hoeveelheid ?timing van uw materiaalbehoeften bepalen ? Aan de geplande vraag voldoen door rekening te houden met alle relevante gegevens in SAP Business One zoals: productie-, doorloop- en levertijden, stuklijsten op meerdere niveaus, lot groottes, relevante magazijnen etc. ? Beschikken over voor- en nacalculatie-gegevens voor het bewaken van de kosten C-PPS ONE IN EEN OOGOPSLAG ? Voor- en nacalculatie (man- en machine-uren, materialen, uitbestedingen en eenmalige kosten) ? Werkvoorbereiding ? Tijdsregistratie, handmatig of via koppeling met tijdregistratiesysteem (aan- en afwezigheid, ordertijd, directe en indirecte uren, diverse roosters, normale uren en overuren etc.) ? Capaciteitsplanning ? Detailplanning, routing ? Intelligent planbord voor automatisch en handmatig plannen ? Planlijsten ? Calculeren en in productie geven van samenstellingen (stuklijsten) ? Inkooplijsten ? Productiedocumenten ? Flexibele ordervrijgavemogelijkheden ? Controlemogelijkheden op beschikbaarheid van benodigde middelen en materialen ? Flexibele bepaling van de sorteervolgorde van productieorders ? Voortgangsregistratie en- bewaking gedurende de productie ? Serienummer- en batchbeheer i.v.m. traceerbaarheid ? Dynamische koppelingen naar Microsoft Office ? Directe doorzoom mogelijkheden ? Krachtige rapportagemogelijkheden ? Volledig ge?egreerd met financi? administratie','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,3,5,NULL,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','Yes','Yes','','No','','','','','2006-03-31 00:00:00','','F. Robben','2005-09-08 04:42:00','CPSN Administrator','2005-09-08 04:42:00','Yes',NULL),
 (7462,'','Voucher module for Taiwan Area','VAT calculation electronic voucher multi company assignable','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',0,0,2,2,1,2,8,3,58,0,2,0,1,'www.dwins.com','Yes',1000,NULL,0,NULL,350,NULL,0,NULL,0,NULL,'Yes','SQL','Yes','Yes','B1','No','','','','','2006-03-31 00:00:00','','Lenny Chen','2005-09-19 19:37:00','CPSN Administrator','2005-09-19 19:37:00','Yes',NULL),
 (7463,'','Tax module for Taiwan Area','Taiwan area tax module National Tax Bureau e-form embedded 401K claim form','','SAP Business One','2005-09-20 00:00:00','2005-09-20 00:00:00',0,1,2,2,1,2,8,3,58,1,3,1,3,'','Yes',1000,NULL,0,NULL,350,NULL,0,NULL,0,NULL,'Yes','SQL','Yes','Yes','B1','No','','','','','2006-03-31 00:00:00','','Lenny Chen','2005-09-19 19:44:00','CPSN Administrator','2005-09-19 19:44:00','Yes',NULL),
 (7464,'','Web POS Great China Area','Almost real time web POS system. Minimize transaction loading guranteed. Spesific business rule enabled for department store in China, Hong Knog and Taiwan. Over 100+ report enabled. Off-line back up machnisium.','','SAP Business One','2005-09-20 00:00:00','2005-09-20 00:00:00',3,10,8,2,2,2,3,5,80,5,10,1,2,'','Yes',75000,NULL,2500,NULL,2500,NULL,5000,NULL,100000,NULL,'Yes','SQL','Yes','No','B1','','','','','','2006-03-31 00:00:00','','Lenny Chen','2005-09-19 20:04:00','CPSN Administrator','2005-09-19 20:04:00','Yes',NULL),
 (7482,'','R1 Rentals','R1 Rental provides the total solution for rental reservations, orders, tracking, services, billing and repairs of all types of fixed and mobile assets, equipments and inventory items. It is fully integrated with SAP Business One and Ceecom?s M1 Maintenance Add-on with identical SBO look and feel. Enables extensive drill downs and queries. Reports are provided throughout the system. R1 has a similar look and feel to SAP Business One and uses all native SAP Business One features.','http://cpsn-channel.sap.com/ceecom','SAP Business One','2005-09-27 00:00:00','2005-09-27 00:00:00',5,5,10,1,3,2,1,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','MS SQL Server','Yes','Yes','','No','','','','','2005-10-25 00:00:00','','James Looseley','2005-09-20 14:29:00','CPSN Administrator','2005-09-20 14:29:00','Yes',NULL),
 (7487,'','OneEnterprise Portals','- Information sharing within the organization ? for Sales Executives, employees & Senior Executives and with its associates ? Vendors, Customers - Return merchandize authorization - Request a service call - Information on Best Selling - Products and new p','http://cpsn-channel.sap.com/citixsys','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',5,7,7,1,5,2,18,5,20,7,14,2,5,'www.oneenterprise.com','Yes',4000,NULL,0,NULL,NULL,NULL,NULL,NULL,1200,NULL,'Yes','SQL Server 2000','Yes','No','','No','','','','http://cpsn-channel.sap.com/citixsys','2006-03-31 00:00:00','','Sarnath Mukherjee','2005-09-21 06:03:00','CPSN Administrator','2005-09-21 06:03:00','Yes',NULL),
 (7491,'','Web Shop','A fully intergrated, dynamic e-commerce solution. Allowing the sale of items through a web site. Data is exhanged between SAP B1 and the web site, ensuring a real time update of new stock details entered in SAP B1 are then loaded on to the web pages. All sales information entered on the site goes straight in to the SOP of SAP B1. Credit card payment feature is also linked back to SAP B1. This solution is live!!!','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',2,2,50,2,2,3,1,NULL,2,NULL,10,NULL,2,'www.intelligent-solutions-ltd.co.uk','Yes',5000,NULL,NULL,NULL,NULL,NULL,3000,NULL,8000,NULL,'Yes','MS SQL','Yes','No','','Yes','EIKO','','','','2006-03-31 00:00:00','','Alan McGregor','2005-09-22 04:32:00','CPSN Administrator','2005-09-22 04:32:00','Yes',NULL),
 (7496,'','businessControl for Vending','businessControl is fully integrated Add-On on German language for SAP Business One, mit dem die Betreiber von Verkaufsautomaten eine passgenaue Branchenl??g erwerben k??n.','www.dresearch.de','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,2,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,'http://www.dresearch.de/products/sap/businesscontrol_de.html','No',5000,NULL,NULL,NULL,5000,NULL,NULL,NULL,NULL,NULL,'Yes','MS SQL','Yes','Yes','','Yes','vendingControl','','','http://cpsn-channel.sap.com/dresearch','2006-03-31 00:00:00','','Roland Zerbe','2005-09-23 08:38:00','CPSN Administrator','2005-09-23 08:38:00','Yes',NULL),
 (7498,'','Microshop Build to Order Manufacturing','Microshop BTO offers a complete ERP environment for small to mid-sized make-to-order manufacturing environments. A few key benefits are that it is a seamless interface to Business One, it runs on a single database, and it\'s 100% embedded into Business One. The components consist of all the Business One modules plus Job Costing, Quoting and Estimating, Bar Coding, and Scheduling. The business processes supported are: Manufacturing Control, Job Costing, Work-in-Process Inventory, Quoting & Estimating, Capacity Requirements Planning, Shop Floor Scheduling.','http://cpsn-channel.sap.com/cdia','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',10,40,40,4,1,5,10,10,25,40,60,1,1,'www.cdi-usa.com','Yes',20808,NULL,0,NULL,1665,NULL,0,NULL,20808,NULL,'Yes','SQL','Yes','Yes','All Business One modules, Job Costing, Quoting & Estimating, Bar Coding, Scheduling','No','','','','http://cpsn-channel.sap.com/cdia','2006-03-31 00:00:00','','Sandy DeAngelis','2005-09-23 10:25:00','CPSN Administrator','2005-09-23 10:25:00','Yes',NULL),
 (8509,'','2B Exact','Conversion tool to import Exact installations into the SBO Database. Works for all Exact installations from DOS (Btrieve) to Exact Globe 2003. Uses an ACCESS database to be able to cleanup data and convert numbering schemes.','http://cpsn-channel.sap.com/2borbrix','SAP Business One','2005-09-27 00:00:00','2005-09-27 00:00:00',1,1,2,0,1,0,5,1,50,1,1,1,1,'www.2borbrix.nl','Yes',500,NULL,0,NULL,0,NULL,500,NULL,500,NULL,'No','MS-SQL, MS_ACCESS','No','No','','No','','','','http://cpsn-channel.sap.com/2Borbrix/Exact','2006-03-31 00:00:00','','M. R??ers','2005-09-26 03:29:00','CPSN Administrator','2005-09-26 03:29:00','Yes',NULL),
 (8514,'','MCG.evolve','MCG.evolve provides process industry functionality in a browser. It utilises both its own and a SBO database to provide a full integrated solution covering New Product Development to Advanced Warehousing (including hazardous chemicals) and all business functions in between.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','Microsoft SQL 2000 / 2005','','','','No','','','','','2006-03-31 00:00:00','','Ernie Dewhirst','2005-09-26 14:38:00','CPSN Administrator','2005-09-26 14:38:00','Yes',NULL),
 (8516,'','Microshop Hardwoods','Microshop Hardwoods offers a complete ERP environment for Distributors that process raw lumber into finished hardwood. The components of Microshop Hardwoods are all of Business One modules, Job Costing, Planer Scheduling, Bar Coding, Mobile computing. The business processes supported are: Inventory Control, Material Movement, Product Costing, Manifest Management, Shipment Processing.','http://cpsn-channel.sap.com/cdi-usa','SAP Business One','2005-09-27 00:00:00','2005-09-27 00:00:00',10,10,40,4,1,6,1,70,70,40,40,1,1,'www.cdi-usa.com','Yes',20811,NULL,0,NULL,1665,NULL,0,NULL,20811,NULL,'Yes','SQL','Yes','Yes','All Business One modules, Job Costing, Planer Scheduling, Bar Coding, Mobile computing','No','','','','http://cpsn-channel.sap.com/cdi-usa','2006-03-31 00:00:00','','Sandy DeAngelis','2005-09-26 15:16:00','CPSN Administrator','2005-09-26 15:16:00','Yes',NULL),
 (8517,'','Microshop Project Costing','Microshop Project Costing offers a complete ERP environment for companies who need to trade labor, inventory and misc. expenses for specific projects. The components included in Microshop Project Costing are all Business One modules and the Project Costing system. The major business processes supported are project tracking and costing, expense tracking and time and material billing.','http://cpsn-channel.sap.com/cdi-usa','SAP Business One','2005-09-27 00:00:00','2005-09-27 00:00:00',3,3,10,1,1,2,1,50,50,30,30,NULL,1,'http://www.cdi-usa.com','Yes',4159,NULL,0,NULL,415,NULL,0,NULL,4161,NULL,'Yes','SQL','Yes','Yes','All Business One modules and the Project Costing system','No','','','','http://cpsn-channel.sap.com/cdi-usa','2006-03-31 00:00:00','','Sandy DeAngelis','2005-09-26 15:23:00','CPSN Administrator','2005-09-26 15:23:00','Yes',NULL),
 (8519,'','UPS Wordship Interface','UPS Worldship Interface offers NO redundant entry into the shipping system. It has a seamless interface to Business One and is 100% imbedded into Business One. The business process supported is shipping integration to UPS Worldship automated manifest system. The components include all the Business One modules and the shipping interface.','http://cpsn-channel.sap.com/cdi-usa','SAP Business One','2005-09-27 00:00:00','2005-09-27 00:00:00',0,0,1,1,1,0,6,7,70,1,1,1,1,'www.cdi-usa.com','Yes',830,NULL,0,NULL,0,NULL,0,NULL,415,NULL,'Yes','SQL','Yes','Yes','All Business One modules and Shipping Interface','Yes','UPS Worldship','','','http://cpsn-channel.sap.com/cdi-usa','2006-03-31 00:00:00','','Sandy DeAngelis','2005-09-26 15:59:00','CPSN Administrator','2005-09-26 15:59:00','Yes',NULL),
 (8520,'','EDI Trusted Link Interface','The key benefits of the EDI Trusted Link Interface is that it allows for automated entry of EDI transactions into Business One when transmitted fro Trusted Link. It has a seamless interface to Business One, a single database and is 100% imbedded into Business One. The business processes supported are EDI transmissions for sales and billing, integrated into Business One MRP, and outputs shipment notifications from delivery orders. The components are all Business One modules, Trusted Link EDI feed and EDI Interface.','http://cpsn-channel.sap.com/cdi-usa','SAP Business One','2005-09-27 00:00:00','2005-09-27 00:00:00',1,1,1,1,1,1,3,10,50,1,1,1,1,'www.cdi-usa.com','Yes',2079,NULL,0,NULL,166,NULL,830,NULL,830,NULL,'Yes','SQL','Yes','Yes','All Business One modules, Trusted Link EDI and EDI Interface','Yes','Trusted Link by Innovis','','','http://cpsn-channel.sap.com/cdi-usa','2006-03-31 00:00:00','','Sandy DeAngelis','2005-09-26 16:09:00','CPSN Administrator','2005-09-26 16:09:00','Yes',NULL),
 (8526,'','Intercompany Solution','Intercompany Postings provides the mechanism to post between different companies within SAP Business One Any posting performed through the General Ledger can be trapped, with the transactions being transferred to a destination company. The Intercompany from/to accounts is set up in the system (COA) and this provides transparent inter-company posting for the user. As all the trigger and posting accounts are pre-defined, the operator simply has to choose the right accounts numbers. These companies are identified as part of a segment in the Chart of accounts definition. The user can select the posting periods and the Intercompany From/To accounts to trigger the posting.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',3,3,4,0,4,1,1,10,NULL,5,NULL,NULL,NULL,'','No',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','SQL Server 2000','Yes','Yes','','No','','','#NAME?','','2006-03-31 00:00:00','','Sarnath Mukherjee','2005-09-27 03:37:00','CPSN Administrator','2005-09-27 03:37:00','Yes',NULL),
 (8609,'','Congo','Fully B1 integrated Business-to-Business and/or Business-to-consumer website.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',3,3,10,1,2,3,2,30,60,10,10,2,2,'','Yes',32000,NULL,7500,NULL,1000,NULL,NULL,NULL,12000,NULL,'Yes','SQL Server','Yes','No','B1 DI SDK','No','','','','','2006-03-31 00:00:00','','John Friebel','2005-10-02 22:42:00','CPSN Administrator','2005-10-02 22:42:00','Yes',NULL),
 (8622,'','SelfRating','SelfRating according to BASEL II with hardfact directly form B1 and a list of questions for softfacts.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',0,0,1,NULL,1,3,3,2,5,1,1,1,1,'','Yes',1200,NULL,0,NULL,1200,NULL,0,NULL,400,NULL,'Yes','MS-SQL Server','Yes','Yes','B1','Yes','','','','','2006-03-31 00:00:00','','Fred Grneberg','2005-10-04 13:49:00','CPSN Administrator','2005-10-04 13:49:00','Yes',NULL),
 (8628,'26949','bob Controlling Suite - bcs','Addon modul for more controlling functionality. bcs is integrated in SAP Business One and supplies SMEs with highly informative data that provides an important basis for future market success. Transparent Planning and reporting. Intercompany Business. Geomarketing.','http://cpsn-channel.sap.com/bobsys','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,2,10,1,3,3,30,3,75,2,25,2,5,'http://www.bobsys.com/bcs.htm','Yes',NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','SQL-Server, Oracle, Access, MSDE, DB2, AS/400','Yes','No','','No','','','','','2006-01-02 00:00:00','','Gavin Stollenwerk','2005-10-06 07:49:00','CPSN Administrator','2005-10-06 08:05:00','Yes',NULL),
 (8648,'','R2p?atnikSBO','R2p?atnikSBO provides all the functionality required to human resources management, payroll counting in compliance with current regulations in Poland. R2p?atnikSBO is integrated with SAP Business One. Payrols are automatically booked in the accounting module of Business One and personal data of employees can be updated. Solution can be suited to company of every profile.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',5,5,5,1,1,3,6,1,10,1,10,1,1,'http://www.reset2.pl/sap','Yes',2000,NULL,NULL,NULL,1000,NULL,NULL,NULL,1500,NULL,'Yes','Microsoft SQL Server','Yes','Yes','','No','','','','','2006-03-31 00:00:00','','Jerzy Szczesnik','2005-10-11 11:26:00','CPSN Administrator','2005-10-11 11:26:00','Yes',NULL),
 (8686,'','ASS.TEC BOne WIN','The main functionality of the ASS.TEC MSWord-Interface is to create single letters and mass mailing to business partners directly from SAP Business One. During this process you can choose to create activities automatically. Starting with Version 2004 2.0 which is available since 1st May 2005 you also can create the follow-up action with certain criteria, as well as mark the origin activity as opened or closed. A special highlight: With the integration of the SAP Business One query generator or wizard into the mass mailing creation all relevant SAP Business One ? data may be selected and printed in the mass mailing. Details about the functionality and technical procedure for licensing you will find in the documentation: www2.asstec.com/BOne-WIN','','SAP Business One','2005-12-20 00:00:00','2005-12-20 00:00:00',0,0,0,NULL,1,0,8,1,10,0,0,NULL,NULL,'www2.asstec.com/BOne-WIN','Yes',NULL,NULL,NULL,NULL,NULL,80,NULL,NULL,NULL,NULL,'Yes','Microsoft SQL Server','Yes','Yes','','Yes','Microsoft','','','','2005-12-20 00:00:00','','Martina Kohler','2005-10-17 06:35:00','CPSN Administrator','2005-10-17 06:35:00','Yes',NULL),
 (8747,'','Alliance Distribution Edition for SAP Business One','The Alliance Distribution Edition for SAP Business One is a seamlessly integrated business solution, designed for small and midsized businesses and divisions and subsidiaries of large organizations, specially developed to enable wholesale distributors to streamline critical business processes, make fast decisions based on real-time information and maintain a competitive advantage in the global market. With built-in tools to streamline managerial processes, a wireless warehouse management system with a ?pick, pack and ship? state of mind, document management and electronic data interchange capabilities that will help make your business truly paperless, and powerful financial management modules such as credit card authorization, the solution makes it easy for everyone in your company to obtain the operational and decision support they need. The Alliance Distribution Edition for SAP Business One was designed specifically for small and midsized businesses and divisions and subsidiaries of global enterprises. It is easy to purchase, easy to implement, easy to use and easy to maintain with assistance from one business advisor and one call for technical support.','http://cpsn-channel.sap.com/alliance','SAP Business One','2005-12-20 00:00:00','2005-12-20 00:00:00',10,20,30,2,5,5,100,5,75,14,35,3,5,'www.rsmmcgladrey.com/allianceeditions','Yes',80000,66,30000,25,5000,4,10000,8,50000,41,'Yes','SQL','Yes','Yes','','Yes','','','','','2005-12-20 00:00:00','','Manu Khanna','2005-10-20 12:14:00','CPSN Administrator','2005-10-20 12:14:00','Yes',NULL),
 (8748,'','Alliance POS Edition for SAP business One','Whether you are a one-store retailer or you are planning to open a second, third, or even fourth store, you know sales opportunities are limited and that the competition is waiting around the corner with new offerings, grabbing even your most loyal of customers. Customers today want more SKUs, more personalized services and connected convenience. Retailers are finding new ways to streamline inventory management, purchasing and pricing with customers, suppliers and other business partners. These are the days of powerful customers -- are you reaching out to them? Built with SAP Business One as its foundation, Alliance Point-of-Sale Edition provides you with the ultimate solution for managing the front and back end of your stores. The solution?s main strength lies in the integration between SAP Business One and your stores? point-of-sale registers. Through ongoing communication between the point-of-sale and accounting systems, the accounting and register functionalities simultaneously pull necessary information such as inventory levels or pricing and make updates automatically throughout the day. By eliminating the need to manually enter or update data from the functional areas of your stores into the accounting system, the solution makes it easy for everyone in your company to obtain the operational and decision support they need. Whether you have 1 or 100 point-of-sale registers, Alliance Point-of-Sale Edition will help you retain your profitable customers and identify new opportunities while allowing you to focus on expanding your retail business.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,15,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','','Yes','','','','','2006-03-31 00:00:00','','Manu Khanna','2005-10-20 12:28:00','CPSN Administrator','2005-10-20 12:28:00','Yes',NULL),
 (8752,'','Mekorma Electronic Funds Transfer (EFT)','Electronic Banking reduces the time spent processing payments and has the potential to reduce paperwork and mailing costs. Mekorma EFT is for any company using SAP Business One that wants to do bank transfers with their business partners. It is particularly helpful to businesses who would like to take payments over the phone or over the web using a customer?s bank information. As electronic banking becomes increasingly popular, Mekorma EFT is a necessary part of this solution.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,1,4,1,1,6,4,NULL,NULL,NULL,NULL,NULL,NULL,'','No',1500,1252,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Yes','','','','','No','','','If you are an authorized reseller of SAP Business One, then you\'re eligible to become a Mekorma reseller. Simply make a sale and you join the ranks of countless other respected SAP Business One resellers that use our products to solve customer problems and generate add-on revenue. Please contact sales@mekorma.com for pricing information.','','2006-02-09 00:00:00','','Stephanie Rasmussen','2005-10-20 13:10:00','CPSN Administrator','2005-10-20 13:10:00','Yes',NULL),
 (8754,'','CPM Advanced Financial Reporting','Multi-company organizations can quickly and efficiently consolidate financial statements from the individual entities into a single, accurate and up-to-date report. CPM AFR provides the detailed data needed for better reporting, increased audit trail capabilities and improved corporate governance (e.g., Sarbanes-Oxley).','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,2,2,0,1,3,12,8,80,2,12,1,1,'http://www.channelpathmarketing.com/cpm_afr.htm','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','Microsoft SQL 2000','Yes','Yes','B1','No','','','','','2006-03-31 00:00:00','','Brian Jamieson','2005-10-20 18:27:00','CPSN Administrator','2005-10-20 18:27:00','Yes',NULL),
 (8760,'','e-commerce sales&service','e-commerce sales&service AddOn for SAP Business One Some of the highlights are: Product-categories, current availabilities, article details, additional information, product recommendations, numerous marketing- and communications-functions: inquiries about status, delivery times, etc. , RMA completion, article FAQs, as well as flexible forms adjusted to the Corporate Design. A central element is SAP Business One. It is here where the process which makes the e-commerce platform so efficiant, originates. 24 hrs, 7 weekdays, 365 days per year: updated information about delivery times, availabilities, communications with customers, suppliers and dealers. A virtual market place with SAP business one at its center.','http://cpsn-channel.sap.com/rs','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',NULL,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL,NULL,NULL,'','Yes',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','Yes','Yes','','No','','','','','2006-03-31 00:00:00','','Florian Richter','2005-10-21 01:55:00','CPSN Administrator','2005-10-21 01:55:00','Yes',NULL),
 (8778,'','Bank Statement Import','It allows importing statement bank files automatically. It dynamically set up different bank files format.','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,1,1,NULL,1,1,3,3,10,1,1,1,1,'www.apollocon.com','Yes',500,413,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','SQL Server','Yes','Yes','','No','','','','','2005-10-24 00:00:00','Hector Ritondale','Scott.McMahon','2005-10-24 15:30:00','CPSN Administrator','2005-10-24 15:30:00','Yes',NULL),
 (8782,'','iRequest - Purchase Requisitioning','iRequest is a web based purchase requistioning system developed for SAP Business One that allows to enter a purchase request for items or services, follow it to an approval process and post it in SAP Business One as a purchase order. It includes RFQs, XML punchout and a very flexible workflow creation module. You can also follow the flow of the requisition, from PO cration to Invoicing , etc','','SAP Business One','2006-03-31 00:00:00','2006-03-31 00:00:00',1,1,2,NULL,1,1,1,3,100,1,3,NULL,NULL,'www.apollocon.com','Yes',3000,2500,0,0,150,125,NULL,NULL,NULL,NULL,'Yes','SQL Server','Yes','No','','No','','','','','2006-02-06 00:00:00','Scott McMahon','Scott.McMahon','2005-10-25 13:19:00','Scott.McMahon','2006-02-06 15:28:00','Yes',NULL);
/*!40000 ALTER TABLE `tbl_sol_directory` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_maturity`
--

DROP TABLE IF EXISTS `tbl_sol_maturity`;
CREATE TABLE `tbl_sol_maturity` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_maturity`
--

/*!40000 ALTER TABLE `tbl_sol_maturity` DISABLE KEYS */;
INSERT INTO `tbl_sol_maturity` (`id`,`name`) VALUES 
 (1,'Customer development'),
 (2,'Sold to more than one customer'),
 (3,'3+ reference customers');
/*!40000 ALTER TABLE `tbl_sol_maturity` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_sapallinone`
--

DROP TABLE IF EXISTS `tbl_sol_sapallinone`;
CREATE TABLE `tbl_sol_sapallinone` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_sapallinone`
--

/*!40000 ALTER TABLE `tbl_sol_sapallinone` DISABLE KEYS */;
INSERT INTO `tbl_sol_sapallinone` (`id`,`name`) VALUES 
 (1,'Not applicable'),
 (2,'4'),
 (3,'4.0B'),
 (4,'4.5'),
 (5,'4.5B'),
 (6,'4.6'),
 (7,'4.6B'),
 (8,'4.6C'),
 (9,'4.7'),
 (10,'4.7C');
/*!40000 ALTER TABLE `tbl_sol_sapallinone` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_saponeproduct`
--

DROP TABLE IF EXISTS `tbl_sol_saponeproduct`;
CREATE TABLE `tbl_sol_saponeproduct` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_saponeproduct`
--

/*!40000 ALTER TABLE `tbl_sol_saponeproduct` DISABLE KEYS */;
INSERT INTO `tbl_sol_saponeproduct` (`id`,`name`) VALUES 
 (1,'Not applicable'),
 (2,'2004 A'),
 (3,'2005 A'),
 (4,'6.5'),
 (5,'2004 B'),
 (6,'7'),
 (7,'7.1'),
 (8,'2004 C'),
 (9,'7.5'),
 (10,'7.6');
/*!40000 ALTER TABLE `tbl_sol_saponeproduct` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_solfocus`
--

DROP TABLE IF EXISTS `tbl_sol_solfocus`;
CREATE TABLE `tbl_sol_solfocus` (
  `id` int(10) NOT NULL auto_increment,
  `solSolFocus` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_solfocus`
--

/*!40000 ALTER TABLE `tbl_sol_solfocus` DISABLE KEYS */;
INSERT INTO `tbl_sol_solfocus` (`id`,`solSolFocus`) VALUES 
 (1,'mySAP All-in-One '),
 (2,'SAP Business One ');
/*!40000 ALTER TABLE `tbl_sol_solfocus` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_status_by_partner`
--

DROP TABLE IF EXISTS `tbl_sol_status_by_partner`;
CREATE TABLE `tbl_sol_status_by_partner` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_status_by_partner`
--

/*!40000 ALTER TABLE `tbl_sol_status_by_partner` DISABLE KEYS */;
INSERT INTO `tbl_sol_status_by_partner` (`id`,`name`) VALUES 
 (1,'Planned'),
 (2,'In development'),
 (3,'Development complete'),
 (4,'Development complete and in the process of being reviewed by SAP'),
 (5,'mySAP All-in-One Qualified / SAP Business One Certified / Reviewed'),
 (6,'Solution was canceled');
/*!40000 ALTER TABLE `tbl_sol_status_by_partner` ENABLE KEYS */;


--
-- Definition of table `tbl_sol_status_by_sap`
--

DROP TABLE IF EXISTS `tbl_sol_status_by_sap`;
CREATE TABLE `tbl_sol_status_by_sap` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_sol_status_by_sap`
--

/*!40000 ALTER TABLE `tbl_sol_status_by_sap` DISABLE KEYS */;
INSERT INTO `tbl_sol_status_by_sap` (`id`,`name`) VALUES 
 (1,'Planned'),
 (2,'In development'),
 (3,'In process of being reviewed by SAP'),
 (4,'mySAP All-in-One Qualified / SAP Business One Certified / Reviewed'),
 (5,'Solution was reviewed by SAP but did not meet Qualified or Certified status by SAP'),
 (6,'Solution was canceled');
/*!40000 ALTER TABLE `tbl_sol_status_by_sap` ENABLE KEYS */;


--
-- Definition of table `tbl_target_comp_size`
--

DROP TABLE IF EXISTS `tbl_target_comp_size`;
CREATE TABLE `tbl_target_comp_size` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_target_comp_size`
--

/*!40000 ALTER TABLE `tbl_target_comp_size` DISABLE KEYS */;
INSERT INTO `tbl_target_comp_size` (`id`,`name`) VALUES 
 (1,'Under 50 employees'),
 (2,'50 to 100 employees'),
 (3,'100 to 250 employees'),
 (4,'250 to 500 employees'),
 (5,'Over 500 employees');
/*!40000 ALTER TABLE `tbl_target_comp_size` ENABLE KEYS */;


--
-- Definition of table `tbl_user_type`
--

DROP TABLE IF EXISTS `tbl_user_type`;
CREATE TABLE `tbl_user_type` (
  `id` int(10) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_user_type`
--

/*!40000 ALTER TABLE `tbl_user_type` DISABLE KEYS */;
INSERT INTO `tbl_user_type` (`id`,`name`) VALUES 
 (1,'Concurrent'),
 (2,'Named');
/*!40000 ALTER TABLE `tbl_user_type` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
