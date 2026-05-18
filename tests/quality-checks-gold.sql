-- Check for duplicate in Primary Key
SELECT 
    Row_ID,
    COUNT(*) 
FROM gold.orders
GROUP BY Row_ID
HAVING COUNT(*) > 1;
