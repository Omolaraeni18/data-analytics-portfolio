# 🗄 Retail Sales SQL Analysis

## 📌 Project Overview
This project analyzes a **retail sales dataset** provided by **Axia Africa**.  
The dataset originally contained **2,000 rows and 11 columns** with data quality issues such as missing values and incorrect data types.

Using **SQL (MySQL)**, the data was cleaned, structured into a reliable database, and analyzed to answer **real-world business questions** and generate **actionable insights**.

---

## 🎯 Objectives
- Set up a retail sales database using SQL  
- Import and clean unstructured sales data  
- Handle missing values and correct data inconsistencies  
- Convert columns to appropriate data types  
- Perform exploratory data analysis (EDA)  
- Answer business questions using SQL queries  

---

## 🛠 Tools Used
- **SQL (MySQL)** — Database creation, data cleaning, querying, and analysis  

---

## 🔧 Data Cleaning & Preparation
- Original dataset: **2,000 rows, 11 columns**
- Key columns: transaction_id, sale_date, sale_time, customer_id, gender, age, category, quantity, price_per_unit, cogs, total_sale

### Cleaning Steps
- Created a **raw table** and imported all records  
- Removed **13 rows** with missing or invalid numeric values  
- Dropped **10 rows** with missing age values (less than 0.5% of dataset)  
- Corrected column typo: `quantiy` → `quantity`  
- Created a **clean table** with correct data types and migrated cleaned data  

**Final dataset:** **1,987 rows**, fully structured and ready for analysis

---

## 🔍 Exploratory Data Analysis
- Checked for nulls and inconsistencies  
- Explored sales distribution across categories, customers, time, and demographics  
- Validated data readiness for business analysis  

---

## 📄 Business Questions Answered
The following questions were answered using SQL queries:

1. Sales transactions for a specific date  
2. High-quantity purchases in the Clothing category  
3. Total sales by category  
4. Average customer age for the Beauty category  
5. High-value transactions (`total_sale > 1000`)  
6. Transactions by gender across categories  
7. Average monthly sales and best-performing month  
8. Top 5 customers by total sales  
9. Unique customers per category  
10. Order distribution by time-of-day shifts (Morning, Afternoon, Evening)

---

## 🔍 Key Insights

- **Male customers recorded the highest number of transactions across most categories**, indicating stronger purchasing activity.
- The **Beauty category attracted customers within a specific age range**, showing a clearly defined target demographic.
- The **Clothing category experienced high-quantity purchases**, particularly in **November**, indicating bulk-buying behavior.
- A total of **306 transactions exceeded a total sale value of 1000**, highlighting the presence of high-value customers.
- **November recorded the highest average sales**, making it the best-performing month.
- The **top 5 customers contributed a significant share of total revenue**, indicating revenue concentration.
- **Afternoon shifts (12:00–17:00) recorded the highest order volume**, making it the most active sales period.

---

## 💡 Recommendations

- **Target male customers more strategically**, especially in high-performing categories, using tailored promotions and product placement.
- Develop **age-focused marketing campaigns for the Beauty category** to align with its dominant customer demographic.
- Increase inventory levels and promotional focus on the **Clothing category ahead of November**, when bulk purchases peak.
- Introduce **VIP or loyalty programs** for customers making purchases above 1000 to retain high-value buyers.
- Align marketing campaigns and inventory planning around **November**, while using incentives to boost lower-performing months.
- Concentrate flash sales, staffing, and system resources during the **Afternoon shift (12:00–17:00)** to maximize conversions.
- Implement stronger **data validation controls** at data entry points to reduce missing values in future datasets.

---

## 📸 Key Screenshots
*(Stored in the `screenshots` folder)*

- Database and raw table creation  
- Raw data import  
- Cleaned dataset  
- Total sales by category  
- Top 5 customers by revenue  
- Best-performing month analysis  

---

## 📂 Access Project Files
- [Download SQL Queries](sql_queries.sql)  
- [Download Dataset](retail_sales_data.xlsx)

---

## 🏁 Conclusion
This project demonstrates the ability to use **SQL for end-to-end data analysis**, including database setup, data cleaning, exploratory analysis, and translating query results into **business-focused insights and recommendations**.  
It reflects real-world data analyst skills required for working with transactional retail data.


