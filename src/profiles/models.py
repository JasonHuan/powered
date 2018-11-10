# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import random, string

from django.db import models
from django.contrib.postgres.fields import ArrayField

from django.contrib.auth.models import User

from django.core.validators import RegexValidator

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    phone = models.CharField(max_length=15, null=True)
    #Profile pic to come later
    #common locations

    #Payment/balance

    #verified = models.BooleanField(default=False)
    #verification_code = models.CharField(max_length=VERIFICATION_CHAR_NUM, null=True, default=None, blank=True)

    # @staticmethod
    # def generate_verification_code():
    #     return ''.join(random.choices(string.ascii_uppercase+string.digits, k=Profile.VERIFICATION_CHAR_NUM))

    def __str__(self):
        return str(self.user)

    