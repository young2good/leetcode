import pandas as pd

def order_scores(scores: pd.DataFrame) -> pd.DataFrame:
    scores['rank'] = scores['score'].rank(method = 'dense', ascending = False)
    scores.sort_values('score', ascending=False,inplace= True)
    res_score = scores[['score','rank']]
    return res_score
