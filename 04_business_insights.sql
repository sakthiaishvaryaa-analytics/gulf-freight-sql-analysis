-- ============================================
-- Gulf shipment Operations: SQL Analysis
-- Business Insights

-- INSIGHT 1: Which destination port has the highest shipment volume?
SELECT
    destination_port,
    COUNT(*)          AS total_shipments,
    SUM(weight_kg)    AS total_weight_kg
FROM shipments
GROUP BY destination_port
ORDER BY total_shipments DESC;

-- INSIGHT 2: Top customers by total cargo weight shipped
SELECT
    c.company_name,
    COUNT(s.shipment_id)  AS total_shipments,
    SUM(s.weight_kg)      AS total_weight_kg
FROM shipments s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.company_name
ORDER BY total_weight_kg DESC
LIMIT 5;

-- INSIGHT 3: Which agents handle the most shipments per region?
SELECT
    a.region,
    a.agent_name,
    COUNT(s.shipment_id)  AS shipments_handled
FROM shipments s
JOIN agents a ON s.agent_id = a.agent_id
GROUP BY a.region, a.agent_name
ORDER BY a.region, shipments_handled DESC;

-- INSIGHT 4: Monthly shipment trend (2026)
SELECT
    MONTH(created_date)  AS month_number,
    MONTHNAME(created_date) AS month_name,
    COUNT(*)             AS total_shipments,
    SUM(weight_kg)       AS total_weight_kg
FROM shipments
GROUP BY MONTH(created_date), MONTHNAME(created_date)
ORDER BY month_number;

-- INSIGHT 5: Average freight rate by cargo type
SELECT
    cargo_type,
    ROUND(AVG(rate_usd), 2)  AS avg_rate_usd,
    MIN(rate_usd)             AS min_rate,
    MAX(rate_usd)             AS max_rate
FROM freight_rates
GROUP BY cargo_type
ORDER BY avg_rate_usd DESC;

-- INSIGHT 6: Shipment status breakdown by destination
SELECT
    destination_port,
    status,
    COUNT(*)  AS count
FROM shipments
GROUP BY destination_port, status
HAVING COUNT(*) >= 1
ORDER BY destination_port, status;

-- INSIGHT 7: Revenue estimate per route (weight x rate)
SELECT
    s.origin_port,
    s.destination_port,
    s.cargo_type,
    COUNT(s.shipment_id)              AS shipments,
    SUM(s.weight_kg)                  AS total_kg,
    fr.rate_usd,
    ROUND(SUM(s.weight_kg) * fr.rate_usd / 1000, 2) AS estimated_revenue_usd
FROM shipments s
LEFT JOIN freight_rates fr
       ON s.origin_port      = fr.origin
      AND s.destination_port = fr.destination
      AND s.cargo_type       = fr.cargo_type
WHERE fr.rate_usd IS NOT NULL
GROUP BY s.origin_port, s.destination_port, s.cargo_type, fr.rate_usd
ORDER BY estimated_revenue_usd DESC;
