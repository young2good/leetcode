import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    df_filtered = views[views['author_id'] == views['viewer_id']]

    df_result = df_filtered.drop_duplicates(subset = 'author_id')
    df_result = df_result.rename(columns = {'author_id':'id'})

    return df_result[['id']].sort_values('id')