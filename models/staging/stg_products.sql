SELECT 
    product_id AS product_key,
    product_name,
    product_category,
    min_investable_assets,
    min_risk_tolerance,
    required_advisor_certification,
    annual_fee_pct
FROM {{source('sql_bosses', 'products')}}