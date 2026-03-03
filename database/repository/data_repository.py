from database import connection_factory as cf

def get_data(table_name):
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
            cursor.execute(f"SELECT * FROM {table_name}")
            return cursor.fetchall()