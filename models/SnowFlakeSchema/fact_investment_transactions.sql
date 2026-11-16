--- Grain: One row per transactions
--- Measures: quantity, price, gross_amount, fees, net_amount
--- Dimensions: account -> customer -> advisor -> branch -> account_type -> security -> asset_class
        ---Degenerate dimensions: trade_type, order_channel, trade_status
--- How it answers our questions: Gross amount can be grouped by any attributes in the dimension tables
SELECT
    transaction_id AS transaction_key,
    account_id AS account_key,
    customer_id AS customer_key,
    security_id AS security_key,
    advisor_id AS advisor_key,
    trade_date,
    trade_type,
    quantity,
    price,
    gross_amount,
    fees,
    CASE 
        WHEN trade_type LIKE '%buy%' THEN gross_amount + fees 
        WHEN trade_type LIKE '%sell%' THEN gross_amount - fees
        ELSE gross_amount
    END AS net_amount,
    order_channel,
    trade_status
FROM {{ref('stg_investment_transactions')}}