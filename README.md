# dw-media_docker

Dockerized media server module <br>
Tested with dw-proxy ( https : https://github.com/DINA-Web/proxy-docker  ) <br>
**NB 1:** on which URL is your mediaserver residing ?<br>

0. Make sure to update the /etc/hosts-file default : 
1. The mediaserver is set up with URL = 'api.nrm.se'
1. that is configured in the 'docker-compose.yml'
2. that is configured in the nginx-conf/mediaserver.conf
3. that is configured in the 'mysql-autoload/update-admin_config.sql' (update this file before  db-creation)

<br>
**NB 2:** Test: post an image to the mediaserver server <br>
**before** : check nr of files , ./self-test/db_count.sh 

1. use the file ./self-test/Makefile to post an image
2. default-values are : HOST=api.nrm.se, SIZE = 1000
3. post an image size 1000: cd ./self-test , run 'make'
4. post an image size 5000: cd ./self-test , run 'make SIZE=5000'

**After** : check nr of files , ./self-test/db_count.sh <br>
response is given in JSON, see the the key/value = mediaURL/'url' <br>
see the image : i.e  http://api.nrm.se/MediaServerResteasy/media/v1/`uuid`?format=image/jpeg will return an image<br> 

<br>
The response from above posting contains the key 'mediaURL' which contains the URL to the posted image, see [below](https://github.com/Inkimar/dw-media_docker#using-the-api) <br>
 
## Using the Makefile

`make` starts the services from scratch ( target 'init' fetches the artifacts) <br>

`make clean` stops and removes services and data<br>

###Directories

1. './srv/deployments/', check here to see if the artifact was deployed or not ( if successful the file 'mediaserver.ear.deployed' is created )
2. './srv/log/', contains wildfly's 'server.log(s)'
3. './srv/media/', mediafiles are stored here
4. './srv/releases/', the artifact (ear-file) is stored here + the mysql-dump-file


For other available actions, please see the Makefile

## Using the API

Assuming that the hostname api.nrm.se :<br>

GET against http://api.nrm.se/MediaServerResteasy/media/v1/`uuid`?format=image/jpeg will return an image<br>

Documentation can be found at: <https://github.com/DINA-Web/mediaserver-module> <br>

Full API docs (in-progress) can be found at: <http://docs.media8.apiary.io><br>

