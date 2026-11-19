SELECT 
    branch_id,
    branch_name,
    city,
    state,
    region
FROM {{source('sql_bosses','branches')}}