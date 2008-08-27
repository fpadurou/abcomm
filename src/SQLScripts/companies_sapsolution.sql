DROP TABLE IF EXISTS tbl_companies_sapsolution;
CREATE TABLE  tbl_companies_sapsolution (
  `companyId` bigint(20) NOT NULL,
  `sapsolutionId` bigint(20) default NULL,
  PRIMARY KEY  (`companyId`,`sapsolutionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;