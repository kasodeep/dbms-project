-- Select
SELECT first_name, last_name FROM employees;
SELECT last_name, first_name FROM employees;    

-- Where
SELECT * FROM  employees WHERE employee_id = 2;
SELECT * FROM  employees WHERE employee_id != 2;

SELECT * FROM  employees WHERE first_name = "Patrick";
SELECT * FROM  employees WHERE hourly_pay >= 15;

-- Null Not Null
SELECT * FROM  employees WHERE hire_date IS NULL;
SELECT * FROM  employees WHERE hire_date IS NOT NULL;
    