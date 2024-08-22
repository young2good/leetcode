/* Write your T-SQL query statement below */

-- WITH client_table AS (
--     SELECT *
--         FROM 
--         (
--             SELECT id, client_id, city_id, status, request_at, banned, role
--                 FROM Trips T1
--                 LEFT JOIN Users T2
--                 ON T1.client_id = T2.users_id
                
--         ) T
--         WHERE 1=1
--           AND banned = 'No'
--           AND request_at between '2013-10-01' and '2013-10-03'
-- )

-- SELECT request_at as Day
--      , round(sum(case when status <> 'completed' then 1 else 0 end)*1.0 / count(*), 2) as [Cancellation Rate]
--     FROM client_table
--     WHERE 1=1
--     GROUP BY request_at
--     ORDER BY 1
-- ;

select request_at day
        ,round(sum(case when status = 'cancelled_by_driver' or status = 'cancelled_by_client' then 1 else 0 end)
         / (count(id) * 1.00),2) 'Cancellation Rate'
  from Trips t 
 where request_at between '2013-10-01' and '2013-10-03'
   and client_id in (select users_id from Users where banned = 'No')
   and driver_id in  (select users_id  from Users where banned = 'No')
group by request_at




    