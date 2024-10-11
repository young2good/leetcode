# Write your MySQL query statement below

SELECT activity_date as 'day'
     , count(distinct user_id) as active_users
    FROM Activity
    WHERE 1=1
      AND activity_date > date_add('2019-07-27', interval -30 day)
    GROUP BY activity_date