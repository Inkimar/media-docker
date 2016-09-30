update media.ADMIN_CONFIG set admin_value = "/opt/data/media/" 		where admin_key="path_to_files";
update media.ADMIN_CONFIG set admin_value = "https://beta-media.dina-web.net" 	where admin_key="mediaserver_host";
update media.ADMIN_CONFIG set admin_value = "media/v1" 			where admin_key="relative_new_stream_url";
