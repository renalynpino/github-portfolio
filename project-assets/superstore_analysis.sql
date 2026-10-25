-- 1. Which categories generate the most sales?

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY category
ORDER BY total_sales DESC;


-- 2. Which sub-categories generate the most sales?

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sub_category
ORDER BY total_sales DESC
LIMIT 10;

-- 3. Which regions have the highest sales?

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY region
ORDER BY total_sales DESC;

-- 4. Who are the top 10 customers by sales?

SELECT
    customer_id,
    customer_name,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

-- 5. How do sales change over time?

SELECT
    DATE_TRUNC('month', order_date)::DATE AS sales_month,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore
GROUP BY sales_month
ORDER BY sales_month;


-- 6. How long does shipping take on average?

SELECT
    ship_mode,
    ROUND(AVG(ship_date - order_date), 2)
        AS average_shipping_days
FROM superstore
GROUP BY ship_mode
ORDER BY average_shipping_days;