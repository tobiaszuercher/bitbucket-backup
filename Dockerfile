FROM ubuntu

RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y unzip \
  && apt-get install -y cron \
  && apt-get install -y default-jre \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://maven.atlassian.com/content/groups/public/com/atlassian/bitbucket/server/backup/bitbucket-backup-distribution/3.3.4/bitbucket-backup-distribution-3.3.4.zip
RUN unzip bitbucket-backup-distribution-3.3.4.zip
RUN mv bitbucket-backup-client-3.3.4/ /usr/local/bin/bitbucket-backup-client
RUN rm -f bitbucket-backup-distribution-3.3.4.zip

ADD bitbucket-backup.sh /etc/cron.d/bitbucket-backup.sh
RUN /bin/bash -c 'chmod 0744 /etc/cron.d/bitbucket-backup.sh'

ADD crontab /etc/cron.d/bitbucket-backup
RUN /bin/bash -c 'chmod 0644 /etc/cron.d/bitbucket-backup'

CMD ["cron", "-f"]