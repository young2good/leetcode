# Write your MySQL query statement below

SELECT *
     , CASE WHEN x > y and x > z and x < y+z then 'Yes'
            WHEN y > x and y > z and y < x+z then 'Yes'
            WHEN z > x and z > y AND z < x+y then 'Yes' 
            WHEN x = y AND x + y > z then 'Yes' 
            WHEN x = z AND x + z > y then 'Yes'
            WHEN y = z and y + z > x then 'Yes'
            WHEN x = y and x = z and y = z then 'Yes'
            ELSE 'No' END as triangle
    FROM Triangle