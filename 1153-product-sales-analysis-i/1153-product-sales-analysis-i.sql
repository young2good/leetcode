# Write your MySQL query statement below
SELECT product_name, year, price
    FROM Sales T1
    LEFT JOIN Product T2
    ON T1.product_id = T2.product_id