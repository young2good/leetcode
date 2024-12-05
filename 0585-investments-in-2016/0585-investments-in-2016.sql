# Write your MySQL query statement below
SELECT round(SUM(tiv_2016),2) tiv_2016
    FROM Insurance
    WHERE (lat, lon) in (
                            SELECT lat
                                , lon
                                FROM Insurance
                                GROUP BY lat, lon
                                HAVING count(*) = 1
    )
      AND tiv_2015 in (select tiv_2015
                            FROM Insurance
                            GROUP BY tiv_2015
                            HAVING count(*)>=2)
    ;