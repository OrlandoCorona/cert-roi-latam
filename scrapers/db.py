import os
from pathlib import Path
from dotenv import load_dotenv
from sqlalchemy import create_engine
from sqlalchemy.engine import Engine
import pyodbc

load_dotenv(Path(__file__).parent.parent / ".env")

DB_SERVER = os.getenv("DB_SERVER", "localhost")
DB_NAME = os.getenv("DB_NAME", "cert_roi_latam")
DB_TRUSTED = os.getenv("DB_TRUSTED", "yes").lower() == "yes"
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_DRIVER = os.getenv("DB_DRIVER", "ODBC Driver 18 for SQL Server")


def build_connection_string() -> str:
    parts = [
        f"DRIVER={{{DB_DRIVER}}}",
        f"SERVER={DB_SERVER}",
        f"DATABASE={DB_NAME}",
        "TrustServerCertificate=yes",
        "Encrypt=yes",
    ]
    if DB_TRUSTED:
        parts.append("Trusted_Connection=yes")
    else:
        parts.append(f"UID={DB_USER}")
        parts.append(f"PWD={DB_PASSWORD}")
    return ";".join(parts)


def get_engine() -> Engine:
    conn_str = build_connection_string()
    sqlalchemy_url = f"mssql+pyodbc:///?odbc_connect={conn_str}"
    return create_engine(sqlalchemy_url, fast_executemany=True)


def get_raw_connection() -> pyodbc.Connection:
    return pyodbc.connect(build_connection_string())


def test_connection() -> dict:
    with get_raw_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("""
            SELECT 
                @@SERVERNAME AS servidor,
                DB_NAME() AS base_datos,
                SUSER_SNAME() AS usuario,
                @@VERSION AS version
        """)
        row = cursor.fetchone()
        return {
            "servidor": row.servidor,
            "base_datos": row.base_datos,
            "usuario": row.usuario,
            "version": row.version.split("\n")[0],
        }


if __name__ == "__main__":
    print("Probando conexión a SQL Server...")
    info = test_connection()
    print(f"Servidor:    {info['servidor']}")
    print(f"Base datos:  {info['base_datos']}")
    print(f"Usuario:     {info['usuario']}")
    print(f"Versión:     {info['version']}")
    print("Conexión OK")