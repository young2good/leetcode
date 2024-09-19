# Write your MySQL query statement below
SELECT *
    FROM Cinema
    WHERE 1=1
      AND id % 2 =1
      AND description not in ('boring')
    ORDER BY rating desc
    ;