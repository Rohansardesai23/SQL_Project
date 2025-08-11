# 🛍 Retail Sales SQL Analysis

This project contains SQL scripts for **retail sales analysis**.  
It includes database creation, data validation, and analytical queries to extract insights from the dataset.

---

## 📂 Project Structure

- **Database:** `proj_1`
- **Table:** `retail_sales`
- **Columns:**
  - `transactions_id` (Primary Key)
  - `sale_date` (Date of transaction)
  - `sale_time` (Time of transaction)
  - `customer_id` (Unique customer identifier)
  - `gender` (Gender of the customer)
  - `age` (Age of the customer)
  - `category` (Product category)
  - `quantiy` (Number of items purchased)  
  - `price_per_unit` (Price of a single unit)
  - `cogs` (Cost of goods sold)
  - `total_sale` (Total sale amount)

---

## 📊 Queries Included

### **Data Setup**
```sql
CREATE DATABASE proj_1;
USE proj_1;

CREATE TABLE retail_sales (
    transactions_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(25),
    quantiy INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```
---

## Data Validation

```sql

SELECT * FROM retail_sales LIMIT 10;
Count total rows:

Edit
SELECT COUNT(*) FROM retail_sales;
Check for null values:

SELECT * FROM retail_sales
WHERE transactions_id IS NULL
   OR sale_date IS NULL
   OR sale_time IS NULL
   OR customer_id IS NULL
   OR gender IS NULL
   OR age IS NULL
   OR category IS NULL
   OR quantiy IS NULL
   OR price_per_unit IS NULL
   OR cogs IS NULL
   OR total_sale IS NULL;
```

---


## 🔍 Analytical Queries

###Q1. Retrieve all sales made on 2022-11-05:
```sql
Copy
Edit
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';
```

Q2. Clothing category sales (quantity ≥ 4) in Nov-2022:

sql
Copy
Edit
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';
Q3. Total sales per category:

sql
Copy
Edit
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;
Q4. Average age of customers in 'Beauty' category:

sql
Copy
Edit
SELECT AVG(age) AS average_age_of_customer, category
FROM retail_sales
WHERE category = 'Beauty';
Q5. Transactions with total sale > 1000:

sql
Copy
Edit
SELECT *
FROM retail_sales
WHERE total_sale > 1000;
Q6. Transactions by gender in each category:

sql
Copy
Edit
SELECT category, gender, COUNT(transactions_id) AS total_transactions
FROM retail_sales 
GROUP BY category, gender;
Q7. Average monthly sales & best-selling month per year:

sql
Copy
Edit
SELECT 
    YEAR(sale_date) AS year, 
    MONTH(sale_date) AS month, 
    AVG(total_sale) AS avg_sales
FROM retail_sales
GROUP BY year, month
ORDER BY avg_sales DESC
LIMIT 2;
Q8. Top 5 customers by total sales:

sql
Copy
Edit
SELECT SUM(total_sale) AS total_sales, customer_id
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;
Q9. Unique customers per category:

sql
Copy
Edit
SELECT COUNT(DISTINCT customer_id) AS unique_customers, category
FROM retail_sales
GROUP BY category;
Q10. Shift-based order counts:

sql
Copy
Edit
SELECT 
    CASE 
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 6 AND 11 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'Afternoon'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 18 AND 22 THEN 'Evening'
        ELSE 'Night'
    END AS shift,
    COUNT(transactions_id) AS total_sales
FROM retail_sales
GROUP BY shift
ORDER BY total_sales ASC;
