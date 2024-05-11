-- Procedure to calculate total profit for a given month
CREATE PROCEDURE calculate_total_profit (IN month_year DATE)
BEGIN
    SELECT 
        SUM(total_income) - SUM(total_expenses) AS total_profit
    FROM Profit
    WHERE month = month_year;
END;

-- Procedure to find the average salary of workers
CREATE PROCEDURE calculate_average_salary ()
BEGIN
    SELECT AVG(amount) AS average_salary FROM Salary;
END;
