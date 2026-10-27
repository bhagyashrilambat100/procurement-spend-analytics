
USE procurement_analytics;

-- 1. Overall procurement KPIs
SELECT
    COUNT(*) AS total_purchase_orders,
    ROUND(SUM(quantity * unit_price), 2)
        AS total_order_value,
    COUNT(DISTINCT supplier_id) AS suppliers_used
FROM purchase_orders;

-- 2. Spending by supplier
SELECT
    s.supplier_name,
    ROUND(SUM(po.quantity * po.unit_price), 2)
        AS total_spend,
    COUNT(po.po_id) AS order_count
FROM purchase_orders po
JOIN suppliers s
    ON po.supplier_id = s.supplier_id
GROUP BY s.supplier_id, s.supplier_name
ORDER BY total_spend DESC;

-- 3. Monthly procurement spending
SELECT
    DATE_FORMAT(order_date, '%Y-%m') AS order_month,
    ROUND(SUM(quantity * unit_price), 2)
        AS monthly_spend
FROM purchase_orders
GROUP BY DATE_FORMAT(order_date, '%Y-%m')
ORDER BY order_month;

-- 4. Identify late deliveries
SELECT
    po.po_id,
    s.supplier_name,
    d.expected_delivery_date,
    d.actual_delivery_date,
    DATEDIFF(
        d.actual_delivery_date,
        d.expected_delivery_date
    ) AS days_late
FROM deliveries d
JOIN purchase_orders po
    ON d.po_id = po.po_id
JOIN suppliers s
    ON po.supplier_id = s.supplier_id
WHERE d.actual_delivery_date >
      d.expected_delivery_date
ORDER BY days_late DESC;

-- 5. Supplier on-time delivery performance
SELECT
    s.supplier_name,
    COUNT(d.delivery_id) AS completed_deliveries,
    SUM(
        CASE
            WHEN d.actual_delivery_date
                 <= d.expected_delivery_date
            THEN 1 ELSE 0
        END
    ) AS on_time_deliveries,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN d.actual_delivery_date
                     <= d.expected_delivery_date
                THEN 1 ELSE 0
            END
        ) / NULLIF(COUNT(d.delivery_id), 0),
        2
    ) AS on_time_rate_pct
FROM suppliers s
JOIN purchase_orders po
    ON s.supplier_id = po.supplier_id
JOIN deliveries d
    ON po.po_id = d.po_id
WHERE d.actual_delivery_date IS NOT NULL
GROUP BY s.supplier_id, s.supplier_name
ORDER BY on_time_rate_pct DESC;

-- 6. Open purchase orders
SELECT
    po.po_id,
    s.supplier_name,
    po.order_date,
    po.quantity * po.unit_price AS order_value,
    d.expected_delivery_date,
    d.delivery_status
FROM purchase_orders po
JOIN suppliers s
    ON po.supplier_id = s.supplier_id
LEFT JOIN deliveries d
    ON po.po_id = d.po_id
WHERE po.po_status = 'Open'
ORDER BY d.expected_delivery_date;
