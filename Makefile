all: build

build:
		cd srcs && docker-compose -f docker-compose.yml up -d
	
stop:
		cd srcs && docker-compose -f docker-compose.yml down

clear:
		cd srcs && docker-compose -f docker-compose.yml down
		docker rmi my_wordpress:1.0 my_nginx:1.0 my_mariadb:1.0

re : clear all

PHONY: all build stop clear re