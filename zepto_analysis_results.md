# Zepto SQL Analysis — Results

This file records the verified results produced from `zepto_v2.csv` using the same logic as the SQL analysis queries.

## Dataset Summary

- Rows: **3,732**
- Categories: **14**
- Out-of-stock rows: **453**
- Average listed discount: **7.62%**

> Prices below are shown in Indian Rupees. The source CSV stores price values in a paise-like format.

## Verified Results

### Q1 — Top 10 products by discount percentage

- **51%**: Dukes Waffy Chocolate Wafers
- **51%**: Dukes Waffy Orange Wafers
- **51%**: Dukes Waffy Strawberry Wafers
- **50%**: Ceres Foods Fish Mustard Instant Liquid Masala
- **50%**: Ceres Foods Laal Maas Instant Liquid Masala
- **50%**: Ceres Foods Nalli Nihari Instant Liquid Masala
- **50%**: Chef's Basket Durum Wheat Elbow Pasta
- **50%**: Chef's Basket Durum Wheat Fusilli Pasta
- **50%**: Chef's Basket Durum Wheat Penne Pasta
- **50%**: Dukes Waffy Chocolate Wafer Rolls

### Q2 — High-MRP products currently out of stock

- Patanjali Cow's Ghee — **₹565**
- MamyPoko Pants Standard Diapers, Extra Large — **₹399**
- Aashirvaad Atta With Mutigrains — **₹315**
- Everest Kashmiri Lal Chilli Powder — **₹310**

### Q3 — Estimated inventory value by category

- Cooking Essentials — **₹337,369**
- Munchies — **₹337,369**
- Paan Corner — **₹270,849**
- Personal Care — **₹270,849**
- Ice Cream & Desserts — **₹224,385**
- Chocolates & Candies — **₹224,385**
- Packaged Food — **₹224,385**
- Home & Cleaning — **₹122,661**
- Health & Hygiene — **₹64,180**
- Dairy, Bread & Batter — **₹55,051**
- Beverages — **₹55,051**
- Biscuits — **₹25,007.60**
- Meats, Fish & Eggs — **₹20,693**
- Fruits & Vegetables — **₹10,846**

### Q4 — MRP above ₹500 with discount below 10%

**39 product-category rows** matched the condition. The highest-MRP examples were:

- Dhara Kachi Ghani Mustard Oil Jar — ₹1,250 — 8%
- Saffola Gold (Jar) — ₹1,240 — 0%
- Dhara Filtered Groundnut Oil (Jar) — ₹1,050 — 0–1%
- Fortune Rice Bran Health Oil (Jar) — ₹1,050 — 1%
- Fortune Soyabean Oil — ₹1,005 — 0%

### Q5 — Top 5 categories by average discount

- Fruits & Vegetables — **15.46%**
- Meats, Fish & Eggs — **11.03%**
- Ice Cream & Desserts — **8.32%**
- Packaged Food — **8.32%**
- Chocolates & Candies — **8.32%**

### Q6 — Lowest price per gram

Among products weighing at least 100g, the lowest calculated price was approximately **₹0.02/g**. Examples include Aashirvaad Iodised Salt, Onion, Tata Salt and Vicks Cough Drops Menthol.

### Q7 — Weight classification

The query groups products into Low (<1,000g), Medium (1,000–4,999g) and Bulk (≥5,000g) weight bands. **1,783 distinct product-name/weight combinations** were returned.

### Q8 — Total inventory weight by category

- Cooking Essentials — **1,404,654g**
- Munchies — **1,404,654g**
- Ice Cream & Desserts — **490,797g**
- Packaged Food — **490,797g**
- Chocolates & Candies — **490,797g**
- Home & Cleaning — **373,236g**
- Paan Corner — **348,187g**
- Personal Care — **348,187g**

### Q9 — Highest absolute discount amount

- Borges Extra Light Olive Oil Bottle — **₹1,201** discount
- Pampers Pants - Large — **₹700** discount
- Kelloggs Chocos - Moons & Stars — **₹264** discount
- Pampers Active Baby Diapers New Born Extra Small — **₹250** discount
- Popular Essentials Californian Almond — **₹225** discount

