# Write your MySQL query statement below
SELECT left(trans_date, 7) as month
     , country
     , count(*) as trans_count
     , sum(case when state = 'approved' then 1 else 0 end) as approved_count
     , sum(amount) as trans_total_amount
     , ifnull(sum(case when state = 'approved' then amount end), 0) as approved_total_amount
    FROM Transactions
    GROUP BY left(trans_date, 7), country
    ;