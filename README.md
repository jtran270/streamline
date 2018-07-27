LINUX SETUP

------------------------------------------------------------------
####  Set up your database
------------------------------------------------------------------
1. In terminal: type 'psql'
2. In postgresql: 
```
your_username=#  \i path/to/file/streamline/prepare_script.sql
```

3. Type \q to quit psql

4. Sign back in again using the User you just created in prepare_script.
In terminal: 
```
psql -d streamline_db -U sl_admin
```

5. Create tables:

```
streamline_db=> \i /path/to/file/streamline/create_database_script.sql
```

------------------------------------------------------------------
####  Set up your website
------------------------------------------------------------------
1. cd to streamline repo
2. Run migration to create Django-specific tables in your database

```
python3 manage.py migrate
```

3. Should be ready to run now:
```
python3 manage.py runserver
```



WINDOWS SETUP
------------------------------------------------------------------
INSTALLATION:
------------------------------------------------------------------
Install Python (3.5) and PyCharm
```
https://www.jetbrains.com/pycharm/download/#section=windows
```

Execute the following commands in PowerShell/cmd:
```
pip install -U pip
pip install django
pip install psycopg2
```

NOTE: You may require Visual Studio 10 and/or .NET Framework 4.


------------------------------------------------------------------
RUNNING THE DATABASE:
------------------------------------------------------------------
In PowerShell/cmd, browse to the PostgreSQL installation directory. 
Windows 10 default is C:\Program Files\PostgreSQL

Go to the \data directory and edit the pg_hba.conf file, changing all the 'md5' to 'trust':

```
# TYPE  DATABASE        USER            ADDRESS                 METHOD

# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
# Allow replication connections from localhost, by a user with the
# replication privilege.
host    replication     all             127.0.0.1/32            trust
host    replication     all             ::1/128                 trust
```

Execute the following commands in command line to set up the DB:
```
./psql --username=postgres
\i <path_to_file>\streamline\prepare_script.sql
\q
./psql -d streamline_db -U sl_admin
\i <path_to_file>\streamline\create_database_script.sql
```


------------------------------------------------------------------
ACCESSING WEBSITE:
------------------------------------------------------------------
In PyCharm, go to the terminal view cd to the project file directory, then run migration to create Django-specific tables in your database:
```
python manage.py migrate
python manage.py runserver
```

You can access the website by going to your browser and entering in the following:
```
http://127.0.0.1:8000/login
```


------------------------------------------------------------------
RUNNING SQL QUERIES:
------------------------------------------------------------------

OPTION 1: USING POSTGRESQL GUI

Open pgAdmin 4 that was installed along with PostgreSQL
```
Tools -> Query Tool
```

Type/copy-paste the desired query
Press 'F5' or the lightening bolt symbol to execute query



OPTION 2: COMMAND LINE

Login as DB admin:
```
./psql -d streamline_db -U sl_admin
```

Execute queries (Don't forget the semicolon! Query will not execute without it unlike in DBeaver):
```
SELECT * FROM album;
```

If you want to run a .sql file with multiple queries in them:
```
./psql --username=sl_admin -f <path_to_file>/streamline/<filename>.sql streamline_db
```

