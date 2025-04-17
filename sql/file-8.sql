-- Check
-- Don't Run
CREATE TABLE employess (
    employee_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    hourly_pay DECIMAL(5, 2),
    hire_date DATE,
    CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10)
);

ALTER TABLE employees ADD CONSTRAINT chk_hourly_pay CHECK (hourly_pay >= 10);

ALTER TABLE employees
DROP CHECK chk_hourly_pay;
