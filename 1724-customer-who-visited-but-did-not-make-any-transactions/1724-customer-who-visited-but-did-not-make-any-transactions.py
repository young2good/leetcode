import pandas as pd

def find_customers(visits: pd.DataFrame, transactions: pd.DataFrame) -> pd.DataFrame:
    df_visit = visits
    df_trans = transactions

    df_trans = df_trans.groupby('visit_id')['transaction_id'].count()
    df_trans = df_trans.reset_index()

    df_joined = pd.merge(df_visit, df_trans, how='left', on='visit_id')

    df_filtered = df_joined[df_joined['transaction_id'].isna()]
    
    df_result = df_filtered.groupby('customer_id')['visit_id'].count().reset_index()

    df_result = df_result.rename(columns = {'visit_id':'count_no_trans'})
    df_result = df_result.sort_values('customer_id')
    return df_result
