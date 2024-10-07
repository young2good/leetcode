-- Register 테이블에서 퍼센트를 계산하는 서브쿼리 방식 사용
SELECT 
    contest_id, 
    ROUND(COUNT(DISTINCT user_id) / (SELECT COUNT(DISTINCT user_id) FROM Users) * 100, 2) AS percentage
FROM 
    Register
GROUP BY 
    contest_id
ORDER BY 
    percentage DESC, 
    contest_id ASC;
