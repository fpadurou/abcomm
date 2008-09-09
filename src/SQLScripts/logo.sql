DROP TABLE IF EXISTS tbl_logo;
CREATE TABLE IF NOT EXISTS tbl_logo (
id INT(4) NOT NULL AUTO_INCREMENT PRIMARY KEY,
description CHAR(50),
bin_data LONGBLOB,
filename CHAR(50),
filesize CHAR(50),
filetype CHAR(50),
companyId BIGINT(2) NOT NULL
);
