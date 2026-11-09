# SQL Bosses 

## Overview
This project builds a data pipeline to ingest, clean, transform, and analyze
data from financial services. Developed for `I320D Data Engineering`, it demonstrates core data engineering concepts through a financial services use case.

## Team Members
| Name | Responsibilities |
|------|------------------|
| Mark | [Responsibilities] |
| Dylan | [Responsibilities] |
| Kenny | [Responsibilities] |
| Soham | [Responsibilities] |

## Business Problem
A wealth-management firm's data is spread across separate customer, account, advisor, product, and trade files, so it can't easily act on it. Our goal is to **transform this raw data into business-ready, tested tables that give stakeholders actionable insights.**

- **Problem:** Raw source data is fragmented and messy (duplicates, inconsistent text, missing values), so it can't be trusted for decisions. 
- **Audience:** Head of wealth management, branch managers, product marketing, and compliance. 
- **Goal:** Deliver clean, reporting-ready data and a dashboard that gives clarity on customer investments, wealth managers, product qualifications, and risk alignment. 

## Data Sources
| Source | Description | Format | Access Method |
|--------|-------------|--------|---------------|
| customer.csv | Investing customers | CSV | download |
| accounts.csv | Investment accounts owned by customers | CSV | download |
| account_types.csv | Account types with tax treatment and minimum opening balance | CSV | download |
| investment_transactions.csv | Every trade and dividend reinvestment, with quantity, price, amount, and fees | CSV | download |
| securities.csv | Funds and ETFs that can be traded | CSV | download |
| asset_classes.csv | Asset classes with a numeric risk level (1-5) | CSV | download |
| advisors.csv | Wealth managers with certification and branch | CSV | download |
| branches.csv | Branch offices | CSV | download |
| products.csv | Additional products and their qualification threshholds | CSV | download |
| customer_products.csv | Products each customer already holds | CSV | download |

Include:
- The data 
- Trades span 2012-05-01 to 2026-10-31. There are about 20,800 rows across all ten files
- customer_id, account_id, advisor_id, security_id, and product_id link the files. The key measures are gross_amount and fess on trades. risk_tolerance (

## Technology Stack
| Component | Tool | Purpose |
|-----------|------|---------|
| Programming | [Python/SQL] | [Purpose] |
| Database | [PostgreSQL/etc.] | [Purpose] |
| Transformation | [dbt/etc.] | [Purpose] |
| Orchestration | [Airflow/etc.] | [Purpose] |
| Visualization | [Power BI/etc.] | [Purpose] |

## Pipeline Architecture
Describe how data moves through the system:

Source → Ingestion → Raw Storage → Transformation → Analytics Tables → Reporting

[Insert architecture diagram here.]

## Data Model
Describe the main tables and their relationships.

- **Grain:** [What one row represents in each main table]
- **Fact tables:** [Transactions, payments, etc.]
- **Dimension tables:** [Accounts, customers, dates, etc.]
- **Keys:** [Primary and foreign keys]

[Insert entity relationship diagram here.]

## Data Processing
### Ingestion
- How data is collected and loaded
- Initial load and subsequent update strategy

### Cleaning and Transformation
- Handling missing values and duplicates
- Standardizing dates, currencies, and data types
- Creating derived fields and analytics tables

### Pipeline Execution
- Task order and dependencies
- Refresh frequency
- Handling failed runs and reruns

## Data Quality and Privacy
- Required-field and uniqueness checks
- Referential integrity and valid-value checks
- Treatment of sensitive financial or personal data
- Credential management using environment variables

## Repository Structure
```text
project/
├── README.md
├── requirements.txt
├── .env.example
├── .gitignore
├── data/             # Sample data or data instructions
├── ingestion/        # Data extraction and loading
├── transformations/  # SQL or dbt models
├── orchestration/    # Pipeline scheduling
├── tests/            # Data and pipeline checks
├── dashboards/       # Reports and visualizations
└── docs/             # Architecture and supporting documentation
```

## Setup and Usage
### Prerequisites
[List required software, versions, and accounts.]

### Installation
1. Clone the repository.
2. Install dependencies.
3. Configure environment variables using `.env.example`.
4. Set up the database.

### Run the Pipeline
[Provide the commands needed to run each step.]

### Run Quality Checks
[Provide commands and explain the expected results.]

## Results
- Final datasets or tables produced
- Key metrics or business questions answered
- Dashboard screenshots or example queries
- Pipeline performance, if measured

## Limitations and Future Improvements
- Current data or technical limitations
- Features that could be added later

## References
- Dataset sources
- Documentation and other resources used
