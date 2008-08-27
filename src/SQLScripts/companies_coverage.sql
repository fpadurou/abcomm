DROP TABLE IF EXISTS tbl_companies_coverage;
CREATE TABLE  tbl_companies_coverage (
  `companyId` bigint(20) NOT NULL,
  `countryId` bigint(20) default NULL,
  `regionId` bigint(20) default NULL,
  PRIMARY KEY  (`companyId`,`countryId`,`regionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
