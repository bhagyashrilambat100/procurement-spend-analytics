
USE procurement_analytics;

-- 1. Check for duplicate purchase order IDs
SELECT
    po_id,
    COUNT(*) AS record_count
FROM purchase_orders
GROUP BY po_id
HAVING COUNT(*) > 1;

-- 2. Check for missing required purchase order values
SELECT *
FROM purchase_orders
WHERE po_id IS NULL
   OR supplier_id IS NULL
   OR product_id IS NULL
   OR order_date IS NULL
   OR quantity IS NULL
   OR unit_price IS NULL;

-- 3. Check for invalid quantities or prices
SELECT *
FROM purchase_orders
WHERE quantity <= 0
   OR unit_price < 0;

-- 4. Check for purchase orders with missing supplier records
SELECT po.*
FROM purchase_orders po
LEFT JOIN suppliers s
    ON po.supplier_id = s.supplier_id
WHERE s.supplier_id IS NULL;

-- 5. Check for purchase orders with missing product records
SELECT po.*
FROM purchase_orders po
LEFT JOIN products p
    ON po.product_id = p.product_id
WHERE p.product_id IS NULL;

-- 6. Check for invalid delivery dates
SELECT *
FROM deliveries
WHERE actual_delivery_date IS NOT NULL
  AND actual_delivery_date < '2000-01-01';

-- 7. Check delivery status and date consistency
SELECT *
FROM deliveries
WHERE delivery_status = 'Delivered'
  AND actual_delivery_date IS NULL;

-- 8. Check for delivery records without a purchase order
SELECT d.*
FROM deliveries d
LEFT JOIN purchase_orders po
    ON d.po_id = po.po_id
WHERE po.po_id IS NULL;

-- 9. Reconcile purchase order record count and total value
SELECT
    COUNT(*) AS total_po_records,
    ROUND(SUM(quantity * unit_price), 2)
        AS total_po_value
FROM purchase_orders;

-- 10. Check the number of records in each main table
SELECT 'suppliers' AS table_name,
       COUNT(*) AS record_count
FROM suppliers
UNION ALL
SELECT 'products',
       COUNT(*)
FROM products
UNION ALL
SELECT 'purchase_orders',
       COUNT(*)
FROM purchase_orders
UNION ALL
SELECT 'deliveries',
       COUNT(*)
FROM deliveries;
