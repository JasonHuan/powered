# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import random, string

from django.db import models
from django.contrib.postgres.fields import ArrayField

from django.core.validators import RegexValidator

class Category(models.Model):
    name = models.CharField(max_length=25)
    description = models.CharField(max_length=100, blank=True)
    parent = models.ForeignKey("Category", on_delete=models.SET_NULL, null=True, blank=True)

    #picture
    

    def __str__(self):
        return str(self.name)


class OrderPlace(models.Model):
    place_name = models.CharField(max_length=50)
    address = models.CharField(max_length=100)

    lat = models.DecimalField(max_digits=9, decimal_places=7)
    lng = models.DecimalField(max_digits=10, decimal_places=7)

    #Picture of icon

    def __str__(self):
        return str(self.place_name)

class OrderItem(models.Model):
    item_name = models.CharField(max_length=100)
    description = models.CharField(max_length=300, null=True, blank=True)
    price = models.DecimalField(max_digits=6, decimal_places=2)
    parent_category = models.ForeignKey(Category, null=True, on_delete=models.SET_NULL)

    #Where to get this item from
    place = models.ForeignKey(OrderPlace, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return str(self.item_name)

    