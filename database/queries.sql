-- Show all workers' details.
SELECT * FROM Worker;

-- Display all customers' information.
SELECT * FROM Customer;

-- List all machines with their capacities.
SELECT id, identifier, capacity FROM Machine;

-- Show all maintenance records.
SELECT * FROM Maintenance;

-- Display all produced items with their production dates.
SELECT * FROM Produced;

-- List all inventory items.
SELECT * FROM Inventory;

-- Show all orders placed.
SELECT * FROM Orders;

-- List all material purchases.
SELECT * FROM Material;

-- Show all workers who are older than 25 years.
SELECT * FROM Worker WHERE age > 25;

-- Display all customers whose company name starts with 'A'.
SELECT * FROM Customer WHERE company_name LIKE 'A%';

-- List all machines with a capacity greater than or equal to 150 meters.
SELECT * FROM Machine WHERE capacity >= 150;

-- Show all maintenance records with a cost less than 100.
SELECT * FROM Maintenance WHERE cost < 100;

-- Display all produced items with a quantity greater than 50.
SELECT * FROM Produced WHERE quantity > 50;

-- List all inventory items with a rate greater than 5.
SELECT * FROM Inventory WHERE rate > 5;

-- Show all orders where payment is not done.
SELECT * FROM Orders WHERE isPaymentDone = FALSE;

-- List all workers who are male and older than 30 years.
SELECT * FROM Worker WHERE gender = 'M' AND age > 30;

-- Display all customers whose company name starts with 'A' or 'B'.
SELECT * FROM Customer WHERE company_name LIKE 'A%' OR company_name LIKE 'B%';

-- Show all machines with a capacity greater than 200 or assigned to worker ID 2.
SELECT * FROM Machine WHERE capacity > 200 OR worker_id = 2;

-- Display all maintenance records with a cost less than 50 or done for machine ID 1.
SELECT * FROM Maintenance WHERE cost < 50 OR machine_id = 1;

-- List all produced items with a quantity greater than 100 and produced by worker ID 1.
SELECT * FROM Produced WHERE quantity > 100 AND worker_id = 1;

-- Show all inventory items with a rate greater than 10 and a quantity less than 200.
SELECT * FROM Inventory WHERE rate > 10 AND quantity < 200;

-- Display all orders where payment is not done and the amount is greater than 1000.
SELECT * FROM Orders WHERE isPaymentDone = FALSE AND amount > 1000;

-- List all workers who are older than 25 years or have an Aadhar number.
SELECT * FROM Worker WHERE age > 25 OR aadharNo IS NOT NULL;

-- Show the total number of workers.
SELECT COUNT(*) AS total_workers FROM Worker;

-- Show the total number of customers.
SELECT COUNT(*) AS total_customers FROM Customer;

-- Show the total number of machines.
SELECT COUNT(*) AS total_machines FROM Machine;

-- Show the total number of maintenance records.
SELECT COUNT(*) AS total_maintenance FROM Maintenance;

-- Show the total number of produced items.
SELECT COUNT(*) AS total_produced FROM Produced;

-- Show the total number of inventory items.
SELECT COUNT(*) AS total_inventory FROM Inventory;

-- Show the total number of orders.
SELECT COUNT(*) AS total_orders FROM Orders;

-- Show the total number of material purchases.
SELECT COUNT(*) AS total_material FROM Material;

-- Display the average age of workers.
SELECT AVG(age) AS average_age FROM Worker;

-- Display the total cost of maintenance.
SELECT SUM(cost) AS total_maintenance_cost FROM Maintenance;

-- Show the total quantity of produced items.
SELECT SUM(quantity) AS total_produced_quantity FROM Produced;

-- Show the total quantity of inventory items.
SELECT SUM(quantity) AS total_inventory_quantity FROM Inventory;

-- Show the total amount of orders.
SELECT SUM(amount) AS total_orders_amount FROM Orders;

-- Show the total quantity of material purchases.
SELECT SUM(quantity) AS total_material_quantity FROM Material;

-- Display the workers along with their addresses.
SELECT Worker.*, Address.street, Address.city, Address.postal_code
FROM Worker
INNER JOIN Address ON Worker.address_id = Address.address_id;

-- Display the customers along with their addresses.
SELECT Customer.*, Address.street, Address.city, Address.postal_code
FROM Customer
INNER JOIN Address ON Customer.address_id = Address.address_id;

-- Show the machines along with the workers assigned to them.
SELECT Machine.*, Worker.name AS worker_name
FROM Machine
LEFT JOIN Worker ON Machine.worker_id = Worker.id;

-- Show the orders along with the customer details.
SELECT Orders.*, Customer.company_name, Customer.gstin
FROM Orders
INNER JOIN Customer ON Orders.customer_id = Customer.id;

-- Show the produced items along with the worker details.
SELECT Produced.*, Worker.name AS worker_name
FROM Produced
INNER JOIN Worker ON Produced.worker_id = Worker.id;

-- Show the maintenance records along with the machine details.
SELECT Maintenance.*, Machine.identifier
FROM Maintenance
INNER JOIN Machine ON Maintenance.machine_id = Machine.id;

-- Show the material purchases along with their types.
SELECT Material.*, CASE WHEN identifier = 'COLORED' THEN 'Colored' ELSE 'Non-Colored' END AS type
FROM Material;

