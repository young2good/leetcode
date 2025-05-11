import pandas as pd

def nth_highest_salary(employee: pd.DataFrame, N: int) -> pd.DataFrame:
    df_employee = employee.copy()

    unique_salary = df_employee['salary'].sort_values(ascending = False).unique()

    if len(unique_salary) < N:
        result = None
    elif N <= 0:
        result = None
    else:
        result = unique_salary[N-1]

    df_result = pd.DataFrame([result])
    
    df_result.columns = [f"getNthHighestSalary({N})"]
    return df_result
    # return pd.DataFrame([len(unique_salary)])