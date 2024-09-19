# Write your MySQL query statement below
SELECT event_day as 'day'
     , emp_id
     , sum(diff) as total_time
    FROM
    (
        SELECT *
            , out_time - in_time as diff
            FROM Employees
    ) T
    GROUP BY event_day, emp_id
;