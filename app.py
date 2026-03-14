from ui.render_pages import render_pages
import streamlit as st
import psycopg2
from database import connection_factory as cf
from service import login_service

st.set_page_config(page_title="Dashboard", page_icon="🏠", layout="wide")

if 'logged_in' not in st.session_state:
    st.session_state.logged_in = False
if 'user_id' not in st.session_state:
    st.session_state.user_id = None

if not st.session_state.logged_in:
    col1, col2, col3 = st.columns([1, 1, 1])
    with col2:
        st.markdown("<h2 style='text-align: center; margin-bottom: 20px;'>Acesso ao Sistema</h2>", unsafe_allow_html=True)
        
        with st.form("login_form"):
            email_input = st.text_input("Email")
            password_input = st.text_input("Senha", type="password")
            submit_button = st.form_submit_button("Entrar", type="primary", use_container_width=True)
            
            if submit_button:
                if not email_input or not password_input:
                    st.warning("Preencha todos os campos.")
                elif login_service.check_login(email_input, password_input):
                    st.rerun()
                else:
                    st.error("Credenciais inválidas.")
else:
    with st.sidebar:
        if st.button("Sair 🚪", use_container_width=True):
            st.session_state.logged_in = False
            st.session_state.user_id = None
            st.rerun()
            
    render_pages()
