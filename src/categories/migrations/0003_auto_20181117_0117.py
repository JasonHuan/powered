# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-11-17 01:17
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('categories', '0002_auto_20181117_0010'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orderitem',
            name='description',
            field=models.CharField(blank=True, max_length=300, null=True),
        ),
    ]
