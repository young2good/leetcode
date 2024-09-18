import pandas as pd

def employee_bonus(employee: pd.DataFrame, bonus: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(employee, bonus, how = 'left', on ='empId')
    df_filtered = df_joined[(df_joined['bonus'] < 1000) |(df_joined['bonus'].isna())][['name','bonus']]
    return df_filtered