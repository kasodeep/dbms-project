DELIMITER //

CREATE TRIGGER calculate_order_amount_and_update_inventory BEFORE INSERT ON Orders
FOR EACH ROW
BEGIN
    DECLARE item_rate DECIMAL(10, 2);
    SELECT rate INTO item_rate FROM Inventory WHERE identifier = NEW.identifier LIMIT 1;
    SET NEW.amount = NEW.quantity * item_rate;
    
    -- Decrease the quantity of inventory
    UPDATE Inventory 
    SET quantity = quantity - NEW.quantity 
    WHERE identifier = NEW.identifier;
END;
//
DELIMITER ;

-- Create trigger to update Inventory based on Produced table
DELIMITER //

CREATE TRIGGER update_inventory_after_production_insert AFTER INSERT ON Produced
FOR EACH ROW
BEGIN
    -- Update existing identifiers
    INSERT INTO Inventory (identifier, quantity, rate)
    SELECT 
        NEW.identifier,
        SUM(NEW.quantity) AS total_quantity,
        MAX(NEW.rate) * 3.0 AS rate
    FROM Produced
    WHERE identifier = NEW.identifier
    GROUP BY identifier
    ON DUPLICATE KEY UPDATE
        quantity = quantity + NEW.quantity;

    -- Insert new identifier
    IF NOT EXISTS (SELECT 1 FROM Inventory WHERE identifier = NEW.identifier) THEN        
        INSERT INTO Inventory (identifier, quantity, rate) VALUES (NEW.identifier, NEW.quantity, NEW.rate * 1.4);
    END IF;
END;
//
DELIMITER ;

DELIMITER //

-- Create trigger to update Salary table after insert on Produced
CREATE TRIGGER update_salary_after_production_insert AFTER INSERT ON Produced
FOR EACH ROW
BEGIN
    DECLARE month_year DATE;
    SET month_year = DATE_FORMAT(NEW.production_date, '%Y-%m-01');

    INSERT INTO Salary (month, worker_id, amount)
    VALUES (month_year, NEW.worker_id, NEW.quantity * NEW.rate)
    ON DUPLICATE KEY UPDATE
    amount = amount + NEW.quantity * NEW.rate;
END;
//

DELIMITER ;

-- Not Important, but usefull triggers.
DELIMITER //

-- Create trigger to update Profit table after insert on Produced (for salary expenses)
CREATE TRIGGER update_profit_after_salary_insert AFTER INSERT ON Produced
FOR EACH ROW
BEGIN
    DECLARE month_year DATE;
    SET month_year = DATE_FORMAT(NEW.production_date, '%Y-%m-01');

    INSERT INTO Profit (month, total_salary_expenses)
    VALUES (month_year, NEW.quantity * NEW.rate)
    ON DUPLICATE KEY UPDATE
    total_salary_expenses = total_salary_expenses + NEW.quantity * NEW.rate;
END;
//

-- Modify the trigger to update Profit table after insert on Maintenance (for total expenses)
CREATE TRIGGER update_profit_after_maintenance_insert AFTER INSERT ON Maintenance
FOR EACH ROW
BEGIN
    DECLARE month_year DATE;
    SET month_year = DATE_FORMAT(NEW.maintenance_date, '%Y-%m-01');

    INSERT INTO Profit (month, total_expenses)
    VALUES (month_year, NEW.cost)
    ON DUPLICATE KEY UPDATE
    total_expenses = total_expenses + NEW.cost;
END;
//

-- Modify the trigger to update Profit table after insert on Material (for total expenses)
CREATE TRIGGER update_profit_after_material_insert AFTER INSERT ON Material
FOR EACH ROW
BEGIN
    DECLARE month_year DATE;
    SET month_year = DATE_FORMAT(NEW.purchase_date, '%Y-%m-01');

    INSERT INTO Profit (month, total_expenses)
    VALUES (month_year, NEW.rate * NEW.quantity)
    ON DUPLICATE KEY UPDATE
    total_expenses = total_expenses + NEW.rate * NEW.quantity;
END;
//

-- Modify the trigger to update Profit table after insert on Orders (for total income)
CREATE TRIGGER update_profit_after_orders_insert AFTER INSERT ON Orders
FOR EACH ROW
BEGIN
    DECLARE month_year DATE;
    SET month_year = DATE_FORMAT(NEW.order_date, '%Y-%m-01');

    INSERT INTO Profit (month, total_income)
    VALUES (month_year, NEW.amount)
    ON DUPLICATE KEY UPDATE
    total_income = total_income + NEW.amount;
END;
//

DELIMITER ;

