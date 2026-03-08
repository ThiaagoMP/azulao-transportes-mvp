class ScreenFields:
    #Descrição;;obrigatorio;;front-ignore;;editavel;;visivel;;table-only;;dropdown?
    #;;[dropdown_values separado por ,];;dropdown-table;;dropdown_id_column;;dropdown_name_column
    def __init__(self, table_name: str, column_name: str, column_type: str, comment: str): 
        self.table_name = table_name
        self.column_name = column_name
        self.column_type = column_type
        self.comment = comment
        comment_split = comment.split(';;')
        self.description = comment_split[0].replace('#', '').strip()
        self.is_required = comment_split[1] == 'true'
        self.is_front_ignore = comment_split[2] == 'true'
        self.is_editable = comment_split[3] == 'true'
        self.is_visible = comment_split[4] == 'true'
        self.is_table_only = comment_split[5] == 'true'
        self.is_dropdown = comment_split[6] == 'true'
        self.dropdown_values = comment_split[7].replace('[', '').replace(']', '').split(',')if comment_split[7] != '[]' else []
        self.dropdown_table = comment_split[8] if len(comment_split) > 8 else ''
        self.dropdown_id_column = comment_split[9] if len(comment_split) > 9 else ''
        self.dropdown_name_column = comment_split[10] if len(comment_split) > 10 else ''