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

--Show the Address Details by Entity Type and Entity ID.
SELECT * FROM Address WHERE entity_type = ? AND entity_id = ?;

--Show the Machines Assigned to Workers Older Than a Specified Age.
SELECT * FROM Machine WHERE worker_id IN (SELECT id FROM Worker WHERE age > ?);

--Show the Maintenance Records for Machines with Capacities Greater Than a Given Value.
SELECT * FROM Maintenance WHERE machine_id IN (SELECT id FROM Machine WHERE capacity > ?);

--Show the Produced Items by Worker ID and Production Date Range.
SELECT * FROM Produced WHERE worker_id = ? AND production_date BETWEEN ? AND ?;

--Show the Orders Placed by Customers with Company Names Starting with a Specific Letter.
SELECT * FROM Orders WHERE customer_id IN (SELECT id FROM Customer WHERE company_name LIKE ?);

--Show the Material Purchases by Purchase Date and Quantity Range.
SELECT * FROM Material WHERE purchase_date BETWEEN ? AND ? AND quantity BETWEEN ? AND ?;

--Show the Maintenance Records for Machines with Capacities in a Specified Range.
SELECT * FROM Maintenance WHERE machine_id IN (SELECT id FROM Machine WHERE capacity BETWEEN ? AND ?);

--Show the Produced Items by Production Date and Quantity Range.
SELECT * FROM Produced WHERE production_date = ? AND quantity BETWEEN ? AND ?;

--Show the Orders with Payment Status and Amount Range.
SELECT * FROM Orders WHERE isPaymentDone = ? AND amount BETWEEN ? AND ?;

--Show the Material Purchases by Purchase Date and Rate Range.
SELECT * FROM Material WHERE purchase_date BETWEEN ? AND ? AND rate BETWEEN ? AND ?;

--Show the Workers by Age and Gender.
SELECT * FROM Worker WHERE age > ? AND gender = ?;

--Show the Customers by City and Postal Code.
SELECT * FROM Customer WHERE address_id IN (SELECT address_id FROM Address WHERE city = ? AND postal_code = ?);

--Show the Maintenance Records for Machines with Capacities Greater Than a Given Value and Maintenance Cost in a Specified Range.
SELECT * FROM Maintenance WHERE machine_id IN (SELECT id FROM Machine WHERE capacity > ?) AND cost BETWEEN ? AND ?;

--Show the Material Purchases by Identifier and Purchase Date Range.
SELECT * FROM Material WHERE identifier = ? AND purchase_date BETWEEN ? AND ?;

--Show the Produced Items by Worker ID and Quantity Range.
SELECT * FROM Produced WHERE worker_id = ? AND quantity BETWEEN ? AND ?;

--Show the Machines with Capacities Greater Than or Equal to a Given Value and Assigned to Workers Younger Than a Specified Age.
SELECT * FROM Machine WHERE capacity >= ? AND worker_id IN (SELECT id FROM Worker WHERE age < ?);

--Show the Maintenance Records for Machines with Capacities Less Than a Given Value and Maintenance Cost in a Specified Range.
SELECT * FROM Maintenance WHERE machine_id IN (SELECT id FROM Machine WHERE capacity < ?) AND cost BETWEEN ? AND ?;

--Show the Produced Items by Production Date Range and Quantity.
SELECT * FROM Produced WHERE production_date BETWEEN ? AND ? AND quantity = ?;

--Show the Orders Placed by Customers with a Specific GSTIN.
SELECT * FROM Orders WHERE customer_id IN (SELECT id FROM Customer WHERE gstin = ?);

--Show the Material Purchases by Identifier and Quantity Range.
SELECT * FROM Material WHERE identifier = ? AND quantity BETWEEN ? AND ?;

--Show the Workers by Age Range and Address City.
SELECT * FROM Worker WHERE age BETWEEN ? AND ? AND address_id IN (SELECT address_id FROM Address WHERE city = ?);

--Show the Customers by Company Name and Shipping Address City.
SELECT * FROM Customer WHERE company_name = ? AND shipping_address_id IN (SELECT address_id FROM Address WHERE city = ?);

--Show the Orders with Payment Status and Amount Greater Than a Specified Value.
SELECT * FROM Orders WHERE isPaymentDone = ? AND amount > ?;

--Show the Material Purchases by Purchase Date and Identifier.
SELECT * FROM Material WHERE purchase_date = ? AND identifier = ?;

--Show the Workers by Gender and Postal Code.
SELECT * FROM Worker WHERE gender = ? AND address_id IN (SELECT address_id FROM Address WHERE postal_code = ?);

--Show the Customers by City and Entity Type.
SELECT * FROM Customer WHERE address_id IN (SELECT address_id FROM Address WHERE city = ?) AND entity_type = ?;

--Show the Maintenance Records for Machines with Capacities in a Range and Maintenance Date Range.
SELECT * FROM Maintenance WHERE machine_id IN (SELECT id FROM Machine WHERE capacity BETWEEN ? AND ?) AND maintenance_date BETWEEN ? AND ?;

--Show the Produced Items by Production Date Range and Worker ID.
SELECT * FROM Produced WHERE production_date BETWEEN ? AND ? AND worker_id = ?;

--Show the Orders by Customer and Order Date Range.
SELECT * FROM Orders WHERE customer_id = ? AND order_date BETWEEN ? AND ?;

--Show the Workers by Gender and Entity Type.
SELECT * FROM Worker WHERE gender = ? AND entity_type = ?;

--Show the Maintenance Records for Machines with Capacities in a Range and Maintenance Cost in a Range.
SELECT * FROM Maintenance WHERE machine_id IN (SELECT id FROM Machine WHERE capacity BETWEEN ? AND ?) AND cost BETWEEN ? AND ?;

--Show the Produced Items by Production Date and Identifier.
SELECT * FROM Produced WHERE production_date = ? AND identifier = ?;

--Show the Orders by Amount Range and Inventory Type.
SELECT * FROM Orders WHERE amount BETWEEN ? AND ? AND inventory_type = ?;

--Show the Maintenance Records for Machines with Capacities Less Than or Equal to a Given Value and Maintenance Cost Greater Than a Specified Amount.
SELECT * FROM Maintenance WHERE machine_id IN (SELECT id FROM Machine WHERE capacity <= ?) AND cost > ?;

--Show the Produced Items by Production Date Range and Identifier.
SELECT * FROM Produced WHERE production_date BETWEEN ? AND ? AND identifier = ?;
