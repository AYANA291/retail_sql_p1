CREATE DATABASE p1_retail_db;
use p1_retail_db;
SELECT DATABASE();
CREATE TABLE retail_sales
(
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
-- to see all the records
SELECT *
FROM retail_sales;

-- count no. of rows
SELECT COUNT(*)
FROM retail_sales;

-- data cleaning

-- to find the null values
SELECT *
FROM retail_sales
WHERE sale_date IS NULL
   OR sale_time IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantity IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
   
-- to check duplicates
SELECT 
    sale_date,
    sale_time,
    customer_id,
    gender,
    age,
    category,
    quantity,
    price_per_unit,
    cogs,
    total_sale,
    COUNT(*) AS duplicate_count
FROM retail_sales
GROUP BY 
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
HAVING COUNT(*) > 1;

-- Check negative or zero quantity
-- A sale quantity should normally be positive.
-- A negative quantity may indicate bad data entry.
SELECT *
FROM retail_sales
WHERE quantity <= 0;

-- Check negative price or cost values
-- Price cannot be negative
SELECT *
FROM retail_sales
WHERE price_per_unit <= 0
   OR cogs <= 0
   OR total_sale <= 0;
   
-- Check unrealistic age values
-- if age is unrealistic then its  likely an error with the data.
SELECT *
FROM retail_sales
WHERE age < 0
   OR age > 100;

-- Check total_sale calculation consistency
-- total_sale = quantity × price_per_unit
SELECT *
FROM retail_sales
WHERE total_sale <> (quantity * price_per_unit);


-- EDA (Exploratory Data Analysis)

-- 1.How many sales transactions happened?

SELECT COUNT(transaction_id) AS total_transactions
FROM retail_sales;

-- 2. What is the total sales amount?

SELECT SUM(total_sale) AS total_revenue
FROM retail_sales;  

-- 3.Which product category generates the highest revenue?

SELECT 
    category,
    SUM(total_sale) AS total_revenue
FROM retail_sales
GROUP BY category
ORDER BY total_revenue DESC;

-- 4.Which category sells the highest quantity? 

SELECT 
    category,
    SUM(quantity) AS total_quantity_sold
FROM retail_sales
GROUP BY category
ORDER BY total_quantity_sold DESC;

-- 5.How many different customers purchased from us? 

SELECT 
    COUNT(DISTINCT customer_id) AS total_unique_customers
FROM retail_sales;


-- 6.Which customers generated the highest revenue?
-- These customers are high-value customers and can be targeted for loyalty programs or personalized offers

SELECT
    customer_id,
    SUM(total_sale) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

-- 7.  Which month generated the highest revenue?
SELECT 
    MONTH(sale_date) AS month,
    SUM(total_sale) AS monthly_revenue
FROM retail_sales
GROUP BY MONTH(sale_date)
ORDER BY monthly_revenue DESC;

-- 8 . At what time do customers purchase the most?
-- This helps businesses understand:
-- Peak shopping hours
-- When to increase staff
-- When to run offers/campaigns

SELECT 
    HOUR(sale_time) AS sales_hour,
    COUNT(transaction_id) AS total_transactions
FROM retail_sales
GROUP BY HOUR(sale_time)
ORDER BY total_transactions DESC;


-- 9. On a gender basis, who made more purchases (Male or Female)?

SELECT 
    gender,
    COUNT(*) AS total_purchases
FROM retail_sales
GROUP BY gender
ORDER BY total_purchases DESC;


-- 10. Which age group purchases the most?

SELECT
    CASE
        WHEN age BETWEEN 18 AND 25 THEN '18-25'
        WHEN age BETWEEN 26 AND 35 THEN '26-35'
        WHEN age BETWEEN 36 AND 50 THEN '36-50'
        ELSE '50+'
    END AS age_group,
    COUNT(transaction_id) AS total_purchases
FROM retail_sales
GROUP BY age_group
ORDER BY total_purchases DESC;

-- end of project
