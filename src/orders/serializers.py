from rest_framework import serializers
from rest_framework.fields import ListField
from drf_writable_nested import WritableNestedModelSerializer
from django.shortcuts import render, get_object_or_404

from django.contrib.auth.models import User

from profiles.models import Profile
from profiles.serializers import ProfileSerializer

from categories.models import OrderItem
from categories.serializers import OrderItemSerializer

from .models import Order


class OrderSerializer(WritableNestedModelSerializer):
    customer = ProfileSerializer()
    courier = ProfileSerializer()

    items = OrderItemSerializer(many=True)
    
    class Meta:
        model = Order
        fields = ('id', 'customer', 'courier', 'items', 'delivery_address', 'delivery_fee', 'order_status', 'order_time')
        read_only_fields = ('id',)

