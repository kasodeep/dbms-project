CREATE FUNCTION calculate_average(column_name VARCHAR(255), table_name VARCHAR(255))
RETURNS DECIMAL(10, 2)
BEGIN
    DECLARE avg_value DECIMAL(10, 2);
    SELECT AVG(column_name) INTO avg_value FROM table_name;
    RETURN avg_value;
END;

SELECT calculate_average('total_income', 'Profit') AS average_income;

