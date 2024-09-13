import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    df_tweets = tweets
    df_tweets['str_length'] = df_tweets['content'].apply(lambda x: len(x))

    df_result = df_tweets[df_tweets['str_length']>15][['tweet_id']]
    return df_result