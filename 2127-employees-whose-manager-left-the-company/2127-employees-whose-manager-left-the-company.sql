# Write your MySQL query statement below
SELECT employee_id
    FROM Employees
    WHERE manager_id in (
                            SELECT distinct manager_id
                                FROM Employees
                                WHERE manager_id not in (select employee_id from Employees)
    ) 
      AND salary < 30000
    ORDER BY employee_id
    ;