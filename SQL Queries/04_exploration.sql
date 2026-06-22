SELECT * ,
(sale_price * units_sold) as revenue,
(cost_price * units_sold) as total_cost
FROM product_data a
JOIN product_sales b
on a.product_id = b.product


SELECT *,
(sale_price * units_sold) as revenue,
(cost_price * units_sold) as total_cost,
TO_CHAR(date,'FMMonth') as month,
TO_CHAR(date,'yyyy') as year
FROM product_data a
JOIN product_sales b
on a.product_id = b.product


SELECT 
a.product,
a.category,
a.brand,
a.description,
a.sale_price,
a.cost_price,
b.units_sold,
b.date,
b.country,
b.customer_type,
b.discount_band,
(sale_price * units_sold) as revenue,
(cost_price * units_sold) as total_cost,
TO_CHAR(date,'FMMonth') as month,
TO_CHAR(date,'yyyy') as year
FROM product_data a
JOIN product_sales b
on a.product_id = b.product


with CTE AS (
	SELECT 
	a.product,
	a.category,
	a.brand,
	a.description,
	a.sale_price,
	a.cost_price,
	b.units_sold,
	b.date,
	b.country,
	b.customer_type,
	b.discount_band,
	b.units_sold
	,
	(sale_price * units_sold) as revenue,
	(cost_price * units_sold) as total_cost,
	TO_CHAR(date,'FMMonth') as month,
	TO_CHAR(date,'yyyy') as year
	FROM product_data a
	JOIN product_sales b
	on a.product_id = b.product
)

SELECT * FROM CTE


with CTE AS (
	SELECT 
	a.product,
	a.category,
	a.brand,
	a.description,
	a.sale_price,
	a.cost_price,
	b.units_sold,
	b.date,
	b.country,
	b.customer_type,
	b.discount_band,
	b.units_sold
	,
	(sale_price * units_sold) as revenue,
	(cost_price * units_sold) as total_cost,
	TO_CHAR(date,'FMMonth') as month,
	TO_CHAR(date,'yyyy') as year
	FROM product_data a
	JOIN product_sales b
	on a.product_id = b.product
)

SELECT * FROM CTE a
JOIN discount_data b
on a.discount_band = b.discount_band AND a.month = b.month


with CTE AS (
	SELECT 
	a.product,
	a.category,
	a.brand,
	a.description,
	a.sale_price,
	a.cost_price,
	b.units_sold,
	b.date,
	b.country,
	b.customer_type,
	b.discount_band,
	b.units_sold
	,
	(sale_price * units_sold) as revenue,
	(cost_price * units_sold) as total_cost,
	TO_CHAR(date,'FMMonth') as month,
	TO_CHAR(date,'yyyy') as year
	FROM product_data a
	JOIN product_sales b
	on a.product_id = b.product
)


SELECT
*,
(1 - discount_pct*1.0/100) * revenue AS revenue_after_discount
FROM CTE a
JOIN discount_data b
on a.discount_band = b.discount_band AND a.month = b.month