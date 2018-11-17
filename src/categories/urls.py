from django.conf.urls import include, url

from rest_framework import routers

from . import views


router = routers.DefaultRouter()
router.register(r'categories', views.CategoryViewSet)
router.register(r'orderitems', views.OrderItemViewSet)
router.register(r'orderplaces', views.OrderPlaceViewSet)

urlpatterns = [
    url(r'^view_children/(?P<category_id>[0-9]+)/?$', views.CategoryChildrenView.as_view(), name='category_children'),
    url(r'^orderItem/new/?$', views.CreateOrderItemView.as_view(), name='create_order_item'),
    url(r'^orderPlace/all/?$', views.ViewAllPlaces.as_view(), name='view_all_places'),
    url(r'^all/?$', views.ViewAllCategories.as_view(), name='view_all_categories')

]