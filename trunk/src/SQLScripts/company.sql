#
# Florin PAduroiu
# Company table for LR SAP application
# Date: 2008-08-23 10:20:39
# --------------------------------------------------------
#
#
DROP TABLE IF EXISTS tbl_company;
CREATE TABLE  tbl_company (
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
  PRIMARY KEY  (`companyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
INSERT INTO tbl_company SET companyName='Cunningham Blythe',description='Cunningham Blythe is a consultancy organisationthat advises small and medium enterprises on business management and technology best practise. We specialise in enabling fast growing companies to make best use of SAP solutions in support of their growth strategy and business aspirations.',partnerNumber=810449,friendlySAP_site='http://cpsn-channel.sap.com/',adressId=1,noEmployees=8,parent_companyname='SAP',countryRegistrationId=2,partner_since=2006,last_review_date='2008-08-06 23:12:35',reviewed_By='Andy Cunningham',date_created='2008-08-06 23:12:35',date_updated='2008-08-06 23:12:35',modified_by='Andy Cunningham';
INSERT INTO tbl_company SET companyName='The Createch Group',description='Dedicated in improving business performance, The Createch Group is a leader in supply chain optimization and information technology integration. The consulting firm offers services in manufacturing and logistics performance, process reengineering, asset management optimization, change management, ERP and information technology solution implementation. The Createch Group helps customers configure and implement their SAP business solution to match their unique requirements. With their extensive SAP knowledge, the Group?s consultants (who are all certified by the SAP Solution Academy) can also apply industry best practices to help customers maximize their performance across the enterprise.',partnerNumber=318473,friendlySAP_site='http://cpsn-channel.sap.com/',adressId=0,noEmployees=200,parent_companyname='',countryRegistrationId=0,partner_since=1998,last_review_date='2008-08-05 23:12:00',reviewed_By='Helene Gamache',date_created='2008-08-05 23:12:00',date_updated='2008-08-05 23:12:00',modified_by='Helene Gamache';
