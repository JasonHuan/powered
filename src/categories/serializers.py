from rest_framework import serializers
from rest_framework.fields import ListField
from drf_writable_nested import WritableNestedModelSerializer
from django.shortcuts import render, get_object_or_404

from django.contrib.auth.models import User
from .models import Category, OrderPlace, OrderItem


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ('id', 'name', 'description')
        read_only_fields = ('id',)


class OrderPlaceSerializer(WritableNestedModelSerializer):
    class Meta:
        model = OrderPlace
        fields = ('id', 'place_name', 'address', 'lat', 'lng')
        read_only_fields = ('id',)


class OrderItemSerializer(WritableNestedModelSerializer):
    place = OrderPlaceSerializer()
    
    class Meta:
        model = OrderItem
        fields = ('id', 'item_name', 'description', 'price', 'place',)
        read_only_fields = ('id', 'item_name', 'description', 'price', 'place',)





