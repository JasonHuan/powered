from django.conf.urls import include, url

from rest_framework import routers

from . import views


router = routers.DefaultRouter()
router.register(r'orders', views.OrderViewSet)

urlpatterns = [

    url(r'^all_open/?$', views.OpenOrdersView.as_view(), name='open_orders'),
    url(r'^new/?$', views.CreateOrderView.as_view(), name = 'new_order'),

    #filter=all OR open, role=customer OR courier
    url(r'^me/?$', views.OwnOrdersView.as_view(), name='own_orders'),
    url(r'^(?P<order_id>[0-9]+)/?$', views.OrderView.as_view(), name = 'order_view'),

    #To set user who hits this endpoint as the courier -- immediate accpetance, no counter offer
    #GET request
    url(r'^(?P<order_id>[0-9]+)/immediate_accept/?$', views.AcceptOrderView.as_view(), name = 'accept_order'),

    #To make or view counter offers for an order
    #GET = view counter offers
    #POST = make new
    url(r'^(?P<order_id>[0-9]+)/counter_offer/?$', views.CounterOfferView.as_view(), name = 'counter_offers'),

    url(r'^(?P<order_id>[0-9]+)/complete/?$', views.CompleteOrderView.as_view(), name = 'complete_order'),

    url(r'^accept_counter_offer/(?P<offer_id>[0-9]+)/?$', views.AcceptCounterOfferView.as_view(), name = 'accept_counter_offers'),

]