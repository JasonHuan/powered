from django.conf.urls import include, url
from rest_framework import routers
from profiles import views as profiles_views

from django.contrib import admin
admin.autodiscover()

from profiles.urls import router as users_router


router = routers.DefaultRouter()

router.registry.extend(users_router.registry)

urlpatterns = [
    url(r'^drf/', include(router.urls)),
    url(r'^admin/', admin.site.urls),
    url(r'^api-auth/', include('rest_framework.urls', namespace='rest_framework')),
    url(r'^profiles/', include('profiles.urls', namespace='profiles')),
    url(r'^orders/', include('orders.urls', namespace='orders')),
    url(r'^categories/', include('categories.urls', namespace='categories')),
    url(r'^o/', include('oauth2_provider.urls', namespace='oauth2_provider')),
]
