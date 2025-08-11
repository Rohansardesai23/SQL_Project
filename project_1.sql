create database proj_1;

use proj_1;

create table retail_sales(
	transactions_id	int PRIMARY KEY,
    sale_date	date,
    sale_time	time,
    customer_id	int,
    gender	varchar(15),
    age	int,
    category varchar(25),
    quantiy	int,
    price_per_unit	float,
    cogs	float,
    total_sale float
);

select * from retail_Sales;

select * from retail_sales
limit 10;

select count(*) from retail_sales;

select * from retail_sales 
where transactions_id is null
or sale_date is null
or sale_time	is null
or customer_id	is null
or gender is null
or age	is null
or category is null
or quantiy	is null
or price_per_unit	is null
or cogs	is null
or total_sale is null;

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


