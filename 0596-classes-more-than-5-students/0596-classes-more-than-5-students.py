import pandas as pd

def find_classes(courses: pd.DataFrame) -> pd.DataFrame:
    groupped = courses.groupby('class').count().reset_index()
    res = pd.DataFrame(groupped[groupped['student'] >=5]['class'])
    return res
