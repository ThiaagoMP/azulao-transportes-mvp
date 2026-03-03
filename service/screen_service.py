from database.repository import tables_repository
from entities.screen import Screen


def get_screens():
    tables_name = tables_repository.get_tables()
    screens = []
    for table_name, comment in tables_name.items():
        screens.append(Screen(table_name, comment))
    return screens
