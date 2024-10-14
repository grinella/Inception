_USER=${USER}
_CUSTOM_DOMAIN=grinella.42.fr
_HOSTS_FILE=/etc/hosts

all: up

up:
	#se non esiste la cartella "wordpress" la crea
	if [ ! -d /home/${_USER}/data/wordpress_data ]; then \
		mkdir -p /home/${_USER}/data/wordpress_data ; \
	fi
	#se non esiste la cartella "mariadb" la crea
	if [ ! -d /home/${_USER}/data/mariadb_data ]; then \
		mkdir -p /home/${_USER}/data/mariadb_data ; \
	fi
	#se non esiste il dominio "grinella" all'interno del file "etc/hosts" lo crea
	if ! grep -q "$(_CUSTOM_DOMAIN)" $(_HOSTS_FILE); then \
		echo "127.0.0.1 $(_CUSTOM_DOMAIN)" | sudo tee -a $(_HOSTS_FILE); \
	else \
		echo "$(_CUSTOM_DOMAIN) esiste già in $(_HOSTS_FILE)"; \
	fi
	@sudo docker compose -f srcs/docker-compose.yml up --build
	
down :
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker rmi $$(docker images -q)
	@sudo rm -rf /home/${_USER}/data/mariadb_data
	@sudo rm -rf /home/${_USER}/data/wordpress_data

prune :
	@sudo docker system prune -a

down_all :
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker rmi $$(docker images -q)
	@sudo rm -rf /home/${_USER}/data/mariadb_data
	@sudo rm -rf /home/${_USER}/data/wordpress_data
	@sudo docker system prune -a

stop : 
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@sudo docker-compose -f ./srcs/docker-compose.yml start

status : 
	@sudo docker ps

mac_up :
	@docker-compose -f ./srcs/docker-compose.yml up --build

mac_down :
	@docker-compose -f ./srcs/docker-compose.yml down

mac_image_down :	
	@docker rmi $$(docker images -q)

mac_mw_rm :
	@rm -rf /Users/Gabriele/Inception/mariadb_data/*
	@rm -rf /Users/Gabriele/Inception/wordpress_data/*

mac_prune :
	@docker system prune -a

mac_down_all :
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker rmi $$(docker images -q)
	@docker system prune -af
	@rm -rf /Users/Gabriele/Inception/mariadb_data/*
	@rm -rf /Users/Gabriele/Inception/wordpress_data/*

mac_stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

mac_start : 
	@docker-compose -f ./srcs/docker-compose.yml start

mac_status : 
	@docker ps



