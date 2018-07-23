from django.urls import path, re_path
from . import views

urlpatterns = [
    # /login/
    path('', views.index, name='index'),


]

streamline.com/login
