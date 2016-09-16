ME=$(USER)
all: build init up

clean: stop rm
	sudo chown -R $(ME):$(ME) nginx-conf nginx-html nginx-certs nginx-logs
	sudo chown -R $(ME):$(ME) mysql_nf-datadir mysql_nf-shr mysql_nf-autoload mysql_nf-conf.d

init:
	echo "Retrieving the database for the mediaserver"
	./get_enhanced-media_db-schema.sh
	echo "set up database nf_media"
	docker-compose up -d db.media
	
	echo "Installing app file (.war)"
	./get_enhanced-media_war.sh
	
	echo "Installing image files"
	./get_enhanced-media_media-files.sh

	#echo "Installing nginx certs and DINA favicon"
	#./get_nginx_certs.sh
	
build:
	docker-compose build --no-cache app

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
