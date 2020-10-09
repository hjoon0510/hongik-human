#!/usr/bin/env bash

echo -e "Running application with python3..."
## with camera (v4l2)
if [[ $1 == camera ]]; then
    time python3 social_distance_detector.py
## with video files (mp4)
else
    time python3 social_distance_detector.py \
    --input pedestrians.mp4  \
    --output output.avi \
    --display 0
fi
