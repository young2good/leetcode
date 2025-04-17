import pandas as pd

def article_views(views: pd.DataFrame) -> pd.DataFrame:
    df_filtered = views[views['author_id'] == views['viewer_id']]

    df_result = pd.DataFrame(df_filtered['author_id'].unique())
    df_result.columns = ['id']
    df_result = df_result.sort_values(by = 'id')
    
    return df_result
    