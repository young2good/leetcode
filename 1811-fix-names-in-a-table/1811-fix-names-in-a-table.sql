# Write your MySQL query statement below

SELECT user_id
     , CONCAT(UPPER(left(name,1)), LOWER(mid(name,2))) as name
    FROM Users
    ORDER BY user_id