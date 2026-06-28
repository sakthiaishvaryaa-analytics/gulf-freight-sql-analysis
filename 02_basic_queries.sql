
-- Gulf shipment Operations: SQL Analysis
-- File 2: Basic Queries

-- Q1: View all shipments
SELECT * FROM shipments;

-- Q2: All completed shipments only
SELECT shipment_id, bl_number, origin_port, destination_port, status
FROM shipments
WHERE status = 'Completed';

-- Q3: Shipments going to Dubai
SELECT bl_number, customer_id, cargo_type, weight_kg
FROM shipments
WHERE destination_port = 'Dubai';

-- Q4: Shipments heavier than 6000 kg
SELECT bl_number, cargo_type, weight_kg, destination_port
FROM shipments
WHERE weight_kg > 6000
ORDER BY weight_kg DESC;

-- Q5: Shipments in the first quarter (Jan–Mar 2026)
SELECT bl_number, origin_port, destination_port, created_date
FROM shipments
WHERE created_date BETWEEN '2026-01-01' AND '2026-03-31'
ORDER BY created_date;

-- Q6: Unique cargo types handled
SELECT DISTINCT cargo_type
FROM shipments
ORDER BY cargo_type;

-- Q7: Freight rates above $800 USD
SELECT origin, destination, cargo_type, rate_usd
FROM freight_rates
WHERE rate_usd > 800
ORDER BY rate_usd DESC;
