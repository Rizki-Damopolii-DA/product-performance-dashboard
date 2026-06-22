ALTER TABLE product_data
ALTER COLUMN cost_price
TYPE NUMERIC(10,2)
USING REPLACE(cost_price, '$', '')::NUMERIC;


ALTER TABLE product_data
ALTER COLUMN sale_price
TYPE NUMERIC(10,2)
USING REPLACE(sale_price, '$', '')::NUMERIC;


UPDATE product_sales
SET
	discount_band = LOWER(TRIM(discount_band))


ALTER TABLE discount_data
RENAME COLUMN discount TO discount_pct;