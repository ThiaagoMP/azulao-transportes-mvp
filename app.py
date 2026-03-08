from ui.render_pages import render_pages
import streamlit as st

st.set_page_config(page_title="Dashboard", page_icon="🏠", layout="wide")

st.markdown("""
<style>
    /* Melhorar espaçamento da página */
    .block-container {
        padding-top: 2rem;
        padding-bottom: 2rem;
    }
    
    /* Cores e estilos para os títulos */
    h1, h2, h3 {
        color: #1E3A8A;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }
    
    /* Estilizar barra lateral */
    [data-testid="stSidebar"] {
        background-color: #F8FAFC;
        border-right: 1px solid #E2E8F0;
    }
    
    /* Melhorar visual do expander */
    .streamlit-expanderHeader {
        background-color: #F1F5F9;
        border-radius: 4px;
        font-weight: 500;
        color: #334155;
    }
</style>
""", unsafe_allow_html=True)

render_pages()
