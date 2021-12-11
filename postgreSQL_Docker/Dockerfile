FROM postgres:13

ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB db_testdocker

WORKDIR /home/postgres

COPY db_dump_now .

COPY init.sql /docker-entrypoint-initdb.d/