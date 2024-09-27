import pandas as pd

def confirmation_rate(signups: pd.DataFrame, confirmations: pd.DataFrame) -> pd.DataFrame:
    df_confirm = confirmations
    df_confirm['is_action'] = df_confirm.apply(lambda x:1 if x.action == 'confirmed' else 0, axis = 1)
    df_grouped = df_confirm.groupby('user_id')['is_action'].agg(['count', 'sum'])
    df_grouped = df_grouped.reset_index()

    df_grouped['rate'] = round(df_grouped['sum'] / df_grouped['count'],2)
    
    df_joined = pd.merge(signups, df_grouped, how = 'left', on = 'user_id')
    df_joined = df_joined.fillna(0)

    df_result = df_joined[['user_id','rate']]
    df_result.columns = ['user_id', 'confirmation_rate']
    return df_result