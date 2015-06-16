# coding: utf-8

from django.shortcuts import render
from django.http import HttpResponse

def hello_world(request):
    return HttpResponse('Hello world!')
