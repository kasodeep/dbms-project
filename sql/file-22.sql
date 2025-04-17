-- GROUP BY - aggregate all rows by a specific column
-- WHERE must not be used normally

SELECT SUM(amount), order_date FROM transactions
GROUP BY order_date;

SELECT AVG(amount), order_date FROM transactions
GROUP BY order_date;

SELECT COUNT(amount), order_date FROM transactions
GROUP BY order_date;

SELECT SUM(amount), customer_id FROM transactions
GROUP BY customer_id;

SELECT MAX(amount), customer_id FROM transactions
GROUP BY customer_id;

SELECT COUNT(amount), customer_id FROM transactions
GROUP BY customer_id
HAVING COUNT(amount) > 1 AND customer_id IS NOT NULL;

