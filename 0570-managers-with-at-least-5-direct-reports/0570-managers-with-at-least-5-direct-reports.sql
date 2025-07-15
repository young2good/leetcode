# Write your MySQL query statement below
SELECT name
    FROM
    (
        SELECT *
            FROM Employee
    ) T1
    LEFT JOIN 
    (
        SELECT managerId
            , count(*) as emp_cnt
            FROM Employee
            WHERE 1=1 
            AND managerId is not null
            GROUP BY managerId
    ) T2
    ON T1.id = T2.managerId
    WHERE 1=1
      AND emp_cnt>=5

    ;