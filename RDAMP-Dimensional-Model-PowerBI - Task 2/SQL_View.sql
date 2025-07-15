CREATE VIEW vw_product_seasonality AS
SELECT 
    p.product_id,
    p.product_name,
    FORMAT(s.order_date, 'yyyy-MM') AS month_year, -- Monthly granularity
    SUM(s.quantity) AS total_quantity_sold,
    SUM(s.sales) AS total_sales,
    SUM(s.discount) AS total_discount,
    COUNT(*) AS transaction_count
FROM dim_sales s
JOIN dim_product p ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name,
    FORMAT(s.order_date, 'yyyy-MM');


select * from vw_product_seasonality;    

CREATE VIEW vw_discount_impact_analysis AS
SELECT 
    p.product_id,
    p.product_name,
    FORMAT(s.order_date, 'yyyy-MM') AS month_year,
    
    SUM(s.sales) AS total_sales,
    SUM(s.cost_price) AS total_cost,
    SUM(s.sales) - SUM(s.cost_price) AS total_profit,
    
    SUM(s.discount * s.sales) AS total_discount_amount,
    
    COUNT(*) AS transaction_count,
    
    CASE 
        WHEN SUM(s.sales) = 0 THEN 0
        ELSE ROUND((SUM(s.discount * s.sales) / SUM(s.sales)) * 100, 2)
    END AS discount_to_sales_ratio_pct,

    CASE 
        WHEN SUM(s.discount * s.sales) = 0 THEN NULL
        ELSE ROUND(((SUM(s.sales) - SUM(s.cost_price)) / SUM(s.discount * s.sales)), 2)
    END AS profit_per_discount_unit
FROM dim_sales s
JOIN dim_product p ON s.product_id = p.product_id
GROUP BY 
    p.product_id,
    p.product_name,
    FORMAT(s.order_date, 'yyyy-MM');

select * from vw_discount_impact_analysis;

CREATE VIEW vw_customer_order_patterns AS
SELECT 
    seg.segment,
    p.Segement,
    c.customer_id,

    COUNT(s.order_id) AS order_count,                     -- Frequency
    SUM(s.sales) AS total_sales,
    SUM(s.cost_price) AS total_cost,
    SUM(s.sales) - SUM(s.cost_price) AS total_profit,

    ROUND(SUM(s.sales) * 1.0 / COUNT(s.order_id), 2) AS avg_order_value,
    ROUND((SUM(s.sales) - SUM(s.cost_price)) * 1.0 / COUNT(s.order_id), 2) AS avg_profit_per_order
FROM dim_sales s
JOIN dim_customer c ON s.customer_id = c.customer_id
JOIN dim_product on p.Segement = seg.dim_segment
GROUP BY 
    seg.segment,
    c.customer_id;

    select * from vw_customer_order_patterns;