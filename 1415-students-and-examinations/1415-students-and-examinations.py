import pandas as pd

def students_and_examinations(students: pd.DataFrame, subjects: pd.DataFrame, examinations: pd.DataFrame) -> pd.DataFrame:
    df_student = students
    df_subject = subjects

    df_joined1 = pd.merge(df_student, df_subject, how = 'cross')    

    df_agg = examinations.groupby(['student_id','subject_name']).size()
    df_agg = df_agg.reset_index()
    df_agg.columns = ['student_id','subject_name','cnt']
    
    df_joined2 = pd.merge(df_joined1, df_agg, how = 'left', on =['student_id','subject_name'])

    df_result = df_joined2
    df_result['cnt'] = df_result['cnt'].fillna(0)

    df_result = df_result.rename(columns = {'cnt':'attended_exams'})

    df_result = df_result.sort_values(['student_id','subject_name'])

    return df_result
    