import pandas as pd

def trips_and_users(trips: pd.DataFrame, users: pd.DataFrame) -> pd.DataFrame:
    trips = trips[(trips['request_at'] <= '2013-10-03') & (trips['request_at'] >= '2013-10-01')]
    
    df_banned_client = users[(users['banned'] == 'Yes') & (users['role'] == 'client')]
    df_banned_driver = users[(users['banned'] == 'Yes') & (users['role'] == 'driver')]

    ls_banned_client = list(df_banned_client.users_id)
    ls_banned_driver = list(df_banned_driver.users_id)
    df_filtered_trip = trips[(~trips['client_id'].isin(ls_banned_client))&(~trips['driver_id'].isin(ls_banned_driver))]
    df_filtered_trip['cal_col'] = df_filtered_trip['status'].apply(lambda x:1 if x != 'completed' else 0)


    df_groupped = df_filtered_trip.groupby('request_at')['cal_col'].agg(['count','sum'])
    df_groupped = df_groupped.reset_index()
    df_groupped['Cancellation Rate'] = round(df_groupped['sum'] / df_groupped['count'], 2)

    df_result = df_groupped[['request_at','Cancellation Rate']]
    df_result = df_result.rename(columns = {'request_at':'Day'})

    return df_result