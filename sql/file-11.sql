-- Auto Increment
DROP TABLE transactions;
CREATE TABLE transactions (
	transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    amount DECIMAL(5, 2)
);

INSERT INTO transactions (amount) VALUES (3.99);
INSERT INTO transactions (amount) VALUES (4.99);
INSERT INTO transactions (amount) VALUES (5.99);

SELECT * FROM transactions;

-- Change starting value
ALTER TABLE transactions AUTO_INCREMENT = 1000;

INSERT INTO transactions (amount) VALUES (3.99);
INSERT INTO transactions (amount) VALUES (4.99);
INSERT INTO transactions (amount) VALUES (5.99);
