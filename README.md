
# Procurement Spend Analytics

## Project Overview

This project demonstrates how SQL can be used to analyze procurement
spending, supplier performance, and delivery reliability using
synthetic procurement data.

It is designed as a portfolio project to demonstrate foundational
skills relevant to procurement technology and supply chain analytics.

## Business Objectives

- Analyze total procurement spend.
- Identify high-spend suppliers.
- Track monthly purchasing trends.
- Measure supplier on-time delivery performance.
- Identify late deliveries and open purchase orders.
- Validate data quality and reconcile records.
- Document User Acceptance Testing (UAT) scenarios.

## Technologies Used

- MySQL
- SQL
- Relational database concepts
- GitHub
- Procurement data analysis
- Data quality validation
- Migration and reconciliation documentation
- UAT test-case documentation

## Repository Structure

| File | Description |
|---|---|
| `01_schema.sql` | Creates the procurement database tables |
| `02_load_sample_data.sql` | Loads synthetic sample records |
| `03_analysis_queries.sql` | Analyzes spending and supplier performance |
| `04_data_quality_checks.sql` | Checks data quality and record consistency |
| `05_business_insights.md` | Documents business questions and recommendations |
| `06_data_migration_reconciliation.md` | Provides migration validation guidance |
| `07_uat_test_cases.md` | Documents planned UAT scenarios |

## Database Tables

- `suppliers` — supplier information
- `products` — product details
- `purchase_orders` — purchasing transactions
- `deliveries` — expected and actual delivery information

## How to Run the SQL Scripts

1. Install MySQL or use a compatible MySQL environment.
2. Open a MySQL client or SQL editor.
3. Run `01_schema.sql`.
4. Run `02_load_sample_data.sql`.
5. Run `03_analysis_queries.sql`.
6. Run `04_data_quality_checks.sql`.
7. Review the Markdown documentation for business insights,
   migration validation, and UAT scenarios.

Run the scripts in the listed order.

## Skills Demonstrated

- SQL joins, aggregation, filtering, and date calculations
- Procurement spend analysis
- Supplier performance analysis
- Data quality checks
- Record reconciliation concepts
- Business documentation
- UAT planning

## Project Status

Portfolio project using synthetic data. SQL scripts and documentation
are provided for learning and demonstration.

## Disclaimer

This is an independent learning project. It does not use confidential
company data and is not affiliated with Deloitte or any procurement
software vendor.
