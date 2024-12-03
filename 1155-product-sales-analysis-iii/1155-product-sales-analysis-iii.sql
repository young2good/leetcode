# Write your MySQL query statement below

SELECT product_id
     , `year` as first_year
     , quantity
     , price
    FROM Sales
    WHERE (product_id, year) in (
        SELECT product_id
            , min(year) first_year
            FROM Sales
            GROUP BY product_id
    )
    ;



