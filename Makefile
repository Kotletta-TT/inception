OBJ	= srcs/docker-compose.yaml

all:
	docker-compose -f $(OBJ) up --build

stop:
	docker-compose -f $(OBJ) stop

web:
	docker-compose -f $(OBJ) build web
	docker-compose -f $(OBJ) run -p 80:80 -p 443:443 --rm web

wp:
	docker-compose -f $(OBJ) build wp
	docker-compose -f $(OBJ) run --rm wp

db:
	docker-compose -f $(OBJ) build db
	docker-compose -f $(OBJ) run --rm db
	
fdel:
	docker-compose -f $(OBJ) down --rmi all --remove-orphans
	docker system prune --volumes -f
	docker image prune -a -f
	rm -rf data