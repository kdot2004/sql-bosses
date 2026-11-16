SELECT
    security_id,
    ticker,
    security_name,
    asset_class_id,
    security_type,
    expense_ratio_pct,
    reference_price
FROM {{source('sql_bosses','securities') }}