/* Write your T-SQL query statement below */

with len_logs as (
    select max(id) as len_log
        from Logs
), 
con_num AS(
    select 0 as new_id
    UNION ALL
    select new_id + 1
        FROM con_num
        WHERE 1=1
          and new_id < (select len_log from len_logs)
    
)


select distinct num as ConsecutiveNums
    FROM
    (
        SELECT *
            , case when num <> isnull(lead(num) over (order by new_id), 0) then 1 else 0 end as is_diff
            , case when num <> isnull(lag(num) over (order by new_id), 0) then 1 else 0 end as is_diff2
            FROM
            ( 
                SELECT id
                    , num
                    , new_id
                FROM con_num T1
                LEFT JOIN Logs T2
                ON T1.new_id = T2.id 
            ) T
   ) K
   WHERE 1=1
     AND is_diff =0
     AND is_diff2 = 0 
     AND num is not null

OPTION (MAXRECURSION 1000)
    ;