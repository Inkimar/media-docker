# dw-media_docker

Dockerized media server module <br>
Tested with dw-proxy ( https : https://github.com/DINA-Web/proxy-docker  ) <br>
NB 1: on which URL is your mediaserver residing.<br>

0. Make sure to update the /etc/hosts-file default : 
1. The mediaserver is set up with URL = 'beta-media.dina-web.net'
1. that is configured in the 'docker-compose.yml'
2. that is configured in the nginx-conf/mediaserver.conf
3. that is configured in the 'mysql-autoload/update-admin_config.sql' (update the post before you db-creation)

<br>
NB 2: Test to  post to images to the server

1. use the file ./self-test/Makefile ( with 3 parameters)
2. default-values are : HOST=beta-media.dina-web.net, PORT=18080, SIZE = 1000
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

Assuming hostname beta-media.dina-web.net :<br>

GET against http://beta-media.dina-web.net/MediaServerResteasy/media/v1/`uuid`?format=image/jpeg will return an image<br>

Documentation can be found at: <https://github.com/DINA-Web/mediaserver-module> <br>

Full API docs can be found at: <http://docs.media8.apiary.io><br>

