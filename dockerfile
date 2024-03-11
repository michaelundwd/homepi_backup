
######################################################################
#   Dockerfile for basic docker image to give nightly backup of /opt #
#   /opt folder holds all persistent data for docker containers      #
#   All file & folder references are as from this docker container   #
#   Requires bind mounts for home_pi & homeserver_backup_homepi      #
#   To /opt and /mnt/homeserver_backup_homepi respectively           #
#   dev forked from Version 4 dated 20240306                         #
######################################################################

FROM alpine:latest

RUN mkdir /homepi_opt && mkdir /homeserver_backup_homepi

COPY entrypoint.sh .
RUN chmod +x ./entrypoint.sh

ENV TZ: "Europe/London"

ENTRYPOINT ["./entrypoint.sh"]

# CMD ["crond","-f"] 

