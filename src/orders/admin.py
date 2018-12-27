# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.contrib import admin
from . import models

# Register your models here.


@admin.register(models.Order)
class OrderAdmin(admin.ModelAdmin):
    pass

@admin.register(models.OrderFeeAction)
class OrderFeeActionAdmin(admin.ModelAdmin):
    pass



