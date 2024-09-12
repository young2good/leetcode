import pandas as pd

def rising_temperature(weather: pd.DataFrame) -> pd.DataFrame:
    df_next = weather
    df_next['next_dt'] = df_next['recordDate'] + pd.Timedelta(days = 1)

    df_joined = pd.merge(weather, df_next, how = 'left', left_on = 'recordDate', right_on = 'next_dt')
    df_joined = df_joined[['id_x', 'recordDate_x', 'temperature_x', 'next_dt_y', 'temperature_y']]

    df_result = df_joined[df_joined['temperature_y'] < df_joined['temperature_x']]
    df_result = df_result[['id_x']]
    df_result.columns = ['Id']

    return df_result