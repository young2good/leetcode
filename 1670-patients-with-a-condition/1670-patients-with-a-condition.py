import pandas as pd

def find_patients(patients: pd.DataFrame) -> pd.DataFrame:
    df_patients = patients
    df_result = df_patients[df_patients['conditions'].str.contains('(^DIAB1)|( DIAB1)')]

    return df_result