/*
=========================================================================================

Create a Database and Schemas

=========================================================================================

Script Purpose:

    This script creates a new database called Data_Warehouse after checking it already exists.
    if databasse exists, it dropped and recreated it. Additionally, the script set up three 
    schemas with the database : 'bronze','silver','gold'

WARNING : 
    Running this script will drop the Data_Warehouse database if exists.
    The data will be permanently deleted, so make sure to backup first
    before drop the database
*/

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'Data_Warehouse')
BEGIN
    PRINT 'WARNING: Dropping database Data_Warehouse. Make sure you have a backup.';
    ALTER DATABASE Data_Warehouse set SINGLE_USER WITH ROLLBACK IMMEDIATE
    DROP DATABASE Data_Warehouse;
END;
GO

-- default DB after login
use master;

-- CREATE a new database called Data_Warehouse

CREATE DATABASE Data_Warehouse
USE Data_Warehouse
  
-- Creating Schema 
CREATE SCHEMA bronze;
go
CREATE SCHEMA silver;
go
CREATE SCHEMA gold;
go
