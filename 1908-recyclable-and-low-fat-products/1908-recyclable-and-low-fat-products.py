import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    df_filtered = products[(products['low_fats']=='Y')&(products['recyclable']=='Y')]

    df_result = df_filtered[['product_id']]

    return df_result