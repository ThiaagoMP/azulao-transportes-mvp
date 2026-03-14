from database import connection_factory as cf

def check_login(email, password):
    with cf.connection_factory() as conn:
        with conn.cursor() as cursor:
           # TODO: Criptografar a senha
            query = "SELECT id_user FROM users WHERE email = %s AND password = %s;"
            cursor.execute(query, (email, password))
            user = cursor.fetchone()
            
            if user:
                return user[0]