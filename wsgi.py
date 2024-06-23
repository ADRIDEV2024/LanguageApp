import os
from channels.routing import ProtocolTypeRouter
from django.core.wsgi import get_wsgi_application

django_wsgi_app = get_wsgi_application()

os.environ.setdefault("DJANGO_SETTINGS_MODULE", "LanguageApp.settings")
application = ProtocolTypeRouter({ "http": django_wsgi_app,})

WSGI_APPLICATION = 'LanguageApp.wsgi.application'
