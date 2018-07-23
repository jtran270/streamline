from django.urls import path, re_path

from . import views

urlpatterns = [
    # user_info
    path('', views.user_info, name='user_info'),
]
