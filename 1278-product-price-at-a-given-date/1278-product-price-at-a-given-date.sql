# Write your MySQL query statement below
WITH last_date AS (
    SELECT product_id
        , max(change_date) as last_date
        FROM Products
        WHERE change_date <= '2019-08-16'
        GROUP BY product_id
), unique_product AS (
        SELECT distinct product_id
            FROM Products
)

SELECT TT1.product_id
     , IFNULL(TT2.new_price, 10) as price
    FROM
    (
        SELECT *
            FROM unique_product
    ) TT1
    LEFT JOIN
    (
        SELECT T1.product_id
            , T2.new_price
            FROM
            (
                SELECT *
                    FROM last_date
            ) T1
            LEFT JOIN
            (
                SELECT *
                    FROM Products
            ) T2
            ON T1.last_date = T2.change_date
            AND T1.product_id = T2.product_id
    ) TT2
    ON TT1.product_id = TT2.product_id
    ;