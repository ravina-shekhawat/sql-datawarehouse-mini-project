> **Note:**  
This README was created with the help of GitHub Copilot AI , because i am learning   
how to write professional README files. right now i don't know how to write a  
decent README. I only Know ETL , Medallion Architecture , how to write SQL Queries for insight.  
I also plan to learn from this README and improve my documentation skills over time.


# SQL Data Warehouse Mini Project 🏗️

## Why Did I Create This Project?

Hi! I'm a beginner learning SQL and data warehousing. About 2-3 months ago, I learned about the **ETL (Extract, Transform, Load) process** and the **Medallion Architecture** (Bronze, Silver, Gold layers). It was really interesting, but after some time, I forgot many concepts. 

So I created this project to **revise and summarize** everything I learned. This is my honest reason - not a production project, but a **learning and revision tool** to keep ETL concepts fresh in my mind! 

This is totally normal in real-world projects too - people create smaller projects to refresh their knowledge and practice new skills. 🎯

---

## What Is This Project About?

This is a mini data warehouse project where I:

1. **Took real data** from Kaggle (a sales dataset with 9,800+ rows)
2. **Fixed data problems** (like date format issues and CSV loading errors)
3. **Built a 3-layer data warehouse** using SQL Server with the Medallion Architecture
4. **Wrote SQL queries** to analyze the data and get business insights

Think of it like building a house with 3 floors where data gets cleaner as it moves up! 🏠

---

## Project Structure

```
sql-datawarehouse-mini-project/
│
├── datasets/
│   └── train.csv                 # Kaggle sales dataset (9,800+ rows)
│
├── scripts/
│   ├── init_database.sql         # Creates database and 3 schemas
│   ├── bronze/
│   │   ├── ddl_bronze_layer.sql  # Creates bronze.orders table
│   │   └── load_bronze.sql       # Loads data from CSV into bronze layer
│   ├── silver/
│   │   ├── ddl_silver_layer.sql  # Creates silver.orders table with proper data types
│   │   └── load_silver.sql       # Cleans data and moves it from bronze to silver
│   ├── gold/
│   │   ├── ddl_gold.sql          # Creates gold.orders view (final clean data)
│   │   └── placeholder
│   ├── report_customers.sql      # Business analysis queries
│   └── placeholder
│
├── tests/
│   ├── quality-checks-silver.sql # Data quality tests for silver layer
│   ├── quality-checks-gold.sql   # Data quality tests for gold layer
│   └── placeholder
│
├── docs/
│   ├── bulk_insert_error.md      # Document about CSV loading errors I faced
│   ├── data_catalog.md           # For future data documentation
│   └── placeholder
│
└── README.md                      # You are here! 👋

```

---

## The 3 Layers Explained (Super Simple!)

### 🥉 **Bronze Layer** - Raw Data
- This is where **raw data from CSV lands** without any cleaning
- Data types are mostly `VARCHAR` (text format) to avoid errors
- It's messy, just like it came from the source

### 🥈 **Silver Layer** - Cleaned Data
- Data from bronze layer is **cleaned and fixed** here
- Date columns are converted from text to proper `DATE` type
- NULL values are handled
- Data types are set correctly (INT for numbers, DECIMAL for prices, etc.)
- This is where we apply business rules

### 🥇 **Gold Layer** - Business Ready
- This is where we **remove unnecessary columns** and keep only what business needs
- It's clean, fast, and ready for reports and analysis
- Typically shown as a **VIEW** to end users

---

## Problems I Solved (Learning Experience!)

### Problem 1: BULK INSERT Error ❌➡️✅

When I tried loading the CSV file, I got an error. The issue was the **ROWTERMINATOR** parameter. 

**What I learned:** Different CSV files have different line endings. Some use `\n`, some use `0x0a`. I had to change it!

Check `docs/bulk_insert_error.md` for the full solution.

### Problem 2: Date Format Issues ⏰

The dates in CSV were in `DD/MM/YYYY` format, but SQL Server wanted `YYYY-MM-DD`. 

**What I learned:** Instead of changing the CSV, I stored dates as `VARCHAR` in bronze layer, then used `TRY_CONVERT()` in silver layer to convert them properly. Smart!

### Problem 3: Column Length Guessing 📏

I guessed that `VARCHAR(50)` was enough for product names, but some products had longer names and would get cut off!

**What I learned:** Always check the actual data first (using Excel LEN function) before deciding column sizes.

---

## How to Use This Project

### Step 1: Setup Database
```sql
-- Run this first to create database and schemas
EXEC scripts/init_database.sql
```

