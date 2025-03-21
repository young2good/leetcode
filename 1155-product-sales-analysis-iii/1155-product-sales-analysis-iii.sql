# Write your MySQL query statement below
WITH FIRST_YEAR AS (
    SELECT product_id
         , MIN(year) as first_year
        FROM Sales
        GROUP BY product_id
)

SELECT product_id
     , year as first_year
     , quantity
     , price
    FROM Sales
    WHERE (product_id, year) in (select * from FIRST_YEAR)
;