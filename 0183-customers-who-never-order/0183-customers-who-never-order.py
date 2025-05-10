import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    groupped_order = orders.groupby('customerId').size().reset_index(name ='order_cnt')

    df_joined = pd.merge(customers, groupped_order, left_on ='id', how ='left', right_on = 'customerId')

    df_joined = df_joined.rename(columns ={'name' : 'Customers'})
    return df_joined[df_joined['order_cnt'].isna()][['Customers']]
