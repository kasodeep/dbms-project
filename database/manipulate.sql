-- Find the average age of workers:
SELECT AVG(age) AS average_age FROM Worker;

-- List workers along with their respective machines and maintenance cost:
SELECT w.name, m.identifier AS machine_identifier, ma.cost AS maintenance_cost
FROM Worker w
LEFT JOIN Machine m ON w.id = m.worker_id
LEFT JOIN Maintenance ma ON m.id = ma.machine_id;

-- Count the number of orders placed by each customer:
SELECT c.company_name, COUNT(o.bill_no) AS order_count
FROM Customer c
LEFT JOIN Orders o ON c.id = o.customer_id
GROUP BY c.company_name;

-- Calculate the total quantity of each type of material in inventory:
SELECT identifier, SUM(quantity) AS total_quantity
FROM Material
GROUP BY identifier;

-- Find the worker who produced the highest quantity on a given date:
SELECT p.worker_id, w.name, p.production_date, MAX(p.quantity) AS max_quantity_produced
FROM Produced p
JOIN Worker w ON p.worker_id = w.id
WHERE p.production_date = '2024-04-05'
GROUP BY p.worker_id;

-- List workers who have not been assigned a machine:
SELECT w.name
FROM Worker w
LEFT JOIN Machine m ON w.id = m.worker_id
WHERE m.worker_id IS NULL;

-- Calculate the total amount spent on maintenance for each machine type:
SELECT m.identifier, SUM(ma.cost) AS total_maintenance_cost
FROM Machine m
JOIN Maintenance ma ON m.id = ma.machine_id
GROUP BY m.identifier;

-- List customers who have not placed any orders:
SELECT c.company_name
FROM Customer c
LEFT JOIN Orders o ON c.id = o.customer_id
WHERE o.bill_no IS NULL;

-- Find the customer who has made the highest payment:
SELECT c.company_name, MAX(o.amount) AS max_payment
FROM Customer c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.company_name
ORDER BY max_payment DESC
LIMIT 1;

-- Update the quantity of a material in inventory:
UPDATE Inventory
SET quantity = quantity - 10
WHERE identifier = 'COLORED';


-- Find the average cost of maintenance per machine:
SELECT m.id, AVG(ma.cost) AS avg_maintenance_cost
FROM Machine m
LEFT JOIN Maintenance ma ON m.id = ma.machine_id
GROUP BY m.id;

-- List workers along with the total quantity they have produced:
SELECT w.name, SUM(p.quantity) AS total_quantity_produced
FROM Worker w
LEFT JOIN Produced p ON w.id = p.worker_id
GROUP BY w.name;

-- Calculate the total amount spent on maintenance per worker:
SELECT w.name, SUM(ma.cost) AS total_maintenance_cost
FROM Worker w
JOIN Machine m ON w.id = m.worker_id
JOIN Maintenance ma ON m.id = ma.machine_id
GROUP BY w.name;

-- Find the machine identifier with the highest capacity:
SELECT identifier
FROM Machine
WHERE capacity = (SELECT MAX(capacity) FROM Machine);

-- List all workers and their respective addresses:
SELECT w.name, a.street, a.city, a.postal_code
FROM Worker w
JOIN Address a ON w.address_id = a.address_id;

-- Calculate the total number of machines per worker:
SELECT w.name, COUNT(m.id) AS total_machines
FROM Worker w
LEFT JOIN Machine m ON w.id = m.worker_id
GROUP BY w.name;

-- Find the order with the highest amount:
SELECT *
FROM Orders
ORDER BY amount DESC
LIMIT 1;

-- List customers along with their shipping addresses:
SELECT c.company_name, a.street AS shipping_street, a.city AS shipping_city, a.postal_code AS shipping_postal_code
FROM Customer c
JOIN Address a ON c.shipping_address_id = a.address_id;

-- Calculate the total quantity of each inventory type in orders:
SELECT inventory_type, SUM(quantity) AS total_quantity_ordered
FROM Orders
GROUP BY inventory_type;

