# Write your MySQL query statement below
WITH del_con AS (
    SELECT *
         , row_number() over (partition by email order by id) as rn
        FROM Person
)

DELETE FROM Person
    WHERE 1=1
      AND id in (select id
                    from del_con
                    where 1=1
                      and rn <> 1
                    )
    ;
