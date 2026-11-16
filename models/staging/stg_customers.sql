SELECT
    customer_id,
    advisor_id,
    first_name,
    last_name,
    date_of_birth,
    state,
    annual_income_band,
    risk_tolerance,
    customer_since,
    email
FROM {{source('sql_bosses','customers')}}