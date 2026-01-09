# Retail Sales Analysis (Python) – Axia Africa Project

## Project Overview
This project analyzes retail sales data for Axia Africa using **Python** to identify **top-selling products, payment methods, cities, managers, and revenue trends**. The goal is to uncover actionable business insights and provide **data-driven recommendations** to improve sales performance.

**Objective:** Explore sales patterns, perform exploratory data analysis (EDA), and generate insights to support business decision-making.

---

## Tools & Techniques
- **Python (Pandas, NumPy, Matplotlib, Seaborn)** – Data manipulation, analysis, and visualization  
- **Data Cleaning** – Removed duplicates, handled missing values, standardized formats, created calculated columns  
- **Exploratory Data Analysis (EDA)** – Descriptive statistics, group-wise aggregation, trend analysis  
- **Data Visualization** – Charts and graphs to highlight key trends and performance metrics  

---

## Key Insights

### 1. Top-Selling Products
- **Beverages** sold the most by quantity: **11,868 units**  
- Products like **Burgers** and **Fries** contributed moderate revenue  
- Suggests beverage promotions and upselling opportunities  

### 2. Revenue by Purchase Type
- **Online purchases** generated the highest revenue: **$48,999**  
- **In-store purchases**: $40,229  
- **Drive-thru purchases**: $27,767  
- Focus on expanding **online sales channels** while optimizing in-store and drive-thru operations  

### 3. Revenue by Day of the Week
- **Wednesday** had the highest revenue: $18,408  
- **Sunday** had the lowest revenue: $13,140  
- Peak mid-week sales suggest opportunities for weekday promotions, and Sunday could be targeted with offers  

### 4. Revenue per Manager per City
| Manager        | Berlin   | Lisbon  | London   | Madrid  | Paris    |
|----------------|---------|---------|---------|---------|---------|
| Joao Silva     | 0.00    | 35752.84 | 0.00    | 0.00    | 0.00    |
| Pablo Perez    | 0.00    | 0.00    | 0.00    | 20444.25 | 0.00    |
| Remy Monet     | 0.00    | 0.00    | 0.00    | 0.00    | 12491.53 |
| Tom Jackson    | 0.00    | 0.00    | 33535.34 | 0.00    | 0.00    |
| Walter Muller  | 14771.35 | 0.00   | 0.00    | 0.00    | 0.00    |

- Shows **which managers perform best in specific cities**  
- Useful for **resource allocation and best-practice sharing**  

### 5. Most Preferred Payment Method
- **Credit Card:** 120 transactions  
- **Cash:** 76 transactions  
- **Gift Card:** 58 transactions  
- Indicates strong adoption of credit card payments  

### 6. Revenue & Quantity Sold per Product
| Product             | Avg Quantity Sold | Avg Revenue |
|--------------------|-----------------|------------|
| Beverages           | 237.36          | 699.66     |
| Burgers             | 42.96           | 558.12     |
| Chicken Sandwiches  | 21.06           | 214.15     |
| Fries               | 177.14          | 628.12     |
| Sides & Other       | 40.00           | 200.40     |

- Beverages dominate revenue and quantity  
- Suggests focusing on high-performing products for upselling  

### 7. Revenue Trends Over Time
- Total number of orders: 254  
- Revenue is **increasing over time**, indicating growth  
- See chart below for visual trend:

![Revenue Trend Over Time](screenshots/revenue_trend_chart.png)

---

## Recommendations
- Focus on **top-performing products** and expand online sales channels  
- Promote sales on low-revenue days (e.g., Sunday)  
- Optimize manager assignments based on city performance  
- Encourage preferred payment methods while promoting underutilized ones  
- Use revenue trends to **forecast and plan inventory**  

---

## Skills Demonstrated
- Python data cleaning and preprocessing  
- Exploratory Data Analysis (EDA)  
- Group-wise aggregation and revenue analysis  
- Data visualization using Matplotlib and Pandas  
- Business insights and actionable recommendations  

---

## View Project Files
The repository includes:  
- **Python scripts / Jupyter Notebook** – Full analysis and visualizations  
- **Screenshots folder** – Charts and graphs  
- **Raw dataset** – Excel file

[View Python Project Notebook](axia_sales_analysis.ipynb)
