# Write your MySQL query statement below

with tot_users AS (
    SELECT COUNT(distinct user_id) as users
        FROM Users
) 

SELECT contest_id
     , round(count(distinct user_id) / min(users) * 100, 2) as percentage
    FROM Register T1
    JOIN tot_users T2
    GROUP BY contest_id
    ORDER BY 2 desc, 1 asc
    ;