# Write your MySQL query statement below

WITH requested AS (
    SELECT requester_id
         , count(*) as requested_cnt
         FROM RequestAccepted
         GROUP BY requester_id
), accepted AS (
    SELECT accepter_id
         , count(*) as accepted_cnt
         FROM RequestAccepted
         GROUP BY accepter_id
)
SELECT *
    FROM
    (
        SELECT IFNULL(requester_id, accepter_id) as id
            , IFNULL(requested_cnt,0) + IFNULL(accepted_cnt,0) as num
            FROM
            (
                SELECT *
                    FROM requested T1
                    LEFT JOIN accepted T2
                    ON T1.requester_id = T2.accepter_id

                UNION

                SELECT *
                    FROM requested T1
                    RIGHT JOIN accepted T2
                    ON T1.requester_id = T2.accepter_id
            ) T
    ) T2
    ORDER BY num DESC
    LIMIT 1
    ;