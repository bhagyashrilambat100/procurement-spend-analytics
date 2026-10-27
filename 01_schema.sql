
CREATE DATABASE IF NOT EXISTS procurement_analytics;

USE procurement_analytics;

CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    supplier_city VARCHAR(50),
    supplier_category VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    product_category VARCHAR(50),
    unit_of_measure VARCHAR(20)
);

CREATE TABLE purchase_orders (
    po_id INT PRIMARY KEY,
    supplier_id INT NOT NULL,
    product_id INT NOT NULL,
    order_date DATE NOT NULL,
    quantity DECIMAL(12,2) NOT NULL,
    unit_price DECIMAL(12,2) NOT NULL,
    po_status VARCHAR(20),
    FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE deliveries (
    delivery_id INT PRIMARY KEY,
    po_id INT NOT NULL,
    expected_delivery_date DATE NOT NULL,
    actual_delivery_date DATE,
    delivery_status VARCHAR(20),
    FOREIGN KEY (po_id)
        REFERENCES purchase_orders(po_id)
);
