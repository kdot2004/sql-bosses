SELECT 
    branch_id AS branch_key,
    branch_name,
    city,
    state,
    region
FROM {{ref('stg_branches')}}