java -Dbitbucket.password="${BACKUP_BITBUCKET_PASSWORD}" \
     -Dbitbucket.user="${BACKUP_BITBUCKET_USER}" \
     -Dbitbucket.baseUrl="${BACKUP_BITBUCKET_URL}" \
     -Dbitbucket.home="${BACKUP_BITBUCKET_HOME}" \
     -Dbackup.home="${BACKUP_BITBUCKET_DESTINATION}" \
     -jar /usr/local/bin/bitbucket-backup-client/bitbucket-backup-client.jar