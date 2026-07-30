#Request 7

SELECT
    MONTHNAME(s.date) AS Month,
    YEAR(s.date) AS Year,
    ROUND(
        SUM(g.gross_price*s.sold_quantity)/1000000,
        2
    ) AS Gross_sales_Amount_Mln
FROM fact_sales_monthly s
JOIN dim_customer c
ON s.customer_code=c.customer_code
JOIN fact_gross_price g
ON s.product_code=g.product_code
AND s.fiscal_year=g.fiscal_year
WHERE c.customer='Atliq Exclusive'
GROUP BY
    YEAR(s.date),
    MONTH(s.date),
    MONTHNAME(s.date)
ORDER BY
    YEAR(s.date),
    MONTH(s.date);