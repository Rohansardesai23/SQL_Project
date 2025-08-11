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
