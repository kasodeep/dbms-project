CREATE db texttile_firm;

CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    entity_type ENUM('WORKER', 'CUSTOMER'),    
    street VARCHAR(255),
    city VARCHAR(255),    
    postal_code VARCHAR(20)
);

CREATE TABLE Worker (
    id INT AUTO_INCREMENT PRIMARY KEY,
    age INT,
    name VARCHAR(255),
    aadharNo FLOAT,
    gender VARCHAR(1),
    address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

CREATE TABLE Machine (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier ENUM('DESIGN', 'PLAIN'),
    capacity FLOAT,
    worker_id INT,
    FOREIGN KEY (worker_id) REFERENCES Worker(id) ON DELETE SET NULL
);

CREATE TABLE Maintenance (
    maintenance_id INT AUTO_INCREMENT PRIMARY KEY,
    maintenance_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cost DECIMAL(10,2),
    machine_id INT,
    FOREIGN KEY (machine_id) REFERENCES Machine(id)
);

CREATE TABLE Produced (
    produced_id INT AUTO_INCREMENT PRIMARY KEY,
    production_date DATE,
    quantity INT,
    identifier VARCHAR(255),
    rate DECIMAL(10,2),
    worker_id INT,
    FOREIGN KEY (worker_id) REFERENCES Worker(id)
);

CREATE TABLE Inventory (
    identifier VARCHAR(255) PRIMARY KEY,
    quantity INT,
    rate DECIMAL(10,2)
);

CREATE TABLE Customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    company_name VARCHAR(255),
    gstin VARCHAR(20),
    address_id INT,
    shipping_address_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(address_id)   
);

CREATE TABLE Orders (
    bill_no VARCHAR(10) PRIMARY KEY,
    identifier VARCHAR(255),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    isPaymentDone BOOLEAN,
    customer_id INT,
    quantity INT,
    amount DECIMAL(10,2),
    inventory_type VARCHAR(255),
    FOREIGN KEY (identifier) REFERENCES Inventory(identifier),
    FOREIGN KEY (customer_id) REFERENCES Customer(id)
);

CREATE TABLE Material (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier ENUM('COLORED', 'NON_COLORED'),
    purchase_date DATE,
    rate DECIMAL(10,2),
    quantity INT
);