from django.shortcuts import render
from django.shortcuts import redirect
from global_var_and_func import LISTENER_USERID, sql_update_cmd,sql_fetchone_cmd,sql_fetchall_cmd

# Create your views here.


def user_info(request, user_id):
    context = {'user_id': user_id}
    return render(request, 'user_info/user_info.html', context)

def display_playlist(request, user_id):
    #Output playlist name, and all song-related info for user logged in
    #result returns:playlistname, songname, stagename, albumname, tracklength
    get_playlist_sql = "SELECT PIS.playlistname, PIS.songname, AID.stagename, A.albumname, CS.tracklength \
                    FROM playlistincludessongs PIS \
                    JOIN containsong CS ON CS.albumid = PIS.albumid AND CS.songname = PIS.songname \
                    JOIN Album A ON A.albumid = CS.albumid \
                    JOIN createalbum CA ON CA.albumid = A.albumid\
                    JOIN ArtistUserId AID ON AID.userid = CA.userid\
                    WHERE PIS.userid = 6;"
    result = sql_fetchall_cmd(get_playlist_sql)
    context = {'user_id': user_id,
                'result': result
               }
    print (result)
    return render(request, 'user_info/playlist.html', context)

def detail(request, user_id):
    get_user_sql = "SELECT * FROM {} " \
                   "WHERE UserId = {};".format(LISTENER_USERID, user_id)
    print(get_user_sql)
    result = sql_fetchone_cmd(get_user_sql)
    # print(result)

    # result returns a tuple representing a row. Grab values according the order
    # in this schema: listener_user_id (User_ID,Email,First_Name,Last_Name,Age)
    context = {'user_id': result[0],
               'email': result[1],
               'first_name': result[2],
               'last_name': result[3],
               'age': result[4]}

    return render(request, 'user_info/detail.html', context)


def update_age(request, user_id):
    if request.method == 'POST':
        print("I got here")
        age = request.POST.get('new_age', None)
        if age != '':
            update_age_sql = "UPDATE {} SET Age={} WHERE UserId={};".format(LISTENER_USERID, age, user_id)
            print(update_age_sql)
            sql_update_cmd(update_age_sql)
            return redirect("/user_info/" + str(user_id) + "/detail/")

    context = {'user_id' : user_id}
    return render(request, 'user_info/update.html', context)
