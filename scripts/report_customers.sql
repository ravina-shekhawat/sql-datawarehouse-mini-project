/*
 Sales Performance Analysis using SQL. This report 
contains business insights generated using SQL Queries.
*/
-- Question 1:
-- Which region has highest sales ?
USE home;
SELECT * FROM gold.orders;
SELECT TOP 1
Region,
SUM(Sales) AS Total_Sales
FROM gold.orders
GROUP BY Region
ORDER BY Sales DESC
;
-- Insight:
-- West region has the highest sales.

/*======================================================*/

-- Question 2:
-- Which Category is most profitable ?

SELECT TOP 1
Category,
SUM(sales) AS Total_Sales
FROM gold.orders
GROUP BY Category
ORDER BY Sales DESC;

-- Insight:
-- Technology is most profitable Category.

/*===================================================*/

-- Question 3:
-- Top 10 Products by sales (Using CTE)
WITH Top_Prd AS (
SELECT 
Product_ID,
SUM(Sales) AS Total_Sales,
DENSE_RANK() OVER(ORDER BY SUM(Sales) DESC ) AS Rn
FROM gold.orders
GROUP BY Product_ID)

SELECT * FROM Top_Prd
WHERE Rn <= 10;

/*===================================================*/

-- Question 4:
-- Average delivery time by ship mode
SELECT 
Ship_Mode,
CAST(AVG(1.0*DATEDIFF(DAY,Order_Date,Ship_Date)) AS DECIMAL(10,2)) AS Average_Days
FROM gold.orders
GROUP BY Ship_Mode
ORDER BY Average_Days DESC;

-- Insight:
-- Standard Class = 5.01 Average Delivery Days
-- Second Class= 3.25 Average Delivery Days
-- First Class = 2.18 Average Delivery Days
-- Same Day = 0.04 Average Delivery Days

/*===================================================*/

-- Total sales by category
SELECT
category ,
SUM(sales) AS total
FROM gold.orders
GROUP BY Category

-- Total sales by region

SELECT
Region ,
SUM(sales)  AS Total_Sales
FROM gold.orders
GROUP BY Region

-- Top 5 customers by sales
SELECT TOP 5
Customer_ID,
Customer_Name ,
SUM(sales) AS Total,
ROW_NUMBER() OVER(ORDER BY SUM(sales) DESC) AS Rn
FROM gold.orders
GROUP BY 
Customer_ID,
Customer_Name
;

-- Monthly sales trend
SELECT 
YEAR(order_date) AS Year,
MONTH(order_date) AS Month,
SUM(sales) AS Total_sales
FROM gold.orders
GROUP BY 
YEAR(order_date),
MONTH(order_date)
ORDER BY YEAR(order_date),
MONTH(order_date)
;

-- Delivery time
SELECT 
order_date,
ship_date,
DATEDIFF(Day,Order_Date,Ship_Date) AS Delivery_Days
FROM gold.orders;
