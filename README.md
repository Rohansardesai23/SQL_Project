# Retail Sales SQL Analysis

This project contains SQL scripts for **retail sales analysis**.  
It includes database creation, data validation, and analytical queries to extract insights from the dataset.


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


## 📊 Queries Included

# **Data Setup**

  - CREATE DATABASE proj_1;
  - USE proj_1;
  
  - CREATE TABLE retail_sales (
      - transactions_id INT PRIMARY KEY,
      - sale_date DATE,
      - sale_time TIME,
      - customer_id INT,
      - gender VARCHAR(15),
      - age INT,
      - category VARCHAR(25),
      - quantiy INT,
      - price_per_unit FLOAT,
      - cogs FLOAT,
      - total_sale FLOAT
  - );

## Data Validation

# View first rows:

SELECT * FROM retail_sales LIMIT 10;
Count total rows:

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


## 🔍 Analytical Queries

-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity is >= 4 in the month of Nov-2022
SELECT *
FROM retail_sales
WHERE category = 'Clothing'
  AND quantiy >= 4
  AND sale_date BETWEEN '2022-11-01' AND '2022-11-30';

-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
SELECT category, SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY category;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
SELECT AVG(age) AS average_age_of_customer, category
FROM retail_sales
WHERE category = 'Beauty';

-- Q.5 Write a SQL query to find all transactions where the total sale is greater than 1000.
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
SELECT category, gender, COUNT(transactions_id) AS total_transactions
FROM retail_sales 
GROUP BY category, gender;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year.
SELECT 
    YEAR(sale_date) AS year, 
    MONTH(sale_date) AS month, 
    AVG(total_sale) AS avg_sales
FROM retail_sales
GROUP BY year, month
ORDER BY avg_sales DESC
LIMIT 2;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales.
SELECT SUM(total_sale) AS total_sales, customer_id
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
SELECT COUNT(DISTINCT customer_id) AS unique_customers, category
FROM retail_sales
GROUP BY category;

-- Q.10 Write a SQL query to create each shift and number of orders (Example: Morning <=12, Afternoon Between 12 & 17, Evening >17).
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



## 🚀 How to Run
    Create the database and table using the provided CREATE TABLE script.
    Load your retail sales dataset into the table.
    Run the analytical queries to extract insights.

## 🛠 Requirements
    MySQL 8+ (or any SQL-compatible database supporting EXTRACT() function)
    Retail sales dataset in CSV or SQL format


## 👨‍💻 Author
    Rohan Sunil Sardesai
    📧 rohansardesai04@gmail.com
    📱 +91 9022228467
