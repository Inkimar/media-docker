BASE = https://github.com/DINA-Web/mediaserver-module/releases/download
VERSION = v0.4

#all: init build db up
all: init db build up deploy
#all:  db build up deploy

init:
	@echo "Pulling the DINA mediaserver-module release"
	wget $(BASE)/$(VERSION)/mediaserver-ear.ear -O srv/releases/mediaserver.ear
	wget $(BASE)/$(VERSION)/media.dump.sql -O srv/releases/media.dump.sql
	cp srv/releases/media.dump.sql mysql-autoload

db:
	docker-compose up -d db.media
	@echo "Waiting for db to start"
	sleep 10

build:
	docker-compose build

up: db
	docker-compose up -d

deploy :
	cp srv/releases/mediaserver.ear srv/deployments/

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
	rm -f srv/deployments/mediaserver.ear
	rm -f srv/deployments/mediaserver.ear.deployed
	rm -f srv/deployments/mediaserver.ear.failed
	rm -f mysql-autoload/media.dump.sql
