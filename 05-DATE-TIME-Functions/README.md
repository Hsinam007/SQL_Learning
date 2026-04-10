# 📅 SQL Date and Time Functions Mastery

### 📌 Overview
Mastering date and time manipulation is essential for performing time-series analysis and generating periodic business reports (Monthly, Quarterly, Yearly). 

---

### 🚀 Core Functions & Usage

#### 1. Current Date & Static Values
* **`GETDATE()`**: Returns the current system date and time in `YYYY-MM-DD HH:MM:SS` format.
* **Hardcoded Dates**: Static date strings (e.g., `'2025-08-20'`) used for comparisons or fixed reporting periods.

#### 2. Part Extraction (Individual Components)
To analyze specific periods, we extract individual components from a timestamp:
* **`YEAR()`, `MONTH()`, `DAY()`**: Quick functions to return integer values of the date parts.
* **`DATEPART(part, date)`**: Returns an **Integer** (e.g., `DATEPART(QUARTER, ...)` returns `3`).
* **`DATENAME(part, date)`**: Returns a **String** (e.g., `DATENAME(MONTH, ...)` returns `'August'`).

#### 3. Date Truncation (`DATETRUNC`)
Unlike extraction, `DATETRUNC` "resets" a date to the first day of the specified part.
* **Logic**: `DATETRUNC(MONTH, '2025-08-20')` ➡️ `'2025-08-01'`.
* **Utility**: This is the preferred method for grouping data while maintaining a valid date format for trend lines in BI tools.

#### 4. Boundary Logic
* **`EOMONTH(date)`**: Returns the last day of the month for the given date.
* **Start of Month**: Calculated by combining `DATETRUNC` and `CAST` (e.g., `CAST(DATETRUNC(MONTH, date) AS DATE)`).

---

### 📊 Practical Business Applications

#### A. Trend Analysis (Monthly Aggregation)
Useful for identifying seasonal patterns by grouping all orders into their respective starting months:
```sql
SELECT
    DATETRUNC(MONTH, CreationTime) AS MonthStart,
    DATENAME(MONTH, CreationTime) AS MonthName,
    COUNT(*) AS TotalOrders
FROM Sales.Orders
GROUP BY DATETRUNC(MONTH, CreationTime), DATENAME(MONTH, CreationTime);
