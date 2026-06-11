-- =====================================================
-- CUSTOMER SHOPPING BEHAVIOR ANALYSIS
-- SQL QUERIES ORGANIZED BY POWER BI PAGES
-- =====================================================


-- =====================================================
-- PAGE 1 - OVERVIEW / KPI DASHBOARD
-- =====================================================

SELECT
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Review_Rating), 2) AS Avg_Review_Rating
FROM shopping_behavior_updated.csv;


SELECT
    Category,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM shopping_behavior_updated.csv
GROUP BY Category
ORDER BY Total_Sales DESC;


SELECT
    Season,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM shopping_behavior_updated.csv
GROUP BY Season
ORDER BY Total_Sales DESC;


-- =====================================================
-- PAGE 2 - CUSTOMER DEMOGRAPHICS
-- =====================================================

SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS Age_Group,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM shopping_behavior_updated.csv
GROUP BY Age_Group
ORDER BY Age_Group;


SELECT
    Gender,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM shopping_behavior_updated.csv
GROUP BY Gender;


SELECT
    CASE
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 60 THEN '46-60'
        ELSE '60+'
    END AS Age_Group,
    Gender,
    COUNT(DISTINCT CustomerID) AS Total_Customers,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders
FROM shopping_behavior_updated.csv
GROUP BY Age_Group, Gender
ORDER BY Age_Group, Gender;


-- =====================================================
-- PAGE 3 - PRODUCT & CATEGORY ANALYSIS
-- =====================================================

SELECT
    Item_Purchased,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Review_Rating), 2) AS Avg_Review_Rating
FROM shopping_behavior_updated.csv
GROUP BY Item_Purchased
ORDER BY Total_Sales DESC;


SELECT
    CustomerID,
    SUM(Purchase_Amount) AS Total_Sales,
    COUNT(*) AS Total_Orders,
    ROUND(AVG(Review_Rating), 2) AS Avg_Review_Rating
FROM shopping_behavior_updated.csv
GROUP BY CustomerID
ORDER BY Total_Sales DESC, CustomerID ASC;
