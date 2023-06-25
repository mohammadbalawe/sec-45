#!/bin/bash

TIMESTAMP=$(date +"%F %T")
LOGFILE="/tmp/backup.log"

cd /srv/samba/sec-45

# Sync the repository
git add .
git commit -m "Backup on ${TIMESTAMP}"
if git push origin master; then
    echo "${TIMESTAMP} - Backup successful" >> "${LOGFILE}"
else
    echo "${TIMESTAMP} - Backup failed" >> "${LOGFILE}"
fi
