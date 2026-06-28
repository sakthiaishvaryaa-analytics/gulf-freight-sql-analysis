
-- Gulf shipment Operations: SQL Analysis
--  Create Tables & Insert Sample Data


-- Table 1: Customers

CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    company_name    VARCHAR(100),
    country         VARCHAR(50),
    segment         VARCHAR(50)  -- NVOCC or Freight Forwarder
);

INSERT INTO customers VALUES
(1, 'Abc logistics',    'UAE',   'NVOCC'),
(2, 'Gulf  Freight',     'Kuwait','Freight Forwarder'),
(3, 'Oman Shippers',       'Oman',  'NVOCC'),
(4, 'Bahrain  Exports',    'Bahrain','Freight Forwarder'),
(5, 'Qatar Supply Chain Co',   'Qatar', 'NVOCC'),
(6, 'Dammam LINES',        'Saudi Arabia','NVOCC'),
(7, 'KHOR AL FAKKAN  Express Freight',   'UAE',   'Freight Forwarder'),
(8, ' FUJAIRAH Traders',   'UAE',  'NVOCC');

-- Table 2: Agents

CREATE TABLE agents (
    agent_id    INT PRIMARY KEY,
    agent_name  VARCHAR(100),
    country     VARCHAR(50),
    region      VARCHAR(50)
);

INSERT INTO agents VALUES
(1, 'DUBAI AGENT',      'UAE',   'Gulf'),
(2, 'Chennai SHIPMENTS', 'India', 'Asia'),
(3, 'Oman Freight Partners', 'Oman',  'Gulf'),
(4, 'Kuwait  Agency',  'Kuwait','Gulf'),
(5, 'Bahrain  Agent',  'Bahrain','Gulf');

-- Table 3: Shipments

CREATE TABLE shipments (
    shipment_id      INT PRIMARY KEY,
    bl_number        VARCHAR(20),
    customer_id      INT,
    agent_id         INT,
    origin_port      VARCHAR(50),
    destination_port VARCHAR(50),
    cargo_type       VARCHAR(50),
    weight_kg        DECIMAL(10,2),
    status           VARCHAR(20),
    created_date     DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (agent_id)    REFERENCES agents(agent_id)
);

INSERT INTO shipments VALUES
(1,  'BL-2024-001', 1, 1, 'Chennai',  'Dubai',    'Electronics',   5200.00, 'Completed', '2026-01-10'),
(2,  'BL-2024-002', 2, 2, 'Dubai',    'Chennai',  'Textiles',      3800.00, 'Completed', '2026-01-18'),
(3,  'BL-2024-003', 3, 3, 'Chennai',  'Muscat',   'Machinery',     7500.00, 'In Transit','2026-02-05'),
(4,  'BL-2024-004', 4, 4, 'Chennai',  'Kuwait',   'Chemicals',     4200.00, 'Completed', '2026-02-14'),
(5,  'BL-2024-005', 5, 1, 'Chennai',  'Doha',     'Electronics',   6100.00, 'Pending',   '2026-03-02'),
(6,  'BL-2024-006', 6, 5, 'Chennai',  'Jeddah',   'Auto Parts',    8900.00, 'Completed', '2026-03-20'),
(7,  'BL-2024-007', 7, 1, 'Dubai',    'Chennai',  'Textiles',      3100.00, 'In Transit','2026-04-08'),
(8,  'BL-2024-008', 8, 3, 'Chennai',  'Muscat',   'Machinery',     6700.00, 'Completed', '2026-04-22'),
(9,  'BL-2024-009', 1, 2, 'Chennai',  'Dubai',    'Chemicals',     4900.00, 'Pending',   '2026-05-10'),
(10, 'BL-2024-010', 3, 4, 'Chennai',  'Kuwait',   'Electronics',   5500.00, 'Completed', '2026-05-28'),
(11, 'BL-2024-011', 2, 1, 'Chennai',  'Dubai',    'Auto Parts',    7200.00, 'Completed', '2026-06-15'),
(12, 'BL-2024-012', 5, 5, 'Chennai',  'Doha',     'Textiles',      2900.00, 'In Transit','2026-07-03');

-- Table 4: Freight Rates
CREATE TABLE freight_rates (
    rate_id      INT PRIMARY KEY,
    origin       VARCHAR(50),
    destination  VARCHAR(50),
    cargo_type   VARCHAR(50),
    rate_usd     DECIMAL(10,2),
    valid_from   DATE
);

INSERT INTO freight_rates VALUES
(1, 'Chennai', 'Dubai',   'Electronics', 850.00,  '2026-01-01'),
(2, 'Chennai', 'Dubai',   'Textiles',    620.00,  '2026-01-11'),
(3, 'Chennai', 'Muscat',  'Machinery',   980.00,  '2026-02-05'),
(4, 'Chennai', 'Kuwait',  'Chemicals',   750.00,  '2026-02-07'),
(5, 'Chennai', 'Doha',    'Electronics', 900.00,  '2026-03-09'),
(6, 'Chennai', 'Jeddah',  'Auto Parts',  870.00,  '2026-03-14'),
(7, 'Dubai',   'Chennai', 'Textiles',    580.00,  '2026-06-25'),
(8, 'Chennai', 'Kuwait',  'Electronics', 780.00,  '2026-06-09');
