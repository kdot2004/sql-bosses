-- 01_create_raw.sql
-- Creates the raw landing schema and tables for the 10 source CSVs.
-- Repeatable: drops and recreates each table.

\set ON_ERROR_STOP on

CREATE SCHEMA IF NOT EXISTS sql_bosses_raw;

DROP TABLE IF EXISTS sql_bosses_raw.account_types;
CREATE TABLE sql_bosses_raw.account_types (
    account_type_id      varchar(10),
    account_type_name    text,
    tax_treatment        text,
    min_opening_balance  numeric(14,2)
);

DROP TABLE IF EXISTS sql_bosses_raw.accounts;
CREATE TABLE sql_bosses_raw.accounts (
    account_id       varchar(20),
    customer_id      varchar(20),
    account_type_id  varchar(10),
    open_date        date,
    account_status   text
);

DROP TABLE IF EXISTS sql_bosses_raw.advisors;
CREATE TABLE sql_bosses_raw.advisors (
    advisor_id      varchar(20),
    advisor_name    text,
    branch_id       varchar(20),
    certification   text,
    hire_date       date,
    client_capacity integer
    -- add remaining advisor columns, in CSV order
);

DROP TABLE IF EXISTS sql_bosses_raw.asset_classes;
CREATE TABLE sql_bosses_raw.asset_classes (
    asset_class_id    varchar(20),
    asset_class_name  text,
    risk_level        integer
);

DROP TABLE IF EXISTS sql_bosses_raw.branches;
CREATE TABLE sql_bosses_raw.branches (
    branch_id    varchar(20),
    branch_name  text,
    city         text,
    state        text,
    region       text
);

DROP TABLE IF EXISTS sql_bosses_raw.customers;
CREATE TABLE sql_bosses_raw.customers (
    customer_id         varchar(20),
    first_name          text,
    last_name           text,
    date_of_birth       date,
    state               text,
    annual_income_band  text,
    risk_tolerance      text,
    customer_since      date,
    advisor_id          varchar(20),
    email               text
);

DROP TABLE IF EXISTS sql_bosses_raw.customer_products;
CREATE TABLE sql_bosses_raw.customer_products (
    customer_product_id  varchar(20),
    customer_id          varchar(20),
    product_id           varchar(20),
    enrolled_date        date
);

DROP TABLE IF EXISTS sql_bosses_raw.investment_transactions;
CREATE TABLE sql_bosses_raw.investment_transactions (
    transaction_id  varchar(20),
    account_id      varchar(20),
    customer_id     varchar(20),
    security_id     varchar(20),
    advisor_id      varchar(20),
    trade_date      date,
    trade_type      text,
    quantity        numeric(14,4),
    price           numeric(14,4),
    gross_amount    numeric(14,2),
    fees            numeric(10,2),
    order_channel   text,
    trade_status    text
);

DROP TABLE IF EXISTS sql_bosses_raw.products;
CREATE TABLE sql_bosses_raw.products (
    product_id                      varchar(20),
    product_name                    text,
    product_category                text,
    min_investable_assets           numeric(14,2),
    min_risk_tolerance              text,
    required_advisor_certification  text,
    annual_fee_pct                  numeric(6,3)
);

DROP TABLE IF EXISTS sql_bosses_raw.securities;
CREATE TABLE sql_bosses_raw.securities (
    security_id        varchar(20),
    ticker             text,
    security_name      text,
    asset_class_id     varchar(20),
    security_type      text,
    expense_ratio_pct  numeric(6,3),
    reference_price    numeric(14,4)
);