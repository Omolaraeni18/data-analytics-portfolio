## NEW DATABASE CREATED
CREATE DATABASE retail_db;
USE retail_db;
## NEW TABLE FOR UNCLEAN DATA IN TEXT, BECAUSE USING CORRECT DATA TYPES SKIPPED BLANKS AND IMPORTED 1987 AGAINST 2000
CREATE TABLE retail_sales_raw (
transaction_id TEXT, 
sale_date TEXT, 
sale_time TEXT,
 customer_id TEXT,
gender TEXT,
age TEXT, 
category TEXT, 
quantiy TEXT, 
price_per_unit TEXT,
 cogs TEXT,  
 total_sale TEXT);
 ## CHECKING FOR NULL OR BLANKS
SELECT * FROM retail_sales_raw 
WHERE (quantiy ='' OR quantiy IS NULL)
AND (price_per_unit = ''OR price_per_unit IS NULL)
AND (cogs =''  OR cogs IS NULL)
AND (total_sale =''  OR total_sale IS NULL);
SET SQL_SAFE_UPDATES = 0;
## DELETING BLANKS BECAUSE THREE RESPECTIVE COLUMNS WERE MISSING, AND REPLACING WILL AFFECT DATA INTEGRITY
DELETE FROM retail_sales_raw 
WHERE (quantiy ='' OR quantiy IS NULL)
AND (price_per_unit = ''OR price_per_unit IS NULL)
AND (cogs =''  OR cogs IS NULL)
AND (total_sale =''  OR total_sale IS NULL);
## CHECKING FOR NULL IN DATA SET AND CONSIDERING RELACING WITH MEAN
SELECT *  FROM retail_sales_raw 
WHERE ( age ='' OR age IS NULL);
## DELETED THE NULL IN THE AGE BECAUSE THE BLANKS OR NULL WAS LESS THAN 1% OF DATSET AND TO MAINTAIN DATA INTEGRITY, REPLACING WASNT AN OPTION
DELETE FROM retail_sales_raw 
WHERE ( age ='' OR age IS NULL);
## CORRECTING MISSPELT WORD
ALTER TABLE retail_sales_raw 
CHANGE COLUMN quantiy quantity INT;
## SET SAFE UPDATE TO ENABLE DELETION OF BLANKS OR NULL
SET SQL_SAFE_UPDATES = 1;
## USED DATABASE FOR CLEAN RETAIL SALES TABLE TO BE USED FOR ANALYSIS FOR CORRECT ANALYSIS
USE retail_db;
## CREATED A CLEAN TABLE FOR CLEAN DATA AND CORRECT DATA TYPES AGAINST TEXT USED FOR THE RAW OR UNCLEAN VERSION
CREATE TABLE retail_sales_clean (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender ENUM('Male','Female'),
    age INT,
    category VARCHAR(50),
    quantity INT,
    price_per_unit INT,
    cogs DECIMAL(10,2),
    total_sale INT);
    ## INSERTING CLEAN DATA INTO CLEAN TABLE , WITH CORRECT DATA TYPES TO ENSURE CORRECT ANALYSIS
 INSERT INTO retail_sales_clean (
    transaction_id,
    sale_date,
    sale_time,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price_per_unit,
    cogs,
    total_sale
)
SELECT
    transaction_id,
    sale_date,              -- already DATE, no STR_TO_DATE needed
    STR_TO_DATE(sale_time, '%H:%i:%s'),
    customer_id,
    gender,
    age,
    category,
    quantity,
    price_per_unit,
    cogs,
    total_sale
FROM retail_sales_raw;
##EXPLORATORY DATA ANALYSIS
SELECT * FROM retail_sales_clean;
SELECT * FROM retail_sales_clean
WHERE transaction_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
   DESCRIBE retail_sales_clean;
   SELECT COUNT(*) AS total_rows FROM retail_sales_clean;
   SELECT * FROM retail_sales_clean LIMIT 10;
   SELECT category, COUNT(*) AS n, SUM(total_sale) AS revenue
FROM retail_sales_clean
GROUP BY category;
##BUSINESS ANALYSIS
##3i.SQL query to retrieve all columns for sales made on 2022-11-05
SELECT * FROM retail_sales_clean
 WHERE sale_date = '2022-11-05';
##3ii.query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022
SELECT * FROM retail_sales_clean
 WHERE category = 'Clothing'
 AND quantity > 4
 AND MONTH(sale_date)  = 11
 AND YEAR(sale_date)  = 2022;
 ##3iii.SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales_clean
GROUP BY category;
##3iv SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT AVG(age) AS avg_age
FROM retail_sales_clean
WHERE category = 'Beauty';
##3v SQL query to find all transactions where the total_sale is greater than 1000.
SELECT * FROM retail_sales_clean 
WHERE total_sale > 1000;
##3vi SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category, gender, COUNT(transaction_id) AS total_transactions
FROM retail_sales_clean
GROUP BY category, gender;
##3vii SQL query to calculate the average sale for each month. Find out best-selling month in each year
## Averagesale
SELECT YEAR(sale_date) AS sale_year,
       MONTH(sale_date) AS sale_month,
       AVG(total_sale) AS avg_monthly_sale
FROM retail_sales_clean
GROUP BY YEAR(sale_date), MONTH(sale_date)
ORDER BY YEAR(sale_date), MONTH(sale_date);
##Bestsellingmonthperyear
SELECT t.sale_year, t.sale_month, t.total_monthly_sale
FROM (
    SELECT YEAR(sale_date) AS sale_year,
           MONTH(sale_date) AS sale_month,
           SUM(total_sale) AS total_monthly_sale,
           RANK() OVER (PARTITION BY YEAR(sale_date) ORDER BY SUM(total_sale) DESC) AS rank_month
    FROM retail_sales_clean
    GROUP BY YEAR(sale_date), MONTH(sale_date)
) t
WHERE t.rank_month = 1;
##3viii SQL query to find the top 5 customers based on the highest total sales.
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales_clean
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
##3ix SQL query to find the number of unique customers who purchased items from each category.
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales_clean
GROUP BY category;
##3x SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17)
SELECT 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(transaction_id) AS total_orders
FROM retail_sales_clean
GROUP BY 
    CASE
        WHEN HOUR(sale_time) < 12 THEN 'Morning'
        WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END;
