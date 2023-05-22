#!/bin/sh

/bin/bash /scripts/wait-for-db.sh

python manage.py migrate
python manage.py collectstatic --noinput

echo "Starting server..."
python manage.py runserver 0.0.0.0:8000
