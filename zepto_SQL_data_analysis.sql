drop table if exists zepto;

CREATE TABLE zepto (
sku_id SERIAL PRIMARY KEY,
Category VARCHAR (120),
name VARCHAR (150) NOT NULL,
mrp NUMERIC (8,2),
discountPercent NUMERIC (5,2),
availableQuantity INTEGER,
discountSellingPrice NUMERIC (8,2),
weightnGrms INTEGER,
outOfStock BOOLEAN,
quantity INTEGER
);

--Data Exploration

--Count of rows
 SELECT COUNT(*) FROM zepto

 --Sample data
 SELECT * FROM zepto
 LIMIT 10;


--NULL VALUES
SELECT * FROM zepto
WHERE name IS NULL
OR
Category IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
availableQuantity IS NULL
OR
discountSellingPrice IS NULL
or
weightnGrms IS NULL
OR
outOfStock IS NULL
OR
quantity IS NULL;


--Different Product categories
SELECT DISTINCT category
FROM zepto
ORDER BY category;

-- Product in stock vs out of stock
SELECT outOfStock, COUNT(sku_id)
FROM zepto
GROUP BY outOfStock;


--Product names present multiples times 
SELECT name , COUNT(sku_id) as "Number of SKUs"
FROM zepto
GROUP BY name
HAVING COUNT(sku_id) > 1
ORDER BY COUNT(sku_id) DESC;

-- data cleaning

-- Products with price = 0

SELECT * FROM zepto
WHERE mrp = 0 OR discountSellingPrice = 0;

DELETE FROM zepto 
WHERE mrp = 0;

-- Convert paise to rupees
UPDATE zepto 
SET mrp = mrp/100.0,
discountSellingPrice = discountSellingPrice/100.0;

SELECT mrp, discountSellingPrice FROM zepto;


-- Data Analysis

-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent 
FROM zepto
ORDER BY discountPercent DESC
LIMIT 10;


-- Q2. What are the Products with High MRP but Out of Stock   
SELECT DISTINCT name , mrp
FROM zepto
WHERE outOfStock = TRUE and mrp > 300
ORDER BY mrp DESC;


-- Q3. Calculate Estimated Revenue for each category   
SELECT  category,
SUM(discountSEllingPrice * availableQuantity) AS total_revenue
FROM zepto
GROUP BY category
ORDER BY total_revenue;


-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.   

SELECT Distinct name , mrp, discountPercent
From zepto
WHERE mrp > 500 AND discountPercent <10
ORDER BY mrp DESC,discountPercent DESC ;


-- Q5. Identify the top 5 categories offering the highest average discount percentage.   
SELECT category,
ROUND(AVG(discountPercent),2) as AVG_discount
FROM zepto
GROUP BY category
ORDER BY AVG_discount DESC
LIMIT 5;



-- Q6. Find the price per gram for products above 100g and sort by best value.   

SELECT DISTINCT name, weightnGrms, discountSellingPrice,
ROUND(discountSellingPrice/weightnGrms,2) AS price_per_gram
FROM zepto
WHERE weightnGrms >= 100
ORDER BY price_per_gram;

-- Q7. Group the products into categories like Low, Medium, Bulk based on their weight in grms.   
SELECT DISTINCT name , weightnGrms,
CASE WHEN weightnGrms < 1000 THEN 'Low'
     WHEN weightnGrms < 5000 THEN 'Medium'
	 ELSE 'Bulk'
	 END AS weight_category
FROM zepto;	 

-- Q8. What is the Total Inventory Weight Per Category

SELECT  category,
SUM(weightnGrms * availableQuantity) As Total_weight
FROM zepto
GROUP BY category
ORDER BY Total_weight; 

