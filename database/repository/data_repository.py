from database import connection_factory as cf

def get_data(table_name):
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
            cursor.execute(f"SELECT * FROM {table_name}")
            return cursor.fetchall()

def insert_data(table_name, data_dict):
    columns = data_dict.keys()
    values = data_dict.values()
    
    col_str = ", ".join([f'"{c}"' for c in columns])
    val_placeholders = ", ".join(["%s"] * len(values))
    
    query = f"INSERT INTO {table_name} ({col_str}) VALUES ({val_placeholders})"
    
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
            cursor.execute(query, list(values))
        conn.commit()

def update_data(table_name, id_column, record_id, data_dict):
    set_clauses = [f'"{col}" = %s' for col in data_dict.keys()]
    set_str = ", ".join(set_clauses)
    
    query = f"UPDATE {table_name} SET {set_str} WHERE {id_column} = %s"
    
    values = list(data_dict.values()) + [record_id]
    
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
            cursor.execute(query, values)
        conn.commit()

def delete_data(table_name, id_column, record_id):
    query = f"DELETE FROM {table_name} WHERE {id_column} = %s"
    
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
            cursor.execute(query, [record_id])
        conn.commit()