/*
==================================================================================
==================================================================================
Project: Retail Sales & Financial Performance Analytics
TOOL: MySQL
DATASET: Superstore
PURPOSE: Business & Sales Performance Analysis

==================================================================================
================================================================================== */

USE retail_analytics;

SELECT * FROM superstore LIMIT 10;

/* ============================================================
   2. DATA QUALITY CHECKS
   ============================================================ */

-- Total number of rows
SELECT COUNT(*) AS total_rows
FROM superstore;

-- Check duplicate Row IDs
SELECT row_id, COUNT(*) AS duplicate_count
FROM superstore
GROUP BY row_id
HAVING COUNT(*) > 1;

-- Check NULL values in important columns
SELECT
    COUNT(*) AS total_rows,
    COUNT(order_id) AS order_id_filled,
    COUNT(customer_id) AS customer_id_filled,
    COUNT(sales) AS sales_filled,
    COUNT(profit) AS profit_filled
FROM superstore;

* ============================================================
   3. BASIC BUSINESS KPIs
   ============================================================ */

SELECT
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(AVG(sales), 2) AS avg_sales_per_transaction,
    ROUND(AVG(profit), 2) AS avg_profit_per_transaction,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM superstore;

/* ============================================================
   4. CATEGORY-WISE SALES & PROFIT
   ============================================================ */

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;

/* ============================================================
   5. REGION-WISE SALES & PROFIT
   ============================================================ */

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

/* ============================================================
   6. SEGMENT-WISE SALES & PROFIT
   ============================================================ */

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY segment
ORDER BY total_sales DESC;

/* ============================================================
   7. CATEGORY & SUB-CATEGORY ANALYSIS
   ============================================================ */

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY category, sub_category
ORDER BY total_profit DESC;

/* ============================================================
   8. MONTHLY SALES & PROFIT TREND
   ============================================================ */

SELECT
    YEAR(order_date) AS order_year,
    MONTH(order_date) AS order_month,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY
    YEAR(order_date),
    MONTH(order_date)
ORDER BY
    order_year,
    order_month;
    
/* ============================================================
   9. DISCOUNT vs PROFITABILITY
   ============================================================ */

SELECT
    discount,
    COUNT(*) AS total_transactions,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY discount
ORDER BY discount;

/* ============================================================
   10. TOP 10 MOST PROFITABLE PRODUCTS
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit DESC
LIMIT 10;

/* ============================================================
   11. TOP 10 LOSS-MAKING PRODUCTS
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY product_name
ORDER BY total_profit ASC
LIMIT 10;

/* ============================================================
   12. CATEGORY-WISE PROFIT MARGIN
   ============================================================ */

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY category
ORDER BY profit_margin_pct DESC;

/* ============================================================
   13. STATE-WISE SALES & PROFIT
   ============================================================ */

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

/* ============================================================
   14. YEAR-WISE SALES & PROFIT
   ============================================================ */

SELECT
    YEAR(order_date) AS order_year,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore
GROUP BY YEAR(order_date)
ORDER BY order_year;

/* ============================================================
   15. SHIP MODE ANALYSIS
   ============================================================ */

SELECT
    ship_mode,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY ship_mode
ORDER BY total_sales DESC;

/* ============================================================
   16. REGION-WISE PROFIT MARGIN
   ============================================================ */

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY region
ORDER BY profit_margin_pct DESC;

/* ============================================================
   17. SUB-CATEGORY PROFIT MARGIN
   ============================================================ */

SELECT
    category,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY category, sub_category
ORDER BY profit_margin_pct DESC;

/* ============================================================
   18. HIGH DISCOUNT TRANSACTIONS
   ============================================================ */

SELECT
    discount,
    COUNT(*) AS total_transactions,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
WHERE discount >= 0.30
GROUP BY discount
ORDER BY discount;

/* ============================================================
   19. AVERAGE ORDER VALUE BY SEGMENT
   ============================================================ */

SELECT
    segment,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(
        SUM(sales) / COUNT(DISTINCT order_id),
        2
    ) AS avg_order_value
FROM superstore
GROUP BY segment
ORDER BY avg_order_value DESC;

/* ============================================================
   20. REPEAT vs ONE-TIME CUSTOMERS
   ============================================================ */

SELECT
    customer_type,
    COUNT(*) AS customer_count
FROM (
    SELECT
        customer_id,
        CASE
            WHEN COUNT(DISTINCT order_id) > 1
                THEN 'Repeat Customer'
            ELSE 'One-Time Customer'
        END AS customer_type
    FROM superstore
    GROUP BY customer_id
) AS customer_analysis
GROUP BY customer_type;

