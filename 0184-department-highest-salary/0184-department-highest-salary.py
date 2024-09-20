import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    df_ranked = employee
    df_ranked['rank'] = df_ranked.groupby('departmentId')['salary'].rank(method = 'dense', ascending = False)

    df_filtered = df_ranked[df_ranked['rank']==1]

    df_merged = pd.merge(df_filtered, department, how = 'left', left_on = 'departmentId', right_on = 'id')
    
    df_result = df_merged[['name_y', 'name_x', 'salary']]
    df_result.columns = ['Department', 'Employee', 'Salary']
    return df_result