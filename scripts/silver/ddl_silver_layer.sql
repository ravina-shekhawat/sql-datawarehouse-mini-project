/* 
This Script Creates order table in silver schema.

*/

IF OBJECT_ID ('silver.order','U') IS NOT NULL
DROP TABLE silver.orders;
CREATE TABLE silver.orders (
Row_ID INT,
Order_ID NVARCHAR(50),
Order_Date DATE,
Ship_Date DATE,
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
