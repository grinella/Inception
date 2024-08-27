FROM alpine:3.20.2

RUN apk update && apk add -y mariadb-server

COPY conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY tools/init.sql /docker-entrypoint-initdb.d/

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["mysqld"]
