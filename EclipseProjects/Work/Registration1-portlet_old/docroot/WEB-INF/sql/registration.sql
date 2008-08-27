//drop database if exists sample_dao;
//create database training character set utf8;
use test;

CREATE TABLE Registration (
  userId integer auto_increment primary key,
  userFirstName varchar(75) null,
  userLastName varchar(75) null,
  userCompanyName varchar(75) null,
  userPositionCompany varchar(75) null,
  userMobilePhone varchar(75) null,
  userWorkPhone varchar(75) null
);
