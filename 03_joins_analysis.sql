-- ============================================
-- Gulf shipment Operations: SQL Analysis
-- JOIN Queries

-- Q1: Shipments with customer company names
SELECT
    s.bl_number,
    c.company_name,
    c.country         AS customer_country,
    s.origin_port,
    s.destination_port,
    s.status
FROM shipments s
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.created_date;

-- Q2: Shipments with agent details
SELECT
    s.bl_number,
    s.origin_port,
    s.destination_port,
    a.agent_name,
    a.region          AS agent_region
FROM shipments s
JOIN agents a ON s.agent_id = a.agent_id
ORDER BY a.region;

-- Q3: Full shipment report — customers + agents combined
SELECT
    s.bl_number,
    c.company_name    AS customer,
    a.agent_name      AS agent,
    s.origin_port,
    s.destination_port,
    s.cargo_type,
    s.weight_kg,
    s.status
FROM shipments s
JOIN customers c ON s.customer_id = c.customer_id
JOIN agents    a ON s.agent_id    = a.agent_id
ORDER BY s.created_date;

-- Q4: Shipments matched with freight rates
SELECT
    s.bl_number,
    s.origin_port,
    s.destination_port,
    s.cargo_type,
    s.weight_kg,
    fr.rate_usd
FROM shipments s
LEFT JOIN freight_rates fr
       ON s.origin_port   = fr.origin
      AND s.destination_port = fr.destination
      AND s.cargo_type    = fr.cargo_type
ORDER BY fr.rate_usd DESC;

-- Q5: NVOCC customers and their shipment status
SELECT
    c.company_name,
    c.segment,
    s.bl_number,
    s.destination_port,
    s.status
FROM customers c
JOIN shipments s ON c.customer_id = s.customer_id
WHERE c.segment = 'NVOCC'
ORDER BY c.company_name;
