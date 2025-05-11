import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    df_employee = employee.copy()

    # df_employee['rank'] = df_employee['salary'].rank(ascending = False, method = 'dense')

    unique_salary = df_employee['salary'].unique()

    df_new = pd.DataFrame(unique_salary, columns=['salary'])

    df_new['rank'] = df_new['salary'].rank(ascending = False)

    if len(unique_salary) < 2:
        df_result = pd.DataFrame({'SecondHighestSalary': [None]})
    else:
        df_result = df_new[df_new['rank']==2][['salary']]

    df_result.columns = ['SecondHighestSalary']

    return df_result