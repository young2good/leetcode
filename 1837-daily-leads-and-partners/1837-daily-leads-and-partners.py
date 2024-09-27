import pandas as pd

def daily_leads_and_partners(daily_sales: pd.DataFrame) -> pd.DataFrame:
    df_grouped = daily_sales.groupby(['date_id','make_name']).nunique()
    df_grouped = df_grouped.reset_index()

    df_grouped = df_grouped.rename(columns = {'lead_id':'unique_leads', 'partner_id':'unique_partners'})

    return df_grouped