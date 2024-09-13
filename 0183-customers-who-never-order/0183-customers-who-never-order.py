import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    ls_is_ordered = list(orders['customerId'].unique())

    customers['is_in'] = ~customers['id'].isin(ls_is_ordered)

    df_result = customers[customers['is_in'] == True]
    df_result = df_result[['name']]
    df_result.columns = ['Customers']
    return df_result