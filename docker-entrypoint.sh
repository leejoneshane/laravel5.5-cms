#!/bin/sh
set -euo pipefail

if [[ "${DB_HOST}" != "db" ]]; then
  php artisan key:generate
  php artisan storage:link
  php artisan migrate
fi

if [[ "${MAIL}" != "your@mail.addr" ]]; then
  sed -ri -e "s/^(\s*ServerAdmin).*$/\1 ${MAIL}/g" /etc/apache2/httpd.conf
fi

rm -f /run/apache2/httpd.pid
exec httpd -DFOREGROUND
