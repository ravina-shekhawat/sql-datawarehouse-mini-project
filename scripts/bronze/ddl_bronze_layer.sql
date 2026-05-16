
/* This Script Creates orders table in bronze scheme */
USE HOME;
IF OBJECT_ID('bronze.orders', 'U') IS NOT NULL
BEGIN
	DROP TABLE bronze.orders;
END 

CREATE TABLE bronze.orders (
Row_ID INT,
Order_ID NVARCHAR(50),
Order_Date VARCHAR(20),-- Date Column
Ship_Date VARCHAR(20),-- Date Column
Ship_Mode VARCHAR(50),
Customer_ID NVARCHAR(100),
Customer_Name NVARCHAR(100),
Segment VARCHAR(50),
Country VARCHAR(50),
City NVARCHAR(100),
State NVARCHAR(100),
Postal_Code NVARCHAR(50),
Region VARCHAR(50),
Product_ID NVARCHAR(100),
Category NVARCHAR(50),
Sub_Category NVARCHAR(50),
Product_Name  NVARCHAR(150),
Sales DECIMAL(10,3)
);
