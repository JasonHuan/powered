from rest_framework import serializers
from rest_framework.fields import ListField
from drf_writable_nested import WritableNestedModelSerializer
from django.shortcuts import render, get_object_or_404

from django.contrib.auth.models import User

from profiles.models import Profile
from profiles.serializers import ProfileSerializer

from categories.models import OrderItem
from categories.serializers import OrderItemSerializer

from .models import Order, OrderFeeAction


class OrderSerializer(WritableNestedModelSerializer):
    customer = ProfileSerializer()
    courier = ProfileSerializer()

    items = OrderItemSerializer(many=True)
    
    class Meta:
        model = Order
        fields = ('id', 'customer', 'courier', 'items', 'delivery_address', 'initial_delivery_fee', 'final_delivery_fee', 'order_status', 'order_time', 'acceptance_time', 'completion_time')
        read_only_fields = ('id',)


class OrderFeeActionSerializer(WritableNestedModelSerializer):
    user = ProfileSerializer()
    #for_order = OrderSerializer()
    
    class Meta:
        model = OrderFeeAction
        fields = ('id', 'user', 'amount', 'was_counter_offer', 'is_final_fee', 'offer_made_time', 'offer_accept_time')
        read_only_fields = ('id', 'user', 'amount', 'offer_made_time')