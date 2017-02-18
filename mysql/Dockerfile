FROM mysql:5.7

USER root

ADD mysqld.cnf /etc/mysql/mysql.conf.d/
ADD init.sql /docker-entrypoint-initdb.d/

RUN apt-get update -y && \
    apt-get install -y netcat net-tools inetutils-ping

