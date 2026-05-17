/* 
This Script Checks the Data Quality of orders table in silver schema
Check for NULL
Check for negative Sells
Check for invalid Date
check for Unwanted spaces
Data Validation

*/
-- Checking for duplicates PK in silver.orders
USE home;
select * from (
select Row_ID,
ROW_NUMBER() OVER (ORDER BY Row_ID) AS Row_Num,
ROW_NUMBER() OVER (ORDER BY Row_ID)-Row_ID as Row_Diff
from silver.orders)t
where Row_Diff > 0
;

-- Checking for nulls in PK column in silver.orders
SELECT * FROM silver.orders
WHERE Row_ID IS NULL

-- Checking for Extra Spaces
-- Checking for leading and trailing spaces in Customer_Name column
SELECT * FROM silver.orders
WHERE Customer_Name != TRIM(Customer_Name)

-- Checking for leading and trailing spaces in State column
SELECT * FROM silver.orders
WHERE State != TRIM(State)
-- Checking for leading and trailing spaces in Product_Name column
SELECT * FROM silver.orders
WHERE Product_Name != TRIM(Product_Name)

-- Checking for invalid Date
SELECT * FROM silver.orders
WHERE Order_Date > Ship_Date
;
-- NULL Checking
select * from silver.orders
where order_id is null 
or Order_Date is null
OR Ship_Date IS NULL
OR Ship_Mode IS NULL
OR Customer_ID IS NULL
OR Customer_Name IS NULL
OR Segment IS NULL
OR Country IS NULL
OR City IS NULL
OR State IS NULL
OR Postal_Code IS NULL
OR Region IS NULL
OR Product_ID IS NULL
OR Product_Name IS NULL
OR Category IS NULL
OR Sub_Category IS NULL
OR Sales IS NULL

-- Checking for negative Sales
SELECT  * FROM silver.orders
WHERE Sales < 0

-- Check Data Validation for Ship Mode
select distinct ship_mode from silver.orders

-- Check Data Validation for Segment
SELECT DISTINCT Segment FROM silver.orders

-- Check Data Validation for Country
SELECT DISTINCT Country FROM silver.orders

-- Check Data Validation for Region
SELECT DISTINCT Region FROM silver.orders
