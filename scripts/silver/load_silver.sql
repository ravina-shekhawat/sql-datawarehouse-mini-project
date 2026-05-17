/* 
This script creates or alters a stored procedure to load data into the silver
orders table from bronze.orders,
including truncating the table before the insert.
*/

CREATE OR ALTER PROCEDURE silver_load AS 
    BEGIN
      TRUNCATE TABLE silver.orders ;
      INSERT INTO silver.orders
       (
          Row_ID,
          Order_ID ,
          Order_Date ,
          Ship_Date ,
          Ship_Mode ,
          Customer_ID ,
          Customer_Name ,
          Segment ,
          Country ,
          City ,
          State ,
          Postal_Code ,
          Region ,
          Product_ID ,
          Category ,
          Sub_Category ,
          Product_Name ,
          Sales
       )
      SELECT 
          Row_ID,
          Order_ID ,
          TRY_CONVERT(DATE,Order_Date ,105),
          TRY_CONVERT(DATE, Ship_Date ,105),
          Ship_Mode ,
          Customer_ID ,
          Customer_Name ,
          Segment ,
          Country ,
          City ,
          State ,
          coalesce(Postal_Code,0) ,
          Region ,
          Product_ID ,
          Category ,
          Sub_Category ,
          Product_Name ,
          Sales
          FROM bronze.orders;
      SELECT * FROM silver.orders
    END;
    
    -- Execute Stored Procedure
    USE home; -- DB 
    EXEC silver_load
    









