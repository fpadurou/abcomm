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
 adressId ,
 noEmployees ,
 parent_companyname ,
 countryRegistrationId ,
 partner_since ,
 last_review_date ,
 reviewed_By ,
 date_created ,
 date_updated ,
 modified_by ,
 userId
)
select _1, _2, _3, _4, _15, _16, 1, _29, _31, 1, _33, str_to_date( _40,  '%d-%b-%Y %T' ), _41, str_to_date( _42, '%m/%d/%Y %H:%i'), str_to_date( _43, '%m/%d/%Y %H:%i'), _44, 0 
from partnerdirectorytaball;

SELECT date_format( str_to_date( date2, '%d.%m.%Y %T' ) , '%m/%d/%Y' ) AS my_date FROM sol_imported ;