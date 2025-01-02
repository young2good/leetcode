# Write your MySQL query statement below
select max(num) as num
    from
    (
        SELECT num
            --  , count(*) as num_cnt
            FROM MyNumbers
            GROUP BY num
            HAVING count(*) = 1
    ) T
    ;