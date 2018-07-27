from django.urls import path, re_path

from . import views

urlpatterns = [
    # /user_info/7/
    path('<int:user_id>/', views.user_info, name='user_info'),

    # /user_info/7/detail/
    path('<int:user_id>/detail/', views.detail, name='detail'),
    # /user_info/7/update/
    path('<int:user_id>/update/', views.update_age, name='update_age'),

    # /user_info/7/all_users/
    path('<int:user_id>/all_users/', views.show_all_users, name='show_all_users'),

    #/user_info/7/show_songs/
    path('<int:user_id>/show_songs/', views.show_songs, name='show_songs'),

    # /user_info/7/playlist/
    path('<int:user_id>/playlist/', views.display_playlist, name='display_playlist'),

    # /user_info/7/lucky/
    path('<int:user_id>/lucky/', views.nested_agg, name='nested_agg'),

    # /user_info/7/songs_in_all/
    path('<int:user_id>/playlist/songs_in_all/', views.songs_in_all, name='songs_in_all'),

]
