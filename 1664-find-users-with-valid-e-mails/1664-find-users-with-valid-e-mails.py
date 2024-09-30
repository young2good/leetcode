import pandas as pd

def valid_emails(users: pd.DataFrame) -> pd.DataFrame:
    df_users = users
    df_users['prefix'] = df_users['mail'].apply(lambda x:x.split('@')[0])
    df_users['domain'] = df_users['mail'].apply(lambda x:x.split('@')[-1])
    df_users['is_valid'] = df_users['prefix'].apply(lambda x:x and x[0].isalpha() and all(c.isalnum() or c in ['_','.','-'] for c in x))

    df_users['at_count'] = df_users['mail'].str.count('@')
        
    df_result = df_users[(df_users['domain'] == 'leetcode.com') & (df_users['is_valid'] == True) &(df_users['at_count'] == 1)][['user_id', 'name','mail']]
    return df_result
