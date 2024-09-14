# Write your MySQL query statement below
SELECT customer_id
     , sum(case when trans_cnt is null then 1 else 0 end) as count_no_trans
    FROM
    (
        SELECT *
            FROM Visits
    ) T1
    LEFT JOIN
    (
        SELECT visit_id
            , count(*) as trans_cnt
            FROM Transactions
            GROUP BY visit_id
    ) T2
    ON T1.visit_id = T2.visit_id
    where 1=1
      and trans_cnt is null
    GROUP BY customer_id