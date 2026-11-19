SELECT
    security_id AS security_key,
    ticker,
    security_name,
    asset_class_id AS asset_class_key,
    security_type,
    expense_ratio_pct,
    CASE
        WHEN expense_ratio_pct IS NULL OR expense_ratio_pct = 0 then 'None'
        WHEN expense_ratio_pct < 0.20 THEN 'Low'
        WHEN expense_ratio_pct < 0.75 THEN 'Medium'
        ELSE 'High'
    END AS expense_ratio_tier,
    reference_price
FROM {{ref('securities') }}