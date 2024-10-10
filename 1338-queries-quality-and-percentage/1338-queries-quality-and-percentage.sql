# Write your MySQL query statement below
SELECT query_name
     , round(avg(rating / position),2) as quality
     , round(SUM(CASE WHEN rating <3 then 1 else 0 end) / COUNT(*) * 100, 2) as poor_query_percentage
    FROM Queries
    WHERE query_name is not null
    GROUP BY query_name
    
;