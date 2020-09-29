
# How to install MySQLdb module for Python language
MySQLdb is an interface for connecting to a MySQL database server from Python. 
You make sure you have MySQLdb installed on your machine.
Then, just type the following in your Python script and execute it.
```bash
#!/usr/bin/python
import MySQLdb
```

### Install pip and mysql client library
```bash
$ sudo apt-get install python-pip python-dev libmysqlclient-dev
```

### Install MySQLdb module
You can install MysqlDB module with apt-get or pip command as follows.
* Method1:
```bash
$ sudo apt-get install python-mysqldb
```

* Method2:
```bash
$ pip install MySQL-python
```


# Backup and Restore Mysql DB

### Back up From the Command Line with mysqldump
```bash
$ sudo mysqldump -u [user] -p [database_1] [database_2] [database_etc] > [filename].sql
$ mysqldump -u root -p --all-databases > full-backup-20191116-1300.sql
$ mysqldump -u root -p sbdb > sbdb-20191116-1300.sql
```

### How to Restore MySQL with mysqldump
```bash
$ mysql -u [user] -p [database_name] < [filename].sql
$ mysql -u root -p sbdb < ./sbdb-20191116-1300.sql

```
