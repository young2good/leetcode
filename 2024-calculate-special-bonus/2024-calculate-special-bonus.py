import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    df_copy = employees.copy()

    df_copy['bonus'] = 0

    df_copy['bonus'] = df_copy[(~df_copy['name'].str.startswith('M')) & (df_copy['employee_id'] % 2 == 1)]['salary']
    df_copy = df_copy.fillna(0)


    return df_copy[['employee_id','bonus']].sort_values('employee_id')