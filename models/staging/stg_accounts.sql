SELECT
    account_id,
    customer_id,
    account_type_id,
    open_date,
    account_status
FROM {{source('sql_bosses','accounts')}}