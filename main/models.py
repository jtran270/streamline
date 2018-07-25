# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Album(models.Model):
    albumid = models.IntegerField(primary_key=True)
    albumart = models.CharField(max_length=255, blank=True, null=True)
    albumname = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'album'


class Artistemail(models.Model):
    email = models.ForeignKey('Artistuserid', on_delete=models.CASCADE, db_column='email', primary_key=True)
    password = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'artistemail'


class Artistname(models.Model):
    stagename = models.ForeignKey('Artistuserid', on_delete=models.CASCADE, db_column='stagename', primary_key=True)
    firstname = models.CharField(max_length=255, blank=True, null=True)
    lastname = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'artistname'


class Artistuserid(models.Model):
    userid = models.IntegerField(primary_key=True)
    email = models.CharField(unique=True, max_length=255)
    stagename = models.CharField(unique=True, max_length=255)

    class Meta:
        db_table = 'artistuserid'


class Containsong(models.Model):
    albumid = models.ForeignKey(Album, on_delete=models.CASCADE, db_column='albumid', primary_key=True)
    songname = models.CharField(max_length=255)
    tracklength = models.TimeField(blank=True, null=True)

    class Meta:
        db_table = 'containsong'
        unique_together = (('albumid', 'songname'),)


class Createalbum(models.Model):
    albumid = models.ForeignKey(Album, on_delete=models.CASCADE, db_column='albumid', primary_key=True)
    userid = models.ForeignKey(Artistuserid, on_delete=models.CASCADE, db_column='userid')
    creationdate = models.DateField(blank=True, null=True)

    class Meta:
        db_table = 'createalbum'
        unique_together = (('albumid', 'userid'),)


class Createplaylist(models.Model):
    userid = models.ForeignKey('Listeneruserid', on_delete=models.CASCADE, db_column='userid', primary_key=True)
    playlistname = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'createplaylist'
        unique_together = (('userid', 'playlistname'),)


class Genre(models.Model):
    genrename = models.CharField(primary_key=True, max_length=255)

    class Meta:
        db_table = 'genre'


class Havesongs(models.Model):
    albumid = models.ForeignKey(Containsong, on_delete=models.CASCADE, db_column='albumid', primary_key=True)
    songname = models.CharField(max_length=255)
    genrename = models.ForeignKey(Genre, on_delete=models.CASCADE, db_column='genrename')

    class Meta:
        db_table = 'havesongs'
        unique_together = (('albumid', 'songname', 'genrename'),)


class Isparentoflabel(models.Model):
    parentlabelname = models.ForeignKey('Label', on_delete=models.CASCADE, db_column='parentlabelname',
                                        primary_key=True,related_name='parentlabel')
    sublabelname = models.ForeignKey('Label', on_delete=models.CASCADE, db_column='sublabelname',
                                     related_name='sublabel')

    class Meta:
        db_table = 'isparentoflabel'
        unique_together = (('parentlabelname', 'sublabelname'),)


class Label(models.Model):
    labelname = models.CharField(primary_key=True, max_length=255)

    class Meta:
        db_table = 'label'


class Listeneremail(models.Model):
    email = models.ForeignKey('Listeneruserid', to_field='email', on_delete=models.CASCADE, db_column='email', primary_key=True)
    password = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        db_table = 'listeneremail'



class Listeneruserid(models.Model):
    userid = models.IntegerField(primary_key=True)
    email = models.CharField(unique=True, max_length=255)
    firstname = models.CharField(max_length=255, blank=True, null=True)
    lastname = models.CharField(max_length=255, blank=True, null=True)
    age = models.IntegerField(blank=True, null=True)

    class Meta:
        db_table = 'listeneruserid'


class Playlistincludessongs(models.Model):
    albumid = models.ForeignKey(Containsong, to_field='albumid', on_delete=models.CASCADE, db_column='albumid', primary_key=True)
    songname = models.CharField(max_length=255)
    userid = models.ForeignKey(Createplaylist, to_field='userid', on_delete=models.CASCADE, db_column='userid')
    playlistname = models.CharField(max_length=255)

    class Meta:
        db_table = 'playlistincludessongs'
        unique_together = (('albumid', 'songname', 'userid', 'playlistname'),)


class Underlabel(models.Model):
    userid = models.ForeignKey(Artistuserid, on_delete=models.CASCADE, db_column='userid', primary_key=True)
    albumid = models.ForeignKey(Album, on_delete=models.CASCADE, db_column='albumid')
    labelname = models.ForeignKey(Label, on_delete=models.CASCADE, db_column='labelname')

    class Meta:
        db_table = 'underlabel'
        unique_together = (('userid', 'albumid', 'labelname'),)
