from database import connection_factory as cf


def get_tables():
    tables_name = dict()
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
            cursor.execute("""
                           SELECT c.relname              AS tabela,
                                  obj_description(c.oid) AS comentario
                           FROM pg_class c
                           WHERE c.relkind = 'r'
                             AND c.relnamespace = 'public'::regnamespace
                           ORDER BY c.relname;
                           """)
            for f in cursor.fetchall():
                tables_name[f[0]] = f[1]

    return tables_name
