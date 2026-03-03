class ScreenFields:
    #Descrição;;obrigatorio;;front-ignore;;editavel;;visivel;;table-only;;dropdown?;;[dropdown_values separado por ,]
    def __init__(self, table_name: str, column_name: str, column_type: str, comment: str): 
        self.table_name = table_name
        self.column_name = column_name
        self.column_type = column_type
        self.comment = comment
        self.description = comment.split(';;')[0].replace('#', '').strip()
        self.is_required = comment.split(';;')[1] == 'true'
        self.is_front_ignore = comment.split(';;')[2] == 'true'
        self.is_editable = comment.split(';;')[3] == 'true'
        self.is_visible = comment.split(';;')[4] == 'true'
        self.is_table_only = comment.split(';;')[5] == 'true'
        self.is_dropdown = comment.split(';;')[6] == 'true'
        self.dropdown_values = comment.split(';;')[7].split(',') if comment.split(';;')[7] != '[]' else []
