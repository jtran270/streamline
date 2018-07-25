from django.urls import path, re_path

from . import views

urlpatterns = [
    # /user_info/7/
    path('<int:user_id>/', views.user_info, name='user_info'),

    # /user_info/7/detail
    path('<int:user_id>/detail/', views.detail, name='detail'),
    # /user_info/7/update/
    path('<int:user_id>/update/', views.update_age, name='update_age'),

    #/user_info/7/show_songs/
    path('<int:user_id>/show_songs/', views.show_songs, name='show_songs'),

    # /user_info/7/playlist/
    path('<int:user_id>/playlist/', views.display_playlist, name='display_playlist'),

    # /user_info/7/lucky/
    path('<int:user_id>/lucky/', views.nested_agg, name='nested_agg'),

]
