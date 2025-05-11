import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:
    df_users = users.copy()

    df_users['name'] = df_users['name'].str.capitalize()

    return df_users.sort_values('user_id')