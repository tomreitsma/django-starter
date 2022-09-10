import os

from decouple import config

from settings import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': config("DB_NAME"),
        'HOST': config("DB_HOST", "db"),
        'USER': config("DB_USER"),
        'PASSWORD': config("DB_PASS")
    }
}
