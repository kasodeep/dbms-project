-- SELF JOIN
-- Join another copy of a table to itself

ALTER TABLE customers ADD referral_id INT;
UPDATE customers SET referral_id = 2 WHERE customer_id = 4;

-- Crazy
SELECT a.customer_id, a.first_name, a.last_name,
CONCAT(b.first_name, " ", b.last_name) AS "referred_by"
FROM customers AS a
INNER JOIN 
customers AS b
ON a.referral_id = b.customer_id;
