-- Unique and Not Null
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(25) UNIQUE,
    price DECIMAL(4, 2)
);

ALTER TABLE products ADD CONSTRAINT UNIQUE (product_name);

ALTER TABLE products MODIFY price DECIMAL(4, 2) NOT NULL;

SELECT
    *
FROM
    products;

INSERT INTO
    product
VALUES
    (1, "Burger", 17.04);

INSERT INTO
    products (product_id, product_name)
VALUES
    (1, "Burger");
