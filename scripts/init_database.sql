-- Create the database and the three schemas: bronze, silver, and gold.
USE master;
GO
IF DB_ID('home') IS NOT NULL
ALTER DATABASE home SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
DROP DATABASE IF EXISTS home;
GO
-- Create Database 'home'
CREATE DATABASE home;
GO 
USE home;
GO 
-- Create Schema
CREATE SCHEMA bronze ;
GO
CREATE SCHEMA silver ;
GO
CREATE SCHEMA gold ;
GO
