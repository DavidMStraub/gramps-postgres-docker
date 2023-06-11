#!/bin/bash
set -e

[ -z "$POSTGRES_PASSWORD_GRAMPS" ] && echo "ERROR: POSTGRES_PASSWORD_GRAMPS environment variable is empty." && exit 1

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER gramps WITH CREATEDB PASSWORD '${POSTGRES_PASSWORD_GRAMPS}';
        CREATE DATABASE gramps;
        GRANT ALL PRIVILEGES ON DATABASE gramps TO gramps;
EOSQL