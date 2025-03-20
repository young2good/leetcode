# Write your MySQL query statement below
WITH employee_count AS (
    SELECT managerId
        , count(id) as employee_cnt
        FROM Employee
        WHERE managerId IS NOT NULL
        GROUP BY managerId
        HAVING count(id) >= 5
)

SELECT name
    FROM Employee T1
    INNER JOIN employee_count T2
    ON T1.id = T2.managerID
    ;

