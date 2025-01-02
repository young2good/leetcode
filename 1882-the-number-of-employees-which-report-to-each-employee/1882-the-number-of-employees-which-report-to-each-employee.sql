# Write your MySQL query statement below

WITH manager AS (
    SELECT distinct reports_to manager_id
        FROM Employees
        WHERE reports_to is not null
), teammember AS (
    SELECT reports_to
         , count(*) as reports_count
         , avg(age) as average_age
         FROM Employees
         WHERE reports_to is not null
         GROUP BY reports_to
)

SELECT employee_id
     , name
     , reports_count
     , round(average_age, 0) average_age
    fROM
    (
        SELECT employee_id
            , name
            FROM Employees
            WHERE 1=1
            AND employee_id in (select manager_id from manager)
    ) T1
    LEFT JOIN
    (
        SELECT *
            FROM teammember
    ) T2
    ON T1.employee_id = T2.reports_to
    ORDER BY 1