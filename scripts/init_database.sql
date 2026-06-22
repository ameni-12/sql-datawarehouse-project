/*
script purpose: 
this script creates a new database named 'dDatawarehouse' after checking if it already exists.
if the database exists ,it is dropped and recreated . Additionally, the script sets up 3 schemas whithin the database :"bronze" , "silver" and "gold".
warning : proceed with caution . running this script will drop the entire 'Datawarehouse' database if it exists .
*/
--create database 'warehouse'
USE master;
GO
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Datawarehouse')
BEGIN 
	ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE Datawarehouse;
END;
GO
CREATE DATABASE Datawarehouse;
GO
USE Datawarehouse;
GO
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA GOLD;
GO
