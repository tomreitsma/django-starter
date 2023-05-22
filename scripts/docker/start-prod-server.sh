#!/bin/sh

/bin/bash /scripts/wait-for-db.sh

echo $DJANGO_STATIC_ROOT

python manage.py migrate
python manage.py collectstatic --noinput

echo "Starting server..."
gunicorn wsgi --workers=8 --bind 0.0.0.0:8000 --timeout 60 --access-logfile - --error-logfile -
