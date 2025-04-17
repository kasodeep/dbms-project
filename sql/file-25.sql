-- Stored Programs

DELIMITER $$
CREATE PROCEDURE get_customers()
BEGIN
	SELECT * FROM customers;
END $$
DELIMITER ;

CALL get_customers();
DROP PROCEDURE get_customers;

DELIMITER $$
CREATE PROCEDURE find_customer(IN id INT)
BEGIN
	SELECT * FROM customers WHERE customer_id = id;
END $$
DELIMITER ;

CALL find_customer(3);

DROP PROCEDURE find_customer;