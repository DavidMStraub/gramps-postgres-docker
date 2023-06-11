#!/bin/bash
set -e

[ -z "$POSTGRES_PASSWORD_GRAMPS_USER" ] && echo "ERROR: POSTGRES_PASSWORD_GRAMPS_USER environment variable is empty." && exit 1

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER grampswebuser WITH CREATEDB PASSWORD '${POSTGRES_PASSWORD_GRAMPS_USER}';
        CREATE DATABASE grampswebuser;
        GRANT ALL PRIVILEGES ON DATABASE gramps TO grampswebuser;
EOSQL