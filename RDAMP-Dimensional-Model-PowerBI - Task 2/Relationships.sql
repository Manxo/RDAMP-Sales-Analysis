-- dim_sales → dim_locations
ALTER TABLE dim_sales
ADD CONSTRAINT FK_sales_location
FOREIGN KEY (location_id)
REFERENCES dim_locations(location_id);

-- dim_sales → dim_customer
ALTER TABLE dim_sales
ADD CONSTRAINT FK_sales_customer
FOREIGN KEY (customer_id)
REFERENCES dim_customer(customer_id);

-- dim_sales → dim_order_mode
ALTER TABLE dim_sales
ADD CONSTRAINT FK_sales_order_mode
FOREIGN KEY (order_mode_id)
REFERENCES dim_order_mode(order_mode_id);

-- dim_sales → dim_product
ALTER TABLE dim_sales
ADD CONSTRAINT FK_sales_product
FOREIGN KEY (product_id)
REFERENCES dim_product(product_id);

-- dim_sales → dim_segment
ALTER TABLE dim_sales
ADD CONSTRAINT FK_sales_segment
FOREIGN KEY (segment_id)
REFERENCES dim_segment(segment_id);
