from django.db import connection

LISTENER_EMAIL = "ListenerEmail"
LISTENER_USERID = "ListenerUserID"


def sql_fetchone_cmd(query):
    with connection.cursor() as cursor:
        cursor.execute(query)
        row = cursor.fetchone()
    return row


def sql_fetchall_cmd(query):
    with connection.cursor() as cursor:
        cursor.execute(query)
        row = cursor.fetchone()
    return row


def sql_update_cmd(query):
    with connection.cursor() as cursor:
        cursor.execute(query)
