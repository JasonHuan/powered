# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import random, string, re
from decimal import Decimal

from django.shortcuts import render, get_object_or_404

# Create your views here.

from rest_framework import viewsets, generics
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework.exceptions import ValidationError
from rest_framework.parsers import MultiPartParser

from django.contrib.auth.models import User, Group
from django.db import transaction
from django.conf import settings
from django.db.models import Q

from .models import Category, OrderItem, OrderPlace
from .serializers import CategorySerializer, OrderItemSerializer, OrderPlaceSerializer



class CategoryViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows categories to be viewed or edited.
    """
    queryset = Category.objects.all()
    serializer_class = CategorySerializer


class OrderItemViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows order items to be viewed or edited.
    """
    queryset = OrderItem.objects.all()
    serializer_class = OrderItemSerializer

class OrderPlaceViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows order places to be viewed or edited.
    """
    queryset = OrderPlace.objects.all()
    serializer_class = OrderPlaceSerializer


class CategoryChildrenView(generics.ListAPIView):
    data_type = "category"
    permission_classes = tuple()
    def get_queryset(self, *args, **kwargs):
        parent_category_id = int(self.kwargs['category_id'])

        if parent_category_id == 0:
            return Category.objects.filter(parent=None)

        parent_category = get_object_or_404(Category, id=parent_category_id)

        #Find all child categories of the given category
        child_categories = Category.objects.filter(parent=parent_category)

        #If there are child categories, return them. If not, return child orderItems
        if child_categories.count() > 0:
            return child_categories

        self.data_type = "order_item"
        return OrderItem.objects.filter(parent_category=parent_category)


    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(*args, **kwargs)
        if self.data_type == "category":
            serializer = CategorySerializer(queryset, many=True)
        else:
            serializer = OrderItemSerializer(queryset, many=True)

        parent_category_id = int(self.kwargs['category_id'])
        if parent_category_id == 0:
            parent_category_name = "Home"
        else:
            parent_category_name = get_object_or_404(Category, id=parent_category_id).name

        data = {"type": self.data_type, "parent": parent_category_name, self.data_type: serializer.data}
        return Response(data)

class CreateOrderItemView(generics.CreateAPIView):

    def post(self, request):
        item_name = request.data['name']
        description = request.data.get('description', '')
        price = Decimal(request.data['price'])
        parent_id = int(request.data['parent_category'])
        place_id = int(request.data['place'])

        parent_category = get_object_or_404(Category, id=parent_id)
        place = get_object_or_404(OrderPlace, id=place_id)

        new_item = OrderItem(

            item_name=item_name,
            description=description,
            price=price,
            parent_category=parent_category,
            place=place,
        )

        new_item.save()

        return Response(OrderItemSerializer(new_item).data)


class ViewAllPlaces(generics.ListAPIView):
    serializer_class = OrderPlaceSerializer

    def get_queryset(self):
        return OrderPlace.objects.all()

class ViewAllCategories(generics.ListAPIView):
    serializer_class = CategorySerializer

    def get_queryset(self):
        return Category.objects.all()





    
