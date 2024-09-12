import pandas as pd

def consecutive_numbers(logs: pd.DataFrame) -> pd.DataFrame:
    df_logs = logs
    df_logs['lead_number'] = df_logs['num'].shift(1)
    df_logs['lag_number'] = df_logs['num'].shift(-1)

    df_result = df_logs[(df_logs['num'] == df_logs['lead_number']) & (df_logs['num'] == df_logs['lag_number']) & (df_logs['lag_number'] == df_logs['lead_number'])]['num'].unique()
    df_result = pd.DataFrame(df_result)
    df_result.columns = ['ConsecutiveNums']
    return df_result