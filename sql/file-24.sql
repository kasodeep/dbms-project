-- ON DELETE: 1) SET NULL: Nulls the Value.
--            2) CASCADE: Deletes The Row.

-- While Creating
CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
    ON DELETE SET NULL
);

-- Adding Later
ALTER TABLE transactions DROP FOREIGN KEY fk_customer_id;

ALTER TABLE transactions ADD CONSTRAINT fk_customer_id 
FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
ON DELETE SET NULL;

DELETE FROM customers WHERE customer_id = 4;

SELECT * FROM transactions;
SELECT * FROM customers;