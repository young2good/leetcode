import pandas as pd

def sales_analysis(sales: pd.DataFrame, product: pd.DataFrame) -> pd.DataFrame:
    df_merged = pd.merge(sales, product, how = 'left', on ='product_id')
    
    df_result = df_merged[['product_name', 'year', 'price']]
    return df_result