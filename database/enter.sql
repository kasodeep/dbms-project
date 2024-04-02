-- Adding entries to Address table
INSERT INTO Address (entity_type, entity_id, street, city, postal_code) 
VALUES 
    ('WORKER', 1, '123 Main St', 'Cityville', '12345'),
    ('CUSTOMER', 1, '456 Elm St', 'Townsville', '54321');

-- Adding entries to Worker table
INSERT INTO Worker (age, name, aadharNo, gender, address_id) 
VALUES 
    (30, 'John Doe', 123456789012, 'M', 1),
    (25, 'Jane Smith', 987654321098, 'F', 1);

-- Adding entries to Machine table
INSERT INTO Machine (identifier, capacity, worker_id) 
VALUES 
    ('DESIGN', 100.0, 1),
    ('PLAIN', 200.0, 2);

-- Adding entries to Maintenance table
INSERT INTO Maintenance (cost, machine_id) 
VALUES 
    (50.00, 1),
    (75.00, 2);

-- Adding entries to Produced table
INSERT INTO Produced (production_date, quantity, identifier, rate, worker_id) 
VALUES 
    ('2024-04-01', 100, 'Design1', 10.00, 1),
    ('2024-04-02', 150, 'Plain1', 8.00, 2);

-- Adding entries to Inventory table
INSERT INTO Inventory (identifier, quantity, rate) 
VALUES 
    ('Design1', 100, 10.00),
    ('Plain1', 150, 8.00);

-- Adding entries to Customer table
INSERT INTO Customer (company_name, gstin, address_id) 
VALUES 
    ('ABC Company', 'GSTIN123', 2),
    ('XYZ Inc.', 'GSTIN456', 2);

-- Adding entries to Orders table
INSERT INTO Orders (bill_no, identifier, isPaymentDone, customer_id, amount, inventory_type) 
VALUES 
    ('1001', 'Design1', true, 1, 1000.00, 'Design'),
    ('1002', 'Plain1', false, 2, 1200.00, 'Plain');

-- Adding entries to Material table
INSERT INTO Material (identifier, purchase_date, rate, quantity) 
VALUES 
    ('COLORED', '2024-04-01', 15.00, 200),
    ('NON_COLORED', '2024-04-02', 12.00, 300);
