#
# Date: 2008-08-19 18:05:16
# --------------------------------------------------------
#  
#
DROP TABLE IF EXISTS tbl_businesstype;
CREATE TABLE IF NOT EXISTS tbl_businesstype (business_name CHAR(30) NOT NULL default '', businesstypeId INT(10) unsigned NOT NULL auto_increment, PRIMARY KEY (businesstypeId) );
SET sql_mode='';
INSERT INTO tbl_businesstype SET business_name='Value-added reseller';
INSERT INTO tbl_businesstype SET business_name='Independent';
INSERT INTO tbl_businesstype SET business_name='Service';
INSERT INTO tbl_businesstype SET business_name='Consulting';
INSERT INTO tbl_businesstype SET business_name='Hosting/';
INSERT INTO tbl_businesstype SET business_name='Distributor';