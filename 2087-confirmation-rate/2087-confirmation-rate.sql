# Write your MySQL query statement below
WITH CALCULATED_CONFIRMATION AS (
    SELECT user_id
        , COUNT(user_id) as total_number
        , SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_count
        , SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) / COUNT(user_id) as confirmation_rate
        FROM Confirmations
        GROUP BY user_id
)

SELECT T1.user_id
     , CONVERT(IFNULL(confirmation_rate, 0), decimal(3,2)) as confirmation_rate
    FROM Signups T1
    LEFT JOIN CALCULATED_CONFIRMATION T2
    ON T1.user_id = T2.user_id
    ;