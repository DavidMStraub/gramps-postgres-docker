FROM postgres:15

COPY gramps.sh /docker-entrypoint-initdb.d/10-gramps.sh
COPY grampswebuser.sh /docker-entrypoint-initdb.d/20-grampswebuser.sh

RUN apt-get update && \
    apt-get install -y locales-all postgresql-15-pgvector \
    && rm -rf /var/lib/apt/lists/*
