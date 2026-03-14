from database.repository import login_repository as lr

def check_login(email, password):
    return lr.check_login(email, password)