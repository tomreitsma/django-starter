#!/bin/env bash

set -e

if [ -n "$DB_HOST" ]; then
  ./wait-for-it.sh "$DB_HOST:$DB_PORT"
fi

python manage.py migrate
python manage.py runserver 0.0.0.0:8000
