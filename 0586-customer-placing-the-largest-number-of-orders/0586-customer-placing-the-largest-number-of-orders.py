import pandas as pd

def largest_orders(orders: pd.DataFrame) -> pd.DataFrame:
    groupped = orders.groupby('customer_number').count().reset_index()
    max_number = groupped['order_number'].max()
    result = groupped[groupped['order_number'] == max_number][['customer_number']]
    return result