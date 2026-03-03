from database import connection_factory as cf

def get_table_columns():
    columns = dict()
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
            cursor.execute("""
                           SELECT c.relname                             AS table_name,
                                  a.attname                             AS column_name,
                                  format_type(a.atttypid, a.atttypmod)  AS column_type,
                                  col_description(a.attrelid, a.attnum) AS comment
                           FROM pg_class c
                                    JOIN pg_attribute a ON a.attrelid = c.oid
                           WHERE c.relkind = 'r'
                             AND a.attnum > 0
                             AND NOT a.attisdropped
                             AND c.relnamespace = 'public'::regnamespace
                           ORDER BY c.relname, a.attnum;
                           """)

            for table_name, column_name, column_type, comment in cursor.fetchall():
                if table_name not in columns:
                    columns[table_name] = []

                columns[table_name].append({
                    'table_name': table_name,
                    'column_name': column_name,
                    'column_type': column_type,
                    'comment': comment
                })
    #Descrição;;obrigatorio;;front-ignore;;editavel;;visivel;;table-only;;dropdown?;;[dropdown_values separado por ,]

    return columns