import pandas as pd

def project_employees_i(project: pd.DataFrame, employee: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(project, employee, how = 'left', on = 'employee_id')

    df_grouped = df_joined.groupby('project_id')['experience_years'].mean()
    df_grouped = df_grouped.reset_index()

    df_grouped['experience_years'] = df_grouped['experience_years'].round(2)

    df_grouped = df_grouped.rename(columns = {'experience_years':'average_years'})

    return df_grouped