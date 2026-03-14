import streamlit as st
import pandas as pd
from service import screen_service as ss
from service import data_service as ds
from service import fields_service

def render_pages():
    screens = ss.get_screens()
    
    if not screens:
        st.info("Nenhuma tela configurada no momento.")
        return

    screen_dict = {screen.title: screen for screen in screens}
    
    options = ["Dashboard"] + [title for title, screen in sorted(screen_dict.items(), key=lambda item: item[1].order) if screen.visible]
    choice = st.sidebar.radio("Selecione a página:", options)

    if choice == "Dashboard":
        st.title("Dashboard!")
        st.write("Bem-vindo(a)! Selecione uma das opções no menu ao lado para gerenciar os dados.")
    else:
        selected_screen = screen_dict[choice]
        make_page(selected_screen)

def make_page(screen):
    if not screen.visible:
        return
    st.header(screen.title, divider="blue")

    screen_fields = fields_service.get_screen_fields(screen.table_name)
    data = ds.get_data(screen.table_name)

    table_columns = []
    for f in screen_fields:
        if f.is_front_ignore or not f.is_visible:
            continue
        table_columns.append(f.description if f.description else f.column_name)

    table_data = []
    if data:
        for row in data:
            table_row = {}
            for f in screen_fields:
                if f.is_front_ignore or not f.is_visible:
                    continue
                col_name = f.description if f.description else f.column_name
                table_row[col_name] = row.get(f.column_name)
            table_data.append(table_row)

    clean_columns = [str(col).replace('#', '').strip() for col in table_columns]
    
    clean_table_data = []
    for row in table_data:
        clean_row = {str(k).replace('#', '').strip(): v for k, v in row.items()}
        clean_table_data.append(clean_row)
        
    df = pd.DataFrame(clean_table_data, columns=clean_columns)
    
    cols_header = st.columns([8, 2])
    with cols_header[0]:
        st.markdown("### 📋 Dados Cadastrados")
    with cols_header[1]:
        if st.button("➕ Novo Registro", use_container_width=True, type="primary"):
            insert_dialog(screen.table_name, screen_fields)
    
    column_config = {}
    for col in clean_columns:
        column_config[col] = st.column_config.Column(
            label=f"🔹 {col.upper()}",
            width="medium",
            help=f"Dados referentes à coluna {col}"
        )
        
    def cor_fundo_zebrado(row):
        if row.name % 2 == 0:
            return ['background-color: rgba(30, 58, 138, 0.05)' for _ in row]
        return ['background-color: transparent' for _ in row]

    styled_df = df.style.apply(cor_fundo_zebrado, axis=1)
        
    st.dataframe(
        styled_df,
        width="stretch",
        hide_index=True,
        height=400,
        column_config=column_config
    )

    if not data:
        st.info("Nenhum registro encontrado.")
        return

    st.divider()
    st.subheader("Editar Registros")
    
    id_col_candidates = [f.column_name for f in screen_fields if f.column_name.startswith('id_')]
    primary_key_col = id_col_candidates[0] if id_col_candidates else 'id'

    for row in data:
        row_id_val = row.get(primary_key_col)
        with st.expander(f"Registro #{row_id_val}"):
            cols = st.columns(2)
            col_idx = 0
            
            edit_data = {}
            
            for field in screen_fields:
                is_pk = field.column_name == primary_key_col
                if field.is_front_ignore or (not field.is_visible and not is_pk) or field.is_table_only:
                    continue
                
                label = field.description if field.description else field.column_name
                value = row.get(field.column_name)
                
                widget_key = f"{screen.table_name}_{row_id_val}_{field.column_name}"
                if is_pk:
                    edit_data[field.column_name] = value
                    continue

                with cols[col_idx % 2]:
                    edit_data[field.column_name] = render_widget(field, value, widget_key)
                
                col_idx += 1
            
            act_cols = st.columns([7, 1.5, 1.5])
            with act_cols[1]:
                if st.button("Salvar 💾", key=f"btn_save_{screen.table_name}_{row_id_val}", use_container_width=True):
                    # Filtra dados para remover apenas o ID se tentarem alterar
                    try:
                        # Prepares the correct python types for the DB
                        update_dict = {}
                        for k, v in edit_data.items():
                            if k == primary_key_col: continue
                            # Ignoramos nullables deixados vazios
                            if v == "" or v is None: continue
                            update_dict[k] = v
                            
                        ds.update_data(screen.table_name, primary_key_col, row_id_val, update_dict)
                        st.success("Atualizado com sucesso! Recarregue a página.")
                        st.rerun()
                    except Exception as e:
                        st.error(f"Erro ao salvar: {e}")

            with act_cols[2]:
                if st.button("Excluir 🗑️", key=f"btn_del_{screen.table_name}_{row_id_val}", type="primary", use_container_width=True):
                    try:
                        ds.delete_data(screen.table_name, primary_key_col, row_id_val)
                        st.success("Removido com sucesso! Recarregue a página.")
                        st.rerun()
                    except Exception as e:
                        st.error(f"Erro: {e}")

    return

