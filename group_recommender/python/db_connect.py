import psycopg2
from env_loader import load_env
env = load_env(".")


def connection():
    # print(env.get("DB_USER"))
    # print(env.get("DB_PASSWORD"))
    conn = psycopg2.connect(
        user=env.get("DB_USER"),
        password=env.get("DB_PASSWORD"),
        host=env.get("DB_HOST"),
        port=env.get("DB_PORT"),
        database=env.get("DB_DATABASE")

    )
    return conn
