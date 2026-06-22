CREATE TABLE product_sales_raw(
date TEXT,
customer_type TEXT,
country TEXT,
product TEXT,
discount_band TEXT,
units_sold INT
)


CREATE TABLE product_data (
Product_ID TEXT PRIMARY KEY,
Product	TEXT,
Category TEXT,
Cost_Price TEXT,
Sale_Price TEXT,
Brand TEXT,
Description TEXT,
Image_url TEXT
)


CREATE TABLE product_sales AS
SELECT
	TO_DATE(date, 'DD/MM/YYYY') AS date,
	customer_type,
	country,
	product,
	discount_band,
	units_sold
FROM product_sales_raw;


DROP TABLE product_sales_raw


CREATE TABLE discount_data (
Month TEXT,
Discount_Band TEXT,
Discount INT
)