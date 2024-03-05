#version _4

FROM alpine:latest

RUN mkdir /homepi_opt && mkdir /homeserver_backup_homepi
VOLUME ("/homepi_opt")
VOLUME ("homeserver_backup_homepi")

ENV TZ: "Europe/London"

RUN echo "* * * * * /homepi_opt/backup/test.sh;exit 0" | crontab - 
CMD ["crond","-f"] 