# I320 Data Engineering - Final Project Dataset
## Financial Services | Team: SQL Bosses

### The assignment brief
> Track customer investments and to identify wealth managers and additional products they qualify for.

**Stakeholders you are building for:** Head of wealth management, branch managers, product marketing, and compliance.

**Data window:** Trade history from account opening (2012) through 2026-10-31.

**"Today" for this project:** treat **2026-10-31** as the current date for any as-of logic.

### Analytical requirements (restate these in your own words in Section 2 of your report)
1. Customer investments: How much has each customer invested, and how is it spread across account types, asset classes, and securities, and how has it changed over time?
2. Wealth managers: Which wealth managers (advisors) serve which customers, and what are their customer counts, assets under advisement, and trading activity by branch?
3. Product qualification: Which customers qualify for additional products they do not yet hold, using the product thresholds (investable assets, risk tolerance, and required advisor certification)?
4. Risk alignment: Does each customer's actual asset-class mix agree with their stated risk tolerance?

### What is in this package
```
financial_services_sql_bosses/
  README.md                         <- this file
  data/                             <- 10 CSV files (UTF-8, comma-delimited, header row)
  starter/
    01_create_staging_starter.sql   <- example staging DDL (ONE table)
    02_load_starter.psql            <- example psql \copy load (ONE table)
    03_verify_starter.sql           <- verification / profiling queries
    04_dbt_sources_starter.yml      <- example dbt source declaration
```

| File | What it contains |
|---|---|
| `data/account_types.csv` | Account type with tax treatment. |
| `data/accounts.csv` | Investment accounts owned by customers. |
| `data/advisors.csv` | Wealth managers with certification and branch. |
| `data/asset_classes.csv` | Asset classes with a numeric risk level. |
| `data/branches.csv` | Branch offices. |
| `data/customer_products.csv` | Products each customer already holds. |
| `data/customers.csv` | Investing customers with profile, stated risk tolerance, and assigned wealth manager. |
| `data/investment_transactions.csv` | Every trade and reinvestment with amounts and fees. |
| `data/products.csv` | Additional products/services with qualification thresholds. |
| `data/securities.csv` | Funds and ETFs that can be bought and sold. |

### Read this before you start
* **All data is synthetic.** Names, e-mails, phone numbers and identifiers are invented. E-mails use the reserved `example.com` domain.
* **Nothing is labelled for you.** The files are not marked as "fact" or "dimension". Deciding what the **grain** is, which file(s) are fact tables, which are dimensions, which are bridges or lookups, and how the files relate is **your job** - and a core part of your grade. Start by reading headers, sampling rows, and testing which columns the files have in common.
* **The files share identifiers.** Columns with the same name/format across files are how the files connect. Verify every join: check cardinality (1:1, 1:many, many:many) before you trust a count.
* **The data is realistic, not pristine.** Expect nulls, inconsistent text values, and repeated rows. Detect them with queries, decide how to handle them, and document your decisions in your report (Sections 3 and 7). Do not silently delete rows - show your evidence.
* Some NULLs are *meaningful* (they describe a real business situation) and some are *defects*. Part of the work is telling them apart.

### Quick start
```bash
# 1. create your GitHub repo, then copy this folder's /data and /starter into it
# 2. from the project root:
psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/01_create_staging_starter.sql
psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/02_load_starter.psql
psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/03_verify_starter.sql
```
Then extend the snippets to cover **all** files, build your own dbt models (staging -> star schema -> data products), and visualize in Superset.

### Repository hygiene (from the project guide)
* Do **not** commit passwords, tokens, or `profiles.yml`. Add them to `.gitignore`.
* Commit the data only if your instructor allows it; otherwise document how to place it locally.

### Report checklist reminder
Introduction + restated requirements -> source documentation (conceptual & physical ER) -> staging DDL & `\copy` script with verification -> grain/facts/dimensions + lineage diagram -> star schema evidence -> your own dbt models -> data products -> Superset dashboard + interpretation -> reflection -> repo link.
