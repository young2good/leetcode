import pandas as pd

def project_employees_i(project: pd.DataFrame, employee: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(project, employee[['employee_id', 'experience_years']], how = 'left', on = 'employee_id')

    df_grouped = df_joined.groupby('project_id', as_index = False)['experience_years'].mean().round(2)
    df_grouped = df_grouped.rename(columns = {'experience_years':'average_years'})

    return df_grouped