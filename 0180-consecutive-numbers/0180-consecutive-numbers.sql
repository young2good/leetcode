# Write your MySQL query statement below

SELECT distinct num as ConsecutiveNums
    FROM
    (
        SELECT *
            , lead(num) over (order by id) as next_num
            , lag(num) over (order by id) as last_num
            FROM Logs
    ) T
    WHERE num = next_num 
      AND num = last_num