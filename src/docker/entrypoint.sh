#!/bin/env bash

while ! python -c "import MySQLdb; db=MySQLdb.connect(host=\"$DB_HOST\", passwd=\"$DB_PASS\")"; do
    sleep 1
done

python manage.py migrate
python manage.py runserver 0.0.0.0:8000
