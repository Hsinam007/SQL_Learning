/* ==============================================================================
   SQL SET OPERATIONS PRACTICE
   Focus: Row-wise combination, Delta Detection, and Best Practices
===============================================================================*/

-- 1. UNION: Combine and deduplicate
-- Use Case: Generate a single, distinct contact list of both customers and employees.
SELECT
    FirstName,
    LastName
FROM Sales.Customers
UNION
SELECT
    FirstName,
    LastName
FROM Sales.Employees;

-- 2. UNION ALL: Combine everything (High Performance)
-- Use Case: Stack lists rapidly where duplicates are either expected or impossible.
SELECT
    FirstName,
    LastName
FROM Sales.Customers
UNION ALL
SELECT
    FirstName,
    LastName
FROM Sales.Employees;

-- 3. EXCEPT (MINUS): Find the Delta
-- Use Case: Find employees who are NOT customers at the same time.
-- The second table acts as a lookup/filter against the first table.
SELECT
    FirstName,
    LastName
FROM Sales.Employees
EXCEPT
SELECT
    FirstName,
    LastName
FROM Sales.Customers;

-- 4. INTERSECT: Find the Overlap
-- Use Case: Find employees who ARE also customers.
SELECT
    FirstName,
    LastName
FROM Sales.Employees
INTERSECT
SELECT
    FirstName,
    LastName
FROM Sales.Customers;

/* ==============================================================================
   🌟 INDUSTRY BEST PRACTICE QUERY
   Why this matters:
   1. Explicit column names prevent silent failures if table schemas change.
   2. Hardcoding a "SourceTable" column ensures data lineage is preserved 
      after the tables are merged.
===============================================================================*/

SELECT 
      'Orders_Active' AS SourceTable,
      [OrderID],
      [ProductID],
      [CustomerID],
      [SalesPersonID],
      [OrderDate],
      [Sales]
FROM Sales.Orders
UNION ALL -- Assuming no overlapping IDs between active and archive
SELECT 
      'Orders_Archive' AS SourceTable,
      [OrderID],
      [ProductID],
      [CustomerID],
      [SalesPersonID],
      [OrderDate],
      [Sales]
FROM Sales.OrdersArchive
ORDER BY OrderID; -- ORDER BY is only allowed once at the very end
