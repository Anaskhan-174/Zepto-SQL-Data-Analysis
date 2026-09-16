DROP TABLE IF EXISTS zepto;

CREATE TABLE zepto (
    sku_id SERIAL PRIMARY KEY,
    Category VARCHAR(120),
    name VARCHAR(150) NOT NULL,
    mrp NUMERIC(8,2),
    discountPercent NUMERIC(5,2),
    availableQuantity INTEGER,
    discountSellingPrice NUMERIC(8,2),
    weightnGrms INTEGER,
    outOfStock BOOLEAN,
    quantity INTEGER
);

-- ============================================================
-- DATA EXPLORATION
-- ============================================================

-- Count of rows
SELECT COUNT(*) AS total_rows
FROM zepto;

-- Sample records
SELECT *
FROM zepto
LIMIT 10;

-- Check for NULL values
SELECT *
FROM zepto
WHERE name IS NULL
   OR category IS NULL
   OR mrp IS NULL
   OR discountPercent IS NULL
   OR availableQuantity IS NULL
   OR discountSellingPrice IS NULL
   OR weightnGrms IS NULL
   OR outOfStock IS NULL
   OR quantity IS NULL;

-- Different product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- Products in stock vs out of stock
SELECT
    outOfStock,
    COUNT(sku_id) AS product_count
FROM zepto
GROUP BY outOfStock;

-- Product names appearing multiple times
SELECT
    name,
    COUNT(sku_id) AS number_of_skus
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY number_of_skus DESC;

-- ============================================================
-- DATA CLEANING
-- ============================================================

-- Check products with zero MRP or selling price
SELECT *
FROM zepto
WHERE mrp = 0
   OR discountSellingPrice = 0;

-- Remove products with zero MRP
DELETE FROM zepto
WHERE mrp = 0;

-- Convert paise to rupees
UPDATE zepto
SET mrp = mrp / 100.0,
    discountSellingPrice = discountSellingPrice / 100.0;

-- Verify converted prices
SELECT
    mrp,
    discountSellingPrice
FROM zepto
LIMIT 20;

-- ============================================================
-- DATA ANALYSIS - 20 BUSINESS QUESTIONS
-- ============================================================

-- Q1. Which are the top 10 products by discount percentage?
SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
WHERE discountPercent IS NOT NULL
ORDER BY discountPercent DESC
LIMIT 10;

-- Q2. Which high-MRP products are currently out of stock?
SELECT DISTINCT
    name,
    mrp
FROM zepto
WHERE outOfStock = TRUE
  AND mrp > 300
ORDER BY mrp DESC;

-- Q3. What is the estimated inventory value for each category?
-- Note: This is potential inventory value, not actual sales revenue.
SELECT
    category,
    ROUND(SUM(discountSellingPrice * availableQuantity), 2) AS estimated_inventory_value
FROM zepto
WHERE discountSellingPrice > 0
GROUP BY category
ORDER BY estimated_inventory_value DESC;

-- Q4. Which products have MRP above ₹500 but discount below 10%?
SELECT DISTINCT
    name,
    mrp,
    discountPercent
FROM zepto
WHERE mrp > 500
  AND discountPercent < 10
ORDER BY mrp DESC, discountPercent ASC;

-- Q5. Which 5 categories have the highest average discount percentage?
SELECT
    category,
    ROUND(AVG(discountPercent), 2) AS avg_discount_percent
FROM zepto
GROUP BY category
ORDER BY avg_discount_percent DESC
LIMIT 5;

-- Q6. Which products offer the lowest price per gram?
SELECT DISTINCT
    name,
    weightnGrms,
    discountSellingPrice,
    ROUND(discountSellingPrice / NULLIF(weightnGrms, 0), 2) AS price_per_gram
FROM zepto
WHERE weightnGrms >= 100
  AND discountSellingPrice > 0
ORDER BY price_per_gram ASC
LIMIT 20;

-- Q7. How can products be grouped into Low, Medium and Bulk weight categories?
SELECT DISTINCT
    name,
    weightnGrms,
    CASE
        WHEN weightnGrms < 1000 THEN 'Low'
        WHEN weightnGrms < 5000 THEN 'Medium'
        ELSE 'Bulk'
    END AS weight_category
FROM zepto
ORDER BY weightnGrms;

