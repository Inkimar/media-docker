ME=$(USER)
DOCKERHUB_VER=v0.2

all: init up

init:
	echo "set up database nf_media"
	./get_enhanced-media_db-schema.sh
	docker-compose up -d dbmedia

db:
	docker-compose up -d dbmedia

up: db
	docker-compose up -d

	echo "on Localhost: Please make sure you have beta-media.dina-web.net in your /etc/hosts!"
	sleep 15
	
	#echo "Opening app!"
	#firefox http://beta-media.dina-web.net/MediaServerResteasy/&
	
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
	sudo chown -R $(ME):$(ME) nginx-conf nginx-html nginx-certs nginx-logs
	sudo chown -R $(ME):$(ME) mysql_nf-datadir mysql_nf-shr mysql_nf-autoload mysql_nf-conf.d

stop:
	docker-compose stop

rm: 
	docker-compose rm

ps:
	docker-compose ps
