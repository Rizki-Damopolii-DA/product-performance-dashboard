CREATE OR REPLACE VIEW vw_sales AS
	WITH CTE AS (
		SELECT 
		a.product,
		a.category,
		a.brand,
		a.description,
		a.image_url,
		a.sale_price,
		a.cost_price,
		b.units_sold,
		b.date,
		b.country,
		b.customer_type,
		b.discount_band
		,
		(a.sale_price * b.units_sold) as revenue,
		(a.cost_price * b.units_sold) as total_cost,
		TO_CHAR(b.date,'FMMonth') as month,
		TO_CHAR(b.date,'yyyy') as year
		FROM product_data a
		JOIN product_sales b
		on a.product_id = b.product
	)
	
	SELECT
		a.product,
		a.category,
		a.brand,
		a.description,
		a.image_url,
		a.date,
		a.country,
		a.customer_type,
		a.sale_price,
		a.cost_price,
		a.units_sold,
		a.revenue,
		a.total_cost,
		a.year,
		a.month,
		b.discount_band,
		b.discount_pct,
		(1 - discount_pct*1.0/100) * revenue AS revenue_after_discount
	FROM CTE a
	JOIN discount_data b
		ON a.discount_band = b.discount_band 
		AND a.month = b.month