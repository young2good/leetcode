import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(employee, department, how ='left', left_on = 'departmentId', right_on = 'id')
    max_sal = df_joined.groupby('name_y')['salary'].max().reset_index()

    new_df_joined = pd.merge(df_joined, max_sal,how='left', on = 'name_y')
    res_df = new_df_joined[new_df_joined['salary_x'] ==new_df_joined['salary_y']][['name_y','name_x','salary_y']]
    res_df.columns = ['Department', 'Employee', 'Salary']

    return res_df
    