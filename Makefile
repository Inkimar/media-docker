#!make
PWD=$(shell pwd)
ME=$(USER)

include .env

all: init up

init:
	@echo "set up database nf_media"
	./get_enhanced-media_db-schema.sh
	docker-compose up -d db.media

db:
	docker-compose up -d db.media
	sleep 15;

up: db
	docker-compose up -d

build: db
	@cd wildfly-custom && test -f wait-for-it.sh || (wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod +x wait-for-it.sh)
	echo "fetching artifact (.war)"
	./get_enhanced-media_war.sh
	@docker build -t ${IMAGE}:{TAG} wildfly-custom

release: # docker login ....
	docker push  ${IMAGE}:{TAG}

media-files:
	./get_enhanced-media_media-files.sh

down:
	@docker-compose down

clean: stop rm

stop:
	@docker-compose stop

rm: 
	@docker-compose rm -vf

ps:
	@docker-compose ps

browser-test:
	@echo "with URL: make sure you have beta-media.dina-web.net in /etc/hosts!"
	xdg-open http://beta-media.dina-web.net/MediaServerResteasy/&

browser-local:
	xdg-open http://localhost:8080/MediaServerResteasy/&


#convenience
login-db:
	docker exec -it mediadocker_db.media_1 bash
