import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    df_employee = employee.copy()

    df_groupped = df_employee.groupby('managerId')['id'].size().reset_index(name='re')

    df_joined = df_employee.merge(df_groupped, how = 'left', left_on = 'id', right_on = 'managerId')
    
    df_filtered = df_joined[df_joined['re']>=5]
    return df_filtered[['name']]