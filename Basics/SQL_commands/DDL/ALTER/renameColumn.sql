show databases;
use tempdb5;
show tables;
desc account;

-- ADD column
ALTER TABLE account
ADD current_account float NOT NULL DEFAULT 0;

desc account;

-- RENAME column
ALTER TABLE account
CHANGE COLUMN current_account savings_account float;

ALTER TABLE account
CHANGE COLUMN savings_account current_account float NOT NULL DEFAULT 0;





