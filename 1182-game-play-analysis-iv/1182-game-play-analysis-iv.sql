# Write your MySQL query statement below
WITH second_date AS (
    SELECT *
         , DATE_ADD(first_date, interval 1 DAY) as second_date
         FROM
         (
            SELECT player_id
                , min(event_date) as first_date
                FROM Activity
                GROUP BY player_id
         ) T
)

SELECT convert(count(distinct T2.player_id) / count(distinct T1.player_id), decimal(3,2)) fraction
    FROM Activity T1
    LEFT JOIN second_date T2
    ON T1.player_id = T2.player_id
    AND T1.event_date = T2.second_date
    ;