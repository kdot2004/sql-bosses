SELECT
    advisor_id AS advisor_key,
    advisor_name,
    branch_id AS branch_key,
    certification,
    hire_date,
    EXTRACT(YEAR FROM hire_date)::int AS hire_year,
    client_capacity
FROM {{ref('stg_advisors')}}