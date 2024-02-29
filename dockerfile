
FROM alpine
MAINTAINER mjuwx@outlook.com

RUN which crond && \
    rm -rf /etc/periodic

chmod +x docker-entrypoint.sh
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# source: `docker run --rm -it alpine  crond -h`
# -f | Foreground
# -l N | Set log level. Most verbose 0, default 8
CMD ["crond", "-f", "-l", "2"]




# original below that sort of worked

##FROM debian:latest

# Add crontab file in the cron directory
##ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the cron job
##RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
##RUN touch /var/log/cron.log

#Install Cron
##RUN apt-get update
##RUN apt-get -y install cron


# Run the command on container startup
##CMD cron && tail -f /var/log/cron.log
