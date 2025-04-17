import pandas as pd

def calculate_special_bonus(employees: pd.DataFrame) -> pd.DataFrame:
    bonus_employees = employees
    bonus_employees['first_character'] = bonus_employees['name'].apply(lambda x:x[0])
    bonus_employees['is_even'] = bonus_employees['employee_id'].apply(lambda x:mod(x,2))
    bonus_employees['bonus'] = bonus_employees.apply(lambda x:x.salary if (x.first_character != 'M') & (x.is_even == 1) else 0, axis = 1)
    return bonus_employees[['employee_id', 'bonus']].sort_values('employee_id')