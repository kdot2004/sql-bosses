-- Data product: account_type_by_income_band
-- Question: How does customer income band affect account type?
-- Grain: one row per income band x account type
-- Sources: dim_account, dim_customer, dim_account_type (no fact table needed)
-- Joins:
--   dim_account -> dim_customer     on customer_key
--   dim_account -> dim_account_type on account_type_key
-- Measures:
--   account_count      = count of accounts
--   pct_of_income_band = account_count / total accounts in that income band
--                        (window sum partitioned by income band; rows sum to 1 per band)
-- Note: percentages are used because income bands have different numbers of customers,
--       so raw counts would be misleading.
-- Columns: annual_income_band, account_type_key, account_type_name, tax_treatment,
--          account_count, pct_of_income_band

SELECT
    c.annual_income_band,
    act.account_type_key, 
    act.account_type_name,
    act.tax_treatment,
    COUNT(a.account_key) AS account_count,
    COUNT(a.account_key)::numeric / SUM(COUNT(a.account_key)) OVER (PARTITION BY c.annual_income_band) AS pct_of_income_band
FROM {{ref('dim_account')}} a
JOIN {{ref('dim_customer')}} c ON a.customer_key = c.customer_key
JOIN {{ref('dim_account_type')}} act ON a.account_type_key = act.account_type_key
GROUP BY c.annual_income_band, act.account_type_key, act.account_type_name, act.tax_treatment