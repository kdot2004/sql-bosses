--- Grain: One row per customer enrollment in a product
--- Measures: None, factless fact table
--- Dimensions: customer -> advisor -> branch, product, enrolled date
--- How it answers our questions: It supports product adoption analysis by customer segment, advisor, or branch
SELECT
    customer_product_id AS customer_product_key,
    customer_id AS customer_key, 
    product_id AS product_key,
    enrolled_date,
    EXTRACT(YEAR FROM enrolled_date)::int AS enrolled_year
FROM {{source('sql_bosses','customer_products')}}