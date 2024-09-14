# Write your MySQL query statement below
SELECT user_id
     , concat(upper(left(name,1)), lower(substring(name from 2))) as name
    FROM Users
    order by user_id