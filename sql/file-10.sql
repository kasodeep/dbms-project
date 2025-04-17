-- Primary Key: Can't be null and must be Unique.
CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY,
    amount DECIMAL(5, 2)
);

INSERT INTO transactions VALUES (1000, 3.99);
INSERT INTO transactions VALUES (1001, 4.99);
INSERT INTO transactions VALUES (1002, 5.99);

SELECT amount FROM transactions WHERE transaction_id = 1002;

-- How to add later
ALTER TABLE employees ADD CONSTRAINT primary_key PRIMARY KEY (employee_id);
