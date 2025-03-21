# Write your MySQL query statement below
WITH second_date AS (
    SELECT *
         , lead(event_date) over (partition by player_id order by event_date) as next_date
         , row_number() over(partition by player_id order by event_date) as rn
        FROM Activity
)

SELECT round(sum(case when DATEDIFF(next_date, event_date) = 1 then 1 else 0 end )/ count(player_id),2) fraction
    FROM second_date
    where rn = 1
    ;