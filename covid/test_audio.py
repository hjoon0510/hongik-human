# -*- coding: utf-8 -*-
# config.py 파일의 한글들을 읽기위해 위의 내용이 선언되어야 한다. 

# USAGE
# python social_distance_detector.py --input pedestrians.mp4
# python social_distance_detector.py --input pedestrians.mp4 --output output.avi

# import the necessary packages
from pyimagesearch import social_distancing_config as config
from pyimagesearch.detection import detect_people
from scipy.spatial import distance as dist
import numpy as np
import argparse
import imutils
import cv2
import os 
import time

violation=0

# play audio notice:start-----------------------------------------
if violation >= 50:
	# Note that mplayer is not good in RPI4. It results in "Audio device got stuck!" error.
	# audio out options of mplayer: -ao alsa , -ao pluse
	# cmd = "mplayer -ao pulse " + search_path + audio_file
	audio_file = "audio-notice/50.m4a" 
	cmd = "cvlc -A alsa,none --alsa-audio-device default " + audio_file + " vlc://quit"
	print ("[DEBUG] Succeeded, command: %s." % cmd)
	print ("[DEBUG] We found audio file.")
	print ("[DEBUG] Let's play the audio file:" , cmd)
	os.system(cmd)
	
elif violation >= 40:
	audio_file = "audio-notice/40.m4a" 
	cmd = "cvlc -A alsa,none --alsa-audio-device default " + audio_file + " vlc://quit"
	print ("[DEBUG] Succeeded, command: %s." % cmd)
	print ("[DEBUG] We found audio file.")
	print ("[DEBUG] Let's play the audio file:" , cmd)
	os.system(cmd)

elif violation >= 30:
	audio_file = "audio-notice/30.m4a" 
	cmd = "cvlc -A alsa,none --alsa-audio-device default " + audio_file + " vlc://quit"
	print ("[DEBUG] Succeeded, command: %s." % cmd)
	print ("[DEBUG] We found audio file.")
	print ("[DEBUG] Let's play the audio file:" , cmd)
	os.system(cmd)

elif violation >= 20:
	audio_file = "audio-notice/20.m4a" 
	cmd = "cvlc -A alsa,none --alsa-audio-device default " + audio_file + " vlc://quit"
	print ("[DEBUG] Succeeded, command: %s." % cmd)
	print ("[DEBUG] We found audio file.")
	print ("[DEBUG] Let's play the audio file:" , cmd)
	os.system(cmd)

elif violation >= 1:
	audio_file = "audio-notice/10.m4a" 
	cmd = "cvlc -A alsa,none --alsa-audio-device default " + audio_file + " vlc://quit"
	print ("[DEBUG] Succeeded, command: %s." % cmd)
	print ("[DEBUG] We found audio file.")
	print ("[DEBUG] Let's play the audio file:" , cmd)
	os.system(cmd)
else:   
	print ("[DEBUG] Now, people keep social distancing rule very well.")
	audio_file = "audio-notice/00.m4a" 
	cmd = "cvlc -A alsa,none --alsa-audio-device default " + audio_file + " vlc://quit"
	print ("[DEBUG] Succeeded, command: %s." % cmd)
	print ("[DEBUG] We found audio file.")
	print ("[DEBUG] Let's play the audio file:" , cmd)
	os.system(cmd)

	# play audio notice:start-----------------------------------------
