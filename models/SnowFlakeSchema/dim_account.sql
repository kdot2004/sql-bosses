SELECT
    account_id AS account_key,
    customer_id AS customer_key,
    account_type_id AS account_type_key,
    EXTRACT(YEAR FROM open_date)::int AS open_year,
    EXTRACT(MONTH FROM open_date)::int AS open_month,
    account_status,
    (account_status LIKE 'active') AS is_active,
    CASE
    WHEN open_date >= DATE '2026-09-30' - INTERVAL '1 year'  THEN '< 1 year'
    WHEN open_date >= DATE '2026-09-30' - INTERVAL '5 years' THEN '1–5 years'
    ELSE '5+ years'
END AS account_tenure
FROM {{ref('stg_accounts')}}