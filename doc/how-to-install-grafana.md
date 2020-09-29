

### Introduction

**Grafana** is an open source metric analytics & visualization suite. It is most commonly used for visualizing time series data for infrastructure and application analytics but many use it in other domains including industrial sensors, home automation, weather, and process control.

* https://grafana.com/
* http://docs.grafana.org/guides/getting_started/


**InfluxDB** is an open-source time series database developed by InfluxData.
it is written in Go and optimized for fast, high-availability storage and retrieval of time series data in fields such as operations monitoring, application metrics, Internet of Things sensor data, and real-time analytics.

* https://www.influxdata.com/
* https://docs.influxdata.com/influxdb/v0.8/introduction/getting_started/
* https://pimylifeup.com/raspberry-pi-influxdb/



### How to install influx DB (Port 8086)

```bash
sudo apt update
sudo apt upgrade -y

wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/os-release
echo "deb https://repos.influxdata.com/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/influxdb.list

sudo apt update && sudo apt install -y influxdb influxdb-client

sudo systemctl unmask influxdb.service
sudo systemctl start influxdb
sudo systemctl enable influxdb.service
firefox http://localhost:8086
```

Then, create a new table with influx client as follows. 

```bash
influx

create database home
use home

create user grafana with password 'grafana2848' with all privileges
grant all privileges on home to grafana

show users

user admin
---- -----
grafana true

exit 
```

### How to install Grafana (Port:3000)

* Installing Grafana manually
```bash
wget https://dl.grafana.com/oss/release/grafana_6.6.1_armhf.deb
sudo dpkg -i grafana_6.6.1_armhf.deb
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
http://localhost:3000
user: admin
pass: admin
```

* Installing Grafana with apt-get
```bash
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee /etc/apt/sources.list.d/grafana.list

sudo apt update && sudo apt install -y grafana
sudo vi /etc/influxdb/influxdb.conf

sudo systemctl unmask grafana-server.service
sudo systemctl start grafana-server
sudo systemctl enable grafana-server.service
http://<IPADDRESS>:3000
user: admin
pass: admin
```

### Add Influx as a Grafana data source
* Setting
  - name: influx  ( default: on)
  - HTTP: url: http://127.0.0.1:8086 , Access:Server(default)

* InfluxDB details
  - Database: home
  - User: grafana (Password:****)
  - HTTP Method: GET

### Collecting system statistics in Influx on Raspberry Pi

Insall python packages. 
```bash
sudo apt install -y python-pip
sudo pip install psutil influxdb

```

Create a python script.
```bash
vi /home/pi/rpi-stats-influx.py

#!/usr/bin/env python3

import datetime
import psutil
from influxdb import InfluxDBClient

# influx configuration - edit these
ifuser = "grafana"
ifpass = "<yourpassword>"
ifdb   = "home"
ifhost = "127.0.0.1"
ifport = 8086
measurement_name = "system"

# take a timestamp for this measurement
time = datetime.datetime.utcnow()

# collect some stats from psutil
disk = psutil.disk_usage('/')
mem = psutil.virtual_memory()
load = psutil.getloadavg()

# format the data as a single measurement for influx
body = [
    {
        "measurement": measurement_name,
        "time": time,
        
        "fields": {
            "load_1": load[0],
            "load_5": load[1],
            "load_15": load[2],
            "disk_percent": disk.percent,
            "disk_free": disk.free,
            "disk_used": disk.used,
            "mem_percent": mem.percent,
            "mem_free": mem.free,
            "mem_used": mem.used,
        }
    }
]

# connect to influx
ifclient = InfluxDBClient(ifhost,ifport,ifuser,ifpass,ifdb)

# write the measurement
ifclient.write_points(body)
```

Please run ./rpi-stats-influx.py and check that no errors are thrown. 
If all is good, we can set the script to run reqularly using cron.
Then, task in the crontab list
```bash
./rpi-stats-influx.py
sudo vi /etc/crontab (or crontab -e)
* * * * * /home/pi/rpi-stats-influx.py
```

### Collecting SpeedTest results in Influx on Raspberry Pi

```bash
sudo apt install -y python-pip
sudo pip install speedtest-cli speedtest 
sudo pip install influxdb
```

Then, make a python script to network speed data into influxDB.

```bash
vi /home/pi/rpi-speedtest-influx.py

#!/usr/bin/env python3

import datetime
import speedtest
from influxdb import InfluxDBClient

# influx configuration - edit these
ifuser = "grafana"
ifpass = "<yourpassword>"
ifdb   = "home"
ifhost = "127.0.0.1"
ifport = 8086
measurement_name = "speedtest"

# take a timestamp for this measurement
time = datetime.datetime.utcnow()

# run a single-threaded speedtest using default server
s = speedtest.Speedtest()
s.get_best_server()
s.download(threads=1)
s.upload(threads=1)
res = s.results.dict()

# format the data as a single measurement for influx
body = [
    {
        "measurement": measurement_name,
        "time": time,
        "fields": {
            "download": res["download"],
            "upload": res["upload"],
            "ping": res["ping"]
        }
    }
]

# connect to influx
ifclient = InfluxDBClient(ifhost,ifport,ifuser,ifpass,ifdb)

# write the measurement
ifclient.write_points(body)
```

Check if data are saved in Influx database. 
```bash
$ influx 
> auth
Username: ***
Password: ***
> use home
> select * from "speedtest"
```
Now, create task in the crontab list. 
```bash
vi /etc/crontab
*/15 * * * * /home/pi/rpi-speedtest-influx.py
```

Finally, connect to the below webpage.
* http://192.168.10.122:3000/d/RgsXY0igk/influx-speedtest?orgId=1
  (admin: admin)
