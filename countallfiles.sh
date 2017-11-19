#!/bin/bash
echo "counts all media files in the srv/media directory"
find srv/media -type f | wc -l
