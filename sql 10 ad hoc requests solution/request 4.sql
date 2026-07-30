#Request 4

WITH product_counts AS (

SELECT
    dp.segment,
    fsm.fiscal_year,
    COUNT(DISTINCT fsm.product_code) AS product_count
FROM fact_sales_monthly fsm
JOIN dim_product dp
ON fsm.product_code = dp.product_code
WHERE fiscal_year IN (2020,2021)
GROUP BY dp.segment,fsm.fiscal_year

)

SELECT
    segment,
    SUM(CASE WHEN fiscal_year=2020 THEN product_count END) AS product_count_2020,
    SUM(CASE WHEN fiscal_year=2021 THEN product_count END) AS product_count_2021,
    SUM(CASE WHEN fiscal_year=2021 THEN product_count END)
    -
    SUM(CASE WHEN fiscal_year=2020 THEN product_count END)
    AS difference
FROM product_counts
GROUP BY segment
ORDER BY difference DESC;