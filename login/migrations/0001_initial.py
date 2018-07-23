# Generated by Django 2.0.7 on 2018-07-23 08:46

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ListenerUserId',
            fields=[
                ('user_id', models.IntegerField(primary_key=True, serialize=False)),
                ('email', models.CharField(max_length=255, unique=True)),
                ('first_name', models.CharField(blank=True, max_length=255, null=True)),
                ('last_name', models.CharField(blank=True, max_length=255, null=True)),
                ('age', models.IntegerField(blank=True, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='ListenerEmail',
            fields=[
                ('email', models.ForeignKey(db_column='email', on_delete=django.db.models.deletion.DO_NOTHING, primary_key=True, serialize=False, to='login.ListenerUserId')),
                ('password', models.CharField(blank=True, max_length=255, null=True)),
            ],
        ),
    ]