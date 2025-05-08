import pandas as pd

def total_time(employees: pd.DataFrame) -> pd.DataFrame:
    df = employees.copy()
    df['diff'] = df['out_time'] - df['in_time']

    df_groupped = df.groupby(['event_day','emp_id'])['diff'].sum().reset_index()

    df_groupped.columns = ['day', 'emp_id', 'total_time']

    df_groupped = df_groupped.sort_values('emp_id', ascending = True)
    return df_groupped
