import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    df_result = world[(world['area']>=3000000) | (world['population']>=25000000)]
    df_result = df_result[['name','population','area']]
    return df_result

    