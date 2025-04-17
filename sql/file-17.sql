SELECT * FROM transactions
ORDER BY amount, customer_id;

-- LIMIT clause is used to limit the number of records
SELECT * FROM customers
ORDER BY last_name DESC LIMIT 2;

-- First is offset
SELECT * FROM customers
LIMIT 2, 1;

-- UNION combines the results of two or more SELECT statements
-- Must have same no of columns
SELECT first_name, last_name FROM employees
UNION
SELECT first_name, last_name FROM customers;