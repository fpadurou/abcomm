/**
 * Database script for sap
 * Writed for		: mySQL
 * Created			: 20 August 2008
 * By				: Florin Paduroiu
 * Version			: 1.0
 *
 * Changes history:
 */

/*
* Create Database
*/
DROP TABLE IF EXISTS tbl_regions;
CREATE TABLE IF NOT EXISTS tbl_regions (region_name CHAR(10) NOT NULL default '',
                                        regionId INT(10) unsigned NOT NULL,
                                        PRIMARY KEY (regionId) )ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET sql_mode='';
INSERT INTO tbl_regions SET region_name='Global', regionId = 1;
INSERT INTO tbl_regions SET region_name='Americas', regionId = 2;
INSERT INTO tbl_regions SET region_name='APA', regionId = 3;
INSERT INTO tbl_regions SET region_name='EMEA', regionId = 4;
INSERT INTO tbl_regions SET region_name='LA', regionId = 5;