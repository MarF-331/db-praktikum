import json
from pathlib import Path
from typing import Any, Iterable

import psycopg
from psycopg import sql
from tqdm import tqdm

from table_names import TableNames

json_decoder = json.JSONDecoder()


def load_json_file(file_path: Path) -> Any:
    json_text = file_path.read_text(encoding="utf-8")
    document = json_decoder.raw_decode(json_text)[0]
    return document


def create_documents_table(table_name: str, connection: psycopg.Connection) -> None:
    with connection.cursor() as cursor:
        create_table_query = sql.SQL(
            "CREATE TABLE IF NOT EXISTS {} (data JSONB);"
        ).format(sql.Identifier(table_name))
        cursor.execute(create_table_query)
    connection.commit()


def truncate_documents_table(table_name: str, connection: psycopg.Connection) -> None:
    with connection.cursor() as cursor:
        truncate_table_query = sql.SQL("TRUNCATE TABLE {};").format(
            sql.Identifier(table_name)
        )
        cursor.execute(truncate_table_query)
    connection.commit()


def ingest_json_files(
    json_paths: Iterable[Path], table_name: str, connection: psycopg.Connection
) -> None:
    with connection.cursor() as cursor:
        truncate_documents_table(table_name, connection)
        copy_query = sql.SQL("COPY {} (data) FROM STDIN").format(
            sql.Identifier(table_name)
        )
        with cursor.copy(copy_query) as copy:
            for json_path in tqdm(json_paths, desc="Ingesting JSON files", unit="file"):
                document = load_json_file(json_path)
                json_data = json.dumps(document)
                copy.write_row((json_data,))

    connection.commit()


def main():
    connection = psycopg.connect(
        dbname="",
        user="postgres",
        password="postgres",
        host="127.0.0.1",
        port=5432,
    )

    spiegel_articles_paths = Path("data/spiegel_articles").glob("*.json")
    guardian_articles_paths = Path("data/guardian_articles").glob("*.json")

    create_documents_table(TableNames.SPIEGEL.value, connection)
    create_documents_table(TableNames.GUARDIAN.value, connection)
    ingest_json_files(spiegel_articles_paths, TableNames.SPIEGEL.value, connection)
    ingest_json_files(guardian_articles_paths, TableNames.GUARDIAN.value, connection)
    connection.close()


if __name__ == "__main__":
    main()
