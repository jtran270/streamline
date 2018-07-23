####  Set up your database
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


####  Set up your website
1. cd to streamline repo
2. Run migration to create Django-specific tables in your database

```
python3 manage.py migrate
```


3. Should be ready to run now:
```
python3 manage.py runserver
```


