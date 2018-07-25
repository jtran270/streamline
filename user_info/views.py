from django.shortcuts import render
from django.shortcuts import redirect
from global_var_and_func import LISTENER_USERID, sql_update_cmd, sql_fetchone_cmd, sql_fetchall_cmd


# Create your views here.


def user_info(request, user_id):
    context = {'user_id': user_id}
    return render(request, 'user_info/user_info.html', context)


def detail(request, user_id):

    if "select_detail" in request.POST:
        selected_value = request.POST["select_detail"]

        context = {'user_id': user_id,
                   'selected_value': selected_value}

        get_user_sql = "SELECT {} FROM {} " \
                       "WHERE UserId = {};".format(selected_value, LISTENER_USERID, user_id)
        print(get_user_sql)
        result = sql_fetchone_cmd(get_user_sql)
        response = result[0]

        if selected_value == 'email':
            context['email'] = response
        elif selected_value == 'firstname':
            context['firstname'] = response
        elif selected_value == 'lastname':
            context['lastname'] = response
        elif selected_value == 'age':
            context['age'] = response

        return render(request, 'user_info/detail.html', context)

    else:
        selected_value = None

    return render(request, 'user_info/detail.html', {'selected_value': selected_value,'user_id': user_id})


def update_age(request, user_id):
    if request.method == 'POST':
        age = request.POST.get('new_age', None)
        if age != '':
            update_age_sql = "UPDATE {} SET Age={} WHERE UserId={};".format(LISTENER_USERID, age, user_id)
            print(update_age_sql)
            sql_update_cmd(update_age_sql)
            return redirect("/user_info/" + str(user_id) + "/detail/")

    context = {'user_id' : user_id}
    return render(request, 'user_info/update.html', context)


def show_songs(request, user_id):
    context = {}
    if "select_genre" in request.POST:
        selected_value = request.POST["select_genre"]

        # context = {'user_id': user_id,
        #            'selected_value': selected_value}
        #
        # get_user_sql = "SELECT {} FROM {} " \
        #                "WHERE UserId = {};".format(selected_value, LISTENER_USERID, user_id)
        #
        #
        # print(get_user_sql)
        # result = sql_fetchall_cmd(get_user_sql)
        # response = result[0]

        # if selected_value == 'email':
        #     context['email'] = response
        # elif selected_value == 'firstname':
        #     context['firstname'] = response
        # elif selected_value == 'lastname':
        #     context['lastname'] = response
        # elif selected_value == 'age':
        #     context['age'] = response

        return render(request, 'user_info/show_songs.html', {'user_id': user_id})

    else:
        selected_value = None

    return render(request, 'user_info/show_songs.html', {'selected_value': selected_value,'user_id': user_id})
