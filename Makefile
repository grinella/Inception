all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yml up --build

down : 
	@docker-compose -f ./srcs/docker-compose.yml down
	@docker rmi $$(docker images -q)
	@docker system prune -f ./srcs/docker-compose.yml

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps



