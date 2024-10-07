FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install mariadb-server -y

# COPY conf/my.cnf /etc/mysql/mariadb.conf.d/my.cnf
COPY tools/script.sh /setup_data/script.sh

# RUN mkdir -p /var/run/mysqld && \
#     chown -R mysql:mysql /var/run/mysqld
RUN mkdir /run/mysqld

EXPOSE 3306

CMD ["/bin/bash", "/setup_data/script.sh"]
