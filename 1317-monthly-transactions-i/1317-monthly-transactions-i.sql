# Write your MySQL query statement below

-- SELECT concat(YEAR(trans_date), '-', case when MONTH(trans_date) < 10 then concat(0,MONTH(trans_date))else MONTH(trans_date) end) 'month'
SELECT date_format(trans_date, '%Y-%m') 'month'
-- SELECT concat(YEAR(trans_date), '-', LPAD(MONTH(trans_date), 2, 0)) 'month'
     , country
     , count(*) trans_count
     , sum(case when state = 'approved' then 1 else 0 end) approved_count
     , sum(amount) trans_total_amount
     , sum(case when state = 'approved' then amount else 0 end) approved_total_amount
    FROM Transactions
    GROUP BY concat(YEAR(trans_date), '-', LPAD(MONTH(trans_date), 2, 0)), country
    ;