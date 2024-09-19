import pandas as pd

def not_boring_movies(cinema: pd.DataFrame) -> pd.DataFrame:
    df_filtered = cinema[(cinema['id']%2 == 1)&(cinema['description'] != 'boring')]

    df_result = df_filtered.sort_values('rating', ascending = False)

    return df_result