def render_widget(field, value, widget_key):
    label = field.description if field.description else field.column_name
    disabled = not field.is_editable
    col_type = field.column_type.lower() if field.column_type else "text"
    
    if field.is_dropdown:
        options = field.dropdown_values if field.dropdown_values else [""]
        try:
            index = options.index(value) if value in options else 0
        except ValueError:
            index = 0
            
        return st.selectbox(
            label=label,
            options=options,
            index=index,
            key=widget_key,
            disabled=disabled,
        )
    
    if 'boolean' in col_type:
        val_bool = bool(value) if value is not None else False
        return st.checkbox(label=label, value=val_bool, key=widget_key, disabled=disabled)
        
    elif 'date' in col_type or 'timestamp' in col_type:
        import datetime
        val_date = value if isinstance(value, (datetime.date, datetime.datetime)) else None
        if isinstance(value, str) and value:
            try:
                # Tenta formatar a data que vem do banco (Y-m-d)
                val_date = datetime.datetime.strptime(value.split(" ")[0], "%Y-%m-%d").date()
            except ValueError:
                val_date = None
        
        today = datetime.date.today()
        min_date = today.replace(year=today.year - 100)
        max_date = today.replace(year=today.year + 100)
        
        return st.date_input(
            label=label, 
            value=val_date, 
            min_value=min_date,
            max_value=max_date,
            key=widget_key, 
            disabled=disabled
        )
        
    elif 'int' in col_type: # integer, bigint, smallint
        val_int = int(value) if value is not None else 0
        return st.number_input(
            label=label, 
            value=val_int, 
            step=1, 
            key=widget_key, 
            disabled=disabled
        )
        
    elif 'numeric' in col_type or 'double' in col_type or 'real' in col_type:
        val_float = float(value) if value is not None else 0.0
        return st.number_input(
            label=label, 
            value=val_float, 
            step=0.01, 
            format="%.2f",
            key=widget_key, 
            disabled=disabled
        )
        
    else:
        return st.text_input(
            label=label,
            value=str(value) if value is not None else "",
            key=widget_key,
            disabled=disabled,
        )

@st.dialog("Novo Registro")
def insert_dialog(table_name, screen_fields):
    st.write("Preencha os campos abaixo para inserir um registro.")
    insert_data_dict = {}
    
    id_col_candidates = [f.column_name for f in screen_fields if f.column_name.startswith('id_')]
    primary_key_col = id_col_candidates[0] if id_col_candidates else 'id'

    for field in screen_fields:
        if field.column_name == primary_key_col or field.is_front_ignore or not field.is_editable:
            continue
            
        widget_key = f"new_{table_name}_{field.column_name}"
        
        val = render_widget(field, None, widget_key)
        
        if val is not None and val != "":
            if field.column_type == 'boolean':
                val = True if val == 'Sim' else False
            insert_data_dict[field.column_name] = val
                
    if st.button("Gravar", type="primary"):
        if not insert_data_dict:
            st.warning("Preencha ao menos um campo.")
            return

        try:
            insert_data_dict['id_user'] = st.session_state.user_id
            ds.insert_data(table_name, insert_data_dict)
            st.success("Inserido com sucesso!")
            st.rerun()
        except Exception as e:
            st.error(f"Erro ao inserir: {e}")
