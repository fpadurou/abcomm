DROP TABLE IF EXISTS Registration;
CREATE TABLE Registration (
  userId integer auto_increment primary key,
  companyId BIGINT(20),
  adressId BIGINT(20),
  userFirstName varchar(75) null,
  userLastName varchar(75) null,
  userCompanyName varchar(75) null,
  userPositionCompany varchar(75) null,
  userMobilePhone varchar(75) null,
  userWorkPhone varchar(75) null
);