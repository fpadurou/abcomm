﻿#
# MySQL-Dump created by SQL Database Import Utility, 1.0.44, Host-ID: 3cc14929
# HTTP-Host: www.sqldbu.com
# Date: 2008-09-07 21:53:08
# --------------------------------------------------------
#
#
DROP TABLE IF EXISTS tbl_Sol_Directory;
CREATE TABLE IF NOT EXISTS tbl_Sol_Directory (solId BIGINT(20) NOT NULL auto_increment,
companyId BIGINT(20) default NULL,
partNumber varchar(20),
solName varchar(80) NOT NULL default '',
solDesc LONGTEXT ,
partComSite varchar(80) default '',
solFocus varchar(212) default '',
sapCertSince datetime default NULL,
lastReviewBySAP datetime default NULL,
averTrainEndUser int(10) ,
averImplTrainingDays int(10),
averImplEffort int(10),
averImplDuration int(10),
averSizeImplTeam int(10),
averSaleCycle int(10),
noCustomers int(10),
smallImpl int(10),
largeImpl int(10),
smallImplTime int(10),
largeImplTime int(10),
smallImplTeamNo int(10),
largeImplTeamNo int(10),
solSite varchar(80) default '',
refCustAvailForUse CHAR(7) NOT NULL default '',
totalAppBaseLinePrice BIGINT(20),
appPriceEur bigint(20),
hardwareCost bigint(20),
hardwareCostEur bigint(20),
averLicensePrice bigint(20),
averLicensePriceEur bigint(20),
addServiceCost bigint(20),
addServicePriceEur bigint(20),
implCost bigint(20),
implCostEur bigint(20),
sapDiscount CHAR(7) NOT NULL default '',
dbUsed VARCHAR(80) NOT NULL default '',
SAPBusUsed CHAR(3) NOT NULL default '',
SAPGUIUsed CHAR(3) NOT NULL default '',
compA1B1Used VARCHAR(125) NOT NULL default '',
thirdPartyUsed CHAR(10) NOT NULL default '',
thirdPartyName VARCHAR(80) NOT NULL default '',
otherIT VARCHAR(80) NOT NULL default '',
addRemarks LONGTEXT,
solSAPMicroSite VARCHAR(80) NOT NULL default '',
lastPartRevieDate DATETIME default null,
reviewedBy VARCHAR(80) NOT NULL default '',
profileAdded VARCHAR(80) NOT NULL default '',
dateCreated DATETIME default null,
modifiedBy VARCHAR(80) NOT NULL default '',
dateUpdated DATETIME default null,
notificationProc CHAR(3) NOT NULL default '',
PRIMARY KEY (solId) );