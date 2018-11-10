from django.conf.urls import include, url

from rest_framework import routers

from . import views


router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'profiles', views.ProfileViewSet)

urlpatterns = [
    url(r'^me/?$', views.OwnProfileView.as_view(), name='profile_me'),
    url(r'^(?P<profile_id>[0-9]+)/?$', views.ProfileView.as_view(), name = 'profile'),
    url(r'^new/?$', views.CreateUser.as_view(), name='create'),
    #url(r'^verify/?$', views.VerifyUser.as_view(), name='verify'),
    #url(r'^verify_link/?$', views.ResendVerifyUser.as_view(), name='verify_link'),
]