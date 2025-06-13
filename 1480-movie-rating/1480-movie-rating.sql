# Write your MySQL query statement below

WITH theusers as (
        SELECT name
            FROM 
            (
                SELECT *
                    FROM Users
            ) T1
            LEFT JOIN 
            (
                SELECT user_id
                    , count(*) as rated_count
                    FROM MovieRating
                    GROUP BY user_id
            ) T2
            ON T1.user_id = T2.user_id
            ORDER BY rated_count desc, name asc
            LIMIT 1
), themovie as (
    SELECT title
        FROM 
        (   
            SELECT *
                FROM Movies 
        ) K1
        LEFT JOIN 
        (
            SELECT movie_id
                 , avg(rating) avg_rating
                FROM MovieRating
                WHERE 1=1
                  AND created_at>='2020-02-01'
                  AND created_at <'2020-03-01'
                GROUP BY movie_id
        ) K2
        ON K1.movie_id = K2.movie_id
        ORDER BY avg_rating DESC, title ASC
        LIMIT 1
)

SELECT name as results
    FROM theusers
    UNION ALL
SELECT title as results
    FROM themovie
    ;