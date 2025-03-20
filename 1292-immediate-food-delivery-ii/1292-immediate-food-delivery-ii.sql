# Write your MySQL query statement below
WITH FIRST_ORDERS AS (
    SELECT *
        FROM
        (
            SELECT *
                , RANK () OVER (PARTITION BY customer_id ORDER BY order_date ASC) as r
                FROM Delivery
        ) T
        WHERE r = 1
)   

SELECT CONVERT(SUM(is_immediated) / count(customer_id) * 100, decimal(5,2)) as immediate_percentage
    FROM
    (
        SELECT *
            , CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 end is_immediated
            FROM FIRST_ORDERS
    ) L