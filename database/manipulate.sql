-- Update Worker's Age:
UPDATE Worker
SET age = 40
WHERE id = 1;

-- Update Maintenance Cost:
UPDATE Maintenance
SET cost = cost * 1.1
WHERE maintenance_date < '2024-01-01';

-- Insert New Machine:
INSERT INTO Machine (identifier, capacity, worker_id)
VALUES ('EMBROIDERY', 200, 3);

-- Delete Worker:
DELETE FROM Worker
WHERE id = 5;

-- Update Customer's Shipping Address:
UPDATE Customer
SET shipping_address_id = 2
WHERE id = 1;

-- Insert New Inventory Item:
INSERT INTO Inventory (identifier, quantity, rate)
VALUES ('SILK', 100, 25.50);

-- Update Order Quantity:
UPDATE Orders
SET quantity = quantity + 10
WHERE bill_no = 'ORD123';

-- Update Production Rate:
UPDATE Produced
SET rate = rate * 1.05
WHERE production_date BETWEEN '2023-01-01' AND '2023-12-31';

-- Insert New Customer:
INSERT INTO Customer (company_name, gstin, address_id)
VALUES ('ABC Textiles', 'GST123456789', 4);

-- Delete Maintenance Record:
DELETE FROM Maintenance
WHERE maintenance_id = 10;

-- Update Material Quantity:
UPDATE Material
SET quantity = quantity - 50
WHERE identifier = 'COLORED';

-- Insert New Maintenance Record:
INSERT INTO Maintenance (maintenance_date, cost, machine_id)
VALUES ('2024-03-15', 500.00, 3);

-- Update Order Payment Status:
UPDATE Orders
SET isPaymentDone = TRUE
WHERE bill_no = 'ORD456';

-- Insert New Worker:
INSERT INTO Worker (age, name, aadharNo, gender, address_id)
VALUES (35, 'John Doe', 1234567890, 'M', 6);

-- Update Customer's Company Name:
UPDATE Customer
SET company_name = 'XYZ Fabrics'
WHERE id = 2;

-- Delete Machine:
DELETE FROM Machine
WHERE id = 5;

Update Produced Quantity:
-- UPDATE Produced
SET quantity = quantity - 20
WHERE production_date < '2023-01-01';

-- Insert New Material:
INSERT INTO Material (identifier, purchase_date, rate, quantity)
VALUES ('NON_COLORED', '2024-04-01', 30.00, 500);

-- Update Customer's GSTIN:
UPDATE Customer
SET gstin = 'GST987654321'
WHERE id = 3;

-- Delete Inventory Item:
DELETE FROM Inventory
WHERE identifier = 'COTTON';

-- Average Worker Age:
SELECT AVG(age) AS avg_age
FROM Worker;

-- Total Maintenance Cost:
SELECT SUM(cost) AS total_cost
FROM Maintenance;

-- Count of Machines by Worker Gender:
SELECT w.gender, COUNT(m.id) AS machine_count
FROM Worker w
LEFT JOIN Machine m ON w.id = m.worker_id
GROUP BY w.gender;

-- Maximum Production Rate by Machine Type:
SELECT m.identifier, MAX(p.rate) AS max_rate
FROM Machine m
LEFT JOIN Produced p ON m.id = p.machine_id
GROUP BY m.identifier;

-- Average Order Amount by Customer:
SELECT c.company_name, AVG(o.amount) AS avg_order_amount
FROM Customer c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.company_name;

-- List of Machines with Total Capacity:
SELECT m.identifier, SUM(m.capacity) AS total_capacity
FROM Machine m
GROUP BY m.identifier;

-- Number of Orders Placed by Customer:
SELECT c.company_name, COUNT(o.bill_no) AS order_count
FROM Customer c
LEFT JOIN Orders o ON c.id = o.customer_id
GROUP BY c.company_name;

-- Average Maintenance Cost by Machine Type:
SELECT m.identifier, AVG(mt.cost) AS avg_maintenance_cost
FROM Machine m
LEFT JOIN Maintenance mt ON m.id = mt.machine_id
GROUP BY m.identifier;

-- List of Customers with Total Order Amount:
SELECT c.company_name, SUM(o.amount) AS total_order_amount
FROM Customer c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.company_name;

-- Average Production Quantity by Worker Age Group:
SELECT CASE
         WHEN w.age BETWEEN 20 AND 30 THEN '20-30'
         WHEN w.age BETWEEN 31 AND 40 THEN '31-40'
         ELSE 'Above 40'
       END AS age_group,
       AVG(p.quantity) AS avg_production_quantity
FROM Worker w
LEFT JOIN Produced p ON w.id = p.worker_id
GROUP BY age_group;

-- Maximum Maintenance Cost by Worker Gender:
SELECT w.gender, MAX(mt.cost) AS max_maintenance_cost
FROM Worker w
LEFT JOIN Machine m ON w.id = m.worker_id
LEFT JOIN Maintenance mt ON m.id = mt.machine_id
GROUP BY w.gender;

-- List of Machines with Total Maintenance Cost:
SELECT m.identifier, SUM(mt.cost) AS total_maintenance_cost
FROM Machine m
LEFT JOIN Maintenance mt ON m.id = mt.machine_id
GROUP BY m.identifier;

-- Average Order Quantity by Customer's State:
SELECT a.city, AVG(o.quantity) AS avg_order_quantity
FROM Customer c
JOIN Address a ON c.address_id = a.address_id
JOIN Orders o ON c.id = o.customer_id
GROUP BY a.city;

-- Total Production Quantity by Worker's Gender:
SELECT w.gender, SUM(p.quantity) AS total_production_quantity
FROM Worker w
LEFT JOIN Produced p ON w.id = p.worker_id
GROUP BY w.gender;

-- Average Material Rate by Material Type:
SELECT m.identifier, AVG(m.rate) AS avg_material_rate
FROM Material m
GROUP BY m.identifier;

-- Top 5 Customers with the Highest Total Order Amount:
SELECT c.company_name, SUM(o.amount) AS total_order_amount
FROM Customer c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.company_name
ORDER BY total_order_amount DESC
LIMIT 5;

-- List of Machines with Maintenance Date of Last Maintenance:
SELECT m.identifier, MAX(mt.maintenance_date) AS last_maintenance_date
FROM Machine m
LEFT JOIN Maintenance mt ON m.id = mt.machine_id
GROUP BY m.identifier;

-- Number of Orders Placed per Month:
SELECT DATE_FORMAT(o.order_date, '%Y-%m') AS order_month, COUNT(o.bill_no) AS order_count
FROM Orders o
GROUP BY order_month;

-- Average Production Rate by Machine Type and Worker Gender:
SELECT m.identifier, w.gender, AVG(p.rate) AS avg_production_rate
FROM Machine m
LEFT JOIN Worker w ON m.worker_id = w.id
LEFT JOIN Produced p ON w.id = p.worker_id
GROUP BY m.identifier, w.gender;

-- List of Customers who Placed Orders but Haven't Paid Yet:
SELECT c.company_name
FROM Customer c
JOIN Orders o ON c.id = o.customer_id
WHERE o.isPaymentDone = FALSE;