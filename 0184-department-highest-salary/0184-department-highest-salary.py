import pandas as pd

def department_highest_salary(employee: pd.DataFrame, department: pd.DataFrame) -> pd.DataFrame:
    max_salary = employee.groupby('departmentId')['salary'].max().reset_index(name = 'max_sal')

    df_join = department.merge(max_salary, how = 'left', left_on = 'id', right_on = 'departmentId')

    df_result = df_join.merge(employee, how = 'inner', left_on =['id', 'max_sal'], right_on =['departmentId', 'salary'])
    rr = df_result[['name_x', 'name_y','salary']]
    rr.columns = ['Department', 'Employee','Salary']
    return rr