from database.repository import data_repository

def get_data(table_name):
    return data_repository.get_data(table_name)
    
def insert_data(table_name, data_dict):
    return data_repository.insert_data(table_name, data_dict)
    
def update_data(table_name, id_column, record_id, data_dict):
    return data_repository.update_data(table_name, id_column, record_id, data_dict)
    
def delete_data(table_name, id_column, record_id):
    return data_repository.delete_data(table_name, id_column, record_id)