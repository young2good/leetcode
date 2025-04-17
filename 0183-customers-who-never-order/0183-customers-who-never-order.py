import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df_order_cnt = orders.groupby('customerId')['id'].count().reset_index()
    df_order_cnt.columns =['customerId','order_cnt']

    df_is_order = customers.merge(df_order_cnt, how = 'left', left_on = 'id', right_on = 'customerId').fillna(0)
    
    df_result = df_is_order[df_is_order['order_cnt']==0]
    df_result = df_result[['name']]

    df_result.columns = ['Customers']
    return df_result