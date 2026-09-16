# Zepto SQL Data Analysis

SQL-based analysis of a Zepto-style product catalogue to understand **product pricing, discounts, inventory, stock availability, product value, and catalogue quality** using PostgreSQL.

## Project Overview

This project demonstrates a practical SQL analysis workflow for a quick-commerce product catalogue. The analysis converts raw CSV data into business-focused questions around pricing, discounts, stock levels, inventory value, and product value.

The project is designed around **realistic analyst questions** rather than only demonstrating SQL syntax.

> **Important:** This dataset is a product/inventory snapshot, not historical sales data. Therefore, calculations using `discountSellingPrice × availableQuantity` represent **estimated inventory value / potential sales value**, not actual realized revenue.

## Business Objectives

The analysis focuses on:

- Understanding product discount strategies
- Identifying high-value inventory
- Monitoring stock availability and low-stock products
- Comparing MRP and selling prices
- Evaluating product value using price per gram
- Comparing categories by pricing, discount and inventory metrics
- Performing basic data-quality checks before analysis

## Dataset

The project uses `zepto_v2.csv`, a product catalogue dataset containing pricing, discount, stock, weight and availability information.

### Main Columns

| Column | Description |
|---|---|
| `Category` | Product category |
| `name` | Product/SKU name |
| `mrp` | Maximum Retail Price |
| `discountPercent` | Listed discount percentage |
| `availableQuantity` | Available inventory quantity |
| `discountedSellingPrice` | Selling price after discount in the source CSV |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Whether the product is out of stock |
| `quantity` | Quantity/pack-size field provided in the source dataset |

### Data Preparation

The source CSV and PostgreSQL table use slightly different column names:

- `discountedSellingPrice` → `discountSellingPrice`
- `weightInGms` → `weightnGrms`

The source price values are stored in a paise-like format and are converted to **Indian Rupees** during SQL data preparation.

The analysis also checks for NULL values, zero MRP/selling prices, duplicate product names and stock availability before running the main queries.

## Tools & Technologies

- **PostgreSQL** – database and analysis
- **SQL** – filtering, aggregation, calculations and business classification
- **CSV** – source dataset

## Analysis Workflow

```text
Raw CSV Data
     ↓
Create PostgreSQL Table
     ↓
Data Exploration
     ↓
Data Quality Checks
     ↓
Data Cleaning
     ↓
Pricing Analysis
     ↓
Product Analysis
     ↓
Inventory & Stock Analysis
     ↓
Business Insights
```

## 20 Business Questions Analysed

### Pricing & Discount Analysis

1. Which are the top 10 products by discount percentage?
2. Which high-MRP products are currently out of stock?
3. What is the estimated inventory value for each category?
4. Which products have MRP above ₹500 but discount below 10%?
5. Which 5 categories have the highest average discount percentage?
6. Which products offer the lowest price per gram?

### Weight & Inventory Analysis

7. How can products be grouped into Low, Medium and Bulk weight categories?
8. What is the total inventory weight for each category?
9. Which products have the highest absolute discount amount in ₹?
10. Which categories have the highest average available quantity?
11. What are the average MRP and selling price by category?
12. Which products have high stock but relatively low discounts?
13. Which products have the highest stock value?

### Stock & Product Analysis

14. Which products are out of stock despite having high discounts?
15. Which categories have the highest out-of-stock rate?
16. Which products have the largest difference between listed and calculated discount percentage?
17. How are products distributed across discount bands?
18. Which products have no discount?
19. Which categories have the highest number of available units?
20. Which products are currently at low stock levels?

## Key SQL Techniques Used

The project uses practical PostgreSQL techniques including:

- `SELECT`, `WHERE`, `ORDER BY`
- `GROUP BY` and aggregate functions
- `COUNT()`, `SUM()`, `AVG()`
- `ROUND()` for business-friendly metrics
- `CASE` statements for classification
- `DISTINCT` and `HAVING`
- Boolean filtering for stock analysis
- `ABS()` for discount-difference validation
- Calculated fields such as discount amount, price per gram and inventory value
- Data-quality checks for NULLs, zero prices and duplicate product names
- Sorting and `LIMIT` for top-product analysis

## Business Insights the Analysis Can Support

The queries are designed to help identify:

- Categories carrying higher estimated inventory value
- Categories with higher average available stock
- Products with high stock value and greater inventory exposure
- Products at low stock levels that may need monitoring
- Categories with comparatively higher stock-out rates
- Products receiving larger customer-facing discounts
- Products where listed and calculated discounts differ materially
- Products sold without a discount
- Categories and products that may warrant pricing or promotional review

These findings can support **inventory monitoring, promotional planning, pricing review and catalogue-quality checks**.

## Important Data Limitations

- The dataset is a **catalogue/inventory snapshot**, not a transaction-level sales dataset.
- `availableQuantity` represents available stock, so it should not be interpreted as units sold.
- Estimated inventory value is not the same as actual revenue.
- Repeated product names can represent different SKUs/pack sizes and should not automatically be treated as duplicate transactions.
- The analysis is descriptive; it does not establish customer demand or causal impact of discounts.

## Repository Structure

```text
Zepto-SQL-Data-Analysis/
│
├── README.md
├── zepto_SQL_data_analysis.sql
└── zepto_v2.csv
```

## How to Run

### 1. Create the table

Open PostgreSQL / pgAdmin and run the table-creation section from:

```text
zepto_SQL_data_analysis.sql
```

### 2. Load the CSV

Import `zepto_v2.csv` into the `zepto` table using PostgreSQL / pgAdmin.

Make sure the CSV columns are mapped to the corresponding PostgreSQL table columns.

### 3. Run the analysis

Execute the SQL file from top to bottom. It includes:

- table creation
- initial data exploration
- NULL and data-quality checks
- zero-price checks and cleaning
- price conversion from paise-like values to rupees
- 20 business-analysis queries

## Project Outcome

This project demonstrates an end-to-end SQL analysis workflow focused on **business questions, clean SQL logic and practical interpretation**. It covers data exploration, data preparation, pricing analysis, discount analysis, inventory analysis and stock monitoring using PostgreSQL.

## Author

**Anas Khan**

Data Analyst Portfolio Project
