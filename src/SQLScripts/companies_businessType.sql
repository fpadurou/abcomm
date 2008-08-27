DROP TABLE IF EXISTS tbl_companies_businessType;
CREATE TABLE  tbl_companies_businessType (
  `companyId` bigint(20) NOT NULL,
  `businesstypeId` bigint(20) default NULL,
  `type_` tinyint(4) default NULL,
  PRIMARY KEY  (`companyId`,`businesstypeId`,`type_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