-- Q8. What is the total inventory weight for each category?
SELECT
    category,
    SUM(weightnGrms * availableQuantity) AS total_inventory_weight_grams
FROM zepto
GROUP BY category
ORDER BY total_inventory_weight_grams DESC;

-- Q9: Products with the highest discount amount
SELECT 
    name,
    category,
    mrp,
    discountSellingPrice,
    ROUND(mrp - discountSellingPrice, 2) AS discount_amount
FROM zepto
WHERE mrp > 0
  AND discountSellingPrice > 0
ORDER BY discount_amount DESC
LIMIT 10;

-- Q10: Estimated inventory value by category
SELECT 
    category,
    ROUND(SUM(discountSellingPrice * availableQuantity), 2) AS inventory_value
FROM zepto
WHERE discountSellingPrice > 0
GROUP BY category
ORDER BY inventory_value DESC;

-- Q11: Average MRP and selling price by category
SELECT 
    category,
    ROUND(AVG(mrp), 2) AS average_mrp,
    ROUND(AVG(discountSellingPrice), 2) AS average_selling_price
FROM zepto
WHERE mrp > 0
GROUP BY category
ORDER BY average_mrp DESC;

-- Q12: Products with high stock and low discount
SELECT 
    name,
    category,
    availableQuantity,
    mrp,
    discountPercent
FROM zepto
WHERE availableQuantity >= 10
  AND discountPercent < 10
ORDER BY availableQuantity DESC;

-- Q13: Products with the highest stock value
SELECT 
    name,
    category,
    availableQuantity,
    discountSellingPrice,
    ROUND(discountSellingPrice * availableQuantity, 2) AS stock_value
FROM zepto
WHERE availableQuantity > 0
  AND discountSellingPrice > 0
ORDER BY stock_value DESC
LIMIT 20;

-- Q14: Out-of-stock products with high discounts
SELECT 
    name,
    category,
    mrp,
    discountPercent,
    discountSellingPrice,
    availableQuantity
FROM zepto
WHERE outOfStock = TRUE
  AND discountPercent >= 20
ORDER BY discountPercent DESC;

-- Q15: Out-of-stock rate by category
SELECT 
    category,
    COUNT(*) AS total_products,
    SUM(CASE WHEN outOfStock = TRUE THEN 1 ELSE 0 END) AS out_of_stock_products,
    ROUND(
        100.0 * SUM(CASE WHEN outOfStock = TRUE THEN 1 ELSE 0 END) / COUNT(*),
        2
    ) AS out_of_stock_rate
FROM zepto
GROUP BY category
ORDER BY out_of_stock_rate DESC;

-- Q16: Products with the largest difference between MRP and selling price
SELECT 
    name,
    category,
    mrp,
    discountSellingPrice,
    ROUND(mrp - discountSellingPrice, 2) AS price_difference,
    discountPercent
FROM zepto
WHERE mrp > 0
  AND discountSellingPrice > 0
ORDER BY price_difference DESC
LIMIT 20;

-- Q17: Distribution of products across discount bands
SELECT
    CASE
        WHEN discountPercent = 0 THEN 'No Discount'
        WHEN discountPercent < 10 THEN 'Low Discount'
        WHEN discountPercent < 25 THEN 'Medium Discount'
        WHEN discountPercent < 50 THEN 'High Discount'
        ELSE 'Very High Discount'
    END AS discount_band,
    COUNT(*) AS product_count
FROM zepto
GROUP BY discount_band
ORDER BY product_count DESC;

-- Q18: Products with the lowest selling price per gram
SELECT 
    name,
    category,
    weightnGrms,
    discountSellingPrice,
    ROUND(discountSellingPrice / weightnGrms, 2) AS price_per_gram
FROM zepto
WHERE weightnGrms >= 100
  AND discountSellingPrice > 0
  AND weightnGrms > 0
ORDER BY price_per_gram ASC
LIMIT 20;

-- Q19: Total available units by category
SELECT 
    category,
    SUM(availableQuantity) AS total_units_in_stock
FROM zepto
GROUP BY category
ORDER BY total_units_in_stock DESC;

-- Q20: Products with low available stock
SELECT 
    name,
    category,
    availableQuantity,
    discountPercent,
    outOfStock
FROM zepto
WHERE availableQuantity BETWEEN 1 AND 3
ORDER BY availableQuantity ASC;
