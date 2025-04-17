SET SQL_SAFE_UPDATES = 0;

-- Update
UPDATE employees SET employee_id = 6 WHERE first_name = "John";
SELECT * FROM employees;
UPDATE employees SET hourly_pay = 10.25, hire_date = "2023-07-15" WHERE employee_id = 5;
SELECT * FROM employees;

-- Delete
DELETE FROM employees WHERE employee_id = 6;