### Step 2: Create Bronze Layer
```sql
-- This creates the raw data table
EXEC scripts/bronze/ddl_bronze_layer.sql

-- This loads data from CSV
EXEC scripts/bronze/load_bronze.sql
```

### Step 3: Create and Populate Silver Layer
```sql
-- This creates the cleaned data table
EXEC scripts/silver/ddl_silver_layer.sql

-- This transforms and loads data from bronze
EXEC scripts/silver/load_silver.sql
```

### Step 4: Create Gold Layer
```sql
-- This creates the final view for business users
EXEC scripts/gold/ddl_gold.sql
```

### Step 5: Run Quality Checks
```sql
-- Check data quality in silver layer
EXEC tests/quality-checks-silver.sql

-- Check data quality in gold layer
EXEC tests/quality-checks-gold.sql
```

### Step 6: Run Analysis Queries
```sql
-- See business insights
EXEC scripts/report_customers.sql
```

---

## Business Questions Answered 📊

Using the data in this warehouse, I answered questions like:

1. **Which region has the highest sales?** → West region 🏆
2. **Which product category is most profitable?** → Technology 💻
3. **What are the top 10 products by sales?** → Used CTE (Common Table Expression)
4. **How many days does each shipping mode take?** → Same Day = 0.04 days, First Class = 2.18 days, etc.
5. **Top 5 customers by total sales** → Ranked them
6. **Monthly sales trends** → Showed how sales change month by month

---

## Key SQL Concepts I Used

- **CREATE DATABASE & SCHEMA** - Setting up the warehouse structure
- **CREATE TABLE** - Defining data types and structure
- **BULK INSERT** - Loading CSV data into SQL Server
- **TRY_CONVERT()** - Safely converting data types
- **INSERT INTO... SELECT** - Moving data between layers
- **COALESCE()** - Handling NULL values
- **GROUP BY & SUM()** - Aggregating data for analysis
- **CTE (WITH clause)** - Creating temporary named queries
- **DENSE_RANK() & ROW_NUMBER()** - Ranking results
- **DATEDIFF()** - Calculating days between dates
- **CREATE VIEW** - Creating virtual tables for users

---

## Data Quality Checks I Did ✅

Before using the data, I checked for:
- ❌ Duplicate primary keys
- ❌ NULL values in important columns
- ❌ Negative sales (impossible!)
- ❌ Invalid dates (Ship Date before Order Date)
- ❌ Extra spaces in text columns
- ❌ Unusual values in categorical columns

---

## What I Learned From This Project 🎓

1. **ETL is not just code** - It's about understanding data, fixing problems, and making it usable
2. **Data quality is important** - Garbage in = Garbage out! 
3. **Medallion Architecture makes sense** - Each layer has a clear purpose
4. **Plan before coding** - Checking data in Excel first saved me lots of errors
5. **Document your solutions** - The bulk_insert_error.md file helped me remember the fix later
6. **Test everything** - Quality checks caught potential issues early

---

## Technology Stack 🔧

- **Database:** Microsoft SQL Server
- **Language:** T-SQL (SQL Server specific language)
- **Data Source:** Kaggle Dataset (Sales data)
- **Architecture:** Medallion (Bronze-Silver-Gold)

---

## For Other Beginners Like Me 👋

If you're learning data warehousing too:

✅ Start small - Don't build a complex warehouse first  
✅ Use real data - It teaches you real problems  
✅ Document errors - They're learning opportunities  
✅ Check data first - Always look at your CSV in Excel before loading  
✅ Test often - Quality checks save debugging time later  
✅ Ask questions - ETL concepts are confusing at first, that's normal!

---

## Next Steps & Future Ideas 🚀

- Add more layers like Staging layer between Bronze and Silver
- Add data lineage documentation
- Create a data dictionary (catalog)
- Build a simple Power BI dashboard on top of gold layer
- Add incremental loading (not just full refresh)
- Automate with SQL Server Agent jobs

---

## Resources That Helped Me 📚

- Microsoft SQL Server Documentation
- Kaggle Datasets (for real data practice)
- Medallion Architecture concept
- SQL tutorials for beginners

---

## Questions or Feedback? 💬

This is a beginner's project created for learning. If you're learning too, feel free to explore, fork, and modify!

---

**Created by:** Ravina Shekhawat  
**Date:** May 2026  
**Purpose:** Learning and Revision of ETL Concepts  
**Status:** ✅ Complete (for now!)

---

*Remember: Being a beginner is not something to hide - it's something to celebrate! Every expert was once a beginner. Happy learning! 🎉*





