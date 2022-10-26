# Django starter

Simple starter skeleton for quickly getting a new Django project off the ground.

## Requirements

- Docker
- Docker compose

## Getting started

```bash
$ docker-compose build
$ docker-compose up
```

### Create superuser
```bash
$ docker exec -it django-starter-app-1 python ./manage.py createsuperuser
```
