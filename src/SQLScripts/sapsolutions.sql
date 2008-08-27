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
DROP TABLE IF EXISTS tbl_sapsolutions;
CREATE TABLE IF NOT EXISTS tbl_sapsolutions (SAPSolution_name CHAR(20) NOT NULL default '', sapsolutionId INT(10) unsigned NOT NULL auto_increment, PRIMARY KEY (sapsolutionId) );
SET sql_mode='';
INSERT INTO tbl_sapsolutions SET SAPSolution_name='mySAP All-in-One';
INSERT INTO tbl_sapsolutions SET SAPSolution_name='SAP Business One';
INSERT INTO tbl_sapsolutions SET SAPSolution_name='SAP ByDesign';