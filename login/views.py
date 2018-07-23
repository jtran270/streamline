from django.shortcuts import render
from django.shortcuts import redirect
from django.http import HttpResponse
# Create your views here.

from django.db import connection

LISTENER_EMAIL = "login_listeneremail"
LISTENER_USERID = "login_listeneruserid"

def sql_cmd(query):
    with connection.cursor() as cursor:
        cursor.execute(query)
        row = cursor.fetchone()
    return row

def login(request):
    if request.method == 'POST':
        user_email = request.POST.get('user_email', None)
        password = request.POST.get('password',None)

        login_sql = "SELECT email,password FROM {} WHERE email = \'{}\' AND \
        password = \'{}\';".format(LISTENER_EMAIL,user_email,password)
        result_sql = sql_cmd(login_sql)
        if result_sql:
            print (result_sql)
            #return render(request, 'user_info/user_info.html')
            return redirect('/user_info/')
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
