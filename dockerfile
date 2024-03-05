#version _4

FROM alpine:latest

RUN mkdir /homepi_opt && mkdir /homeserver_backup_homepi
VOLUME ("/homepi_opt")
VOLUME ("homeserver_backup_homepi")

ENV TZ: "Europe/London"

RUN echo "21 01 * * * /homepi_opt/backup/opt_backup.sh;exit 0" | crontab - 
CMD ["crond","-f"] 