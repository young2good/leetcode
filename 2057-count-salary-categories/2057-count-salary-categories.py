import pandas as pd

def count_salary_categories(accounts: pd.DataFrame) -> pd.DataFrame:
    df_accounts = accounts.copy()

    df_category = pd.DataFrame({
        'category' : ['Low Salary', 'Average Salary', 'High Salary']
        })

    df_accounts['category'] = df_accounts['income'].apply(
        lambda x : 'Low Salary' if x < 20000 else
        'Average Salary' if x <= 50000 else 'High Salary')

    df_groupped = df_accounts.groupby('category')['account_id'].size().reset_index(name = 'accounts_count')

    df_result = df_category.merge(df_groupped, how = 'left', on = 'category')
    df_result = df_result.fillna(0)
    df_result = df_result.sort_values('accounts_count', ascending = False)

    return df_result