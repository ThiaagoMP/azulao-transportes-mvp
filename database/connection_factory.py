import psycopg2 as ps
import os
from dotenv import load_dotenv

load_dotenv(override=True)

def connection_factory():
    return ps.connect(database = os.getenv("DATABASE"),
                        user = os.getenv("USER"),
                        host= os.getenv("HOST"),
                        password = os.getenv("PASSWORD"),
                        port = os.getenv("PORT"))