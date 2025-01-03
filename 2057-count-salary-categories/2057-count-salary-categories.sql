# Write your MySQL query statement below
WITH categories AS (
    SELECT 'Low Salary' as category
    UNION
    SELECT 'Average Salary' as category
    UNION
    SELECT 'High Salary' as category
)

SELECT T1.category
     , ifnull(T2.accounts_count,0) as accounts_count
    FROM
    (
        select *
            from categories
    ) T1
    LEFT JOIN
    (
        SELECT category
            , count(account_id) as accounts_count
            FROM
            (
                SELECT *
                    , CASE WHEN income < 20000 then 'Low Salary'
                            WHEN income >= 20000 and income <=50000 then 'Average Salary'
                            WHEN income > 50000 then 'High Salary'
                            ELSE 0 END as  category
                    FROM Accounts
            ) T
            GROUP BY category
    ) T2
    ON T1.category = T2.category
     ;