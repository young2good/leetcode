SELECT T.student_id
     , student_name
     , T.subject_name
     , IFNULL(attended_exams, 0) as attended_exams
    FROM 
    (
        SELECT *
            FROM Students T1
            JOIN Subjects T2
    ) T
    LEFT JOIN
    (
        SELECT student_id
            , subject_name
            , count(*) as attended_exams
            FROM Examinations
            GROUP BY student_id, subject_name
    ) TT
    ON T.student_id = TT.student_id
    AND T.subject_name = TT.subject_name
    ORDER BY T.student_id, T.subject_name