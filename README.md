# media-docker


[AGPLv3 License](http://img.shields.io/badge/license-AGPLv3-blue.svg) ](https://github.com/DINA-Web/media-docker/blob/master/LICENSE)


A dockerized media server module <br>
Tested with proxy-docker ( nginx reverse proxy : https://github.com/DINA-Web/proxy-docker  -configured to handle 'large' files )<br>
The media-docker is running on 'wildfly:8.2.1.Final' <br>
configuration to handle 'large' files : <br> '/subsystem=undertow/server=default-server/http-listener=default/:write-attribute(name=max-post-size,value=1048576000)' , see the file wildfly-custom/customization/commands.cli 


## Before starting
the default URL for your mediaserver

1. The mediaserver is set up with URL = 'api.nrm.se'
1. that is configured in the 'docker-compose.yml'
2. that is configured in the nginx-conf/mediaserver.conf
3. that is configured in the 'mysql-autoload/update-admin_config.sql' (update this file before  db-creation)
4. that is set for the testing of the server, see /self-test/Makefile

be sure  to update the /etc/hosts-file with 'api.nrm.se'

<br>

## Start up the mediaserver
$ make


## Test the mediaserver:<br>

**before testing** : check nr of records in your database : ./self-test/db_count.sh <br>

**testing**
post an image to the mediaserver server 

1. cd  self-test
2. $ make ( posts an image with SIZE=1000 and displays the image in firefox )
3. default-values are : HOST=api.nrm.se, SIZE = 1000
4. increase the size of the image : $ make SIZE=5000

did firefox display the image of the dragon?

**After testing** :  check nr of records in your database : ./self-test/db_count.sh <br>

<br>
The response from above posting contains the key 'mediaURL' which contains the URL to the posted image, see [below](https://github.com/Inkimar/dw-media_docker#using-the-api) <br>
 
## Using the Makefile

`make` starts the services from scratch ( target 'init' fetches the artifacts) <br>

`make clean` stops and removes services and data<br>

###Directories

1. './srv/log/', contains wildfly's 'server.log(s)'
2. './srv/media/', mediafiles are stored here


For other available actions, please see the Makefile

## Using the API

Assuming that the hostname api.nrm.se :<br>

GET against http://api.nrm.se/MediaServerResteasy/media/v1/`uuid`?format=image/jpeg will return an image<br>

Documentation can be found at: <https://github.com/DINA-Web/mediaserver-module> <br>

Full API docs (in-progress) can be found at: <http://docs.media8.apiary.io><br>

