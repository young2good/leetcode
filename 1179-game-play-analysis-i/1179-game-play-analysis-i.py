import pandas as pd

def game_analysis(activity: pd.DataFrame) -> pd.DataFrame:
    df_first_login = activity[['player_id','event_date']].groupby('player_id').min()
    df_first_login = df_first_login.reset_index()

    df_first_login = df_first_login.rename(columns = {
        'event_date' : 'first_login'
    })


    return(df_first_login)