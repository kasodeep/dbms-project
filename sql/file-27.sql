CREATE TABLE expenses(
	expense_id INT PRIMARY KEY,
    expense_name VARCHAR(50),
    expense_total DECIMAL(10, 2)
);

INSERT INTO expenses
VALUES (1, "salaries", 0), (2, "supplies", 0), (3, "taxes", 0);

-- Updating Salaries
UPDATE expenses 
SET expense_total = (SELECT SUM(salary) FROM employees)
WHERE expense_id = 1;

-- After Delete
CREATE TRIGGER after_salary_delete
AFTER DELETE ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total - OLD.salary
WHERE expense_id = 1;

SELECT * FROM expenses;
DELETE FROM employees WHERE employee_id = 6;

-- After Insert
CREATE TRIGGER after_salary_insert
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + NEW.salary
WHERE expense_id = 1;

-- After Update
CREATE TRIGGER after_salary_update
AFTER INSERT ON employees
FOR EACH ROW
UPDATE expenses
SET expense_total = expense_total + (NEW.salary - OLD.salary)
WHERE expense_id = 1;