-- Display the orders along with the inventory items.
SELECT Orders.*, Inventory.*
FROM Orders
INNER JOIN Inventory ON Orders.identifier = Inventory.identifier;

-- Show the total quantity produced by each worker.
SELECT Worker.id, Worker.name, SUM(Produced.quantity) AS total_quantity_produced
FROM Worker
LEFT JOIN Produced ON Worker.id = Produced.worker_id
GROUP BY Worker.id, Worker.name;

-- Show the total cost of maintenance for each machine type.
SELECT Machine.identifier, SUM(Maintenance.cost) AS total_maintenance_cost
FROM Machine
LEFT JOIN Maintenance ON Machine.id = Maintenance.machine_id
GROUP BY Machine.identifier;

-- Show the total quantity of inventory items for each type.
SELECT identifier, SUM(quantity) AS total_quantity
FROM Inventory
GROUP BY identifier;

-- Show the total amount of orders for each customer.
SELECT Customer.id, Customer.company_name, SUM(Orders.amount) AS total_order_amount
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id
GROUP BY Customer.id, Customer.company_name;

-- Show the total quantity produced for each type of identifier.
SELECT identifier, SUM(quantity) AS total_quantity_produced
FROM Produced
GROUP BY identifier;

-- Show the average age of workers grouped by gender.
SELECT gender, AVG(age) AS average_age
FROM Worker
GROUP BY gender;

-- Show the total quantity of material purchases for each type of identifier.
SELECT identifier, SUM(quantity) AS total_quantity
FROM Material
GROUP BY identifier;

-- Show the average rate of material purchases for each type of identifier.
SELECT identifier, AVG(rate) AS average_rate
FROM Material
GROUP BY identifier;

-- Show the total number of orders placed by each customer.
SELECT customer_id, COUNT(*) AS total_orders
FROM Orders
GROUP BY customer_id;

-- Show the total quantity of inventory items produced by each worker.
SELECT Worker.id, Worker.name, SUM(Produced.quantity) AS total_quantity_produced
FROM Worker
LEFT JOIN Produced ON Worker.id = Produced.worker_id
GROUP BY Worker.id, Worker.name;

-- Show the total amount of orders placed for each type of identifier.
SELECT identifier, SUM(amount) AS total_amount
FROM Orders
GROUP BY identifier;

-- Show the total quantity of material purchases for each month.
SELECT MONTH(purchase_date) AS month, SUM(quantity) AS total_quantity
FROM Material
GROUP BY MONTH(purchase_date);

-- Show the total amount of orders placed for each month.
SELECT MONTH(order_date) AS month, SUM(amount) AS total_amount
FROM Orders
GROUP BY MONTH(order_date);

-- Show the average rate of maintenance for each machine type.
SELECT Machine.identifier, AVG(Maintenance.cost) AS average_maintenance_cost
FROM Machine
LEFT JOIN Maintenance ON Machine.id = Maintenance.machine_id
GROUP BY Machine.identifier;

-- Show the total quantity of produced items for each worker and machine type.
SELECT Worker.id, Worker.name, Machine.identifier, SUM(Produced.quantity) AS total_quantity_produced
FROM Worker
LEFT JOIN Produced ON Worker.id = Produced.worker_id
LEFT JOIN Machine ON Produced.machine_id = Machine.id
GROUP BY Worker.id, Worker.name, Machine.identifier;

-- Show the total amount of orders placed for each customer and machine type.
SELECT Customer.id, Customer.company_name, Machine.identifier, SUM(Orders.amount) AS total_amount
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id
LEFT JOIN Inventory ON Orders.identifier = Inventory.identifier
GROUP BY Customer.id, Customer.company_name, Machine.identifier;

-- Show the total quantity of produced items for each customer and worker.
SELECT Customer.id, Customer.company_name, Worker.name, SUM(Produced.quantity) AS total_quantity_produced
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id
LEFT JOIN Produced ON Orders.identifier = Produced.identifier
LEFT JOIN Worker ON Produced.worker_id = Worker.id
GROUP BY Customer.id, Customer.company_name, Worker.name;

-- Show the total quantity of inventory items for each worker and machine type.
SELECT Worker.id, Worker.name, Machine.identifier, SUM(Inventory.quantity) AS total_quantity
FROM Worker
LEFT JOIN Machine ON Worker.id = Machine.worker_id
LEFT JOIN Inventory ON Machine.identifier = Inventory.identifier
GROUP BY Worker.id, Worker.name, Machine.identifier;

-- Show the average rate of orders placed for each customer and machine type.
SELECT Customer.id, Customer.company_name, Machine.identifier, AVG(Orders.amount) AS average_amount
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id
LEFT JOIN Inventory ON Orders.identifier = Inventory.identifier
GROUP BY Customer.id, Customer.company_name, Machine.identifier;

-- Show the total quantity of produced items for each customer and machine type.
SELECT Customer.id, Customer.company_name, Machine.identifier, SUM(Produced.quantity) AS total_quantity_produced
FROM Customer
LEFT JOIN Orders ON Customer.id = Orders.customer_id
LEFT JOIN Produced ON Orders.identifier = Produced.identifier
LEFT JOIN Machine ON Produced.machine_id = Machine.id
GROUP BY Customer.id, Customer.company_name, Machine.identifier;