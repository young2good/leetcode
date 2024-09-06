# Write your MySQL query statement below

-- SELECT id as Id
--     FROM
--     (
--         SELECT *
--             , lag(temperature) over(order by recordDate) as prev_temp
--             FROM Weather
--     ) T
--     WHERE 1=1
--       AND temperature > prev_temp
--     ;
SELECT T1.id as Id
    FROM
    (
        SELECT *
            FROM Weather
    ) T1
    LEFT JOIN
    (
        SELECT *
            , date_add(recordDate, interval 1 day) as add_1
            FROM Weather
    ) T2
    ON T1.recordDate = T2.add_1
    WHERE 1=1
      AND T1.temperature > T2.temperature
    ;