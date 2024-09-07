import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    df_result = products[(products['low_fats'] == 'Y') & (products['recyclable'] == 'Y')]
    df_result = df_result[['product_id']]

    return df_result