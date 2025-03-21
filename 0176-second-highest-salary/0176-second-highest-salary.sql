# Write your MySQL query statement below

SELECT MAX(CASE WHEN DR = 2 THEN salary ELSE NULL END) SecondHighestSalary
    FROM
    (
        SELECT *
            , DENSE_RANK() OVER(ORDER BY salary DESC) DR
            FROM Employee
    ) T