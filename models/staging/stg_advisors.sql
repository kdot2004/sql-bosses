SELECT
    advisor_id,
    advisor_name,
    branch_id,
    certification,
    hire_date,
    client_capacity
FROM {{source('sql_bosses', 'advisors')}}