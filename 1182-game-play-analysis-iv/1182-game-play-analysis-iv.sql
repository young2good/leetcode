# Write your MySQL query statement below

SELECT round(sum(case when next_day is not null then 1 else 0 end)/ count(distinct T.player_id),2) fraction
    FROM
-- SELECT T.*
--      , T2.next_day
--      FROM
    (
        SELECT *
            FROM Activity
    ) T
    LEFT JOIN
    (
        SELECT *
             , date_add(event_date, INTERVAL 1 DAY) as next_day
            FROM Activity
            WHERE (player_id, event_date) in (
                SELECT player_id
                     , min(event_date) as first_date
                     FROM Activity
                     GROUP BY player_id
            )
    ) T2
    ON T.event_date = T2.next_day
    AND T.player_id = T2.player_id
    