-- Data product: gross_amount_by_branch
-- Question: How does gross amount vary by branch?
-- Grain: one row per branch
-- Sources: fact_investment_transactions, dim_advisor, dim_branch
-- Joins:
--   fact -> dim_advisor on advisor_key
--   dim_advisor -> dim_branch on branch_key (snowflake chain)
-- Filter: completed trades only (excludes cancelled and pending)
-- Measures:
--   advisor_count       = count of distinct advisors with trades
--   customer_count      = count of distinct customers with trades
--   trade_count         = count of transactions
--   total_gross_amount  = sum of gross_amount
--   avg_gross_per_trade = total_gross_amount / trade_count
-- Note: branch is attributed through the advisor who executed the trade.
--       advisor/customer counts provide context so larger branches aren't favored by size alone.
-- Columns: branch_key, branch_name, region, advisor_count, customer_count,
--          trade_count, total_gross_amount, avg_gross_per_trade
SELECT
    b.branch_key,
    b.branch_name,
    b.region,
    COUNT(DISTINCT a.advisor_key) AS advisor_count,
    COUNT(DISTINCT t.customer_key) AS customer_count,
    COUNT(t.transaction_key) AS trade_count,
    SUM(t.gross_amount) AS total_gross_amount,
    SUM(t.gross_amount) / COUNT(t.transaction_key) AS avg_gross_per_trade
FROM {{ref('fact_investment_transactions')}} t
JOIN {{ref('dim_advisor')}} a ON t.advisor_key = a.advisor_key
JOIN {{ref('dim_branch')}} b ON a.branch_key = b.branch_key
WHERE t.trade_status = 'Settled'
GROUP BY b.branch_key, b.branch_name, b.region