-- List workers who have produced more than 100 units on any given date:
SELECT w.name, p.production_date, p.quantity
FROM Produced p
JOIN Worker w ON p.worker_id = w.id
WHERE p.quantity > 100;

-- Find the worker with the highest average production rate:
SELECT w.name, AVG(p.rate) AS avg_production_rate
FROM Produced p
JOIN Worker w ON p.worker_id = w.id
GROUP BY w.name
ORDER BY avg_production_rate DESC
LIMIT 1;

-- List customers who have placed orders worth more than 1000:
SELECT c.company_name
FROM Customer c
JOIN Orders o ON c.id = o.customer_id
WHERE o.amount > 1000;

-- Count the total number of orders placed in the current year:
SELECT COUNT(bill_no) AS total_orders
FROM Orders
WHERE YEAR(order_date) = YEAR(CURRENT_DATE);

-- Calculate the total amount paid by each customer:
SELECT c.company_name, SUM(o.amount) AS total_amount_paid
FROM Customer c
JOIN Orders o ON c.id = o.customer_id
GROUP BY c.company_name;

-- Find the machine with the highest total maintenance cost:
SELECT m.id, SUM(ma.cost) AS total_maintenance_cost
FROM Machine m
JOIN Maintenance ma ON m.id = ma.machine_id
GROUP BY m.id
ORDER BY total_maintenance_cost DESC
LIMIT 1;

-- List customers who have not yet made any payments:
SELECT c.company_name
FROM Customer c
LEFT JOIN Orders o ON c.id = o.customer_id
WHERE o.isPaymentDone IS NULL;

-- Find the oldest material in inventory:
SELECT identifier, MIN(purchase_date) AS oldest_purchase_date
FROM Material
GROUP BY identifier;

-- Calculate the total quantity produced by each worker for each machine type:
SELECT w.name, m.identifier, SUM(p.quantity) AS total_quantity_produced
FROM Worker w
JOIN Produced p ON w.id = p.worker_id
JOIN Machine m ON w.id = m.worker_id
GROUP BY w.name, m.identifier;

-- Find the average rate of production for each worker:
SELECT w.name, AVG(p.rate) AS avg_production_rate
FROM Worker w
JOIN Produced p ON w.id = p.worker_id
GROUP BY w.name;

-- List machines along with the total number of maintenance sessions they've undergone:
SELECT m.id, COUNT(ma.maintenance_id) AS total_maintenance_sessions
FROM Machine m
LEFT JOIN Maintenance ma ON m.id = ma.machine_id
GROUP BY m.id;

-- Update the age of a worker:
UPDATE Worker
SET age = 30
WHERE id = 1;

-- Change the address of a customer:
UPDATE Address
SET street = 'New Street', city = 'New City', postal_code = '12345'
WHERE address_id = (SELECT address_id FROM Customer WHERE id = 1);

-- Mark a maintenance session as completed:
UPDATE Maintenance
SET is_completed = TRUE
WHERE maintenance_id = 123;

-- Update the capacity of a machine:
UPDATE Machine
SET capacity = 150
WHERE id = 1;

-- Change the company name of a customer:
UPDATE Customer
SET company_name = 'New Company Name'
WHERE id = 1;

-- Update the quantity of a material in inventory:
UPDATE Inventory
SET quantity = quantity + 50
WHERE identifier = 'COLORED';

-- Mark an order as paid:
UPDATE Orders
SET isPaymentDone = TRUE
WHERE bill_no = 'ORD001';

-- Update the rate of production for a worker:
UPDATE Produced
SET rate = rate * 1.1
WHERE worker_id = 1;

-- Change the GSTIN of a customer:
UPDATE Customer
SET gstin = 'NewGST12345'
WHERE id = 1;

-- Update the quantity and rate of a material in inventory:
UPDATE Inventory
SET quantity = 100, rate = 10.5
WHERE identifier = 'NON_COLORED';