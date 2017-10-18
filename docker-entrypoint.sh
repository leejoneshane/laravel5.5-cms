#!/bin/sh
set -euo pipefail

if [[ "${DB_HOST}" != "db" ]]; then
  if mysqlshow --host=${DB_HOST} --user=${DB_USER} --password=${DB_PASSWORD} ${DB_DATABASE}; then
    echo "database exist!"
  else
    php artisan migrate --seed
  fi

  php artisan storage:link
  php artisan key:generate
fi

if [[ "${MAIL}" != "your@mail.addr" ]]; then
  sed -ri -e "s/^(\s*ServerAdmin).*$/\1 ${MAIL}/g" /etc/apache2/httpd.conf
fi

rm -f /run/apache2/httpd.pid
exec httpd -DFOREGROUND
