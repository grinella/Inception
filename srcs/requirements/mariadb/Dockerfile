FROM alpine:3.17.5

#RUN apk update && apk add -y mariadb-server
# da testare: --no-cache
RUN apk update && apk add mysql mysql-client

# COPY conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY tools/script.sh /setup_data/script.sh

# RUN mkdir -p /var/run/mysqld && \
#     chown -R mysql:mysql /var/run/mysqld
RUN mkdir /run/mysqld

EXPOSE 3306

CMD ["/bin/sh", "/setup_data/script.sh"]
