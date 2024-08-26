# Write your MySQL query statement below
SELECT name as 'Employee'
    FROM 
    (
        SELECT T1.*
             , T2.salary as manager_salary
            FROM Employee T1
            LEFT JOIN Employee T2
            ON T1.managerId = T2.id
    ) T
    WHERE 1=1
      AND salary > manager_salary
;    
