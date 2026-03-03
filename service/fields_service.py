from database.repository import column_repository
from entities.screen_fields import ScreenFields

def get_screen_fields(table_name):
    columns = column_repository.get_table_columns()
    table_cols = columns.get(table_name, [])
    screen_fields_list = []
    
    for col in table_cols:
        if col.get('comment'):
            try:
                # ScreenFields args: table_name, column_name, column_type, comment, description, is_required, is_front_ignore, is_editable, is_visible, is_table_only, is_dropdown, dropdown_values
                sf = ScreenFields(
                    table_name=col['table_name'],
                    column_name=col['column_name'],
                    column_type=col['column_type'],
                    comment=col['comment']
                )
                screen_fields_list.append(sf)
            except IndexError:
                # Ignora campos com comentários mal formatados que não seguem o padrão esperado
                pass
                
    return screen_fields_list
