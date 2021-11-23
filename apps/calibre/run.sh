#!/bin/sh
docker run -dp 8080:8080 -v calibre-data:/opt/calibre/library calibre-server
