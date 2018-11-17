# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from . import models

# Register your models here.


@admin.register(models.Category)
class CategoryAdmin(admin.ModelAdmin):
    pass

@admin.register(models.OrderItem)
class OrderItemAdmin(admin.ModelAdmin):
    pass

@admin.register(models.OrderPlace)
class OrderPlaceAdmin(admin.ModelAdmin):
    pass



