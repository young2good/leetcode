/* Write your T-SQL query statement below */

SELECT email
    FROM Person
    GROUP BY email
    HAVING count(*) >=2
;