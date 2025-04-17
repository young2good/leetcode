import pandas as pd

def big_countries(world: pd.DataFrame) -> pd.DataFrame:
    df_world = world
    df_filtered = df_world[
        (df_world['area'] >= 3000000) |
        (df_world['population']>= 25000000)
    ]

    df_result = df_filtered[['name','population','area']]
    return df_result