/* ADVANCED SQL JOINS PRACTICE 
   Focus: Anti-Joins, Data Auditing, and Cartesian Products
*/

-- 1. LEFT ANTI JOIN: Find the missing matches
-- Use Case: Get all customers who haven't placed any orders (Inactive users).
SELECT * FROM customers AS c
LEFT JOIN orders AS o
    ON c.id = o.customer_id
WHERE o.customer_id IS NULL;


-- 2. RIGHT ANTI JOIN: Find orphaned records
-- Use Case: Get all orders that don't belong to a valid customer (Bad data scenario).
-- Note: Can also be done using LEFT JOIN by switching table sequence.
SELECT * FROM orders AS o
RIGHT JOIN customers AS c
    ON c.id = o.customer_id
WHERE c.id IS NULL;


-- 3. FULL ANTI JOIN: The complete unmatched view
-- Use Case: Return ONLY rows that don't match in either table (System error auditing).
SELECT * FROM customers AS c
FULL JOIN orders AS o
    ON c.id = o.customer_id
WHERE c.id IS NULL 
   OR o.customer_id IS NULL;


-- 4. CROSS JOIN: All possible combinations (Cartesian Join)
-- Use Case: Generating test data or seeing all theoretical combinations.
-- Note: If you have 5 customers and 4 orders, this generates 20 rows.
SELECT * FROM customers
CROSS JOIN orders;
