#!/usr/bin/env python3
# Title: Simple motion prober software
# Caution:
# 1. Check location of  + DC voltage and GND line
# 2. Change sensor and pulse button (orange color) appropriately
#


# PIR Motion Sensor:                ,--------.
# . Power (+DC voltage):  2,2 ------|        |
# . Signal(Output)     : 11,7 ------| PIR    | GPIO17 = pin no. 11
# . GND (Ground)       :  6,6 ------| Sensor | GPIO4  = pin no. 7
#                                   `--------'

from gpiozero import MotionSensor
import time

print ("Starting motion sensor...")
pir = MotionSensor(4) # GPIO4 = pin no. 7
count = 0
while True:
    pir.wait_for_motion()
    count += 1
    print ("Motion Detected! " + str(count))
    # pir.wait_for_no_motion()
    # print ("Motion Stopped! ")
    time.sleep(1)
print ("GPIO.cleanup()")
GPIO.cleanup()


