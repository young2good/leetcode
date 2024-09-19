import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:
    df_employees = employees
    df_employees['diff'] = df_employees['out_time'] - df_employees['in_time']
    df_grouped = df_employees.groupby(['emp_id','event_day'])['diff'].sum()
    df_grouped = df_grouped.reset_index()

    df_result = df_grouped[['event_day', 'emp_id','diff']]
    df_result.columns = ['day','emp_id','total_time']

    return df_result