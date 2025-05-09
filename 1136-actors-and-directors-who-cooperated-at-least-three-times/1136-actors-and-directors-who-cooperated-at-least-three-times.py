import pandas as pd

def actors_and_directors(actor_director: pd.DataFrame) -> pd.DataFrame:
    df_groupped = actor_director.groupby(['actor_id', 'director_id']).count().reset_index()

    df_result = df_groupped[df_groupped['timestamp']>=3]
    return df_result[['actor_id','director_id']]