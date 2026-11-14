# SQL Bosses 

## Overview
This project builds a data pipeline to ingest, clean, transform, visualize, 
and analyze a financial services dataset. Developed for `I320D Data Engineering`.

## Team Members
| Name | Responsibilities |
|------|------------------|
| Mark | Data Ingestion, Programming |
| Dylan | Data Modeling |
| Kenny | Data Visualization (PowerBI) |
| Soham | [Responsibilities] |

## Business Problems

1. How does gross amount by asset class vary by advisor?
2. How does gross amount vary by branch?
3. How does customer income band affect account type? 
4. How does customer risk tolerance affect security asset class type?
5. Which advisors have the highest gross amount divided by amount of assigned customers?

## Data Sources
| Source | Description | Format | Access Method |
|--------|-------------|--------|---------------|
| [Source] | [Data provided] | [CSV/JSON/etc.] | [API/download/etc.] |

Include:
- Dataset links and usage restrictions
- Date range and approximate data volume
- Important fields and known limitations

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

- **Fact tables:** investment_transactions
- **Dimension tables:** accounts, account_types, customers, products, advisors, branches, securities, asset_classes
    - Junction table: customer_products
- **Keys:** account_id, account_type_id, customer_id, product_id, advisor_id, branch_id, security_id, asset_class_id

<img width="986" height="876" alt="Screenshot 2026-11-11 162917" src="https://github.com/user-attachments/assets/2b230c28-3b13-4a43-90cd-0ed389f404ae" />

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
