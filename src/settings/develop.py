import os

from settings import *

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'django-starter',
        'HOST': 'db',
        'USER': 'root',
        'PASSWORD': 'secret'
    }
}
