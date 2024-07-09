#!/bin/bash

BACKUP_DIR=./backup
LATEST_BACKUP=$(ls -t $BACKUP_DIR/mongodb-backup-*.gz | head -1)
MONGO_CONTAINER="mongodb"
LOGIN=root
PASS=pass

if [ -z "$LATEST_BACKUP" ]; then
  echo "Нет доступных бэкапов"
  exit 1
fi

docker exec -i $MONGO_CONTAINER sh -c 'mongorestore --username='$LOGIN' --password='$PASS' --archive --gzip' < "$LATEST_BACKUP"

if [ $? -eq 0 ]; then
  echo "База данных успешно восстановлена из бэкапа: $LATEST_BACKUP"
else
  echo "Ошибка при восстановлении базы данных"
  exit 1
fi