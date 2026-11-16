SELECT
    account_type_id AS account_type_key,
    account_type_name,
    tax_treatment,
    min_opening_balance
FROM {{ref('stg_account_types')}}