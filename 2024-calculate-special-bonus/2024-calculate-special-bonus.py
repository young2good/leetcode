import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    df_copy = employees.copy()

    df_copy['bonus'] = df_copy.apply(lambda x : x['salary'] if (~x['name'].startswith('M')) & (mod(x['employee_id'], 2) == 1) else 0, axis =1)

    return df_copy[['employee_id', 'bonus']].sort_values('employee_id')