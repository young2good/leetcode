import pandas as pd

def order_scores(scores: pd.DataFrame) -> pd.DataFrame:
    df_scores = scores.copy()

    df_scores['rank'] = df_scores['score'].rank(ascending = False, method = 'dense')

    return df_scores[['score','rank']].sort_values('score', ascending = False)