# Write your MySQL query statement below
SELECT *
     , round(amount / 7,2) as average_amount
    FROM
    (
        SELECT visited_on
            , SUM(daily_sum) OVER (ORDER BY visited_on rows BETWEEN 6 PRECEDING AND CURRENT ROW) amount
            FROM
            (
                SELECT visited_on
                    , sum(amount) as daily_sum
                    FROM Customer
                    GROUP BY visited_on
            ) T
    ) T2
    WHERE visited_on >= date_add((SELECT min(visited_on) FROM Customer), interval 6 day)
    ;