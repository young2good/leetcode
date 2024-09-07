import pandas as pd

def find_customer_referee(customer: pd.DataFrame) -> pd.DataFrame:
    df_result = customer[(customer['referee_id'] != 2) | (customer['referee_id'].isna())]
    df_result = df_result[['name']]

    return df_result