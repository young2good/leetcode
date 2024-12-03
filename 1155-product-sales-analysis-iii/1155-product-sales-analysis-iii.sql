# Write your MySQL query statement below

-- SELECT product_id
--      , `year` as first_year
--      , quantity
--      , price
--     FROM Sales
--     WHERE (product_id, year) in (
--         SELECT product_id
--             , min(year) first_year
--             FROM Sales
--             GROUP BY product_id
--     )
--     ;

with FirstYear AS (
    select product_id
         , min(year) first_year
        FROM Sales
        GROUP BY product_id
)

SELECT T1.product_id
     , T2.first_year
     , quantity
     , price
    FROM Sales T1
    INNER JOIN FirstYear T2
    ON T1.product_id = T2.product_id
    AND T1.year = T2.first_year

;
