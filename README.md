# media-docker , branch 'media_enhanced'

1. Dockerized version of the mediaserver_enhanced ( used with naturforskaren ).
2. extract the media-files in the directory ~/srv/media ( so that the structure is ~/srv/media/1 ~/srv/media/2 and soforth )
3. Check the sql-file, /mysql_media-autoload $ md5sum -c sql.md5

Additional :
1. edit settings : https://github.com/DINA-Web/media-docker/blob/media_enhanced/mysql_media-autoload/update-admin_config.sql

default values are 1,2 and 3 ( only change the value if you need to, not the key )
1. update nf_media.ADMIN_CONFIG set admin_value = "/opt/data/media/" 		where admin_key="path_to_files";
2. update nf_media.ADMIN_CONFIG set admin_value = "beta-media.dina-web.net" 	where admin_key="mediaserver_host";
3. update media.ADMIN_CONFIG set admin_value = "media" 			where admin_key="relative_new_stream_url";
#update media.ADMIN_CONFIG set admin_value = "media/v1" 			where admin_key="relative_new_stream_url";


