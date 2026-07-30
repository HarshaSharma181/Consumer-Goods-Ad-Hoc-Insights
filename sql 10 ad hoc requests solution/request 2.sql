## Request 2

WITH products_2020 AS (
    SELECT COUNT(DISTINCT product_code) AS unique_products_2020
    FROM fact_sales_monthly
    WHERE fiscal_year = 2020
),
products_2021 AS (
    SELECT COUNT(DISTINCT product_code) AS unique_products_2021
    FROM fact_sales_monthly
    WHERE fiscal_year = 2021
)

SELECT
    p20.unique_products_2020,
    p21.unique_products_2021,
    ROUND(
        (p21.unique_products_2021 - p20.unique_products_2020)
        *100.0/p20.unique_products_2020,
        2
    ) AS percentage_chg
FROM products_2020 p20
CROSS JOIN products_2021 p21;