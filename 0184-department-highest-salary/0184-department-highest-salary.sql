# Write your MySQL query statement below
SELECT Department
     , name as Employee
     , salary as Salary
    FROM
    (
        SELECT *
            , dense_rank() over (partition by Department ORDER BY salary desc) as dr
            FROM
            (
                SELECT T1.*
                    , T2.name as Department
                    FROM Employee T1
                    LEFT JOIN Department T2
                    ON T1.departmentId = T2.id
            ) T
    ) K
    WHERE 1=1 
      AND dr = 1
;