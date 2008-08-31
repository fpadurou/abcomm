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
  `adressId` bigint(20) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_adress`
--

/*!40000 ALTER TABLE `tbl_adress` DISABLE KEYS */;
INSERT INTO `tbl_adress` (`adressId`,`companyId`,`userId`,`userName`,`mail`,`createDate`,`modifiedDate`,`street1`,`street2`,`city`,`zip`,`stateregionname`,`countryId`,`phoneId`,`faxId`) VALUES 
 (1,1,0,NULL,'gigi@yahoo.com',NULL,NULL,'Street Av','Street Av','Brasov','70000','Valea Prahovei',220,3,7),
 (2,2,0,NULL,'accentway@aaa.com',NULL,NULL,'51 Street','51 Street','Ottawa','2134 adas','Canada 12',39,1,2);
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
 ('Value-added',1),
 ('Independent',2),
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
 (1,4,2),
 (1,6,1),
 (2,1,2),
 (2,3,1);
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
 (1,3,0),
 (1,4,0);
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
 (2,29);
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
 (2,1),
 (2,2),
 (2,3),
 (4,4),
 (4,6),
 (4,7);
/*!40000 ALTER TABLE `tbl_companies_sapsolution` ENABLE KEYS */;


--
-- Definition of table `tbl_company`
--

DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE `tbl_company` (
  `companyId` bigint(20) NOT NULL auto_increment,
  `companyName` varchar(80) NOT NULL default '',
  `description` longtext,
  `partnerNumber` bigint(20) NOT NULL,
  `friendlySAP_site` varchar(80) NOT NULL default '',
  `web_site` varchar(80) NOT NULL default '',
  `adressId` bigint(20) NOT NULL,
  `noEmployees` int(10) NOT NULL,
  `parent_companyname` varchar(80) NOT NULL default '',
  `countryRegistrationId` bigint(20) default NULL,
  `partner_since` int(10) default NULL,
  `last_review_date` datetime default NULL,
  `reviewed_By` varchar(75) default NULL,
  `date_created` datetime default NULL,
  `date_updated` datetime default NULL,
  `modified_by` varchar(75) default NULL,
  PRIMARY KEY  (`companyId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_company`
--

/*!40000 ALTER TABLE `tbl_company` DISABLE KEYS */;
INSERT INTO `tbl_company` (`companyId`,`companyName`,`description`,`partnerNumber`,`friendlySAP_site`,`web_site`,`adressId`,`noEmployees`,`parent_companyname`,`countryRegistrationId`,`partner_since`,`last_review_date`,`reviewed_By`,`date_created`,`date_updated`,`modified_by`) VALUES 
 (1,'Cunningham Blythe','																								Cunningham Blythe is a consultancy organisationthat advises small and medium enterprises on business management and technology best practise. We specialise in enabling fast growing companies to make best use of SAP solutions in support of their growth strategy and business aspirations.\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			',810449,'http://cpsn-channel.sap.com/','www.myWebSite.ro',1,250,'SAP',26,2006,'2008-09-03 00:00:00','Jhon MKcanzie','2008-09-03 00:00:00','2008-08-31 00:00:00',NULL),
 (2,'The Createch Group','												Dedicated in improving business performance, The Createch Group is a leader in supply chain optimization and information technology integration. The consulting firm offers services in manufacturing and logistics performance, process reengineering, asset management optimization, change management, ERP and information technology solution implementation. The Createch Group helps customers configure and implement their SAP business solution to match their unique requirements. With their extensive SAP knowledge, the Group?s consultants (who are all certified by the SAP Solution Academy) can also apply industry best practices to help customers maximize their performance across the enterprise.\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			\r\n			',318473,'http://cpsn-channel.sap.com/','www.accentway.com',2,200,'IBM',21,1998,'2008-08-12 00:00:00','Helene Gamache','2008-08-12 00:00:00','2008-08-31 00:00:00',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_phone`
--

/*!40000 ALTER TABLE `tbl_phone` DISABLE KEYS */;
INSERT INTO `tbl_phone` (`phoneId`,`companyId`,`userId`,`userName`,`createDate`,`modifiedDate`,`number_`,`extension`,`typeId`) VALUES 
 (1,1,NULL,NULL,NULL,NULL,'123233 3231','122',NULL),
 (2,1,NULL,NULL,NULL,NULL,'444 4324 2423','22',NULL),
 (3,NULL,NULL,NULL,NULL,NULL,'123123123','23',NULL),
 (4,NULL,NULL,NULL,NULL,NULL,'213 2133 ','11',NULL),
 (5,NULL,NULL,NULL,NULL,NULL,'123 321',NULL,1),
 (6,NULL,NULL,NULL,NULL,NULL,'111111111',NULL,2),
 (7,NULL,NULL,NULL,NULL,NULL,'22222222',NULL,2);
/*!40000 ALTER TABLE `tbl_phone` ENABLE KEYS */;


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




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
