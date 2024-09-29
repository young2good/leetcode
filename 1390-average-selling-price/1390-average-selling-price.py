import pandas as pd

def average_selling_price(prices: pd.DataFrame, units_sold: pd.DataFrame) -> pd.DataFrame:
    df_joined = pd.merge(prices, units_sold, on = 'product_id', how = 'left')

    df_filtered  = df_joined[((df_joined['start_date']<=df_joined['purchase_date'])&(df_joined['end_date']>=df_joined['purchase_date']))|df_joined['purchase_date'].isna()]

    df_filtered['tot'] = df_filtered['price'] * df_filtered['units']
    # df_filtered = df_filtered.fillna(0)

    df_grouped = df_filtered.groupby('product_id').agg({'tot':'sum', 'units':'sum'})
    df_grouped = df_grouped.reset_index()

    df_grouped['average_price'] = round(df_grouped['tot'] / df_grouped['units'],2)
    df_grouped= df_grouped.fillna(0, axis = 1)

    df_result = df_grouped[['product_id', 'average_price']]

    return df_result
    