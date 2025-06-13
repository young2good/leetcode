# Write your MySQL query statement below

SELECT product_name
     , tot_unit as unit
    FROM 
    (
        SELECT *
            FROM Products
    ) T1
    INNER JOIN 
    (
        SELECT product_id
            , sum(unit) as tot_unit
            FROM Orders
            WHERE order_date>='2020-02-01'
            AND order_date<'2020-03-01'
            GROUP BY product_id
            HAVING sum(unit)>=100
    ) T2
    ON T1.product_id = T2.product_id
