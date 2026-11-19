-- Data product: asset_class_by_risk_tolerance
-- Question: How does customer risk tolerance affect security asset class?
-- Grain: one row per risk tolerance x asset class
-- Sources: fact_investment_transactions, dim_account, dim_customer, dim_security, dim_asset_class
-- Joins:
--   fact -> dim_account  on account_key
--   dim_account -> dim_customer on customer_key       (snowflake chain)
--   fact -> dim_security on security_key
--   dim_security -> dim_asset_class on asset_class_key (snowflake chain)
-- Filter: completed trades only (excludes cancelled and pending)
-- Measures:
--   trade_count                 = count of transactions
--   total_gross_amount          = sum of gross_amount
--   pct_of_risk_tolerance_gross = this asset class's gross / total gross for that risk level
--                                 (window sum partitioned by risk tolerance)
-- Note: shows whether conservative customers trade safer asset classes than aggressive ones.
-- Columns: risk_tolerance, asset_class_key, asset_class_name,
--          trade_count, total_gross_amount, pct_of_risk_tolerance_gross

SELECT    
    c.risk_tolerance,
    ac.asset_class_key,
    ac.asset_class_name,
    COUNT(t.transaction_key) AS trade_count,
    SUM(t.gross_amount) AS total_gross_amount,
    SUM(t.gross_amount) / SUM(SUM(t.gross_amount)) OVER (PARTITION BY c.risk_tolerance) AS pct_of_risk_tolerance_gross
FROM {{ref('fact_investment_transactions')}} t
JOIN {{ref('dim_account')}} a ON t.account_key = a.account_key
JOIN {{ref('dim_customer')}} c ON a.customer_key = c.customer_key
JOIN {{ref('dim_security')}} s ON t.security_key = s.security_key
JOIN {{ref('dim_asset_class')}} ac ON s.asset_class_key = ac.asset_class_key
WHERE t.trade_status = 'Settled'
GROUP BY  ac.asset_class_name, ac.asset_class_key, c.risk_tolerance