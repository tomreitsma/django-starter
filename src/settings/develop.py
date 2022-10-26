import os

from decouple import config

from settings import *

ALLOWED_HOSTS = [
    '127.0.0.1'
]

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': config("DB_NAME"),
        'HOST': config("DB_HOST", "db"),
        'USER': config("DB_USER"),
        'PASSWORD': config("DB_PASS")
    }
}

