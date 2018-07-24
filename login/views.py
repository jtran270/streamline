from django.shortcuts import render
from django.shortcuts import redirect
from global_var_and_func import LISTENER_USERID, LISTENER_EMAIL, sql_fetchone_cmd

# Create your views here.


def login(request):
    if request.method == 'POST':
        user_email = request.POST.get('user_email', None)
        password = request.POST.get('password', None)

        login_sql = "SELECT email,password FROM {} WHERE email = \'{}\' AND "\
                    "password = \'{}\';".format(LISTENER_EMAIL, user_email, password)

        print(login_sql)

        result_sql = sql_fetchone_cmd(login_sql)

        if result_sql:
            print(result_sql)

            fetch_user_id_sql = "SELECT User_Id from {},{} " \
                                "WHERE {}.email = {}.email " \
                                "AND {}.email=\'{}\' ;".format(LISTENER_EMAIL, LISTENER_USERID,
                                                               LISTENER_EMAIL, LISTENER_USERID,
                                                               LISTENER_USERID, result_sql[0])
            user_id = sql_fetchone_cmd(fetch_user_id_sql)[0]
            url = '/user_info/{}/'.format(user_id)
            return redirect(url)
        else:
            message = "Entered the wrong user name or password try again please"

        return render(request, 'login/login.html', {"message": message})
    return render(request, 'login/login.html')


'''
def search(request):
    if request.method == 'POST':
        search_id = request.POST.get('textfield', None)
        try:
            user = Person.objects.get(name = search_id)
            #do something with user
            html = ("<H1>%s</H1>", user)
            return HttpResponse(html)
        except Person.DoesNotExist:
            return HttpResponse("no such user")
    else:
        return render(request, 'form.html')

def index(request):
    result = my_custom_sql()

    a = [0] * (len(result) - 6)

    for i in range(len(result)):
        a.append(result[i][0])

    context = {'email': a}
    print(context)
    return render(request, 'login/index.html', context)
'''
