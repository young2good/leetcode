# Write your MySQL query statement below
SELECT T1.user_id
     , round(IFNULL(T2.confirmation_rate,0),2) as confirmation_rate
    FROM
    (
        SELECT *
            FROM Signups
    ) T1
    LEFT JOIN
    (
        SELECT user_id
            , sum(CASE WHEN action = 'confirmed' then 1 else 0 end) / count(*) as confirmation_rate
            FROM Confirmations
            WHERE 1=1
            GROUP BY user_id
    ) T2
    ON T1.user_id = T2.user_id
    
;