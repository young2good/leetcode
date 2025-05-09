import pandas as pd

def replace_employee_id(employees: pd.DataFrame, employee_uni: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(employees, employee_uni, how = 'left', on = 'id')

    return df_joined[['unique_id', 'name']]