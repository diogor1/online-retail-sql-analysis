--1
SELECT TOP 5
    p.product_name,
    SUM(CAST(oi.quantity AS INT)) AS total_quantity_sold
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    p.product_name
ORDER BY 
    total_quantity_sold DESC;

	-- 2 Revenue by product category
SELECT 
    p.category,
    ROUND(SUM(CAST(oi.total_price AS DECIMAL(10,2))), 2) AS total_revenue
FROM 
    order_items oi
JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY 
    p.category
ORDER BY 
    total_revenue DESC;

	--3 Top Spending Customers.
	SELECT 
	TOP 5
    c.customer_name,
    ROUND(SUM(CAST(oi.total_price AS DECIMAL (10,2))), 2) AS total_spent
FROM 
    order_items oi
JOIN 
    orders o ON oi.order_id = o.order_id
JOIN 
    customers c ON o.customer_id = c.customer_id
GROUP BY 
    c.customer_name
ORDER BY 
    total_spent DESC;

	--4
	SELECT 
    FORMAT(CAST(o.order_date AS DATE), 'yyyy-MM') AS month,
    ROUND(SUM(CAST(oi.total_price AS DECIMAL(10,2))), 2) AS monthly_revenue
FROM 
    orders o
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    FORMAT(CAST(o.order_date AS DATE), 'yyyy-MM')
ORDER BY 
    month;

	--5
	SELECT 
    c.customer_name,
    ROUND(SUM(CAST(oi.total_price AS DECIMAL(10,2))) / COUNT(DISTINCT o.order_id), 2) AS avg_order_value
FROM 
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
JOIN 
    order_items oi ON o.order_id = oi.order_id
GROUP BY 
    c.customer_name
ORDER BY 
    avg_order_value DESC;

	
	