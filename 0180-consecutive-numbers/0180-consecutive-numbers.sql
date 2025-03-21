# Write your MySQL query statement below
-- SELECT distinct num as ConsecutiveNums
--     FROM
--     (
--         SELECT *
--             , lead(num) over (order by id) as next_num
--             , lead(num, 2) over (order by id) last_num
--             FROM Logs
--     ) T
--     WHERE num = next_num
--       AND num = last_num

SELECT *
     , last_VALUE(id) over(order by num)
    FROM Logs
