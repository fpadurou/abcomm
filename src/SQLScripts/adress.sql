DROP TABLE IF EXISTS tbl_adress;
CREATE TABLE  tbl_adress (
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

DROP TABLE IF EXISTS tbl_phone;
CREATE TABLE  tbl_phone (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;