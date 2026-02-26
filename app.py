import streamlit as st
import pandas as pd

from service import column_service as cs
from service import table_service as ts

st.set_page_config(page_title="Dashboard", page_icon="🏠")
st.title("Dashboard!")
st.write("Navegue pela aplicação no menu ao lado.")

tables = ts.get_tables()
columns = cs.get_table_columns()

# gerar telas automaticamente
