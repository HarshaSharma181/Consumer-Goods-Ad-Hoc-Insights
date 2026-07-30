#Request 9

WITH gross_sales AS (

SELECT
    c.channel,
    ROUND(
        SUM(g.gross_price*s.sold_quantity)/1000000,
        2
    ) AS gross_sales_mln

FROM fact_sales_monthly s

JOIN dim_customer c
ON s.customer_code=c.customer_code

JOIN fact_gross_price g
ON s.product_code=g.product_code
AND s.fiscal_year=g.fiscal_year

WHERE s.fiscal_year=2021

GROUP BY c.channel

)

SELECT
    channel,
    gross_sales_mln,
    ROUND(
        gross_sales_mln*100/
        SUM(gross_sales_mln) OVER(),
        2
    ) AS percentage
FROM gross_sales
ORDER BY gross_sales_mln DESC;