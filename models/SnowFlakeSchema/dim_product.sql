SELECT 
    product_id AS product_key,
    product_name,
    product_category,
    min_investable_assets,
    min_risk_tolerance,
    required_advisor_certification,
    annual_fee_pct,
    CASE
        WHEN annual_fee_pct = 0    THEN 'No fee'
        WHEN annual_fee_pct < 0.5  THEN 'Low'
        WHEN annual_fee_pct < 1.0  THEN 'Medium'
        ELSE 'High'
    END AS fee_tier
FROM {{source('sql_bosses', 'products')}}