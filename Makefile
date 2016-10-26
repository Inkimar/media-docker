#!make
include .env2

all: init db up deploy

init:
	@echo "Pulling the DINA mediaserver-module release, if necessary"
	./get_media-artifact.sh
	./get_media-sql.sh

db:
	docker-compose up -d db.media
	@echo "Waiting for db to start"
	sleep 10

build:
	#docker-compose build
	@docker build -t dina/media:v0.1 wildfly-custom

release:
	@echo "if you are not logged in , then you must type 'docker login' and enter your credentials"
	@docker push dina/media:v0.1

up: db
	docker-compose up -d
	echo "on Localhost: Please make sure you have api.nrm.se in your /etc/hosts!"
	sleep 15
	
	#echo "Opening app!"
	#firefox http://api.nrm.se/MediaServerResteasy/

deploy :
	@echo "copying ${RELEASE}/${ARTIFACT} to srv/deployments/ "
	@cp ${RELEASE}/${ARTIFACT} srv/deployments/


ps:
	docker-compose ps

clean: stop rm
	sudo chown -R $(ME):$(ME) nginx-conf nginx-html nginx-certs nginx-logs
	sudo chown -R $(ME):$(ME) mysql_nf-datadir mysql_nf-shr mysql_nf-autoload mysql_nf-conf.d

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-all:
	rm -f srv/deployments/${ARTIFACT}
	rm -f srv/deployments/${ARTIFACT}.deployed
	rm -f srv/deployments/${ARTIFACT}.failed
	rm -f mysql-autoload/${SQL_DUMP}

