# Gulf Freight Operations — SQL Analysis

A data analytics project exploring shipment patterns, agent performance,
customer behaviour, and freight revenue across Gulf trade routes.
Built using real-world NVOCC logistics domain knowledge.

---

## Project Overview

This project simulates a freight operations database for an NVOCC company
handling cargo across the Gulf corridor (India ↔ UAE, Oman, Kuwait,
Qatar, Bahrain, Saudi Arabia). Using SQL, it answers key business
questions that operations and management teams face daily.

---

## Tools Used

- **SQL** (MySQL)
- **GitHub** for version control

---

## Database Schema

| Table | Description |
|---|---|
| `customers` | Importers and exporters (BCO & Freight Forwarders) |
| `agents` | Shipping agents across Gulf and Asia regions |
| `shipments` | Individual shipment records with BL numbers |
| `freight_rates` | Rate card by route and cargo type |

---

## Business Questions Answered

### Basic Analysis
- Which shipments are completed vs pending vs in transit?
- Which destination ports receive the most cargo?
- What freight rates apply to each cargo type?

### JOIN Analysis
- Full shipment report combining customer + agent + shipment data
- Which BCO customers have active shipments?
- How do freight rates map to actual shipments?

### Business Insights
- Which Gulf port has the highest shipment volume?
- Top 5 customers by total cargo weight
- Which agents handle the most shipments per region?
- Monthly shipment trend across 2024
- Average, min, and max freight rate by cargo type
- Estimated revenue per trade route (weight × rate)

---

## Key Findings

1. **Dubai** is the highest-volume destination port with 3  shipments
2. **Oman shippers** and ** Gulf freight ** are the top customers by cargo weight
3. **DUBAI AGENT** handles the highest number of shipments(4) in the Gulf region
4. **Machinery** and **Auto Parts** attract the highest freight rates of 980 and 870 usd respectively.
5. Estimated revenue is highest on the **Chennai → Muscat** route with the estimated revenue of 13916 usd with the cargo Machinery.

---

## How to Run

1. Open MySQL Workbench or any SQL client
2. Run `01_create_tables.sql` first to set up the database
3. Run files 02, 03, and 04 in order
4. Each file has comments explaining every query

---

## Domain Context

This project is built on firsthand experience in NVOCC shipping operations
across the Gulf corridor, including freight documentation, BL management,
agent coordination, and Gulf trade lane operations. The dataset reflects
realistic cargo types, port pairs, and rate structures used in the industry.

---

## Author

**Sakthi Aishvaryaa C** — Aspiring Data Analyst | BTech Biotechnology | PGDM Business Analytics  
SQL | Python | Power BI | Logistics Domain  
📍 Chennai, India  
🔗 www.linkedin.com/in/sakthi-aishvaryaa-chandrasekar-b44369321
