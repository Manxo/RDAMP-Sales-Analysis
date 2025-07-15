-- Total Sales
SELECT CEILING(SUM(sales)) AS total_Sales
FROM dim_sales;

-- Total Cost
SELECT CEILING(SUM([cost_price])) AS total_cost
FROM dim_sales;

-- Profit
SELECT CEILING(SUM(sales)) - CEILING(SUM([cost_price])) AS profit
FROM dim_sales;

-- Discount Amount
SELECT CEILING(SUM([discount])) AS total_discount
FROM dim_sales;

-- Quantity Sold
SELECT CEILING(SUM([quantity]))
FROM dim_sales;