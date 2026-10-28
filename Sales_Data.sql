
-- Q1: Overall Sales Performance
SELECT
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    SUM(Quantity_Sold) AS Total_Quantity_Sold,
    COUNT(*) AS Total_Sales_Records,
    COUNT(DISTINCT Product_ID) AS Distinct_Products
FROM sales_data;


-- Q2: Top Five Products by Revenue
SELECT
    Product_ID,
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM sales_data
GROUP BY Product_ID
ORDER BY Total_Sales_Revenue DESC
LIMIT 5;


-- Q3: Regional Sales Performance
SELECT
    Region,
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    SUM(Quantity_Sold) AS Total_Quantity_Sold
FROM sales_data
GROUP BY Region
ORDER BY Total_Sales_Revenue DESC;


-- Q4: Monthly Sales Trend
SELECT
    DATE_FORMAT(CAST(Sale_Date AS DATE), 'yyyy-MM') AS Sales_Month,
    SUM(Sales_Amount) AS Total_Sales_Revenue
FROM sales_data
GROUP BY DATE_FORMAT(CAST(Sale_Date AS DATE), 'yyyy-MM')
ORDER BY Sales_Month;


-- Q5: Product Category Contribution
SELECT
    Product_Category,
    SUM(Sales_Amount) AS Total_Sales_Revenue,
    ROUND(
        SUM(Sales_Amount) * 100.0
        / SUM(SUM(Sales_Amount)) OVER (),
        2
    ) AS Revenue_Contribution_Percentage
FROM sales_data
GROUP BY Product_Category
ORDER BY Total_Sales_Revenue DESC;
