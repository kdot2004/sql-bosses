-- 02_load_raw.sql
-- Bulk-loads the 10 CSVs into the raw schema with psql \copy (client-side).
-- Run from ~/sql_bosses so the relative seeds/ paths resolve.
-- Repeatable: each table is truncated before loading.

\set ON_ERROR_STOP on

TRUNCATE sql_bosses_raw.account_types;
\copy sql_bosses_raw.account_types FROM 'seeds/account_types.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.accounts;
\copy sql_bosses_raw.accounts FROM 'seeds/accounts.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.advisors;
\copy sql_bosses_raw.advisors FROM 'seeds/advisors.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.asset_classes;
\copy sql_bosses_raw.asset_classes FROM 'seeds/asset_classes.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.branches;
\copy sql_bosses_raw.branches FROM 'seeds/branches.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.customers;
\copy sql_bosses_raw.customers FROM 'seeds/customers.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.customer_products;
\copy sql_bosses_raw.customer_products FROM 'seeds/customer_products.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.investment_transactions;
\copy sql_bosses_raw.investment_transactions FROM 'seeds/investment_transactions.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.products;
\copy sql_bosses_raw.products FROM 'seeds/products.csv' WITH (FORMAT csv, HEADER true)

TRUNCATE sql_bosses_raw.securities;
\copy sql_bosses_raw.securities FROM 'seeds/securities.csv' WITH (FORMAT csv, HEADER true)