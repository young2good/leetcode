# Write your MySQL query statement below
WITH main_d AS (
    SELECT employee_id
         , department_id
        FROM Employee
        WHERE primary_flag = 'Y'
), only_d AS (
    SELECT employee_id
         , department_id
        FROM Employee
        WHERE employee_id in (
                                SELECT employee_id
                                    FROM Employee
                                    GROUP BY  employee_id
                                    HAVING count(department_id) = 1
        )
)

SELECT *
    FROM main_d
    UNION
select *
    from only_d