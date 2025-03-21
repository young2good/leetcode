# Write your MySQL query statement below
SELECT distinct num as ConsecutiveNums
    FROM
    (
        SELECT *
            , LEAD(num) OVER (ORDER BY ID) L
            , LAG(num) OVER (ORDER BY ID) LL
            FROM Logs
    ) T
    WHERE num = L
      AND L = LL

      ;