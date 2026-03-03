import streamlit as st
import screen_service as ss
from service import fields_service

def render_pages():
    screens = ss.get_screens()
    for screen in screens:
        make_page(screen)

def make_page(screen):
    st.title(screen.title)

    screen_fields = fields_service.get_screen_fields(screen.table_name)

    try:
        data = get_data(screen.table_name)
    except NameError:
        data = []

    if not data:
        st.info("Nenhum registro encontrado.")
        return

    for row in data:
        with st.expander(f"Registro #{row.get('id', '?')}"):
            for field in screen_fields:
                if field.is_front_ignore or not field.is_visible:
                    continue
                
                label = field.description if field.description else field.column_name
                value = row.get(field.column_name)
                
                widget_key = f"{screen.table_name}_{row.get('id', '?')}_{field.column_name}"
                
                if field.is_dropdown:
                    options = field.dropdown_values if field.dropdown_values else [""]
                    try:
                        index = options.index(value) if value in options else 0
                    except ValueError:
                        index = 0
                        
                    st.selectbox(
                        label=label,
                        options=options,
                        index=index,
                        key=widget_key,
                        disabled=not field.is_editable,
                    )
                else:
                    st.text_input(
                        label=label,
                        value=str(value) if value is not None else "",
                        key=widget_key,
                        disabled=not field.is_editable,
                    )

    return
