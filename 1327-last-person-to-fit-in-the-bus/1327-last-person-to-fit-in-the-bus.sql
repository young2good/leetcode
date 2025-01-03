# Write your MySQL query statement below
SELECT person_name
    FROM
    (
        SELECT *
            , SUM(weight) OVER(ORDER BY turn) as agg_sum
            FROM Queue
    ) T
    WHERE agg_sum<=1000
    ORDER BY turn DESC
    LIMIT 1
    ;