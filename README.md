# Zepto SQL Data Analysis

SQL-based analysis of a Zepto-style product catalogue to understand **product pricing, discounts, inventory, stock availability, product value, and data quality** using PostgreSQL.

## Project Overview

This project demonstrates how a Data Analyst can transform raw product data into meaningful business insights using SQL.

The analysis focuses on questions such as:

- Which products have the highest discounts?
- Which categories carry the highest inventory value?
- Which products have high stock but low discounts?
- Which categories have higher stock-out rates?
- Which products provide better value per gram?
- Are there any pricing or discount inconsistencies in the dataset?

> **Note:** The dataset contains product and inventory information rather than historical sales transactions. Therefore, inventory value calculated using `discountSellingPrice × availableQuantity` is treated as **estimated inventory value / potential sales value**, not actual realized revenue.

## Business Objectives

The project aims to support decisions around:

1. **Pricing & Promotions** – understand discount levels and price differences.
2. **Inventory Management** – identify high-value, low-stock and out-of-stock products.
3. **Category Performance** – compare categories by pricing, inventory quantity, value and availability.
4. **Product Value** – evaluate price per gram and customer-facing discounts.
5. **Data Quality** – identify invalid prices and inconsistencies between stored and calculated discounts.

## Dataset

The repository contains the product catalogue CSV used for the analysis.

Main fields include:

| Column | Description |
|---|---|
| `Category` | Product category |
| `name` | Product name |
| `mrp` | Maximum Retail Price |
| `discountPercent` | Listed discount percentage |
| `availableQuantity` | Available inventory quantity |
| `discountedSellingPrice` | Selling price after discount in the CSV |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Stock availability flag |
| `quantity` | Product quantity field from the source dataset |

### Data Preparation

The SQL table uses standardized analysis column names such as `discountSellingPrice` and `weightnGrms`. The source CSV uses `discountedSellingPrice` and `weightInGms`.

Prices are converted from paise-like values to **Indian Rupees** during data preparation.

## Tools & Technologies

- **PostgreSQL** – data storage and SQL analysis
- **SQL** – filtering, aggregation, CASE statements, calculations and data validation
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
Inventory Analysis
     ↓
Business Insights
```

## 20 Business Questions Analysed

### Data Exploration & Cleaning

1. Which are the top 10 products by discount percentage?
2. Which high-MRP products are currently out of stock?
3. What is the estimated inventory value for each category?
4. Which products have MRP above ₹500 but discount below 10%?
5. Which 5 categories have the highest average discount percentage?
6. Which products offer the lowest price per gram?
7. How can products be grouped into Low, Medium and Bulk weight categories?
8. What is the total inventory weight for each category?

### Pricing & Product Analysis

9. Which products have the highest absolute discount amount in ₹?
10. Which categories have the highest inventory value?
11. Which categories have the highest average product price?
12. Which products have high stock but relatively low discounts?
13. Which products have the highest stock value?
14. Which products are out of stock despite having high discounts?

### Inventory & Data Quality Analysis

15. Which categories have the highest out-of-stock rate?
16. Which products have the largest MRP-to-selling-price difference?
17. How are products distributed across discount bands?
18. Which categories contain the highest number of units in stock?
19. Which products are currently at low stock levels?
20. Are there any pricing or discount inconsistencies in the dataset?

## Key Analytical Techniques

The project uses practical PostgreSQL techniques including:

- `SELECT`, `WHERE`, `ORDER BY`
- `GROUP BY` and aggregate functions
- `COUNT()`, `SUM()`, `AVG()`
- `ROUND()` for business-friendly metrics
- `CASE` statements for business classification
- `DISTINCT` and `HAVING`
- `NULLIF()` to prevent division-by-zero issues
- Boolean filtering for stock analysis
- Calculated fields such as price per gram, discount amount and inventory value
- Data validation checks for pricing consistency

## Business Insights This Analysis Can Support

The analysis can help identify:

- Categories with significant inventory value exposure
- Products carrying high inventory value
- Products with low available stock that may require monitoring
- Categories with comparatively high stock-out rates
- Products receiving substantial customer discounts
- Products that may need pricing or promotional review
- Potential data-quality issues in pricing and discount fields

These insights can be used as a starting point for inventory planning, promotional strategy and catalogue quality checks.

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

Open PostgreSQL / pgAdmin and run the `CREATE TABLE` section from:

```text
zepto_SQL_data_analysis.sql
```

### 2. Load the CSV

Import `zepto_v2.csv` into the `zepto` table using PostgreSQL / pgAdmin.

Make sure the CSV columns are mapped correctly to the table columns.

### 3. Run the analysis

Execute the SQL file from top to bottom so that:

- the table is created,
- data quality is checked,
- zero-price records are handled,
- prices are converted to rupees,
- and the 20 business questions are analysed.

## Project Outcome

This project demonstrates an end-to-end SQL analysis workflow focused on **business questions rather than only SQL syntax**. It combines data cleaning, exploratory analysis, pricing analysis, inventory analysis and data validation to produce actionable insights from a product catalogue dataset.

## Author

**Anas Khan**

Data Analyst Portfolio Project
