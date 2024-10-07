import pandas as pd

def game_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    df_grouped = activity.groupby('player_id', as_index = False)['event_date'].min()
    # df_grouped = df_grouped.reset_index()

    df_grouped  = df_grouped.rename(columns = {'event_date':'first_login'})
    return df_grouped