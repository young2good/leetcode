# Write your MySQL query statement below
WITH RECURSIVE RE_QUERY AS (
    SELECT 1 as num
    UNION ALL
    SELECT num + 1 as num
        FROM RE_QUERY
        WHERE num < 10
)

SELECT distinct salary AS SecondHighestSalary
    FROM
    (
        SELECT *
            FROM RE_QUERY
    ) T1
    LEFT JOIN
    (
        SELECT *
            , DENSE_RANK() OVER(ORDER BY salary DESC) as DR
            FROM Employee
    ) T2
    ON T1.num = T2.DR
    WHERE num=2
    ;