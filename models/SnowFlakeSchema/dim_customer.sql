SELECT
    customer_id AS customer_key,
    advisor_id AS advisor_key,
    first_name,
    last_name,
    first_name || ' '|| last_name AS full_name,
    date_of_birth,
    CASE
        WHEN date_of_birth > DATE '2026-09-30' - INTERVAL '30 years' THEN 'Under 30'
        WHEN date_of_birth > DATE '2026-09-30' - INTERVAL '50 years' THEN '30–49'
        WHEN date_of_birth > DATE '2026-09-30' - INTERVAL '65 years' THEN '50–64'
        ELSE '65+'
    END           AS age_group,
    state,
    annual_income_band,
    risk_tolerance,
    customer_since,
    EXTRACT (YEAR FROM customer_since)::int AS customer_since_year,
    email
FROM {{ref('stg_customers')}}