# Write your MySQL query statement below
WITH last_turn AS (
        SELECT max(turn) last_turn
            FROM
            (
                SELECT *
                    , SUM(weight) OVER(ORDER BY turn) as agg_sum
                    FROM Queue
            ) T
            WHERE agg_sum<=1000
)

SELECT person_name
    FROM Queue
    WHERE turn in (select * from last_turn)
    ;