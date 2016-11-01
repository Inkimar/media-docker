ME=$(USER)
#all: build init up
all: init up

clean: stop rm
	sudo chown -R $(ME):$(ME) nginx-conf nginx-html nginx-certs nginx-logs
	sudo chown -R $(ME):$(ME) mysql_nf-datadir mysql_nf-shr mysql_nf-autoload mysql_nf-conf.d

db:
	
	docker-compose up -d dbmedia

init:
	
	echo "set up database nf_media"
	./get_enhanced-media_db-schema.sh
	docker-compose up -d dbmedia

	#echo "Installing nginx certs and DINA favicon"
	#./get_nginx_certs.sh
	
build: db
	@cd wildfly-custom && test -f wait-for-it.sh || (wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && chmod +x wait-for-it.sh)
	#echo "Installing app file (.war)"
	./get_enhanced-media_war.sh
	#docker-compose build --no-cache app
	@docker build -t dina/media_e:v0.1 wildfly-custom

release:
	docker push  dina/media_e:v0.1

up:
	docker-compose up -d

	echo "on Localhost: Please make sure you have beta-media.dina-web.net in your /etc/hosts!"
	sleep 15
	
	#echo "Opening app!"
	#firefox http://beta-media.dina-web.net/MediaServerResteasy/&

stop:
	docker-compose stop

rm: 
	docker-compose rm

ps:
	docker-compose ps
