#!make
include .env2

all: db up

db:
	@echo "Firing up the database"
	./get_media-sql.sh	
	docker-compose up -d dbmedia

up: db
	@echo "Firing up the mediaserver"
	docker-compose up -d
	echo "on Localhost: Please make sure you have api.nrm.se in your /etc/hosts!"
	
	#echo "Opening app!"
	#firefox http://api.nrm.se/MediaServerResteasy/

build: db
	#docker-compose build

	@cd wildfly-custom && test -f wait-for-it.sh || \
		(wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
	chmod +x wait-for-it.sh)
	
	@docker build -t dina/media:${DOCKERHUB_VER} wildfly-custom

release:
	@echo "if you are not logged in , then you must type 'docker login' and enter your credentials"
	@docker push dina/media:${DOCKERHUB_VER}

clean: stop rm
	#sudo chown -R $(ME):$(ME) nginx-conf nginx-html nginx-certs nginx-logs
	#sudo chown -R $(ME):$(ME) mysql_nf-datadir mysql_nf-shr mysql_nf-autoload mysql_nf-conf.d

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-all:
	rm -f srv/deployments/${ARTIFACT}
	rm -f srv/deployments/${ARTIFACT}.deployed
	rm -f srv/deployments/${ARTIFACT}.failed
	rm -f mysql-autoload/${SQL_DUMP}

# conveniance
ps:
	docker-compose ps


#deploy :
#	./get_media-artifact.sh
#	@echo "copying ${RELEASE}/${ARTIFACT} to srv/deployments/ "
#	@cp ${RELEASE}/${ARTIFACT} srv/deployments/
