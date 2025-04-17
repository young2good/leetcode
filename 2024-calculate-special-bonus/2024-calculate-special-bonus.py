import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    employees['bonus'] = employees.loc[(employees['employee_id'] % 2 == 1) & (~employees['name'].str.startswith('M')), 'salary']
    employees['bonus'] = employees['bonus'].fillna(0)
    
    return employees[['employee_id','bonus']].sort_values('employee_id')