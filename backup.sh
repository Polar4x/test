#!/bin/bash

BACKUP_DIR=./backup
TIMESTAMP=$(date +'%Y%m%d%H%M%S')
BACKUP_PATH="$BACKUP_DIR/mongodb-backup-$TIMESTAMP"
MONGO_CONTAINER="mongodb"
LOGIN=root
PASS=pass

mkdir -p "$BACKUP_DIR"

docker exec $MONGO_CONTAINER mongodump --username $LOGIN --password $PASS --archive="$BACKUP_PATH.gz" --gzip

if [ $? -eq 0 ]; then
  echo "Бэкап успешно создан: $BACKUP_PATH.gz"
else
  echo "Ошибка при создании бэкапа"
  exit 1
fi