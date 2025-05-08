import pandas as pd

def game_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    df = activity.copy()

    df.rename(columns ={'event_date':'first_login'}, inplace = True)

    df_groupped = df.groupby('player_id')['first_login'].min().reset_index()


    return df_groupped