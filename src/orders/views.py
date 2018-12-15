# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import random, string, re

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

from profiles.models import Profile
from categories.models import OrderItem
from .models import Order

from .serializers import OrderSerializer




class OrderViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows orders to be viewed
    """
    queryset = Order.objects.all().order_by('order_time')
    serializer_class = OrderSerializer


class CreateOrderView(generics.CreateAPIView):
    """
    API endpoint that allows an order to be created.
    """
    permission_classes = tuple()

    def post(self, request):

        customer = get_object_or_404(Profile, user=self.request.user)

        print(request.data)

        # #For now for Android app to work
        # cust_phone = request.data.get("customer_phone")
        # customer = get_object_or_404(Profile, phone=cust_phone)

        address = request.data.get('delivery_address')
        fee = request.data.get('fee', 0)

        new_order = Order(
            customer = customer,
            delivery_address = address,
            delivery_fee = fee,
            )


        items = request.data.get('items')


        new_order.save()

        for item in items:
            dict(item)
            order_id = item['id']

            new_order.items.add(get_object_or_404(OrderItem, id=order_id))

        new_order.save()

        return Response(OrderSerializer(new_order).data)


    
class OpenOrdersView(generics.ListAPIView):
    serializer_class = OrderSerializer

    permission_classes = tuple()

    def get_queryset(self):
        return Order.objects.filter(order_status="OP")

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(*args, **kwargs)

        serializer = OrderSerializer(queryset, many=True)

        data = {"type": 'order', "orders": serializer.data}
        return Response(data)






    
