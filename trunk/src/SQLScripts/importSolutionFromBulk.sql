 SET SQL_MODE='';
USE lr_test;
DROP table if exists sol_directory_tmp;
CREATE TABLE sol_directory_tmp SELECT * from tbl_sol_directory;
ALTER TABLE `lr_test`.`sol_directory_tmp` ADD PRIMARY KEY (`solId`);
DELETE FROM `lr_test`.`sol_directory_tmp`;

insert into sol_directory_tmp (solId, 
partnerLink, 
partNumber, solName, solDesc, partComSite,
sapCertSince,
lastReviewBySAP,
averTrainEndUser, averImplTrainingDays, averImplEffort, averImplDuration, averSizeImplTeam, averSaleCycle, noCustomers,
smallImpl, largeImpl, smallImplTime, largeImplTime, smallImplTeamNo, largeImplTeamNo, solSite,
refCustAvailForUse, totalAppBaseLinePrice,
appPriceEur, hardwareCost, hardwareCostEur, averLicensePrice, averLicensePriceEur, addServiceCost, addServicePriceEur,
implCost, implCostEur, sapDiscount, dbUsed, SAPBusUsed, SAPGUIUsed, compA1B1Used, thirdPartyUsed, thirdPartyName,
otherIT, addRemarks, solSAPMicroSite, lastPartRevieDate, reviewedBy, profileAdded, dateCreated, modifiedBy,
dateUpdated, notificationProc, notificationText, companyId, maturityId, statusByProvider, statusBySAP, solUserType, countryPriceEuro, solMaturity
) select record_id, 
SUBSTRING(_1,LOCATE('[',_1)+1, LOCATE(']',_1) - LOCATE('[',_1)-1),
_2, sol_name, sol_desc, site,
str_to_date( date1,  '%d-%b-%Y %T' ),
str_to_date( date2,  '%d-%b-%Y %T' ),
CAST(_20_int AS UNSIGNED), CAST(_21 AS UNSIGNED), CAST(_22 AS UNSIGNED), CAST(_23 AS UNSIGNED), CAST(_24 AS UNSIGNED), CAST(_25 AS UNSIGNED), CAST(_26 AS UNSIGNED),
CAST(_27 AS UNSIGNED), CAST(_28 AS UNSIGNED), CAST(_29 AS UNSIGNED), CAST(_30 AS UNSIGNED), CAST(_31 AS UNSIGNED), CAST(_32 AS UNSIGNED), website,
_34, CAST(app_price AS UNSIGNED),
CAST(_37 AS UNSIGNED), CAST(_38 AS UNSIGNED), CAST(_39 AS UNSIGNED), CAST(_40 AS UNSIGNED), CAST(_41 AS UNSIGNED), CAST(_42 AS UNSIGNED), CAST(_43 AS UNSIGNED),
CAST(_44 AS UNSIGNED), CAST(_45 AS UNSIGNED), _47, _50, _51, _52, _53, _55, _56,
_57, _58, sol_site_MS, str_to_date( LastRevDate,  '%d-%b-%Y %T' ), _61, _62, str_to_date( Date_created, '%m/%d/%Y %H:%i'),_64,
str_to_date( Date_updated, '%m/%d/%Y %H:%i'), _66, _67, CAST(_38 AS UNSIGNED), CAST(_38 AS UNSIGNED), CAST(_38 AS UNSIGNED), CAST(_38 AS UNSIGNED), CAST(_38 AS UNSIGNED), CAST(_38 AS UNSIGNED), CAST(_38 AS UNSIGNED)
from soldirectorytaball;

SELECT date_format( sapCertSince , '%m/%d/%Y' ) AS my_date1 FROM sol_directory_tmp ;
SELECT date_format( str_to_date( date2, '%d.%m.%Y %T' ) , '%m/%d/%Y' ) AS my_date FROM sol_imported ;
