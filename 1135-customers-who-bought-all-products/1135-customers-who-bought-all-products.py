import pandas as pd

def find_customers(customer: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    product_cnt = product.nunique()

    customer_product_cnt = pd.DataFrame(customer.groupby('customer_id')['product_key'].nunique())
    customer_product_cnt = customer_product_cnt.reset_index()

    df_result = pd.DataFrame(customer_product_cnt[customer_product_cnt['product_key'] == product_cnt['product_key']]['customer_id'])
    return df_result

    