#!/bin/sh
docker run -ti -v calibre-data:/opt/calibre/library calibre-server calibre-server --userdb /opt/calibre/library/users.sqlite --manage-users /opt/calibre/library
