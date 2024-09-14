import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:
    df_result = users
    df_result['name'] = df_result['name'].str.capitalize()

    df_result = df_result.sort_values('user_id')

    return df_result