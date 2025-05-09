import pandas as pd

def students_and_examinations(students: pd.DataFrame, subjects: pd.DataFrame, examinations: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(students, subjects, how = 'cross')

    df_groupped = examinations.groupby(['student_id', 'subject_name']).size().reset_index(name = 'attended_exams')

    df_result = df_joined.merge(df_groupped, how = 'left', on = ['student_id','subject_name'])
    df_result['attended_exams'] = df_result['attended_exams'].fillna(0)

    return df_result.sort_values(['student_id','subject_name'])