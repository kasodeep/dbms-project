-- INDEX
-- Indexed are used to find values within a specific column more quickly
-- MySQL searches sequentially
-- The longer the column, more expensive the operation
-- UPDATE takes more time, SELECT takes less time

SHOW INDEXES FROM customers;

CREATE INDEX last_name_idx ON customers(last_name);
SELECT * FROM customers WHERE last_name = "Rollins";

CREATE INDEX last_name_first_name_idx ON customers(last_name, first_name);
ALTER TABLE customers DROP INDEX last_name_idx;