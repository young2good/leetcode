# Write your MySQL query statement below

SELECT T1.name
     , T2.bonus
    FROM
    (
        SELECT *
            FROM Employee
    ) T1
    LEFT JOIN
    (
        SELECT *
            FROM Bonus
            WHERE 1=1
    ) T2
    ON T1.empId = T2.empId
    WHERE 1=1
      AND (T2.bonus < 1000 or T2.bonus is null)
;