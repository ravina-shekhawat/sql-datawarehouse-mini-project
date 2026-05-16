/*
This script creates Stored Procedure to automate CSV data 
loading  into bronze.orders table.

It truncates old data, imports fresh data using BULK INSERT 
and displays the loaded records.
*/
-- Creating Stored Procedure
CREATE OR ALTER PROCEDURE bronze.bronze_load AS 
BEGIN
TRUNCATE TABLE bronze.orders; -- Truncates Old Data
BULK INSERT bronze.orders   -- BULK INSERT
FROM 'c:\tmp\train.csv'
WITH (
FORMAT = 'CSV',
FIRSTROW = 2,
ROWTERMINATOR = '0x0A',
FIELDTERMINATOR = ',',
TABLOCK
);
SELECT * FROM bronze.orders -- Displays the data
  Order by Row_ID ; -- Shorts Data in Ascending By Row_ID
END;

-- Exicute/Call the Stored Procedure
use home;
EXEC bronze.bronze_load;
