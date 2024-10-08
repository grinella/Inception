
all : up

up :
	@sudo docker-compose -f ./srcs/docker-compose.yml up --build

down :
	@sudo docker-compose -f ./srcs/docker-compose.yml down -v
	@sudo docker rmi $$(docker images -q)

prune:
	@sudo docker system prune -a

stop : 
	@sudo docker-compose -f ./srcs/docker-compose.yml stop

start : 
	@sudo docker-compose -f ./srcs/docker-compose.yml start

status : 
	@sudo docker ps
