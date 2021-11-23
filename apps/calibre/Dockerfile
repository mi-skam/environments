# Hint: remember to persist /opt/calibre/library

FROM ubuntu:20.04

RUN apt update -y \
  && DEBIAN_FRONTEND=noninteractive apt install -y calibre \
  && apt-get clean \
  && rm -rf /var/cache/apt/* /var/lib/apt/lists/*
RUN mkdir /opt/calibre && mkdir /opt/calibre/library
# XXX: the only way I found to create a  empty library
RUN calibredb restore_database -r --with-library /opt/calibre/library/

EXPOSE 8080

CMD ["/usr/bin/calibre-server", "--userdb", "/opt/calibre/library/users.sqlite", "--enable-auth", "/opt/calibre/library"]
