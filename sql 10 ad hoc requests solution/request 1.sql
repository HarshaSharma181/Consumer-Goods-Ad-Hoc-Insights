#Request 1

SELECT DISTINCT market
FROM dim_customer
WHERE customer = 'Atliq Exclusive'
AND region = 'APAC'
ORDER BY market;