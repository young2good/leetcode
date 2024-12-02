# Write your MySQL query statement below

WITH first_order AS (
    SELECT customer_id
         , min(order_date) as first_order_dt
        FROM Delivery
        GROUP BY customer_id
), 
first_dataset AS (
    SELECT T2.*
         , case when order_date = customer_pref_delivery_date then 'immediate' else 'scheduled' end as order_type
        FROM first_order T1
        LEFT JOIN Delivery T2
        ON T1.customer_id = T2.customer_id
        AND T1.first_order_dt = T2.order_date
)

SELECT round(sum(case when order_type = 'immediate' then 1 else 0 end) / count(*) * 100, 2) immediate_percentage
    FROM first_dataset
    ;
    