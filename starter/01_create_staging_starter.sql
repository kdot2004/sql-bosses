-- ============================================================================
-- STARTER SNIPPET 1 of 4 : staging DDL  (Financial Services - SQL Bosses)
-- Run from the project folder:
--   psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/01_create_staging_starter.sql
-- This creates ONE example table so you can see the pattern. YOU must write the
-- DDL for every other CSV in /data, choosing sensible data types.
-- If your instructor gave you your own schema (e.g. student_jdoe), replace
-- 'staging' below with that schema name.
-- Never put passwords in this file.
-- ============================================================================
CREATE SCHEMA IF NOT EXISTS staging;

DROP TABLE IF EXISTS staging.customers;
CREATE TABLE staging.customers (
    customer_id        VARCHAR(20),
    first_name         VARCHAR(100),
    last_name          VARCHAR(100),
    date_of_birth      DATE,
    state              VARCHAR(100),
    annual_income_band VARCHAR(100),
    risk_tolerance     VARCHAR(100),
    customer_since     DATE,
    advisor_id         VARCHAR(20),
    email              VARCHAR(100)
);

-- Staging tables mirror the CSV exactly. We deliberately do NOT add PRIMARY KEY
-- or NOT NULL here: a staging table must accept whatever the source sends so you
-- can measure its quality afterwards (see 03_verify_starter.sql).

-- TODO: one CREATE TABLE per remaining CSV file (look at each header + data first!)
