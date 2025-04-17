import pandas as pd

def fix_names(users: pd.DataFrame) -> pd.DataFrame:
    # users['name'] = users['name'].apply(lambda x:x[0].upper() + x[1:].lower() )
    # return users.sort_values('user_id')

    users['name'] = users['name'].str.capitalize()
    return users.sort_values('user_id')