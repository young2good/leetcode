/* Write your T-SQL query statement below */

with employee_salary as (
        Select T1.*
            , T2.name as department_name
            from Employee T1
            LEFT JOIN Department T2
            ON T1.departmentId = T2.id
)

select T2.department_name as Department
     , T2.name as Employee
     , T2. salary as Salary
    from
    (
        select department_name 
            , max(Salary) as max_salary
            FROM employee_salary
            GROUP BY department_name
    ) T1
    LEFT JOIN
    (
        SELECT *
            from employee_salary
    ) T2
    ON T1.department_name = T2.department_name
    AND T1.max_salary = T2.Salary
;