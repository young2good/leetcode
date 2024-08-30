import pandas as pd

def find_customers(customers: pd.DataFrame, orders: pd.DataFrame) -> pd.DataFrame:
    df_unique_orders = orders['customerId'].unique()

    customers['is_order'] = customers.apply(lambda x:1 if x['id'] in df_unique_orders else 0, axis = 1)
    df_ordered_customers = customers[customers['is_order'] == 0]

    df_result = pd.DataFrame(df_ordered_customers['name'])
    df_result.columns = ['Customers']
    return df_result