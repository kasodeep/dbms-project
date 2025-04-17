INSERT INTO transactions (amount, customer_id) VALUES (1.00, NULL);

INSERT INTO customers (first_name, last_name) VALUES ("Poppy", "Puff");

-- Inner Join
SELECT transaction_id, amount, first_name, last_name
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

-- Left Join
SELECT transaction_id, amount, first_name, last_name
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

-- Right Join
SELECT transaction_id, amount, first_name, last_name
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;
