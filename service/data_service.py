from database.repository import data_repository

def get_data(table_name):
    return data_repository.get_data(table_name)