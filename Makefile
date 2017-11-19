ME=$(USER)
DOCKERHUB_VER=v0.2

all: init up

init:
	echo "set up database nf_media"
	./get_enhanced-media_db-schema.sh
	docker-compose up -d db.media

db:
	docker-compose up -d db.media

up: db
	docker-compose up -d

	
build: db
	@cd wildfly-custom && test -f wait-for-it.sh || (wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod +x wait-for-it.sh)
	echo "fetching artifact (.war)"
	./get_enhanced-media_war.sh
	@docker build -t dina/media_enhanced:${DOCKERHUB_VER} wildfly-custom

release:
	docker push  dina/media_enhanced:${DOCKERHUB_VER}

media-files:
	./get_enhanced-media_media-files.sh

clean: stop rm

stop:
	docker-compose stop

rm: 
	docker-compose rm

browser-test:
	echo "on Localhost: Please make sure you have beta-media.dina-web.net in your /etc/hosts!"
	xdg-open  http://beta-media.dina-web.net/MediaServerResteasy/&

how-many-files:
	find srv/media/ -type f | wc -l
