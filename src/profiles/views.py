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

from .models import Profile
from .serializers import ProfileSerializer, UserSerializer



class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer


class ProfileViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows profiles to be viewed or edited.
    """
    queryset = Profile.objects.all()
    serializer_class = ProfileSerializer


class CreateUser(generics.CreateAPIView):
    """
    API endpoint that allows a user to be created.
    """
    permission_classes = tuple()
    
    @transaction.atomic
    def post(self, request):
        if User.objects.filter(email__iexact=request.data['email']).exists():
            raise ValidationError({'error': 'Email already registered'})

        new_user = User.objects.create_user(
            username=request.data['email'],
            email=request.data['email'],
            password=request.data['password'],
            first_name=request.data.get('first_name', ''),
            last_name=request.data.get('last_name', ''),
        )


        new_profile = Profile(
            user=new_user,
        )

        new_profile.save()
        
        return Response(ProfileSerializer(new_profile).data)
        

class ProfileView(generics.RetrieveAPIView):
    """
    View for getting profile data by profile id
    """
    serializer_class = ProfileSerializer
    def get_object(self):
        return get_object_or_404(Profile, id=int(self.kwargs['profile_id']))


class OwnProfileView(generics.RetrieveUpdateDestroyAPIView):

    serializer_class = ProfileSerializer
    def get_object(self):
        return get_object_or_404(Profile, user=self.request.user)






    
