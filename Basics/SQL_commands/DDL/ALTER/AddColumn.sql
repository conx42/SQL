create database if not exists tempdb5;
use tempdb5;
create table if not exists account
(
	id int primary key,
    name varchar(255) UNIQUE,
    balance int not null default 0
);
show tables;
desc account;

-- ADD Column - Named as Interest
ALTER TABLE account
ADD Interest float NOT NULL DEFAULT 0;

-- ADD Column - Named as rateOfInterest
ALTER TABLE account
ADD rateOfInterest float NOT NULL DEFAULT 0;

-- MODIFY / ALTER Column - Named as Interest
ALTER TABLE account
MODIFY COLUMN Interest double;

ALTER TABLE account
MODIFY COLUMN Interest double NOT NULL DEFAULT 0;

-- 
ALTER TABLE account
MODIFY rateofinterest varchar(255);




