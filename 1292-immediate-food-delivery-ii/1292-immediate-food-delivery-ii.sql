# Write your MySQL query statement below
WITH FIRST_ORDERS AS (
    SELECT customer_id
         , MIN(order_date) as first_order
        FROM Delivery
        GROUP BY customer_id
)   

-- SELECT *
--     FROM FIRST_ORDERS

SELECT round(sum(is_immediate) / count(customer_id) * 100, 2) as immediate_percentage 
    FROM
    (
        SELECT T1. *
            , CASE WHEN order_date = customer_pref_delivery_date THEN 1 ELSE 0 END as is_immediate
            FROM Delivery T1
            INNER JOIN FIRST_ORDERS T2
            ON T1.customer_id = T2.customer_id
            AND T1.order_date = T2.first_order
    ) T
