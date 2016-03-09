FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD linux9
ENV MYSQL_DATABASE project
ENV MYSQL_USER project
ENV MYSQL_PASSWORD project

COPY ./scripts/db.sql /docker-entrypoint-initdb.d/db.sql
