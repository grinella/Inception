all : up

up : 
	@docker-compose -f ./srcs/docker-compose.yml up --build

down :
	@docker-compose -f ./srcs/docker-compose.yml down -v
	@docker rmi $$(docker images -q)
	@docker system prune -a

stop : 
	@docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@docker-compose -f ./srcs/docker-compose.yml start

status : 
	@docker ps



