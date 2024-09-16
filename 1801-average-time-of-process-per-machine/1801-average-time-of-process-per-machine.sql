# Write your MySQL query statement below
SELECT machine_id
     , round(avg(diff_dt),3) as processing_time
    FROM
    (
        SELECT machine_id
            , process_id
            , end_dt - start_dt as diff_dt
            FROM
            (
                SELECT machine_id
                    , process_id
                    , max(CASE WHEN activity_type = 'start' then timestamp end) as start_dt
                    , MAX(CASE WHEN activity_type = 'end' then timestamp end) as end_dt
                    FROM Activity
                    GROUP BY machine_id, process_id
            ) T
    ) K
    GROUP BY machine_id
    limit 10
