from django.conf.urls import include, url

from rest_framework import routers

from . import views


router = routers.DefaultRouter()
router.register(r'orders', views.OrderViewSet)

urlpatterns = [
    url(r'^open/?$', views.OpenOrdersView.as_view(), name='open_orders'),
    url(r'^new/?$', views.CreateOrderView.as_view(), name = 'new_order'),

    #To set user who hits this endpoint as the courier
    #url(r'^accept/?$', views.AcceptOrderView.as_view(), name = 'accept_order'),


]