SELECT
    account_type_id,
    account_type_name,
    tax_treatment,
    min_opening_balance
FROM {{source('sql_bosses', 'account_types')}}
