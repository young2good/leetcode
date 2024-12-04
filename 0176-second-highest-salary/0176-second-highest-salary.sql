# Write your MySQL query statement below

WITH index_number AS (
    SELECT 1 as num 
    UNION
    SELECT 2 as num
    -- SELECT num + 1 as num
    --     FROM index_number
    --     WHERE num < 10
)

SELECT distinct salary as SecondHighestSalary
    FROM 
    (
        SELECT *
            FROM index_number
    ) T1
    LEFT JOIN
    (
        SELECT *
            , dense_rank () OVER (ORDER BY salary DESC) as r
            FROM Employee
    ) T2
    ON T1.num = T2.r
    WHERE num = 2