# Write your MySQL query statement below
SELECT round(SUM(CASE WHEN order_date = customer_pref_delivery_date Then 1 else 0 end)/count(customer_id) * 100,2) as immediate_percentage
    FROM Delivery
    WHERE (customer_id, order_date) in (
        SELECT customer_id
            , min(order_date) fisrt_date
            FROM Delivery
            GROUP BY customer_id
    )
;
