# coding: utf-8

from django.conf.urls import url

urlpatterns = [
    url(r'^$', 'prototype.views.index'),
    url(r'^hello/$', 'prototype.views.hello_world'),
]
