# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import random, string, re
from datetime import datetime

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
from .models import Order, OrderFeeAction

from .serializers import OrderSerializer, OrderFeeActionSerializer


class OrderViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows orders to be viewed
    """
    queryset = Order.objects.all().order_by('order_time')
    serializer_class = OrderSerializer

class OrderFeeActionViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows OrderFeeActions to be viewed
    """
    queryset = OrderFeeAction.objects.all()
    serializer_class = OrderFeeActionSerializer


class OrderView(generics.RetrieveAPIView):
    """
    View for getting order data by order id
    """
    serializer_class = OrderSerializer
    def get_object(self):
        return get_object_or_404(Order, id=int(self.kwargs['order_id']))


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
            initial_delivery_fee = fee,
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

    def get_queryset(self):
        return Order.objects.filter(order_status="OP")

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(*args, **kwargs)

        serializer = OrderSerializer(queryset, many=True)

        data = {"type": 'order', "orders": serializer.data}
        return Response(data)

class OwnOrdersView(generics.ListAPIView):
    serializer_class = OrderSerializer

    def get_queryset(self):
        query = Q()

        my_profile = get_object_or_404(Profile, user=self.request.user)

        if 'role' in self.request.GET:
            role = self.request.GET['role']

            if role == 'customer':
                query &= Q(customer=my_profile)
            elif role == 'courier':
                query &= Q(courier=my_profile)
            elif role == 'all':
                temp_q = Q(customer=my_profile)
                temp_q |= Q(courier=my_profile)

                query &= temp_q

        if 'status' in self.request.GET:
            s = self.request.GET['status']
            if s != 'all':
                query &= Q(order_status=s)

        return Order.objects.filter(query)

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset(*args, **kwargs)

        serializer = OrderSerializer(queryset, many=True)

        data = {"type": 'order', "orders": serializer.data}
        return Response(data)


class AcceptOrderView(generics.RetrieveUpdateDestroyAPIView):
    """
    View to immediately accept an order. Returns updated order object
    """

    serializer_class = OrderSerializer
    def get_object(self):
        '''
        Updates needed for order:
        courier, final_delivery_fee, status, acceptance_time
        '''
        order = get_object_or_404(Order, id=int(self.kwargs['order_id']))

        if order.order_status != "OP":
            raise ValidationError({'error': "Order has already been accepted"})

        new_courier = get_object_or_404(Profile, user=self.request.user)

        order.courier = new_courier
        order.final_delivery_fee = order.initial_delivery_fee
        order.order_status = "IP"
        order.acceptance_time = datetime.now()

        order.save()

        #Now make OrderFeeAction for this acceptance

        fee_action = OrderFeeAction(
            user = new_courier,
            amount = order.initial_delivery_fee,
            was_counter_offer = False,
            is_final_fee = True,
            for_order = order)

        fee_action.save()

        #TODO: Notify user that their order was accepted

        return order


class AcceptCounterOfferView(generics.RetrieveUpdateDestroyAPIView):
    """
    View to accept an order counter offer. Returns updated order object
    """

    serializer_class = OrderSerializer
    def get_object(self):
        '''
        Actions to take:

        - Update order
        - Mark respective offer as the final offer
        - Notify customer

        Updates needed for order:
        courier, final_delivery_fee, status, acceptance_time
        '''
        offer = get_object_or_404(OrderFeeAction, id=int(self.kwargs['offer_id']))
        order = get_object_or_404(Order, id=offer.for_order.id)
        my_profile = get_object_or_404(Profile, user=self.request.user)

        if order.order_status != "OP":
            raise ValidationError({'error': "Order has already been accepted"})

        if order.customer != my_profile:
            raise ValidationError({'error': "You do not have permission for that"})

        order.courier = offer.user
        order.final_delivery_fee = offer.amount
        order.order_status = "IP"
        order.acceptance_time = datetime.now()

        order.save()

        #Now update OrderFeeAction for this acceptance

        offer.is_final_fee = True
        offer.offer_accept_time = datetime.now()

        offer.save()

        #TODO: Notify user that their order was accepted

        return order


class CounterOfferView(generics.ListCreateAPIView):
    """
    View for both creating a counter offer and 
    listing all counter offers for an order
    """
    serializer_class = OrderFeeActionSerializer

    def get_queryset(self, *args, **kwargs):
        order = get_object_or_404(Order, id=int(self.kwargs['order_id']))

        offers = OrderFeeAction.objects.filter(for_order=order)

        return offers

    def post(self, request, *args, **kwargs):
        my_profile = get_object_or_404(Profile, user=self.request.user)
        order = get_object_or_404(Order, id=int(self.kwargs['order_id']))
        amount = request.data["amount"]

        fee_action = OrderFeeAction(
            user = my_profile,
            amount = amount,
            was_counter_offer = True,
            for_order = order)

        fee_action.save()
        
        return Response(OrderFeeActionSerializer(fee_action).data)


class CompleteOrderView(generics.RetrieveUpdateDestroyAPIView):
    """
    View to mark an order as complete
    """

    serializer_class = OrderSerializer
    def get_object(self):
        '''
        Actions to take:

        - Update order to be complete
        - Make payment to courier
        - Notify users that order is done (remind to rate, payment has been posted)
        '''
        order = get_object_or_404(Order, id=int(self.kwargs['order_id']))
        
        my_profile = get_object_or_404(Profile, user=self.request.user)

        if order.order_status != "IP":
            raise ValidationError({'error': "Order is either open or has already been marked as completed"})

        if order.customer != my_profile:
            raise ValidationError({'error': "You do not have permission to complete the order"})

        

        order.order_status = "CL"
        order.completion_time = datetime.now()

        order.save()

        #TODO: Make payment to courier


        #TODO: Notify parties that order was completed

        return order


    
