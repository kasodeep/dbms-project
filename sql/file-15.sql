ALTER TABLE employees ADD COLUMN job VARCHAR(25) AFTER hourly_pay;

UPDATE employees SET job = "manager" WHERE employee_id = 1;
UPDATE employees SET job = "cashier" WHERE employee_id = 2;
UPDATE employees SET job = "cook" WHERE employee_id = 3;
UPDATE employees SET job = "asst. manager" WHERE employee_id = 4;
UPDATE employees SET job = "janitor" WHERE employee_id = 5;

SELECT * FROM employees
WHERE hire_date < "2023-01-05" AND job = "cook";

SELECT * FROM employees
WHERE job = "cashier" OR job = "cook";

SELECT * FROM employees
WHERE NOT job = "manager" AND NOT job = "asst. manager";

SELECT * FROM employees
WHERE hire_date BETWEEN "2023-01-04" AND "2023-01-07" ORDER BY hire_date DESC;

SELECT * FROM employees
WHERE job IN ("cook", "cashier", "janitor");
