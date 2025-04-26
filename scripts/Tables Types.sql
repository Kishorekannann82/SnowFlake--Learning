USE ROLE ACCOUNTADMIN;

USE WAREHOUSE COMPUTE_WH;

create or replace database mydb;

create or replace schema mydb.myschema;

//Create a permanent Table
create or replace table Permanent_Tabe(
id int,
name string
);
ALTER TABLE PERMANENT_TABE set data_retention_time_in_days=3;

//Create a Transient Table
create or replace transient TABLE Transmit_TABLE(
ID INT,
name string
);
ALTER TABLE TRANSMIT_TABLE set data_retention_time_in_days=2;

//Create a temporary table
create or replace TEMPORARY TABLE Temporary_TABLE(
ID INT,
name string
);
ALTER TABLE TEMPORARY_TABLE set data_retention_time_in_days=2;

show tables;
