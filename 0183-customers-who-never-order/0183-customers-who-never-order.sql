/* Write your T-SQL query statement below */
SELECT name as Customers
    FROM
    (
        SELECT *
            FROM Customers
    ) T1
    LEFT JOIN
    (
        SELECT distinct customerId
            FROM Orders
    ) T2
    ON T1.id = T2.customerId
    WHERE 1=1
      AND T2.customerId is null