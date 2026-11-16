-- ============================================================================
-- STARTER SNIPPET 3 of 4 : verification queries   (Financial Services)
-- Run after loading. Capture the output for your report (section 3.3).
-- ============================================================================

-- 1) Row count (compare to: wc -l data/customers.csv  minus 1 header line)
SELECT 'staging.customers' AS table_name, COUNT(*) AS row_count FROM staging.customers;

-- 2) Eyeball a few rows
SELECT * FROM staging.customers LIMIT 10;

-- 3) Null profile for every column (edit the column list for your table)
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL) AS customer_id_nulls,
    COUNT(*) FILTER (WHERE first_name IS NULL) AS first_name_nulls,
    COUNT(*) FILTER (WHERE last_name IS NULL) AS last_name_nulls,
    COUNT(*) FILTER (WHERE date_of_birth IS NULL) AS date_of_birth_nulls,
    COUNT(*) FILTER (WHERE state IS NULL) AS state_nulls,
    COUNT(*) FILTER (WHERE annual_income_band IS NULL) AS annual_income_band_nulls,
    COUNT(*) FILTER (WHERE risk_tolerance IS NULL) AS risk_tolerance_nulls,
    COUNT(*) FILTER (WHERE customer_since IS NULL) AS customer_since_nulls,
    COUNT(*) FILTER (WHERE advisor_id IS NULL) AS advisor_id_nulls,
    COUNT(*) FILTER (WHERE email IS NULL) AS email_nulls
FROM staging.customers;

-- 4) Is 'customer_id' really unique? (A key that is not unique changes your whole model.)
SELECT customer_id, COUNT(*) AS copies
FROM staging.customers
GROUP BY customer_id
HAVING COUNT(*) > 1
ORDER BY copies DESC
LIMIT 20;

-- 5) Profile the text columns: do category values look consistent?
--    (copy / paste this pattern for any column you want to inspect)
-- SELECT some_text_column, COUNT(*) FROM staging.customers GROUP BY 1 ORDER BY 2 DESC;

-- 6) Do the other files share this table's id? (example join check - adapt per file)
-- SELECT COUNT(*) FROM staging.<other_table> o
-- LEFT JOIN staging.customers t USING (customer_id)
-- WHERE t.customer_id IS NULL;
