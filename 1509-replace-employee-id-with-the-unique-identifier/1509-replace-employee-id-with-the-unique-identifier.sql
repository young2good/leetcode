# Write your MySQL query statement below

SELECT unique_id, name
    FROM EmployeeUNI T1
    RIGHT JOIN Employees T2
    ON T1.id = T2.id