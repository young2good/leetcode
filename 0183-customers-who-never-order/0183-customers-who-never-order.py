import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    order_customer = orders['customerId'].unique()

    df_result = customers[~customers['id'].isin(order_customer)]
    df_result = df_result[['name']].rename(columns ={'name':'Customers'})
    return df_result