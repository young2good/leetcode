import pandas as pd

def find_managers(employee: pd.DataFrame) -> pd.DataFrame:
    df_grouped = employee.groupby('managerId')['id'].count().reset_index()
    
    df_filtered = df_grouped[df_grouped['id']>=5]

    df_merged = pd.merge(df_filtered, employee, how = 'inner', left_on = 'managerId', right_on = 'id')

    df_result = df_merged[['name']]

    return df_result