# BULK INSERT Error in SQL Server - Fixed 
### Problem 1 
First time i downloaded Data from **Kaggle** and started BULK INSERT,    
While trying to load a CSV file using BULK INSERT,I got this Error :  

![Error Screenshot](error.jpg)
**Error Message Screenshot**  
#### My Solved Query  
![Bulk Insert Error Solved Screenshot](solution.jpg)  
``` SQL

BULK INSERT bronze.orders
FROM 'C:\tmp\train.csv'
WITH (
       FORMAT = 'CSV',
       FIRSTROW = 2,
       FIELDTERMINATOR = ',',
       FIELDQUOTE = '"',
    -- ROWTERMINATOR = '\n', This was the problem
       ROWTERMINATOR = '0x0a', -- This is solution
       TABLOCK
 );
```
**Just Changed the ROWTERMINATOR and it worked perfectly!**  
### Quick Tips for Beginners   
- Use ROWTERMINATOR = '0x0A' Best for most **Downloaded** CSV files
- Use ROWTERMINATOR = '\n' Good for normal Windows created files
- You can check line endings of your file using **Notepad++**


