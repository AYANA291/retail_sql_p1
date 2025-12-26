# retail_sql_p1
# Retail Sales Analysis – SQL Project

**Level:** Beginner  
**Database:** `p1_retail_db`  

---

## Project Overview

This project demonstrates **SQL skills commonly used by data analysts** to explore, clean, and analyze retail sales data. The focus is on creating a database, performing exploratory data analysis (EDA), cleaning data, and answering business questions through SQL queries.  

This project is ideal for beginners looking to build a **solid foundation in SQL and data analysis**.

> **Note:** This project was developed as a personal learning exercise and portfolio project. All datasets and queries are for educational purposes.

---

## Project Objectives

1. **Database Setup:** Create and populate a retail sales database.  
2. **Data Cleaning:** Identify and remove records with missing values.  
3. **Exploratory Data Analysis (EDA):** Understand trends, patterns, and data distribution.  
4. **Business Analysis:** Use SQL to answer business questions and generate insights.

---

## Project Structure

### 1. Database Setup

**Create the database:**
CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(10),
    age INT,
    category VARCHAR(35),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
2. Data Exploration & Cleaning

Exploration queries:
-- Total number of records
SELECT COUNT(*) FROM retail_sales;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;

-- Unique product categories
SELECT DISTINCT category FROM retail_sales;

-- Identify records with missing data
SELECT * FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL
   OR gender IS NULL OR age IS NULL OR category IS NULL
   OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

-- Delete records with missing values
DELETE FROM retail_sales
WHERE sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL
   OR gender IS NULL OR age IS NULL OR category IS NULL
   OR quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
3. Data Analysis & Insights

Example queries for business analysis:
-- Sales on a specific date
SELECT * FROM retail_sales WHERE sale_date = '2022-11-05';

-- Clothing sales with quantity > 4 in Nov 2022
SELECT * FROM retail_sales
WHERE category = 'Clothing'
  AND TO_CHAR(sale_date, 'YYYY-MM') = '2022-11'
  AND quantity > 4;

-- Total sales per category
SELECT category, SUM(total_sale) AS net_sale, COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Average age of Beauty category customers
SELECT ROUND(AVG(age),2) AS avg_age FROM retail_sales
WHERE category = 'Beauty';

-- High-value transactions
SELECT * FROM retail_sales WHERE total_sale > 1000;

-- Transactions by gender in each category
SELECT category, gender, COUNT(*) AS total_trans
FROM retail_sales
GROUP BY category, gender
ORDER BY category;

-- Best-selling month per year
WITH monthly_avg AS (
    SELECT EXTRACT(YEAR FROM sale_date) AS year,
           EXTRACT(MONTH FROM sale_date) AS month,
           AVG(total_sale) AS avg_sale,
           RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date)
                       ORDER BY AVG(total_sale) DESC) AS rank
    FROM retail_sales
    GROUP BY 1,2
)
SELECT year, month, avg_sale
FROM monthly_avg
WHERE rank = 1;

-- Top 5 customers by total sales
SELECT customer_id, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Unique customers per category
SELECT category, COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Orders by shift (Morning, Afternoon, Evening)
WITH hourly_sale AS (
    SELECT *, CASE
        WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        ELSE 'Evening' END AS shift
    FROM retail_sales
)
SELECT shift, COUNT(*) AS total_orders
FROM hourly_sale
GROUP BY shift;
Key Findings

Customer Demographics: Sales cover multiple age groups and product categories.

High-Value Transactions: Some purchases exceed 1000, indicating premium buyers.

Sales Trends: Monthly analysis reveals seasonal peaks.

Customer Insights: Top customers and popular categories are identified.

```sql
CREATE DATABASE p1_retail_db;
