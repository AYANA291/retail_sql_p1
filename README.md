# Retail Sales Analysis - SQL Project

## 📌 Project Overview

This project focuses on analyzing retail sales data using **MySQL** to extract meaningful business insights. The objective of this project is to perform data cleaning, exploratory data analysis (EDA), and answer key business questions related to sales performance, customer behavior, product categories, and purchasing trends.

The project demonstrates SQL skills including data extraction, aggregation, filtering, grouping, and business-oriented analysis.

---

## 🎯 Business Objectives

The main objectives of this project are:

* Analyze overall sales performance
* Identify top-performing product categories
* Understand customer purchasing behavior
* Analyze sales trends over time
* Identify high-value customers
* Segment customers based on demographics

---

## 🛠️ Tools & Technologies Used

* **Database:** MySQL
* **Language:** SQL
* **Dataset:** Retail Sales Dataset (CSV)
* **Analysis Techniques:** Data Cleaning, Data Validation, Exploratory Data Analysis (EDA)

---

## 📂 Dataset Description

The dataset contains retail transaction details including:

| Column Name    | Description                    |
| -------------- | ------------------------------ |
| transaction_id | Unique ID for each transaction |
| sale_date      | Date of purchase               |
| sale_time      | Time of purchase               |
| customer_id    | Unique customer identifier     |
| gender         | Customer gender                |
| age            | Customer age                   |
| category       | Product category               |
| quantity       | Number of products purchased   |
| price_per_unit | Price of one unit              |
| cogs           | Cost of goods sold             |
| total_sale     | Total transaction amount       |

---

# 🔍 Data Cleaning Process

Before performing analysis, data quality checks were performed:

### 1. Missing Value Check

Checked for NULL values in important columns:

* Sale date
* Sale time
* Customer details
* Product details
* Sales values

No missing values were found.

---

### 2. Duplicate Record Check

Checked for duplicate business transactions using:

* Customer information
* Sale details
* Product details
* Transaction values

No duplicate records were identified.

---

### 3. Data Validation

Performed validation checks for:

* Negative or zero quantities
* Invalid prices
* Unrealistic customer ages
* Incorrect total sales calculations

---

# 📊 Exploratory Data Analysis (EDA)

The following business questions were analyzed:

## 1. Overall Sales Performance

* Total number of transactions
* Total revenue generated

## 2. Category Analysis

* Which product category generates the highest revenue?
* Which category sells the highest quantity?

## 3. Customer Analysis

* Number of unique customers
* Top 10 highest-spending customers

## 4. Time-Based Analysis

* Monthly revenue trends
* Peak purchasing hours

## 5. Customer Demographic Analysis

* Gender-wise purchase analysis
* Age group purchasing behavior

---

# 📈 Key Business Insights

Examples of insights generated:

* Identified the highest revenue-generating product categories.
* Analyzed customer purchasing patterns based on demographics.
* Identified peak sales periods to understand customer activity.
* Recognized high-value customers based on total spending.
* Helped understand which customer segments contribute most to sales.

---

# 🗂️ Project Structure

```
Retail-Sales-SQL-Analysis/
│
├── README.md
│
├── retail_sales.csv
│
└── retail_sales_analysis.sql
```

---

# 💡 Skills Demonstrated

* SQL Database Creation
* Table Design
* Data Cleaning
* Data Validation
* Aggregate Functions
* GROUP BY & HAVING
* CASE Statements
* Business Question Analysis
* Exploratory Data Analysis

---

# 🚀 Conclusion

This project demonstrates how SQL can be used to transform raw retail transaction data into meaningful business insights. The analysis helps understand sales performance, customer behavior, and business trends that can support data-driven decision-making.
