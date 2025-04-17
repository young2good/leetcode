import pandas as pd

def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    df_filtered =users.copy()
    df_filtered['prefix'] = users['mail'].str.split('@').str[0]
    df_filtered['domain'] = users['mail'].str.split('@').str[1]

    df_filtered['is_valid'] = df_filtered['prefix'].apply(
        lambda x: all([
            i.isalnum() or i =='_' or i == '-' or i =='.'
            for i in x
            ]) and x[0].isalpha()
    )

    df_result = df_filtered[
        (df_filtered['domain'] == 'leetcode.com') &
        (df_filtered['is_valid'])
        ]
    return df_result[['user_id','name','mail']]