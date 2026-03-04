import streamlit as st
from service import screen_service as ss
from service import data_service as ds
from service import fields_service

def render_pages():
    screens = ss.get_screens()
    
    if not screens:
        st.info("Nenhuma tela configurada no momento.")
        return

    screen_dict = {screen.title: screen for screen in screens}
    
    st.sidebar.title("Navegação")
    options = ["Dashboard"] + list(screen_dict.keys())
    choice = st.sidebar.radio("Selecione a página:", options)

    if choice == "Dashboard":
        st.title("Dashboard!")
        st.write("Bem-vindo(a)! Selecione uma das opções no menu ao lado para gerenciar os dados.")
    else:
        selected_screen = screen_dict[choice]
        make_page(selected_screen)

def make_page(screen):
    st.title(screen.title)

    screen_fields = fields_service.get_screen_fields(screen.table_name)

    data = ds.get_data(screen.table_name)

    if not data:
        st.info("Nenhum registro encontrado.")

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
