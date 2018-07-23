from django.shortcuts import render

# Create your views here.

from django.db import connection


def my_custom_sql():
    with connection.cursor() as cursor:
        cursor.execute('Select email from login_listeneruserid;')
        row = cursor.fetchall()
    return row


def index(request):
    result = my_custom_sql()

    a = [0] * (len(result) - 6)

    for i in range(len(result)):
        a.append(result[i][0])

    context = {'email': a}
    print(context)
    return render(request, 'login/index.html', context)


