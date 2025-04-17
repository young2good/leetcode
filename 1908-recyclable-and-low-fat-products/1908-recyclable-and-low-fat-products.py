import pandas as pd

def find_products(products: pd.DataFrame) -> pd.DataFrame:
    df_result = products[
        (products['low_fats'] == 'Y') & 
        (products['recyclable'] == 'Y')
        ]

    return df_result[['product_id']]
    