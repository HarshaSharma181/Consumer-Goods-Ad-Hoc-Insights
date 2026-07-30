#Request 10

WITH product_sales AS (

SELECT

    dp.division,
    dp.product_code,
    dp.product,
    SUM(fsm.sold_quantity) AS total_sold_quantity,

    RANK() OVER
    (
        PARTITION BY dp.division
        ORDER BY SUM(fsm.sold_quantity) DESC
    ) AS rank_order

FROM fact_sales_monthly fsm

JOIN dim_product dp
ON fsm.product_code=dp.product_code

WHERE fiscal_year=2021

GROUP BY
    dp.division,
    dp.product_code,
    dp.product

)

SELECT
    division,
    product_code,
    product,
    total_sold_quantity,
    rank_order
FROM product_sales
WHERE rank_order<=3;