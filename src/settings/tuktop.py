import os

from settings import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'django-starter',
        'HOST': '0.0.0.0',
        'USER': 'user',
        'PASSWORD': 'password'
    }
}
