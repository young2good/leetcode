import pandas as pd

def find_employees(employee: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(employee, employee, how = 'left', left_on = 'managerId', right_on = 'id')
    df_joined = df_joined[['id_x', 'name_x', 'salary_x', 'managerId_x', 'salary_y']]
    df_joined.columns = ['id', 'Employee','salary','managerId','manager_salary']

    df_result = df_joined[df_joined['salary'] > df_joined['manager_salary']]
    return df_result[['Employee']]
    