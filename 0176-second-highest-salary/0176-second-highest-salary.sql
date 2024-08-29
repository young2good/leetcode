/* Write your T-SQL query statement below */
select max(CASE WHEN sal_rank = 2 then salary else NULL end) as SecondHighestSalary
    from
    (
        select *
            , dense_rank() over (order by salary desc) as sal_rank
            from Employee
    ) T
    
;
