ALTER TABLE product_sales
ADD CONSTRAINT fk_sales_product
FOREIGN KEY (product)
REFERENCES product_data(product_id)