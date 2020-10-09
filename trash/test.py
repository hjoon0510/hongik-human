# -*- coding: utf-8 -*-

# print('정보들을 데이타베이스의 테이블에 삽입합니다.')

# Mysql Database: Insert Into....
# @see 
# https://www.tutorialspoint.com/python/python_database_access.htm
# https://www.w3schools.com/python/python_mysql_insert.asp

import MySQLdb
import config as cfg
from datetime import datetime

#reload(cfg)
# config.setdefaultencoding('utf-8')
#cfg.setdefaultencoding('utf-8')

timestamp = datetime.now().strftime('%Y-%m-%d %H:%M:%S')
print(timestamp)

# Open database connection
db = MySQLdb.connect(cfg.mysql['host'],cfg.mysql['user'],cfg.mysql['passwd'],cfg.mysql['db'])

# Prepare a cursor object using cursor() method
cursor = db.cursor()

# Prevent broken korean statements
db.query("set names utf8;")
db.query("set character_set_connection=utf8;")
db.query("set character_set_server=utf8;")
db.query("set character_set_client=utf8;")
db.query("set character_set_results=utf8;")
db.query("set character_set_database=utf8;")

# Run a mysql command
violation=7
if violation >= 1:
#    try:
        sql = """INSERT INTO covid_sd (time, site, location, violation) VALUES (%s, %s, %s, %s) """
        #record_tuple = (timestamp, cfg.covid_sd['site'].encode('utf-8').decode('ascii', 'ignore'), cfg.covid_sd['location'].encode('utf-8').decode('ascii', 'ignore'), violation)
        record_tuple = (timestamp, cfg.covid_sd['site'].encode('cp1252', errors='ignore'), cfg.covid_sd['location'].encode('cp1252', errors='ignore'), violation)
        cursor.execute(sql, record_tuple)
        db.commit()
        cursor.close()
        print("Record inserted successfully into a table.")
#    except:
#        db.rollback()
#        print("Failed to insert a record into a table.")
   
#    # disconnect from server
#    db.close()
