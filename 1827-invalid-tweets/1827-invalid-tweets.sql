# Write your MySQL query statement below

select tweet_id
    from
    (
        select *
            , length(content) as len
            from Tweets
    ) T
    WHERE 1=1
      AND len > 15
    ;