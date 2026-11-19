SELECT
    a.advisor_key,
    a.advisor_name,
    ac.asset_class_key,
    ac.asset_class_name,
    COUNT(t.transaction_key) AS trade_count,
    SUM(t.gross_amount) AS total_gross_amount,
    SUM(t.gross_amount) / SUM(SUM(t.gross_amount)) OVER (PARTITION BY a.advisor_key) AS pct_of_advisor_gross
FROM {{ref('fact_investment_transactions')}} t
JOIN {{ref('dim_advisor')}} a ON t.advisor_key = a.advisor_key
JOIN {{ref('dim_security')}} s ON t.security_key = s.security_key
JOIN {{ref('dim_asset_class')}} ac ON s.asset_class_key = ac.asset_class_key
WHERE t.trade_status = 'Settled'
GROUP BY a.advisor_key, a.advisor_name, ac.asset_class_key, ac.asset_class_name
