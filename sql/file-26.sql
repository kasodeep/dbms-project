-- Trigger = When an event happens, do something.

ALTER TABLE employees
ADD COLUMN salary DECIMAL(10, 2) AFTER hourly_pay;

-- Do for all
UPDATE employees SET salary = hourly_pay * 2080 WHERE employee_id = 1;
SELECT * FROM employees;

-- Before Update
CREATE TRIGGER before_hourly_pay_update 
BEFORE UPDATE ON employees
FOR EACH ROW 
SET NEW.salary = (NEW.hourly_pay * 2080);

SHOW TRIGGERS;

SELECT * FROM employees;
UPDATE employees SET hourly_pay = 50 WHERE employee_id = 1;

-- Before Insert
CREATE TRIGGER before_hourly_pay_insert
BEFORE INSERT ON employees
FOR EACH ROW 
SET NEW.salary = (NEW.hourly_pay * 2080);

INSERT INTO employees VALUES (6, "Sheldon", "Plankton", 10, NULL, "janitor", "2023-01-04");
