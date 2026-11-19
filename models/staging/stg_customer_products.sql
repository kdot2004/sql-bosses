SELECT
    customer_product_id,
    customer_id,
    product_id,
    enrolled_date
FROM {{source('sql_bosses','customer_products')}}