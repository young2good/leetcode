# Write your MySQL query statement below
SELECT name
    FROM Customer
    WHERE 1=1
      AND (referee_id <> 2
      OR referee_id is null)
    ;