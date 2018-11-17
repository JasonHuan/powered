# -*- coding: utf-8 -*-
# Generated by Django 1.11.7 on 2018-11-17 00:07
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=25)),
                ('description', models.CharField(max_length=100)),
                ('parent', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='categories.Category')),
            ],
        ),
        migrations.CreateModel(
            name='OrderItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('item_name', models.CharField(max_length=100)),
                ('description', models.CharField(max_length=300, null=True)),
                ('price', models.DecimalField(decimal_places=2, max_digits=6)),
                ('parent_category', models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='categories.Category')),
            ],
        ),
        migrations.CreateModel(
            name='OrderPlace',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('place_name', models.CharField(max_length=50)),
                ('address', models.CharField(max_length=100)),
            ],
        ),
        migrations.AddField(
            model_name='orderitem',
            name='place',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='categories.OrderPlace'),
        ),
    ]
