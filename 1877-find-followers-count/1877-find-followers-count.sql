# Write your MySQL query statement below

SELECT user_id
     , count(follower_id) as followers_count
    FROM Followers
    GROUP BY user_id
    ORDER BY 1 ASC