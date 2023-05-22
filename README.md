# Django starter

Simple starter skeleton for quickly getting a new Django project off the ground.

## Requirements

- Docker
- Docker compose

## Getting started

Copy `.env.example` to `.env` and set the environment variables.

Then run:

```bash
$ docker-compose build
$ docker-compose up
```

### Create superuser
```bash
$ docker-compose run --rm app python ./manage.py createsuperuser
```
