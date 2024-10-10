
all : up

up :
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build

down :
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker rmi $$(docker images -q)

prune :
	@sudo docker system prune -a

down_all :
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker rmi $$(docker images -q)
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



