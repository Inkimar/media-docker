# intro.
2017-11-17 : imports a database as it was before 'birds' where inserted by Tove von Euler and fetches all files.

Manually starting up.
1. start the database  (db.media)
1.5 check to see that the db.media is up and running
2. start the mediaserver (app.media)
3. run `make browser-test or browser-local`

## media-docker for naturforskaren-enhanced (repo 'inkimar')
DOCKER-project:
using repo : inkimar
git clone https://github.com/Inkimar/media-docker.git (branch: ingimar/minor-refactor_adding_environments)

##  artifact from (repo 'icingink' private)
java-project:
git clone https://github.com/IcingInk/mediaserver-nf-specific ( branch: 'master' )
artifact in directory : 'ear/target/mediaserver-ear.ear'

## if using https, use the dina-proxy ....
https : dependency on https://github.com/DINA-Web/proxy-docker.git ( with wildcard cert .... )


1. Dockerized version of the mediaserver_enhanced ( used with naturforskaren ).
2. extract the media-files in the directory ~/srv/media ( so that the structure is ~/srv/media/1 ~/srv/media/2 and soforth )
3. Check the sql-file, /mysql_media-autoload $ md5sum -c sql.md5


## moved the file 'update-admin_config.sql' from mysql_media-autoload to ..
Additional :
1. edit settings : https://github.com/DINA-Web/media-docker/blob/media_enhanced/mysql_media-autoload/update-admin_config.sql

default values are 1,2 and 3 ( only change the value if you need to, not the key )
1. update nf_media.ADMIN_CONFIG set admin_value = "/opt/data/media/" 		where admin_key="path_to_files";
2. update nf_media.ADMIN_CONFIG set admin_value = "beta-media.dina-web.net" 	where admin_key="mediaserver_host";
3. update media.ADMIN_CONFIG set admin_value = "media" 			where admin_key="relative_new_stream_url";
#update media.ADMIN_CONFIG set admin_value = "media/v1" 			where admin_key="relative_new_stream_url";


