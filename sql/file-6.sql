SET SQL_SAFE_UPDATES = 0;

-- Auto Commit
SET AUTOCOMMIT = OFF;

COMMIT;
DELETE from employees;
SELECT * from employees;
ROLLBACK;
COMMIT;

-- Date Functions
CREATE TABLE test(my_date DATE, my_time TIME, my_datetime DATETIME);
INSERT INTO test VALUES(current_date() + 1, current_time(), now());
SELECT * FROM test;

-- Checks
SET AUTOCOMMIT = ON;
SET SQL_SAFE_UPDATES = 1;