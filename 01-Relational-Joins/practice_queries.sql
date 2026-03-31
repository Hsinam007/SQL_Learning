-- ==========================================
-- TOPIC: RELATIONAL JOINS PRACTICE
-- OBJECTIVE: Recombine Customer and Order data
-- ==========================================

-- 1. INNER JOIN: Get only customers who have placed orders
SELECT 
    c.id AS customer_id,
    c.first_name,
    o.sales AS order_amount
FROM customers AS c
INNER JOIN orders AS o
    ON c.id = o.customer_id;


-- 2. LEFT JOIN: Get ALL customers and their orders (if any)
-- This will show NULL for customers with no orders
SELECT 
    c.id AS customer_id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id;


-- 3. FULL JOIN: Combine everything from both tables
SELECT 
    c.id AS customer_id,
    c.first_name,
    o.order_id,
    o.sales
FROM customers AS c
FULL JOIN orders AS o
    ON c.id = o.customer_id;


-- PRO TIP: A "Right Join" is just a "Left Join" with the tables swapped.
-- Most professionals stick to LEFT JOIN for better readability.
