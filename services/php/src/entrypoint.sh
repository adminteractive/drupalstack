#!/bin/bash

# Add local user.
USER_ID=${LOCAL_USER_ID:-9001}
useradd --shell /bin/bash -u $USER_ID -o -c "" -m container

cron -f &
docker-php-entrypoint php-fpm
