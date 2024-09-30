# Write your MySQL query statement below
SELECT project_id
     , round(avg(experience_years),2) as average_years
    FROM
    (
        SELECT T1.*
             , T2.experience_years
            FROM Project T1
            LEFT JOIN Employee T2
            ON T1.employee_id = T2.employee_id
    ) T
    GROUP BY project_id
;