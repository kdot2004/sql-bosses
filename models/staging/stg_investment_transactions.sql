SELECT
    transaction_id,
    account_id,
    customer_id,
    security_id,
    advisor_id,
    trade_date,
    trade_type,
    quantity,
    price,
    gross_amount,
    fees,
    order_channel,
    trade_status
FROM {{source('sql_bosses','investment_transactions')}}