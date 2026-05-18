/* 
This script creates View in Gold Schema 
*/
IF OBJECT_ID('gold.orders','V') IS NOT NULL
DROP VIEW gold.orders
GO
  CREATE VIEW gold.orders AS
   SELECT 
    Row_ID,
    Order_ID,
    Order_Date,
    Ship_Date,
    Ship_Mode,
    Customer_ID,
    Customer_Name,
    Segment,
    Country,
    City,
    State,
    Region,
    Product_ID,
    Category,
    Sub_Category,
    Sales
  FROM silver.orders	;
