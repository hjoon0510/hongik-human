#!/usr/bin/env python3

# PIR Motion Sensor:                ,--------.
# . Power (+DC voltage):  2,2 ------|        |
# . Signal(Output)     : 11,7 ------| PIR    | GPIO17 = pin no. 11
# . GND (Ground)       :  6,6 ------| Sensor | GPIO4  = pin no. 7
#                                   `--------'
#  
import RPi.GPIO as GPIO
import time
import os


# for GPIO numbering, choose BCM
#GPIO.setmode(GPIO.BCM)
#GPIO.setwarnings(False)
#PIN_NO=4
#GPIO.setup(PIN_NO, GPIO.IN, pull_up_down = GPIO.PUD_DOWN) # Now your input wil be stable. Read output from PIR motion sensor

# for or , for pin numbering, choose BOARD
GPIO.setmode(GPIO.BOARD)
GPIO.setwarnings(False)
PIN_NO=7
#GPIO.setup(PIN_NO, GPIO.IN) # Read output from PIR motion sensor
GPIO.setup(PIN_NO, GPIO.IN, pull_up_down = GPIO.PUD_DOWN) # Now your input wil be stable. Read output from PIR motion sensor


try:
    cnt_detect=0
    while True:
        t = time.localtime()

        input_value=GPIO.input(PIN_NO) # Read a data from motion sensor
        if input_value== GPIO.HIGH:    # When output from motion sensor is LOW  (value:0)
            cnt_detect += 1
            print (t.tm_hour, ":", t.tm_min, ":", t.tm_sec, "  People detected:", cnt_detect)
            cmd_play="speaker-test -t wav -l 1"
            os.system(cmd_play)
        else:                         # When output from motion sensor is HIGH (value:1)
            print (t.tm_hour, ":", t.tm_min, ":", t.tm_sec, "  No people:", input_value)
        time.sleep(1.1)
except KeyboardInterrupt:
    GPIO.cleanup()  # clean up after yourself


