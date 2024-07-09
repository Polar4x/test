#!/bin/bash

MONGO_CONTAINER="mongodb"
ADMINMONGO_CONTAINER="adminmongo"

docker-compose down --remove-orphans

docker volume rm $(docker volume ls -qf dangling=true | grep -v backup)

docker-compose up -d --force-recreate

if [ $(docker ps -q -f name=$MONGO_CONTAINER | wc -l) -eq 1 ] && [ $(docker ps -q -f name=$ADMINMONGO_CONTAINER | wc -l) -eq 1 ]; then
  echo "Контейнеры успешно пересозданы и запущены."
else
  echo "Ошибка при пересоздании и запуске контейнеров."
  exit 1
fi