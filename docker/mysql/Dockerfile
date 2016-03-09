FROM mysql:latest

ENV MYSQL_ROOT_PASSWORD root_password
ENV MYSQL_DATABASE db_name
ENV MYSQL_USER db_user
ENV MYSQL_PASSWORD db_pass

COPY ./scripts/db.sql /docker-entrypoint-initdb.d/db.sql