/* ============================================================
   21. HIGH SALES BUT LOW PROFIT PRODUCTS
   ============================================================ */

SELECT
    product_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM superstore
GROUP BY product_name
HAVING SUM(sales) > 5000
   AND SUM(profit) < 500
ORDER BY total_sales DESC
LIMIT 10;

/* ============================================================
   22. YEAR-OVER-YEAR SALES & PROFIT GROWTH
   ============================================================ */

WITH yearly_data AS (
    SELECT
        YEAR(order_date) AS order_year,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM superstore
    GROUP BY YEAR(order_date)
)
SELECT
    order_year,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        (total_sales - LAG(total_sales) OVER (ORDER BY order_year))
        / LAG(total_sales) OVER (ORDER BY order_year) * 100,
        2
    ) AS sales_growth_pct,
    ROUND(
        (total_profit - LAG(total_profit) OVER (ORDER BY order_year))
        / LAG(total_profit) OVER (ORDER BY order_year) * 100,
        2
    ) AS profit_growth_pct
FROM yearly_data
ORDER BY order_year;

/* ============================================================
   23. CUSTOMER PROFIT RANKING
   ============================================================ */

SELECT
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    RANK() OVER (
        ORDER BY SUM(profit) DESC
    ) AS profit_rank
FROM superstore
GROUP BY customer_name
ORDER BY profit_rank
LIMIT 20;

/* ============================================================
   24. TOP 3 PRODUCTS WITHIN EACH CATEGORY
   ============================================================ */

WITH product_profit AS (
    SELECT
        category,
        product_name,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM superstore
    GROUP BY category, product_name
),
ranked_products AS (
    SELECT
        category,
        product_name,
        ROUND(total_sales, 2) AS total_sales,
        ROUND(total_profit, 2) AS total_profit,
        RANK() OVER (
            PARTITION BY category
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM product_profit
)
SELECT
    category,
    product_name,
    total_sales,
    total_profit,
    profit_rank
FROM ranked_products
WHERE profit_rank <= 3
ORDER BY category, profit_rank;

/* ============================================================
   25. MONTHLY SALES GROWTH
   ============================================================ */

WITH monthly_sales AS (
    SELECT
        YEAR(order_date) AS order_year,
        MONTH(order_date) AS order_month,
        SUM(sales) AS total_sales
    FROM superstore
    GROUP BY
        YEAR(order_date),
        MONTH(order_date)
)
SELECT
    order_year,
    order_month,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(
        (
            total_sales
            - LAG(total_sales) OVER (
                ORDER BY order_year, order_month
            )
        )
        / LAG(total_sales) OVER (
            ORDER BY order_year, order_month
        ) * 100,
        2
    ) AS sales_growth_pct
FROM monthly_sales
ORDER BY order_year, order_month;

/* ============================================================
   26. CUSTOMER VALUE ANALYSIS
   ============================================================ */

SELECT
    customer_id,
    customer_name,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(sales) / COUNT(DISTINCT order_id),
        2
    ) AS avg_order_value
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_profit DESC
LIMIT 20;

/* ============================================================
   27. DISCOUNT BAND PROFITABILITY
   ============================================================ */

SELECT
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        ELSE '30%+'
    END AS discount_band,

    COUNT(*) AS transactions,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        (SUM(profit) / SUM(sales)) * 100,
        2
    ) AS profit_margin_pct

FROM superstore

GROUP BY
    CASE
        WHEN discount = 0 THEN '0%'
        WHEN discount <= 0.10 THEN '1-10%'
        WHEN discount <= 0.20 THEN '11-20%'
        WHEN discount <= 0.30 THEN '21-30%'
        ELSE '30%+'
    END

ORDER BY MIN(discount);

/* ============================================================
   28. TOP 3 CUSTOMERS WITHIN EACH SEGMENT
   ============================================================ */

WITH customer_profit AS (
    SELECT
        segment,
        customer_id,
        customer_name,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM superstore
    GROUP BY
        segment,
        customer_id,
        customer_name
),
ranked_customers AS (
    SELECT
        segment,
        customer_id,
        customer_name,
        ROUND(total_sales, 2) AS total_sales,
        ROUND(total_profit, 2) AS total_profit,
        RANK() OVER (
            PARTITION BY segment
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM customer_profit
)
SELECT
    segment,
    customer_id,
    customer_name,
    total_sales,
    total_profit,
    profit_rank
FROM ranked_customers
WHERE profit_rank <= 3
ORDER BY
    segment,
    profit_rank;
    
    /* ============================================================
   29. FINAL DATASET VERIFICATION
   ============================================================ */

SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT order_id) AS unique_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    COUNT(DISTINCT product_id) AS unique_products
FROM superstore;



