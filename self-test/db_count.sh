docker exec -it mediadocker_db.media_1 mysql -u mediaserver -pmediaserver -e "select count(*) from media.MEDIA"
