#Request 6

SELECT
    d.customer_code,
    d.customer,
    ROUND(AVG(pre_invoice_discount_pct)*100,2)
        AS average_discount_percentage
FROM fact_pre_invoice_deductions f
JOIN dim_customer d
ON f.customer_code=d.customer_code
WHERE fiscal_year=2021
AND market='India'
GROUP BY
    d.customer_code,
    d.customer
ORDER BY average_discount_percentage DESC
LIMIT 5;