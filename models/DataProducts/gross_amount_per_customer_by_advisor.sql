-- Data product: gross_amount_per_customer_by_advisor
-- Question: Which advisors have the highest gross amount per assigned customer?
-- Grain: one row per advisor
-- Sources: dim_advisor, fact_investment_transactions, dim_customer, dim_branch
-- Logic:
--   1. Aggregate fact to advisor level: total gross_amount per advisor_key
--   2. Aggregate dim_customer to advisor level: count of customers per advisor_key
--   3. Start from dim_advisor and LEFT JOIN both aggregates on advisor_key
--   Aggregating separately before joining avoids fan-out (customers x trades
--   would inflate both the total and the count).
-- Filter: completed trades only (excludes cancelled and pending)
-- Measures:
--   assigned_customer_count = customers assigned to the advisor
--   total_gross_amount      = sum of gross_amount (0 if no trades)
--   gross_per_customer      = total_gross_amount / assigned_customer_count
--                             (NULL if the advisor has no customers, to avoid divide-by-zero)
--   advisor_rank            = rank by gross_per_customer, highest = 1
-- Note: customer count is shown alongside the ratio, since an advisor with very
--       few customers can rank high from one large client.
-- Columns: advisor_key, advisor_name, branch_name, assigned_customer_count,
--          total_gross_amount, gross_per_customer, advisor_rank
WITH advisor_gross AS (
    SELECT
        advisor_key,
        SUM(gross_amount) AS total_gross_amount
    FROM {{ ref('fact_investment_transactions') }}
    WHERE trade_status = 'Settled'
    GROUP BY advisor_key
),
advisor_customers AS (
    SELECT
        advisor_key,
        COUNT(customer_key) AS assigned_customer_count
    FROM {{ref('dim_customer')}} 
    GROUP BY advisor_key
)
    
SELECT
    a.advisor_key,
    a.advisor_name,
    b.branch_name,
    COALESCE(ac.assigned_customer_count, 0) AS assigned_customer_count,
    COALESCE(ag.total_gross_amount, 0) AS total_gross_amount,
    COALESCE(ag.total_gross_amount, 0) / NULLIF(ac.assigned_customer_count, 0) AS gross_per_customer,
    RANK() OVER (ORDER BY COALESCE(ag.total_gross_amount, 0) / NULLIF(ac.assigned_customer_count, 0) DESC NULLS LAST) AS advisor_rank
FROM {{ref('dim_advisor')}} a
JOIN {{ref('dim_branch')}} b ON a.branch_key = b.branch_key
LEFT JOIN advisor_gross ag ON a.advisor_key = ag.advisor_key
LEFT JOIN advisor_customers ac ON a.advisor_key = ac.advisor_key
