import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    df_employees = employees
    
    df_employees['is_odd'] = df_employees['employee_id'].apply(lambda x:True if x%2 != 0 else False)
    df_employees['start_with_m'] = df_employees['name'].apply(lambda x:True if x[0] == 'M' else False)
    df_employees['bonus'] = df_employees.apply(lambda x:x['salary'] if (x['is_odd']==True) & (x['start_with_m']==False) else 0, axis = 1)

    df_result = df_employees[['employee_id','bonus']]
    df_result = df_result.sort_values('employee_id')

    return df_result