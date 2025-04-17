DROP TABLE products;

-- Default
CREATE TABLE products (
	product_id INT,
    product_name VARCHAR(25),
    price DECIMAL(4, 2) DEFAULT 0,
    transaction_date DATETIME DEFAULT NOW()
);

ALTER TABLE products ALTER price SET DEFAULT 0;
INSERT INTO products (product_id, product_name, price) VALUES (1, "Pizza", 3.70);
SELECT * FROM products;