### Q10 — Highest average available quantity

- Health & Hygiene — **4.38 units**
- Home & Cleaning — **4.32 units**
- Cooking Essentials — **4.25 units**
- Munchies — **4.25 units**
- Paan Corner — **4.24 units**

### Q11 — Average MRP and selling price

Highest average MRP categories:

- Paan Corner — ₹207.12 MRP / ₹189.74 selling price
- Personal Care — ₹207.12 / ₹189.74
- Meats, Fish & Eggs — ₹187.29 / ₹164.10
- Health & Hygiene — ₹159.18 / ₹145.86
- Cooking Essentials — ₹156.54 / ₹140.83

### Q12 — High stock with low discount

**0 rows** matched the condition of available quantity ≥10 and discount below 10%.

### Q13 — Highest stock value

- Borges Extra Light Olive Oil Bottle — **₹8,394**
- Praakritik Natural Desi Gir Cow A2 Ghee — **₹7,830**
- Saffola Gold (Jar) — **₹7,440**
- Dhara Kachi Ghani Mustard Oil Jar — **₹6,858**
- Fortune Rice Bran Health Oil (Jar) — **₹6,234**

### Q14 — Out-of-stock despite high discounts

**21 product-category rows** matched the condition of being out of stock with discount ≥20%. The highest-discount examples include Chef's Basket Durum Wheat Penne Pasta (**50%**), Dukes Waffy Chocolate Wafer Rolls (**50%**) and Epigamia Fruit Yogurt Strawberry (**50%**).

### Q15 — Highest out-of-stock rate

- Biscuits — **28.57%** (42/147)
- Beverages — **21.71%** (28/129)
- Dairy, Bread & Batter — **21.71%** (28/129)
- Meats, Fish & Eggs — **19.05%** (12/63)
- Health & Hygiene — **13.40%** (13/97)

### Q16 — Largest listed vs calculated discount difference

The largest observed difference was about **0.99 percentage points**. Example:

- Gowardhan Classic Block Fresh Paneer — listed **8%**, calculated **8.99%**

This indicates small rounding/data-entry differences rather than large pricing inconsistencies in the top results.

### Q17 — Discount-band distribution

- Low Discount — **1,274 rows**
- No Discount — **1,178 rows**
- Medium Discount — **1,074 rows**
- High Discount — **148 rows**
- Very High Discount — **58 rows**

### Q18 — Products with no discount

**1,178 rows** had a listed discount of 0%.

### Q19 — Highest number of available units by category

- Cooking Essentials — **2,186 units**
- Munchies — **2,186 units**
- Ice Cream & Desserts — **1,521 units**
- Packaged Food — **1,521 units**
- Chocolates & Candies — **1,521 units**
- Paan Corner — **1,458 units**
- Personal Care — **1,458 units**

### Q20 — Low-stock products

**897 rows** had available quantity between 1 and 3 units.

## Business Takeaways

1. **Discounting is concentrated at the lower end:** 1,178 rows have no discount, while only 206 rows fall into High or Very High discount bands.
2. **Fruits & Vegetables has the highest average discount (15.46%)**, followed by Meats, Fish & Eggs (11.03%).
3. **Cooking Essentials and Munchies have the highest estimated inventory value at ₹337,369 each.**
4. **Biscuits has the highest out-of-stock rate at 28.57%,** making it a category worth monitoring for availability.
5. **897 rows are in the 1–3 unit low-stock range**, providing a useful inventory-monitoring signal.
6. **Q12 returned zero rows**, meaning the dataset does not contain products with both high available stock (≥10) and low discount (<10%) under this rule.
7. **High discount does not guarantee availability:** 21 product-category rows were out of stock despite discounts of at least 20%.
8. The largest listed-vs-calculated discount difference is only about **0.99 percentage points**, suggesting the top discrepancies are small.

## Interpretation Note

These are descriptive findings from a catalogue/inventory snapshot. They can support inventory and pricing review, but they should not be interpreted as actual sales, demand, revenue, or causal effects of discounts.
