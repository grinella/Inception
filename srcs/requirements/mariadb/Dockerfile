FROM debian:bullseye

# RUN sudo chown -R 999:999 ./requirements/mariadb/data
RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

RUN mkdir -p /var/run/mysqld
RUN chmod -R 777 /var/run/mysqld

COPY tools/script.sh usr/local/bin/script.sh
RUN chmod +x usr/local/bin/script.sh

#esegue lo script.sh per inizializzare il db
# CMD /usr/local/bin/script.sh
#RUN /usr/local/bin/script.sh

# Usa l'utente mysql per eseguire il server
# USER mysql

# ENTRYPOINT ["mysqld"]
ENTRYPOINT ["/bin/bash", "-c", "/usr/local/bin/script.sh && mysqld"]



# ------------------------------


# FROM debian:latest

# # Installazione di MariaDB
# RUN apt-get update && apt-get install -y mariadb-server && apt-get clean

# # Creazione e settaggio delle directory con permessi corretti
# RUN mkdir -p /var/run/mysqld /var/lib/mysql
# RUN chown -R mysql:mysql /var/run/mysqld /var/lib/mysql

# # Copia dello script di inizializzazione
# COPY tools/script.sh /usr/local/bin/script.sh
# RUN chmod +x /usr/local/bin/script.sh

# # Esegui lo script.sh per inizializzare il db
# RUN /usr/local/bin/script.sh

# # Esegui mysqld come utente mysql
# USER mysql

# CMD ["mysqld"]