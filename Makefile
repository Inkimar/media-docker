BASE = https://github.com/DINA-Web/mediaserver-module/releases/download
VERSION = v0.4

ARTIFACT = mediaserver.ear
SQL_DUMP = media.dump.sql

#all: init db build up deploy
all:  db build up deploy

init:
	@echo "Pulling the DINA mediaserver-module release"
	test -f srv/releases/${ARTIFACT} ||  wget $(BASE)/$(VERSION)/mediaserver-ear.ear -O srv/releases/${ARTIFACT}
	test -f srv/releases/${SQL_DUMP}||  (wget $(BASE)/$(VERSION)/${SQL_DUMP} -O srv/releases/${SQL_DUMP} && cp srv/releases/${SQL_DUMP} mysql-autoload)
	#cp srv/releases/media.dump.sql mysql-autoload

db:
	docker-compose up -d db.media
	@echo "Waiting for db to start"
	sleep 10

build:
	docker-compose build

up: db
	docker-compose up -d

deploy :
	cp srv/releases/${ARTIFACT} srv/deployments/

demo-http:
	@echo "Test to upload images to server using curl over HTTP (remember to add 'api.nrm.se' to /etc/hosts)"
	cd self-test; ./post-3-images-http-style.sh

demo-https:
	@echo "Test to upload images to server using curl over HTTPS (running https if dw-proxy is running - remember to add 'api.nrm.se' to /etc/hosts)"
	cd self-test; ./post-3-images-https-style.sh

ps:
	docker-compose ps

clean: stop rm

stop:
	docker-compose stop
rm:
	docker-compose rm -vf

rm-all:
	rm -f srv/deployments/${ARTIFACT}
	rm -f srv/deployments/${ARTIFACT}.deployed
	rm -f srv/deployments/${ARTIFACT}.failed
	rm -f mysql-autoload/${SQL_DUMP}
