import pandas as pd

def categorize_products(activities: pd.DataFrame) -> pd.DataFrame:
    df_groupped = activities.groupby('sell_date')['product'].agg(
        num_sold = 'nunique', products = 'unique'
    ).reset_index()

    df_result = df_groupped.copy()
    df_result['products'] = df_result['products'].apply(lambda x: ','.join(sorted(x)))
       

    return df_result
