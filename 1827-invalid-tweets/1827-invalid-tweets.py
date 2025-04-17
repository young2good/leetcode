import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    df_tweets = tweets

    df_tweets['con_len'] = df_tweets.apply(lambda x: len(x.content), axis =1)
    df_result = df_tweets[df_tweets['con_len']>15]

    return df_result[['tweet_id']]