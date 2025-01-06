import pandas as pd

def count_unique_subjects(teacher: pd.DataFrame) -> pd.DataFrame:
    result = teacher.groupby('teacher_id', as_index = False)['subject_id'].nunique()
    result.rename(columns = {'subject_id':'cnt'}, inplace = True)
    
    return result