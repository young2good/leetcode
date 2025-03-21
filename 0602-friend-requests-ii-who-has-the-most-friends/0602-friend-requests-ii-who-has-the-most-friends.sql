# Write your MySQL query statement below

WITH Request AS (
    SELECT requester_id
         , count(*) AS r_friend
        FROM RequestAccepted
        GROUP BY requester_id
), Accept AS (
    SELECT accepter_id
         , count(*) AS a_friend
        FROM RequestAccepted
        GROUP BY accepter_id
)

SELECT id
     , friend_cnt as num
    FROM
    (
SELECT id
     , r_friend + a_friend as friend_cnt
     , RANK() OVER (ORDER BY r_friend + a_friend DESC) R
     FROM
     (
    SELECT ifnull(requester_id, accepter_id) as id
        , ifnull(r_friend,0) r_friend
        , ifnull(a_friend,0) a_friend
        FROM
        (
            SELECT *
                FROM Request T1
                LEFT JOIN Accept T2
                ON T1.requester_id = T2.accepter_id
        
        UNION 

            SELECT *
                FROM Request T1
                RIGHT JOIN Accept T2
                ON T1.requester_id = T2.accepter_id
        ) T
     ) TT
    ) TTT 
    WHERE r = 1
