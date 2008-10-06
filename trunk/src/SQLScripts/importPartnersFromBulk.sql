 SET SQL_MODE='';
USE lr_test;
DROP table if exists tbl_company_tmp;
CREATE TABLE tbl_company_tmp SELECT * from tbl_company;
ALTER TABLE `lr_test`.`tbl_company_tmp` ADD PRIMARY KEY (`companyId`);
DELETE FROM `lr_test`.`tbl_company_tmp`;

insert into tbl_company_tmp ( companyId ,
 companyName ,
 description ,
 partnerNumber ,
 friendlySAP_site ,
 web_site ,
 noEmployees ,
 parent_companyname ,
 partner_since ,
 last_review_date ,
 reviewed_By ,
 date_created ,
 date_updated ,
 modified_by ,
 userId 
)
select _1, _2, _3, _4, _15, _16, _29, _31, _33, str_to_date( _40,  '%d-%b-%Y %T' ), _41, str_to_date( _42, '%m/%d/%Y %H:%i'), str_to_date( _43, '%m/%d/%Y %H:%i'), _44, 0 
from partnerdirectorytaball;

SELECT date_format( str_to_date( date2, '%d.%m.%Y %T' ) , '%m/%d/%Y' ) AS my_date FROM sol_imported ;
/* SET SQL_MODE='';*/
/*USE lr_test;
DROP table if exists tbl_adress_tmp;
CREATE TABLE tbl_adress_tmp SELECT * from tbl_adress;
ALTER TABLE `lr_test`.`tbl_adress_tmp` ADD PRIMARY KEY (`adressId`);
ALTER TABLE `lr_test`.`tbl_adress_tmp` MODIFY COLUMN `adressId` BIGINT(20) NOT NULL DEFAULT NULL AUTO_INCREMENT;


DELETE FROM `lr_test`.`tbl_adress_tmp`;
*/
DELETE FROM `lr_test`.`tbl_adress`;
insert into tbl_adress   (
  `companyId`,
  `mail` ,
  `street1` ,
  `street2` ,
  `city`,
  `zip` ,
  `stateregionname` 
)
select _1, _8, _9, _10, _12, _11, _13
from partnerdirectorytaball;

update tbl_company_tmp, tbl_adress set tbl_company_tmp.adressId = tbl_adress.adressId where tbl_adress.companyId = tbl_company_tmp.companyId;

DELETE FROM `lr_test`.`tbl_phone`;
/* phone*/
insert into tbl_phone   (
  `companyId` ,
  `number_`,
  `typeId` 
)
select _1, _6, 1
from partnerdirectorytaball;

/* fax*/
insert into tbl_phone   (
  `companyId` ,
  `number_`,
  `typeId` 
)
select _1, _7, 2
from partnerdirectorytaball;

update tbl_adress, tbl_phone set tbl_adress.phoneId = tbl_phone.phoneId where (tbl_adress.companyId = tbl_phone.companyId AND tbl_phone.typeId = 1);
update tbl_adress, tbl_phone set tbl_adress.faxId = tbl_phone.phoneId where (tbl_adress.companyId = tbl_phone.companyId AND tbl_phone.typeId = 2);
update tbl_adress, tbl_countries, partnerdirectorytaball set tbl_adress.countryId = tbl_countries.countryId where (partnerdirectorytaball._1 = tbl_adress.companyId AND partnerdirectorytaball._14 = tbl_countries.country_name );
/*parent commpany country */
update tbl_company_tmp, tbl_countries, partnerdirectorytaball set tbl_company_tmp.countryRegistrationId = tbl_countries.countryId where (partnerdirectorytaball._1 = tbl_company_tmp.companyId AND partnerdirectorytaball._32 = tbl_countries.country_name );
SELECT * from tbl_company_tmp ;