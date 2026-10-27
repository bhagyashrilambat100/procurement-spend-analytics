USE procurement_analytics;

-- 1. Insert supplier records
INSERT INTO suppliers
(supplier_id, supplier_name, supplier_city,
 supplier_category, is_active)
VALUES
(101, 'Aster Industrial Supplies', 'Pune', 'Industrial', TRUE),
(102, 'BluePeak Components', 'Mumbai', 'Electronics', TRUE),
(103, 'Cedar Office Products', 'Nagpur', 'Office Supplies', TRUE),
(104, 'Delta Packaging Works', 'Nashik', 'Packaging', TRUE),
(105, 'Evergreen Safety Systems', 'Pune', 'Safety', TRUE);

-- 2. Insert product records
INSERT INTO products
(product_id, product_name, product_category, unit_of_measure)
VALUES
(201, 'Safety Gloves', 'Safety', 'Pair'),
(202, 'Steel Fasteners', 'Industrial', 'Box'),
(203, 'Packing Cartons', 'Packaging', 'Pack'),
(204, 'Network Switch', 'Electronics', 'Unit'),
(205, 'Printer Paper', 'Office Supplies', 'Ream');

-- 3. Insert purchase orders
INSERT INTO purchase_orders
(po_id, supplier_id, product_id, order_date,
 quantity, unit_price, po_status)
VALUES
(5001, 101, 202, '2026-01-05', 40, 125.00, 'Closed'),
(5002, 102, 204, '2026-01-12', 8, 4200.00, 'Closed'),
(5003, 103, 205, '2026-01-18', 60, 280.00, 'Closed'),
(5004, 104, 203, '2026-02-02', 100, 45.00, 'Closed'),
(5005, 105, 201, '2026-02-10', 75, 90.00, 'Closed'),
(5006, 101, 201, '2026-02-17', 25, 650.00, 'Closed'),
(5007, 102, 202, '2026-03-04', 55, 118.00, 'Closed'),
(5008, 103, 204, '2026-03-11', 5, 4150.00, 'Closed'),
(5009, 104, 203, '2026-03-19', 120, 43.00, 'Open'),
(5010, 105, 205, '2026-04-01', 45, 285.00, 'Closed');

-- 4. Insert delivery records
INSERT INTO deliveries
(delivery_id, po_id, expected_delivery_date,
 actual_delivery_date, delivery_status)
VALUES
(7001, 5001, '2026-01-15', '2026-01-14', 'Delivered'),
(7002, 5002, '2026-01-25', '2026-01-28', 'Delivered'),
(7003, 5003, '2026-01-29', '2026-01-29', 'Delivered'),
(7004, 5004, '2026-02-12', '2026-02-16', 'Delivered'),
(7005, 5005, '2026-02-20', '2026-02-19', 'Delivered'),
(7006, 5006, '2026-02-27', '2026-03-02', 'Delivered'),
(7007, 5007, '2026-03-18', '2026-03-17', 'Delivered'),
(7008, 5008, '2026-03-25', '2026-03-29', 'Delivered'),
(7009, 5009, '2026-04-02', NULL, 'Pending'),
(7010, 5010, '2026-04-14', '2026-04-13', 'Delivered');
