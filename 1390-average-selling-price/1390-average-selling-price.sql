# Write your MySQL query statement below
SELECT product_id
     , ifnull(round(sum(tot) / sum(units),2), 0) as average_price
    FROM
    (
        SELECT T1.*
            , T2.units
            , price * units as tot
            FROM Prices T1
            LEFT JOIN UnitsSold T2
            ON T1.product_id = T2.product_id
            AND T1.start_date <= T2.purchase_date
            AND T1.end_date >= T2.purchase_date
    ) T
    GROUP BY product_id
;