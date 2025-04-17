-- VIEWS 
-- A virtual table based on the result-set of an SQL statement
-- Will be updated if new entries added in ORIGINAL TABLE

SELECT * FROM employees;
CREATE VIEW employee_attendance AS SELECT first_name, last_name FROM employees;

SELECT * FROM employee_attendance ORDER BY last_name ASC;
DROP VIEW employee_attendance