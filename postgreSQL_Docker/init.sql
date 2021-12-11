-- CREATE DATABASE db_testdocker;
\echo 'Starting init.sql ...'
select datname from pg_database order by datname;

CREATE ROLE flo WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  CREATEDB
  NOCREATEROLE
  NOREPLICATION
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:kyBc1ASdE+wd8cAzYCC2aQ==$j9pEcm1roP3v7fVvIPm3ko1OFTbGHyjqm4oKYB+YyIw=:AI+Znlr7vFMzKkdYbptb5CHvAVHbjIDhSz3cEDE+XTQ=';

\i /home/postgres/db_dump_now
\echo 'init.sql finished'