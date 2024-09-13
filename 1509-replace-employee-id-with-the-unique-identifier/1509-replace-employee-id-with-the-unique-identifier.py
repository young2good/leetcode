import pandas as pd

def replace_employee_id(employees: pd.DataFrame, employee_uni: pd.DataFrame) -> pd.DataFrame:
    df_merged = pd.merge(employees, employee_uni, how = 'left', on ='id')

    df_result = df_merged[['unique_id','name']]
    return df_result
    