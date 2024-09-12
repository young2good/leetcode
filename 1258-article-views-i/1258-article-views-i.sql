# Write your MySQL query statement below

select distinct author_id as id
    from Views
    WHERE 1=1
      AND author_id = viewer_id
    order by 1