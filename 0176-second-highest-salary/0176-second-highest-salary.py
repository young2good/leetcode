import pandas as pd

def second_highest_salary(employee: pd.DataFrame) -> pd.DataFrame:
    employee['sal_rank'] = employee['salary'].rank(ascending = False, method = 'dense')

    employee['output_result'] = employee.apply(lambda x:x['salary'] if x['sal_rank'] ==2 else None, axis = 1)

    df_result = pd.DataFrame(employee[['output_result']].max(), columns = ['SecondHighestSalary'])

    return df_result