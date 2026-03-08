from database.repository import tables_repository
from entities.screen import Screen


def get_screens():
    tables_name = tables_repository.get_tables()
    screens = []
    for table_name, comment in tables_name.items():
        if comment.startswith("#Relacionamento"):
            continue
        comment = comment.split(';;')
        screens.append(Screen(table_name, comment[0].replace('#', '').strip(), comment[1] == 'true', int(comment[2])))
    screens.sort(key=lambda x: x.order)
    return screens
