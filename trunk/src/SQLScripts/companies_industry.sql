DROP TABLE IF EXISTS tbl_companies_industries;
CREATE TABLE  tbl_companies_industries (
  `companyId` bigint(20) NOT NULL,
  `industryId` bigint(20) default NULL,
  PRIMARY KEY  (`companyId`,`industryId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;