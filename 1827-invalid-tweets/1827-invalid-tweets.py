import pandas as pd

def invalid_tweets(tweets: pd.DataFrame) -> pd.DataFrame:
    tweets['con_len'] = tweets['content'].apply(lambda x:len(x))

    return tweets[tweets['con_len'] > 15][['tweet_id']]