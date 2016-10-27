#!make
include .env2

all-w.image: init db up

init:
	@echo "Pulling the DINA mediaserver-module release, if necessary"
	./get_media-artifact.sh
	./get_media-sql.sh
	@cd wildfly-custom && test -f wait-for-it.sh || \
		(wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh && \
	chmod +x wait-for-it.sh)

db:
	@echo "should implement the wait.sh here .... check if database 'media' is present"	
	docker-compose up -d dbmedia

build: db
	#docker-compose build
	@docker build -t dina/media:${DOCKERHUB_VER} wildfly-custom

release:
	@echo "if you are not logged in , then you must type 'docker login' and enter your credentials"
	@docker push dina/media:${DOCKERHUB_VER}

up: db
	docker-compose up -d
	echo "on Localhost: Please make sure you have api.nrm.se in your /etc/hosts!"
	
	#echo "Opening app!"
	#firefox http://api.nrm.se/MediaServerResteasy/

deploy :
	@echo "copying ${RELEASE}/${ARTIFACT} to srv/deployments/ "
	@cp ${RELEASE}/${ARTIFACT} srv/deployments/


ps:
	docker-compose ps

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

